from flask import Blueprint, render_template, current_app, jsonify, abort, request
from flask import current_app as app

from ..models import User, db, Tweet, likes_table
import hashlib
import secrets
import sqlalchemy


def scramble(password: str):
    """Hash and salt the given password"""
    salt = secrets.token_hex(16)
    return hashlib.sha512((password + salt).encode('utf-8')).hexdigest()


bp = Blueprint('users', __name__, url_prefix='/users')


@bp.route('', methods=['GET'])
def index():
    users = User.query.all()
    users = [u.serialize() for u in users]
    return jsonify(users)


@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    u = User.query.get_or_404(id)
    return jsonify(u.serialize())


@bp.route('', methods=['POST'])
def create():
    if 'username' not in request.json or 'password' not in request.json:
        return abort(400)

    if len(request.json['username']) < 3 or len(request.json['password']) < 8:
        return abort(400)

    u = User(
        username=request.json['username'],
        password=scramble(request.json['password'])
    )

    db.session.add(u)
    db.session.commit()

    return jsonify(u.serialize())


@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    u = User.query.get_or_404(id)

    try:
        db.session.delete(u)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)


@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    u = User.query.get_or_404(id)
    if 'username' in request.json:
        u.username = request.json['username']
    if 'password' in request.json:
        u.password = request.json['password']
    db.session.commit()
    return jsonify(u.serialize())


@bp.route('/<int:id>/liked_tweets', methods=['GET'])
def liked_tweets(id: int):
    u = User.query.get_or_404(id)
    result = []
    for t in u.liked_tweets:
        result.append(t.serialize())
    return jsonify(result) 



@bp.route('/<int:id>/likes', methods=['POST'])
def like(id: int):
    if 'tweet_id' not in request.json:
        return abort(400)

    tweet_id = request.json['tweet_id']

    # user and tweets?
    User.query.get_or_404(id)
    Tweet.query.get_or_404(tweet_id)

    try:
        stmt = sqlalchemy.insert(likes_table).values(
            user_id=id, tweet_id=tweet_id)
        db.session.execute(stmt)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)


@bp.route('/<int:user_id>/likes/<int:tweet_id>', methods=['DELETE'])
def unlike(user_id: int, tweet_id: int):
    # user and tweets?
    User.query.get_or_404(user_id)
    Tweet.query.get_or_404(tweet_id)

    try:
        stmt = sqlalchemy.delete(likes_table).where(
            likes_table.c.user_id == user_id,
            likes_table.c.tweet_id == tweet_id
        )
        db.session.execute(stmt)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)
