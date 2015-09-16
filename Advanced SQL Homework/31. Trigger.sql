USE SoftUni
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trMyTrigger]
ON [dbo].[WorkHours]
AFTER INSERT, UPDATE, DELETE
NOT FOR REPLICATION
AS
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with caller queries select statements.
    -- if an update/insert/delete occurs on the main table, the number of records affected
    -- should only be based on that table and not what records the triggers may/may not
    -- select.
SET NOCOUNT ON;

    -- Determine if this is an insert,update, or delete action

    DECLARE @action AS CHAR(1)
    DECLARE @count AS INT
    SET @action = 'I' -- SET action to 'I'NSERT by default.
    SELECT @count = count(*) FROM DELETED
    IF @count > 0
        BEGIN
            SET @action= 'D' -- SET action to 'D'ELETED.
            SELECT @count = count(*) FROM INSERTED
            IF @count > 0
                SET @action = 'U' -- SET action to 'U'PDATED.
        END

    IF @action = 'D'
        -- THIS IS A DELETE RECORD ACTION
        BEGIN
            INSERT INTO WorkHoursLogs
        SELECT *,GETDATE() AS changeDate, 'DELETE' AS task FROM DELETED
        END
    ELSE
        BEGIN
            IF @action = 'I'
                 -- this is an INSERT record action
                BEGIN
                    INSERT INTO WorkHoursLogs
                    SELECT *,GETDATE() AS changeDate, 'INSERT' as task FROM INSERTED
                END
             ELSE
                -- this is an UPDATE record action
                BEGIN
                    INSERT INTO WorkHoursLogs
                    SELECT *,GETDATE() AS changeDate, 'UPDATE' as task  FROM INSERTED
                END
        END