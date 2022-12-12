# tạo danh sách email nhân viên
drop function if exists email_employee_list;
delimiter //
create function email_employee_list (min int) returns varchar(4000) DETERMINISTIC
begin
	declare emailList varchar(4000) default '';
    declare curSalary int default 0;
    declare finished int default 0;
    declare emailAddress varchar(255) default '';
    declare curEmail cursor for select email, salary from person p join employee e on p.person_id = e.person_id;
    declare continue handler for not found set finished = 1;
	begin
		open curEmail;
		getEmail : LOOP
			FETCH curEmail INTO emailAddress, curSalary;
            if finished = 1 then 
				leave getEmail;
			end if;
            if (curSalary > min) then
            set emailList = concat(emailAddress, ';', emailList);
            end if;
		end LOOP getEmail;
		close curEmail;
	end;
return emailList;
end;
//
delimiter ;

set @email = email_employee_list(200000);
select@email;





