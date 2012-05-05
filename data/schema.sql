CREATE TABLE posts  (
    id INTEGER PRIMARY KEY ASC,
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP, /* Created timestamp */
    language TEXT,                          /* Language (if detected) */
    title TEXT,                             /* Title/Filename */
    code BLOB NOT NULL,                     /* Code */
    html BLOB                               /* HTML version of Code */
);
