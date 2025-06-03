-- Group 6 



-- Create the Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username NVARCHAR2(255),
    Email NVARCHAR2(255),
    DateOfBirth DATE
)TABLESPACE USERS_TABLESPACE;
	
-- Create the Tracks table
CREATE TABLE Tracks (
    TrackID INT PRIMARY KEY,
    TrackName NVARCHAR2(255),
    Artist NVARCHAR2(255),
    Album NVARCHAR2(255),
    Genre NVARCHAR2(255)
);

-- Create the Playlists table
CREATE TABLE Playlists (
    PlaylistID INT PRIMARY KEY,
    PlaylistName NVARCHAR2(255),
    OwnerID INT,
    TrackID INT,
    PublicOrPrivate NVARCHAR2(50),
    NumberOfTracks INT,
    FOREIGN KEY (OwnerID) REFERENCES Users (UserID),
    FOREIGN KEY (TrackID) REFERENCES Tracks (TrackID)
);

-- Create the Artists table
CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    ArtistName NVARCHAR2(255),
    Genre NVARCHAR2(255),
    Followers INT
);

-- Create the Albums table
CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    AlbumName NVARCHAR2(255),
    TotalTracks INT,
    ReleaseDate DATE,
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artists (ArtistID)
);

-- Create the Listening History table
CREATE TABLE ListeningHistory (
    HistoryID INT PRIMARY KEY,
    UserID INT,
    TrackID INT,
    History CLOB,
    MostPlayedSongs CLOB,
    LikedSongs CLOB,
    Duration DATE,
    DateTime DATE,
    FOREIGN KEY (UserID) REFERENCES Users (UserID),
    FOREIGN KEY (TrackID) REFERENCES Tracks (TrackID)
);






-- History Tables

CREATE TABLE UsersHistory (
    HistoryID INT PRIMARY KEY,
    UserID INT,
    Username NVARCHAR2(255),
    Email NVARCHAR2(255),
    DateOfBirth DATE,
    OperationType NVARCHAR2(10), -- 'INSERT', 'UPDATE', 'DELETE'
    OperationTimestamp TIMESTAMP
);

CREATE TABLE TracksHistory (
    HistoryID INT PRIMARY KEY,
    TrackID INT,
    TrackName NVARCHAR2(255),
    Artist NVARCHAR2(255),
    Album NVARCHAR2(255),
    Genre NVARCHAR2(255),
    OperationType NVARCHAR2(10),
    OperationTimestamp TIMESTAMP
);

CREATE TABLE PlaylistsHistory (
    HistoryID INT PRIMARY KEY,
    PlaylistID INT,
    PlaylistName NVARCHAR2(255),
    OwnerID INT,
    TrackID INT,
    PublicOrPrivate NVARCHAR2(50),
    NumberOfTracks INT,
    OperationType NVARCHAR2(10),
    OperationTimestamp TIMESTAMP
);




-- Inserting Data


-- Insert data into the Users table
INSERT INTO Users (UserID, Username, Email, DateOfBirth) VALUES (1, 'JohnDoe', 'johndoe@example.com', TO_DATE('1990-01-01', 'YYYY-MM-DD'));
INSERT INTO Users (UserID, Username, Email, DateOfBirth) VALUES (2, 'JaneSmith', 'jane.smith@example.com', TO_DATE('1985-05-20', 'YYYY-MM-DD'));
INSERT INTO Users (UserID, Username, Email, DateOfBirth) VALUES (3, 'BobJohnson', 'bob.johnson@example.com', TO_DATE('1995-08-08', 'YYYY-MM-DD'));
INSERT INTO Users (UserID, Username, Email, DateOfBirth) VALUES (4, 'AliceWilliams', 'alice.williams@example.com', TO_DATE('1980-12-03', 'YYYY-MM-DD'));
INSERT INTO Users (UserID, Username, Email, DateOfBirth) VALUES (5, 'CharlieBrown', 'charlie.brown@example.com', TO_DATE('1992-04-25', 'YYYY-MM-DD'));

-- Insert data into Tracks table
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (1, 'Song 1', 'Artist 1', 'Album 1', 'Rock');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (2, 'Song 2', 'Artist 2', 'Album 2', 'Pop');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (3, 'Song 3', 'Artist 3', 'Album 3', 'Hip Hop');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (4, 'Song 4', 'Artist 4', 'Album 4', 'Rock');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (5, 'Song 5', 'Artist 2', 'Album 2', 'Pop');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (6, 'Song 6', 'Artist 3', 'Album 3', 'Hip Hop');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (7, 'Song 7', 'Artist 1', 'Album 1', 'Rock');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (8, 'Song 8', 'Artist 2', 'Album 2', 'Pop');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (9, 'Song 9', 'Artist 3', 'Album 3', 'Hip Hop');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (10, 'Song 10', 'Artist 1', 'Album 1', 'Rock');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (11, 'Song 11', 'Artist 2', 'Album 2', 'Pop');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (12, 'Song 12', 'Artist 3', 'Album 3', 'Hip Hop');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (13, 'Song 13', 'Artist 1', 'Album 1', 'Rock');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (14, 'Song 14', 'Artist 2', 'Album 2', 'Pop');
INSERT INTO Tracks (TrackID, TrackName, Artist, Album, Genre) VALUES (15, 'Song 15', 'Artist 3', 'Album 3', 'Hip Hop');

-- Insert data into Playlists table
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (1, 'My Playlist', 1, 1, 'Private', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (2, 'Top Hits', 2, 2, 'Public', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (3, 'Favorite Songs', 3, 3, 'Private', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (4, 'Rock Classics', 1, 4, 'Public', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (5, 'Chill Vibes', 2, 5, 'Private', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (6, 'Hip Hop Party', 3, 6, 'Public', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (7, 'Mixtape', 1, 7, 'Private', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (8, 'Pop Extravaganza', 2, 8, 'Public', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (9, 'Feel Good Hits', 3, 9, 'Private', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (10, 'Road Trip Jams', 1, 10, 'Public', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (11, 'Throwback Thursday', 2, 11, 'Private', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (12, 'Dance Party', 3, 12, 'Public', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (13, 'Acoustic Melodies', 1, 13, 'Private', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (14, 'Indie Vibes', 2, 14, 'Public', 1);
INSERT INTO Playlists (PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks) VALUES (15, 'R111 Soul', 3, 15, 'Private', 1);








-- Views
CREATE VIEW UsersView AS
SELECT 
    UserID,
    Username,
    Email,
    DateOfBirth
FROM 
    Users;

CREATE VIEW TracksView AS
SELECT 
    TrackID,
    TrackName,
    Artist,
    Album,
    Genre
FROM 
    Tracks;
CREATE VIEW PlaylistsView AS
SELECT 
    PlaylistID,
    PlaylistName,
    OwnerID,
    TrackID,
    PublicOrPrivate,
    NumberOfTracks
FROM 
    Playlists;










-- Sequences

CREATE SEQUENCE seq_user
    INCREMENT BY 1
    START WITH 100
    NOCYCLE
    NOCACHE;

CREATE SEQUENCE seq_track
    INCREMENT BY 1
    START WITH 100
    NOCYCLE
    NOCACHE;

CREATE SEQUENCE seq_playlist
    INCREMENT BY 1
    START WITH 100
    NOCYCLE
    NOCACHE;






-- Triggers

CREATE OR REPLACE TRIGGER trg_user
AFTER INSERT OR UPDATE OR DELETE ON Users
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO UsersHistory (HistoryID, UserID, Username, Email, DateOfBirth, OperationType, OperationTimestamp)
        VALUES (seq_user.nextval, :NEW.UserID, :NEW.Username, :NEW.Email, :NEW.DateOfBirth, 'INSERT', CURRENT_TIMESTAMP);
    ELSIF UPDATING THEN
        INSERT INTO UsersHistory (HistoryID, UserID, Username, Email, DateOfBirth, OperationType, OperationTimestamp)
        VALUES (seq_user.nextval, :NEW.UserID, :NEW.Username, :NEW.Email, :NEW.DateOfBirth, 'UPDATE', CURRENT_TIMESTAMP);
    ELSIF DELETING THEN
        INSERT INTO UsersHistory (HistoryID, UserID, Username, Email, DateOfBirth, OperationType, OperationTimestamp)
        VALUES (seq_user.nextval, :OLD.UserID, :OLD.Username, :OLD.Email, :OLD.DateOfBirth, 'DELETE', CURRENT_TIMESTAMP);
    END IF;
END;


CREATE OR REPLACE TRIGGER trg_track
AFTER INSERT OR UPDATE OR DELETE ON Tracks
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO TracksHistory (HistoryID, TrackID, TrackName, Artist, Album, Genre, OperationType, OperationTimestamp)
        VALUES (seq_track.nextval, :NEW.TrackID, :NEW.TrackName, :NEW.Artist, :NEW.Album, :NEW.Genre, 'INSERT', CURRENT_TIMESTAMP);
    ELSIF UPDATING THEN
        INSERT INTO TracksHistory (HistoryID, TrackID, TrackName, Artist, Album, Genre, OperationType, OperationTimestamp)
        VALUES (seq_track.nextval, :NEW.TrackID, :NEW.TrackName, :NEW.Artist, :NEW.Album, :NEW.Genre, 'UPDATE', CURRENT_TIMESTAMP);
    ELSIF DELETING THEN
        INSERT INTO TracksHistory (HistoryID, TrackID, TrackName, Artist, Album, Genre, OperationType, OperationTimestamp)
        VALUES (seq_track.nextval, :OLD.TrackID, :OLD.TrackName, :OLD.Artist, :OLD.Album, :OLD.Genre, 'DELETE', CURRENT_TIMESTAMP);
    END IF;
END;


CREATE OR REPLACE TRIGGER trg_playlist
AFTER INSERT OR UPDATE OR DELETE ON Playlists
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO PlaylistsHistory (HistoryID, PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks, OperationType, OperationTimestamp)
        VALUES (seq_playlist.nextval, :NEW.PlaylistID, :NEW.PlaylistName, :NEW.OwnerID, :NEW.TrackID, :NEW.PublicOrPrivate, :NEW.NumberOfTracks, 'INSERT', CURRENT_TIMESTAMP);
    ELSIF UPDATING THEN
        INSERT INTO PlaylistsHistory (HistoryID, PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks, OperationType, OperationTimestamp)
        VALUES (seq_playlist.nextval, :NEW.PlaylistID, :NEW.PlaylistName, :NEW.OwnerID, :NEW.TrackID, :NEW.PublicOrPrivate, :NEW.NumberOfTracks, 'UPDATE', CURRENT_TIMESTAMP);
    ELSIF DELETING THEN
        INSERT INTO PlaylistsHistory (HistoryID, PlaylistID, PlaylistName, OwnerID, TrackID, PublicOrPrivate, NumberOfTracks, OperationType, OperationTimestamp)
        VALUES (seq_playlist.nextval, :OLD.PlaylistID, :OLD.PlaylistName, :OLD.OwnerID, :OLD.TrackID, :OLD.PublicOrPrivate, :OLD.NumberOfTracks, 'DELETE', CURRENT_TIMESTAMP);
    END IF;
END;
