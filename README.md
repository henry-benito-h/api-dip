# api-dip-schoology
API testing Diplomado - Control de Calidad de Software Comercial


Cambios necesarios que afectan el test plan debido a permisos de super admin y similares

- /course/:id/sections, solamente disponible para administrador de sistema, en su lugar se utilizo el enpoint /groups/:id/albums
- /users, tambien necesitaba privilegios de administrador, se cambio por /messages
- En /messages ademas de solo acceptance se agrego funcional tests