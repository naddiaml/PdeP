module Library where
import PdePreludat

{-

A modo de introducción a la materia, un paradigma de programación es una forma particular de pensar y resolver problemas de programación. 💡

Cada paradigma tiene sus propias herramientas, conceptos, formas de modelar problemas, formas de expresar soluciones.

-- ----------

→ (def) · La expresividad tiene que ver con qué tan entendible es el código en cuanto a la intención del problema a resolver.. A más expresivo es el código, mejor se entiende lo que sucede. Es de importancia tener este concepto en mente al momento de declarar de variables, funciones, métodos...


Ejemplo: una función llamada cantidadDeNumerosPares es más expresiva que una función llamada f, porque el nombre comunica mejor qué hace.

-- ----------

→ (def) · La declaratividad tiene que ver con ocultar detalles algorítmicos. Un código más declarativo se enfoca más en qué se quiere resolver y menos en cómo se resuelve paso a paso

La idea es evitar exponer detalles innecesarios de implementación cuando pueden abstraerse.

Ejemplo: usar una función esNumeroPar es más declarativo que escribir directamente la condición numero % 2 == 0 dentro de todo el algoritmo.

-- ----------

Un vez presentados los conceptos, podemos hablar de que la relación entre ambos es complementaria, y que aunque no existe una única solución “perfecta”. Lo importante es buscar soluciones cada vez más expresivas y declarativas.

-}


-- Planteemos:

-- Solución A: 

int d(int c[]) {
  int a = 0;
  for (int b = 0; c[b] != NULL; b++) {
    if (c[b] % 2 == 0) {
      a++;
    }
  }
  return a;
} -- Es poco expresiva porque los nombres no comunican intención (a, b, c , d). Además, muestra detalles algorítmicos como el recorrido manual y la condición para saber si un número es par.


-- Solución B:

int cantidadDeNumerosPares(int* unosNumeros) {
  int cantidadDePares = 0;
  for (int indice = 0;  != NULL; indice++) {
    if (unosNumeros[indice] % 2 == 0) {
      cantidadDePares++;
    }
  }
  return cantidadDePares;
} -- Es más expresiva que la solución A porque los nombres son más claros (cantidadDeNumerosPares, unosNumeros, cantidadDePares, indice). Sin embargo, sigue siendo poco declarativa porque todavía muestra el detalle de cómo verificar si un número es par.


-- Solución C:

int cantidadDeNumerosPares(int* unosNumeros) {
  int cantidadDePares = 0;
  for (int indice = 0;  != NULL; indice++) {
    if (esNumeroPar(unosNumeros[indice])) {
      cantidadDePares++;
    }
  }
  return cantidadDePares;
} -- Es tan expresiva como la B, pero más declarativa. La mejora principal es que delega la condición en una función: esNumeroPar(unosNumeros[indice]), que oculta el detalle de implementación de qué significa que un número sea par.

-- → En linea con esto, hay otros lenguajes que facilitan que nuestras soluciones sean más declarativas. Por ejemplo, este mismo problema se podría solucionar utilizando el lenguaje Haskell, haciendo: cantidadDeNumerosPares numeros = (length.filter even) numeros