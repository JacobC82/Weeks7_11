DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS category;

CREATE TABLE category(
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR (128) NOT NULL,
	PRIMARY KEY (category_id));
	
CREATE TABLE project(
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	notes TEXT,
	difficulty INT,
	estimated_hours DECIMAL (7,2),
	actual_hours DECIMAL (7,2),
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (project_id)
);

CREATE TABLE material(
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7,2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE project_category(
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (project_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step(
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_order INT NOT NULL,
	step_text TEXT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

// adding data

insert into project  (project_name, estimated_hours, actual_hours, difficulty, notes) values ('hang door', 3, 3, 3, 'about as expected');
insert into material (project_id, material_name, num_required, cost) values (1, 'Door hangers', 9, 27.99);
insert into material (project_id, material_name, num_required, cost) values (1, 'screws', 20, 4.50);
insert into step (project_id, step_text, step_order) values (1, 'align hangers on opening side of door', 1);
insert into step (project_id, step_text, step_order) values (1, 'screw hangers into frame', 2);
insert into category (category_id, category_name) values (1, 'Doors and windows');
insert into category (category_id, category_name) values (2, 'Repairs');
insert into category (category_id, category_name) values (3, 'Gardening');
insert into project_category (project_id, category_id) values (1,1);
insert into project_category (project_id, category_id) values (1,2);