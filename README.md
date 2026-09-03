# 🧠 CerebroLocal

Juego de trivia interactivo potenciado por Inteligencia Artificial (con soporte para Google Gemini y modelos locales mediante Ollama), diseñado para partidas individuales o en grupo con amigos.

## 🚀 Características
- **Modo Solitario y Multijugador Local**: Juega solo o por turnos con amigos en una misma pantalla.
- **Modo Anfitrión con PIN**: Crea salas para proyectar en pantalla grande y que otros se unan con un código de 4 dígitos.
- **Banco de +150 Preguntas Curadas**: 154 preguntas divididas en 11 categorías oficiales listas para jugar sin conexión.
- **Generador de Preguntas con IA**:
  - Compatible con Google Gemini API (`GEMINI_API_KEY`).
  - Compatible con Ollama local (`llama3.2:1b`).
- **Seguridad Antifraude**: Verificación de respuestas 100% en el servidor (sin fugas en el cliente).

## 🛠️ Requisitos e Instalación
- Ruby 3.3+ y Rails 8.1+
- PostgreSQL

```bash
# Instalar dependencias
bundle install

# Configurar base de datos y cargar preguntas iniciales
bin/rails db:create db:migrate db:seed

# Iniciar servidor
bin/rails server -b 0.0.0.0
```

## Despliegue gratuito

El archivo `render.yaml` prepara el servicio web para Render. Para mantener el
despliegue en el nivel gratuito, crea la base PostgreSQL en Neon o Supabase y
configura su URL como `DATABASE_URL` en Render.

En Render, conecta este repositorio y define estas variables secretas:

- `RAILS_MASTER_KEY`: contenido de `config/master.key`.
- `DATABASE_URL`: URL de PostgreSQL.
- `RAILS_ALLOWED_HOSTS`: dominio de Render, por ejemplo `cerebrolocal.onrender.com`.
- `GEMINI_API_KEY`: opcional; sin ella se usan las preguntas precargadas.

Render ejecutará las migraciones, cargará las preguntas iniciales y publicará
la aplicación con una URL `onrender.com`. Ollama no funciona en `localhost` en
un despliegue remoto; usa Gemini o un servidor Ollama accesible públicamente.

