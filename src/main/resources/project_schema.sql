DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
project_id INT AUTO_INCREMENT NOT NULL,
project_name VARCHAR(128) NOT null,
estimated_hours DECIMAL(7,2),
actual_hours DECIMAL(7,2),
difficulty INT,
notes TEXT,
PRIMARY KEY (project_id)
);

CREATE TABLE category (
category_id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(128) NOT NULL,
PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
project_id INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step (
step_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
step_text TEXT NOT NULL,
step_order TEXT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
material_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
material_name VARCHAR(128) NOT NULL,
num_required INT,
cost DECIMAL(7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (1, 'Hang New Door', 1, 2, 3, 'Termite Damage, Oh noes!');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (2, 'Make Ornaments for Craft Show', 1, 1, 1, 'Buy Clear Ornaments');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (3, 'Fix Dining Room Floor', 5, 5, 5, 'Remove Basketball');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (4, 'Build Plant Holders', 1, 1, 3, 'Remove desk first');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (5, 'Do Homework for Class', 2, 2, 3, 'Week 10');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (6, 'Plan Thanksgiving Dinner', 1, 1, 1, '12 people');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (7, 'Mow Lawn', 2, 2, 2, 'One last time');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (8, 'Replace 3rd Floor Windows', 8, 10, 5, 'Need another set of scaffolding and more planks');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (9, 'Hang New Door', 1, 2, 3, 'Termite Damage, Oh noes!');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (10, 'Replace Screen in Front Door', 1, 0.5, 1, 'Easy');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (11, 'Find SQL Error', 1, 2, 1, 'Dumb import');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (12, 'Fix Travis Error', 1, 14, 1, 'Tables');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (13, 'Make Hats', 1, 1, 1, 'Crafty');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (14, 'Drywall the Dining Room', 1, 0.5, 1, 'Finish 11/6');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (15, 'Replace Bedroom Windows', 6, 8, 5, 'Need more scaffolding');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (16, 'Finish Siding Back of House', 12, 12, 1, 'Allan');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (17, 'Hang Christmas Wreaths', 1, 1, 1, 'Rawr');
insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values (18, 'Crochet Granny Squares', 1, 0.5, 1, 'As many as possible');


insert into material (project_id, material_name, num_required) values (2, 'plastic ornaments', 40);
insert into material (project_id, material_name, num_required) values (2, 'jingle bells', 400);
insert into material (project_id, material_name, num_required) values (2, 'mod podge', 1);
insert into material (project_id, material_name, num_required) values (2, 'acrylic paints', null);
insert into material (project_id, material_name, num_required) values (3, 'replacement flooring, per square foot', 25);
insert into material (project_id, material_name, num_required) values (6, 'turkey, in lbs', 19);
insert into material (project_id, material_name, num_required) values (6, 'sweet potatoes, per can', 2);
insert into material (project_id, material_name, num_required) values (6, 'pounds of potatoes', 10);
insert into material (project_id, material_name, num_required) values (13, 'super bulky yarn', 8);
insert into material (project_id, material_name, num_required) values (14, 'reinforced corner tape', 1);
insert into material (project_id, material_name, num_required) values (14, 'drywall mud, in gallons', 3);
insert into material (project_id, material_name, num_required) values (15, '2x4s', 6);
insert into material (project_id, material_name, num_required) values (15, 'particle board', 3);
insert into material (project_id, material_name, num_required) values (15, 'drywall sheets', 5);
insert into material (project_id, material_name, num_required) values (16, 'hours in a day', 40);
insert into material (project_id, material_name, num_required) values (18, 'worsted weight yarn', 16);

insert into step (project_id, step_text, step_order) values (2, 'fill ornament part way with jingle bells', 1);
insert into step (project_id, step_text, step_order) values (3, 'remove old flooring to desired length', 1);
insert into step (project_id, step_text, step_order) values (3, 'replace subflooring', 2);
insert into step (project_id, step_text, step_order) values (3, 'replace oak floorboards',3);
insert into step (project_id, step_text, step_order) values (3, 'nail into place', 4);
insert into step (project_id, step_text, step_order) values (14, 'stir mud', 1);
insert into step (project_id, step_text, step_order) values (14, 'apply thin layer of mud to corner', 2);
insert into step (project_id, step_text, step_order) values (14, 'place tape in corner', 3);
insert into step (project_id, step_text, step_order) values (14, 'apply top layer of mud', 4);
insert into step (project_id, step_text, step_order) values (14, 'sand after drying', 5);
insert into step (project_id, step_text, step_order) values (14, 'apply second coat', 6);
insert into step (project_id, step_text, step_order) values (14, 'sand and paint', 7);
insert into step (project_id, step_text, step_order) values (15, 'Remove old windows', 1);
insert into step (project_id, step_text, step_order) values (15, 'Build/replace wall studs where windows will not be replaced', 2);
insert into step (project_id, step_text, step_order) values (15, 'Cover outside walls with particle board', 3);
insert into step (project_id, step_text, step_order) values (15, 'Insert new windows', 4);
insert into step (project_id, step_text, step_order) values (15, 'Finish siding over new outside wall', 5);
insert into step (project_id, step_text, step_order) values (15, 'Drywall inside wall', 6);

insert into category (category_id, category_name) values (1, 'Doors and Windows');
insert into category (category_id, category_name) values (2, 'Decorations');
insert into category (category_id, category_name) values (3, 'Crafts');
insert into category (category_id, category_name) values (4, 'Siding');
insert into category (category_id, category_name) values (5, 'Drywall');
insert into category (category_id, category_name) values (6, 'Flooring');
insert into category (category_id, category_name) values (7, 'Outdoor');
insert into category (category_id, category_name) values (8, 'Meals');

insert into project_category (project_id, category_id) values (1, 1);
insert into project_category (project_id, category_id) values (2, 3);
insert into project_category (project_id, category_id) values (3, 6);
insert into project_category (project_id, category_id) values (4, 2);
insert into project_category (project_id, category_id) values (6, 8);
insert into project_category (project_id, category_id) values (7, 7);
insert into project_category (project_id, category_id) values (8, 1);
insert into project_category (project_id, category_id) values (9, 1);
insert into project_category (project_id, category_id) values (10, 1);
insert into project_category (project_id, category_id) values (13, 3);
insert into project_category (project_id, category_id) values (14, 5);
insert into project_category (project_id, category_id) values (15, 1);
insert into project_category (project_id, category_id) values (16, 4);
insert into project_category (project_id, category_id) values (17, 2);
insert into project_category (project_id, category_id) values (18, 3);