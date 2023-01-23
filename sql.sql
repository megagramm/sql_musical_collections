create table if not exists genres (
	genres_id SERIAL primary key,
	name VARCHAR(60) not null
);

create table if not exists artists (
	artists_id SERIAL primary key,
	name VARCHAR(60) not null
);

create table if not exists artists_genres (
	artists_id INTEGER references artists(artists_id),
	genres_id INTEGER references genres(genres_id),
	constraint ag primary key (artists_id, genres_id)
);

create table if not exists albums (
	albums_id SERIAL primary key,
	name VARCHAR(255) not null,
	year INTEGER not null CHECK(year > 0)
);

create table if not exists artists_albums (
	artists_id INTEGER references artists(artists_id),
	albums_id INTEGER references albums(albums_id),
	constraint aa primary key (artists_id, albums_id)
);

create table if not exists tracks (
	tracks_id SERIAL primary key,
	albums_id INTEGER references albums (albums_id),
	name VARCHAR(255) not null,
	duration NUMERIC(4,2) CHECK(duration > 0)
);

create table if not exists collections (
	collections_id SERIAL primary key,
	name VARCHAR(255) not null,
	year INTEGER not null check (year > 0)
);

create table if not exists tracks_collections (
	tracks_id INTEGER references tracks (tracks_id),
	collections_id INTEGER references collections (collections_id),
	constraint tc primary key (tracks_id, collections_id)
);
