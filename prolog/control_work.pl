#!/usr/local/bin/swipl -q -t runSolve -s

/*
В пяти домах разного цвета живут люди пяти национальностей. 
Они курят пять разных сортов сигарет, пьют пять разных напитков
и содержат пять разных видов животных.
	•	Англичанин живет в красном доме.
	•	Швед держит собак.
	•	Датчанин пьет чай.
	•	Зеленый дом слева от белого.
	•	Хозяин зеленого дома любить пить кофе.
	•	Любитель Рall Мall содержит птиц.
	•	Хозяин желтого дома курит Dunhill.
	•	В центральном доме предпочитают молоко.
	•	Норвежец живет в первом доме.
	•	Курящий Вlend живет по соседству с хозяином кошек.
	•	Хозяин лошадей живет рядом с тем, кто курит Dunhill.
	•	Любитель пива курит Вluemasters.
	•	Немец курит Рrince.
	•	Норвежец живет рядом с синим домом.
	•	Курящий Вlend живет по соседству с пьющим воду.
  Кто держит рыбок?
 */

neighbors(X, Y, List) :- nextto(X, Y, List) ; nextto(Y, X, List).

runSolve :-
	Houses = [_, _, _, _, _],

	/* •	Англичанин живет в красном доме. */
	member([englishMan, _, _, _, redHouse], Houses),

	/* 	•	Швед держит собак. */
	member([swedeMan, hasDog, _, _, _], Houses),

	/* 	•	Датчанин пьет чай. */
	member([daneMan, _, _, drinkTea, _], Houses),

	/* 	•	Зеленый дом слева от белого. */
	nextto([_, _, _, _, greenHouse], [_, _, _, _, whiteHouse], Houses),

	/* •	Хозяин зеленого дома любить пить кофе. */
	member([_, _, _, drinkCoffee, greenHouse], Houses),

	/* •	Любитель Рall Мall содержит птиц. */
	member([_, hasBird, smokePallMall, _, _], Houses),

	/* •	Хозяин желтого дома курит Dunhill. */
	member([_, _, smokeDunhill, _, yellowHouse], Houses),

	/* •	В центральном доме предпочитают молоко. */
	nth1(3, Houses, [_, _, _, drinkMilk, _]),

	/* •	Норвежец живет в первом доме. */
	nth1(1, Houses, [norwegianMan, _, _, _, _]),

	/* •	Курящий Вlend живет по соседству с хозяином кошек. */
	neighbors([_, _, smokeВlend, _, _], [_, hasCat, _, _, _], Houses),

	/* •	Хозяин лошадей живет рядом с тем, кто курит Dunhill. */
	member([_, hasHorse, _, _, blueHouse], Houses),

	/* •	Любитель пива курит Вluemasters. */
	member([_, _, smokeBluemasters, drinkBeer, _], Houses),

	/* •	Немец курит Рrince. */
	member([germanMan, _, smokeРrince, _, _], Houses),

	/* •	Норвежец живет рядом с синим домом. */
	neighbors([norwegianMan, _, _, _, _], [_, _ ,_, _, blueHouse], Houses),

	/* •	Курящий Вlend живет по соседству с пьющим воду. */
	neighbors([_, _, smokeВlend, _, _], [_, _, _, drinkWater, _], Houses),

	member([X, hasFish, _, _, _], Houses),

	print(Houses).
