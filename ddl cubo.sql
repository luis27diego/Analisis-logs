-- Crear base de datos (opcional, si no existe)
CREATE DATABASE IF NOT EXISTS log_analytics;
USE log_analytics;

-- Tabla de dimensión: Tiempo
CREATE TABLE dim_tiempo (
    id_tiempo INT AUTO_INCREMENT PRIMARY KEY,
    anio INT,
    mes VARCHAR(20),
    dia INT,
    hora VARCHAR(5),
    INDEX idx_tiempo (anio, mes, dia, hora)
);

-- Tabla de dimensión: Método HTTP
CREATE TABLE dim_metodo (
    id_metodo INT AUTO_INCREMENT PRIMARY KEY,
    metodo VARCHAR(10),
    INDEX idx_metodo (metodo)
);

-- Tabla de dimensión: Ruta
CREATE TABLE dim_ruta (
    id_ruta INT AUTO_INCREMENT PRIMARY KEY,
    ruta VARCHAR(500),
    INDEX idx_ruta (ruta(255))
);

-- Tabla de dimensión: Código de Estado
CREATE TABLE dim_codigo_estado (
    id_codigo_estado INT AUTO_INCREMENT PRIMARY KEY,
    codigo_estado VARCHAR(3),
    INDEX idx_codigo_estado (codigo_estado)
);

-- Tabla de dimensión: Dirección IP
CREATE TABLE dim_direccion_ip (
    id_direccion_ip INT AUTO_INCREMENT PRIMARY KEY,
    direccion_ip VARCHAR(45),
    INDEX idx_direccion_ip (direccion_ip)
);

-- Tabla de dimensión: Agente de Usuario
CREATE TABLE dim_agente_usuario (
    id_agente_usuario INT AUTO_INCREMENT PRIMARY KEY,
    agente_usuario VARCHAR(500),
    INDEX idx_agente_usuario (agente_usuario(255))
);

-- Tabla de dimensión: Referer
CREATE TABLE dim_referer (
    id_referer INT AUTO_INCREMENT PRIMARY KEY,
    referer VARCHAR(500),
    INDEX idx_referer (referer(255))
);

-- Tabla de hechos
CREATE TABLE tabla_hechos (
    id_hecho INT AUTO_INCREMENT PRIMARY KEY,
    id_tiempo INT,
    id_metodo INT,
    id_ruta INT,
    id_codigo_estado INT,
    id_direccion_ip INT,
    id_agente_usuario INT,
    id_referer INT,
    bytes_enviados INT,
    conteo_solicitudes INT,
    FOREIGN KEY (id_tiempo) REFERENCES dim_tiempo(id_tiempo),
    FOREIGN KEY (id_metodo) REFERENCES dim_metodo(id_metodo),
    FOREIGN KEY (id_ruta) REFERENCES dim_ruta(id_ruta),
    FOREIGN KEY (id_codigo_estado) REFERENCES dim_codigo_estado(id_codigo_estado),
    FOREIGN KEY (id_direccion_ip) REFERENCES dim_direccion_ip(id_direccion_ip),
    FOREIGN KEY (id_agente_usuario) REFERENCES dim_agente_usuario(id_agente_usuario),
    FOREIGN KEY (id_referer) REFERENCES dim_referer(id_referer),
    INDEX idx_hechos_tiempo (id_tiempo),
    INDEX idx_hechos_metodo (id_metodo),
    INDEX idx_hechos_ruta (id_ruta)
);