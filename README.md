# Camera Reviews System
---
## Problema a resolver
La empresa "RandomCameraReviews" necesita un sistema que permita que fotografos profesionales suban "reviews" de cámaras fotográficas, para que cualquier persona desde cualquier parte del mundo pueda buscar los los reviews y comprarlas a travez de su portal.

La empresa cuenta con un equipo de developers especializado en front end que realizara un portal para que los editores suban los "reviews" y los usuarios puedan verlos. Han solicitado que tú como especista en backend, les proporciones un sistema, incluyendo API que permita  realizar lo siguiente:

- Subir reviews de Camaras fotográficas.
- Obtener el contenido de los reviews para mostrarlo en vistas del portal en sus versiones web y mobile.
- Manejo de usuarios para editores (no incluye visitantes que leen los reviews).

Tambien se sabe que la empresa "RandomCameraReviews" planea distribuir mayormente en America del Sur donde esta su mercado más grande, pero también tienen ventas en Norte América, Europa, y muy pocas en Asia.

### Alcance(Scope)

#### Casos de uso
Descripción...
  - Los editores pueden subir una review de una cámara.
  - Los editores pueden subir una review de un lente para las cámaras.
  - Los usuarios no registrados pueden leer reviews de cámaras.

#### Out of Scope
Descripción...
  - Los usuarios no registrados no pueden crear reviews de cámaras.
  - Los usuarios no registrados no pueden registrarse.
  - Los usuarios no registrados no pueden eliminar reviews.
  - ...
---
## Arquitectura

### Diagramas

Diagrama de bajo nivel de la autenticación
![image](https://user-images.githubusercontent.com/39924884/113481971-1aaa3400-9462-11eb-94bc-7b9e33f45d8c.png)

Diagrama de bajo nivel general
![image](https://user-images.githubusercontent.com/39924884/113482066-8096bb80-9462-11eb-8cdd-253c57fc8528.png)

Diagrama de bajo nivel de lectura de reviews
![image](https://user-images.githubusercontent.com/39924884/113482086-9c01c680-9462-11eb-8900-0cadc62e0362.png)


### Modelo de datos
Poner diseño de entidades, Jsons, tablas, diagramas entidad relación, etc...

---
### Plan de pruebas
Crear suit de pruebas que validen los siguientes casos de uso:

- Registrar usuario, crear review, simular que visitante puede leer el review escrito.

### Integración continua

---
## Limitaciones
Lista de limitaciones conocidas. Puede ser en formato de lista. Cuántificable. Ej.

- La API tiene un límite de 500 request por segundo.
- No se pueden subir imágenes más grandes de 5 MB.
---
## Costo
Descripción/Análisis de costos. Ejemplo:

"Considerando N usuarios diarios, M llamadas a X servicio/baseDatos/etc"

- 1000 llamadas diarias a serverless functions. $XX.XX
- 1000 read/write units diarias a X Database on-demand. $XX.XX
Total: $xx.xx (al mes/dia/año)
