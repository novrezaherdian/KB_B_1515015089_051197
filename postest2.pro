predicates
	nondeterm makanan(symbol,symbol)
	nondeterm kepribadian(symbol,symbol)
	nondeterm konsumtif(symbol,symbol)
	nondeterm ternak(symbol)
	nondeterm pet(symbol)

clauses
	makanan(kucing,omni).
	makanan(ayam,omni).
	makanan(anjing,karni).
	makanan(singa,karni).
	makanan(chita,karni).
	makanan(elang,karni).
	makanan(kambing,herbi).
	makanan(kuda,herbi).
	makanan(sapi,herbi).
	
	kepribadian(kucing,jinak).
	kepribadian(ayam,jinak).
	kepribadian(anjing,jinak).
	kepribadian(singa,liar).
	kepribadian(chita,liar).
	kepribadian(elang,liar).
	kepribadian(kambing,jinak).
	kepribadian(kuda,jinak).
	kepribadian(sapi,jinak).
	
	konsumtif(kucing,tidak).
	konsumtif(ayam,ya).
	konsumtif(anjing,tidak).
	konsumtif(singa,tidak).
	konsumtif(chita,tidak).
	konsumtif(elang,ya).
	konsumtif(kambing,ya).
	konsumtif(kuda,ya).
	konsumtif(sapi,ya).
	
	ternak(Hewan_ternak):-
	makanan(Hewan_ternak,herbi),kepribadian(Hewan_ternak,jinak),konsumtif(Hewan_ternak,ya);
	makanan(Hewan_ternak,omni),kepribadian(Hewan_ternak,jinak),konsumtif(Hewan_ternak,ya).
	
	pet(Pet):-
	kepribadian(Pet,jinak).

goal
	ternak(Hewan_ternak);pet(Hewan_peliharaan).