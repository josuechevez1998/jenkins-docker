FROM jenkins/jenkins:lts

# Configurar Jenkins como usuario root para instalar paquetes adicionales si es necesario
USER root

# Instalar paquetes útiles dentro del contenedor (opcional)
RUN apt-get update && apt-get install -y \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Permitir que el usuario `jenkins` use sudo sin contraseña
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Volver al usuario de Jenkins
USER jenkins

# Exponer los puertos necesarios
EXPOSE 8080 50000

# Comando de inicio de Jenkins
CMD ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
