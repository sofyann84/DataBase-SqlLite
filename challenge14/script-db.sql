CREATE TABLE jurusan ( 
    idjurusan TEXT PRIMARY KEY NOT NULL,
    namajurusan VARCHAR(100) NOT NULL
);
CREATE TABLE mahasiswa ( 
    nim TEXT PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL,
    alamat TEXT,
    idjurusan TEXT, tanggallahir date,
    FOREIGN KEY(idjurusan) REFERENCES jurusan(idjurusan)
);
CREATE TABLE matakuliah(
    idmk TEXT PRIMARY KEY NOT NULL,
    nama TEXT NOT NULL,
    sks INT NOT NULL
);
CREATE TABLE dosen(
    nip TEXT PRIMARY KEY NOT NULL,
    nama VARCHAR(100) NOT NULL
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE kontrak( 
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nim TEXT NOT NULL,
    nipdosen TEXT NOT NULL,
    matakuliah TEXT NOT NULL,
    nilai TEXT,
    FOREIGN KEY(nim) REFERENCES mahasiswa(nim),
    FOREIGN KEY(nipdosen) REFERENCES dosen(nip),
    FOREIGN KEY(matakuliah) REFERENCES matakuliah(idmk)
);
