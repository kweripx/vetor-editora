### README

#### Descrição
Esta é uma aplicação Rails que gerencia psicólogos, avaliados e instrumentos psicológicos. A aplicação utiliza PostgreSQL como banco de dados e Docker para facilitar a configuração e o deploy.

#### Pré-requisitos
- Docker
- Docker Compose

#### Configuração e Execução
1. **Clonar o Repositório**
   ```bash
   git clone [URL_DO_REPOSITÓRIO]
   cd [NOME_DO_DIRETÓRIO]
   ```

2. **Construir e Iniciar os Contêineres**
   Utilize Docker Compose para construir e iniciar os serviços necessários:
   ```bash
   docker-compose up --build
   ```

3. **Configurar o Banco de Dados**
   Após os contêineres estarem rodando, configure o banco de dados:
   ```bash
   rails db:migrate
   ```

4. **Rodar Testes**
   Execute os testes para garantir que tudo está configurado corretamente:
   ```bash
   rspec
   ```

#### Arquitetura
A aplicação utiliza:
- **Ruby on Rails** como framework.
- **PostgreSQL** para persistência de dados.
- **Docker** para containerização e isolamento do ambiente.