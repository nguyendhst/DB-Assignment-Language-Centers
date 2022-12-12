# thêm một room
drop function if exists add_room;
delimiter //
create function add_room (room_id_new INT,room_name_new VARCHAR(255),center_id_new INT) returns varchar(255) DETERMINISTIC
Begin
	declare result varchar(255);
	if (exists (select * from center where center_id = center_id_new)) then
		begin
		if ( not exists (select * from room where (room_id = room_id_new or room_name = room_name_new)) )then 
			begin
			insert into room (room_id , room_name, center_id) values (room_id_new, room_name_new, center_id_new);
            return "success";
			end;
		end if;
		end;
	end if;
    return "fail";
End;
//
delimiter ;

set @add_room = add_room(4, 'adddddd', 2);
select @add_room;