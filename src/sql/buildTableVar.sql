DECLARE @<%= name %> table
(
    value <%= type %>
)
DECLARE @<%= name %>_item varchar(800), @<%= name %>_pos int

SET @<%= name %>_list = LTRIM(RTRIM(@<%= name %>_list))+ ','
SET @<%= name %>_pos = CHARINDEX(',', @<%= name %>_list, 1)

WHILE @<%= name %>_pos > 0
    BEGIN
        SET @<%= name %>_item = LTRIM(RTRIM(LEFT(@<%= name %>_list, @<%= name %>_pos - 1)))
        IF @<%= name %>_item <> ''
        BEGIN
            INSERT INTO @<%= name %> (value)
            VALUES (CAST(@<%= name %>_item AS <%= type %>))
        END
        SET @<%= name %>_list = RIGHT(@<%= name %>_list, LEN(@<%= name %>_list) - @<%= name %>_pos)
        SET @<%= name %>_pos = CHARINDEX(',', @<%= name %>_list, 1)
    END
