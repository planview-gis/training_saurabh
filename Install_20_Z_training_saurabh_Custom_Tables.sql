/* ------------------------------------------------------------------
-- Modified By   : sjaffer
-- Modified Date : 2023-09-06 [yyyy-MM-dd]
-- Change History:
-- 2023-01-23   - Initial table configuration 
-- 2023-09-06   - Cleaned up single line comments
------------------------------------------------------------------ */


IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'@(db_path)pi_Z_training_saurabh') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE @(db_path)pi_Z_training_saurabh_staging (
	SRC_REC_ID 	[bigint] NULL,
	[run_id] [bigint] NULL,
	[src_row] [varchar](max) NULL,
	[RECORD] BIGINT NOT NULL IDENTITY(1,1),
	[CUTOFF_TO_BE] [varchar](max),
	[ON_OR_AFTER] [varchar] (max),
	[BEFORE_OR_UNTIL] [varchar] (max),
	[UPDT_ON] [datetime] DEFAULT GETDATE()
)


/* Index for interface staging table */
CREATE NONCLUSTERED INDEX pi_idx_run_id ON @(db_path)pi_abcd_if00export_staging
(
	[run_id] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

