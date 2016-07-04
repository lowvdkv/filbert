
create procedure Filbert_HOROVOD (@n int)
AS
BEGIN
set nocount on; --выключаем счетчик


declare @phone table (number varchar(32)) --создаем таблицу с рабочими телефонами
insert into @phone (number) 
					(
						select ph.number
						from i_collect.dbo.debt as d
							inner join i_collect.dbo.person as per on d.parent_id = per.id
							inner join i_collect.dbo.phone as ph on per.id = ph.parent_id
						where ph.typ = 3
							and (isnull(d.gmt-4,0) + datepart(hour, getdate())) > 17
					union all
						select ph.number2
						from i_collect.dbo.debt as d
							inner join i_collect.dbo.person as per on d.parent_id = per.id
							inner join i_collect.dbo.phone as ph on per.id = ph.parent_id
						where ph.typ = 3
							and (isnull(d.gmt-4,0) + datepart(hour, getdate())) > 17

					)

----------------------------------------------------------------------
--<district_1>
	if @n = 1 --конъюнктура
		begin
			if OBJECT_ID('tmp_campaign_1') is not null
				drop table tmp_campaign_1
				
			;select * into tmp_campaign_1 from [INFINITY2].[Cx_Work].[public].[Table_5000081023]
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5000081023]
			;insert into [INFINITY2].[Cx_Work].[public].[Table_5000081023]
			(
			[ID]
			,[State]
			,[ID_долга]
			,[Банк]
			,[Фамилия]
			,[Имя]
			,[Отчество]
			,[Телефон1]
			,[Телефон2]
			,[Телефон3]
			,[Телефон4]
			,[Телефон5]
			,[Остаток_долга]
			,[Дата_перезвона]
			,[Часовой_пояс]
			,[Телефон_для_перезвона]
			,[last_call_dt]
			,[Телефон6]
			,[Телефон7]
			,[Телефон8]
			,[Телефон9]
			,[Телефон10]
			,[Телефон11]
			,[Телефон12]
			,[Телефон13]
			,[Телефон14]
			,[Телефон15]
			)
	
		select
			tc1.*
		from
			tmp_campaign_1 tc1
			left join
					(
					select
						cl.r_debt_id
						,cl.dt
					from
						i_collect.dbo.contact_log cl
					where
						cl.typ = 1
						and cl.id in
								(
								select
									max(id)
								from
									i_collect.dbo.contact_log
								group by
									r_debt_id
								)		
					group by
						cl.r_debt_id
						,cl.dt
			
					)cl 
						on cl.r_debt_id = tc1.[ID]
		order by
			cl.dt asc		

		;delete from [INFINITY2].[Cx_Work].[public].[Table_5000081023]
			where
				 [ID] in
							(
							select
								d.id
							from
								i_collect.dbo.debt d
							where
								d.status in (6,7,8,10)
							group by
								d.id
							)
				or [ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

		;delete from 
			[INFINITY2].[Cx_Work].[public].[Table_5000081023]
		where 
			[Телефон1] is null
			and [Телефон2] is null
			and [Телефон3] is null
			and [Телефон4] is null
			and [Телефон5] is null
			and [Телефон6] is null
			and [Телефон7] is null
			and [Телефон8] is null
			and [Телефон9] is null
			and [Телефон10] is null
			and [Телефон11] is null
			and [Телефон12] is null
			and [Телефон13] is null
			and [Телефон14] is null
			and [Телефон15] is null

		;delete from [INFINITY2].[Cx_Work].[public].[Table_5000081023]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)
		end

--------------------------------
	else if @n = 11 --сортировка
		begin
		if OBJECT_ID('tmp_campaign_11') is not null
			drop table tmp_campaign_11

			;select * into tmp_campaign_11 from [INFINITY2].[Cx_Work].[public].[Table_5000081023]
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5000081023]

		--<вставляем отсортированные данные>
			;insert into [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				(
				[ID]
				,[State]
				,[ID_долга]
				,[Банк]
				,[Фамилия]
				,[Имя]
				,[Отчество]
				,[Телефон1]
				,[Телефон2]
				,[Телефон3]
				,[Телефон4]
				,[Телефон5]
				,[Остаток_долга]
				,[Дата_перезвона]
				,[Часовой_пояс]
				,[Телефон_для_перезвона]
				,[last_call_dt]
				,[Телефон6]
				,[Телефон7]
				,[Телефон8]
				,[Телефон9]
				,[Телефон10]
				,[Телефон11]
				,[Телефон12]
				,[Телефон13]
				,[Телефон14]
				,[Телефон15]
				)						
			select
				tc11.*
			from
				tmp_campaign_11 tc11
				left join
						(
						select
							cl.r_debt_id
							,cl.dt
						from
							i_collect.dbo.contact_log cl
						where
							cl.typ = 1
							and cl.id in
									(
									select
										max(id)
									from
										i_collect.dbo.contact_log
									group by
										r_debt_id
									)		
						group by
							cl.r_debt_id
							,cl.dt
						)cl on cl.r_debt_id = tc11.[ID]
			order by
				cl.dt asc

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
					set [State] = null
					where [State] is not null
		end

	else if @n = 12 --удаляем закрытые дела
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5000081023]
			where
				 [ID] in
						(
						select
							d.id
						from
							i_collect.dbo.debt d
						where
							d.status in (6,7,8,10)
						group by
							d.id
						)

		end

	else if @n = 13 --удаляем закрепленные
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5000081023]
			where
				[ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

		end

	else if @n = 14 --удаляем рабочие телефоны с учетом часового пояса !> 17
		begin
		
			UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081023]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5000081023]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

		end

	else if @n = 15 --удаляем долги с обещаниями
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5000081023]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)

		end
		
	
--</district_1>
----------------------------------------------------------------------

--<district_2>
	else if @n = 2 --конъюнктура
		begin
		if OBJECT_ID ('tmp_campaign_2') is not null
			drop table tmp_campaign_2

			;select * into tmp_campaign_2 from [INFINITY2].[Cx_Work].[public].[Table_5000081044]
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5000081044]
			;insert into [INFINITY2].[Cx_Work].[public].[Table_5000081044]
			(
			[ID]
			,[State]
			,[ID_долга]
			,[Банк]
			,[Фамилия]
			,[Имя]
			,[Отчество]
			,[Телефон1]
			,[Телефон2]
			,[Телефон3]
			,[Телефон4]
			,[Телефон5]
			,[Остаток_долга]
			,[Дата_перезвона]
			,[Часовой_пояс]
			,[Телефон_для_перезвона]
			,[Телефон6]
			,[Телефон7]
			,[Телефон8]
			,[Телефон9]
			,[Телефон10]
			,[Телефон11]
			,[Телефон12]
			,[Телефон13]
			,[Телефон14]
			,[Телефон15]
			,[КолПопыток]
			,[ПерсональныйОпер]
			)

		select
			tc2.*
		from
			tmp_campaign_2 tc2
			left join
					(
					select
						cl.r_debt_id
						,cl.dt
					from
						i_collect.dbo.contact_log cl
					where
						cl.typ = 1
						and cl.id in
								(
								select
									max(id)
								from
									i_collect.dbo.contact_log
								group by
									r_debt_id
								)		
					group by
						cl.r_debt_id
						,cl.dt
			
					)cl
						on cl.r_debt_id = tc2.[ID]
		order by
			cl.dt asc

		;delete from
			[INFINITY2].[Cx_Work].[public].[Table_5000081044]
		where
			 [ID] in
						(
						select
							d.id
						from
							i_collect.dbo.debt d
						where
							d.status in (6,7,8,10)
						group by
							d.id
						)
			or [ID] in
						(
						select
							wt.r_debt_id
						from
							i_collect.dbo.work_task_log as wt
							left join i_collect.dbo.users as u on wt.r_user_id = u.id
						where
							u.id not in (1604, -1)										
							and wt.id in 
									(
									select
										max(id)
									from
										i_collect.dbo.work_task_log
									group by
										r_debt_id
									)
						group by
							wt.r_debt_id
						)
			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
			set [State] = null
			where [State] is not null
	
			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
			set [Телефон1] = null
			where [Телефон1] in (select number from @phone)


			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)
				

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5000081044]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

			;delete from [INFINITY2].[Cx_Work].[public].[Table_5000081044]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)
		end

	else if @n = 21 --сортировка
		begin
		if OBJECT_ID ('tmp_campaign_21') is not null
			drop table tmp_campaign_21

				;select * into tmp_campaign_21 from [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				;delete from [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				;insert into [INFINITY2].[Cx_Work].[public].[Table_5000081044]
					(
					[ID]
					,[State]
					,[ID_долга]
					,[Банк]
					,[Фамилия]
					,[Имя]
					,[Отчество]
					,[Телефон1]
					,[Телефон2]
					,[Телефон3]
					,[Телефон4]
					,[Телефон5]
					,[Остаток_долга]
					,[Дата_перезвона]
					,[Часовой_пояс]
					,[Телефон_для_перезвона]
					,[Телефон6]
					,[Телефон7]
					,[Телефон8]
					,[Телефон9]
					,[Телефон10]
					,[Телефон11]
					,[Телефон12]
					,[Телефон13]
					,[Телефон14]
					,[Телефон15]
					,[КолПопыток]
					,[ПерсональныйОпер]
					)
				select
					tc21.*
				from
					tmp_campaign_21 tc21
					left join
							(
							select
								cl.r_debt_id
								,cl.dt
							from
								i_collect.dbo.contact_log cl
							where
								cl.typ = 1
								and cl.id in
										(
										select
											max(id)
										from
											i_collect.dbo.contact_log
										group by
											r_debt_id
										)		
							group by
								cl.r_debt_id
								,cl.dt
			
							)cl 
								on cl.r_debt_id = tc21.[ID]
				order by
					cl.dt asc

			--<очистка состояния>			
				;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
					set [State] = null
					where [State] is not null
			--</очистка состояния>
		end

	else if @n = 22 --удаляем закрытые дела
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5000081044]
			where
				 [ID] in
						(
						select
							d.id
						from
							i_collect.dbo.debt d
						where
							d.status in (6,7,8,10)
						group by
							d.id
						)

		end

	else if @n = 23 --удаляем закрепленные
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5000081044]
			where
				[ID] in
						(
						select
							wt.r_debt_id
						from
							i_collect.dbo.work_task_log as wt
							left join i_collect.dbo.users as u on wt.r_user_id = u.id
						where
							u.id not in (1604, -1)										
							and wt.id in 
									(
									select
										max(id)
									from
										i_collect.dbo.work_task_log
									group by
										r_debt_id
									)
						group by
							wt.r_debt_id
						)

		end

	else if @n = 24 --удаляем рабочие телефоны с учетом часового пояса !> 17
		begin
		
			UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)
					
			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5000081044]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5000081044]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

		end

	else if @n = 25 --удаляем долги с обещаниями
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5000081044]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)

		end
	
--</district_2>
----------------------------------------------------------------------
--<district_3>
	else if @n = 3 --конъюнктура
		begin
		if OBJECT_ID ('tmp_campaign_3') is not null
			drop table tmp_campaign_3

			;select * into tmp_campaign_3 from [INFINITY2].[Cx_Work].[public].[Table_5015640658]
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5015640658]
			;insert into [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				(
				[ID] ,
				[State] ,
				[ID_долга] ,
				[Банк] ,
				[Фамилия] ,
				[Имя] ,
				[Отчество] ,
				[Телефон1] ,
				[Телефон2] ,
				[Телефон3] ,
				[Телефон4] ,
				[Телефон5] ,
				[Телефон6] ,
				[Телефон7] ,
				[Телефон8] ,
				[Телефон9] ,
				[Телефон10] ,
				[Телефон11] ,
				[Телефон12] ,
				[Телефон13] ,
				[Телефон14] ,
				[Телефон15] ,
				[Остаток_долга] ,
				[Дата_перезвона],
				[Часовой_пояс],
				[Телефон_для_перезвона],
				[ПерсональныйОпер]				
				)
			select
				tc3.*
			from
				tmp_campaign_3 tc3
				left join
						(
						select
							cl.r_debt_id
							,cl.dt
						from
							i_collect.dbo.contact_log cl
						where
							cl.typ = 1
							and cl.id in
									(
									select
										max(id)
									from
										i_collect.dbo.contact_log
									group by
										r_debt_id
									)		
						group by
							cl.r_debt_id
							,cl.dt
			
						)cl 
							on cl.r_debt_id = tc3.[ID]
			order by
				cl.dt asc

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5015640658]
			where
				 [ID] in
							(
							select
								d.id
							from
								i_collect.dbo.debt d
							where
								d.status in (6,7,8,10)
							group by
								d.id
							)
				or [ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
			set [State] = null
			where [State] is not null


			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
					[INFINITY2].[Cx_Work].[public].[Table_5015640658]
				where 
					[Телефон1] is null
					and [Телефон2] is null
					and [Телефон3] is null
					and [Телефон4] is null
					and [Телефон5] is null
					and [Телефон6] is null
					and [Телефон7] is null
					and [Телефон8] is null
					and [Телефон9] is null
					and [Телефон10] is null
					and [Телефон11] is null
					and [Телефон12] is null
					and [Телефон13] is null
					and [Телефон14] is null
					and [Телефон15] is null

			;delete from [INFINITY2].[Cx_Work].[public].[Table_5015640658]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)
		end

	else if @n = 31 --сортировка
		begin
		if OBJECT_ID ('tmp_campaign_31') is not null
			drop table tmp_campaign_31

				;select * into tmp_campaign_31 from [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				;delete from [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				;insert into [INFINITY2].[Cx_Work].[public].[Table_5015640658]
					(
					[ID] ,
					[State] ,
					[ID_долга] ,
					[Банк] ,
					[Фамилия] ,
					[Имя] ,
					[Отчество] ,
					[Телефон1] ,
					[Телефон2] ,
					[Телефон3] ,
					[Телефон4] ,
					[Телефон5] ,
					[Телефон6] ,
					[Телефон7] ,
					[Телефон8] ,
					[Телефон9] ,
					[Телефон10] ,
					[Телефон11] ,
					[Телефон12] ,
					[Телефон13] ,
					[Телефон14] ,
					[Телефон15] ,
					[Остаток_долга] ,
					[Дата_перезвона],
					[Часовой_пояс],
					[Телефон_для_перезвона],
					[ПерсональныйОпер]				
					)
				select
					tc31.*
				from
					tmp_campaign_31 tc31
					left join
							(
							select
								cl.r_debt_id
								,cl.dt
							from
								i_collect.dbo.contact_log cl
							where
								cl.typ = 1
								and cl.id in
										(
										select
											max(id)
										from
											i_collect.dbo.contact_log
										group by
											r_debt_id
										)		
							group by
								cl.r_debt_id
								,cl.dt
			
							)cl 
								on cl.r_debt_id = tc31.[ID]
				order by
					cl.dt asc

			--<очистка состояния>			
				;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
					set [State] = null
					where [State] is not null
			--</очистка состояния>

		end

	else if @n = 32 --удаляем закрытые дела
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5015640658]
			where
				 [ID] in
						(
						select
							d.id
						from
							i_collect.dbo.debt d
						where
							d.status in (6,7,8,10)
						group by
							d.id
						)

		end

	else if @n = 33 --удаляем закрепленные
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5015640658]
			where
				[ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

		end

	else if @n = 34 --удаляем рабочие телефоны с учетом часового пояса !> 17
		begin
		
			UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5015640658]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5015640658]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

		end

	else if @n = 35 --удаляем долги с обещаниями
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5015640658]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)
		
		end

--</district_3>
----------------------------------------------------------------------
--<district_4>
	else if @n = 4 --конъюнктура
		begin
		if OBJECT_ID ('tmp_campaign_4') is not null
			drop table tmp_campaign_4

			;select * into tmp_campaign_4 from [INFINITY2].[Cx_Work].[public].[Table_5042218921]
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5042218921]
			;insert into [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				(
				[ID]  ,
				[State] ,
				[ID_долга] ,
				[Банк] ,
				[Фамилия] ,
				[Имя] ,
				[Отчество] ,
				[Телефон1] ,
				[Телефон2] ,
				[Телефон3] ,
				[Телефон4] ,
				[Телефон5] ,
				[Телефон6] ,
				[Телефон7] ,
				[Телефон8] ,
				[Телефон9] ,
				[Телефон10] ,
				[Телефон11] ,
				[Телефон12] ,
				[Телефон13] ,
				[Телефон14] ,
				[Телефон15] ,
				[Остаток_долга] ,
				[Дата_перезвона] ,
				[Часовой_пояс] ,
				[Телефон_для_перезвона] ,
				[ПерсональныйОператор] 
				)
			select
				tc4.*
			from
				tmp_campaign_4 tc4
				left join
						(
						select
							cl.r_debt_id
							,cl.dt
						from
							i_collect.dbo.contact_log cl
						where
							cl.typ = 1
							and cl.id in
									(
									select
										max(id)
									from
										i_collect.dbo.contact_log
									group by
										r_debt_id
									)		
						group by
							cl.r_debt_id
							,cl.dt
			
						)cl
							on cl.r_debt_id = tc4.[ID]
			order by
				cl.dt asc

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5042218921]
			where
				 [ID] in
							(
							select
								d.id
							from
								i_collect.dbo.debt d
							where
								d.status in (6,7,8,10)
							group by
								d.id
							)
				or [ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
			set [State] = null
			where [State] is not null

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
			set [Телефон1] = null
			where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5042218921]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5042218921]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)	
		end

	else if @n = 41 --сортировка
		begin
		if OBJECT_ID ('tmp_campaign_41') is not null
			 drop table tmp_campaign_41

				;select * into tmp_campaign_41 from [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				;delete from [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				;insert into [INFINITY2].[Cx_Work].[public].[Table_5042218921]
					(
					[ID]  ,
					[State] ,
					[ID_долга] ,
					[Банк] ,
					[Фамилия] ,
					[Имя] ,
					[Отчество] ,
					[Телефон1] ,
					[Телефон2] ,
					[Телефон3] ,
					[Телефон4] ,
					[Телефон5] ,
					[Телефон6] ,
					[Телефон7] ,
					[Телефон8] ,
					[Телефон9] ,
					[Телефон10] ,
					[Телефон11] ,
					[Телефон12] ,
					[Телефон13] ,
					[Телефон14] ,
					[Телефон15] ,
					[Остаток_долга] ,
					[Дата_перезвона] ,
					[Часовой_пояс] ,
					[Телефон_для_перезвона] ,
					[ПерсональныйОператор] 
					)
				select
					tc41.*
				from
					tmp_campaign_41 tc41
					left join
							(
							select
								cl.r_debt_id
								,cl.dt
							from
								i_collect.dbo.contact_log cl
							where
								cl.typ = 1
								and cl.id in
										(
										select
											max(id)
										from
											i_collect.dbo.contact_log
										group by
											r_debt_id
										)		
							group by
								cl.r_debt_id
								,cl.dt
			
							)cl on
								cl.r_debt_id = tc41.[ID]
				order by
					cl.dt asc

			--<очистка состояния>			
				;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
					set [State] = null
					where [State] is not null
			--</очистка состояния>
		end

	else if @n = 42 --удаляем закрытые дела
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5042218921]
			where
				 [ID] in
						(
						select
							d.id
						from
							i_collect.dbo.debt d
						where
							d.status in (6,7,8,10)
						group by
							d.id
						)

		end

	else if @n = 43 --удаляем закрепленные
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5042218921]
			where
				[ID] in
						(
						select
							wt.r_debt_id
						from
							i_collect.dbo.work_task_log as wt
							left join i_collect.dbo.users as u on wt.r_user_id = u.id
						where
							u.id not in (1604, -1)										
							and wt.id in 
									(
									select
										max(id)
									from
										i_collect.dbo.work_task_log
									group by
										r_debt_id
									)
						group by
							wt.r_debt_id
						)

		end

	else if @n = 44 --удаляем рабочие телефоны с учетом часового пояса !> 17
		begin
		
			UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон1] = null
				where [Телефон1] in	(select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон2] = null
				where [Телефон2] in	(select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон3] = null
				where [Телефон3] in	(select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон4] = null
				where [Телефон4] in	(select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон5] = null
				where [Телефон5] in	(select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон6] = null
				where [Телефон6] in	(select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон7] = null
				where [Телефон7] in	(select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон8] = null
				where [Телефон8] in	(select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон9] = null
				where [Телефон9] in	(select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5042218921]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5042218921]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

		end

	else if @n = 45 --удаляем долги с обещаниями
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5042218921]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)		
		end
	
--</district_4>
----------------------------------------------------------------------
--<district_5>
	else if @n = 5 --конъюнктура
		begin
		if OBJECT_ID('tmp_campaign_5') is not null
			drop table tmp_campaign_5

			;select * into tmp_campaign_5 from [INFINITY2].[Cx_Work].[public].[Table_5052709673]
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5052709673]
			;insert into [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				(
				[ID] ,
				[State] ,
				[ID_долга] ,
				[Банк] ,
				[Фамилия] ,
				[Имя] ,
				[Отчество] ,
				[Остаток_долга] ,
				[Часовой_пояс] ,
				[Телефон1] ,
				[Телефон2] ,
				[Телефон_для_перезвона] ,
				[ПерсональныйОператор] ,
				[Телефон3] ,
				[Телефон4] ,
				[Телефон5] ,
				[Телефон6] ,
				[Телефон7] ,
				[Телефон8] ,
				[Телефон9] ,
				[Телефон10] ,
				[Телефон11] ,
				[Телефон12] ,
				[Телефон13] ,
				[Телефон14] ,
				[Телефон15] ,
				[Дата_перезвона] 
				)
			select
				tc5.*
			from
				tmp_campaign_5 tc5
				left join
						(
						select
							cl.r_debt_id
							,cl.dt
						from
							i_collect.dbo.contact_log cl
						where
							cl.typ = 1
							and cl.id in
									(
									select
										max(id)
									from
										i_collect.dbo.contact_log
									group by
										r_debt_id
									)		
						group by
							cl.r_debt_id
							,cl.dt
			
						)cl
							on cl.r_debt_id = tc5.[ID]
			order by
				cl.dt asc

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5052709673]
			where
					[ID] in
							(
							select
								d.id
							from
								i_collect.dbo.debt d
							where
								d.status in (6,7,8,10)
							group by
								d.id
							)
				or [ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [State] = null
				where [State] is not null

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5052709673]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

			;delete from [INFINITY2].[Cx_Work].[public].[Table_5052709673]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)
		end


	else if @n = 51 --сортировка
		begin
		if OBJECT_ID ('tmp_campaign_51') is not null
			drop table tmp_campaign_51
				
				;select * into tmp_campaign_51 from [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				;delete from [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				;insert into [INFINITY2].[Cx_Work].[public].[Table_5052709673]
					(
					[ID] ,
					[State] ,
					[ID_долга] ,
					[Банк] ,
					[Фамилия] ,
					[Имя] ,
					[Отчество] ,
					[Остаток_долга] ,
					[Часовой_пояс] ,
					[Телефон1] ,
					[Телефон2] ,
					[Телефон_для_перезвона] ,
					[ПерсональныйОператор] ,
					[Телефон3] ,
					[Телефон4] ,
					[Телефон5] ,
					[Телефон6] ,
					[Телефон7] ,
					[Телефон8] ,
					[Телефон9] ,
					[Телефон10] ,
					[Телефон11] ,
					[Телефон12] ,
					[Телефон13] ,
					[Телефон14] ,
					[Телефон15] ,
					[Дата_перезвона] 
					)
				select
					tc51.*
				from
					tmp_campaign_51 tc51
					left join
							(
							select
								cl.r_debt_id
								,cl.dt
							from
								i_collect.dbo.contact_log cl
							where
								cl.typ = 1
								and cl.id in
										(
										select
											max(id)
										from
											i_collect.dbo.contact_log
										group by
											r_debt_id
										)		
							group by
								cl.r_debt_id
								,cl.dt
			
							)cl on 
								cl.r_debt_id = tc51.[ID]
				order by
					cl.dt asc

			--<очистка состояния>			
				;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
					set [State] = null
					where [State] is not null
			--</очистка состояния>
		end

	else if @n = 52 --удаляем закрытые дела
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5052709673]
			where
				 [ID] in
						(
						select
							d.id
						from
							i_collect.dbo.debt d
						where
							d.status in (6,7,8,10)
						group by
							d.id
						)

		end

	else if @n = 53 --удаляем закрепленные
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5052709673]
			where
				[ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

		end

	else if @n = 54 --удаляем рабочие телефоны с учетом часового пояса !> 17
		begin
		
			UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5052709673]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5052709673]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

		end

	else if @n = 55 --удаляем долги с обещаниями
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5052709673]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)		
		end
	
--</district_5>
----------------------------------------------------------------------
--<district_6>
	else if @n = 6 --конъюнктура
		begin
		if OBJECT_ID ('tmp_campaign_6') is not null
			drop table tmp_campaign_6

			;select * into tmp_campaign_6 from [INFINITY2].[Cx_Work].[public].[Table_5064249944]
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5064249944]
			;insert into [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				(
				[ID] ,
				[State] ,
				[ID_долга] ,
				[Банк] ,
				[Фамилия] ,
				[Имя] ,
				[Отчество] ,
				[Остаток_долга] ,
				[Часовой_пояс] ,
				[Телефон1] ,
				[Телефон2] ,
				[Телефон_для_перезвона] ,
				[ПерсональныйОператор] ,
				[Телефон3] ,
				[Телефон4] ,
				[Телефон5] ,
				[Телефон6] ,
				[Телефон7] ,
				[Телефон8] ,
				[Телефон9] ,
				[Телефон10] ,
				[Телефон11] ,
				[Телефон12] ,
				[Телефон13] ,
				[Телефон14] ,
				[Телефон15] ,
				[Дата_перезвона] 
				)
			select
				tc6.*
			from
				tmp_campaign_6 tc6
				left join
						(
						select
							cl.r_debt_id
							,cl.dt
						from
							i_collect.dbo.contact_log cl
						where
							cl.typ = 1
							and cl.id in
									(
									select
										max(id)
									from
										i_collect.dbo.contact_log
									group by
										r_debt_id
									)		
						group by
							cl.r_debt_id
							,cl.dt
			
						)cl 
							on cl.r_debt_id = tc6.[ID]
			order by
				cl.dt asc

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5064249944]
			where
					[ID] in
							(
							select
								d.id
							from
								i_collect.dbo.debt d
							where
								d.status in (6,7,8,10)
							group by
								d.id
							)
				or [ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [State] = null
				where [State] is not null

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5064249944]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

			;delete from [INFINITY2].[Cx_Work].[public].[Table_5064249944]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)
		end
		


	else if @n = 61 --сортировка
		begin
		if OBJECT_ID ('tmp_campaign_61') is not null
			drop table tmp_campaign_61

				;select * into tmp_campaign_61 from [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				;delete from [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				;insert into [INFINITY2].[Cx_Work].[public].[Table_5064249944]
					(
					[ID] ,
					[State] ,
					[ID_долга] ,
					[Банк] ,
					[Фамилия] ,
					[Имя] ,
					[Отчество] ,
					[Остаток_долга] ,
					[Часовой_пояс] ,
					[Телефон1] ,
					[Телефон2] ,
					[Телефон_для_перезвона] ,
					[ПерсональныйОператор] ,
					[Телефон3] ,
					[Телефон4] ,
					[Телефон5] ,
					[Телефон6] ,
					[Телефон7] ,
					[Телефон8] ,
					[Телефон9] ,
					[Телефон10] ,
					[Телефон11] ,
					[Телефон12] ,
					[Телефон13] ,
					[Телефон14] ,
					[Телефон15] ,
					[Дата_перезвона] 
					)
				select
					tc61.*
				from
					tmp_campaign_61 tc61
					left join
							(
							select
								cl.r_debt_id
								,cl.dt
							from
								i_collect.dbo.contact_log cl
							where
								cl.typ = 1
								and cl.id in
										(
										select
											max(id)
										from
											i_collect.dbo.contact_log
										group by
											r_debt_id
										)
							group by
								cl.r_debt_id
								,cl.dt
			
							)cl
								on cl.r_debt_id = tc61.[ID]
				order by
					cl.dt asc

			--<очистка состояния>			
				;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
					set [State] = null
					where [State] is not null
			--</очистка состояния>
		end

	else if @n = 62 --удаляем закрытые дела
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5064249944]
			where
				 [ID] in
						(
						select
							d.id
						from
							i_collect.dbo.debt d
						where
							d.status in (6,7,8,10)
						group by
							d.id
						)

		end

	else if @n = 63 --удаляем закрепленные
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5064249944]
			where
				[ID] in
						(
						select
							wt.r_debt_id
						from
							i_collect.dbo.work_task_log as wt
							left join i_collect.dbo.users as u on wt.r_user_id = u.id
						where
							u.id not in (1604, -1)										
							and wt.id in
									(
									select
										max(id)
									from
										i_collect.dbo.work_task_log
									group by
										r_debt_id
									)
						group by
							wt.r_debt_id
						)

		end

	else if @n = 64 --удаляем рабочие телефоны с учетом часового пояса !> 17
		begin
		
			UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5064249944]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5064249944]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

		end

	else if @n = 65 -- удаляем долги с обещаниями
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5064249944]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id
						)	
		end
	
--</district_6>
----------------------------------------------------------------------
--<district_7>
	else if @n = 7 --конъюнктура
		begin
		if OBJECT_ID('tmp_campaign_7') is not null
			drop table tmp_campaign_7

			;select * into tmp_campaign_7 from [INFINITY2].[Cx_Work].[public].[Table_5068758013]
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5068758013]
			;insert into [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				(
				[ID] ,
				[State] ,
				[ID_долга] ,
				[Банк] ,
				[Фамилия] ,
				[Имя] ,
				[Отчество] ,
				[Остаток_долга] ,
				[Часовой_пояс] ,
				[ПерсональныйОператор] ,
				[Телефон_для_перезвона] ,
				[Дата_перезвона] ,
				[Телефон1] ,
				[Телефон2] ,
				[Телефон3] ,
				[Телефон4] ,
				[Телефон5] ,
				[Телефон6] ,
				[Телефон7] ,
				[Телефон8] ,
				[Телефон9] ,
				[Телефон10] ,
				[Телефон11] ,
				[Телефон12] ,
				[Телефон13] ,
				[Телефон14] ,
				[Телефон15] 
				)
			select
				tc7.*
			from
				tmp_campaign_7 tc7
				left join
						(
						select
							cl.r_debt_id
							,cl.dt
						from
							i_collect.dbo.contact_log cl
						where
							cl.typ = 1
							and cl.id in
									(
									select
										max(id)
									from
										i_collect.dbo.contact_log
									group by
										r_debt_id
									)		
						group by
							cl.r_debt_id
							,cl.dt
			
						)cl on cl.r_debt_id = d.id
			order by
				cl.dt asc

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5068758013]
			where
				 [ID] in
							(
							select
								d.id
							from
								i_collect.dbo.debt d
							where
								d.status in (6,7,8,10)
							group by
								d.id
							)
				or [ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)
			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [State] = null
				where [State] is not null

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5068758013]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

			;delete from [INFINITY2].[Cx_Work].[public].[Table_5068758013]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id

						)
		end
		
	else if @n = 71 --сортировка
		begin
		if OBJECT_ID('tmp_campaign_71') is not null
			drop table tmp_campaign_71
				select * into tmp_campaign_71 from [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				;delete from [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				;insert into [INFINITY2].[Cx_Work].[public].[Table_5068758013]
					(
					[ID] ,
					[State] ,
					[ID_долга] ,
					[Банк] ,
					[Фамилия] ,
					[Имя] ,
					[Отчество] ,
					[Остаток_долга] ,
					[Часовой_пояс] ,
					[ПерсональныйОператор] ,
					[Телефон_для_перезвона] ,
					[Дата_перезвона] ,
					[Телефон1] ,
					[Телефон2] ,
					[Телефон3] ,
					[Телефон4] ,
					[Телефон5] ,
					[Телефон6] ,
					[Телефон7] ,
					[Телефон8] ,
					[Телефон9] ,
					[Телефон10] ,
					[Телефон11] ,
					[Телефон12] ,
					[Телефон13] ,
					[Телефон14] ,
					[Телефон15] 
					)
				select
					tc71.*
				from
					tmp_campaign_71 tc71
					left join
							(
							select
								cl.r_debt_id
								,cl.dt
							from
								i_collect.dbo.contact_log cl
							where
								cl.typ = 1
								and cl.id in
										(
										select
											max(id)
										from
											i_collect.dbo.contact_log
										group by
											r_debt_id
										)		
							group by
								cl.r_debt_id
								,cl.dt
			
							)cl on 
								cl.r_debt_id = tc71.[ID]
				order by
					cl.dt asc

			--<очистка состояния>			
				;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
					set [State] = null
					where [State] is not null
			--</очистка состояния>
		end

	else if @n = 72 --удаляем закрытые дела
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5068758013]
			where
				 [ID] in
						(
						select
							d.id
						from
							i_collect.dbo.debt d
						where
							d.status in (6,7,8,10)
						group by
							d.id
						)

		end

	else if @n = 73 --удаляем закрепленные
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5068758013]
			where
				[ID] in
						(
						select
							wt.r_debt_id
						from
							i_collect.dbo.work_task_log as wt
							left join i_collect.dbo.users as u on wt.r_user_id = u.id
						where
							u.id not in (1604, -1)										
							and wt.id in 
									(
									select
										max(id)
									from
										i_collect.dbo.work_task_log
									group by
										r_debt_id
									)
						group by
							wt.r_debt_id
						)

		end

	else if @n = 74 --удаляем рабочие телефоны с учетом часового пояса !> 17
		begin
		
			UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)


			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5068758013]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5068758013]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

		end

	else if @n = 75 --удаляем долги с обещаниями
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5068758013]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id

						)
		end
			
--</district_7>
----------------------------------------------------------------------
--<district_8>
	else if @n = 8 --конъюнктура
		begin
		if OBJECT_ID('tmp_campaign_8') is not null
			drop table tmp_campaign_8

			;select * into tmp_campaign_8 from [INFINITY2].[Cx_Work].[public].[Table_5336960870]
			;delete from [INFINITY2].[Cx_Work].[public].[Table_5336960870]
			;insert into [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				(
				[ID] ,
				[State] ,
				[ID_долга] ,
				[Банк] ,
				[Фамилия] ,
				[Имя] ,
				[Отчество] ,
				[Телефон1] ,
				[Телефон2] ,
				[Телефон3] ,
				[Телефон4] ,
				[Телефон5] ,
				[Телефон6] ,
				[Телефон7] ,
				[Телефон8] ,
				[Телефон9] ,
				[Телефон10] ,
				[Телефон11] ,
				[Телефон12] ,
				[Телефон13] ,
				[Телефон14] ,
				[Телефон15] ,
				[Остаток_долга] ,
				[Дата_перезвона],
				[Часовой_пояс] ,
				[Телефон_для_перезвона] ,
				[ПерсональныйОператор] 
				)
			select
				tc8.*
			from
				tmp_campaign_8 tc8
				left join
						(
						select
							cl.r_debt_id
							,cl.dt
						from
							i_collect.dbo.contact_log cl
						where
							cl.typ = 1
							and cl.id in
									(
									select
										max(id)
									from
										i_collect.dbo.contact_log
									group by
										r_debt_id
									)		
						group by
							cl.r_debt_id
							,cl.dt
			
						)cl 
							on cl.r_debt_id = tc8.[ID]
			order by
				cl.dt asc

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5336960870]
			where
				 [ID] in
							(
							select
								d.id
							from
								i_collect.dbo.debt d
							where
								d.status in (6,7,8,10)
							group by
								d.id
							)
				or [ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [State] = null
				where [State] is not null
		
			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5336960870]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

			;delete from [INFINITY2].[Cx_Work].[public].[Table_5336960870]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id

						)
		end
		

	else if @n = 81 --сортировка
		begin
		if OBJECT_ID('tmp_campaign_81') is not null
			drop table tmp_campaign_81
				select * into tmp_campaign_81 from [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				;delete from [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				;insert into [INFINITY2].[Cx_Work].[public].[Table_5336960870]
					(
					[ID] ,
					[State] ,
					[ID_долга] ,
					[Банк] ,
					[Фамилия] ,
					[Имя] ,
					[Отчество] ,
					[Телефон1] ,
					[Телефон2] ,
					[Телефон3] ,
					[Телефон4] ,
					[Телефон5] ,
					[Телефон6] ,
					[Телефон7] ,
					[Телефон8] ,
					[Телефон9] ,
					[Телефон10] ,
					[Телефон11] ,
					[Телефон12] ,
					[Телефон13] ,
					[Телефон14] ,
					[Телефон15] ,
					[Остаток_долга] ,
					[Дата_перезвона],
					[Часовой_пояс],
					[Телефон_для_перезвона],
					[ПерсональныйОператор]
					)
				select
					tc81.*
				from
					tmp_campaign_81 tc81
					left join
							(
							select
								cl.r_debt_id
								,cl.dt
							from
								i_collect.dbo.contact_log cl
							where
								cl.typ = 1
								and cl.id in
										(
										select
											max(id)
										from
											i_collect.dbo.contact_log
										group by
											r_debt_id
										)		
							group by
								cl.r_debt_id
								,cl.dt
			
							)cl 
								on cl.r_debt_id = tc81.[ID]
				order by
					cl.dt asc

			--<очистка состояния>			
				;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
					set [State] = null
					where [State] is not null
			--</очистка состояния>
		end

	else if @n = 82 --удаляем закрытые дела
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5336960870]
			where
				 [ID] in
						(
						select
							d.id
						from
							i_collect.dbo.debt d
						where
							d.status in (6,7,8,10)
						group by
							d.id
						)

		end

	else if @n = 83 --удаляем закрепленные
		begin

			delete from [INFINITY2].[Cx_Work].[public].[Table_5336960870]
			where
				[ID] in
							(
							select
								wt.r_debt_id
							from
								i_collect.dbo.work_task_log as wt
								left join i_collect.dbo.users as u on wt.r_user_id = u.id
							where
								u.id not in (1604, -1)										
								and wt.id in 
										(
										select
											max(id)
										from
											i_collect.dbo.work_task_log
										group by
											r_debt_id
										)
							group by
								wt.r_debt_id
							)

		end

	else if @n = 84 --удаляем рабочие телефоны с учетом часового пояса !> 17
		begin
		
			UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон1] = null
				where [Телефон1] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон2] = null
				where [Телефон2] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон3] = null
				where [Телефон3] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон4] = null
				where [Телефон4] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон5] = null
				where [Телефон5] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон6] = null
				where [Телефон6] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон7] = null
				where [Телефон7] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон8] = null
				where [Телефон8] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон9] = null
				where [Телефон9] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон10] = null
				where [Телефон10] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон11] = null
				where [Телефон11] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон12] = null
				where [Телефон12] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон13] = null
				where [Телефон13] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон14] = null
				where [Телефон14] in (select number from @phone)

			;UPDATE [INFINITY2].[Cx_Work].[public].[Table_5336960870]
				set [Телефон15] = null
				where [Телефон15] in (select number from @phone)

			;delete from 
				[INFINITY2].[Cx_Work].[public].[Table_5336960870]
			where 
				[Телефон1] is null
				and [Телефон2] is null
				and [Телефон3] is null
				and [Телефон4] is null
				and [Телефон5] is null
				and [Телефон6] is null
				and [Телефон7] is null
				and [Телефон8] is null
				and [Телефон9] is null
				and [Телефон10] is null 
				and [Телефон11] is null
				and [Телефон12] is null
				and [Телефон13] is null
				and [Телефон14] is null
				and [Телефон15] is null

		end

	else if @n = 85 --удаляем долги с обещаниями
		begin
			delete from [INFINITY2].[Cx_Work].[public].[Table_5336960870]
			where
				[ID] in
						(
						select
							dp.parent_id
						from
							i_collect.dbo.debt_promise dp
						where
							dp.prom_date > getdate()
						group by
							dp.parent_id

						)
		end
			
--</district_8>
----------------------------------------------------------------------
set nocount off
END
GO

