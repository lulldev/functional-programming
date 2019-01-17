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

man(еnglishman).
man(swede).
man(dane).
man(norwegian).
man(german).

house(red).
house(green).
house(yellow).
house(blue).
house(white).

drink(tea).
drink(coffee).
drink(milk).
drink(beer).
drink(water).

pet(dog).
pet(bird).
pet(cat).
pet(horse).
pet(fish).

cigarettes(pallmall).
cigarettes(dunhill).
cigarettes(prince).
cigarettes(bluemasters).
cigarettes(blend).


fishOwner :-
    Houses = [_,_,_,_,_],