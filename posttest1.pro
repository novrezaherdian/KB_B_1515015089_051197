predicates 
nondeterm mobil(symbol,symbol)
nondeterm warna(symbol,symbol)
nondeterm keren(symbol,symbol,symbol)

clauses
mobil(toyota,fortuner).
mobil(honda,jazz).
mobil(mazda,mx5).

warna(fortuner,putih).
warna(jazz,hitam).
warna(mx5,merah).

keren(Mobil_keren,Jenis,A):-
mobil(Mobil_keren,Jenis),
warna(Jenis,A).
  
goal
keren(Mobil_keren,Jenis,merah).

