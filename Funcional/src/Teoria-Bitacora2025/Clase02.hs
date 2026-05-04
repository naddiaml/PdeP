module Library where
import PdePreludat

{-

Recordando el concepto matemático de función, podemos pensarla como una relación entre un dominio y una imagen, donde a cada entrada le corresponde una salida, y esa salida es única. Esta misma idea se mantiene en Haskell: una función toma un input, aplica una transformación y produce un output, que siempre depende del valor recibido.

Tener presente este concepto nos permite empezar a introducir el paradigma funcional, el primer paradigma trabajado en la materia. Este paradigma se centra principalmente en el uso de funciones como herramienta para construir soluciones.
-}

-- Primeras funciones en Haskell:

-- La función doble recibe un número entero y devuelve otro entero.
doble :: Number -> Number
doble numero = numero * 2

-- La función siguiente recibe un número entero y devuelve su sucesor.
siguiente :: Number -> Number
siguiente numero = numero + 1

-- La función sumaDe4Numeros recibe cuatro enteros y devuelve un entero.
sumaDe4Numeros :: Number -> Number -> Number -> Number -> Number
sumaDe4Numeros primerNumero segundoNumero tercerNumero cuartoNumero = primerNumero + segundoNumero + tercerNumero + cuartoNumero

-- ----------

-- Tipos y declaración de funciones
-- Para empezar a hablar de tipo de funciones debemos que saber que en Haskell su tipo no es únicamente el tipo de su retorno, sino que este se compone por: el tipo de sus valores de entrada y el tipo de su valor de salida. Para declararlas: nombreDeLaFuncion :: Parametro1 -> Parametro2 -> Parametro3 -> ... -> Parametro n -> Salida

-- ----------

-- Composición de funciones
-- La composición permite combinar funciones para construir una nueva función. Para declarar una función compuesta, lo hacemos igual que en metemática, escribiendo f.g, que significa: primero f, después g. Podemos asignarle un nombre a las composiciones para reutilizarlas.

-- Como en Haskell no se pisan valores ni se modifican estados (revisar más abajo el concepto de inmutabilidad), la composición se vuelve muy importante, ya que permite encadenar transformaciones sin necesidad de variables intermedias mutables. En lugar de hacer pasos imperativos, esto ayuda a escribir soluciones más declarativas.

-- Un ejemplo de commposición de funciones: 

(doble.siguiente) -- Si paso en terminal: (doble.siguiente) 2, imprime 6 → Primero se aplica la función de la derecha (siguiente 2), que da como resultado 3. Ahora se aplica la función de la izquierda (doble 3), que da como resultado 6.

-- ❗Importante: Para poder componer dos funciones, el resultado de la función de la derecha tiene que ser válido como entrada de la función de la izquierda. Es decir: la imagen de la función de la derecha debe estar incluida en el dominio de la función de la izquierda. | En el ejemplo de (doble.siguiente), tenemos: siguiente :: Int -> Int,  y: doble :: Int -> Int, de modo que siguiente devuelve un Int, y doble recibe un Int.


dobleDelSiguiente unNumero = (doble . siguiente) unNumero -- Asignamos a la función dobleDelSiguiente una nueva función que calcula el siguiente de un número y el doble de ese resultado. 

dobleDelSiguiente = doble . siguiente -- → Composición con notación point free.

-- ----------

-- Inmutabilidad
-- En Haskell, los valores no mutan, de modo que, si una función opera sobre un valor, no se modifica su valor original. Por ejemplo, dado el siguiente código:

frecuenciaCardiacaPromedio = 80
hacerActividadFisica unaFrecuencia = unaFrecuencia + 50
tieneTaquicardia unaFrecuencia = unaFrecuencia >= 180

-- > frecuenciaCardiacaPromedio
-- > 80
-- > hacerActividadFisica frecuenciaCardiacaPromedio
-- > 130
-- > frecuenciaCardiacaPromedio
-- > 80  →  Aunque se haya usado frecuenciaCardiacaPromedio como argumento de una función, su valor sigue siendo 80.

-- Como los valores en Haskell no cambian, nos permite trabajar con transparencia referencial, lo que significa que una expresión puede reemplazarse por su valor sin cambiar el comportamiento del programa. Por ejemplo, si:

frecuenciaCardiacaPromedio = 80 -- entonces, usar
hacerActividadFisica frecuenciaCardiacaPromedio -- es equivalente a usar:
hacerActividadFisica 80

-- ❗Importante: En Haskell, frecuenciaCardiacaPromedio no es una variable mutable, sino un 'alias' para el valor 80.

-- ----------

{- Es la precedencia lo que define qué operaciones se resuelven primero en una expresión. En Haskell: 
A mayor número, mayor precedencia.

Precedencia	Operador
11	()
10	Aplicación prefija
9	.
8	^
7	*, /
6	+, -
5	:
4	==, /=, <, <=, >, >=
3	&&
2	||
1	$

-}


-- ----------

-- Una Type Class es una familia de tipos que comparten un conjunto de operaciones, es como una especie de contrato: "Por pertenecer a esta familia, este tipo tiene que saber responder a ciertas operaciones". Por ejemplo, los tipos que pertenecen a Num saben operar con: suma (+), resta (-), multiplicación (*), etc.

-- De este modo, la función suma también podría escribirse así: 
suma :: Num a => a -> a -> a
suma unNumero otroNumero = unNumero + otroNumero -- lo que significa: para cualquier tipos a, siempre que a pertenezca a la familia Num, la función recibe dos valores de tipo a y devuelve otro del mismo tipo, de modo que puedo resolver: 

-- > suma 2 3
-- > suma 2.5 3.5

-- Pero no se puede sumar un Int con un Float directamente, porque en toda la firma a representa el mismo tipo.