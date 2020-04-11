
--no 1
select * from mahasiswa left join jurusan on mahasiswa.idjurusan = jurusan.idjurusan;

--no 2
update mahasiswa set tanggallahir = '2000-02-22' where nim = '010302001';
update mahasiswa set tanggallahir = '2000-03-22' where nim = '010302002';
update mahasiswa set tanggallahir = '2000-04-22' where nim = '010302003';

(strftime('%Y','now')- strftime('%Y',TANGGAL_LAHIR)) as UMUR


select nama, (strftime('%Y', 'now') - strftime('%Y', tanggallahir)) - (strftime('%m-%d', 'now') < strftime('%m-%d', tanggallahir)) as usia from mahasiswa;


select * from mahasiswa where ((strftime('%Y', 'now') - strftime('%Y', tanggallahir)) - (strftime('%m-%d', 'now') < strftime('%m-%d', tanggallahir)) < 22);


-- no 3

select mahasiswa.*, kontrak.nilai from mahasiswa left join kontrak on mahasiswa.nim = kontrak.nim
where kontrak.nilai = 'A' or kontrak.nilai = 'B';



-- no 4

select * from mahasiswa left join kontrak on mahasiswa.nim = kontrak.nim 
left join matakuliah on kontrak.matakuliah = matakuliah.idmk;



select mahasiswa.*, sum(matakuliah.sks) as totalsks 
from mahasiswa left join kontrak on mahasiswa.nim = kontrak.nim 
left join matakuliah on kontrak.matakuliah = matakuliah.idmk
group by mahasiswa.nim having totalsks >= 5;


-- no 5


select mahasiswa.*, matakuliah.nama as namamk 
from mahasiswa left join kontrak on mahasiswa.nim = kontrak.nim 
left join matakuliah on kontrak.matakuliah = matakuliah.idmk
where matakuliah.nama = 'Metode Numerik';


-- no 6


SELECT dosen.*, COUNT(DISTINCT(mahasiswa.nim)) 
from dosen LEFT JOIN kontrak on dosen.nip = kontrak.nipdosen 
left join mahasiswa ON mahasiswa.nim = kontrak.nim GROUP BY dosen.nip;



kalau tak pakai disctinct

SELECT dosen.*, COUNT(mahasiswa.nim)
from dosen LEFT JOIN kontrak on dosen.nip = kontrak.nipdosen 
left join mahasiswa ON mahasiswa.nim = kontrak.nim GROUP BY dosen.nip;



-- no 7

select *, 
(strftime('%Y', 'now') - strftime('%Y', tanggallahir)) - (strftime('%m-%d', 'now') < strftime('%m-%d', tanggallahir)) as usia
from mahasiswa order by usia;



select *, 
(strftime('%Y', 'now') - strftime('%Y', tanggallahir)) - (strftime('%m-%d', 'now') < strftime('%m-%d', tanggallahir)) as usia
from mahasiswa order by usia desc;


-- no 8

SELECT * FROM mahasiswa
LEFT JOIN kontrak ON mahasiswa.nim = kontrak.nim
LEFT JOIN matakuliah ON kontrak.matakuliah = matakuliah.idmk
LEFT JOIN dosen ON dosen.nip = kontrak.nipdosen
where kontrak.nilai = 'C' OR kontrak.nilai = 'E';





SELECT * FROM mahasiswa
LEFT JOIN kontrak ON mahasiswa.nim = kontrak.nim
LEFT JOIN matakuliah ON kontrak.matakuliah = matakuliah.idmk
where kontrak.nilai = 'C' OR kontrak.nilai = 'E';


SELECT * FROM mahasiswa
LEFT JOIN kontrak ON mahasiswa.nim = kontrak.nim
where kontrak.nilai = 'C' OR kontrak.nilai = 'E';














