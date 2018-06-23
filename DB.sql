CREATE DATABASE alfio

CREATE TABLE roles(
	id INT  PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL,
    fecha DATE
);

INSERT INTO `roles` (`id`, `nombre`, `fecha`) VALUES (NULL, 'admin', '2018-06-23'), (NULL, 'standar', '2018-06-23');

CREATE TABLE usuarios(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200)NOT NULL,
    ci VARCHAR(200)NOT NULL UNIQUE,
    telefono INT NOT NULL UNIQUE,
    pass VARCHAR(200) NOT NULL,
    id_rol INT NOT NULL,
    FOREIGN KEY (id_rol) REFERENCES roles(id)
    
);
INSERT INTO `usuarios` (`id`, `nombre`, `ci`, `telefono`, `pass`, `id_rol`) VALUES (NULL, 'administrador', '8238524', '75511391', 'administrador', '1'),
(NULL, 'jose antonio vargas', '11350379', '61353643', 'jvargas', '2');

CREATE TABLE categorias(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL    
);

CREATE TABLE productos(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200)NOT NULL,
    marca VARCHAR(200),
    precio_compra REAL NOT NULL,
    precio_venta REAL NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
    
);
INSERT INTO `productos` (`id`, `nombre`, `marca`, `precio_compra`, `precio_venta`, `id_categoria`) VALUES (NULL, 'coca cola', 'coca cola ', '4', '6', '1'),
(NULL, 'yogurt', 'pil', '1.5', '2', '2');

CREATE TABLE stock(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cantidad REAL,
    id_producto INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id)  
    
);

INSERT INTO `stock` (`id`, `cantidad`, `id_producto`) VALUES (NULL, '100', '1'), (NULL, '50', '2');

CREATE TABLE venta(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cantidad INT NOT NULL,
    subtotal REAL NOT NULL,
    total REAL NOT NULL,
    fecha DATE NOT NULL,
    id_usuario INT NOT NULL,
    id_producto INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id),
    FOREIGN KEY (id_poducto) REFERENCES productos(id)
)
    
    