```yaml
version: '3'
services:
    postgres:
        restart: always
        image: postgres:10.2-alpine
        expose:
            - "5432"
        environment:
            - DEBUG=false
            - POSTGRES_USER=test_user
            - POSTGRES_PASSWORD=test_password
            - POSTGRES_DB=test_db
        volumes:
            - ./data:/var/lib/postgresql
    backup:
        build: .
        depends_on:
            - postgres
        links:
            - postgres
        volumes:
            - ./tmp:/tmp
        environment:
            - DUMP_LOCATION=tmp/dump.sql
            - SOURCE_PG_HOST=postgres
            - SOURCE_PG_USER=test_user
            - SOURCE_PG_PASSWORD=test_password
            - SOURCE_PG_PORT=5432
            - SOURCE_PG_DBNAME=test_db

```