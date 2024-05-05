# Use a imagem base do .NET Core
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo csproj e restaure as dependências
COPY *.csproj ./
RUN dotnet restore

# Copie o restante do código-fonte e compile a aplicação
COPY . ./
RUN dotnet publish -c Release -o out

# Use a imagem base do ASP.NET Core
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

# Defina o diretório de trabalho
WORKDIR /app

# Copie os arquivos publicados da etapa de compilação
COPY --from=build /app/out ./

# Exponha a porta 80 para o tráfego HTTP
EXPOSE 8080

# Defina o comando de inicialização da aplicação
ENTRYPOINT ["dotnet", "myWebApp.dll"]