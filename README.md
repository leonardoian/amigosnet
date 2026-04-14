<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:08081a,100:00f0ff&height=180&section=header&text=AmigosNet%20🗺️&fontSize=55&fontColor=ffffff&fontAlignY=40&animation=fadeIn"/>

<p align="center">
  <img src="https://img.shields.io/badge/Status-Online-00ff88?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Deploy-Netlify-00C7B7?style=for-the-badge&logo=netlify&logoColor=white"/>
  <img src="https://img.shields.io/badge/Database-Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white"/>
  <img src="https://img.shields.io/badge/Realtime-⚡-yellow?style=for-the-badge"/>
</p>

<p align="center">
  <strong>Veja onde seus amigos estão — em tempo real, no mapa. 🌎</strong>
</p>

---

## 📖 Sobre o Projeto

**AmigosNet** é uma aplicação web que permite localizar amigos em um mapa interativo em tempo real. Cada pessoa escolhe seu nome e personagem, e aparece no mapa para todos os outros usuários instantaneamente — sem precisar criar conta ou fazer login.

> Funciona no celular e no PC. É só abrir o link e entrar! 🚀

---

## ✨ Funcionalidades

- 🗺️ **Mapa interativo** com Leaflet.js
- ⚡ **Localização em tempo real** via Supabase Realtime
- 👤 **Sem cadastro** — escolha seu nome e personagem e pronto
- 📱 **Responsivo** — funciona no celular e desktop
- 💌 **Link de convite** — compartilhe direto pelo WhatsApp
- 🧹 **Limpeza automática** — localizações com mais de 24h são removidas

---

## 🛠️ Tecnologias

<p align="left">
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white"/>
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white"/>
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"/>
  <img src="https://img.shields.io/badge/Leaflet.js-199900?style=for-the-badge&logo=leaflet&logoColor=white"/>
  <img src="https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white"/>
  <img src="https://img.shields.io/badge/Netlify-00C7B7?style=for-the-badge&logo=netlify&logoColor=white"/>
</p>

---

## 📁 Estrutura do Projeto

```
amigosnet/
├── index.html          # App completo (frontend)
├── netlify.toml        # Configurações de deploy
├── supabase_setup.sql  # Script para criar o banco de dados
└── GUIA.html           # Guia visual de deploy
```

---

## 🚀 Como Rodar (Deploy Gratuito)

### 1️⃣ Criar o banco de dados — Supabase

1. Acesse [supabase.com](https://supabase.com) e crie uma conta
2. Crie um novo projeto (região: **South America - São Paulo**)
3. Vá em **SQL Editor** e cole o conteúdo de `supabase_setup.sql`
4. Clique em **Run** ✅
5. Vá em **Project Settings → API** e copie:
   - `Project URL` → `https://xxxxx.supabase.co`
   - `anon public key` → `eyJ...`

### 2️⃣ Configurar as chaves no app

No arquivo `index.html`, localize e substitua:

```javascript
const SUPABASE_URL  = window.ENV_SUPABASE_URL  || 'COLE_SUA_URL_AQUI';
const SUPABASE_ANON = window.ENV_SUPABASE_ANON || 'COLE_SUA_ANON_KEY_AQUI';
```

### 3️⃣ Deploy no Netlify

1. Acesse [netlify.com](https://netlify.com) e crie uma conta grátis
2. Arraste a pasta do projeto para o Netlify
3. Aguarde ~30 segundos ⏳
4. Seu link estará pronto: `https://seu-amigosnet.netlify.app` 🎉

> 📖 Consulte o arquivo `GUIA.html` para um passo a passo visual completo!

---

## 🗄️ Banco de Dados

```sql
CREATE TABLE locations (
  id         TEXT PRIMARY KEY,
  name       TEXT NOT NULL,
  char       INTEGER NOT NULL DEFAULT 0,
  status     TEXT DEFAULT 'Online',
  lat        DOUBLE PRECISION,
  lng        DOUBLE PRECISION,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);
```

- 🔒 Row Level Security (RLS) ativado
- 🌍 Leitura e escrita pública (sem login)
- ⚡ Realtime habilitado na tabela `locations`
- 🧹 Limpeza automática de registros com mais de 24h

---

## 📊 Limites do Plano Gratuito

| Serviço | Limite | Observação |
|---------|--------|------------|
| Supabase | 500MB banco · 50k req/mês | Suficiente para uso pessoal |
| Netlify | 100GB banda/mês | Mais que suficiente |

---

## 👨‍💻 Desenvolvido por

<p align="center">
  Feito com ❤️ por <strong>Leonardo Ian de Oliveira</strong>
</p>

<p align="center">
  <a href="https://www.linkedin.com/in/leonardo-ian" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white"/>
  </a>
  <a href="https://github.com/leonardoian" target="_blank">
    <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"/>
  </a>
</p>

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0:00f0ff,100:08081a&height=120&section=footer"/>
