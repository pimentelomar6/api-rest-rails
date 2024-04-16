# Challenge Software Development Engineer (Back)



## Tecnologias

**Servidor:** Ruby, Ruby On Rails 
**Base de Datos:**: PostgreSQL


## Requisitos previos

- Ruby v3.2.3
- Rails v7.1.3.2
- PostgreSQL v16.1



## Instrucciones de instalación

Clona el repositorio

```bash
  git clone https://github.com/pimentelomar6/api-rest-rails.git
```

Ir al directorio del proyecto

```bash
  cd api-rest-rails
```

Instalar dependencias

```bash
  bundle install
```


### Variables de Entorno

Para ejecutar este proyecto, necesitas agregar las siguientes variables de entorno a tu archivo config/application.yml

 `DB_USERNAME`
 `DB_PASSWORD`
 `DB_HOST`
 `DB_NAME`


### Ejecutar Task

Crear base de datos

```bash
  rails db:create
```

Ejectuar migraciones

```bash
  rails db:migrate
```

Correr Task

```bash
  rails import:data
```

Iniciar Servidor

```bash
  rails server
```


## API Reference

#### Listado de Features

```http
  GET /api/features?page=20&per_page=10&mag_type=ml
```

| Parametro | Tipo     | Descripcion                |
| :-------- | :------- | :------------------------- |
| `page` | `number` | Numero de paginas totales |
| `per_page` | `number` | Items por pagina |
| `mag_type` | `string` | Filtro por mag_type |



#### Agregar comentario 

```http
  POST /api/features/${feature_id}/comments
```

| Parametro | Tipo     | Descripcion                       |
| :-------- | :------- | :-------------------------------- |
| `feature_id`      | `number` | Id del feature commentado |



