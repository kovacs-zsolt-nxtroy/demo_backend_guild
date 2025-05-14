# Monaco Szerver Architektúra

Ez a projekt egy többrétegű szerver architektúrát valósít meg, amely három különböző környezetet tartalmaz: publikus, privát alfa és privát béta szervereket.

## Projekt Struktúra

A projekt három fő komponensből áll:

- **Publikus Szerver** - Nyilvános hozzáférésű szerver
- **Privát Alfa Szerver** - Belső tesztelési környezet
- **Privát Béta Szerver** - További belső tesztelési környezet

## Technológiák

- NGINX - Web szerver
- Docker - Konténerizáció
- Azure Container Apps - Felhő platform
- GitHub Actions - CI/CD

## Végpontok

### Publikus Szerver
- `/` - Üdvözlő üzenet
- `/szia` - Magyar üdvözlő üzenet
- `/alfa` - Proxy az alfa szerverhez
- `/beta` - Proxy a béta szerverhez

### Privát Alfa Szerver
- `/` - Alfa környezet üdvözlő üzenet
- `/szia` - Alfa környezet magyar üdvözlő üzenet

### Privát Béta Szerver
- `/` - Béta környezet üdvözlő üzenet
- `/szia` - Béta környezet magyar üdvözlő üzenet

## Telepítés és Üzemeltetés

A projekt automatikusan települ az Azure Container Apps platformra GitHub Actions segítségével. Minden szerver komponens külön workflow-val rendelkezik:

- `server-public.yml` - Publikus szerver workflow
- `server-private-alfa.yml` - Privát alfa szerver workflow
- `server-private-beta.yml` - Privát béta szerver workflow

### Build és Telepítés Folyamat

1. A kód push-olása a `main` ágra aktiválja a megfelelő workflow-t
2. Docker image építése
3. Image feltöltése az Azure Container Registry-be
4. Telepítés az Azure Container Apps környezetbe

## Architektúra

A rendszer a Structurizr workspace-ben van modellezve, amely vizuálisan ábrázolja a komponensek közötti kapcsolatokat és a teljes rendszerarchitektúrát.
```
docker run -it --rm -p 8190:8080 -v ./structurizr:/usr/local/structurizr structurizr/lite
```
## Környezeti Változók

A telepítéshez szükséges környezeti változók:
- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET`
- `AZURE_TENANT_ID`
- `AZURE_SUBSCRIPTION_ID`
- `AZURE_REGISTRY_NAME`

## Licenc

A projekt belső használatra készült.

