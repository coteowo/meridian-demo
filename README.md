# Meridian — Demo DeFi en Ruby on Rails

Aplicación web de demostración de un **protocolo DeFi ficticio** ("Meridian"),
construida con **Ruby on Rails** como prueba para evaluar el stack frente a Next.js.

Incluye una landing page estilo fintech (tema oscuro + claro), páginas de
**login / registro** reutilizando un mismo módulo, autenticación por **sesión**
y un **panel protegido**.

> ⚠️ **Proyecto de prueba, sin valor real ni fines comerciales.** Las credenciales
> están escritas en el código a propósito (ver más abajo). No usar en producción.

---

## 🧱 Stack

| Componente | Versión |
|---|---|
| Ruby | 3.4.1 |
| Rails | 8.1.3 |
| Base de datos | PostgreSQL 17 |
| Frontend | Vistas ERB + CSS (sin build, con `importmap`) |
| Servidor | Puma |

---

## ✅ Requisitos previos (macOS)

Necesitas **Homebrew**, un **gestor de versiones de Ruby** (rbenv), **Ruby 3.4.1**
y **PostgreSQL 17**. Si ya los tienes, salta a [Instalación](#-instalación).

```bash
# 1. rbenv (gestor de versiones de Ruby)
brew install rbenv ruby-build
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
source ~/.zshrc

# 2. Ruby 3.4.1
rbenv install 3.4.1

# 3. PostgreSQL 17
brew install postgresql@17
brew services start postgresql@17
```

> 💡 Si `ruby -v` sigue mostrando una versión vieja tras instalar, **abre una
> terminal nueva** (rbenv necesita recargar el shell).

---

## 🚀 Instalación

```bash
# 1. Clonar el repositorio
git clone https://github.com/coteowo/meridian-demo.git
cd meridian-demo

# 2. Ruby: el archivo .ruby-version selecciona 3.4.1 automáticamente.
#    Instálalo si aún no lo tienes:
rbenv install --skip-existing

# 3. Instalar Bundler y las dependencias (gemas)
gem install bundler
bundle install

# 4. Asegúrate de que PostgreSQL esté corriendo
brew services start postgresql@17

# 5. Crear y preparar la base de datos
bin/rails db:prepare
```

---

## ▶️ Cómo ejecutar

```bash
bin/rails server
```

Abre 👉 **http://localhost:3000**

Para detener el servidor: `Ctrl + C`.

---

## 🔐 Credenciales de demostración

El login funciona con un usuario fijo (definido en `app/controllers/auth_controller.rb`):

| Campo | Valor |
|---|---|
| Usuario | `usuario` |
| Contraseña | `123` |

Al iniciar sesión correctamente, se crea una sesión (cookie) y redirige a `/panel`.

---

## 🗺️ Rutas / páginas

| Ruta | Método | Descripción |
|---|---|---|
| `/` | GET | Homepage — landing del protocolo DeFi |
| `/login` | GET | Muestra el formulario de inicio de sesión |
| `/login` | POST | Procesa el login (valida credenciales) |
| `/register` | GET | Formulario de registro (cosmético, no conectado) |
| `/panel` | GET | Panel del usuario — **protegido**, requiere sesión |
| `/logout` | GET | Cierra la sesión y vuelve al inicio |

---

## 📁 Estructura relevante

```
app/
├── controllers/
│   ├── home_controller.rb        # landing (datos de mercados, features, etc.)
│   ├── auth_controller.rb        # login / logout (sesión) + credenciales demo
│   └── dashboard_controller.rb   # panel protegido (before_action :require_login)
├── views/
│   ├── home/index.html.erb       # homepage completa
│   ├── auth/
│   │   ├── _auth_page.html.erb    # MÓDULO reutilizable del formulario (login/register)
│   │   ├── login.html.erb         # render "auth_page", mode: :login
│   │   └── register.html.erb      # render "auth_page", mode: :register
│   └── dashboard/index.html.erb  # panel
config/
└── routes.rb                     # todas las rutas
public/
└── images/                       # imágenes del hero, tarjeta, monedas, app
```

---

## 🛠️ Comandos útiles

```bash
bin/rails routes         # lista todas las rutas
bin/rails console        # consola interactiva de Rails
bin/rails db:prepare     # crea/migra la base de datos
brew services list       # ver si PostgreSQL está corriendo
```

---

## 🌱 Flujo de trabajo con Git

Para subir cambios (el repo ya está conectado a GitHub):

```bash
git add .
git commit -m "descripción del cambio"
git push
```

---

## 📌 Notas

- **Autenticación:** por ahora las credenciales están *hardcodeadas* (`usuario` / `123`).
  El siguiente paso natural sería un modelo `User` real en PostgreSQL con
  contraseña encriptada (`has_secure_password` + `bcrypt`).
- **Registro:** la página `/register` es visual; aún no crea usuarios.
- **Base de datos:** el proyecto usa PostgreSQL. La configuración está en
  `config/database.yml` (usa el usuario del sistema por defecto de Homebrew).

---

Hecho con Ruby on Rails 🛤️ — proyecto de prueba.