data Instr = Store1 Int | Store2 Int | StoreFlag Int | Cond1 | Cond2

eval1 enter1 enter2 flag = enter2 == 1 && flag == 1
eval1 enter1 enter2 flag = enter1 == 1 && flag == 2

exec e1 e2 flag s1 s2 [] = (s1, s2)
exec e1 e2 flag s1 s2 ((Store1 n):t) = exec n e2 flag s1 s2 t
exec e1 e2 flag s1 s2 ((Store2 n):t) = exec e1 n flag s1 s2 t
exec e1 e2 flag s1 s2 ((StoreFlag n):t) = exec e1 e2 n flag s1 s2 t
exec e1 e2 flag s1 s2 ((Cond1 n):t) = exec e1 e2 flag (eval e1 e2 flag) s2 t
exec e1 e2 flag s1 s2 ((Cond2 n):t) = exec e1 e2 flag (eval e1 e2 flag) s1 t

trazas x [] = [x]
trazas [] y = [y]
trazas (x@(h1:t1))(y@(h2:t2)) = map(h1:)(trazas t1 y) ++ (map(h2:)(trazas x c2))
examen b1 b2 = b1 /= b2
trz = map(++[Cond1, Cond2])(trazas proc1 proc2)
res = map (exec 0 0 0 False False) trz
map examen res
