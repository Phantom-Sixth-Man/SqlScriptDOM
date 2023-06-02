﻿CREATE TABLE table1 (
    a INT INDEX idx1 NONCLUSTERED WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY = ON),
    b INT INDEX idx2 NONCLUSTERED WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF),
    INDEX idx_pk CLUSTERED (a, b) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY = ON)
);

CREATE TABLE table1 (
    a INT PRIMARY KEY WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY = ON),
    b INT UNIQUE WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY = ON),
    c INT UNIQUE WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
);

CREATE TABLE table1 (
    a INT,
    b INT,
    c INT,
    d INT,
    CONSTRAINT pk PRIMARY KEY (a, b) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY = ON),
    CONSTRAINT uq_c UNIQUE NONCLUSTERED (c) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY = ON),
    CONSTRAINT uq_d UNIQUE NONCLUSTERED (d) WITH (OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF)
);

CREATE TABLE T1 (
    C1 INT NOT NULL,
    C2 INT NOT NULL,
    C3 INT NULL,
    INDEX idx NONCLUSTERED (C1) INCLUDE (C2, C3)
);

CREATE TABLE T2 (
    C1 INT NOT NULL,
    C2 INT NOT NULL,
    C3 INT NULL,
    INDEX idx (C1) INCLUDE (C2, C3)
);

CREATE TABLE myTable1_HASH_MCD (
    id       INT          NOT NULL,
    lastName VARCHAR (20),
    zipCode  VARCHAR (6) 
)
WITH (DISTRIBUTION = HASH(id, lastName));


GO
CREATE TABLE myTable2_HEAP_HASH_MCD (
    id       INT          NOT NULL,
    lastName VARCHAR (20),
    zipCode  VARCHAR (6) 
)
WITH (DISTRIBUTION = HASH(id, lastName, zipCode), HEAP);


GO
CREATE TABLE myTable3_CI_HASH_MCD (
    id       INT          NOT NULL,
    lastName VARCHAR (20),
    zipCode  VARCHAR (6) 
)
WITH (DISTRIBUTION = HASH(id, lastName), CLUSTERED INDEX(zipCode));


GO
CREATE TABLE myTable4_CCI_HASH_MCD (
    [id]       INT          NOT NULL,
    [lastName] VARCHAR (20) NULL,
    [zipCode]  VARCHAR (6)  NULL
)
WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([id], [lastName], [zipCode]));