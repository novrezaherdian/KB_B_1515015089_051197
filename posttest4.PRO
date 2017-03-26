/*****************************************************************************

    Copyright (c) 1984 - 2000 Prolog Development Center A/S

 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace %belum tau fungsinya
domains %digunakan untuk memberikan nama variabel atau argumen pada predicate agar namanya berubah dari default nya seperti yang kita inginkan
  name,sex,occupation,object,vice,substance = symbol %domain symbol 
  age=integer %domain integer

predicates %Kita harus mendeklarasikan predikat yang ada pada bagian Predicates dan mendefinisikannya dalam bagian Clauses. Jika tidak, tidak akan di kenali
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o) %ini predicates untuk data diri pelaku
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o) %predikat hubungan
  killed_with(name,object) - determ (i,o) %keterangan alat pembunahannya
  killed(name) - procedure (o) %yang terbunuh
  killer(name) - nondeterm (o) %yang membunuh
  motive(vice) - nondeterm (i) %alasan membunuh
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i) %kandungan atau jejak di tubuh pembunuh dan korban
  owns(name,object) - nondeterm (i,i) %tersangka dan barang yang dimiliki
  operates_identically(object,object) - nondeterm (o,i) %object spesifik alat yang di gunakan pembunuh dan yang di miliki tersangka
  owns_probably(name,object) - nondeterm (i,i) %tersangka dan alat yang berkaitan dengannya seperti pemain bola tentu punya sepatu bola walaupun tidak di jelaskan
  suspect(name) - nondeterm (i) %yang di curigai

/* * * Facts about the murder * * */
clauses %clauses berisi fakta dan aturan
  person(bert,55,m,carpenter). %bert seorang carpenter tentu saja memiliki tongkat
  person(allan,25,m,football_player).
  person(allan,25,m,butcher).
  person(john,25,m,pickpocket).

  had_affair(barbara,john). %barbara berhubungan dengan john
  had_affair(barbara,bert). %barbara berhubungan dengan bert
  had_affair(susan,john). %susan berhubungan dengan john

  killed_with(susan,club). %susan terbunuh dengan stick/pentungan
  killed(susan). %siti terbunuh/mati

  motive(money). %karena uang
  motive(jealousy). %karena cemburu
  motive(righteousness). %karena kebenaran

  smeared_in(bert,blood). %bert berlumur darah atau mengandung bekas darah pada tubuh atau pakaiannya
  smeared_in(susan,blood). %susan berlumur darah seperti bert
  smeared_in(allan,mud).
  smeared_in(john,chocolate).
  smeared_in(barbara,chocolate).

  owns(bert,wooden_leg). %bert memiliki kaki kayu atau jika kita lihat itu termasuk "club" atau tongkat
  owns(john,pistol).

/* * * Background knowledge * * */

  operates_identically(wooden_leg, club). %kaki kayu atau jika kita lihat itu termasuk "club"
  operates_identically(bar, club).
  operates_identically(pair_of_scissors, knife).
  operates_identically(football_boot, club).

  owns_probably(X,football_boot):- %hal yang dimiliki secara tidak tertulis di fakta
  person(X,_,_,football_player).
  owns_probably(X,pair_of_scissors):-
  person(X,_,_,hairdresser).
  owns_probably(X,Object):-
  owns(X,Object).

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-            %X dicurigai
  killed_with(susan,Weapon),      %Susan terbunuh dengan senjata dan
  operates_identically(Object,Weapon) ,   %Cara kerja benda tersebut mirip
  owns_probably(X,Object).      %Kemungkinan X memiliki benda 

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */


  suspect(X):- %X dicurigai
  motive(jealousy), %cemburu adalah motifnya dan
  person(X,_,m,_), %X adalah orang berjender m
  had_affair(susan,X). %susan berhubungan dengan X

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-          
  motive(jealousy), %cemburu
  person(X,_,f,_), %X adalah orang tersebut yang berjender f
  had_affair(X,Man), %X berhubungan dengan pria        
  had_affair(susan,Man). %susan berhubungan dengan pria

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-            
  motive(money), %motifnya karena uang
  person(X,_,_,pickpocket). %X adalah seorang pencopet

  killer(Killer):- %killer adalah pembunuh jika
  person(Killer,_,_,_), %orang tersebut adalah pembunuh jika dia orang
  killed(Killed), %jika ada orang terbunuh
  Killed <> Killer, /* It is not a suicide */ %pembunuh dan korban berbeda bukan 1 orang
  suspect(Killer), %pembunuh tersebut dicurigai 
  smeared_in(Killer,Goo), %pembunuh berlumur atau di temukan "Goo" pada tubuhnya
  smeared_in(Killed,Goo). %yang terbunuh berlumur "Goo"

goal %Goal adalah jawaban yang berisi pernyataan dan pertanyaan
  killer(X). %X adalah pembunuh
