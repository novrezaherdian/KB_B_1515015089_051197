DOMAINS 
merk,jenis,type,seri,asal,kategori=symbol
harga,hp,topspeed=integer
Predicates
nondeterm car(merk,jenis,type,asal,harga,hp,topspeed)
nondeterm mewah(merk,jenis,type)
nondeterm sport(merk,jenis,type)
nondeterm sportmewah(merk,jenis,type)
Clauses
car(lamborgini,veneno,reguler,italy,11000,850,335).
car(lamborgini,veneno,premium,italy,11200,857,347).
car(lamborgini,galargo,reguler,italy,1800,600,262).
car(lamborgini,galargo,premium,italy,1810,603,269).
car(lamborgini,murchelago,reguler,italy,3800,700,270).
car(lamborgini,murchelago,premium,italy,4000,708,280).
car(nisan,skyline,reguler,jepang,1200,450,265).
car(nisan,skyline,premium,jepang,1400,485,272).
car(nisan,silvia,reguler,jepang,750,289,215).
car(nisan,silvia,premium,jepang,800,305,222).
car(jeep,"wrangler rubicoon",reguler,amerika,500,200,175).
car(jeep,"wrangler rubicoon",premium,amerika,1200,240,185).

mewah(Merk,Jenis,Type):-
	car(Merk,Jenis,Type,_,A,_,_),A>1000.
sport(Merk,Jenis,Type):-
	car(Merk,Jenis,Type,_,_,A,_),A>299;
	car(Merk,Jenis,Type,_,_,_,B),B>199.
sportmewah(Merk,Jenis,Type):-
	mewah(Merk,Jenis,Type),sport(Merk,Jenis,Type).
Goal
sportmewah(MobilSportDanMewah,Jenis,Type).