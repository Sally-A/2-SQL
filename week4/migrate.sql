-- psql connect to week 4
\c week4

-- begin transaction
BEGIN;

-- add json column
ALTER TABLE moma_artists ADD COLUMN info JSONB;

-- using commn table expresson, select ID, rest of row as JSON
with temp AS (
    select m.id,
    (select row_to_json(_)::jsonb - 'id' - 'info' from (select m.*) as _) as json_info
    from moma_artists as m
) 
-- then match on ID's to fill in json column
update moma_artists m set info = (select json_info from temp where temp.id = m.id);

-- make info non-nullable
ALTER TABLE moma_artists ALTER COLUMN info SET NOT NULL;

-- drop original columns
ALTER TABLE moma_artists 
DROP COLUMN constituent_id, 
DROP COLUMN display_name, 
DROP COLUMN artist_bio, 
DROP COLUMN nationality, 
DROP COLUMN gender, 
DROP COLUMN begin_date, 
DROP COLUMN end_date, 
DROP COLUMN wiki_qid, 
DROP COLUMN ulan;

-- rename table
ALTER TABLE moma_artworks RENAME TO moma_works;

-- fix SERIAL sequence starting values
SELECT pg_catalog.setval(pg_get_serial_sequence('moma_artists', 'id'), MAX(id)) FROM moma_artists;
SELECT pg_catalog.setval(pg_get_serial_sequence('moma_works', 'id'), MAX(id)) FROM moma_works;


-- commit transaction
COMMIT;