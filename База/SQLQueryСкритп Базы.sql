USE Propusk

go

/*  * TABLE: Discipl  */

CREATE TABLE Discipl(

    N_Discipl       int         NOT NULL,

    Naim_discipl    char(64)    NULL,

    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (N_Discipl)

)

go


IF OBJECT_ID('Discipl') IS NOT NULL

    PRINT '<<< CREATED TABLE Discipl >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Discipl >>>'

go


/*  * TABLE: Gruppa  */

CREATE TABLE Gruppa(

    N_Grupp       int          NOT NULL,

    N_Special     int          NOT NULL,

    Kurs          int          NULL,

    Naim_grupp    char(16)     NULL,

    Soc_ped       char(150)    NULL,

    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (N_Grupp)

)

go


IF OBJECT_ID('Gruppa') IS NOT NULL

    PRINT '<<< CREATED TABLE Gruppa >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Gruppa >>>'

go

/* * TABLE: Nagruzka  */

CREATE TABLE Nagruzka(

    N_Nagruzka      int     NOT NULL,

    N_Prepodavat    int     NOT NULL,

    N_Grupp         int     NOT NULL,

    Data_n          date    NULL,

    N_Discipl       int     NOT NULL,

    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (N_Nagruzka)

)

go


IF OBJECT_ID('Nagruzka') IS NOT NULL

    PRINT '<<< CREATED TABLE Nagruzka >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Nagruzka >>>'

go

/* * TABLE: Prepodavat  */

CREATE TABLE Prepodavat(

    N_Prepodavat    int          NOT NULL,

    FIO             char(150)    NULL,

    Pass            char(8)      NULL,

    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (N_Prepodavat)

)

go


IF OBJECT_ID('Prepodavat') IS NOT NULL

    PRINT '<<< CREATED TABLE Prepodavat >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Prepodavat >>>'

go


/* * TABLE: Propusk  */

CREATE TABLE Propusk(

    N_Propuska      int         NOT NULL,

    N_Nagruzka      int         NOT NULL,

    N_Student       int         NOT NULL,

    Data_I          date        NULL,

    Prichina        char(90)    NULL,

    Progul_chasi    int         NULL,

    Oprav_dok       int         NULL,

    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (N_Propuska)

)

go







IF OBJECT_ID('Propusk') IS NOT NULL

    PRINT '<<< CREATED TABLE Propusk >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Propusk >>>'

go

/*  * TABLE: Special  */

CREATE TABLE Special(

    N_Special       int          NOT NULL,

    Shifr           int          NULL,

    Naim_special    char(255)    NULL,

    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (N_Special)

)

go


IF OBJECT_ID('Special') IS NOT NULL

    PRINT '<<< CREATED TABLE Special >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Special >>>'

go

/*  * TABLE: Student  */

CREATE TABLE Student(

    N_Student       int          NOT NULL,

    N_Grupp         int          NOT NULL,

    FIO_Studenta    char(150)    NULL,

    Data_Vip        date         NULL,

    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (N_Student)

)

go


IF OBJECT_ID('Student') IS NOT NULL

    PRINT '<<< CREATED TABLE Student >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Student >>>'

go

/* * INDEX: Ref115 */

CREATE INDEX Ref115 ON Gruppa(N_Special)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Gruppa') AND name='Ref115')

    PRINT '<<< CREATED INDEX Gruppa.Ref115 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Gruppa.Ref115 >>>'

go

/*  * INDEX: Ref317  */

CREATE INDEX Ref317 ON Nagruzka(N_Prepodavat)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Nagruzka') AND name='Ref317')

    PRINT '<<< CREATED INDEX Nagruzka.Ref317 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Nagruzka.Ref317 >>>'

go

/*  * INDEX: Ref418  */

CREATE INDEX Ref418 ON Nagruzka(N_Grupp)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Nagruzka') AND name='Ref418')

    PRINT '<<< CREATED INDEX Nagruzka.Ref418 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Nagruzka.Ref418 >>>'

go

/*  * INDEX: Ref219  */

CREATE INDEX Ref219 ON Nagruzka(N_Discipl)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Nagruzka') AND name='Ref219')

    PRINT '<<< CREATED INDEX Nagruzka.Ref219 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Nagruzka.Ref219 >>>'

go

/* * INDEX: Ref520 */

CREATE INDEX Ref520 ON Propusk(N_Nagruzka)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Propusk') AND name='Ref520')

    PRINT '<<< CREATED INDEX Propusk.Ref520 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Propusk.Ref520 >>>'

go



/*  * INDEX: Ref621  */

CREATE INDEX Ref621 ON Propusk(N_Student)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Propusk') AND name='Ref621')

    PRINT '<<< CREATED INDEX Propusk.Ref621 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Propusk.Ref621 >>>'

go

/*  * INDEX: Ref416 */

CREATE INDEX Ref416 ON Student(N_Grupp)

go

IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Student') AND name='Ref416')

    PRINT '<<< CREATED INDEX Student.Ref416 >>>'

ELSE

    PRINT '<<< FAILED CREATING INDEX Student.Ref416 >>>'

go

/* * TABLE: Gruppa */

ALTER TABLE Gruppa ADD CONSTRAINT RefSpecial15 

    FOREIGN KEY (N_Special)

    REFERENCES Special(N_Special) ON DELETE CASCADE ON UPDATE CASCADE

go

/* * TABLE: Nagruzka */

ALTER TABLE Nagruzka ADD CONSTRAINT RefPrepodavat17 

    FOREIGN KEY (N_Prepodavat)

    REFERENCES Prepodavat(N_Prepodavat) ON DELETE CASCADE ON UPDATE CASCADE

go



ALTER TABLE Nagruzka ADD CONSTRAINT RefGruppa18 

    FOREIGN KEY (N_Grupp)

    REFERENCES Gruppa(N_Grupp) ON DELETE CASCADE ON UPDATE CASCADE

go



ALTER TABLE Nagruzka ADD CONSTRAINT RefDiscipl19 

    FOREIGN KEY (N_Discipl)

    REFERENCES Discipl(N_Discipl) ON UPDATE CASCADE

go

/* * TABLE: Propusk  */


ALTER TABLE Propusk ADD CONSTRAINT RefNagruzka20 

    FOREIGN KEY (N_Nagruzka)

    REFERENCES Nagruzka(N_Nagruzka) ON DELETE CASCADE ON UPDATE CASCADE

go



ALTER TABLE Propusk ADD CONSTRAINT RefStudent21 

    FOREIGN KEY (N_Student)

    REFERENCES Student(N_Student) ON DELETE CASCADE ON UPDATE CASCADE

go


/* * TABLE: Student  */

ALTER TABLE Student ADD CONSTRAINT RefGruppa16 

    FOREIGN KEY (N_Grupp)

    REFERENCES Gruppa(N_Grupp) ON DELETE CASCADE ON UPDATE CASCADE

go

