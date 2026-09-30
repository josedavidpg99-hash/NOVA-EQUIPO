# NOVA Equipo — activar la base de datos compartida (5 minutos)

Sin este paso, la app funciona en modo demostración: cada teléfono guarda
sus propios datos y David no puede ver los referidos del equipo.

## Paso 1 — Crear el proyecto (gratis)

1. Entra a https://supabase.com y crea una cuenta (con Google).
2. "New project" → nombre: `nova-equipo` → espera 1-2 minutos.

## Paso 2 — Crear las tablas

1. En el menú izquierdo: **SQL Editor** → "New query".
2. Abre el archivo `supabase/schema.sql` de esta carpeta, copia todo y pégalo.
3. Pulsa **Run**. Debe decir "Success".

## Paso 3 — Copiar las claves

1. Ve a **Project Settings** (engranaje) → **API**.
2. Copia la **Project URL** y la **anon public key**.

## Paso 4 — Pegarlas en la app

1. Abre `index.html` y busca `SUPABASE_URL`.
2. Pega la URL y la clave entre las comillas:
   `SUPABASE_URL: "https://xxxx.supabase.co",`
   `SUPABASE_KEY: "eyJhbGciOi..."`
3. Sube el archivo al repositorio (o pásamelo y lo subo yo).

Listo: desde ese momento, todo lo que suba cada agente lo ve David
en tiempo real en su teléfono.
