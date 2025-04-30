# Manual de Usuario - Analizador Léxico para Lenguaje AC

# A01641147 - Carlos Alberto Veryan Peña

## Descripción

Este proyecto implementa un analizador léxico para el lenguaje AC. El analizador léxico identifica y clasifica los elementos del código fuente AC en tokens predefinidos como palabras clave, identificadores, operadores, etc.

## Requisitos del Sistema

- Sistema operativo Linux (o macOS)
- Compilador GCC (versión 4.8 o superior)
- Flex (analizador léxico)
- Python 3 (para generar código aleatorio)

## Instalación

1. Clone o descargue este repositorio en su máquina local.
2. Navegue hasta el directorio del proyecto.
3. Compile el analizador usando el comando `make`.

```
$ make
```

## Uso

### Ejecución del Analizador Léxico

Para analizar un archivo AC:

```
$ ./lex_analaizer archivo.ac
```

Donde `archivo.ac` es el archivo que contiene el código AC a analizar.

### Generación de Código AC Aleatorio

El proyecto incluye un generador de código AC aleatorio que puede ser utilizado para pruebas:

```
$ python3 code_generator.py > ejemplo.ac
```

Este comando generará un archivo `ejemplo.ac` con código AC aleatorio.

### Ejemplo Rápido

Puede utilizar el objetivo `test` en el Makefile para generar código aleatorio y analizarlo:

```
$ make test
```

## Tokens Reconocidos

El analizador léxico identifica los siguientes tokens:

- `COMMENT` - Comentarios (líneas que comienzan con `//`)
- `floatdcl id` - Declaración de variables de punto flotante (líneas que comienzan con `f`)
- `intdcl id` - Declaración de variables enteras (líneas que comienzan con `i`)
- `print id` - Instrucciones de impresión (líneas que comienzan con `p`)
- `id` - Identificadores (nombres de variables)
- `assign` - Operador de asignación (`=`)
- `plus` - Operador de suma (`+`)
- `minus` - Operador de resta (`-`)
- `times` - Operador de multiplicación (`*`)
- `div` - Operador de división (`/`)
- `inum` - Números enteros
- `fnum` - Números de punto flotante

## Ejemplo de Código AC

```
// comentario básico

//float b
f b

// integer a
i a

// a = 5
a = 5

// b = a + 3.2
b = a + 3.2

//print 8.5
p b
```

## Ejemplo de Salida del Analizador

Para el código anterior, la salida será:

```
COMMENT

COMMENT
floatdcl id

COMMENT
intdcl id

COMMENT
id assign inum

COMMENT
id assign id plus fnum

COMMENT
print id
```

## Limpieza

Para limpiar los archivos generados:

```
$ make clean
```
