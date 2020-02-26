--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: concrete_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concrete_methods (
    id integer NOT NULL,
    package character varying(255),
    name character varying(255),
    parameters character varying(255)[],
    return_values character varying(255)[],
    receiver_name character varying(255),
    receiver_id integer
);


ALTER TABLE public.concrete_methods OWNER TO postgres;

--
-- Name: concrete_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.concrete_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concrete_methods_id_seq OWNER TO postgres;

--
-- Name: concrete_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concrete_methods_id_seq OWNED BY public.concrete_methods.id;


--
-- Name: concrete_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.concrete_types (
    id integer NOT NULL,
    package character varying(255),
    name character varying(255),
    basetype character varying(255)
);


ALTER TABLE public.concrete_types OWNER TO postgres;

--
-- Name: concrete_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.concrete_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.concrete_types_id_seq OWNER TO postgres;

--
-- Name: concrete_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.concrete_types_id_seq OWNED BY public.concrete_types.id;


--
-- Name: interface_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interface_methods (
    id integer NOT NULL,
    package character varying(255),
    name character varying(255),
    parameters character varying(255)[],
    return_values character varying(255)[],
    receiver_name character varying(255),
    receiver_id integer
);


ALTER TABLE public.interface_methods OWNER TO postgres;

--
-- Name: interface_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interface_methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interface_methods_id_seq OWNER TO postgres;

--
-- Name: interface_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interface_methods_id_seq OWNED BY public.interface_methods.id;


--
-- Name: interfaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interfaces (
    id integer NOT NULL,
    package character varying(255),
    name character varying(255),
    implementable boolean
);


ALTER TABLE public.interfaces OWNER TO postgres;

--
-- Name: interfaces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interfaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interfaces_id_seq OWNER TO postgres;

--
-- Name: interfaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interfaces_id_seq OWNED BY public.interfaces.id;


--
-- Name: concrete_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concrete_methods ALTER COLUMN id SET DEFAULT nextval('public.concrete_methods_id_seq'::regclass);


--
-- Name: concrete_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concrete_types ALTER COLUMN id SET DEFAULT nextval('public.concrete_types_id_seq'::regclass);


--
-- Name: interface_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interface_methods ALTER COLUMN id SET DEFAULT nextval('public.interface_methods_id_seq'::regclass);


--
-- Name: interfaces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interfaces ALTER COLUMN id SET DEFAULT nextval('public.interfaces_id_seq'::regclass);


--
-- Data for Name: concrete_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concrete_methods (id, package, name, parameters, return_values, receiver_name, receiver_id) FROM stdin;
1	tar	FileInfo	{}	{os.FileInfo}	*Header	1
2	tar	String	{}	{string}	Format	2
3	tar	Next	{}	{*tar.Header,error}	*Reader	3
4	tar	Read	{[]byte}	{int,error}	*Reader	3
5	tar	Flush	{}	{error}	*Writer	4
6	tar	WriteHeader	{*tar.Header}	{error}	*Writer	4
7	tar	Write	{[]byte}	{int,error}	*Writer	4
8	tar	Close	{}	{error}	*Writer	4
9	zip	RegisterDecompressor	{uint16,zip.Decompressor}	{}	*Reader	5
10	zip	Close	{}	{error}	*ReadCloser	6
11	zip	DataOffset	{}	{int64,error}	*File	7
12	zip	Open	{}	{io.ReadCloser,error}	*File	7
13	zip	FileInfo	{}	{os.FileInfo}	*FileHeader	10
14	zip	ModTime	{}	{time.Time}	*FileHeader	10
15	zip	SetModTime	{time.Time}	{}	*FileHeader	10
16	zip	Mode	{}	{os.FileMode}	*FileHeader	10
17	zip	SetMode	{os.FileMode}	{}	*FileHeader	10
18	zip	SetOffset	{int64}	{}	*Writer	11
19	zip	Flush	{}	{error}	*Writer	11
20	zip	SetComment	{string}	{error}	*Writer	11
21	zip	Close	{}	{error}	*Writer	11
22	zip	Create	{string}	{io.Writer,error}	*Writer	11
23	zip	CreateHeader	{*zip.FileHeader}	{io.Writer,error}	*Writer	11
24	zip	RegisterCompressor	{uint16,zip.Compressor}	{}	*Writer	11
25	bufio	Size	{}	{int}	*Reader	12
26	bufio	Reset	{io.Reader}	{}	*Reader	12
27	bufio	Peek	{int}	{[]byte,error}	*Reader	12
28	bufio	Discard	{int}	{int,error}	*Reader	12
29	bufio	Read	{[]byte}	{int,error}	*Reader	12
30	bufio	ReadByte	{}	{byte,error}	*Reader	12
31	bufio	UnreadByte	{}	{error}	*Reader	12
32	bufio	ReadRune	{}	{rune,int,error}	*Reader	12
33	bufio	UnreadRune	{}	{error}	*Reader	12
34	bufio	Buffered	{}	{int}	*Reader	12
35	bufio	ReadSlice	{byte}	{[]byte,error}	*Reader	12
36	bufio	ReadLine	{}	{[]byte,bool,error}	*Reader	12
37	bufio	ReadBytes	{byte}	{[]byte,error}	*Reader	12
38	bufio	ReadString	{byte}	{string,error}	*Reader	12
39	bufio	WriteTo	{io.Writer}	{int64,error}	*Reader	12
40	bufio	Size	{}	{int}	*Writer	13
41	bufio	Reset	{io.Writer}	{}	*Writer	13
42	bufio	Flush	{}	{error}	*Writer	13
43	bufio	Available	{}	{int}	*Writer	13
44	bufio	Buffered	{}	{int}	*Writer	13
45	bufio	Write	{[]byte}	{int,error}	*Writer	13
46	bufio	WriteByte	{byte}	{error}	*Writer	13
47	bufio	WriteRune	{rune}	{int,error}	*Writer	13
48	bufio	WriteString	{string}	{int,error}	*Writer	13
49	bufio	ReadFrom	{io.Reader}	{int64,error}	*Writer	13
50	bufio	Err	{}	{error}	*Scanner	15
51	bufio	Bytes	{}	{[]byte}	*Scanner	15
52	bufio	Text	{}	{string}	*Scanner	15
53	bufio	Scan	{}	{bool}	*Scanner	15
54	bufio	Buffer	{[]byte,int}	{}	*Scanner	15
55	bufio	Split	{bufio.SplitFunc}	{}	*Scanner	15
56	bytes	Bytes	{}	{[]byte}	*Buffer	22
57	bytes	String	{}	{string}	*Buffer	22
58	bytes	Len	{}	{int}	*Buffer	22
59	bytes	Cap	{}	{int}	*Buffer	22
60	bytes	Truncate	{int}	{}	*Buffer	22
61	bytes	Reset	{}	{}	*Buffer	22
62	bytes	Grow	{int}	{}	*Buffer	22
63	bytes	Write	{[]byte}	{int,error}	*Buffer	22
64	bytes	WriteString	{string}	{int,error}	*Buffer	22
65	bytes	ReadFrom	{io.Reader}	{int64,error}	*Buffer	22
66	bytes	WriteTo	{io.Writer}	{int64,error}	*Buffer	22
67	bytes	WriteByte	{byte}	{error}	*Buffer	22
68	bytes	WriteRune	{rune}	{int,error}	*Buffer	22
69	bytes	Read	{[]byte}	{int,error}	*Buffer	22
70	bytes	Next	{int}	{[]byte}	*Buffer	22
71	bytes	ReadByte	{}	{byte,error}	*Buffer	22
72	bytes	ReadRune	{}	{rune,int,error}	*Buffer	22
73	bytes	UnreadRune	{}	{error}	*Buffer	22
74	bytes	UnreadByte	{}	{error}	*Buffer	22
75	bytes	ReadBytes	{byte}	{[]byte,error}	*Buffer	22
76	bytes	ReadString	{byte}	{string,error}	*Buffer	22
77	bytes	Len	{}	{int}	*Reader	23
78	bytes	Size	{}	{int64}	*Reader	23
79	bytes	Read	{[]byte}	{int,error}	*Reader	23
80	bytes	ReadAt	{[]byte,int64}	{int,error}	*Reader	23
81	bytes	ReadByte	{}	{byte,error}	*Reader	23
82	bytes	UnreadByte	{}	{error}	*Reader	23
83	bytes	ReadRune	{}	{rune,int,error}	*Reader	23
84	bytes	UnreadRune	{}	{error}	*Reader	23
85	bytes	Seek	{int64,int}	{int64,error}	*Reader	23
86	bytes	WriteTo	{io.Writer}	{int64,error}	*Reader	23
87	bytes	Reset	{[]byte}	{}	*Reader	23
88	main	Features	{}	{[]string}	*Walker	24
89	main	Import	{string}	{*types.Package,error}	*Walker	24
90	main	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}	*Walker	24
91	p1	StructValueMethod	{}	{}	S	28
92	p1	StructValueMethodNamedRecv	{}	{}	S	28
93	p1	SMethod	{int8,int16,int64}	{}	*S2	31
94	p1	JustOnT	{}	{}	*T	39
95	p1	JustOnB	{}	{}	*B	40
96	p1	OnEmbedded	{}	{}	*Embedded	44
97	p3	GoodPlayer	{}	{int}	*ThirdBase	48
98	asm	Parse	{}	{*obj.Prog,bool}	*Parser	50
99	asm	ParseSymABIs	{io.Writer}	{bool}	*Parser	50
100	flags	String	{}	{string}	*MultiFlag	52
101	flags	Set	{string}	{error}	*MultiFlag	52
102	lex	Error	{"...interface{}"}	{}	*Input	53
103	lex	Next	{}	{lex.ScanToken}	*Input	53
104	lex	Text	{}	{string}	*Input	53
105	lex	Push	{lex.TokenReader}	{}	*Input	53
106	lex	Close	{}	{}	*Input	53
107	lex	String	{}	{string}	ScanToken	54
108	lex	String	{}	{string}	Token	56
109	lex	Next	{}	{lex.ScanToken}	*Slice	58
110	lex	Text	{}	{string}	*Slice	58
111	lex	File	{}	{string}	*Slice	58
112	lex	Base	{}	{*src.PosBase}	*Slice	58
113	lex	SetBase	{*src.PosBase}	{}	*Slice	58
114	lex	Line	{}	{int}	*Slice	58
115	lex	Col	{}	{int}	*Slice	58
116	lex	Close	{}	{}	*Slice	58
117	lex	Push	{lex.TokenReader}	{}	*Stack	59
118	lex	Next	{}	{lex.ScanToken}	*Stack	59
119	lex	Text	{}	{string}	*Stack	59
120	lex	File	{}	{string}	*Stack	59
121	lex	Base	{}	{*src.PosBase}	*Stack	59
122	lex	SetBase	{*src.PosBase}	{}	*Stack	59
123	lex	Line	{}	{int}	*Stack	59
124	lex	Col	{}	{int}	*Stack	59
125	lex	Close	{}	{}	*Stack	59
126	lex	Text	{}	{string}	*Tokenizer	60
127	lex	File	{}	{string}	*Tokenizer	60
128	lex	Base	{}	{*src.PosBase}	*Tokenizer	60
129	lex	SetBase	{*src.PosBase}	{}	*Tokenizer	60
130	lex	Line	{}	{int}	*Tokenizer	60
131	lex	Col	{}	{int}	*Tokenizer	60
132	lex	Next	{}	{lex.ScanToken}	*Tokenizer	60
133	lex	Close	{}	{}	*Tokenizer	60
134	main	Translate	{*main.File}	{}	*Package	61
135	main	Record	{*main.File}	{}	*Package	61
136	main	Fatalf	{string,"...interface{}"}	{}	*Package	61
137	main	Printf	{string,"...interface{}"}	{}	*Package	61
138	main	ParseGo	{string,[]byte}	{}	*File	62
139	main	DiscardCgoDirectives	{}	{}	*File	62
140	main	Visit	{ast.Node}	{ast.Visitor}	*File	62
141	main	Pos	{}	{token.Pos}	*Ref	64
142	main	IsVar	{}	{bool}	*Name	65
143	main	IsConst	{}	{bool}	*Name	65
144	main	String	{}	{string}	*TypeRepr	67
145	main	Empty	{}	{bool}	*TypeRepr	67
146	main	Set	{string,"...interface{}"}	{}	*TypeRepr	67
147	gc	Ctype	{}	{gc.Ctype}	Val	72
148	gc	Interface	{}	{"interface{}"}	Val	72
149	gc	Format	{fmt.State,rune}	{}	Val	72
150	gc	String	{}	{string}	Class	83
151	gc	NewProg	{}	{*obj.Prog}	*Progs	85
152	gc	Flush	{}	{}	*Progs	85
153	gc	Free	{}	{}	*Progs	85
154	gc	Prog	{obj.As}	{*obj.Prog}	*Progs	85
155	gc	Appendpp	{*obj.Prog,obj.As,obj.AddrType,int16,int64,obj.AddrType,int16,int64}	{*obj.Prog}	*Progs	85
156	gc	SetInt	{*gc.Mpint}	{}	*Mpflt	89
157	gc	Set	{*gc.Mpflt}	{}	*Mpflt	89
158	gc	Add	{*gc.Mpflt}	{}	*Mpflt	89
159	gc	AddFloat64	{float64}	{}	*Mpflt	89
160	gc	Sub	{*gc.Mpflt}	{}	*Mpflt	89
161	gc	Mul	{*gc.Mpflt}	{}	*Mpflt	89
162	gc	MulFloat64	{float64}	{}	*Mpflt	89
163	gc	Quo	{*gc.Mpflt}	{}	*Mpflt	89
164	gc	Cmp	{*gc.Mpflt}	{int}	*Mpflt	89
165	gc	CmpFloat64	{float64}	{int}	*Mpflt	89
166	gc	Float64	{}	{float64}	*Mpflt	89
167	gc	Float32	{}	{float64}	*Mpflt	89
168	gc	SetFloat64	{float64}	{}	*Mpflt	89
169	gc	Neg	{}	{}	*Mpflt	89
170	gc	SetString	{string}	{}	*Mpflt	89
171	gc	String	{}	{string}	*Mpflt	89
172	gc	GoString	{}	{string}	*Mpflt	89
173	gc	Mul	{*gc.Mpcplx}	{}	*Mpcplx	90
174	gc	Div	{*gc.Mpcplx}	{bool}	*Mpcplx	90
175	gc	String	{}	{string}	*Mpcplx	90
176	gc	GoString	{}	{string}	*Mpcplx	90
177	gc	SetOverflow	{}	{}	*Mpint	91
178	gc	Set	{*gc.Mpint}	{}	*Mpint	91
179	gc	SetFloat	{*gc.Mpflt}	{bool}	*Mpint	91
180	gc	Add	{*gc.Mpint}	{}	*Mpint	91
181	gc	Sub	{*gc.Mpint}	{}	*Mpint	91
182	gc	Mul	{*gc.Mpint}	{}	*Mpint	91
183	gc	Quo	{*gc.Mpint}	{}	*Mpint	91
184	gc	Rem	{*gc.Mpint}	{}	*Mpint	91
185	gc	Or	{*gc.Mpint}	{}	*Mpint	91
186	gc	And	{*gc.Mpint}	{}	*Mpint	91
187	gc	AndNot	{*gc.Mpint}	{}	*Mpint	91
188	gc	Xor	{*gc.Mpint}	{}	*Mpint	91
189	gc	Lsh	{*gc.Mpint}	{}	*Mpint	91
190	gc	Rsh	{*gc.Mpint}	{}	*Mpint	91
191	gc	Cmp	{*gc.Mpint}	{int}	*Mpint	91
192	gc	CmpInt64	{int64}	{int}	*Mpint	91
193	gc	Neg	{}	{}	*Mpint	91
194	gc	Int64	{}	{int64}	*Mpint	91
195	gc	SetInt64	{int64}	{}	*Mpint	91
196	gc	SetString	{string}	{}	*Mpint	91
197	gc	GoString	{}	{string}	*Mpint	91
198	gc	String	{}	{string}	*Mpint	91
199	gc	Get	{*ssa.Value}	{gc.LivenessIndex}	LivenessMap	95
200	gc	Valid	{}	{bool}	LivenessIndex	96
201	gc	Prog	{obj.As}	{*obj.Prog}	*SSAGenState	103
202	gc	Pc	{}	{*obj.Prog}	*SSAGenState	103
203	gc	SetPos	{src.XPos}	{}	*SSAGenState	103
204	gc	Br	{obj.As,*ssa.Block}	{*obj.Prog}	*SSAGenState	103
205	gc	DebugFriendlySetPosFrom	{*ssa.Value}	{}	*SSAGenState	103
206	gc	FPJump	{*ssa.Block,*ssa.Block,*[][]gc.FloatingEQNEJump}	{}	*SSAGenState	103
207	gc	AddrScratch	{*obj.Addr}	{}	*SSAGenState	103
208	gc	Call	{*ssa.Value}	{*obj.Prog}	*SSAGenState	103
209	gc	PrepareCall	{*ssa.Value}	{}	*SSAGenState	103
210	gc	UseArgs	{int64}	{}	*SSAGenState	103
211	gc	Int64	{}	{int64}	*Node	108
212	gc	CanInt64	{}	{bool}	*Node	108
213	gc	Bool	{}	{bool}	*Node	108
214	gc	Format	{fmt.State,rune}	{}	*Node	108
215	gc	String	{}	{string}	*Node	108
216	gc	Typ	{}	{*types.Type}	*Node	108
217	gc	StorageClass	{}	{ssa.StorageClass}	*Node	108
218	gc	IsMethod	{}	{bool}	*Node	108
219	gc	SliceBounds	{}	{*gc.Node}	*Node	108
220	gc	SetSliceBounds	{*gc.Node,*gc.Node,*gc.Node}	{}	*Node	108
221	gc	ResetAux	{}	{}	*Node	108
222	gc	SubOp	{}	{gc.Op}	*Node	108
223	gc	SetSubOp	{gc.Op}	{}	*Node	108
224	gc	IndexMapLValue	{}	{bool}	*Node	108
225	gc	SetIndexMapLValue	{bool}	{}	*Node	108
226	gc	TChanDir	{}	{types.ChanDir}	*Node	108
227	gc	SetTChanDir	{types.ChanDir}	{}	*Node	108
228	gc	IsSynthetic	{}	{bool}	*Node	108
229	gc	IsAutoTmp	{}	{bool}	*Node	108
230	gc	Class	{}	{gc.Class}	*Node	108
231	gc	Walkdef	{}	{uint8}	*Node	108
232	gc	Typecheck	{}	{uint8}	*Node	108
233	gc	Initorder	{}	{uint8}	*Node	108
234	gc	HasBreak	{}	{bool}	*Node	108
235	gc	IsClosureVar	{}	{bool}	*Node	108
236	gc	NoInline	{}	{bool}	*Node	108
237	gc	IsOutputParamHeapAddr	{}	{bool}	*Node	108
238	gc	Assigned	{}	{bool}	*Node	108
239	gc	Addrtaken	{}	{bool}	*Node	108
240	gc	Implicit	{}	{bool}	*Node	108
241	gc	IsDDD	{}	{bool}	*Node	108
242	gc	Diag	{}	{bool}	*Node	108
243	gc	Colas	{}	{bool}	*Node	108
244	gc	NonNil	{}	{bool}	*Node	108
245	gc	Noescape	{}	{bool}	*Node	108
246	gc	Bounded	{}	{bool}	*Node	108
247	gc	Addable	{}	{bool}	*Node	108
248	gc	HasCall	{}	{bool}	*Node	108
249	gc	Likely	{}	{bool}	*Node	108
250	gc	HasVal	{}	{bool}	*Node	108
251	gc	HasOpt	{}	{bool}	*Node	108
252	gc	Embedded	{}	{bool}	*Node	108
253	gc	InlFormal	{}	{bool}	*Node	108
254	gc	InlLocal	{}	{bool}	*Node	108
255	gc	SetClass	{gc.Class}	{}	*Node	108
256	gc	SetWalkdef	{uint8}	{}	*Node	108
257	gc	SetTypecheck	{uint8}	{}	*Node	108
258	gc	SetInitorder	{uint8}	{}	*Node	108
259	gc	SetHasBreak	{bool}	{}	*Node	108
260	gc	SetIsClosureVar	{bool}	{}	*Node	108
261	gc	SetNoInline	{bool}	{}	*Node	108
262	gc	SetIsOutputParamHeapAddr	{bool}	{}	*Node	108
263	gc	SetAssigned	{bool}	{}	*Node	108
264	gc	SetAddrtaken	{bool}	{}	*Node	108
265	gc	SetImplicit	{bool}	{}	*Node	108
266	gc	SetIsDDD	{bool}	{}	*Node	108
267	gc	SetDiag	{bool}	{}	*Node	108
268	gc	SetColas	{bool}	{}	*Node	108
269	gc	SetNonNil	{bool}	{}	*Node	108
270	gc	SetNoescape	{bool}	{}	*Node	108
271	gc	SetBounded	{bool}	{}	*Node	108
272	gc	SetAddable	{bool}	{}	*Node	108
273	gc	SetHasCall	{bool}	{}	*Node	108
274	gc	SetLikely	{bool}	{}	*Node	108
275	gc	SetHasVal	{bool}	{}	*Node	108
276	gc	SetHasOpt	{bool}	{}	*Node	108
277	gc	SetEmbedded	{bool}	{}	*Node	108
278	gc	SetInlFormal	{bool}	{}	*Node	108
279	gc	SetInlLocal	{bool}	{}	*Node	108
280	gc	Val	{}	{gc.Val}	*Node	108
281	gc	SetVal	{gc.Val}	{}	*Node	108
282	gc	Opt	{}	{"interface{}"}	*Node	108
283	gc	SetOpt	{"interface{}"}	{}	*Node	108
284	gc	Iota	{}	{int64}	*Node	108
285	gc	SetIota	{int64}	{}	*Node	108
286	gc	Line	{}	{string}	*Node	108
287	gc	Captured	{}	{bool}	*Name	109
288	gc	Readonly	{}	{bool}	*Name	109
289	gc	Byval	{}	{bool}	*Name	109
290	gc	Needzero	{}	{bool}	*Name	109
291	gc	Keepalive	{}	{bool}	*Name	109
292	gc	AutoTemp	{}	{bool}	*Name	109
293	gc	Used	{}	{bool}	*Name	109
294	gc	SetCaptured	{bool}	{}	*Name	109
295	gc	SetReadonly	{bool}	{}	*Name	109
296	gc	SetByval	{bool}	{}	*Name	109
297	gc	SetNeedzero	{bool}	{}	*Name	109
298	gc	SetKeepalive	{bool}	{}	*Name	109
299	gc	SetAutoTemp	{bool}	{}	*Name	109
300	gc	SetUsed	{bool}	{}	*Name	109
301	gc	Dupok	{}	{bool}	*Func	111
302	gc	Wrapper	{}	{bool}	*Func	111
303	gc	Needctxt	{}	{bool}	*Func	111
304	gc	ReflectMethod	{}	{bool}	*Func	111
305	gc	IsHiddenClosure	{}	{bool}	*Func	111
306	gc	HasDefer	{}	{bool}	*Func	111
307	gc	NilCheckDisabled	{}	{bool}	*Func	111
308	gc	InlinabilityChecked	{}	{bool}	*Func	111
309	gc	ExportInline	{}	{bool}	*Func	111
310	gc	InstrumentBody	{}	{bool}	*Func	111
311	gc	SetDupok	{bool}	{}	*Func	111
312	gc	SetWrapper	{bool}	{}	*Func	111
313	gc	SetNeedctxt	{bool}	{}	*Func	111
314	gc	SetReflectMethod	{bool}	{}	*Func	111
315	gc	SetIsHiddenClosure	{bool}	{}	*Func	111
316	gc	SetHasDefer	{bool}	{}	*Func	111
317	gc	SetNilCheckDisabled	{bool}	{}	*Func	111
318	gc	SetInlinabilityChecked	{bool}	{}	*Func	111
319	gc	SetExportInline	{bool}	{}	*Func	111
320	gc	SetInstrumentBody	{bool}	{}	*Func	111
321	gc	GoString	{}	{string}	Op	115
322	gc	Format	{fmt.State,rune}	{}	Op	115
323	gc	String	{}	{string}	Op	115
324	gc	IsSlice3	{}	{bool}	Op	115
325	gc	Format	{fmt.State,rune}	{}	Nodes	116
326	gc	String	{}	{string}	Nodes	116
327	gc	Slice	{}	{[]*gc.Node}	Nodes	116
328	gc	Len	{}	{int}	Nodes	116
329	gc	Index	{int}	{*gc.Node}	Nodes	116
330	gc	First	{}	{*gc.Node}	Nodes	116
331	gc	Second	{}	{*gc.Node}	Nodes	116
332	gc	Set	{[]*gc.Node}	{}	*Nodes	116
333	gc	Set1	{*gc.Node}	{}	*Nodes	116
334	gc	Set2	{*gc.Node,*gc.Node}	{}	*Nodes	116
335	gc	Set3	{*gc.Node,*gc.Node,*gc.Node}	{}	*Nodes	116
336	gc	MoveNodes	{*gc.Nodes}	{}	*Nodes	116
337	gc	SetIndex	{int,*gc.Node}	{}	Nodes	116
338	gc	SetFirst	{*gc.Node}	{}	Nodes	116
339	gc	SetSecond	{*gc.Node}	{}	Nodes	116
340	gc	Addr	{int}	{**gc.Node}	Nodes	116
341	gc	Append	{...*gc.Node}	{}	*Nodes	116
342	gc	Prepend	{...*gc.Node}	{}	*Nodes	116
343	gc	AppendNodes	{*gc.Nodes}	{}	*Nodes	116
344	gc	Has	{*gc.Node}	{bool}	NodeSet	117
345	gc	Add	{*gc.Node}	{}	*NodeSet	117
346	gc	Sorted	{"func(*gc.Node, *gc.Node) bool"}	{[]*gc.Node}	NodeSet	117
347	gc	Start	{...string}	{}	*Timings	118
348	gc	Stop	{...string}	{}	*Timings	118
349	gc	AddEvent	{int64,string}	{}	*Timings	118
350	gc	Write	{io.Writer,string}	{}	*Timings	118
351	ssa	String	{}	{string}	*Block	119
352	ssa	LongString	{}	{string}	*Block	119
353	ssa	SetControl	{*ssa.Value}	{}	*Block	119
354	ssa	AddEdgeTo	{*ssa.Block}	{}	*Block	119
355	ssa	LackingPos	{}	{bool}	*Block	119
356	ssa	Logf	{string,"...interface{}"}	{}	*Block	119
357	ssa	Log	{}	{bool}	*Block	119
358	ssa	Fatalf	{string,"...interface{}"}	{}	*Block	119
359	ssa	NewValue0	{src.XPos,ssa.Op,*types.Type}	{*ssa.Value}	*Block	119
360	ssa	NewValue0I	{src.XPos,ssa.Op,*types.Type,int64}	{*ssa.Value}	*Block	119
361	ssa	NewValue0A	{src.XPos,ssa.Op,*types.Type,"interface{}"}	{*ssa.Value}	*Block	119
362	ssa	NewValue0IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}"}	{*ssa.Value}	*Block	119
363	ssa	NewValue1	{src.XPos,ssa.Op,*types.Type,*ssa.Value}	{*ssa.Value}	*Block	119
364	ssa	NewValue1I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Block	119
365	ssa	NewValue1A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	119
366	ssa	NewValue1IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	119
499	syntax	RelCol	{}	{uint}	Pos	216
367	ssa	NewValue2	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	119
368	ssa	NewValue2A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	119
369	ssa	NewValue2I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	119
370	ssa	NewValue2IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}",*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	119
371	ssa	NewValue3	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	119
372	ssa	NewValue3I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	119
373	ssa	NewValue3A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	119
374	ssa	NewValue4	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	119
375	ssa	NewValue4I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	119
376	ssa	HTML	{}	{string}	*Block	119
377	ssa	LongHTML	{}	{string}	*Block	119
378	ssa	FirstPossibleStmtValue	{}	{*ssa.Value}	*Block	119
379	ssa	Block	{}	{*ssa.Block}	Edge	120
380	ssa	Index	{}	{int}	Edge	120
381	ssa	String	{}	{string}	BlockKind	121
382	ssa	Reset	{}	{}	*Cache	123
383	ssa	Set387	{bool}	{}	*Config	124
384	ssa	Ctxt	{}	{*obj.Link}	*Config	124
385	ssa	SetTypPtrs	{}	{}	*Types	125
386	ssa	PutLocationList	{[]byte,*obj.Link,*obj.LSym,*obj.LSym}	{}	*FuncDebug	132
387	ssa	NumBlocks	{}	{int}	*Func	137
388	ssa	NumValues	{}	{int}	*Func	137
389	ssa	LogStat	{string,"...interface{}"}	{}	*Func	137
390	ssa	NewBlock	{ssa.BlockKind}	{*ssa.Block}	*Func	137
391	ssa	ConstBool	{*types.Type,bool}	{*ssa.Value}	*Func	137
392	ssa	ConstInt8	{*types.Type,int8}	{*ssa.Value}	*Func	137
393	ssa	ConstInt16	{*types.Type,int16}	{*ssa.Value}	*Func	137
394	ssa	ConstInt32	{*types.Type,int32}	{*ssa.Value}	*Func	137
395	ssa	ConstInt64	{*types.Type,int64}	{*ssa.Value}	*Func	137
396	ssa	ConstFloat32	{*types.Type,float64}	{*ssa.Value}	*Func	137
397	ssa	ConstFloat64	{*types.Type,float64}	{*ssa.Value}	*Func	137
398	ssa	ConstSlice	{*types.Type}	{*ssa.Value}	*Func	137
399	ssa	ConstInterface	{*types.Type}	{*ssa.Value}	*Func	137
400	ssa	ConstNil	{*types.Type}	{*ssa.Value}	*Func	137
401	ssa	ConstEmptyString	{*types.Type}	{*ssa.Value}	*Func	137
402	ssa	ConstOffPtrSP	{*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Func	137
403	ssa	Frontend	{}	{ssa.Frontend}	*Func	137
404	ssa	Warnl	{src.XPos,string,"...interface{}"}	{}	*Func	137
405	ssa	Logf	{string,"...interface{}"}	{}	*Func	137
406	ssa	Log	{}	{bool}	*Func	137
407	ssa	Fatalf	{string,"...interface{}"}	{}	*Func	137
408	ssa	Postorder	{}	{[]*ssa.Block}	*Func	137
409	ssa	Idom	{}	{[]*ssa.Block}	*Func	137
410	ssa	DebugHashMatch	{string,string}	{bool}	*Func	137
411	ssa	HTML	{string,*ssa.dotWriter}	{string}	*Func	137
412	ssa	String	{}	{string}	*Func	137
413	main	Len	{}	{int}	ArchsByName	138
414	main	Swap	{int,int}	{}	ArchsByName	138
415	main	Less	{int,int}	{bool}	ArchsByName	138
416	main	String	{}	{string}	Rule	139
417	ssa	Close	{}	{}	*HTMLWriter	140
418	ssa	WriteFunc	{string,string,*ssa.Func}	{}	*HTMLWriter	140
419	ssa	WriteSources	{string,[]*ssa.FuncLines}	{}	*HTMLWriter	140
420	ssa	WriteAST	{string,*bytes.Buffer}	{}	*HTMLWriter	140
421	ssa	WriteColumn	{string,string,string,string}	{}	*HTMLWriter	140
422	ssa	Printf	{string,"...interface{}"}	{}	*HTMLWriter	140
423	ssa	WriteString	{string}	{}	*HTMLWriter	140
424	ssa	Len	{}	{int}	ByTopo	142
425	ssa	Swap	{int,int}	{}	ByTopo	142
426	ssa	Less	{int,int}	{bool}	ByTopo	142
427	ssa	String	{}	{string}	*Register	145
428	ssa	ObjNum	{}	{int16}	*Register	145
429	ssa	GCNum	{}	{int16}	*Register	145
430	ssa	String	{}	{string}	LocalSlot	146
431	ssa	String	{}	{string}	LocPair	147
432	ssa	Asm	{}	{obj.As}	Op	148
433	ssa	Scale	{}	{int16}	Op	148
434	ssa	String	{}	{string}	Op	148
435	ssa	UsesScratch	{}	{bool}	Op	148
436	ssa	SymEffect	{}	{ssa.SymEffect}	Op	148
437	ssa	IsCall	{}	{bool}	Op	148
438	ssa	Val	{}	{int64}	ValAndOff	150
439	ssa	Off	{}	{int64}	ValAndOff	150
440	ssa	Int64	{}	{int64}	ValAndOff	150
441	ssa	String	{}	{string}	ValAndOff	150
442	ssa	String	{}	{string}	*RBTint32	152
443	ssa	IsEmpty	{}	{bool}	*RBTint32	152
444	ssa	IsSingle	{}	{bool}	*RBTint32	152
445	ssa	VisitInOrder	{"func(int32, interface{})"}	{}	*RBTint32	152
446	ssa	Find	{int32}	{"interface{}"}	*RBTint32	152
447	ssa	Insert	{int32,"interface{}"}	{"interface{}"}	*RBTint32	152
448	ssa	Min	{}	{int32,"interface{}"}	*RBTint32	152
449	ssa	Max	{}	{int32,"interface{}"}	*RBTint32	152
450	ssa	Glb	{int32}	{int32,"interface{}"}	*RBTint32	152
451	ssa	GlbEq	{int32}	{int32,"interface{}"}	*RBTint32	152
452	ssa	Lub	{int32}	{int32,"interface{}"}	*RBTint32	152
453	ssa	LubEq	{int32}	{int32,"interface{}"}	*RBTint32	152
454	ssa	Len	{}	{int}	ValHeap	153
455	ssa	Swap	{int,int}	{}	ValHeap	153
456	ssa	Push	{"interface{}"}	{}	*ValHeap	153
457	ssa	Pop	{}	{"interface{}"}	*ValHeap	153
458	ssa	Less	{int,int}	{bool}	ValHeap	153
459	ssa	String	{}	{string}	*SparseTreeNode	154
460	ssa	Entry	{}	{int32}	*SparseTreeNode	154
461	ssa	Exit	{}	{int32}	*SparseTreeNode	154
462	ssa	Sibling	{*ssa.Block}	{*ssa.Block}	SparseTree	155
463	ssa	Child	{*ssa.Block}	{*ssa.Block}	SparseTree	155
464	ssa	Insert	{*ssa.Block,int32,"interface{}",*ssa.SparseTreeHelper}	{}	*SparseTreeMap	156
465	ssa	Find	{*ssa.Block,int32,*ssa.SparseTreeHelper}	{"interface{}"}	*SparseTreeMap	156
466	ssa	String	{}	{string}	*SparseTreeMap	156
467	ssa	NewTree	{}	{*ssa.SparseTreeMap}	*SparseTreeHelper	157
468	ssa	HTML	{}	{string}	*Value	158
469	ssa	LongHTML	{}	{string}	*Value	158
470	ssa	String	{}	{string}	*Value	158
471	ssa	AuxInt8	{}	{int8}	*Value	158
472	ssa	AuxInt16	{}	{int16}	*Value	158
473	ssa	AuxInt32	{}	{int32}	*Value	158
474	ssa	AuxUnsigned	{}	{uint64}	*Value	158
475	ssa	AuxFloat	{}	{float64}	*Value	158
476	ssa	AuxValAndOff	{}	{ssa.ValAndOff}	*Value	158
477	ssa	LongString	{}	{string}	*Value	158
478	ssa	AddArg	{*ssa.Value}	{}	*Value	158
479	ssa	AddArgs	{...*ssa.Value}	{}	*Value	158
480	ssa	SetArg	{int,*ssa.Value}	{}	*Value	158
481	ssa	RemoveArg	{int}	{}	*Value	158
482	ssa	SetArgs1	{*ssa.Value}	{}	*Value	158
483	ssa	SetArgs2	{*ssa.Value,*ssa.Value}	{}	*Value	158
484	ssa	Logf	{string,"...interface{}"}	{}	*Value	158
485	ssa	Log	{}	{bool}	*Value	158
486	ssa	Fatalf	{string,"...interface{}"}	{}	*Value	158
487	ssa	Reg	{}	{int16}	*Value	158
488	ssa	Reg0	{}	{int16}	*Value	158
489	ssa	Reg1	{}	{int16}	*Value	158
490	ssa	RegName	{}	{string}	*Value	158
491	ssa	MemoryArg	{}	{*ssa.Value}	*Value	158
492	ssa	LackingPos	{}	{bool}	*Value	158
493	syntax	IsKnown	{}	{bool}	Pos	216
494	syntax	Base	{}	{*syntax.PosBase}	Pos	216
495	syntax	Line	{}	{uint}	Pos	216
496	syntax	Col	{}	{uint}	Pos	216
497	syntax	RelFilename	{}	{string}	Pos	216
498	syntax	RelLine	{}	{uint}	Pos	216
500	syntax	String	{}	{string}	Pos	216
501	syntax	IsFileBase	{}	{bool}	*PosBase	217
502	syntax	Pos	{}	{syntax.Pos}	*PosBase	217
503	syntax	Filename	{}	{string}	*PosBase	217
504	syntax	Line	{}	{uint}	*PosBase	217
505	syntax	Col	{}	{uint}	*PosBase	217
506	syntax	Error	{}	{string}	Error	219
507	syntax	Error	{}	{string}	*Error	219
508	syntax	String	{}	{string}	Operator	224
509	types	Lookup	{string}	{*types.Sym}	*Pkg	225
510	types	LookupOK	{string}	{*types.Sym,bool}	*Pkg	225
511	types	LookupBytes	{[]byte}	{*types.Sym}	*Pkg	225
512	types	PkgDef	{}	{*types.Node}	*Sym	226
513	types	SetPkgDef	{*types.Node}	{}	*Sym	226
514	types	OnExportList	{}	{bool}	*Sym	226
515	types	Uniq	{}	{bool}	*Sym	226
516	types	Siggen	{}	{bool}	*Sym	226
517	types	Asm	{}	{bool}	*Sym	226
518	types	AlgGen	{}	{bool}	*Sym	226
519	types	Func	{}	{bool}	*Sym	226
520	types	SetOnExportList	{bool}	{}	*Sym	226
521	types	SetUniq	{bool}	{}	*Sym	226
522	types	SetSiggen	{bool}	{}	*Sym	226
523	types	SetAsm	{bool}	{}	*Sym	226
524	types	SetAlgGen	{bool}	{}	*Sym	226
525	types	SetFunc	{bool}	{}	*Sym	226
526	types	IsBlank	{}	{bool}	*Sym	226
527	types	LinksymName	{}	{string}	*Sym	226
528	types	Linksym	{}	{*obj.LSym}	*Sym	226
529	types	Less	{*types.Sym}	{bool}	*Sym	226
530	types	String	{}	{string}	*Sym	226
531	types	Format	{fmt.State,rune}	{}	*Sym	226
532	types	String	{}	{string}	EType	228
533	types	CanRecv	{}	{bool}	ChanDir	229
534	types	CanSend	{}	{bool}	ChanDir	229
535	types	NotInHeap	{}	{bool}	*Type	230
536	types	Broke	{}	{bool}	*Type	230
537	types	Noalg	{}	{bool}	*Type	230
538	types	Deferwidth	{}	{bool}	*Type	230
539	types	Recur	{}	{bool}	*Type	230
540	types	SetNotInHeap	{bool}	{}	*Type	230
541	types	SetBroke	{bool}	{}	*Type	230
542	types	SetNoalg	{bool}	{}	*Type	230
543	types	SetDeferwidth	{bool}	{}	*Type	230
544	types	SetRecur	{bool}	{}	*Type	230
545	types	Pkg	{}	{*types.Pkg}	*Type	230
546	types	SetPkg	{*types.Pkg}	{}	*Type	230
547	types	MapType	{}	{*types.Map}	*Type	230
548	types	ForwardType	{}	{*types.Forward}	*Type	230
549	types	FuncType	{}	{*types.Func}	*Type	230
550	types	StructType	{}	{*types.Struct}	*Type	230
551	types	ChanType	{}	{*types.Chan}	*Type	230
552	types	Recvs	{}	{*types.Type}	*Type	230
553	types	Params	{}	{*types.Type}	*Type	230
554	types	Results	{}	{*types.Type}	*Type	230
555	types	NumRecvs	{}	{int}	*Type	230
556	types	NumParams	{}	{int}	*Type	230
557	types	NumResults	{}	{int}	*Type	230
558	types	IsVariadic	{}	{bool}	*Type	230
559	types	Recv	{}	{*types.Field}	*Type	230
560	types	Key	{}	{*types.Type}	*Type	230
561	types	Elem	{}	{*types.Type}	*Type	230
562	types	DDDField	{}	{*types.Type}	*Type	230
563	types	ChanArgs	{}	{*types.Type}	*Type	230
564	types	FuncArgs	{}	{*types.Type}	*Type	230
565	types	Nname	{}	{*types.Node}	*Type	230
566	types	SetNname	{*types.Node}	{}	*Type	230
567	types	IsFuncArgStruct	{}	{bool}	*Type	230
568	types	Methods	{}	{*types.Fields}	*Type	230
569	types	AllMethods	{}	{*types.Fields}	*Type	230
570	types	Fields	{}	{*types.Fields}	*Type	230
571	types	Field	{int}	{*types.Field}	*Type	230
572	types	FieldSlice	{}	{[]*types.Field}	*Type	230
573	types	SetFields	{[]*types.Field}	{}	*Type	230
574	types	SetInterface	{[]*types.Field}	{}	*Type	230
853	obj	String	{}	{string}	As	406
575	types	IsDDDArray	{}	{bool}	*Type	230
576	types	WidthCalculated	{}	{bool}	*Type	230
577	types	ArgWidth	{}	{int64}	*Type	230
578	types	Size	{}	{int64}	*Type	230
579	types	Alignment	{}	{int64}	*Type	230
580	types	SimpleString	{}	{string}	*Type	230
581	types	Compare	{*types.Type}	{types.Cmp}	*Type	230
582	types	IsKind	{types.EType}	{bool}	*Type	230
583	types	IsBoolean	{}	{bool}	*Type	230
584	types	ToUnsigned	{}	{*types.Type}	*Type	230
585	types	IsInteger	{}	{bool}	*Type	230
586	types	IsSigned	{}	{bool}	*Type	230
587	types	IsFloat	{}	{bool}	*Type	230
588	types	IsComplex	{}	{bool}	*Type	230
589	types	IsPtr	{}	{bool}	*Type	230
590	types	IsPtrElem	{}	{bool}	*Type	230
591	types	IsUnsafePtr	{}	{bool}	*Type	230
592	types	IsPtrShaped	{}	{bool}	*Type	230
593	types	IsString	{}	{bool}	*Type	230
594	types	IsMap	{}	{bool}	*Type	230
595	types	IsChan	{}	{bool}	*Type	230
596	types	IsSlice	{}	{bool}	*Type	230
597	types	IsArray	{}	{bool}	*Type	230
598	types	IsStruct	{}	{bool}	*Type	230
599	types	IsInterface	{}	{bool}	*Type	230
600	types	IsEmptyInterface	{}	{bool}	*Type	230
601	types	PtrTo	{}	{*types.Type}	*Type	230
602	types	NumFields	{}	{int}	*Type	230
603	types	FieldType	{int}	{*types.Type}	*Type	230
604	types	FieldOff	{int}	{int64}	*Type	230
605	types	FieldName	{int}	{string}	*Type	230
606	types	NumElem	{}	{int64}	*Type	230
607	types	SetNumElem	{int64}	{}	*Type	230
608	types	NumComponents	{types.componentsIncludeBlankFields}	{int64}	*Type	230
609	types	SoleComponent	{}	{*types.Type}	*Type	230
610	types	ChanDir	{}	{types.ChanDir}	*Type	230
611	types	IsMemory	{}	{bool}	*Type	230
612	types	IsFlags	{}	{bool}	*Type	230
613	types	IsVoid	{}	{bool}	*Type	230
614	types	IsTuple	{}	{bool}	*Type	230
615	types	IsUntyped	{}	{bool}	*Type	230
616	types	HasHeapPointer	{}	{bool}	*Type	230
617	types	Symbol	{}	{*obj.LSym}	*Type	230
618	types	Tie	{}	{byte}	*Type	230
619	types	String	{}	{string}	*Type	230
620	types	ShortString	{}	{string}	*Type	230
621	types	LongString	{}	{string}	*Type	230
622	types	Format	{fmt.State,rune}	{}	*Type	230
623	types	Key	{}	{types.Type}	*Map	231
624	types	Elem	{}	{types.Type}	*Map	231
625	types	Underlying	{}	{types.Type}	*Map	231
626	types	String	{}	{string}	*Map	231
627	types	FullName	{}	{string}	*Func	233
628	types	Scope	{}	{*types.Scope}	*Func	233
629	types	String	{}	{string}	*Func	233
630	types	NumFields	{}	{int}	*Struct	234
631	types	Field	{int}	{*types.Var}	*Struct	234
632	types	Tag	{int}	{string}	*Struct	234
633	types	Underlying	{}	{types.Type}	*Struct	234
634	types	String	{}	{string}	*Struct	234
635	types	NumExplicitMethods	{}	{int}	*Interface	236
636	types	ExplicitMethod	{int}	{*types.Func}	*Interface	236
637	types	NumEmbeddeds	{}	{int}	*Interface	236
638	types	Embedded	{int}	{*types.Named}	*Interface	236
639	types	EmbeddedType	{int}	{types.Type}	*Interface	236
640	types	NumMethods	{}	{int}	*Interface	236
641	types	Method	{int}	{*types.Func}	*Interface	236
642	types	Empty	{}	{bool}	*Interface	236
643	types	Complete	{}	{*types.Interface}	*Interface	236
644	types	Underlying	{}	{types.Type}	*Interface	236
645	types	String	{}	{string}	*Interface	236
646	types	Dir	{}	{types.ChanDir}	*Chan	241
647	types	Elem	{}	{types.Type}	*Chan	241
648	types	Underlying	{}	{types.Type}	*Chan	241
649	types	String	{}	{string}	*Chan	241
650	types	Len	{}	{int}	*Tuple	242
651	types	At	{int}	{*types.Var}	*Tuple	242
652	types	Underlying	{}	{types.Type}	*Tuple	242
653	types	String	{}	{string}	*Tuple	242
654	types	Len	{}	{int64}	*Array	243
655	types	Elem	{}	{types.Type}	*Array	243
656	types	Underlying	{}	{types.Type}	*Array	243
657	types	String	{}	{string}	*Array	243
658	types	Elem	{}	{types.Type}	*Slice	244
659	types	Underlying	{}	{types.Type}	*Slice	244
660	types	String	{}	{string}	*Slice	244
661	types	IsDDD	{}	{bool}	*Field	245
662	types	Broke	{}	{bool}	*Field	245
663	types	Nointerface	{}	{bool}	*Field	245
664	types	SetIsDDD	{bool}	{}	*Field	245
665	types	SetBroke	{bool}	{}	*Field	245
666	types	SetNointerface	{bool}	{}	*Field	245
667	types	End	{}	{int64}	*Field	245
668	types	IsMethod	{}	{bool}	*Field	245
669	types	Copy	{}	{*types.Field}	*Field	245
670	types	Len	{}	{int}	*Fields	246
671	types	Slice	{}	{[]*types.Field}	*Fields	246
672	types	Index	{int}	{*types.Field}	*Fields	246
673	types	Set	{[]*types.Field}	{}	*Fields	246
674	types	Append	{...*types.Field}	{}	*Fields	246
675	main	Visit	{ast.Node}	{ast.Visitor}	*FuncVisitor	251
676	main	Boundaries	{[]byte}	{[]main.Boundary}	*Profile	253
677	main	Reset	{}	{}	*Dirs	257
678	main	Next	{}	{main.Dir,bool}	*Dirs	257
679	main	Error	{}	{string}	PackageError	259
680	pkg	ExportedMethod	{int}	{bool}	ExportedType	261
681	pkg	Uncommented	{int}	{bool}	ExportedType	261
682	base	LongName	{}	{string}	*Command	269
683	base	Name	{}	{string}	*Command	269
684	base	Usage	{}	{}	*Command	269
685	base	Runnable	{}	{bool}	*Command	269
686	base	Set	{string}	{error}	*StringsFlag	270
687	base	String	{}	{string}	*StringsFlag	270
688	cache	Get	{cache.ActionID}	{cache.Entry,error}	*Cache	273
689	cache	GetFile	{cache.ActionID}	{string,cache.Entry,error}	*Cache	273
690	cache	GetBytes	{cache.ActionID}	{[]byte,cache.Entry,error}	*Cache	273
691	cache	OutputFile	{cache.OutputID}	{string}	*Cache	273
692	cache	Trim	{}	{}	*Cache	273
693	cache	Put	{cache.ActionID,io.ReadSeeker}	{cache.OutputID,int64,error}	*Cache	273
694	cache	PutNoVerify	{cache.ActionID,io.ReadSeeker}	{cache.OutputID,int64,error}	*Cache	273
695	cache	PutBytes	{cache.ActionID,[]byte}	{error}	*Cache	273
696	cache	Write	{[]byte}	{int,error}	*Hash	275
697	cache	Sum	{}	{[]byte}	*Hash	275
698	get	Error	{}	{string}	ImportMismatchError	282
699	list	Write	{[]byte}	{int,error}	*TrackingWriter	284
700	list	Flush	{}	{}	*TrackingWriter	284
701	list	NeedNL	{}	{bool}	*TrackingWriter	284
702	load	Set	{string}	{error}	*PerPackageFlag	285
703	load	String	{}	{string}	*PerPackageFlag	285
704	load	Present	{}	{bool}	*PerPackageFlag	285
705	load	For	{*load.Package}	{[]string}	*PerPackageFlag	285
706	load	AllFiles	{}	{[]string}	*Package	286
707	load	Desc	{}	{string}	*Package	286
708	load	Resolve	{[]string}	{[]string}	*Package	286
709	load	InternalGoFiles	{}	{[]string}	*Package	286
710	load	InternalXGoFiles	{}	{[]string}	*Package	286
711	load	InternalAllGoFiles	{}	{[]string}	*Package	286
712	load	UsesSwig	{}	{bool}	*Package	286
713	load	UsesCgo	{}	{bool}	*Package	286
714	load	Error	{}	{string}	*NoGoError	289
715	load	Error	{}	{string}	*PackageError	291
716	load	Push	{string}	{}	*ImportStack	292
717	load	Pop	{}	{}	*ImportStack	292
718	load	Copy	{}	{[]string}	*ImportStack	292
719	lockedfile	Close	{}	{error}	*File	296
720	lockedfile	String	{}	{string}	*Mutex	297
721	lockedfile	Lock	{}	{func(),error}	*Mutex	297
722	codehost	Error	{}	{string}	*UnknownRevisionError	301
723	codehost	Is	{error}	{bool}	UnknownRevisionError	301
724	codehost	Error	{}	{string}	*RunError	302
725	codehost	Error	{}	{string}	*VCSError	303
726	modfile	Comment	{}	{*modfile.Comments}	*Comments	309
727	modfile	Span	{}	{modfile.Position}	*FileSyntax	310
728	modfile	Cleanup	{}	{}	*FileSyntax	310
729	modfile	Span	{}	{modfile.Position}	*CommentBlock	311
730	modfile	Span	{}	{modfile.Position}	*Line	312
731	modfile	Span	{}	{modfile.Position}	*LineBlock	313
732	modfile	Span	{}	{modfile.Position}	*LParen	314
733	modfile	Span	{}	{modfile.Position}	*RParen	315
734	modfile	AddModuleStmt	{string}	{error}	*File	316
735	modfile	AddComment	{string}	{}	*File	316
736	modfile	Format	{}	{[]byte,error}	*File	316
737	modfile	Cleanup	{}	{}	*File	316
738	modfile	AddGoStmt	{string}	{error}	*File	316
739	modfile	AddRequire	{string,string}	{error}	*File	316
740	modfile	AddNewRequire	{string,string,bool}	{}	*File	316
741	modfile	SetRequire	{[]*modfile.Require}	{}	*File	316
742	modfile	DropRequire	{string}	{error}	*File	316
743	modfile	AddExclude	{string,string}	{error}	*File	316
744	modfile	DropExclude	{string,string}	{error}	*File	316
745	modfile	AddReplace	{string,string,string,string}	{error}	*File	316
746	modfile	DropReplace	{string,string}	{error}	*File	316
747	modfile	SortBlocks	{}	{}	*File	316
748	modfile	Error	{}	{string}	*Error	323
749	modfile	Unwrap	{}	{error}	*Error	323
750	modinfo	String	{}	{string}	*ModulePublic	324
751	modload	Error	{}	{string}	*ImportMissingError	326
752	modload	Error	{}	{string}	*NoMatchingVersionError	328
753	modload	Error	{}	{string}	*PackageNotInModuleError	329
754	module	Error	{}	{string}	*ModuleError	331
755	module	Unwrap	{}	{error}	*ModuleError	331
756	module	Error	{}	{string}	*InvalidVersionError	332
757	module	Unwrap	{}	{error}	*InvalidVersionError	332
758	mvs	Module	{}	{module.Version}	*BuildListError	334
759	mvs	Error	{}	{string}	*BuildListError	334
760	note	Error	{}	{string}	*UnknownVerifierError	338
761	note	Error	{}	{string}	*UnverifiedNoteError	341
762	note	Error	{}	{string}	*InvalidSignatureError	342
763	par	Add	{"interface{}"}	{}	*Work	343
764	par	Do	{int,"func(interface{})"}	{}	*Work	343
765	par	Do	{"interface{}","func() interface{}"}	{"interface{}"}	*Cache	344
766	par	Get	{"interface{}"}	{"interface{}"}	*Cache	344
767	par	Clear	{}	{}	*Cache	344
768	par	Delete	{"interface{}"}	{}	*Cache	344
769	par	DeleteIf	{"func(interface{}) bool"}	{}	*Cache	344
770	sumweb	SetTileHeight	{int}	{}	*Conn	347
771	sumweb	SetGONOSUMDB	{string}	{}	*Conn	347
772	sumweb	Lookup	{string,string}	{[]string,error}	*Conn	347
773	sumweb	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Handler	349
774	sumweb	NewContext	{*http.Request}	{context.Context,error}	*TestServer	350
775	sumweb	Signed	{context.Context}	{[]byte,error}	*TestServer	350
776	sumweb	ReadRecords	{context.Context,int64,int64}	{[][]byte,error}	*TestServer	350
777	sumweb	Lookup	{context.Context,string}	{int64,error}	*TestServer	350
778	sumweb	ReadTileData	{context.Context,tlog.Tile}	{[]byte,error}	*TestServer	350
779	tlog	Path	{}	{string}	Tile	352
780	tlog	String	{}	{string}	Hash	354
781	tlog	MarshalJSON	{}	{[]byte,error}	Hash	354
782	tlog	UnmarshalJSON	{[]byte}	{error}	*Hash	354
783	tlog	ReadHashes	{[]int64}	{[]tlog.Hash,error}	HashReaderFunc	356
784	web	Error	{}	{string}	*HTTPError	362
785	web	Is	{error}	{bool}	*HTTPError	362
786	web	Err	{}	{error}	*Response	363
787	work	Init	{}	{}	*Builder	364
788	work	NewObjdir	{}	{string}	*Builder	364
789	work	AutoAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	364
790	work	CompileAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	364
791	work	VetAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	364
792	work	LinkAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	364
793	work	Do	{*work.Action}	{}	*Builder	364
794	work	PkgconfigCmd	{}	{string}	*Builder	364
795	work	Showcmd	{string,string,"...interface{}"}	{}	*Builder	364
796	work	Mkdir	{string}	{error}	*Builder	364
797	work	Symlink	{string,string}	{error}	*Builder	364
798	work	GccCmd	{string,string}	{[]string}	*Builder	364
799	work	GxxCmd	{string,string}	{[]string}	*Builder	364
800	work	CFlags	{*load.Package}	{[]string,error}	*Builder	364
801	work	BuildActionID	{}	{string}	*Action	365
802	work	BuildContentID	{}	{string}	*Action	365
803	work	BuildID	{}	{string}	*Action	365
804	work	BuiltTarget	{}	{string}	*Action	365
805	bio	MustSeek	{int64,int}	{int64}	*Reader	372
806	bio	Offset	{}	{int64}	*Reader	372
807	bio	Close	{}	{error}	*Reader	372
808	bio	File	{}	{*os.File}	*Reader	372
809	bio	Slice	{uint64}	{[]byte,bool,error}	*Reader	372
810	bio	SliceRO	{uint64}	{[]byte}	*Reader	372
811	bio	MustSeek	{int64,int}	{int64}	*Writer	373
812	bio	Offset	{}	{int64}	*Writer	373
813	bio	Close	{}	{error}	*Writer	373
814	bio	File	{}	{*os.File}	*Writer	373
815	dwarf	UnifyRanges	{*dwarf.Scope}	{}	*Scope	376
816	dwarf	AppendRange	{dwarf.Range}	{}	*Scope	376
817	dwarf	PutRanges	{dwarf.Context,[]dwarf.Range}	{}	*FnState	378
818	dwarf	Len	{}	{int}	VarsByOffset	384
819	dwarf	Less	{int,int}	{bool}	VarsByOffset	384
820	dwarf	Swap	{int,int}	{}	VarsByOffset	384
821	edit	Insert	{int,string}	{}	*Buffer	385
822	edit	Delete	{int,int}	{}	*Buffer	385
823	edit	Replace	{int,int,string}	{}	*Buffer	385
824	edit	Bytes	{}	{[]byte}	*Buffer	385
825	edit	String	{}	{string}	*Buffer	385
826	gcprog	Init	{func(byte)}	{}	*Writer	386
827	gcprog	Debug	{io.Writer}	{}	*Writer	386
828	gcprog	BitIndex	{}	{int64}	*Writer	386
829	gcprog	End	{}	{}	*Writer	386
830	gcprog	Ptr	{int64}	{}	*Writer	386
831	gcprog	ShouldRepeat	{int64,int64}	{bool}	*Writer	386
832	gcprog	Repeat	{int64,int64}	{}	*Writer	386
833	gcprog	ZeroUntil	{int64}	{}	*Writer	386
834	gcprog	Append	{[]byte,int64}	{}	*Writer	386
835	goobj	String	{}	{string}	SymID	388
836	goobj	String	{uint64}	{string}	*Reloc	390
837	obj	Add	{int,src.XPos,*obj.LSym}	{int}	*InlTree	400
838	obj	Parent	{int}	{int}	*InlTree	400
839	obj	InlinedFunction	{int}	{*obj.LSym}	*InlTree	400
840	obj	CallPos	{int}	{src.XPos}	*InlTree	400
841	obj	String	{}	{string}	AddrType	404
842	obj	From3Type	{}	{obj.AddrType}	*Prog	405
843	obj	GetFrom3	{}	{*obj.Addr}	*Prog	405
844	obj	SetFrom3	{obj.Addr}	{}	*Prog	405
845	obj	Line	{}	{string}	*Prog	405
846	obj	InnermostLine	{}	{string}	*Prog	405
847	obj	InnermostLineNumber	{}	{string}	*Prog	405
848	obj	InnermostLineNumberHTML	{}	{string}	*Prog	405
849	obj	InnermostFilename	{}	{string}	*Prog	405
850	obj	String	{}	{string}	*Prog	405
851	obj	InnermostString	{}	{string}	*Prog	405
852	obj	InstructionString	{}	{string}	*Prog	405
854	obj	Grow	{int64}	{}	*LSym	407
855	obj	GrowCap	{int64}	{}	*LSym	407
856	obj	WriteFloat32	{*obj.Link,int64,float32}	{}	*LSym	407
857	obj	WriteFloat64	{*obj.Link,int64,float64}	{}	*LSym	407
858	obj	WriteInt	{*obj.Link,int64,int,int64}	{}	*LSym	407
859	obj	WriteAddr	{*obj.Link,int64,int,*obj.LSym,int64}	{}	*LSym	407
860	obj	WriteCURelativeAddr	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	407
861	obj	WriteOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	407
862	obj	WriteWeakOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	407
863	obj	WriteString	{*obj.Link,int64,int,string}	{}	*LSym	407
864	obj	WriteBytes	{*obj.Link,int64,[]byte}	{int64}	*LSym	407
865	obj	String	{}	{string}	*LSym	407
866	obj	Len	{}	{int64}	*LSym	407
867	obj	AddInlMark	{*obj.Prog,int32}	{}	*FuncInfo	408
868	obj	String	{}	{string}	ABI	410
869	obj	DuplicateOK	{}	{bool}	Attribute	411
870	obj	MakeTypelink	{}	{bool}	Attribute	411
871	obj	CFunc	{}	{bool}	Attribute	411
872	obj	NoSplit	{}	{bool}	Attribute	411
873	obj	Leaf	{}	{bool}	Attribute	411
874	obj	SeenGlobl	{}	{bool}	Attribute	411
875	obj	OnList	{}	{bool}	Attribute	411
876	obj	ReflectMethod	{}	{bool}	Attribute	411
877	obj	Local	{}	{bool}	Attribute	411
878	obj	Wrapper	{}	{bool}	Attribute	411
879	obj	NeedCtxt	{}	{bool}	Attribute	411
880	obj	NoFrame	{}	{bool}	Attribute	411
881	obj	Static	{}	{bool}	Attribute	411
882	obj	WasInlined	{}	{bool}	Attribute	411
883	obj	TopFrame	{}	{bool}	Attribute	411
884	obj	Set	{obj.Attribute,bool}	{}	*Attribute	411
885	obj	ABI	{}	{obj.ABI}	Attribute	411
886	obj	SetABI	{obj.ABI}	{}	*Attribute	411
887	obj	TextAttrString	{}	{string}	Attribute	411
888	obj	OutermostPos	{src.XPos}	{src.Pos}	*Link	416
889	obj	InnermostPos	{src.XPos}	{src.Pos}	*Link	416
890	obj	AddImport	{string}	{}	*Link	416
891	obj	Diag	{string,"...interface{}"}	{}	*Link	416
892	obj	Logf	{string,"...interface{}"}	{}	*Link	416
893	obj	FixedFrameSize	{}	{int64}	*Link	416
894	obj	DwarfIntConst	{string,string,string,int64}	{}	*Link	416
895	obj	DwarfAbstractFunc	{"interface{}",*obj.LSym,string}	{}	*Link	416
896	obj	InitTextSym	{*obj.LSym,int}	{}	*Link	416
897	obj	Globl	{*obj.LSym,int64,int}	{}	*Link	416
898	obj	EmitEntryLiveness	{*obj.LSym,*obj.Prog,obj.ProgAlloc}	{*obj.Prog}	*Link	416
899	obj	LookupDerived	{*obj.LSym,string}	{*obj.LSym}	*Link	416
900	obj	LookupStatic	{string}	{*obj.LSym}	*Link	416
901	obj	LookupABI	{string,obj.ABI}	{*obj.LSym}	*Link	416
902	obj	Lookup	{string}	{*obj.LSym}	*Link	416
903	obj	LookupInit	{string,func(*obj.LSym)}	{*obj.LSym}	*Link	416
904	obj	Float32Sym	{float32}	{*obj.LSym}	*Link	416
905	obj	Float64Sym	{float64}	{*obj.LSym}	*Link	416
906	obj	Int64Sym	{int64}	{*obj.LSym}	*Link	416
907	obj	NewProg	{}	{*obj.Prog}	*Link	416
908	obj	CanReuseProgs	{}	{bool}	*Link	416
909	obj	GetPrecursorFunc	{*obj.LSym}	{"interface{}"}	*DwarfFixupTable	421
910	obj	SetPrecursorFunc	{*obj.LSym,"interface{}"}	{}	*DwarfFixupTable	421
911	obj	ReferenceChildDIE	{*obj.LSym,int,*obj.LSym,int,int}	{}	*DwarfFixupTable	421
912	obj	RegisterChildDIEOffsets	{*obj.LSym,[]*dwarf.Var,[]int32}	{}	*DwarfFixupTable	421
913	obj	AbsFuncDwarfSym	{*obj.LSym}	{*obj.LSym}	*DwarfFixupTable	421
914	obj	Finalize	{string,bool}	{}	*DwarfFixupTable	421
915	x86	Put1	{byte}	{}	*AsmBuf	427
916	x86	Put2	{byte,byte}	{}	*AsmBuf	427
917	x86	Put3	{byte,byte,byte}	{}	*AsmBuf	427
918	x86	Put4	{byte,byte,byte,byte}	{}	*AsmBuf	427
919	x86	PutInt16	{int16}	{}	*AsmBuf	427
920	x86	PutInt32	{int32}	{}	*AsmBuf	427
921	x86	PutInt64	{int64}	{}	*AsmBuf	427
922	x86	Put	{[]byte}	{}	*AsmBuf	427
923	x86	PutOpBytesLit	{int,*x86.opBytes}	{}	*AsmBuf	427
924	x86	Insert	{int,byte}	{}	*AsmBuf	427
925	x86	Last	{}	{byte}	*AsmBuf	427
926	x86	Len	{}	{int}	*AsmBuf	427
927	x86	Bytes	{}	{[]byte}	*AsmBuf	427
928	x86	Reset	{}	{}	*AsmBuf	427
929	x86	At	{int}	{byte}	*AsmBuf	427
930	objabi	Set	{string}	{error}	*HeadType	429
931	objabi	String	{}	{string}	*HeadType	429
932	objabi	IsDirectJump	{}	{bool}	RelocType	430
933	objabi	String	{}	{string}	RelocType	430
934	objabi	String	{}	{string}	SymKind	431
935	objfile	Print	{io.Writer,*regexp.Regexp,uint64,uint64,bool}	{}	*Disasm	432
936	objfile	Decode	{uint64,uint64,[]objfile.Reloc,"func(uint64, string, int, string)"}	{}	*Disasm	432
937	objfile	Line	{string,int}	{[]byte,error}	*FileCache	434
938	objfile	Close	{}	{error}	*File	436
939	objfile	Entries	{}	{[]*objfile.Entry}	*File	436
940	objfile	Symbols	{}	{[]objfile.Sym,error}	*File	436
941	objfile	PCLineTable	{}	{objfile.Liner,error}	*File	436
942	objfile	Text	{}	{uint64,[]byte,error}	*File	436
943	objfile	GOARCH	{}	{string}	*File	436
944	objfile	LoadAddress	{}	{uint64,error}	*File	436
945	objfile	DWARF	{}	{*dwarf.Data,error}	*File	436
946	objfile	Disasm	{}	{*objfile.Disasm,error}	*File	436
947	objfile	Disasm	{}	{*objfile.Disasm,error}	*Entry	437
948	objfile	Name	{}	{string}	*Entry	437
949	objfile	Symbols	{}	{[]objfile.Sym,error}	*Entry	437
950	objfile	PCLineTable	{}	{objfile.Liner,error}	*Entry	437
951	objfile	Text	{}	{uint64,[]byte,error}	*Entry	437
952	objfile	GOARCH	{}	{string}	*Entry	437
953	objfile	LoadAddress	{}	{uint64,error}	*Entry	437
954	objfile	DWARF	{}	{*dwarf.Data,error}	*Entry	437
955	src	IsKnown	{}	{bool}	Pos	441
956	src	Before	{src.Pos}	{bool}	Pos	441
957	src	After	{src.Pos}	{bool}	Pos	441
958	src	LineNumber	{}	{string}	Pos	441
959	src	LineNumberHTML	{}	{string}	Pos	441
960	src	Filename	{}	{string}	Pos	441
961	src	Base	{}	{*src.PosBase}	Pos	441
962	src	SetBase	{*src.PosBase}	{}	*Pos	441
963	src	RelFilename	{}	{string}	Pos	441
964	src	RelLine	{}	{uint}	Pos	441
965	src	RelCol	{}	{uint}	Pos	441
966	src	AbsFilename	{}	{string}	Pos	441
967	src	SymFilename	{}	{string}	Pos	441
968	src	String	{}	{string}	Pos	441
969	src	Format	{bool,bool}	{string}	Pos	441
970	src	Pos	{}	{*src.Pos}	*PosBase	442
971	src	Filename	{}	{string}	*PosBase	442
972	src	AbsFilename	{}	{string}	*PosBase	442
973	src	SymFilename	{}	{string}	*PosBase	442
974	src	Line	{}	{uint}	*PosBase	442
975	src	Col	{}	{uint}	*PosBase	442
976	src	InliningIndex	{}	{int}	*PosBase	442
977	src	IsKnown	{}	{bool}	XPos	444
978	src	Before	{src.XPos}	{bool}	XPos	444
979	src	SameFile	{src.XPos}	{bool}	XPos	444
980	src	After	{src.XPos}	{bool}	XPos	444
981	src	WithNotStmt	{}	{src.XPos}	XPos	444
982	src	WithDefaultStmt	{}	{src.XPos}	XPos	444
983	src	WithIsStmt	{}	{src.XPos}	XPos	444
984	src	WithBogusLine	{}	{src.XPos}	XPos	444
985	src	WithXlogue	{src.PosXlogue}	{src.XPos}	XPos	444
986	src	LineNumber	{}	{string}	XPos	444
987	src	FileIndex	{}	{int32}	XPos	444
988	src	LineNumberHTML	{}	{string}	XPos	444
989	src	AtColumn1	{}	{src.XPos}	XPos	444
990	src	XPos	{src.Pos}	{src.XPos}	*PosTable	445
991	src	Pos	{src.XPos}	{src.Pos}	*PosTable	445
992	sys	InFamily	{...sys.ArchFamily}	{bool}	*Arch	447
993	ld	Set	{string}	{error}	*BuildMode	450
994	ld	String	{}	{string}	*BuildMode	450
995	ld	Set	{string}	{error}	*LinkMode	451
996	ld	String	{}	{string}	*LinkMode	451
997	ld	Init	{*ld.Link,string}	{}	*GCProg	452
998	ld	End	{int64}	{}	*GCProg	452
999	ld	AddSym	{*sym.Symbol}	{}	*GCProg	452
1000	ld	AddTramp	{*sym.Symbol}	{}	*Link	464
1001	ld	DynlinkingGo	{}	{bool}	*Link	464
1002	ld	CanUsePlugins	{}	{bool}	*Link	464
1003	ld	UseRelro	{}	{bool}	*Link	464
1004	ld	ErrorUnresolved	{*sym.Symbol,*sym.Reloc}	{}	*Link	464
1005	ld	FixedFrameSize	{}	{int64}	*Link	464
1006	ld	Logf	{string,"...interface{}"}	{}	*Link	464
1007	ld	Set	{string}	{error}	*Rpath	471
1008	ld	String	{}	{string}	*Rpath	471
1009	ld	SeekSet	{int64}	{}	*OutBuf	472
1010	ld	Offset	{}	{int64}	*OutBuf	472
1011	ld	Write	{[]byte}	{int,error}	*OutBuf	472
1012	ld	Write8	{uint8}	{}	*OutBuf	472
1013	ld	WriteByte	{byte}	{error}	*OutBuf	472
1014	ld	Write16	{uint16}	{}	*OutBuf	472
1015	ld	Write32	{uint32}	{}	*OutBuf	472
1016	ld	Write32b	{uint32}	{}	*OutBuf	472
1017	ld	Write64	{uint64}	{}	*OutBuf	472
1018	ld	Write64b	{uint64}	{}	*OutBuf	472
1019	ld	WriteString	{string}	{}	*OutBuf	472
1020	ld	WriteStringN	{string,int}	{}	*OutBuf	472
1021	ld	WriteStringPad	{string,int,[]byte}	{}	*OutBuf	472
1022	ld	WriteSym	{*sym.Symbol}	{}	*OutBuf	472
1023	ld	Flush	{}	{}	*OutBuf	472
1024	ld	Mmap	{uint64}	{error}	*OutBuf	472
1025	ld	Munmap	{}	{}	*OutBuf	472
1026	ld	Msync	{}	{error}	*OutBuf	472
1027	ld	Mmap	{uint64}	{error}	*OutBuf	472
1028	ld	Munmap	{}	{}	*OutBuf	472
1029	ld	Msync	{}	{error}	*OutBuf	472
1030	sym	DuplicateOK	{}	{bool}	Attribute	503
1031	sym	External	{}	{bool}	Attribute	503
1032	sym	NoSplit	{}	{bool}	Attribute	503
1033	sym	Reachable	{}	{bool}	Attribute	503
1034	sym	CgoExportDynamic	{}	{bool}	Attribute	503
1035	sym	CgoExportStatic	{}	{bool}	Attribute	503
1036	sym	Special	{}	{bool}	Attribute	503
1037	sym	StackCheck	{}	{bool}	Attribute	503
1038	sym	NotInSymbolTable	{}	{bool}	Attribute	503
1039	sym	OnList	{}	{bool}	Attribute	503
1040	sym	Local	{}	{bool}	Attribute	503
1041	sym	ReflectMethod	{}	{bool}	Attribute	503
1042	sym	MakeTypelink	{}	{bool}	Attribute	503
1043	sym	Shared	{}	{bool}	Attribute	503
1044	sym	VisibilityHidden	{}	{bool}	Attribute	503
1045	sym	SubSymbol	{}	{bool}	Attribute	503
1046	sym	Container	{}	{bool}	Attribute	503
1047	sym	TopFrame	{}	{bool}	Attribute	503
1048	sym	ReadOnly	{}	{bool}	Attribute	503
1049	sym	CgoExport	{}	{bool}	Attribute	503
1050	sym	Set	{sym.Attribute,bool}	{}	*Attribute	503
1051	sym	String	{}	{string}	Library	504
1052	sym	InitExt	{}	{}	*Reloc	505
1053	sym	Len	{}	{int}	RelocByOff	507
1054	sym	Swap	{int,int}	{}	RelocByOff	507
1055	sym	Less	{int,int}	{bool}	RelocByOff	507
1056	sym	String	{}	{string}	*Symbol	510
1057	sym	IsFileLocal	{}	{bool}	*Symbol	510
1058	sym	ElfsymForReloc	{}	{int32}	*Symbol	510
1059	sym	Len	{}	{int64}	*Symbol	510
1060	sym	Grow	{int64}	{}	*Symbol	510
1061	sym	AddBytes	{[]byte}	{int64}	*Symbol	510
1062	sym	AddUint8	{uint8}	{int64}	*Symbol	510
1063	sym	AddUint16	{*sys.Arch,uint16}	{int64}	*Symbol	510
1064	sym	AddUint32	{*sys.Arch,uint32}	{int64}	*Symbol	510
1065	sym	AddUint64	{*sys.Arch,uint64}	{int64}	*Symbol	510
1066	sym	AddUint	{*sys.Arch,uint64}	{int64}	*Symbol	510
1067	sym	SetUint8	{*sys.Arch,int64,uint8}	{int64}	*Symbol	510
1068	sym	SetUint16	{*sys.Arch,int64,uint16}	{int64}	*Symbol	510
1069	sym	SetUint32	{*sys.Arch,int64,uint32}	{int64}	*Symbol	510
1070	sym	SetUint	{*sys.Arch,int64,uint64}	{int64}	*Symbol	510
1071	sym	AddAddrPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	510
1072	sym	AddCURelativeAddrPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	510
1073	sym	AddPCRelPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	510
1074	sym	AddAddr	{*sys.Arch,*sym.Symbol}	{int64}	*Symbol	510
1075	sym	SetAddrPlus	{*sys.Arch,int64,*sym.Symbol,int64}	{int64}	*Symbol	510
1076	sym	SetAddr	{*sys.Arch,int64,*sym.Symbol}	{int64}	*Symbol	510
1077	sym	AddSize	{*sys.Arch,*sym.Symbol}	{int64}	*Symbol	510
1078	sym	AddAddrPlus4	{*sym.Symbol,int64}	{int64}	*Symbol	510
1079	sym	AddRel	{}	{*sym.Reloc}	*Symbol	510
1080	sym	AddUintXX	{*sys.Arch,uint64,int}	{int64}	*Symbol	510
1081	sym	Extname	{}	{string}	*Symbol	510
1082	sym	SetExtname	{string}	{}	*Symbol	510
1083	sym	Dynimplib	{}	{string}	*Symbol	510
1084	sym	Dynimpvers	{}	{string}	*Symbol	510
1085	sym	SetDynimplib	{string}	{}	*Symbol	510
1086	sym	SetDynimpvers	{string}	{}	*Symbol	510
1087	sym	ResetDyninfo	{}	{}	*Symbol	510
1088	sym	Localentry	{}	{uint8}	*Symbol	510
1089	sym	SetLocalentry	{uint8}	{}	*Symbol	510
1090	sym	Plt	{}	{int32}	*Symbol	510
1091	sym	SetPlt	{int32}	{}	*Symbol	510
1092	sym	Got	{}	{int32}	*Symbol	510
1093	sym	SetGot	{int32}	{}	*Symbol	510
1094	sym	ElfType	{}	{elf.SymType}	*Symbol	510
1095	sym	SetElfType	{elf.SymType}	{}	*Symbol	510
1096	sym	Newsym	{string,int}	{*sym.Symbol}	*Symbols	516
1097	sym	Lookup	{string,int}	{*sym.Symbol}	*Symbols	516
1098	sym	ROLookup	{string,int}	{*sym.Symbol}	*Symbols	516
1099	sym	IncVersion	{}	{int}	*Symbols	516
1100	sym	Rename	{string,string,int,map[*sym.Symbol]*sym.Symbol}	{}	*Symbols	516
1101	sym	String	{}	{string}	SymKind	517
1102	main	String	{}	{string}	*Entry	519
1103	main	URL	{}	{string}	Range	522
1104	binutils	String	{}	{string}	*Binutils	545
1105	binutils	SetFastSymbolization	{bool}	{}	*Binutils	545
1106	binutils	SetTools	{string}	{}	*Binutils	545
1107	binutils	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}	*Binutils	545
1108	binutils	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}	*Binutils	545
1109	driver	Bool	{string,bool,string}	{*bool}	*GoFlags	547
1110	driver	Int	{string,int,string}	{*int}	*GoFlags	547
1111	driver	Float64	{string,float64,string}	{*float64}	*GoFlags	547
1112	driver	String	{string,string,string}	{*string}	*GoFlags	547
1113	driver	BoolVar	{*bool,string,bool,string}	{}	*GoFlags	547
1114	driver	IntVar	{*int,string,int,string}	{}	*GoFlags	547
1115	driver	Float64Var	{*float64,string,float64,string}	{}	*GoFlags	547
1116	driver	StringVar	{*string,string,string,string}	{}	*GoFlags	547
1117	driver	StringList	{string,string,string}	{*[]*string}	*GoFlags	547
1118	driver	ExtraUsage	{}	{string}	*GoFlags	547
1119	driver	AddExtraUsage	{string}	{}	*GoFlags	547
1120	driver	Parse	{func()}	{[]string}	*GoFlags	547
1121	graph	TrimTree	{graph.NodePtrSet}	{}	*Graph	551
1122	graph	String	{}	{string}	*Graph	551
1123	graph	DiscardLowFrequencyNodes	{int64}	{graph.NodeSet}	*Graph	551
1124	graph	DiscardLowFrequencyNodePtrs	{int64}	{graph.NodePtrSet}	*Graph	551
1125	graph	TrimLowFrequencyTags	{int64}	{}	*Graph	551
1126	graph	TrimLowFrequencyEdges	{int64}	{int}	*Graph	551
1127	graph	SortNodes	{bool,bool}	{}	*Graph	551
1128	graph	SelectTopNodePtrs	{int,bool}	{graph.NodePtrSet}	*Graph	551
1129	graph	SelectTopNodes	{int,bool}	{graph.NodeSet}	*Graph	551
1130	graph	RemoveRedundantEdges	{}	{}	*Graph	551
1131	graph	Sum	{}	{int64,int64}	Nodes	553
1132	graph	Sort	{graph.NodeOrder}	{error}	Nodes	553
1133	graph	FlatValue	{}	{int64}	*Node	554
1134	graph	CumValue	{}	{int64}	*Node	554
1135	graph	AddToEdge	{*graph.Node,int64,bool,bool}	{}	*Node	554
1136	graph	AddToEdgeDiv	{*graph.Node,int64,int64,bool,bool}	{}	*Node	554
1137	graph	PrintableName	{}	{string}	*NodeInfo	555
1138	graph	NameComponents	{}	{[]string}	*NodeInfo	555
1139	graph	FindOrInsertNode	{graph.NodeInfo,graph.NodeSet}	{*graph.Node}	NodeMap	556
1140	graph	Sort	{}	{[]*graph.Edge}	EdgeMap	559
1141	graph	Sum	{}	{int64}	EdgeMap	559
1142	graph	WeightValue	{}	{int64}	*Edge	560
1143	graph	FlatValue	{}	{int64}	*Tag	561
1144	graph	CumValue	{}	{int64}	*Tag	561
1145	report	Total	{}	{int64}	*Report	579
1146	symbolizer	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}	*Symbolizer	580
1147	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	582
1148	profile	ShowFrom	{*regexp.Regexp}	{bool}	*Profile	582
1149	profile	FilterTagsByName	{*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	582
1150	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	582
1151	profile	SampleIndexByName	{string}	{int,error}	*Profile	582
1152	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	582
1153	profile	ParseMemoryMapFromScanner	{*bufio.Scanner}	{error}	*Profile	582
1154	profile	Compact	{}	{*profile.Profile}	*Profile	582
1155	profile	Normalize	{*profile.Profile}	{error}	*Profile	582
1156	profile	Write	{io.Writer}	{error}	*Profile	582
1157	profile	WriteUncompressed	{io.Writer}	{error}	*Profile	582
1158	profile	CheckValid	{}	{error}	*Profile	582
1159	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	582
1160	profile	NumLabelUnits	{}	{map[string]string,map[string][]string}	*Profile	582
1161	profile	String	{}	{string}	*Profile	582
1162	profile	SetLabel	{string,[]string}	{}	*Profile	582
1163	profile	RemoveLabel	{string}	{}	*Profile	582
1164	profile	Scale	{float64}	{}	*Profile	582
1165	profile	ScaleN	{[]float64}	{error}	*Profile	582
1166	profile	HasFunctions	{}	{bool}	*Profile	582
1167	profile	HasFileLines	{}	{bool}	*Profile	582
1168	profile	Copy	{}	{*profile.Profile}	*Profile	582
1169	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	582
1170	profile	RemoveUninteresting	{}	{error}	*Profile	582
1171	profile	PruneFrom	{*regexp.Regexp}	{}	*Profile	582
1172	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	582
1173	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	582
1174	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	582
1175	profile	Write	{io.Writer}	{error}	*Profile	582
1176	profile	CheckValid	{}	{error}	*Profile	582
1177	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	582
1178	profile	String	{}	{string}	*Profile	582
1179	profile	Merge	{*profile.Profile,float64}	{error}	*Profile	582
1180	profile	Compatible	{*profile.Profile}	{error}	*Profile	582
1181	profile	HasFunctions	{}	{bool}	*Profile	582
1182	profile	HasFileLines	{}	{bool}	*Profile	582
1183	profile	Copy	{}	{*profile.Profile}	*Profile	582
1184	profile	Demangle	{profile.Demangler}	{error}	*Profile	582
1185	profile	Empty	{}	{bool}	*Profile	582
1186	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	582
1520	unix	SetLen	{int}	{}	*Iovec	780
1187	profile	RemoveUninteresting	{}	{error}	*Profile	582
1188	profile	HasLabel	{string,string}	{bool}	*Sample	584
1189	profile	DiffBaseSample	{}	{bool}	*Sample	584
1190	profile	Unsymbolizable	{}	{bool}	*Mapping	585
1191	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Name	590
1192	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Name	590
1193	demangle	GoString	{}	{string}	*Name	590
1194	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Typed	591
1195	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Typed	591
1196	demangle	GoString	{}	{string}	*Typed	591
1197	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Qualified	592
1198	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Qualified	592
1199	demangle	GoString	{}	{string}	*Qualified	592
1200	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Template	593
1201	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Template	593
1202	demangle	GoString	{}	{string}	*Template	593
1203	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TemplateParam	594
1204	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TemplateParam	594
1205	demangle	GoString	{}	{string}	*TemplateParam	594
1206	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TypeWithQualifiers	596
1207	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TypeWithQualifiers	596
1208	demangle	GoString	{}	{string}	*TypeWithQualifiers	596
1209	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*MethodWithQualifiers	597
1210	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*MethodWithQualifiers	597
1211	demangle	GoString	{}	{string}	*MethodWithQualifiers	597
1212	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*BuiltinType	598
1213	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*BuiltinType	598
1214	demangle	GoString	{}	{string}	*BuiltinType	598
1215	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PointerType	599
1216	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PointerType	599
1217	demangle	GoString	{}	{string}	*PointerType	599
1218	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ReferenceType	600
1219	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ReferenceType	600
1220	demangle	GoString	{}	{string}	*ReferenceType	600
1221	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*RvalueReferenceType	601
1222	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*RvalueReferenceType	601
1223	demangle	GoString	{}	{string}	*RvalueReferenceType	601
1224	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ComplexType	602
1225	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ComplexType	602
1226	demangle	GoString	{}	{string}	*ComplexType	602
1227	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ImaginaryType	603
1228	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ImaginaryType	603
1229	demangle	GoString	{}	{string}	*ImaginaryType	603
1230	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VendorQualifier	604
1231	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VendorQualifier	604
1232	demangle	GoString	{}	{string}	*VendorQualifier	604
1233	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArrayType	605
1234	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArrayType	605
1235	demangle	GoString	{}	{string}	*ArrayType	605
1236	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionType	606
1237	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionType	606
1238	demangle	GoString	{}	{string}	*FunctionType	606
1239	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionParam	607
1240	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionParam	607
1241	demangle	GoString	{}	{string}	*FunctionParam	607
1242	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PtrMem	608
1243	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PtrMem	608
1244	demangle	GoString	{}	{string}	*PtrMem	608
1245	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FixedType	609
1246	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FixedType	609
1247	demangle	GoString	{}	{string}	*FixedType	609
1248	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VectorType	610
1249	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VectorType	610
1250	demangle	GoString	{}	{string}	*VectorType	610
1251	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Decltype	611
1252	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Decltype	611
1253	demangle	GoString	{}	{string}	*Decltype	611
1254	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Operator	612
1255	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Operator	612
1256	demangle	GoString	{}	{string}	*Operator	612
1257	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Constructor	613
1258	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Constructor	613
1259	demangle	GoString	{}	{string}	*Constructor	613
1260	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Destructor	614
1261	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Destructor	614
1262	demangle	GoString	{}	{string}	*Destructor	614
1263	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*GlobalCDtor	615
1264	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*GlobalCDtor	615
1265	demangle	GoString	{}	{string}	*GlobalCDtor	615
1266	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TaggedName	616
1267	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TaggedName	616
1268	demangle	GoString	{}	{string}	*TaggedName	616
1269	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PackExpansion	617
1270	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PackExpansion	617
1271	demangle	GoString	{}	{string}	*PackExpansion	617
1272	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArgumentPack	618
1273	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArgumentPack	618
1274	demangle	GoString	{}	{string}	*ArgumentPack	618
1275	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofPack	619
1276	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofPack	619
1277	demangle	GoString	{}	{string}	*SizeofPack	619
1278	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofArgs	620
1279	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofArgs	620
1280	demangle	GoString	{}	{string}	*SizeofArgs	620
1281	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Cast	621
1282	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Cast	621
1283	demangle	GoString	{}	{string}	*Cast	621
1284	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Nullary	622
1285	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Nullary	622
1286	demangle	GoString	{}	{string}	*Nullary	622
1287	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Unary	623
1288	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Unary	623
1289	demangle	GoString	{}	{string}	*Unary	623
1290	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Binary	624
1291	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Binary	624
1292	demangle	GoString	{}	{string}	*Binary	624
1293	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Trinary	625
1294	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Trinary	625
1295	demangle	GoString	{}	{string}	*Trinary	625
1296	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Fold	626
1297	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Fold	626
1298	demangle	GoString	{}	{string}	*Fold	626
1299	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*New	627
1300	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*New	627
1301	demangle	GoString	{}	{string}	*New	627
1302	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Literal	628
1303	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Literal	628
1304	demangle	GoString	{}	{string}	*Literal	628
1305	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ExprList	629
1306	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ExprList	629
1307	demangle	GoString	{}	{string}	*ExprList	629
1308	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*InitializerList	630
1309	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*InitializerList	630
1310	demangle	GoString	{}	{string}	*InitializerList	630
1311	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*DefaultArg	631
1312	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*DefaultArg	631
1313	demangle	GoString	{}	{string}	*DefaultArg	631
1314	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Closure	632
1315	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Closure	632
1316	demangle	GoString	{}	{string}	*Closure	632
1317	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*UnnamedType	633
1318	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*UnnamedType	633
1319	demangle	GoString	{}	{string}	*UnnamedType	633
1320	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Clone	634
1321	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Clone	634
1322	demangle	GoString	{}	{string}	*Clone	634
1323	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special	635
1324	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special	635
1325	demangle	GoString	{}	{string}	*Special	635
1326	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special2	636
1327	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special2	636
1328	demangle	GoString	{}	{string}	*Special2	636
1329	armasm	String	{}	{string}	Mode	638
1330	armasm	String	{}	{string}	Op	639
1331	armasm	String	{}	{string}	Inst	640
1332	armasm	IsArg	{}	{}	Float32Imm	643
1333	armasm	String	{}	{string}	Float32Imm	643
1334	armasm	IsArg	{}	{}	Float64Imm	644
1335	armasm	String	{}	{string}	Float64Imm	644
1336	armasm	IsArg	{}	{}	Imm	645
1337	armasm	String	{}	{string}	Imm	645
1338	armasm	IsArg	{}	{}	ImmAlt	646
1339	armasm	Imm	{}	{armasm.Imm}	ImmAlt	646
1340	armasm	String	{}	{string}	ImmAlt	646
1341	armasm	IsArg	{}	{}	Label	647
1342	armasm	String	{}	{string}	Label	647
1343	armasm	IsArg	{}	{}	Reg	648
1344	armasm	String	{}	{string}	Reg	648
1345	armasm	IsArg	{}	{}	RegX	649
1346	armasm	String	{}	{string}	RegX	649
1347	armasm	IsArg	{}	{}	RegList	650
1348	armasm	String	{}	{string}	RegList	650
1349	armasm	IsArg	{}	{}	Endian	651
1350	armasm	String	{}	{string}	Endian	651
1351	armasm	String	{}	{string}	Shift	652
1352	armasm	IsArg	{}	{}	RegShift	653
1353	armasm	String	{}	{string}	RegShift	653
1354	armasm	IsArg	{}	{}	RegShiftReg	654
1355	armasm	String	{}	{string}	RegShiftReg	654
1356	armasm	IsArg	{}	{}	PCRel	655
1357	armasm	String	{}	{string}	PCRel	655
1358	armasm	IsArg	{}	{}	Mem	657
1359	armasm	String	{}	{string}	Mem	657
1360	arm64asm	String	{}	{string}	Op	659
1361	arm64asm	String	{}	{string}	Inst	660
1362	arm64asm	String	{}	{string}	Reg	663
1363	arm64asm	String	{}	{string}	RegSP	664
1364	arm64asm	String	{}	{string}	ImmShift	665
1365	arm64asm	String	{}	{string}	ExtShift	666
1366	arm64asm	String	{}	{string}	RegExtshiftAmount	667
1367	arm64asm	String	{}	{string}	PCRel	668
1368	arm64asm	String	{}	{string}	MemImmediate	670
1369	arm64asm	String	{}	{string}	MemExtend	671
1370	arm64asm	String	{}	{string}	Imm	672
1371	arm64asm	String	{}	{string}	Imm64	673
1372	arm64asm	String	{}	{string}	Imm_hint	674
1373	arm64asm	String	{}	{string}	Imm_clrex	675
1374	arm64asm	String	{}	{string}	Imm_dcps	676
1375	arm64asm	String	{}	{string}	Cond	677
1376	arm64asm	String	{}	{string}	Imm_c	678
1377	arm64asm	String	{}	{string}	Imm_option	679
1378	arm64asm	String	{}	{string}	Imm_prfop	680
1379	arm64asm	String	{}	{string}	Pstatefield	681
1380	arm64asm	String	{}	{string}	Systemreg	682
1381	arm64asm	String	{}	{string}	Imm_fp	683
1382	arm64asm	String	{}	{string}	Arrangement	684
1383	arm64asm	String	{}	{string}	RegisterWithArrangement	685
1384	arm64asm	String	{}	{string}	RegisterWithArrangementAndIndex	686
1385	ppc64asm	String	{}	{string}	ArgType	687
1386	ppc64asm	GoString	{}	{string}	ArgType	687
1387	ppc64asm	String	{}	{string}	BitField	688
1388	ppc64asm	Parse	{uint32}	{uint32}	BitField	688
1389	ppc64asm	ParseSigned	{uint32}	{int32}	BitField	688
1390	ppc64asm	String	{}	{string}	BitFields	689
1391	ppc64asm	Append	{ppc64asm.BitField}	{}	*BitFields	689
1392	ppc64asm	Parse	{uint32}	{uint32}	BitFields	689
1393	ppc64asm	ParseSigned	{uint32}	{int32}	BitFields	689
1394	ppc64asm	String	{}	{string}	Inst	690
1395	ppc64asm	String	{}	{string}	Op	691
1396	ppc64asm	IsArg	{}	{}	Reg	694
1397	ppc64asm	String	{}	{string}	Reg	694
1398	ppc64asm	IsArg	{}	{}	CondReg	695
1399	ppc64asm	String	{}	{string}	CondReg	695
1400	ppc64asm	IsArg	{}	{}	SpReg	696
1401	ppc64asm	String	{}	{string}	SpReg	696
1402	ppc64asm	IsArg	{}	{}	PCRel	697
1403	ppc64asm	String	{}	{string}	PCRel	697
1404	ppc64asm	IsArg	{}	{}	Label	698
1405	ppc64asm	String	{}	{string}	Label	698
1406	ppc64asm	IsArg	{}	{}	Imm	699
1407	ppc64asm	String	{}	{string}	Imm	699
1408	ppc64asm	IsArg	{}	{}	Offset	700
1409	ppc64asm	String	{}	{string}	Offset	700
1410	x86asm	String	{}	{string}	Inst	701
1411	x86asm	IsREX	{}	{bool}	Prefix	703
1412	x86asm	IsVEX	{}	{bool}	Prefix	703
1413	x86asm	String	{}	{string}	Prefix	703
1414	x86asm	String	{}	{string}	Op	704
1415	x86asm	String	{}	{string}	Reg	707
1416	x86asm	String	{}	{string}	Mem	708
1417	x86asm	String	{}	{string}	Rel	709
1418	x86asm	String	{}	{string}	Imm	710
1419	terminal	Write	{[]byte}	{int,error}	*Terminal	713
1420	terminal	ReadPassword	{string}	{string,error}	*Terminal	713
1421	terminal	ReadLine	{}	{string,error}	*Terminal	713
1422	terminal	SetPrompt	{string}	{}	*Terminal	713
1423	terminal	SetSize	{int,int}	{error}	*Terminal	713
1424	terminal	SetBracketedPasteMode	{bool}	{}	*Terminal	713
1425	unix	Zero	{}	{}	*CPUSet	718
1426	unix	Set	{int}	{}	*CPUSet	718
1427	unix	Clear	{int}	{}	*CPUSet	718
1428	unix	IsSet	{int}	{bool}	*CPUSet	718
1429	unix	Count	{}	{int}	*CPUSet	718
1430	unix	Stopped	{}	{bool}	WaitStatus	723
1431	unix	StopSignal	{}	{unix.Signal}	WaitStatus	723
1432	unix	Exited	{}	{bool}	WaitStatus	723
1433	unix	ExitStatus	{}	{int}	WaitStatus	723
1434	unix	Signaled	{}	{bool}	WaitStatus	723
1435	unix	Signal	{}	{unix.Signal}	WaitStatus	723
1436	unix	Continued	{}	{bool}	WaitStatus	723
1437	unix	CoreDump	{}	{bool}	WaitStatus	723
1438	unix	TrapCause	{}	{int}	WaitStatus	723
1439	unix	Exited	{}	{bool}	WaitStatus	723
1440	unix	ExitStatus	{}	{int}	WaitStatus	723
1441	unix	Signaled	{}	{bool}	WaitStatus	723
1442	unix	Signal	{}	{syscall.Signal}	WaitStatus	723
1443	unix	CoreDump	{}	{bool}	WaitStatus	723
1444	unix	Stopped	{}	{bool}	WaitStatus	723
1445	unix	Continued	{}	{bool}	WaitStatus	723
1446	unix	StopSignal	{}	{syscall.Signal}	WaitStatus	723
1447	unix	TrapCause	{}	{int}	WaitStatus	723
1448	unix	Exited	{}	{bool}	WaitStatus	723
1449	unix	Signaled	{}	{bool}	WaitStatus	723
1450	unix	Stopped	{}	{bool}	WaitStatus	723
1451	unix	Continued	{}	{bool}	WaitStatus	723
1452	unix	CoreDump	{}	{bool}	WaitStatus	723
1453	unix	ExitStatus	{}	{int}	WaitStatus	723
1454	unix	Signal	{}	{syscall.Signal}	WaitStatus	723
1455	unix	StopSignal	{}	{syscall.Signal}	WaitStatus	723
1456	unix	TrapCause	{}	{int}	WaitStatus	723
1457	unix	Exited	{}	{bool}	WaitStatus	723
1458	unix	ExitStatus	{}	{int}	WaitStatus	723
1459	unix	Signaled	{}	{bool}	WaitStatus	723
1460	unix	Signal	{}	{syscall.Signal}	WaitStatus	723
1461	unix	CoreDump	{}	{bool}	WaitStatus	723
1462	unix	Stopped	{}	{bool}	WaitStatus	723
1463	unix	Continued	{}	{bool}	WaitStatus	723
1464	unix	StopSignal	{}	{syscall.Signal}	WaitStatus	723
1465	unix	TrapCause	{}	{int}	WaitStatus	723
1466	unix	Size	{}	{int}	*FileHandle	739
1467	unix	Type	{}	{int32}	*FileHandle	739
1468	unix	Bytes	{}	{[]byte}	*FileHandle	739
1469	unix	Unix	{}	{int64,int64}	*Timespec	757
1470	unix	Nano	{}	{int64}	*Timespec	757
1471	unix	Unix	{}	{int64,int64}	*Timeval	759
1472	unix	Nano	{}	{int64}	*Timeval	759
1473	unix	SetLen	{int}	{}	*Cmsghdr	778
1474	unix	SetLen	{int}	{}	*Cmsghdr	778
1475	unix	SetLen	{int}	{}	*Cmsghdr	778
1476	unix	SetLen	{int}	{}	*Cmsghdr	778
1477	unix	SetLen	{int}	{}	*Cmsghdr	778
1478	unix	SetLen	{int}	{}	*Cmsghdr	778
1479	unix	SetLen	{int}	{}	*Cmsghdr	778
1480	unix	SetLen	{int}	{}	*Cmsghdr	778
1481	unix	SetLen	{int}	{}	*Cmsghdr	778
1482	unix	SetLen	{int}	{}	*Cmsghdr	778
1483	unix	SetLen	{int}	{}	*Cmsghdr	778
1484	unix	SetLen	{int}	{}	*Cmsghdr	778
1485	unix	SetLen	{int}	{}	*Cmsghdr	778
1486	unix	SetLen	{int}	{}	*Cmsghdr	778
1487	unix	SetLen	{int}	{}	*Cmsghdr	778
1488	unix	SetLen	{int}	{}	*Cmsghdr	778
1489	unix	SetLen	{int}	{}	*Cmsghdr	778
1490	unix	SetLen	{int}	{}	*Cmsghdr	778
1491	unix	SetLen	{int}	{}	*Cmsghdr	778
1492	unix	SetLen	{int}	{}	*Cmsghdr	778
1493	unix	SetLen	{int}	{}	*Cmsghdr	778
1494	unix	SetLen	{int}	{}	*Cmsghdr	778
1495	unix	SetLen	{int}	{}	*Cmsghdr	778
1496	unix	SetLen	{int}	{}	*Cmsghdr	778
1497	unix	SetLen	{int}	{}	*Cmsghdr	778
1498	unix	SetLen	{int}	{}	*Cmsghdr	778
1499	unix	SetLen	{int}	{}	*Cmsghdr	778
1500	unix	SetLen	{int}	{}	*Cmsghdr	778
1501	unix	SetLen	{int}	{}	*Cmsghdr	778
1502	unix	SetLen	{int}	{}	*Cmsghdr	778
1503	unix	SetLen	{int}	{}	*Iovec	780
1504	unix	SetLen	{int}	{}	*Iovec	780
1505	unix	SetLen	{int}	{}	*Iovec	780
1506	unix	SetLen	{int}	{}	*Iovec	780
1507	unix	SetLen	{int}	{}	*Iovec	780
1508	unix	SetLen	{int}	{}	*Iovec	780
1509	unix	SetLen	{int}	{}	*Iovec	780
1510	unix	SetLen	{int}	{}	*Iovec	780
1511	unix	SetLen	{int}	{}	*Iovec	780
1512	unix	SetLen	{int}	{}	*Iovec	780
1513	unix	SetLen	{int}	{}	*Iovec	780
1514	unix	SetLen	{int}	{}	*Iovec	780
1515	unix	SetLen	{int}	{}	*Iovec	780
1516	unix	SetLen	{int}	{}	*Iovec	780
1517	unix	SetLen	{int}	{}	*Iovec	780
1518	unix	SetLen	{int}	{}	*Iovec	780
1519	unix	SetLen	{int}	{}	*Iovec	780
1521	unix	SetLen	{int}	{}	*Iovec	780
1522	unix	SetLen	{int}	{}	*Iovec	780
1523	unix	SetLen	{int}	{}	*Iovec	780
1524	unix	SetLen	{int}	{}	*Iovec	780
1525	unix	SetLen	{int}	{}	*Iovec	780
1526	unix	SetLen	{int}	{}	*Iovec	780
1527	unix	SetLen	{int}	{}	*Iovec	780
1528	unix	SetLen	{int}	{}	*Iovec	780
1529	unix	SetLen	{int}	{}	*Iovec	780
1530	unix	SetLen	{int}	{}	*Iovec	780
1531	unix	SetLen	{int}	{}	*Iovec	780
1532	unix	SetLen	{int}	{}	*Iovec	780
1533	unix	SetControllen	{int}	{}	*Msghdr	785
1534	unix	SetControllen	{int}	{}	*Msghdr	785
1535	unix	SetControllen	{int}	{}	*Msghdr	785
1536	unix	SetControllen	{int}	{}	*Msghdr	785
1537	unix	SetControllen	{int}	{}	*Msghdr	785
1538	unix	SetControllen	{int}	{}	*Msghdr	785
1539	unix	SetControllen	{int}	{}	*Msghdr	785
1540	unix	SetControllen	{int}	{}	*Msghdr	785
1541	unix	SetControllen	{int}	{}	*Msghdr	785
1542	unix	SetControllen	{int}	{}	*Msghdr	785
1543	unix	SetControllen	{int}	{}	*Msghdr	785
1544	unix	SetControllen	{int}	{}	*Msghdr	785
1545	unix	SetControllen	{int}	{}	*Msghdr	785
1546	unix	SetControllen	{int}	{}	*Msghdr	785
1547	unix	SetControllen	{int}	{}	*Msghdr	785
1548	unix	SetControllen	{int}	{}	*Msghdr	785
1549	unix	SetControllen	{int}	{}	*Msghdr	785
1550	unix	SetControllen	{int}	{}	*Msghdr	785
1551	unix	SetControllen	{int}	{}	*Msghdr	785
1552	unix	SetControllen	{int}	{}	*Msghdr	785
1553	unix	SetControllen	{int}	{}	*Msghdr	785
1554	unix	SetControllen	{int}	{}	*Msghdr	785
1555	unix	SetControllen	{int}	{}	*Msghdr	785
1556	unix	SetControllen	{int}	{}	*Msghdr	785
1557	unix	SetControllen	{int}	{}	*Msghdr	785
1558	unix	SetControllen	{int}	{}	*Msghdr	785
1559	unix	SetControllen	{int}	{}	*Msghdr	785
1560	unix	SetControllen	{int}	{}	*Msghdr	785
1561	unix	SetControllen	{int}	{}	*Msghdr	785
1562	unix	PC	{}	{uint64}	*PtraceRegs	1325
1563	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1564	unix	PC	{}	{uint64}	*PtraceRegs	1325
1565	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1566	unix	PC	{}	{uint64}	*PtraceRegs	1325
1567	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1568	unix	PC	{}	{uint64}	*PtraceRegs	1325
1569	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1570	unix	PC	{}	{uint64}	*PtraceRegs	1325
1571	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1572	unix	PC	{}	{uint64}	*PtraceRegs	1325
1573	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1574	unix	PC	{}	{uint64}	*PtraceRegs	1325
1575	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1576	unix	PC	{}	{uint64}	*PtraceRegs	1325
1577	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1578	unix	PC	{}	{uint64}	*PtraceRegs	1325
1579	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1580	unix	PC	{}	{uint64}	*PtraceRegs	1325
1581	unix	SetPC	{uint64}	{}	*PtraceRegs	1325
1582	windows	Error	{}	{string}	*DLLError	3358
1583	windows	FindProc	{string}	{*windows.Proc,error}	*DLL	3359
1584	windows	MustFindProc	{string}	{*windows.Proc}	*DLL	3359
1585	windows	Release	{}	{error}	*DLL	3359
1586	windows	Addr	{}	{uintptr}	*Proc	3360
1587	windows	Call	{...uintptr}	{uintptr,error}	*Proc	3360
1588	windows	Load	{}	{error}	*LazyDLL	3361
1589	windows	Handle	{}	{uintptr}	*LazyDLL	3361
1590	windows	NewProc	{string}	{*windows.LazyProc}	*LazyDLL	3361
1591	windows	Find	{}	{error}	*LazyProc	3362
1592	windows	Addr	{}	{uintptr}	*LazyProc	3362
1593	windows	Call	{...uintptr}	{uintptr,error}	*LazyProc	3362
1594	windows	String	{}	{string,error}	*SID	3365
1595	windows	Len	{}	{int}	*SID	3365
1596	windows	Copy	{}	{*windows.SID,error}	*SID	3365
1597	windows	LookupAccount	{string}	{string,uint32,error}	*SID	3365
1598	windows	Close	{}	{error}	Token	3371
1599	windows	GetTokenUser	{}	{*windows.Tokenuser,error}	Token	3371
1600	windows	GetTokenGroups	{}	{*windows.Tokengroups,error}	Token	3371
1601	windows	GetTokenPrimaryGroup	{}	{*windows.Tokenprimarygroup,error}	Token	3371
1602	windows	GetUserProfileDirectory	{}	{string,error}	Token	3371
1603	windows	IsMember	{*windows.SID}	{bool,error}	Token	3371
1604	windows	Sockaddr	{}	{windows.Sockaddr,error}	*RawSockaddrAny	3384
1605	windows	Exited	{}	{bool}	WaitStatus	3391
1606	windows	ExitStatus	{}	{int}	WaitStatus	3391
1607	windows	Signal	{}	{windows.Signal}	WaitStatus	3391
1608	windows	CoreDump	{}	{bool}	WaitStatus	3391
1609	windows	Stopped	{}	{bool}	WaitStatus	3391
1610	windows	Continued	{}	{bool}	WaitStatus	3391
1611	windows	StopSignal	{}	{windows.Signal}	WaitStatus	3391
1612	windows	Signaled	{}	{bool}	WaitStatus	3391
1613	windows	TrapCause	{}	{int}	WaitStatus	3391
1614	windows	Unix	{}	{int64,int64}	*Timespec	3392
1615	windows	Nano	{}	{int64}	*Timespec	3392
1616	windows	Signal	{}	{}	Signal	3396
1617	windows	String	{}	{string}	Signal	3396
1618	windows	Unix	{}	{int64,int64}	*Timeval	3398
1619	windows	Nano	{}	{int64}	*Timeval	3398
1620	windows	Nanoseconds	{}	{int64}	*Timeval	3398
1621	windows	Nanoseconds	{}	{int64}	*Filetime	3402
1622	analysis	String	{}	{string}	*Analyzer	3464
1623	analysis	Reportf	{token.Pos,string,"...interface{}"}	{}	*Pass	3465
1624	analysis	String	{}	{string}	*Pass	3465
1625	analysisflags	Add	{*token.FileSet,string,string,[]analysis.Diagnostic,error}	{}	JSONTree	3470
1626	analysisflags	Print	{}	{}	JSONTree	3470
1627	facts	ImportObjectFact	{types.Object,analysis.Fact}	{bool}	*Set	3471
1628	facts	ExportObjectFact	{types.Object,analysis.Fact}	{}	*Set	3471
1629	facts	ImportPackageFact	{*types.Package,analysis.Fact}	{bool}	*Set	3471
1630	facts	ExportPackageFact	{analysis.Fact}	{}	*Set	3471
1631	facts	Encode	{}	{[]byte}	*Set	3471
1632	facts	String	{}	{string}	*Set	3471
1633	ctrlflow	FuncDecl	{*ast.FuncDecl}	{*cfg.CFG}	*CFGs	3472
1634	ctrlflow	FuncLit	{*ast.FuncLit}	{*cfg.CFG}	*CFGs	3472
1635	astutil	Node	{}	{ast.Node}	*Cursor	3475
1636	astutil	Parent	{}	{ast.Node}	*Cursor	3475
1637	astutil	Name	{}	{string}	*Cursor	3475
1638	astutil	Index	{}	{int}	*Cursor	3475
1639	astutil	Replace	{ast.Node}	{}	*Cursor	3475
1640	astutil	Delete	{}	{}	*Cursor	3475
1641	astutil	InsertAfter	{ast.Node}	{}	*Cursor	3475
1642	astutil	InsertBefore	{ast.Node}	{}	*Cursor	3475
1643	inspector	Preorder	{[]ast.Node,func(ast.Node)}	{}	*Inspector	3476
1644	inspector	Nodes	{[]ast.Node,"func(ast.Node, bool) bool"}	{}	*Inspector	3476
1645	inspector	WithStack	{[]ast.Node,"func(ast.Node, bool, []ast.Node) bool"}	{}	*Inspector	3476
1646	cfg	Format	{*token.FileSet}	{string}	*CFG	3477
1647	cfg	String	{}	{string}	*Block	3478
1648	cfg	Return	{}	{*ast.ReturnStmt}	*Block	3478
1649	typeutil	SetHasher	{typeutil.Hasher}	{}	*Map	3480
1650	typeutil	Delete	{types.Type}	{bool}	*Map	3480
1651	typeutil	At	{types.Type}	{"interface{}"}	*Map	3480
1652	typeutil	Set	{types.Type,"interface{}"}	{"interface{}"}	*Map	3480
1653	typeutil	Len	{}	{int}	*Map	3480
1654	typeutil	Iterate	{"func(types.Type, interface{})"}	{}	*Map	3480
1655	typeutil	Keys	{}	{[]types.Type}	*Map	3480
1656	typeutil	String	{}	{string}	*Map	3480
1657	typeutil	KeysString	{}	{string}	*Map	3480
1658	typeutil	Hash	{types.Type}	{uint32}	Hasher	3481
1659	typeutil	MethodSet	{types.Type}	{*types.MethodSet}	*MethodSetCache	3482
1660	assign	SetX	{int,"chan int\n"}	{}	*ST	3483
1661	method	Scan	{fmt.ScanState,byte}	{}	*MethodTest	3484
1662	print	Format	{fmt.State,rune}	{}	*BoolFormatter	3485
1663	print	Format	{fmt.State,rune}	{}	FormatterVal	3486
1664	bzip2	Error	{}	{string}	StructuralError	3495
1665	flate	Write	{[]byte}	{int,error}	*Writer	3496
1666	flate	Flush	{}	{error}	*Writer	3496
1667	flate	Close	{}	{error}	*Writer	3496
1668	flate	Reset	{io.Writer}	{}	*Writer	3496
1669	flate	Error	{}	{string}	CorruptInputError	3497
1670	flate	Error	{}	{string}	InternalError	3498
1671	flate	Error	{}	{string}	*ReadError	3499
1672	flate	Error	{}	{string}	*WriteError	3500
1673	gzip	Reset	{io.Reader}	{error}	*Reader	3504
1674	gzip	Multistream	{bool}	{}	*Reader	3504
1675	gzip	Read	{[]byte}	{int,error}	*Reader	3504
1676	gzip	Close	{}	{error}	*Reader	3504
1677	gzip	Reset	{io.Writer}	{}	*Writer	3505
1678	gzip	Write	{[]byte}	{int,error}	*Writer	3505
1679	gzip	Flush	{}	{error}	*Writer	3505
1680	gzip	Close	{}	{error}	*Writer	3505
1681	zlib	Reset	{io.Writer}	{}	*Writer	3508
1682	zlib	Write	{[]byte}	{int,error}	*Writer	3508
1683	zlib	Flush	{}	{error}	*Writer	3508
1684	zlib	Close	{}	{error}	*Writer	3508
1685	list	Next	{}	{*list.Element}	*Element	3510
1686	list	Prev	{}	{*list.Element}	*Element	3510
1687	list	Init	{}	{*list.List}	*List	3511
1688	list	Len	{}	{int}	*List	3511
1689	list	Front	{}	{*list.Element}	*List	3511
1690	list	Back	{}	{*list.Element}	*List	3511
1691	list	Remove	{*list.Element}	{"interface{}"}	*List	3511
1692	list	PushFront	{"interface{}"}	{*list.Element}	*List	3511
1693	list	PushBack	{"interface{}"}	{*list.Element}	*List	3511
1694	list	InsertBefore	{"interface{}",*list.Element}	{*list.Element}	*List	3511
1695	list	InsertAfter	{"interface{}",*list.Element}	{*list.Element}	*List	3511
1696	list	MoveToFront	{*list.Element}	{}	*List	3511
1697	list	MoveToBack	{*list.Element}	{}	*List	3511
1698	list	MoveBefore	{*list.Element,*list.Element}	{}	*List	3511
1699	list	MoveAfter	{*list.Element,*list.Element}	{}	*List	3511
1700	list	PushBackList	{*list.List}	{}	*List	3511
1701	list	PushFrontList	{*list.List}	{}	*List	3511
1702	ring	Next	{}	{*ring.Ring}	*Ring	3512
1703	ring	Prev	{}	{*ring.Ring}	*Ring	3512
1704	ring	Move	{int}	{*ring.Ring}	*Ring	3512
1705	ring	Link	{*ring.Ring}	{*ring.Ring}	*Ring	3512
1706	ring	Unlink	{int}	{*ring.Ring}	*Ring	3512
1707	ring	Len	{}	{int}	*Ring	3512
1708	ring	Do	{"func(interface{})"}	{}	*Ring	3512
1709	aes	Error	{}	{string}	KeySizeError	3515
1710	cipher	Read	{[]byte}	{int,error}	StreamReader	3520
1711	cipher	Write	{[]byte}	{int,error}	StreamWriter	3521
1712	cipher	Close	{}	{error}	StreamWriter	3521
1713	crypto	HashFunc	{}	{crypto.Hash}	Hash	3522
1714	crypto	Size	{}	{int}	Hash	3522
1715	crypto	New	{}	{hash.Hash}	Hash	3522
1716	crypto	Available	{}	{bool}	Hash	3522
1717	des	Error	{}	{string}	KeySizeError	3529
1718	ecdsa	Public	{}	{crypto.PublicKey}	*PrivateKey	3535
1719	ecdsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	3535
1720	ed25519	Public	{}	{crypto.PublicKey}	PrivateKey	3537
1721	ed25519	Seed	{}	{[]byte}	PrivateKey	3537
1722	ed25519	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	PrivateKey	3537
1723	edwards25519	Zero	{}	{}	*ProjectiveGroupElement	3539
1724	edwards25519	Double	{*edwards25519.CompletedGroupElement}	{}	*ProjectiveGroupElement	3539
1725	edwards25519	ToBytes	{*[]byte}	{}	*ProjectiveGroupElement	3539
1726	edwards25519	Zero	{}	{}	*ExtendedGroupElement	3540
1727	edwards25519	Double	{*edwards25519.CompletedGroupElement}	{}	*ExtendedGroupElement	3540
1728	edwards25519	ToCached	{*edwards25519.CachedGroupElement}	{}	*ExtendedGroupElement	3540
1729	edwards25519	ToProjective	{*edwards25519.ProjectiveGroupElement}	{}	*ExtendedGroupElement	3540
1730	edwards25519	ToBytes	{*[]byte}	{}	*ExtendedGroupElement	3540
1731	edwards25519	FromBytes	{*[]byte}	{bool}	*ExtendedGroupElement	3540
1732	edwards25519	ToProjective	{*edwards25519.ProjectiveGroupElement}	{}	*CompletedGroupElement	3541
1733	edwards25519	ToExtended	{*edwards25519.ExtendedGroupElement}	{}	*CompletedGroupElement	3541
1734	edwards25519	Zero	{}	{}	*PreComputedGroupElement	3542
1735	elliptic	Params	{}	{*elliptic.CurveParams}	*CurveParams	3545
1736	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}	*CurveParams	3545
1737	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	3545
1738	elliptic	Double	{*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	3545
1739	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int,*big.Int}	*CurveParams	3545
1740	elliptic	ScalarBaseMult	{[]byte}	{*big.Int,*big.Int}	*CurveParams	3545
1741	rc4	Reset	{}	{}	*Cipher	3547
1742	rc4	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	3547
1743	rc4	Error	{}	{string}	KeySizeError	3548
1744	rsa	HashFunc	{}	{crypto.Hash}	*PSSOptions	3550
1745	rsa	Size	{}	{int}	*PublicKey	3551
1746	rsa	Public	{}	{crypto.PublicKey}	*PrivateKey	3553
1747	rsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	3553
1748	rsa	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}	*PrivateKey	3553
1749	rsa	Validate	{}	{error}	*PrivateKey	3553
1750	rsa	Precompute	{}	{}	*PrivateKey	3553
1751	tls	ExportKeyingMaterial	{string,[]byte,int}	{[]byte,error}	*ConnectionState	3557
1752	tls	Clone	{}	{*tls.Config}	*Config	3565
1753	tls	SetSessionTicketKeys	{[][]byte}	{}	*Config	3565
1754	tls	BuildNameToCertificate	{}	{}	*Config	3565
1755	tls	LocalAddr	{}	{net.Addr}	*Conn	3567
1756	tls	RemoteAddr	{}	{net.Addr}	*Conn	3567
1757	tls	SetDeadline	{time.Time}	{error}	*Conn	3567
1758	tls	SetReadDeadline	{time.Time}	{error}	*Conn	3567
1759	tls	SetWriteDeadline	{time.Time}	{error}	*Conn	3567
1760	tls	Write	{[]byte}	{int,error}	*Conn	3567
1761	tls	Read	{[]byte}	{int,error}	*Conn	3567
1762	tls	Close	{}	{error}	*Conn	3567
1763	tls	CloseWrite	{}	{error}	*Conn	3567
1764	tls	Handshake	{}	{error}	*Conn	3567
1765	tls	ConnectionState	{}	{tls.ConnectionState}	*Conn	3567
1766	tls	OCSPResponse	{}	{[]byte}	*Conn	3567
1767	tls	VerifyHostname	{string}	{error}	*Conn	3567
1768	tls	Error	{}	{string}	RecordHeaderError	3568
1769	x509	AddCert	{*x509.Certificate}	{}	*CertPool	3569
1770	x509	AppendCertsFromPEM	{[]byte}	{bool}	*CertPool	3569
1771	x509	Subjects	{}	{[][]byte}	*CertPool	3569
1772	pkix	String	{}	{string}	RDNSequence	3572
1773	pkix	FillFromRDNSequence	{*pkix.RDNSequence}	{}	*Name	3577
1774	pkix	ToRDNSequence	{}	{pkix.RDNSequence}	Name	3577
1775	pkix	String	{}	{string}	Name	3577
1776	pkix	HasExpired	{time.Time}	{bool}	*CertificateList	3578
1777	x509	Error	{}	{string}	CertificateInvalidError	3582
1778	x509	Error	{}	{string}	HostnameError	3583
1779	x509	Error	{}	{string}	UnknownAuthorityError	3584
1780	x509	Error	{}	{string}	SystemRootsError	3585
1781	x509	String	{}	{string}	SignatureAlgorithm	3587
1782	x509	String	{}	{string}	PublicKeyAlgorithm	3588
1783	x509	Verify	{x509.VerifyOptions}	{[][]*x509.Certificate,error}	*Certificate	3591
1784	x509	VerifyHostname	{string}	{error}	*Certificate	3591
1785	x509	Equal	{*x509.Certificate}	{bool}	*Certificate	3591
1786	x509	CheckSignatureFrom	{*x509.Certificate}	{error}	*Certificate	3591
1787	x509	CheckSignature	{x509.SignatureAlgorithm,[]byte,[]byte}	{error}	*Certificate	3591
1788	x509	CheckCRLSignature	{*pkix.CertificateList}	{error}	*Certificate	3591
1789	x509	CreateCRL	{io.Reader,"interface{}",[]pkix.RevokedCertificate,time.Time,time.Time}	{[]byte,error}	*Certificate	3591
1790	x509	Error	{}	{string}	InsecureAlgorithmError	3592
1791	x509	Error	{}	{string}	ConstraintViolationError	3593
1792	x509	Error	{}	{string}	UnhandledCriticalExtension	3594
1793	x509	CheckSignature	{}	{error}	*CertificateRequest	3595
1794	driver	LastInsertId	{}	{int64,error}	RowsAffected	3626
1795	driver	RowsAffected	{}	{int64,error}	RowsAffected	3626
1796	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	Null	3629
1797	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	NotNull	3630
1798	sql	String	{}	{string}	IsolationLevel	3632
1799	sql	Scan	{"interface{}"}	{error}	*NullString	3635
1800	sql	Value	{}	{driver.Value,error}	NullString	3635
1801	sql	Scan	{"interface{}"}	{error}	*NullInt64	3636
1802	sql	Value	{}	{driver.Value,error}	NullInt64	3636
1803	sql	Scan	{"interface{}"}	{error}	*NullInt32	3637
1804	sql	Value	{}	{driver.Value,error}	NullInt32	3637
1805	sql	Scan	{"interface{}"}	{error}	*NullFloat64	3638
1806	sql	Value	{}	{driver.Value,error}	NullFloat64	3638
1807	sql	Scan	{"interface{}"}	{error}	*NullBool	3639
1808	sql	Value	{}	{driver.Value,error}	NullBool	3639
1809	sql	Scan	{"interface{}"}	{error}	*NullTime	3640
1810	sql	Value	{}	{driver.Value,error}	NullTime	3640
1811	sql	PingContext	{context.Context}	{error}	*DB	3643
1812	sql	Ping	{}	{error}	*DB	3643
1813	sql	Close	{}	{error}	*DB	3643
1814	sql	SetMaxIdleConns	{int}	{}	*DB	3643
1815	sql	SetMaxOpenConns	{int}	{}	*DB	3643
1816	sql	SetConnMaxLifetime	{time.Duration}	{}	*DB	3643
1817	sql	Stats	{}	{sql.DBStats}	*DB	3643
1818	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*DB	3643
1819	sql	Prepare	{string}	{*sql.Stmt,error}	*DB	3643
1820	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*DB	3643
1821	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*DB	3643
1822	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*DB	3643
1823	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*DB	3643
1824	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*DB	3643
1825	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*DB	3643
1826	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*DB	3643
1827	sql	Begin	{}	{*sql.Tx,error}	*DB	3643
1828	sql	Driver	{}	{driver.Driver}	*DB	3643
1829	sql	Conn	{context.Context}	{*sql.Conn,error}	*DB	3643
1830	sql	PingContext	{context.Context}	{error}	*Conn	3645
1831	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Conn	3645
1832	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Conn	3645
1833	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Conn	3645
1834	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Conn	3645
1835	sql	Raw	{"func(interface{}) error"}	{error}	*Conn	3645
1836	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*Conn	3645
1837	sql	Close	{}	{error}	*Conn	3645
1838	sql	Commit	{}	{error}	*Tx	3646
1839	sql	Rollback	{}	{error}	*Tx	3646
1840	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Tx	3646
1841	sql	Prepare	{string}	{*sql.Stmt,error}	*Tx	3646
1842	sql	StmtContext	{context.Context,*sql.Stmt}	{*sql.Stmt}	*Tx	3646
1843	sql	Stmt	{*sql.Stmt}	{*sql.Stmt}	*Tx	3646
1844	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Tx	3646
1845	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*Tx	3646
1846	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Tx	3646
1847	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*Tx	3646
1848	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Tx	3646
1849	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*Tx	3646
1850	sql	ExecContext	{context.Context,"...interface{}"}	{sql.Result,error}	*Stmt	3647
1851	sql	Exec	{"...interface{}"}	{sql.Result,error}	*Stmt	3647
1852	sql	QueryContext	{context.Context,"...interface{}"}	{*sql.Rows,error}	*Stmt	3647
1853	sql	Query	{"...interface{}"}	{*sql.Rows,error}	*Stmt	3647
1854	sql	QueryRowContext	{context.Context,"...interface{}"}	{*sql.Row}	*Stmt	3647
1855	sql	QueryRow	{"...interface{}"}	{*sql.Row}	*Stmt	3647
1856	sql	Close	{}	{error}	*Stmt	3647
1857	sql	Next	{}	{bool}	*Rows	3648
1858	sql	NextResultSet	{}	{bool}	*Rows	3648
1859	sql	Err	{}	{error}	*Rows	3648
1860	sql	Columns	{}	{[]string,error}	*Rows	3648
1861	sql	ColumnTypes	{}	{[]*sql.ColumnType,error}	*Rows	3648
1862	sql	Scan	{"...interface{}"}	{error}	*Rows	3648
1863	sql	Close	{}	{error}	*Rows	3648
1864	sql	Name	{}	{string}	*ColumnType	3649
1865	sql	Length	{}	{int64,bool}	*ColumnType	3649
1866	sql	DecimalSize	{}	{int64,bool}	*ColumnType	3649
1867	sql	ScanType	{}	{reflect.Type}	*ColumnType	3649
1868	sql	Nullable	{}	{bool}	*ColumnType	3649
1869	sql	DatabaseTypeName	{}	{string}	*ColumnType	3649
1870	sql	Scan	{"...interface{}"}	{error}	*Row	3650
1871	dwarf	Error	{}	{string}	DecodeError	3652
1872	dwarf	String	{}	{string}	Attr	3653
1873	dwarf	GoString	{}	{string}	Attr	3653
1874	dwarf	GoString	{}	{string}	Tag	3654
1875	dwarf	String	{}	{string}	Tag	3654
1876	dwarf	Val	{dwarf.Attr}	{"interface{}"}	*Entry	3655
1877	dwarf	AttrField	{dwarf.Attr}	{*dwarf.Field}	*Entry	3655
1878	dwarf	String	{}	{string}	Class	3657
1879	dwarf	GoString	{}	{string}	Class	3657
1880	dwarf	AddressSize	{}	{int}	*Reader	3659
1881	dwarf	Seek	{dwarf.Offset}	{}	*Reader	3659
1882	dwarf	Next	{}	{*dwarf.Entry,error}	*Reader	3659
1883	dwarf	SkipChildren	{}	{}	*Reader	3659
1884	dwarf	SeekPC	{uint64}	{*dwarf.Entry,error}	*Reader	3659
1885	dwarf	Next	{*dwarf.LineEntry}	{error}	*LineReader	3660
1886	dwarf	Tell	{}	{dwarf.LineReaderPos}	*LineReader	3660
1887	dwarf	Seek	{dwarf.LineReaderPos}	{}	*LineReader	3660
1888	dwarf	Reset	{}	{}	*LineReader	3660
1889	dwarf	SeekPC	{uint64,*dwarf.LineEntry}	{error}	*LineReader	3660
1890	dwarf	Reader	{}	{*dwarf.Reader}	*Data	3664
1891	dwarf	Ranges	{*dwarf.Entry}	{[][]uint64,error}	*Data	3664
1892	dwarf	LineReader	{*dwarf.Entry}	{*dwarf.LineReader,error}	*Data	3664
1893	dwarf	AddTypes	{string,[]byte}	{error}	*Data	3664
1894	dwarf	Type	{dwarf.Offset}	{dwarf.Type,error}	*Data	3664
1895	dwarf	Common	{}	{*dwarf.CommonType}	*CommonType	3666
1896	dwarf	Size	{}	{int64}	*CommonType	3666
1897	dwarf	Basic	{}	{*dwarf.BasicType}	*BasicType	3667
1898	dwarf	String	{}	{string}	*BasicType	3667
1899	dwarf	String	{}	{string}	*QualType	3677
1900	dwarf	Size	{}	{int64}	*QualType	3677
1901	dwarf	String	{}	{string}	*ArrayType	3678
1902	dwarf	Size	{}	{int64}	*ArrayType	3678
1903	dwarf	String	{}	{string}	*VoidType	3679
1904	dwarf	String	{}	{string}	*PtrType	3680
1905	dwarf	String	{}	{string}	*StructType	3681
1906	dwarf	Defn	{}	{string}	*StructType	3681
1907	dwarf	String	{}	{string}	*EnumType	3683
1908	dwarf	String	{}	{string}	*FuncType	3685
1909	dwarf	String	{}	{string}	*DotDotDotType	3686
1910	dwarf	String	{}	{string}	*TypedefType	3687
1911	dwarf	Size	{}	{int64}	*TypedefType	3687
1912	dwarf	String	{}	{string}	*UnsupportedType	3688
1913	elf	String	{}	{string}	Version	3689
1914	elf	GoString	{}	{string}	Version	3689
1915	elf	String	{}	{string}	Class	3690
1916	elf	GoString	{}	{string}	Class	3690
1917	elf	String	{}	{string}	Data	3691
1918	elf	GoString	{}	{string}	Data	3691
1919	elf	String	{}	{string}	OSABI	3692
1920	elf	GoString	{}	{string}	OSABI	3692
1921	elf	String	{}	{string}	Type	3693
1922	elf	GoString	{}	{string}	Type	3693
1923	elf	String	{}	{string}	Machine	3694
1924	elf	GoString	{}	{string}	Machine	3694
1925	elf	String	{}	{string}	SectionIndex	3695
1926	elf	GoString	{}	{string}	SectionIndex	3695
1927	elf	String	{}	{string}	SectionType	3696
1928	elf	GoString	{}	{string}	SectionType	3696
1929	elf	String	{}	{string}	SectionFlag	3697
1930	elf	GoString	{}	{string}	SectionFlag	3697
1931	elf	String	{}	{string}	CompressionType	3698
1932	elf	GoString	{}	{string}	CompressionType	3698
1933	elf	String	{}	{string}	ProgType	3699
1934	elf	GoString	{}	{string}	ProgType	3699
1935	elf	String	{}	{string}	ProgFlag	3700
1936	elf	GoString	{}	{string}	ProgFlag	3700
1937	elf	String	{}	{string}	DynTag	3701
1938	elf	GoString	{}	{string}	DynTag	3701
1939	elf	String	{}	{string}	DynFlag	3702
1940	elf	GoString	{}	{string}	DynFlag	3702
1941	elf	String	{}	{string}	NType	3703
1942	elf	GoString	{}	{string}	NType	3703
1943	elf	String	{}	{string}	SymBind	3704
1944	elf	GoString	{}	{string}	SymBind	3704
1945	elf	String	{}	{string}	SymType	3705
1946	elf	GoString	{}	{string}	SymType	3705
1947	elf	String	{}	{string}	SymVis	3706
1948	elf	GoString	{}	{string}	SymVis	3706
1949	elf	String	{}	{string}	R_X86_64	3707
1950	elf	GoString	{}	{string}	R_X86_64	3707
1951	elf	String	{}	{string}	R_AARCH64	3708
1952	elf	GoString	{}	{string}	R_AARCH64	3708
1953	elf	String	{}	{string}	R_ALPHA	3709
1954	elf	GoString	{}	{string}	R_ALPHA	3709
1955	elf	String	{}	{string}	R_ARM	3710
1956	elf	GoString	{}	{string}	R_ARM	3710
1957	elf	String	{}	{string}	R_386	3711
1958	elf	GoString	{}	{string}	R_386	3711
1959	elf	String	{}	{string}	R_MIPS	3712
1960	elf	GoString	{}	{string}	R_MIPS	3712
1961	elf	String	{}	{string}	R_PPC	3713
1962	elf	GoString	{}	{string}	R_PPC	3713
1963	elf	String	{}	{string}	R_PPC64	3714
1964	elf	GoString	{}	{string}	R_PPC64	3714
1965	elf	String	{}	{string}	R_RISCV	3715
1966	elf	GoString	{}	{string}	R_RISCV	3715
1967	elf	String	{}	{string}	R_390	3716
1968	elf	GoString	{}	{string}	R_390	3716
1969	elf	String	{}	{string}	R_SPARC	3717
1970	elf	GoString	{}	{string}	R_SPARC	3717
1971	elf	Close	{}	{error}	*File	3735
1972	elf	SectionByType	{elf.SectionType}	{*elf.Section}	*File	3735
1973	elf	Section	{string}	{*elf.Section}	*File	3735
1974	elf	DWARF	{}	{*dwarf.Data,error}	*File	3735
1975	elf	Symbols	{}	{[]elf.Symbol,error}	*File	3735
1976	elf	DynamicSymbols	{}	{[]elf.Symbol,error}	*File	3735
1977	elf	ImportedSymbols	{}	{[]elf.ImportedSymbol,error}	*File	3735
1978	elf	ImportedLibraries	{}	{[]string,error}	*File	3735
1979	elf	DynString	{elf.DynTag}	{[]string,error}	*File	3735
1980	elf	Data	{}	{[]byte,error}	*Section	3737
1981	elf	Open	{}	{io.ReadSeeker}	*Section	3737
1982	elf	Open	{}	{io.ReadSeeker}	*Prog	3739
1983	elf	Error	{}	{string}	*FormatError	3741
1984	gosym	PCToLine	{uint64}	{int}	*LineTable	3743
1985	gosym	LineToPC	{int,uint64}	{uint64}	*LineTable	3743
1986	gosym	Static	{}	{bool}	*Sym	3744
1987	gosym	PackageName	{}	{string}	*Sym	3744
1988	gosym	ReceiverName	{}	{string}	*Sym	3744
1989	gosym	BaseName	{}	{string}	*Sym	3744
1990	gosym	PCToFunc	{uint64}	{*gosym.Func}	*Table	3747
1991	gosym	PCToLine	{uint64}	{string,int,*gosym.Func}	*Table	3747
2862	big	MinPrec	{}	{uint}	*Float	4352
1992	gosym	LineToPC	{string,int}	{uint64,*gosym.Func,error}	*Table	3747
1993	gosym	LookupSym	{string}	{*gosym.Sym}	*Table	3747
1994	gosym	LookupFunc	{string}	{*gosym.Func}	*Table	3747
1995	gosym	SymByAddr	{uint64}	{*gosym.Sym}	*Table	3747
1996	gosym	Error	{}	{string}	UnknownFileError	3748
1997	gosym	Error	{}	{string}	*UnknownLineError	3749
1998	gosym	Error	{}	{string}	*DecodingError	3750
1999	macho	Close	{}	{error}	*FatFile	3751
2000	macho	Close	{}	{error}	*File	3754
2001	macho	Segment	{string}	{*macho.Segment}	*File	3754
2002	macho	Section	{string}	{*macho.Section}	*File	3754
2003	macho	DWARF	{}	{*dwarf.Data,error}	*File	3754
2004	macho	ImportedSymbols	{}	{[]string,error}	*File	3754
2005	macho	ImportedLibraries	{}	{[]string,error}	*File	3754
2006	macho	Raw	{}	{[]byte}	LoadBytes	3756
2007	macho	Data	{}	{[]byte,error}	*Segment	3758
2008	macho	Open	{}	{io.ReadSeeker}	*Segment	3758
2009	macho	Data	{}	{[]byte,error}	*Section	3761
2010	macho	Open	{}	{io.ReadSeeker}	*Section	3761
2011	macho	Error	{}	{string}	*FormatError	3767
2012	macho	String	{}	{string}	Type	3769
2013	macho	GoString	{}	{string}	Type	3769
2014	macho	String	{}	{string}	Cpu	3770
2015	macho	GoString	{}	{string}	Cpu	3770
2016	macho	String	{}	{string}	LoadCmd	3771
2017	macho	GoString	{}	{string}	LoadCmd	3771
2018	macho	GoString	{}	{string}	RelocTypeGeneric	3785
2019	macho	String	{}	{string}	RelocTypeGeneric	3785
2020	macho	GoString	{}	{string}	RelocTypeX86_64	3786
2021	macho	String	{}	{string}	RelocTypeX86_64	3786
2022	macho	GoString	{}	{string}	RelocTypeARM	3787
2023	macho	String	{}	{string}	RelocTypeARM	3787
2024	macho	GoString	{}	{string}	RelocTypeARM64	3788
2025	macho	String	{}	{string}	RelocTypeARM64	3788
2026	pe	Close	{}	{error}	*File	3789
2027	pe	Section	{string}	{*pe.Section}	*File	3789
2028	pe	DWARF	{}	{*dwarf.Data,error}	*File	3789
2029	pe	ImportedSymbols	{}	{[]string,error}	*File	3789
2030	pe	ImportedLibraries	{}	{[]string,error}	*File	3789
2031	pe	Error	{}	{string}	*FormatError	3791
2032	pe	Data	{}	{[]byte,error}	*Section	3799
2033	pe	Open	{}	{io.ReadSeeker}	*Section	3799
2034	pe	String	{uint32}	{string,error}	StringTable	3800
2035	pe	FullName	{pe.StringTable}	{string,error}	*COFFSymbol	3801
2036	plan9obj	Close	{}	{error}	*File	3804
2037	plan9obj	Symbols	{}	{[]plan9obj.Sym,error}	*File	3804
2038	plan9obj	Section	{string}	{*plan9obj.Section}	*File	3804
2039	plan9obj	Data	{}	{[]byte,error}	*Section	3806
2040	plan9obj	Open	{}	{io.ReadSeeker}	*Section	3806
2041	ascii85	Error	{}	{string}	CorruptInputError	3808
2042	asn1	Error	{}	{string}	StructuralError	3809
2043	asn1	Error	{}	{string}	SyntaxError	3810
2044	asn1	At	{int}	{int}	BitString	3811
2045	asn1	RightAlign	{}	{[]byte}	BitString	3811
2046	asn1	Equal	{asn1.ObjectIdentifier}	{bool}	ObjectIdentifier	3812
2047	asn1	String	{}	{string}	ObjectIdentifier	3812
2048	base32	WithPadding	{rune}	{*base32.Encoding}	Encoding	3817
2049	base32	Encode	{[]byte,[]byte}	{}	*Encoding	3817
2050	base32	EncodeToString	{[]byte}	{string}	*Encoding	3817
2051	base32	EncodedLen	{int}	{int}	*Encoding	3817
2052	base32	Decode	{[]byte,[]byte}	{int,error}	*Encoding	3817
2053	base32	DecodeString	{string}	{[]byte,error}	*Encoding	3817
2054	base32	DecodedLen	{int}	{int}	*Encoding	3817
2055	base32	Error	{}	{string}	CorruptInputError	3818
2056	base64	WithPadding	{rune}	{*base64.Encoding}	Encoding	3819
2057	base64	Strict	{}	{*base64.Encoding}	Encoding	3819
2058	base64	Encode	{[]byte,[]byte}	{}	*Encoding	3819
2059	base64	EncodeToString	{[]byte}	{string}	*Encoding	3819
2060	base64	EncodedLen	{int}	{int}	*Encoding	3819
2061	base64	DecodeString	{string}	{[]byte,error}	*Encoding	3819
2062	base64	Decode	{[]byte,[]byte}	{int,error}	*Encoding	3819
2063	base64	DecodedLen	{int}	{int}	*Encoding	3819
2064	base64	Error	{}	{string}	CorruptInputError	3820
2065	csv	Error	{}	{string}	*ParseError	3822
2066	csv	Unwrap	{}	{error}	*ParseError	3822
2067	csv	Read	{}	{[]string,error}	*Reader	3823
2068	csv	ReadAll	{}	{[][]string,error}	*Reader	3823
2069	csv	Write	{[]string}	{error}	*Writer	3824
2070	csv	Flush	{}	{}	*Writer	3824
2071	csv	Error	{}	{error}	*Writer	3824
2072	csv	WriteAll	{[][]string}	{error}	*Writer	3824
2073	gob	Decode	{"interface{}"}	{error}	*Decoder	3830
2074	gob	DecodeValue	{reflect.Value}	{error}	*Decoder	3830
2075	gob	Encode	{"interface{}"}	{error}	*Encoder	3832
2076	gob	EncodeValue	{reflect.Value}	{error}	*Encoder	3832
2077	hex	Error	{}	{string}	InvalidByteError	3836
2078	json	Error	{}	{string}	*UnmarshalTypeError	3838
2079	json	Error	{}	{string}	*UnmarshalFieldError	3839
2080	json	Error	{}	{string}	*InvalidUnmarshalError	3840
2081	json	String	{}	{string}	Number	3841
2082	json	Float64	{}	{float64,error}	Number	3841
2083	json	Int64	{}	{int64,error}	Number	3841
2084	json	Error	{}	{string}	*UnsupportedTypeError	3843
2085	json	Error	{}	{string}	*UnsupportedValueError	3844
2086	json	Error	{}	{string}	*InvalidUTF8Error	3845
2087	json	Error	{}	{string}	*MarshalerError	3846
2088	json	Unwrap	{}	{error}	*MarshalerError	3846
2089	json	Error	{}	{string}	*SyntaxError	3847
2090	json	UseNumber	{}	{}	*Decoder	3848
2091	json	DisallowUnknownFields	{}	{}	*Decoder	3848
2092	json	Decode	{"interface{}"}	{error}	*Decoder	3848
2093	json	Buffered	{}	{io.Reader}	*Decoder	3848
2094	json	Token	{}	{json.Token,error}	*Decoder	3848
2095	json	More	{}	{bool}	*Decoder	3848
2096	json	Encode	{"interface{}"}	{error}	*Encoder	3849
2097	json	SetIndent	{string,string}	{}	*Encoder	3849
2098	json	SetEscapeHTML	{bool}	{}	*Encoder	3849
2099	json	MarshalJSON	{}	{[]byte,error}	RawMessage	3850
2100	json	UnmarshalJSON	{[]byte}	{error}	*RawMessage	3850
2101	json	String	{}	{string}	Delim	3852
2102	xml	Indent	{string,string}	{}	*Encoder	3856
2103	xml	Encode	{"interface{}"}	{error}	*Encoder	3856
2104	xml	EncodeElement	{"interface{}",xml.StartElement}	{error}	*Encoder	3856
2105	xml	EncodeToken	{xml.Token}	{error}	*Encoder	3856
2106	xml	Flush	{}	{error}	*Encoder	3856
2107	xml	Error	{}	{string}	*UnsupportedTypeError	3857
2108	xml	Error	{}	{string}	UnmarshalError	3858
2109	xml	Error	{}	{string}	*TagPathError	3861
2110	xml	Error	{}	{string}	*SyntaxError	3862
2111	xml	Copy	{}	{xml.StartElement}	StartElement	3866
2112	xml	End	{}	{xml.EndElement}	StartElement	3866
2113	xml	Copy	{}	{xml.CharData}	CharData	3868
2114	xml	Copy	{}	{xml.Comment}	Comment	3869
2115	xml	Copy	{}	{xml.ProcInst}	ProcInst	3870
2116	xml	Copy	{}	{xml.Directive}	Directive	3871
2117	xml	Decode	{"interface{}"}	{error}	*Decoder	3873
2118	xml	DecodeElement	{"interface{}",*xml.StartElement}	{error}	*Decoder	3873
2119	xml	Skip	{}	{error}	*Decoder	3873
2120	xml	Token	{}	{xml.Token,error}	*Decoder	3873
2121	xml	RawToken	{}	{xml.Token,error}	*Decoder	3873
2122	xml	InputOffset	{}	{int64}	*Decoder	3873
2123	expvar	Value	{}	{int64}	*Int	3875
2124	expvar	String	{}	{string}	*Int	3875
2125	expvar	Add	{int64}	{}	*Int	3875
2126	expvar	Set	{int64}	{}	*Int	3875
2127	expvar	Value	{}	{float64}	*Float	3876
2128	expvar	String	{}	{string}	*Float	3876
2129	expvar	Add	{float64}	{}	*Float	3876
2130	expvar	Set	{float64}	{}	*Float	3876
2131	expvar	String	{}	{string}	*Map	3877
2132	expvar	Init	{}	{*expvar.Map}	*Map	3877
2133	expvar	Get	{string}	{expvar.Var}	*Map	3877
2134	expvar	Set	{string,expvar.Var}	{}	*Map	3877
2135	expvar	Add	{string,int64}	{}	*Map	3877
2136	expvar	AddFloat	{string,float64}	{}	*Map	3877
2137	expvar	Delete	{string}	{}	*Map	3877
2138	expvar	Do	{func(expvar.KeyValue)}	{}	*Map	3877
2139	expvar	Value	{}	{string}	*String	3879
2140	expvar	String	{}	{string}	*String	3879
2141	expvar	Set	{string}	{}	*String	3879
2142	expvar	Value	{}	{"interface{}"}	Func	3880
2143	expvar	String	{}	{string}	Func	3880
2144	flag	Output	{}	{io.Writer}	*FlagSet	3884
2145	flag	Name	{}	{string}	*FlagSet	3884
2146	flag	ErrorHandling	{}	{flag.ErrorHandling}	*FlagSet	3884
2147	flag	SetOutput	{io.Writer}	{}	*FlagSet	3884
2148	flag	VisitAll	{func(*flag.Flag)}	{}	*FlagSet	3884
2149	flag	Visit	{func(*flag.Flag)}	{}	*FlagSet	3884
2150	flag	Lookup	{string}	{*flag.Flag}	*FlagSet	3884
2151	flag	Set	{string,string}	{error}	*FlagSet	3884
2152	flag	PrintDefaults	{}	{}	*FlagSet	3884
2153	flag	NFlag	{}	{int}	*FlagSet	3884
2154	flag	Arg	{int}	{string}	*FlagSet	3884
2155	flag	NArg	{}	{int}	*FlagSet	3884
2156	flag	Args	{}	{[]string}	*FlagSet	3884
2157	flag	BoolVar	{*bool,string,bool,string}	{}	*FlagSet	3884
2158	flag	Bool	{string,bool,string}	{*bool}	*FlagSet	3884
2159	flag	IntVar	{*int,string,int,string}	{}	*FlagSet	3884
2160	flag	Int	{string,int,string}	{*int}	*FlagSet	3884
2161	flag	Int64Var	{*int64,string,int64,string}	{}	*FlagSet	3884
2162	flag	Int64	{string,int64,string}	{*int64}	*FlagSet	3884
2163	flag	UintVar	{*uint,string,uint,string}	{}	*FlagSet	3884
2164	flag	Uint	{string,uint,string}	{*uint}	*FlagSet	3884
2165	flag	Uint64Var	{*uint64,string,uint64,string}	{}	*FlagSet	3884
2166	flag	Uint64	{string,uint64,string}	{*uint64}	*FlagSet	3884
2167	flag	StringVar	{*string,string,string,string}	{}	*FlagSet	3884
2168	flag	String	{string,string,string}	{*string}	*FlagSet	3884
2169	flag	Float64Var	{*float64,string,float64,string}	{}	*FlagSet	3884
2170	flag	Float64	{string,float64,string}	{*float64}	*FlagSet	3884
2171	flag	DurationVar	{*time.Duration,string,time.Duration,string}	{}	*FlagSet	3884
2172	flag	Duration	{string,time.Duration,string}	{*time.Duration}	*FlagSet	3884
2173	flag	Var	{flag.Value,string,string}	{}	*FlagSet	3884
2174	flag	Parse	{[]string}	{error}	*FlagSet	3884
2175	flag	Parsed	{}	{bool}	*FlagSet	3884
2176	flag	Init	{string,flag.ErrorHandling}	{}	*FlagSet	3884
2177	ast	Pos	{}	{token.Pos}	*Comment	3896
2178	ast	End	{}	{token.Pos}	*Comment	3896
2179	ast	Pos	{}	{token.Pos}	*CommentGroup	3897
2180	ast	End	{}	{token.Pos}	*CommentGroup	3897
2181	ast	Text	{}	{string}	*CommentGroup	3897
2182	ast	Pos	{}	{token.Pos}	*Field	3898
2183	ast	End	{}	{token.Pos}	*Field	3898
2184	ast	Pos	{}	{token.Pos}	*FieldList	3899
2185	ast	End	{}	{token.Pos}	*FieldList	3899
2186	ast	NumFields	{}	{int}	*FieldList	3899
2187	ast	Pos	{}	{token.Pos}	*BadExpr	3900
2188	ast	End	{}	{token.Pos}	*BadExpr	3900
2189	ast	Pos	{}	{token.Pos}	*Ident	3901
2190	ast	End	{}	{token.Pos}	*Ident	3901
2191	ast	IsExported	{}	{bool}	*Ident	3901
2192	ast	String	{}	{string}	*Ident	3901
2193	ast	Pos	{}	{token.Pos}	*Ellipsis	3902
2194	ast	End	{}	{token.Pos}	*Ellipsis	3902
2195	ast	Pos	{}	{token.Pos}	*BasicLit	3903
2196	ast	End	{}	{token.Pos}	*BasicLit	3903
2197	ast	Pos	{}	{token.Pos}	*FuncLit	3904
2198	ast	End	{}	{token.Pos}	*FuncLit	3904
2199	ast	Pos	{}	{token.Pos}	*CompositeLit	3905
2200	ast	End	{}	{token.Pos}	*CompositeLit	3905
2201	ast	Pos	{}	{token.Pos}	*ParenExpr	3906
2202	ast	End	{}	{token.Pos}	*ParenExpr	3906
2203	ast	Pos	{}	{token.Pos}	*SelectorExpr	3907
2204	ast	End	{}	{token.Pos}	*SelectorExpr	3907
2205	ast	Pos	{}	{token.Pos}	*IndexExpr	3908
2206	ast	End	{}	{token.Pos}	*IndexExpr	3908
2207	ast	Pos	{}	{token.Pos}	*SliceExpr	3909
2208	ast	End	{}	{token.Pos}	*SliceExpr	3909
2209	ast	Pos	{}	{token.Pos}	*TypeAssertExpr	3910
2210	ast	End	{}	{token.Pos}	*TypeAssertExpr	3910
2211	ast	Pos	{}	{token.Pos}	*CallExpr	3911
2212	ast	End	{}	{token.Pos}	*CallExpr	3911
2213	ast	Pos	{}	{token.Pos}	*StarExpr	3912
2214	ast	End	{}	{token.Pos}	*StarExpr	3912
2215	ast	Pos	{}	{token.Pos}	*UnaryExpr	3913
2216	ast	End	{}	{token.Pos}	*UnaryExpr	3913
2217	ast	Pos	{}	{token.Pos}	*BinaryExpr	3914
2218	ast	End	{}	{token.Pos}	*BinaryExpr	3914
2219	ast	Pos	{}	{token.Pos}	*KeyValueExpr	3915
2220	ast	End	{}	{token.Pos}	*KeyValueExpr	3915
2221	ast	Pos	{}	{token.Pos}	*ArrayType	3917
2222	ast	End	{}	{token.Pos}	*ArrayType	3917
2223	ast	Pos	{}	{token.Pos}	*StructType	3918
2224	ast	End	{}	{token.Pos}	*StructType	3918
2225	ast	Pos	{}	{token.Pos}	*FuncType	3919
2226	ast	End	{}	{token.Pos}	*FuncType	3919
2227	ast	Pos	{}	{token.Pos}	*InterfaceType	3920
2228	ast	End	{}	{token.Pos}	*InterfaceType	3920
2229	ast	Pos	{}	{token.Pos}	*MapType	3921
2230	ast	End	{}	{token.Pos}	*MapType	3921
2231	ast	Pos	{}	{token.Pos}	*ChanType	3922
2232	ast	End	{}	{token.Pos}	*ChanType	3922
2233	ast	Pos	{}	{token.Pos}	*BadStmt	3923
2234	ast	End	{}	{token.Pos}	*BadStmt	3923
2235	ast	Pos	{}	{token.Pos}	*DeclStmt	3924
2236	ast	End	{}	{token.Pos}	*DeclStmt	3924
2237	ast	Pos	{}	{token.Pos}	*EmptyStmt	3925
2238	ast	End	{}	{token.Pos}	*EmptyStmt	3925
2239	ast	Pos	{}	{token.Pos}	*LabeledStmt	3926
2240	ast	End	{}	{token.Pos}	*LabeledStmt	3926
2241	ast	Pos	{}	{token.Pos}	*ExprStmt	3927
2242	ast	End	{}	{token.Pos}	*ExprStmt	3927
2243	ast	Pos	{}	{token.Pos}	*SendStmt	3928
2244	ast	End	{}	{token.Pos}	*SendStmt	3928
2245	ast	Pos	{}	{token.Pos}	*IncDecStmt	3929
2246	ast	End	{}	{token.Pos}	*IncDecStmt	3929
2247	ast	Pos	{}	{token.Pos}	*AssignStmt	3930
2248	ast	End	{}	{token.Pos}	*AssignStmt	3930
2249	ast	Pos	{}	{token.Pos}	*GoStmt	3931
2250	ast	End	{}	{token.Pos}	*GoStmt	3931
2251	ast	Pos	{}	{token.Pos}	*DeferStmt	3932
2252	ast	End	{}	{token.Pos}	*DeferStmt	3932
2253	ast	Pos	{}	{token.Pos}	*ReturnStmt	3933
2254	ast	End	{}	{token.Pos}	*ReturnStmt	3933
2255	ast	Pos	{}	{token.Pos}	*BranchStmt	3934
2256	ast	End	{}	{token.Pos}	*BranchStmt	3934
2257	ast	Pos	{}	{token.Pos}	*BlockStmt	3935
2258	ast	End	{}	{token.Pos}	*BlockStmt	3935
2259	ast	Pos	{}	{token.Pos}	*IfStmt	3936
2260	ast	End	{}	{token.Pos}	*IfStmt	3936
2261	ast	Pos	{}	{token.Pos}	*CaseClause	3937
2262	ast	End	{}	{token.Pos}	*CaseClause	3937
2263	ast	Pos	{}	{token.Pos}	*SwitchStmt	3938
2264	ast	End	{}	{token.Pos}	*SwitchStmt	3938
2265	ast	Pos	{}	{token.Pos}	*TypeSwitchStmt	3939
2266	ast	End	{}	{token.Pos}	*TypeSwitchStmt	3939
2267	ast	Pos	{}	{token.Pos}	*CommClause	3940
2268	ast	End	{}	{token.Pos}	*CommClause	3940
2269	ast	Pos	{}	{token.Pos}	*SelectStmt	3941
2270	ast	End	{}	{token.Pos}	*SelectStmt	3941
2271	ast	Pos	{}	{token.Pos}	*ForStmt	3942
2272	ast	End	{}	{token.Pos}	*ForStmt	3942
2273	ast	Pos	{}	{token.Pos}	*RangeStmt	3943
2274	ast	End	{}	{token.Pos}	*RangeStmt	3943
2275	ast	Pos	{}	{token.Pos}	*ImportSpec	3945
2276	ast	End	{}	{token.Pos}	*ImportSpec	3945
2277	ast	Pos	{}	{token.Pos}	*ValueSpec	3946
2278	ast	End	{}	{token.Pos}	*ValueSpec	3946
2279	ast	Pos	{}	{token.Pos}	*TypeSpec	3947
2280	ast	End	{}	{token.Pos}	*TypeSpec	3947
2281	ast	Pos	{}	{token.Pos}	*BadDecl	3948
2282	ast	End	{}	{token.Pos}	*BadDecl	3948
2283	ast	Pos	{}	{token.Pos}	*GenDecl	3949
2284	ast	End	{}	{token.Pos}	*GenDecl	3949
2285	ast	Pos	{}	{token.Pos}	*FuncDecl	3950
2286	ast	End	{}	{token.Pos}	*FuncDecl	3950
2287	ast	Pos	{}	{token.Pos}	*File	3951
2288	ast	End	{}	{token.Pos}	*File	3951
2289	ast	Pos	{}	{token.Pos}	*Package	3952
2290	ast	End	{}	{token.Pos}	*Package	3952
2291	ast	Update	{ast.Node,ast.Node}	{ast.Node}	CommentMap	3953
2292	ast	Filter	{ast.Node}	{ast.CommentMap}	CommentMap	3953
2293	ast	Comments	{}	{[]*ast.CommentGroup}	CommentMap	3953
2294	ast	String	{}	{string}	CommentMap	3953
2295	ast	Lookup	{string}	{*ast.Object}	*Scope	3958
2296	ast	Insert	{*ast.Object}	{*ast.Object}	*Scope	3958
2297	ast	String	{}	{string}	*Scope	3958
2298	ast	Pos	{}	{token.Pos}	*Object	3959
2299	ast	String	{}	{string}	ObjKind	3960
2300	build	SrcDirs	{}	{[]string}	*Context	3962
2301	build	ImportDir	{string,build.ImportMode}	{*build.Package,error}	*Context	3962
2302	build	Import	{string,string,build.ImportMode}	{*build.Package,error}	*Context	3962
2303	build	MatchFile	{string,string}	{bool,error}	*Context	3962
2304	build	IsCommand	{}	{bool}	*Package	3964
2305	build	Error	{}	{string}	*NoGoError	3965
2306	build	Error	{}	{string}	*MultiplePackageError	3966
2307	doc	Filter	{doc.Filter}	{}	*Package	3969
2308	b	M	{}	{}	*T	3977
2309	testing	StartTimer	{}	{}	*B	3979
2310	testing	StopTimer	{}	{}	*B	3979
2311	testing	ResetTimer	{}	{}	*B	3979
2312	testing	SetBytes	{int64}	{}	*B	3979
2313	testing	StartTimer	{}	{}	*B	3979
2314	testing	StopTimer	{}	{}	*B	3979
2315	testing	ResetTimer	{}	{}	*B	3979
2316	testing	SetBytes	{int64}	{}	*B	3979
2317	testing	ReportAllocs	{}	{}	*B	3979
2318	testing	ReportMetric	{float64,string}	{}	*B	3979
2319	testing	Run	{string,func(*testing.B)}	{bool}	*B	3979
2320	testing	RunParallel	{func(*testing.PB)}	{}	*B	3979
2321	testing	SetParallelism	{int}	{}	*B	3979
2322	testing	NsPerOp	{}	{int64}	BenchmarkResult	3980
2323	testing	String	{}	{string}	BenchmarkResult	3980
2324	testing	NsPerOp	{}	{int64}	BenchmarkResult	3980
2325	testing	AllocsPerOp	{}	{int64}	BenchmarkResult	3980
2326	testing	AllocedBytesPerOp	{}	{int64}	BenchmarkResult	3980
2327	testing	String	{}	{string}	BenchmarkResult	3980
2328	testing	MemString	{}	{string}	BenchmarkResult	3980
2329	c	M	{}	{}	*T1	3991
2330	e	M	{}	{}	T2	4000
2331	e	M	{}	{}	T3	4001
2332	e	M	{}	{}	*T4	4002
2333	e	M	{}	{}	*U1	4005
2334	e	M	{}	{}	*U2	4006
2335	e	N	{}	{}	*U3	4007
2336	e	M	{}	{}	*U4	4008
2337	e	M	{}	{}	*V4	4012
2338	e	M	{}	{}	*V6	4014
2339	testing	Parallel	{}	{}	*T	4025
2340	testing	Parallel	{}	{}	*T	4025
2341	testing	Run	{string,func(*testing.T)}	{bool}	*T	4025
2342	gccgoimporter	InitFromDriver	{string,...string}	{error}	*GccgoInstallation	4028
2343	gccgoimporter	SearchPaths	{}	{[]string}	*GccgoInstallation	4028
2344	gccgoimporter	GetImporter	{[]string,map[*types.Package]gccgoimporter.InitData}	{gccgoimporter.Importer}	*GccgoInstallation	4028
2928	big	Int64	{}	{int64}	*Int	4356
2345	escapeinfo	Read	{[]byte}	{}	*T	4058
2346	server	AMethod	{int}	{*server.Server}	*A	4062
2347	server	WriteEvents	{context.Context,int}	{error}	*FooServer	4063
2348	nointerface	Get	{}	{int}	*I	4072
2349	nointerface	Set	{int}	{}	*I	4072
2350	exports	M1	{}	{}	*T1	4076
2351	issue25301	M	{}	{}	S	4109
2352	srcimporter	Import	{string}	{*types.Package,error}	*Importer	4113
2353	srcimporter	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}	*Importer	4113
2354	printer	Fprint	{io.Writer,*token.FileSet,"interface{}"}	{error}	*Config	4116
2355	scanner	Error	{}	{string}	Error	4118
2356	scanner	Add	{token.Position,string}	{}	*ErrorList	4119
2357	scanner	Reset	{}	{}	*ErrorList	4119
2358	scanner	Len	{}	{int}	ErrorList	4119
2359	scanner	Swap	{int,int}	{}	ErrorList	4119
2360	scanner	Less	{int,int}	{bool}	ErrorList	4119
2361	scanner	Sort	{}	{}	ErrorList	4119
2362	scanner	RemoveMultiples	{}	{}	*ErrorList	4119
2363	scanner	Error	{}	{string}	ErrorList	4119
2364	scanner	Err	{}	{error}	ErrorList	4119
2365	scanner	Init	{*token.File,[]byte,scanner.ErrorHandler,scanner.Mode}	{}	*Scanner	4121
2366	scanner	Scan	{}	{token.Pos,token.Token,string}	*Scanner	4121
2367	scanner	Init	{io.Reader}	{*scanner.Scanner}	*Scanner	4121
2368	scanner	Next	{}	{rune}	*Scanner	4121
2369	scanner	Peek	{}	{rune}	*Scanner	4121
2370	scanner	Scan	{}	{rune}	*Scanner	4121
2371	scanner	Pos	{}	{scanner.Position}	*Scanner	4121
2372	scanner	TokenText	{}	{string}	*Scanner	4121
2373	token	IsValid	{}	{bool}	*Position	4123
2374	token	String	{}	{string}	Position	4123
2375	token	IsValid	{}	{bool}	Pos	4124
2376	token	Name	{}	{string}	*File	4125
2377	token	Base	{}	{int}	*File	4125
2378	token	Size	{}	{int}	*File	4125
2379	token	LineCount	{}	{int}	*File	4125
2380	token	AddLine	{int}	{}	*File	4125
2381	token	MergeLine	{int}	{}	*File	4125
2382	token	SetLines	{[]int}	{bool}	*File	4125
2383	token	SetLinesForContent	{[]byte}	{}	*File	4125
2384	token	LineStart	{int}	{token.Pos}	*File	4125
2385	token	AddLineInfo	{int,string,int}	{}	*File	4125
2386	token	AddLineColumnInfo	{int,string,int,int}	{}	*File	4125
2387	token	Pos	{int}	{token.Pos}	*File	4125
2388	token	Offset	{token.Pos}	{int}	*File	4125
2389	token	Line	{token.Pos}	{int}	*File	4125
2390	token	PositionFor	{token.Pos,bool}	{token.Position}	*File	4125
2391	token	Position	{token.Pos}	{token.Position}	*File	4125
2392	token	Base	{}	{int}	*FileSet	4126
2393	token	AddFile	{string,int,int}	{*token.File}	*FileSet	4126
2394	token	Iterate	{"func(*token.File) bool"}	{}	*FileSet	4126
2395	token	File	{token.Pos}	{*token.File}	*FileSet	4126
2396	token	PositionFor	{token.Pos,bool}	{token.Position}	*FileSet	4126
2397	token	Position	{token.Pos}	{token.Position}	*FileSet	4126
2398	token	Read	{"func(interface{}) error"}	{error}	*FileSet	4126
2399	token	Write	{"func(interface{}) error"}	{error}	*FileSet	4126
2400	token	String	{}	{string}	Token	4127
2401	token	Precedence	{}	{int}	Token	4127
2402	token	IsLiteral	{}	{bool}	Token	4127
2403	token	IsOperator	{}	{bool}	Token	4127
2404	token	IsKeyword	{}	{bool}	Token	4127
2405	types	Error	{}	{string}	Error	4128
2406	types	Check	{string,*token.FileSet,[]*ast.File,*types.Info}	{*types.Package,error}	*Config	4132
2407	types	TypeOf	{ast.Expr}	{types.Type}	*Info	4133
2408	types	ObjectOf	{*ast.Ident}	{types.Object}	*Info	4133
2409	types	IsVoid	{}	{bool}	TypeAndValue	4134
2410	types	IsType	{}	{bool}	TypeAndValue	4134
2411	types	IsBuiltin	{}	{bool}	TypeAndValue	4134
2412	types	IsValue	{}	{bool}	TypeAndValue	4134
2413	types	IsNil	{}	{bool}	TypeAndValue	4134
2414	types	Addressable	{}	{bool}	TypeAndValue	4134
2415	types	Assignable	{}	{bool}	TypeAndValue	4134
2416	types	HasOk	{}	{bool}	TypeAndValue	4134
2417	types	String	{}	{string}	*Initializer	4135
2418	types	Files	{[]*ast.File}	{error}	*Checker	4136
2419	types	String	{}	{string}	*MethodSet	4137
2420	types	Len	{}	{int}	*MethodSet	4137
2421	types	At	{int}	{*types.Selection}	*MethodSet	4137
2422	types	Lookup	{*types.Package,string}	{*types.Selection}	*MethodSet	4137
2423	types	Imported	{}	{*types.Package}	*PkgName	4139
2424	types	String	{}	{string}	*PkgName	4139
2425	types	Val	{}	{constant.Value}	*Const	4140
2426	types	String	{}	{string}	*Const	4140
2427	types	IsAlias	{}	{bool}	*TypeName	4141
2428	types	String	{}	{string}	*TypeName	4141
2429	types	Anonymous	{}	{bool}	*Var	4142
2430	types	Embedded	{}	{bool}	*Var	4142
2431	types	IsField	{}	{bool}	*Var	4142
2432	types	String	{}	{string}	*Var	4142
2433	types	String	{}	{string}	*Label	4144
2434	types	String	{}	{string}	*Builtin	4145
2435	types	String	{}	{string}	*Nil	4146
2436	types	Path	{}	{string}	*Package	4147
2437	types	Name	{}	{string}	*Package	4147
2438	types	SetName	{string}	{}	*Package	4147
2439	types	Scope	{}	{*types.Scope}	*Package	4147
2440	types	Complete	{}	{bool}	*Package	4147
2441	types	MarkComplete	{}	{}	*Package	4147
2442	types	Imports	{}	{[]*types.Package}	*Package	4147
2443	types	SetImports	{[]*types.Package}	{}	*Package	4147
2444	types	String	{}	{string}	*Package	4147
2445	types	Parent	{}	{*types.Scope}	*Scope	4148
2446	types	Len	{}	{int}	*Scope	4148
2447	types	Names	{}	{[]string}	*Scope	4148
2448	types	NumChildren	{}	{int}	*Scope	4148
2449	types	Child	{int}	{*types.Scope}	*Scope	4148
2450	types	Lookup	{string}	{types.Object}	*Scope	4148
2451	types	LookupParent	{string,token.Pos}	{*types.Scope,types.Object}	*Scope	4148
2452	types	Insert	{types.Object}	{types.Object}	*Scope	4148
2453	types	Pos	{}	{token.Pos}	*Scope	4148
2454	types	End	{}	{token.Pos}	*Scope	4148
2455	types	Contains	{token.Pos}	{bool}	*Scope	4148
2456	types	Innermost	{token.Pos}	{*types.Scope}	*Scope	4148
2457	types	WriteTo	{io.Writer,int,bool}	{}	*Scope	4148
2458	types	String	{}	{string}	*Scope	4148
2459	types	Kind	{}	{types.SelectionKind}	*Selection	4150
2460	types	Recv	{}	{types.Type}	*Selection	4150
2461	types	Obj	{}	{types.Object}	*Selection	4150
2462	types	Type	{}	{types.Type}	*Selection	4150
2463	types	Index	{}	{[]int}	*Selection	4150
2464	types	Indirect	{}	{bool}	*Selection	4150
2465	types	String	{}	{string}	*Selection	4150
2466	types	Alignof	{types.Type}	{int64}	*StdSizes	4152
2467	types	Offsetsof	{[]*types.Var}	{[]int64}	*StdSizes	4152
2468	types	Sizeof	{types.Type}	{int64}	*StdSizes	4152
2469	types	Kind	{}	{types.BasicKind}	*Basic	4156
2470	types	Info	{}	{types.BasicInfo}	*Basic	4156
2471	types	Name	{}	{string}	*Basic	4156
2472	types	Underlying	{}	{types.Type}	*Basic	4156
2473	types	String	{}	{string}	*Basic	4156
2474	types	Elem	{}	{types.Type}	*Pointer	4160
2475	types	Underlying	{}	{types.Type}	*Pointer	4160
2476	types	String	{}	{string}	*Pointer	4160
2477	types	Recv	{}	{*types.Var}	*Signature	4162
2478	types	Params	{}	{*types.Tuple}	*Signature	4162
2479	types	Results	{}	{*types.Tuple}	*Signature	4162
2480	types	Variadic	{}	{bool}	*Signature	4162
2481	types	Underlying	{}	{types.Type}	*Signature	4162
2482	types	String	{}	{string}	*Signature	4162
2483	types	Obj	{}	{*types.TypeName}	*Named	4167
2484	types	NumMethods	{}	{int}	*Named	4167
2485	types	Method	{int}	{*types.Func}	*Named	4167
2486	types	SetUnderlying	{types.Type}	{}	*Named	4167
2487	types	AddMethod	{*types.Func}	{}	*Named	4167
2488	types	Underlying	{}	{types.Type}	*Named	4167
2489	types	String	{}	{string}	*Named	4167
2490	template	Error	{}	{string}	*Error	4181
2491	template	Templates	{}	{[]*template.Template}	*Template	4183
2492	template	Option	{...string}	{*template.Template}	*Template	4183
2493	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	4183
2494	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	4183
2495	template	DefinedTemplates	{}	{string}	*Template	4183
2496	template	Parse	{string}	{*template.Template,error}	*Template	4183
2497	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	4183
2498	template	Clone	{}	{*template.Template,error}	*Template	4183
2499	template	New	{string}	{*template.Template}	*Template	4183
2500	template	Name	{}	{string}	*Template	4183
2501	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	4183
2502	template	Delims	{string,string}	{*template.Template}	*Template	4183
2503	template	Lookup	{string}	{*template.Template}	*Template	4183
2504	template	ParseFiles	{...string}	{*template.Template,error}	*Template	4183
2505	template	ParseGlob	{string}	{*template.Template,error}	*Template	4183
2506	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	4183
2507	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	4183
2508	template	DefinedTemplates	{}	{string}	*Template	4183
2509	template	ParseFiles	{...string}	{*template.Template,error}	*Template	4183
2510	template	ParseGlob	{string}	{*template.Template,error}	*Template	4183
2511	template	Option	{...string}	{*template.Template}	*Template	4183
2512	template	Name	{}	{string}	*Template	4183
2513	template	New	{string}	{*template.Template}	*Template	4183
2514	template	Clone	{}	{*template.Template,error}	*Template	4183
2515	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	4183
2516	template	Templates	{}	{[]*template.Template}	*Template	4183
2517	template	Delims	{string,string}	{*template.Template}	*Template	4183
2518	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	4183
2519	template	Lookup	{string}	{*template.Template}	*Template	4183
2520	template	Parse	{string}	{*template.Template,error}	*Template	4183
2521	color	RGBA	{}	{uint32}	RGBA	4186
2522	color	RGBA	{}	{uint32}	RGBA64	4187
2523	color	RGBA	{}	{uint32}	NRGBA	4188
2524	color	RGBA	{}	{uint32}	NRGBA64	4189
2525	color	RGBA	{}	{uint32}	Alpha	4190
2526	color	RGBA	{}	{uint32}	Alpha16	4191
2527	color	RGBA	{}	{uint32}	Gray	4192
2528	color	RGBA	{}	{uint32}	Gray16	4193
2529	color	Convert	{color.Color}	{color.Color}	Palette	4195
2530	color	Index	{color.Color}	{int}	Palette	4195
2531	color	RGBA	{}	{uint32,uint32,uint32,uint32}	YCbCr	4196
2532	color	RGBA	{}	{uint32,uint32,uint32,uint32}	NYCbCrA	4197
2533	color	RGBA	{}	{uint32,uint32,uint32,uint32}	CMYK	4198
2534	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}	Op	4201
2535	image	String	{}	{string}	Point	4203
2536	image	Add	{image.Point}	{image.Point}	Point	4203
2537	image	Sub	{image.Point}	{image.Point}	Point	4203
2538	image	Mul	{int}	{image.Point}	Point	4203
2539	image	Div	{int}	{image.Point}	Point	4203
2540	image	In	{image.Rectangle}	{bool}	Point	4203
2541	image	Mod	{image.Rectangle}	{image.Point}	Point	4203
2542	image	Eq	{image.Point}	{bool}	Point	4203
2543	image	String	{}	{string}	Rectangle	4204
2544	image	Dx	{}	{int}	Rectangle	4204
2545	image	Dy	{}	{int}	Rectangle	4204
2546	image	Size	{}	{image.Point}	Rectangle	4204
2547	image	Add	{image.Point}	{image.Rectangle}	Rectangle	4204
2548	image	Sub	{image.Point}	{image.Rectangle}	Rectangle	4204
2549	image	Inset	{int}	{image.Rectangle}	Rectangle	4204
2550	image	Intersect	{image.Rectangle}	{image.Rectangle}	Rectangle	4204
2551	image	Union	{image.Rectangle}	{image.Rectangle}	Rectangle	4204
2552	image	Empty	{}	{bool}	Rectangle	4204
2553	image	Eq	{image.Rectangle}	{bool}	Rectangle	4204
2554	image	Overlaps	{image.Rectangle}	{bool}	Rectangle	4204
2555	image	In	{image.Rectangle}	{bool}	Rectangle	4204
2556	image	Canon	{}	{image.Rectangle}	Rectangle	4204
2557	image	At	{int,int}	{color.Color}	Rectangle	4204
2558	image	Bounds	{}	{image.Rectangle}	Rectangle	4204
2559	image	ColorModel	{}	{color.Model}	Rectangle	4204
2560	image	ColorModel	{}	{color.Model}	*RGBA	4210
2561	image	Bounds	{}	{image.Rectangle}	*RGBA	4210
2562	image	At	{int,int}	{color.Color}	*RGBA	4210
2563	image	RGBAAt	{int,int}	{color.RGBA}	*RGBA	4210
2564	image	PixOffset	{int,int}	{int}	*RGBA	4210
2565	image	Set	{int,int,color.Color}	{}	*RGBA	4210
2566	image	SetRGBA	{int,int,color.RGBA}	{}	*RGBA	4210
2567	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA	4210
2568	image	Opaque	{}	{bool}	*RGBA	4210
2569	image	ColorModel	{}	{color.Model}	*RGBA64	4211
2570	image	Bounds	{}	{image.Rectangle}	*RGBA64	4211
2571	image	At	{int,int}	{color.Color}	*RGBA64	4211
2572	image	RGBA64At	{int,int}	{color.RGBA64}	*RGBA64	4211
2573	image	PixOffset	{int,int}	{int}	*RGBA64	4211
2574	image	Set	{int,int,color.Color}	{}	*RGBA64	4211
2575	image	SetRGBA64	{int,int,color.RGBA64}	{}	*RGBA64	4211
2576	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA64	4211
2577	image	Opaque	{}	{bool}	*RGBA64	4211
2578	image	ColorModel	{}	{color.Model}	*NRGBA	4212
2579	image	Bounds	{}	{image.Rectangle}	*NRGBA	4212
2580	image	At	{int,int}	{color.Color}	*NRGBA	4212
2581	image	NRGBAAt	{int,int}	{color.NRGBA}	*NRGBA	4212
2582	image	PixOffset	{int,int}	{int}	*NRGBA	4212
2583	image	Set	{int,int,color.Color}	{}	*NRGBA	4212
2584	image	SetNRGBA	{int,int,color.NRGBA}	{}	*NRGBA	4212
2585	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA	4212
2586	image	Opaque	{}	{bool}	*NRGBA	4212
2587	image	ColorModel	{}	{color.Model}	*NRGBA64	4213
2588	image	Bounds	{}	{image.Rectangle}	*NRGBA64	4213
2589	image	At	{int,int}	{color.Color}	*NRGBA64	4213
2590	image	NRGBA64At	{int,int}	{color.NRGBA64}	*NRGBA64	4213
2591	image	PixOffset	{int,int}	{int}	*NRGBA64	4213
2592	image	Set	{int,int,color.Color}	{}	*NRGBA64	4213
2593	image	SetNRGBA64	{int,int,color.NRGBA64}	{}	*NRGBA64	4213
2594	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA64	4213
2595	image	Opaque	{}	{bool}	*NRGBA64	4213
2596	image	ColorModel	{}	{color.Model}	*Alpha	4214
2597	image	Bounds	{}	{image.Rectangle}	*Alpha	4214
2598	image	At	{int,int}	{color.Color}	*Alpha	4214
2599	image	AlphaAt	{int,int}	{color.Alpha}	*Alpha	4214
2600	image	PixOffset	{int,int}	{int}	*Alpha	4214
2601	image	Set	{int,int,color.Color}	{}	*Alpha	4214
2602	image	SetAlpha	{int,int,color.Alpha}	{}	*Alpha	4214
2603	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha	4214
2604	image	Opaque	{}	{bool}	*Alpha	4214
2605	image	ColorModel	{}	{color.Model}	*Alpha16	4215
2606	image	Bounds	{}	{image.Rectangle}	*Alpha16	4215
2607	image	At	{int,int}	{color.Color}	*Alpha16	4215
2608	image	Alpha16At	{int,int}	{color.Alpha16}	*Alpha16	4215
2609	image	PixOffset	{int,int}	{int}	*Alpha16	4215
2610	image	Set	{int,int,color.Color}	{}	*Alpha16	4215
2929	big	Uint64	{}	{uint64}	*Int	4356
2611	image	SetAlpha16	{int,int,color.Alpha16}	{}	*Alpha16	4215
2612	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha16	4215
2613	image	Opaque	{}	{bool}	*Alpha16	4215
2614	image	ColorModel	{}	{color.Model}	*Gray	4216
2615	image	Bounds	{}	{image.Rectangle}	*Gray	4216
2616	image	At	{int,int}	{color.Color}	*Gray	4216
2617	image	GrayAt	{int,int}	{color.Gray}	*Gray	4216
2618	image	PixOffset	{int,int}	{int}	*Gray	4216
2619	image	Set	{int,int,color.Color}	{}	*Gray	4216
2620	image	SetGray	{int,int,color.Gray}	{}	*Gray	4216
2621	image	SubImage	{image.Rectangle}	{image.Image}	*Gray	4216
2622	image	Opaque	{}	{bool}	*Gray	4216
2623	image	ColorModel	{}	{color.Model}	*Gray16	4217
2624	image	Bounds	{}	{image.Rectangle}	*Gray16	4217
2625	image	At	{int,int}	{color.Color}	*Gray16	4217
2626	image	Gray16At	{int,int}	{color.Gray16}	*Gray16	4217
2627	image	PixOffset	{int,int}	{int}	*Gray16	4217
2628	image	Set	{int,int,color.Color}	{}	*Gray16	4217
2629	image	SetGray16	{int,int,color.Gray16}	{}	*Gray16	4217
2630	image	SubImage	{image.Rectangle}	{image.Image}	*Gray16	4217
2631	image	Opaque	{}	{bool}	*Gray16	4217
2632	image	ColorModel	{}	{color.Model}	*CMYK	4218
2633	image	Bounds	{}	{image.Rectangle}	*CMYK	4218
2634	image	At	{int,int}	{color.Color}	*CMYK	4218
2635	image	CMYKAt	{int,int}	{color.CMYK}	*CMYK	4218
2636	image	PixOffset	{int,int}	{int}	*CMYK	4218
2637	image	Set	{int,int,color.Color}	{}	*CMYK	4218
2638	image	SetCMYK	{int,int,color.CMYK}	{}	*CMYK	4218
2639	image	SubImage	{image.Rectangle}	{image.Image}	*CMYK	4218
2640	image	Opaque	{}	{bool}	*CMYK	4218
2641	image	ColorModel	{}	{color.Model}	*Paletted	4219
2642	image	Bounds	{}	{image.Rectangle}	*Paletted	4219
2643	image	At	{int,int}	{color.Color}	*Paletted	4219
2644	image	PixOffset	{int,int}	{int}	*Paletted	4219
2645	image	Set	{int,int,color.Color}	{}	*Paletted	4219
2646	image	ColorIndexAt	{int,int}	{uint8}	*Paletted	4219
2647	image	SetColorIndex	{int,int,uint8}	{}	*Paletted	4219
2648	image	SubImage	{image.Rectangle}	{image.Image}	*Paletted	4219
2649	image	Opaque	{}	{bool}	*Paletted	4219
2650	jpeg	Error	{}	{string}	FormatError	4220
2651	jpeg	Error	{}	{string}	UnsupportedError	4221
2652	image	RGBA	{}	{uint32}	*Uniform	4224
2653	image	ColorModel	{}	{color.Model}	*Uniform	4224
2654	image	Convert	{color.Color}	{color.Color}	*Uniform	4224
2655	image	Bounds	{}	{image.Rectangle}	*Uniform	4224
2656	image	At	{int,int}	{color.Color}	*Uniform	4224
2657	image	Opaque	{}	{bool}	*Uniform	4224
2658	png	Error	{}	{string}	FormatError	4225
2659	png	Error	{}	{string}	UnsupportedError	4226
2660	png	Encode	{io.Writer,image.Image}	{error}	*Encoder	4227
2661	image	String	{}	{string}	YCbCrSubsampleRatio	4231
2662	image	ColorModel	{}	{color.Model}	*YCbCr	4232
2663	image	Bounds	{}	{image.Rectangle}	*YCbCr	4232
2664	image	At	{int,int}	{color.Color}	*YCbCr	4232
2665	image	YCbCrAt	{int,int}	{color.YCbCr}	*YCbCr	4232
2666	image	YOffset	{int,int}	{int}	*YCbCr	4232
2667	image	COffset	{int,int}	{int}	*YCbCr	4232
2668	image	SubImage	{image.Rectangle}	{image.Image}	*YCbCr	4232
2669	image	Opaque	{}	{bool}	*YCbCr	4232
2670	image	ColorModel	{}	{color.Model}	*NYCbCrA	4233
2671	image	At	{int,int}	{color.Color}	*NYCbCrA	4233
2672	image	NYCbCrAAt	{int,int}	{color.NYCbCrA}	*NYCbCrA	4233
2673	image	AOffset	{int,int}	{int}	*NYCbCrA	4233
2674	image	SubImage	{image.Rectangle}	{image.Image}	*NYCbCrA	4233
2675	image	Opaque	{}	{bool}	*NYCbCrA	4233
2676	suffixarray	Read	{io.Reader}	{error}	*Index	4234
2677	suffixarray	Write	{io.Writer}	{error}	*Index	4234
2678	suffixarray	Bytes	{}	{[]byte}	*Index	4234
2679	suffixarray	Lookup	{[]byte,int}	{[]int}	*Index	4234
2680	suffixarray	FindAllIndex	{*regexp.Regexp,int}	{[][]int}	*Index	4234
2681	fmtsort	Len	{}	{int}	*SortedMap	4236
2682	fmtsort	Less	{int,int}	{bool}	*SortedMap	4236
2683	fmtsort	Swap	{int,int}	{}	*SortedMap	4236
2684	lazyregexp	FindSubmatch	{[]byte}	{[][]byte}	*Regexp	4237
2685	lazyregexp	FindStringSubmatch	{string}	{[]string}	*Regexp	4237
2686	lazyregexp	FindStringSubmatchIndex	{string}	{[]int}	*Regexp	4237
2687	lazyregexp	ReplaceAllString	{string,string}	{string}	*Regexp	4237
2688	lazyregexp	FindString	{string}	{string}	*Regexp	4237
2689	lazyregexp	FindAllString	{string,int}	{[]string}	*Regexp	4237
2690	lazyregexp	MatchString	{string}	{bool}	*Regexp	4237
2691	lazyregexp	SubexpNames	{}	{[]string}	*Regexp	4237
2692	lazytemplate	Execute	{io.Writer,"interface{}"}	{error}	*Template	4238
2693	poll	Error	{}	{string}	*TimeoutError	4242
2694	poll	Timeout	{}	{bool}	*TimeoutError	4242
2695	poll	Temporary	{}	{bool}	*TimeoutError	4242
2696	poll	Fsync	{}	{error}	*FD	4243
2697	poll	Fsync	{}	{error}	*FD	4243
2698	poll	Fsync	{}	{error}	*FD	4243
2699	poll	OpenDir	{}	{uintptr,string,error}	*FD	4243
2700	poll	Close	{}	{error}	*FD	4243
2701	poll	Read	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	4243
2702	poll	Write	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	4243
2703	poll	SetDeadline	{time.Time}	{error}	*FD	4243
2704	poll	SetReadDeadline	{time.Time}	{error}	*FD	4243
2705	poll	SetWriteDeadline	{time.Time}	{error}	*FD	4243
2706	poll	ReadLock	{}	{error}	*FD	4243
2707	poll	ReadUnlock	{}	{}	*FD	4243
2708	poll	RawControl	{func(uintptr)}	{error}	*FD	4243
2709	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	4243
2710	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	4243
2711	poll	SetDeadline	{time.Time}	{error}	*FD	4243
2712	poll	SetReadDeadline	{time.Time}	{error}	*FD	4243
2713	poll	SetWriteDeadline	{time.Time}	{error}	*FD	4243
2714	poll	SetDeadline	{time.Time}	{error}	*FD	4243
2715	poll	SetReadDeadline	{time.Time}	{error}	*FD	4243
2716	poll	SetWriteDeadline	{time.Time}	{error}	*FD	4243
2717	poll	Fchmod	{uint32}	{error}	*FD	4243
2718	poll	Fchown	{int,int}	{error}	*FD	4243
2719	poll	Ftruncate	{int64}	{error}	*FD	4243
2720	poll	Init	{string,bool}	{error}	*FD	4243
2721	poll	Close	{}	{error}	*FD	4243
2722	poll	Shutdown	{int}	{error}	*FD	4243
2723	poll	SetBlocking	{}	{error}	*FD	4243
2724	poll	Read	{[]byte}	{int,error}	*FD	4243
2725	poll	Pread	{[]byte,int64}	{int,error}	*FD	4243
2726	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	4243
2727	poll	ReadMsg	{[]byte,[]byte}	{int,int,int,syscall.Sockaddr,error}	*FD	4243
2728	poll	Write	{[]byte}	{int,error}	*FD	4243
2729	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	4243
2730	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	4243
2731	poll	WriteMsg	{[]byte,[]byte,syscall.Sockaddr}	{int,int,error}	*FD	4243
2732	poll	Accept	{}	{int,syscall.Sockaddr,string,error}	*FD	4243
2733	poll	Seek	{int64,int}	{int64,error}	*FD	4243
2734	poll	ReadDirent	{[]byte}	{int,error}	*FD	4243
2735	poll	Fchdir	{}	{error}	*FD	4243
2736	poll	Fstat	{*syscall.Stat_t}	{error}	*FD	4243
2737	poll	Dup	{}	{int,string,error}	*FD	4243
2738	poll	WaitWrite	{}	{error}	*FD	4243
2739	poll	WriteOnce	{[]byte}	{int,error}	*FD	4243
2740	poll	RawControl	{func(uintptr)}	{error}	*FD	4243
2741	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	4243
2742	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	4243
2743	poll	Init	{string,bool}	{string,error}	*FD	4243
2744	poll	Close	{}	{error}	*FD	4243
2745	poll	Shutdown	{int}	{error}	*FD	4243
2746	poll	Read	{[]byte}	{int,error}	*FD	4243
2747	poll	Pread	{[]byte,int64}	{int,error}	*FD	4243
2748	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	4243
2749	poll	Write	{[]byte}	{int,error}	*FD	4243
2750	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	4243
2751	poll	Writev	{*[][]byte}	{int64,error}	*FD	4243
2752	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	4243
2753	poll	ConnectEx	{syscall.Sockaddr}	{error}	*FD	4243
2754	poll	Accept	{"func() (syscall.Handle, error)"}	{syscall.Handle,[]syscall.RawSockaddrAny,uint32,string,error}	*FD	4243
2755	poll	Seek	{int64,int}	{int64,error}	*FD	4243
2756	poll	FindNextFile	{*syscall.Win32finddata}	{error}	*FD	4243
2757	poll	Fchdir	{}	{error}	*FD	4243
2758	poll	GetFileType	{}	{uint32,error}	*FD	4243
2759	poll	GetFileInformationByHandle	{*syscall.ByHandleFileInformation}	{error}	*FD	4243
2760	poll	RawControl	{func(uintptr)}	{error}	*FD	4243
2761	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	4243
2762	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	4243
2763	poll	ReadMsg	{[]byte,[]byte}	{int,int,int,syscall.Sockaddr,error}	*FD	4243
2764	poll	WriteMsg	{[]byte,[]byte,syscall.Sockaddr}	{int,int,error}	*FD	4243
2765	poll	SetsockoptInt	{int,int,int}	{error}	*FD	4243
2766	poll	SetsockoptInet4Addr	{int,int,[]byte}	{error}	*FD	4243
2767	poll	SetsockoptLinger	{int,int,*syscall.Linger}	{error}	*FD	4243
2768	poll	SetsockoptIPMreqn	{int,int,*syscall.IPMreqn}	{error}	*FD	4243
2769	poll	SetsockoptByte	{int,int,byte}	{error}	*FD	4243
2770	poll	Setsockopt	{int32,int32,*byte,int32}	{error}	*FD	4243
2771	poll	WSAIoctl	{uint32,*byte,uint32,*byte,uint32,*uint32,*syscall.Overlapped,uintptr}	{error}	*FD	4243
2772	poll	SetsockoptIPMreq	{int,int,*syscall.IPMreq}	{error}	*FD	4243
2773	poll	SetsockoptIPv6Mreq	{int,int,*syscall.IPv6Mreq}	{error}	*FD	4243
2774	poll	Writev	{*[][]byte}	{int64,error}	*FD	4243
2775	reflectlite	CanSet	{}	{bool}	Value	4248
2776	reflectlite	Elem	{}	{reflectlite.Value}	Value	4248
2777	reflectlite	IsNil	{}	{bool}	Value	4248
2778	reflectlite	IsValid	{}	{bool}	Value	4248
2779	reflectlite	Kind	{}	{reflectlite.Kind}	Value	4248
2780	reflectlite	Len	{}	{int}	Value	4248
2781	reflectlite	Set	{reflectlite.Value}	{}	Value	4248
2782	reflectlite	Type	{}	{reflectlite.Type}	Value	4248
2783	reflectlite	Error	{}	{string}	*ValueError	4249
2784	singleflight	Do	{string,"func() (interface{}, error)"}	{"interface{}",error,bool}	*Group	4250
2785	singleflight	DoChan	{string,"func() (interface{}, error)"}	{"chan singleflight.Result\n",bool}	*Group	4250
2786	singleflight	ForgetUnshared	{string}	{bool}	*Group	4250
2787	registry	Close	{}	{error}	Key	4255
2788	registry	ReadSubKeyNames	{int}	{[]string,error}	Key	4255
2789	registry	Stat	{}	{*registry.KeyInfo,error}	Key	4255
2790	registry	GetValue	{string,[]byte}	{int,uint32,error}	Key	4255
2791	registry	GetStringValue	{string}	{string,uint32,error}	Key	4255
2792	registry	GetMUIStringValue	{string}	{string,error}	Key	4255
2793	registry	GetStringsValue	{string}	{[]string,uint32,error}	Key	4255
2794	registry	GetIntegerValue	{string}	{uint64,uint32,error}	Key	4255
2795	registry	GetBinaryValue	{string}	{[]byte,uint32,error}	Key	4255
2796	registry	SetDWordValue	{string,uint32}	{error}	Key	4255
2930	big	IsInt64	{}	{bool}	*Int	4356
2797	registry	SetQWordValue	{string,uint64}	{error}	Key	4255
2798	registry	SetStringValue	{string,string}	{error}	Key	4255
2799	registry	SetExpandStringValue	{string,string}	{error}	Key	4255
2800	registry	SetStringsValue	{string,[]string}	{error}	Key	4255
2801	registry	SetBinaryValue	{string,[]byte}	{error}	Key	4255
2802	registry	DeleteValue	{string}	{error}	Key	4255
2803	registry	ReadValueNames	{int}	{[]string,error}	Key	4255
2804	windows	Path	{}	{string}	*SymbolicLinkReparseBuffer	4259
2805	windows	Path	{}	{string}	*MountPointReparseBuffer	4260
2806	windows	Size	{}	{uint32}	*TOKEN_MANDATORY_LABEL	4265
2807	trace	MMU	{time.Duration}	{float64}	*MMUCurve	4282
2808	trace	Examples	{time.Duration,int}	{[]trace.UtilWindow}	*MMUCurve	4282
2809	trace	MUD	{time.Duration,[]float64}	{[]float64}	*MMUCurve	4282
2810	trace	String	{}	{string}	*Event	4287
2811	trace	Emit	{byte,...uint64}	{}	*Writer	4291
2812	xcoff	Close	{}	{error}	*Archive	4292
2813	xcoff	GetFile	{string}	{*xcoff.File,error}	*Archive	4292
2814	xcoff	Data	{}	{[]byte,error}	*Section	4297
2815	xcoff	Close	{}	{error}	*File	4304
2816	xcoff	Section	{string}	{*xcoff.Section}	*File	4304
2817	xcoff	SectionByType	{uint32}	{*xcoff.Section}	*File	4304
2818	xcoff	CSect	{string}	{[]byte}	*File	4304
2819	xcoff	DWARF	{}	{*dwarf.Data,error}	*File	4304
2820	xcoff	ImportedSymbols	{}	{[]xcoff.ImportedSymbol,error}	*File	4304
2821	xcoff	ImportedLibraries	{}	{[]string,error}	*File	4304
2822	io	Read	{[]byte}	{int,error}	*LimitedReader	4344
2823	io	Read	{[]byte}	{int,error}	*SectionReader	4345
2824	io	Seek	{int64,int}	{int64,error}	*SectionReader	4345
2825	io	ReadAt	{[]byte,int64}	{int,error}	*SectionReader	4345
2826	io	Size	{}	{int64}	*SectionReader	4345
2827	io	Read	{[]byte}	{int,error}	*PipeReader	4346
2828	io	Close	{}	{error}	*PipeReader	4346
2829	io	CloseWithError	{error}	{error}	*PipeReader	4346
2830	io	Write	{[]byte}	{int,error}	*PipeWriter	4347
2831	io	Close	{}	{error}	*PipeWriter	4347
2832	io	CloseWithError	{error}	{error}	*PipeWriter	4347
2833	log	SetOutput	{io.Writer}	{}	*Logger	4348
2834	log	Output	{int,string}	{error}	*Logger	4348
2835	log	Printf	{string,"...interface{}"}	{}	*Logger	4348
2836	log	Print	{"...interface{}"}	{}	*Logger	4348
2837	log	Println	{"...interface{}"}	{}	*Logger	4348
2838	log	Fatal	{"...interface{}"}	{}	*Logger	4348
2839	log	Fatalf	{string,"...interface{}"}	{}	*Logger	4348
2840	log	Fatalln	{"...interface{}"}	{}	*Logger	4348
2841	log	Panic	{"...interface{}"}	{}	*Logger	4348
2842	log	Panicf	{string,"...interface{}"}	{}	*Logger	4348
2843	log	Panicln	{"...interface{}"}	{}	*Logger	4348
2844	log	Flags	{}	{int}	*Logger	4348
2845	log	SetFlags	{int}	{}	*Logger	4348
2846	log	Prefix	{}	{string}	*Logger	4348
2847	log	SetPrefix	{string}	{}	*Logger	4348
2848	log	Writer	{}	{io.Writer}	*Logger	4348
2849	syslog	Write	{[]byte}	{int,error}	*Writer	4350
2850	syslog	Close	{}	{error}	*Writer	4350
2851	syslog	Emerg	{string}	{error}	*Writer	4350
2852	syslog	Alert	{string}	{error}	*Writer	4350
2853	syslog	Crit	{string}	{error}	*Writer	4350
2854	syslog	Err	{string}	{error}	*Writer	4350
2855	syslog	Warning	{string}	{error}	*Writer	4350
2856	syslog	Notice	{string}	{error}	*Writer	4350
2857	syslog	Info	{string}	{error}	*Writer	4350
2858	syslog	Debug	{string}	{error}	*Writer	4350
2859	big	SetPrec	{uint}	{*big.Float}	*Float	4352
2860	big	SetMode	{big.RoundingMode}	{*big.Float}	*Float	4352
2861	big	Prec	{}	{uint}	*Float	4352
2863	big	Mode	{}	{big.RoundingMode}	*Float	4352
2864	big	Acc	{}	{big.Accuracy}	*Float	4352
2865	big	Sign	{}	{int}	*Float	4352
2866	big	MantExp	{*big.Float}	{int}	*Float	4352
2867	big	SetMantExp	{*big.Float,int}	{*big.Float}	*Float	4352
2868	big	Signbit	{}	{bool}	*Float	4352
2869	big	IsInf	{}	{bool}	*Float	4352
2870	big	IsInt	{}	{bool}	*Float	4352
2871	big	SetUint64	{uint64}	{*big.Float}	*Float	4352
2872	big	SetInt64	{int64}	{*big.Float}	*Float	4352
2873	big	SetFloat64	{float64}	{*big.Float}	*Float	4352
2874	big	SetInt	{*big.Int}	{*big.Float}	*Float	4352
2875	big	SetRat	{*big.Rat}	{*big.Float}	*Float	4352
2876	big	SetInf	{bool}	{*big.Float}	*Float	4352
2877	big	Set	{*big.Float}	{*big.Float}	*Float	4352
2878	big	Copy	{*big.Float}	{*big.Float}	*Float	4352
2879	big	Uint64	{}	{uint64,big.Accuracy}	*Float	4352
2880	big	Int64	{}	{int64,big.Accuracy}	*Float	4352
2881	big	Float32	{}	{float32,big.Accuracy}	*Float	4352
2882	big	Float64	{}	{float64,big.Accuracy}	*Float	4352
2883	big	Int	{*big.Int}	{*big.Int,big.Accuracy}	*Float	4352
2884	big	Rat	{*big.Rat}	{*big.Rat,big.Accuracy}	*Float	4352
2885	big	Abs	{*big.Float}	{*big.Float}	*Float	4352
2886	big	Neg	{*big.Float}	{*big.Float}	*Float	4352
2887	big	Add	{*big.Float,*big.Float}	{*big.Float}	*Float	4352
2888	big	Sub	{*big.Float,*big.Float}	{*big.Float}	*Float	4352
2889	big	Mul	{*big.Float,*big.Float}	{*big.Float}	*Float	4352
2890	big	Quo	{*big.Float,*big.Float}	{*big.Float}	*Float	4352
2891	big	Cmp	{*big.Float}	{int}	*Float	4352
2892	big	SetString	{string}	{*big.Float,bool}	*Float	4352
2893	big	Parse	{string,int}	{*big.Float,int,error}	*Float	4352
2894	big	Scan	{fmt.ScanState,rune}	{error}	*Float	4352
2895	big	GobEncode	{}	{[]byte,error}	*Float	4352
2896	big	GobDecode	{[]byte}	{error}	*Float	4352
2897	big	MarshalText	{}	{[]byte,error}	*Float	4352
2898	big	UnmarshalText	{[]byte}	{error}	*Float	4352
2899	big	Text	{byte,int}	{string}	*Float	4352
2900	big	String	{}	{string}	*Float	4352
2901	big	Append	{[]byte,byte,int}	{[]byte}	*Float	4352
2902	big	Format	{fmt.State,rune}	{}	*Float	4352
2903	big	Sqrt	{*big.Float}	{*big.Float}	*Float	4352
2904	big	Error	{}	{string}	ErrNaN	4353
2905	big	String	{}	{string}	RoundingMode	4354
2906	big	String	{}	{string}	Accuracy	4355
2907	big	Sign	{}	{int}	*Int	4356
2908	big	SetInt64	{int64}	{*big.Int}	*Int	4356
2909	big	SetUint64	{uint64}	{*big.Int}	*Int	4356
2910	big	Set	{*big.Int}	{*big.Int}	*Int	4356
2911	big	Bits	{}	{[]big.Word}	*Int	4356
2912	big	SetBits	{[]big.Word}	{*big.Int}	*Int	4356
2913	big	Abs	{*big.Int}	{*big.Int}	*Int	4356
2914	big	Neg	{*big.Int}	{*big.Int}	*Int	4356
2915	big	Add	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2916	big	Sub	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2917	big	Mul	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2918	big	MulRange	{int64,int64}	{*big.Int}	*Int	4356
2919	big	Binomial	{int64,int64}	{*big.Int}	*Int	4356
2920	big	Quo	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2921	big	Rem	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2922	big	QuoRem	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	4356
2923	big	Div	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2924	big	Mod	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2925	big	DivMod	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	4356
2926	big	Cmp	{*big.Int}	{int}	*Int	4356
2927	big	CmpAbs	{*big.Int}	{int}	*Int	4356
2931	big	IsUint64	{}	{bool}	*Int	4356
2932	big	SetString	{string,int}	{*big.Int,bool}	*Int	4356
2933	big	SetBytes	{[]byte}	{*big.Int}	*Int	4356
2934	big	Bytes	{}	{[]byte}	*Int	4356
2935	big	BitLen	{}	{int}	*Int	4356
2936	big	TrailingZeroBits	{}	{uint}	*Int	4356
2937	big	Exp	{*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	4356
2938	big	GCD	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	4356
2939	big	Rand	{*rand.Rand,*big.Int}	{*big.Int}	*Int	4356
2940	big	ModInverse	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2941	big	ModSqrt	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2942	big	Lsh	{*big.Int,uint}	{*big.Int}	*Int	4356
2943	big	Rsh	{*big.Int,uint}	{*big.Int}	*Int	4356
2944	big	Bit	{int}	{uint}	*Int	4356
2945	big	SetBit	{*big.Int,int,uint}	{*big.Int}	*Int	4356
2946	big	And	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2947	big	AndNot	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2948	big	Or	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2949	big	Xor	{*big.Int,*big.Int}	{*big.Int}	*Int	4356
2950	big	Not	{*big.Int}	{*big.Int}	*Int	4356
2951	big	Sqrt	{*big.Int}	{*big.Int}	*Int	4356
2952	big	Text	{int}	{string}	*Int	4356
2953	big	Append	{[]byte,int}	{[]byte}	*Int	4356
2954	big	String	{}	{string}	*Int	4356
2955	big	Format	{fmt.State,rune}	{}	*Int	4356
2956	big	Scan	{fmt.ScanState,rune}	{error}	*Int	4356
2957	big	GobEncode	{}	{[]byte,error}	*Int	4356
2958	big	GobDecode	{[]byte}	{error}	*Int	4356
2959	big	MarshalText	{}	{[]byte,error}	*Int	4356
2960	big	UnmarshalText	{[]byte}	{error}	*Int	4356
2961	big	MarshalJSON	{}	{[]byte,error}	*Int	4356
2962	big	UnmarshalJSON	{[]byte}	{error}	*Int	4356
2963	big	ProbablyPrime	{int}	{bool}	*Int	4356
2964	big	SetFloat64	{float64}	{*big.Rat}	*Rat	4357
2965	big	Float32	{}	{float32,bool}	*Rat	4357
2966	big	Float64	{}	{float64,bool}	*Rat	4357
2967	big	SetFrac	{*big.Int,*big.Int}	{*big.Rat}	*Rat	4357
2968	big	SetFrac64	{int64,int64}	{*big.Rat}	*Rat	4357
2969	big	SetInt	{*big.Int}	{*big.Rat}	*Rat	4357
2970	big	SetInt64	{int64}	{*big.Rat}	*Rat	4357
2971	big	SetUint64	{uint64}	{*big.Rat}	*Rat	4357
2972	big	Set	{*big.Rat}	{*big.Rat}	*Rat	4357
2973	big	Abs	{*big.Rat}	{*big.Rat}	*Rat	4357
2974	big	Neg	{*big.Rat}	{*big.Rat}	*Rat	4357
2975	big	Inv	{*big.Rat}	{*big.Rat}	*Rat	4357
2976	big	Sign	{}	{int}	*Rat	4357
2977	big	IsInt	{}	{bool}	*Rat	4357
2978	big	Num	{}	{*big.Int}	*Rat	4357
2979	big	Denom	{}	{*big.Int}	*Rat	4357
2980	big	Cmp	{*big.Rat}	{int}	*Rat	4357
2981	big	Add	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	4357
2982	big	Sub	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	4357
2983	big	Mul	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	4357
2984	big	Quo	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	4357
2985	big	Scan	{fmt.ScanState,rune}	{error}	*Rat	4357
2986	big	SetString	{string}	{*big.Rat,bool}	*Rat	4357
2987	big	String	{}	{string}	*Rat	4357
2988	big	RatString	{}	{string}	*Rat	4357
2989	big	FloatString	{int}	{string}	*Rat	4357
2990	big	GobEncode	{}	{[]byte,error}	*Rat	4357
2991	big	GobDecode	{[]byte}	{error}	*Rat	4357
2992	big	MarshalText	{}	{[]byte,error}	*Rat	4357
2993	big	UnmarshalText	{[]byte}	{error}	*Rat	4357
2994	rand	ExpFloat64	{}	{float64}	*Rand	4360
2995	rand	NormFloat64	{}	{float64}	*Rand	4360
2996	rand	Seed	{int64}	{}	*Rand	4360
2997	rand	Int63	{}	{int64}	*Rand	4360
2998	rand	Uint32	{}	{uint32}	*Rand	4360
2999	rand	Uint64	{}	{uint64}	*Rand	4360
3000	rand	Int31	{}	{int32}	*Rand	4360
3001	rand	Int	{}	{int}	*Rand	4360
3002	rand	Int63n	{int64}	{int64}	*Rand	4360
3003	rand	Int31n	{int32}	{int32}	*Rand	4360
3004	rand	Intn	{int}	{int}	*Rand	4360
3005	rand	Float64	{}	{float64}	*Rand	4360
3006	rand	Float32	{}	{float32}	*Rand	4360
3007	rand	Perm	{int}	{[]int}	*Rand	4360
3008	rand	Shuffle	{int,func(int)}	{}	*Rand	4360
3009	rand	Read	{[]byte}	{int,error}	*Rand	4360
3010	rand	Uint64	{}	{uint64}	*Zipf	4361
3011	mime	Encode	{string,string}	{string}	WordEncoder	4362
3012	mime	Decode	{string}	{string,error}	*WordDecoder	4363
3013	mime	DecodeHeader	{string}	{string,error}	*WordDecoder	4363
3014	multipart	RemoveAll	{}	{error}	*Form	4364
3015	multipart	Open	{}	{multipart.File,error}	*FileHeader	4365
3016	multipart	FormName	{}	{string}	*Part	4367
3017	multipart	FileName	{}	{string}	*Part	4367
3018	multipart	Read	{[]byte}	{int,error}	*Part	4367
3019	multipart	Close	{}	{error}	*Part	4367
3020	multipart	ReadForm	{int64}	{*multipart.Form,error}	*Reader	4368
3021	multipart	NextPart	{}	{*multipart.Part,error}	*Reader	4368
3022	multipart	Boundary	{}	{string}	*Writer	4369
3023	multipart	SetBoundary	{string}	{error}	*Writer	4369
3024	multipart	FormDataContentType	{}	{string}	*Writer	4369
3025	multipart	CreatePart	{textproto.MIMEHeader}	{io.Writer,error}	*Writer	4369
3026	multipart	CreateFormFile	{string,string}	{io.Writer,error}	*Writer	4369
3027	multipart	CreateFormField	{string}	{io.Writer,error}	*Writer	4369
3028	multipart	WriteField	{string,string}	{error}	*Writer	4369
3029	multipart	Close	{}	{error}	*Writer	4369
3030	quotedprintable	Read	{[]byte}	{int,error}	*Reader	4370
3031	quotedprintable	Write	{[]byte}	{int,error}	*Writer	4371
3032	quotedprintable	Close	{}	{error}	*Writer	4371
3033	net	Dial	{string,string}	{net.Conn,error}	*Dialer	4372
3034	net	DialContext	{context.Context,string,string}	{net.Conn,error}	*Dialer	4372
3035	net	Listen	{context.Context,string,string}	{net.Listener,error}	*ListenConfig	4373
3036	net	ListenPacket	{context.Context,string,string}	{net.PacketConn,error}	*ListenConfig	4373
3037	cgi	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Handler	4377
3038	http	Get	{string}	{*http.Response,error}	*Client	4378
3039	http	Do	{*http.Request}	{*http.Response,error}	*Client	4378
3040	http	Post	{string,string,io.Reader}	{*http.Response,error}	*Client	4378
3041	http	PostForm	{string,url.Values}	{*http.Response,error}	*Client	4378
3042	http	Head	{string}	{*http.Response,error}	*Client	4378
3043	http	CloseIdleConnections	{}	{}	*Client	4378
3044	http	String	{}	{string}	*Cookie	4380
3045	cookiejar	Cookies	{*url.URL}	{[]*http.Cookie}	*Jar	4384
3046	cookiejar	SetCookies	{*url.URL,[]*http.Cookie}	{}	*Jar	4384
3047	http	Open	{string}	{http.File,error}	Dir	4385
3048	http	Add	{string,string}	{}	Header	4389
3049	http	Set	{string,string}	{}	Header	4389
3050	http	Get	{string}	{string}	Header	4389
3051	http	Del	{string}	{}	Header	4389
3052	http	Write	{io.Writer}	{error}	Header	4389
3053	http	Clone	{}	{http.Header}	Header	4389
3054	http	WriteSubset	{io.Writer,map[string]bool}	{error}	Header	4389
3055	httptest	Header	{}	{http.Header}	*ResponseRecorder	4392
3056	httptest	Write	{[]byte}	{int,error}	*ResponseRecorder	4392
3057	httptest	WriteString	{string}	{int,error}	*ResponseRecorder	4392
3058	httptest	WriteHeader	{int}	{}	*ResponseRecorder	4392
3059	httptest	Flush	{}	{}	*ResponseRecorder	4392
3060	httptest	Result	{}	{*http.Response}	*ResponseRecorder	4392
3061	httptest	Start	{}	{}	*Server	4393
3062	httptest	StartTLS	{}	{}	*Server	4393
3063	httptest	Close	{}	{}	*Server	4393
3064	httptest	CloseClientConnections	{}	{}	*Server	4393
3065	httptest	Certificate	{}	{*x509.Certificate}	*Server	4393
3066	httptest	Client	{}	{*http.Client}	*Server	4393
3067	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ServerConn	4399
3068	httputil	Close	{}	{error}	*ServerConn	4399
3069	httputil	Read	{}	{*http.Request,error}	*ServerConn	4399
3070	httputil	Pending	{}	{int}	*ServerConn	4399
3071	httputil	Write	{*http.Request,*http.Response}	{error}	*ServerConn	4399
3072	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ClientConn	4400
3073	httputil	Close	{}	{error}	*ClientConn	4400
3074	httputil	Write	{*http.Request}	{error}	*ClientConn	4400
3075	httputil	Pending	{}	{int}	*ClientConn	4400
3076	httputil	Read	{*http.Request}	{*http.Response,error}	*ClientConn	4400
3077	httputil	Do	{*http.Request}	{*http.Response,error}	*ClientConn	4400
3078	httputil	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ReverseProxy	4401
3079	http	Error	{}	{string}	*ProtocolError	4405
3080	http	Context	{}	{context.Context}	*Request	4406
3081	http	WithContext	{context.Context}	{*http.Request}	*Request	4406
3082	http	Clone	{context.Context}	{*http.Request}	*Request	4406
3083	http	ProtoAtLeast	{int,int}	{bool}	*Request	4406
3084	http	UserAgent	{}	{string}	*Request	4406
3085	http	Cookies	{}	{[]*http.Cookie}	*Request	4406
3086	http	Cookie	{string}	{*http.Cookie,error}	*Request	4406
3087	http	AddCookie	{*http.Cookie}	{}	*Request	4406
3088	http	Referer	{}	{string}	*Request	4406
3089	http	MultipartReader	{}	{*multipart.Reader,error}	*Request	4406
3090	http	Write	{io.Writer}	{error}	*Request	4406
3091	http	WriteProxy	{io.Writer}	{error}	*Request	4406
3092	http	BasicAuth	{}	{string,bool}	*Request	4406
3093	http	SetBasicAuth	{string,string}	{}	*Request	4406
3094	http	ParseForm	{}	{error}	*Request	4406
3095	http	ParseMultipartForm	{int64}	{error}	*Request	4406
3096	http	FormValue	{string}	{string}	*Request	4406
3097	http	PostFormValue	{string}	{string}	*Request	4406
3098	http	FormFile	{string}	{multipart.File,*multipart.FileHeader,error}	*Request	4406
3099	http	Cookies	{}	{[]*http.Cookie}	*Response	4407
3100	http	Location	{}	{*url.URL,error}	*Response	4407
3101	http	ProtoAtLeast	{int,int}	{bool}	*Response	4407
3102	http	Write	{io.Writer}	{error}	*Response	4407
3103	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	HandlerFunc	4413
3104	http	Handler	{*http.Request}	{http.Handler,string}	*ServeMux	4414
3105	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ServeMux	4414
3106	http	Handle	{string,http.Handler}	{}	*ServeMux	4414
3107	http	HandleFunc	{string,"func(http.ResponseWriter, *http.Request)"}	{}	*ServeMux	4414
3108	http	Close	{}	{error}	*Server	4415
3109	http	Shutdown	{context.Context}	{error}	*Server	4415
3110	http	RegisterOnShutdown	{func()}	{}	*Server	4415
3111	http	ListenAndServe	{}	{error}	*Server	4415
3112	http	Serve	{net.Listener}	{error}	*Server	4415
3113	http	ServeTLS	{net.Listener,string,string}	{error}	*Server	4415
3114	http	SetKeepAlivesEnabled	{bool}	{}	*Server	4415
3115	http	ListenAndServeTLS	{string,string}	{error}	*Server	4415
3116	http	String	{}	{string}	ConnState	4416
3117	http	RoundTrip	{*http.Request}	{*http.Response,error}	*Transport	4417
3118	http	RoundTrip	{*http.Request}	{*http.Response,error}	*Transport	4417
3119	http	Clone	{}	{*http.Transport}	*Transport	4417
3120	http	RegisterProtocol	{string,http.RoundTripper}	{}	*Transport	4417
3121	http	CloseIdleConnections	{}	{}	*Transport	4417
3122	http	CancelRequest	{*http.Request}	{}	*Transport	4417
3123	main	String	{}	{string}	*Counter	4418
3124	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Counter	4418
3125	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	Chan	4419
3126	net	Addrs	{}	{[]net.Addr,error}	*Interface	4420
3127	net	MulticastAddrs	{}	{[]net.Addr,error}	*Interface	4420
3128	net	String	{}	{string}	Flags	4421
3129	socktest	Stats	{}	{[]socktest.Stat}	*Switch	4422
3130	socktest	Sockets	{}	{socktest.Sockets}	*Switch	4422
3131	socktest	Set	{socktest.FilterType,socktest.Filter}	{}	*Switch	4422
3132	socktest	Accept4	{int,int}	{int,syscall.Sockaddr,error}	*Switch	4422
3133	socktest	Socket	{int,int,int}	{int,error}	*Switch	4422
3134	socktest	Close	{int}	{error}	*Switch	4422
3135	socktest	Connect	{int,syscall.Sockaddr}	{error}	*Switch	4422
3136	socktest	Listen	{int,int}	{error}	*Switch	4422
3137	socktest	Accept	{int}	{int,syscall.Sockaddr,error}	*Switch	4422
3138	socktest	GetsockoptInt	{int,int,int}	{int,error}	*Switch	4422
3139	socktest	Socket	{int,int,int}	{syscall.Handle,error}	*Switch	4422
3140	socktest	WSASocket	{int32,int32,int32,*syscall.WSAProtocolInfo,uint32,uint32}	{syscall.Handle,error}	*Switch	4422
3141	socktest	Closesocket	{syscall.Handle}	{error}	*Switch	4422
3142	socktest	Connect	{syscall.Handle,syscall.Sockaddr}	{error}	*Switch	4422
3143	socktest	ConnectEx	{syscall.Handle,syscall.Sockaddr,*byte,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	4422
3144	socktest	Listen	{syscall.Handle,int}	{error}	*Switch	4422
3145	socktest	AcceptEx	{syscall.Handle,syscall.Handle,*byte,uint32,uint32,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	4422
3146	socktest	Family	{}	{int}	Cookie	4423
3147	socktest	Type	{}	{int}	Cookie	4423
3148	socktest	Protocol	{}	{int}	Cookie	4423
3149	socktest	String	{}	{string}	Status	4424
3150	socktest	String	{}	{string}	Stat	4425
3151	net	IsUnspecified	{}	{bool}	IP	4432
3152	net	IsLoopback	{}	{bool}	IP	4432
3153	net	IsMulticast	{}	{bool}	IP	4432
3154	net	IsInterfaceLocalMulticast	{}	{bool}	IP	4432
3155	net	IsLinkLocalMulticast	{}	{bool}	IP	4432
3156	net	IsLinkLocalUnicast	{}	{bool}	IP	4432
3157	net	IsGlobalUnicast	{}	{bool}	IP	4432
3158	net	To4	{}	{net.IP}	IP	4432
3159	net	To16	{}	{net.IP}	IP	4432
3160	net	DefaultMask	{}	{net.IPMask}	IP	4432
3161	net	Mask	{net.IPMask}	{net.IP}	IP	4432
3162	net	String	{}	{string}	IP	4432
3163	net	MarshalText	{}	{[]byte,error}	IP	4432
3164	net	UnmarshalText	{[]byte}	{error}	*IP	4432
3165	net	Equal	{net.IP}	{bool}	IP	4432
3166	net	Size	{}	{int}	IPMask	4433
3167	net	String	{}	{string}	IPMask	4433
3168	net	Contains	{net.IP}	{bool}	*IPNet	4434
3169	net	Network	{}	{string}	*IPNet	4434
3170	net	String	{}	{string}	*IPNet	4434
3171	net	Network	{}	{string}	*IPAddr	4435
3172	net	String	{}	{string}	*IPAddr	4435
3173	net	SyscallConn	{}	{syscall.RawConn,error}	*IPConn	4436
3174	net	ReadFromIP	{[]byte}	{int,*net.IPAddr,error}	*IPConn	4436
3175	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*IPConn	4436
3176	net	ReadMsgIP	{[]byte,[]byte}	{int,*net.IPAddr,error}	*IPConn	4436
3177	net	WriteToIP	{[]byte,*net.IPAddr}	{int,error}	*IPConn	4436
3178	net	WriteTo	{[]byte,net.Addr}	{int,error}	*IPConn	4436
3179	net	WriteMsgIP	{[]byte,[]byte,*net.IPAddr}	{int,error}	*IPConn	4436
3180	net	LookupHost	{context.Context,string}	{[]string,error}	*Resolver	4437
3181	net	LookupIPAddr	{context.Context,string}	{[]net.IPAddr,error}	*Resolver	4437
3182	net	LookupPort	{context.Context,string,string}	{int,error}	*Resolver	4437
3183	net	LookupCNAME	{context.Context,string}	{string,error}	*Resolver	4437
3249	net	CloseWrite	{}	{error}	*TCPConn	4468
3184	net	LookupSRV	{context.Context,string,string,string}	{string,[]*net.SRV,error}	*Resolver	4437
3185	net	LookupMX	{context.Context,string}	{[]*net.MX,error}	*Resolver	4437
3186	net	LookupNS	{context.Context,string}	{[]*net.NS,error}	*Resolver	4437
3187	net	LookupTXT	{context.Context,string}	{[]string,error}	*Resolver	4437
3188	net	LookupAddr	{context.Context,string}	{[]string,error}	*Resolver	4437
3189	net	String	{}	{string}	HardwareAddr	4438
3190	mail	Get	{string}	{string}	Header	4440
3191	mail	Date	{}	{time.Time,error}	Header	4440
3192	mail	AddressList	{string}	{[]*mail.Address,error}	Header	4440
3193	mail	String	{}	{string}	*Address	4441
3194	mail	Parse	{string}	{*mail.Address,error}	*AddressParser	4442
3195	mail	ParseList	{string}	{[]*mail.Address,error}	*AddressParser	4442
3196	net	Unwrap	{}	{error}	*OpError	4448
3197	net	Error	{}	{string}	*OpError	4448
3198	net	Timeout	{}	{bool}	*OpError	4448
3199	net	Temporary	{}	{bool}	*OpError	4448
3200	net	Error	{}	{string}	*ParseError	4449
3201	net	Error	{}	{string}	*AddrError	4450
3202	net	Timeout	{}	{bool}	*AddrError	4450
3203	net	Temporary	{}	{bool}	*AddrError	4450
3204	net	Error	{}	{string}	UnknownNetworkError	4451
3205	net	Timeout	{}	{bool}	UnknownNetworkError	4451
3206	net	Temporary	{}	{bool}	UnknownNetworkError	4451
3207	net	Error	{}	{string}	InvalidAddrError	4452
3208	net	Timeout	{}	{bool}	InvalidAddrError	4452
3209	net	Temporary	{}	{bool}	InvalidAddrError	4452
3210	net	Unwrap	{}	{error}	*DNSConfigError	4453
3211	net	Error	{}	{string}	*DNSConfigError	4453
3212	net	Timeout	{}	{bool}	*DNSConfigError	4453
3213	net	Temporary	{}	{bool}	*DNSConfigError	4453
3214	net	Error	{}	{string}	*DNSError	4454
3215	net	Timeout	{}	{bool}	*DNSError	4454
3216	net	Temporary	{}	{bool}	*DNSError	4454
3217	net	WriteTo	{io.Writer}	{int64,error}	*Buffers	4455
3218	net	Read	{[]byte}	{int,error}	*Buffers	4455
3219	rpc	Error	{}	{string}	ServerError	4456
3220	rpc	Close	{}	{error}	*Client	4458
3221	rpc	Go	{string,"interface{}","interface{}","chan *rpc.Call\n"}	{*rpc.Call}	*Client	4458
3222	rpc	Call	{string,"interface{}","interface{}"}	{error}	*Client	4458
3223	rpc	Register	{"interface{}"}	{error}	*Server	4462
3224	rpc	RegisterName	{string,"interface{}"}	{error}	*Server	4462
3225	rpc	ServeConn	{io.ReadWriteCloser}	{}	*Server	4462
3226	rpc	ServeCodec	{rpc.ServerCodec}	{}	*Server	4462
3227	rpc	ServeRequest	{rpc.ServerCodec}	{error}	*Server	4462
3228	rpc	Accept	{net.Listener}	{}	*Server	4462
3229	rpc	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Server	4462
3230	rpc	HandleHTTP	{string,string}	{}	*Server	4462
3231	smtp	Close	{}	{error}	*Client	4466
3232	smtp	Hello	{string}	{error}	*Client	4466
3233	smtp	StartTLS	{*tls.Config}	{error}	*Client	4466
3234	smtp	TLSConnectionState	{}	{tls.ConnectionState,bool}	*Client	4466
3235	smtp	Verify	{string}	{error}	*Client	4466
3236	smtp	Auth	{smtp.Auth}	{error}	*Client	4466
3237	smtp	Mail	{string}	{error}	*Client	4466
3238	smtp	Rcpt	{string}	{error}	*Client	4466
3239	smtp	Data	{}	{io.WriteCloser,error}	*Client	4466
3240	smtp	Extension	{string}	{bool,string}	*Client	4466
3241	smtp	Reset	{}	{error}	*Client	4466
3242	smtp	Noop	{}	{error}	*Client	4466
3243	smtp	Quit	{}	{error}	*Client	4466
3244	net	Network	{}	{string}	*TCPAddr	4467
3245	net	String	{}	{string}	*TCPAddr	4467
3246	net	SyscallConn	{}	{syscall.RawConn,error}	*TCPConn	4468
3247	net	ReadFrom	{io.Reader}	{int64,error}	*TCPConn	4468
3248	net	CloseRead	{}	{error}	*TCPConn	4468
3250	net	SetLinger	{int}	{error}	*TCPConn	4468
3251	net	SetKeepAlive	{bool}	{error}	*TCPConn	4468
3252	net	SetKeepAlivePeriod	{time.Duration}	{error}	*TCPConn	4468
3253	net	SetNoDelay	{bool}	{error}	*TCPConn	4468
3254	net	SyscallConn	{}	{syscall.RawConn,error}	*TCPListener	4469
3255	net	AcceptTCP	{}	{*net.TCPConn,error}	*TCPListener	4469
3256	net	Accept	{}	{net.Conn,error}	*TCPListener	4469
3257	net	Close	{}	{error}	*TCPListener	4469
3258	net	Addr	{}	{net.Addr}	*TCPListener	4469
3259	net	SetDeadline	{time.Time}	{error}	*TCPListener	4469
3260	net	File	{}	{*os.File,error}	*TCPListener	4469
3261	textproto	Add	{string,string}	{}	MIMEHeader	4470
3262	textproto	Set	{string,string}	{}	MIMEHeader	4470
3263	textproto	Get	{string}	{string}	MIMEHeader	4470
3264	textproto	Del	{string}	{}	MIMEHeader	4470
3265	textproto	Next	{}	{uint}	*Pipeline	4471
3266	textproto	StartRequest	{uint}	{}	*Pipeline	4471
3267	textproto	EndRequest	{uint}	{}	*Pipeline	4471
3268	textproto	StartResponse	{uint}	{}	*Pipeline	4471
3269	textproto	EndResponse	{uint}	{}	*Pipeline	4471
3270	textproto	ReadLine	{}	{string,error}	*Reader	4472
3271	textproto	ReadLineBytes	{}	{[]byte,error}	*Reader	4472
3272	textproto	ReadContinuedLine	{}	{string,error}	*Reader	4472
3273	textproto	ReadContinuedLineBytes	{}	{[]byte,error}	*Reader	4472
3274	textproto	ReadCodeLine	{int}	{int,string,error}	*Reader	4472
3275	textproto	ReadResponse	{int}	{int,string,error}	*Reader	4472
3276	textproto	DotReader	{}	{io.Reader}	*Reader	4472
3277	textproto	ReadDotBytes	{}	{[]byte,error}	*Reader	4472
3278	textproto	ReadDotLines	{}	{[]string,error}	*Reader	4472
3279	textproto	ReadMIMEHeader	{}	{textproto.MIMEHeader,error}	*Reader	4472
3280	textproto	Error	{}	{string}	*Error	4473
3281	textproto	Error	{}	{string}	ProtocolError	4474
3282	textproto	Close	{}	{error}	*Conn	4475
3283	textproto	Cmd	{string,"...interface{}"}	{uint,error}	*Conn	4475
3284	textproto	PrintfLine	{string,"...interface{}"}	{error}	*Writer	4476
3285	textproto	DotWriter	{}	{io.WriteCloser}	*Writer	4476
3286	net	Network	{}	{string}	*UDPAddr	4477
3287	net	String	{}	{string}	*UDPAddr	4477
3288	net	SyscallConn	{}	{syscall.RawConn,error}	*UDPConn	4478
3289	net	ReadFromUDP	{[]byte}	{int,*net.UDPAddr,error}	*UDPConn	4478
3290	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UDPConn	4478
3291	net	ReadMsgUDP	{[]byte,[]byte}	{int,*net.UDPAddr,error}	*UDPConn	4478
3292	net	WriteToUDP	{[]byte,*net.UDPAddr}	{int,error}	*UDPConn	4478
3293	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UDPConn	4478
3294	net	WriteMsgUDP	{[]byte,[]byte,*net.UDPAddr}	{int,error}	*UDPConn	4478
3295	net	Network	{}	{string}	*UnixAddr	4479
3296	net	String	{}	{string}	*UnixAddr	4479
3297	net	SyscallConn	{}	{syscall.RawConn,error}	*UnixConn	4480
3298	net	CloseRead	{}	{error}	*UnixConn	4480
3299	net	CloseWrite	{}	{error}	*UnixConn	4480
3300	net	ReadFromUnix	{[]byte}	{int,*net.UnixAddr,error}	*UnixConn	4480
3301	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UnixConn	4480
3302	net	ReadMsgUnix	{[]byte,[]byte}	{int,*net.UnixAddr,error}	*UnixConn	4480
3303	net	WriteToUnix	{[]byte,*net.UnixAddr}	{int,error}	*UnixConn	4480
3304	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UnixConn	4480
3305	net	WriteMsgUnix	{[]byte,[]byte,*net.UnixAddr}	{int,error}	*UnixConn	4480
3306	net	SyscallConn	{}	{syscall.RawConn,error}	*UnixListener	4481
3307	net	AcceptUnix	{}	{*net.UnixConn,error}	*UnixListener	4481
3308	net	Accept	{}	{net.Conn,error}	*UnixListener	4481
3309	net	Close	{}	{error}	*UnixListener	4481
3310	net	Addr	{}	{net.Addr}	*UnixListener	4481
3311	net	SetDeadline	{time.Time}	{error}	*UnixListener	4481
3312	net	File	{}	{*os.File,error}	*UnixListener	4481
3313	net	SetUnlinkOnClose	{bool}	{}	*UnixListener	4481
3314	url	Unwrap	{}	{error}	*Error	4482
3315	url	Error	{}	{string}	*Error	4482
3316	url	Timeout	{}	{bool}	*Error	4482
3317	url	Temporary	{}	{bool}	*Error	4482
3318	url	Error	{}	{string}	EscapeError	4483
3319	url	Error	{}	{string}	InvalidHostError	4484
3320	url	EscapedPath	{}	{string}	*URL	4485
3321	url	String	{}	{string}	*URL	4485
3322	url	IsAbs	{}	{bool}	*URL	4485
3323	url	Parse	{string}	{*url.URL,error}	*URL	4485
3324	url	ResolveReference	{*url.URL}	{*url.URL}	*URL	4485
3325	url	Query	{}	{url.Values}	*URL	4485
3326	url	RequestURI	{}	{string}	*URL	4485
3327	url	Hostname	{}	{string}	*URL	4485
3328	url	Port	{}	{string}	*URL	4485
3329	url	MarshalBinary	{}	{[]byte,error}	*URL	4485
3330	url	UnmarshalBinary	{[]byte}	{error}	*URL	4485
3331	url	Username	{}	{string}	*Userinfo	4486
3332	url	Password	{}	{string,bool}	*Userinfo	4486
3333	url	String	{}	{string}	*Userinfo	4486
3334	url	Get	{string}	{string}	Values	4487
3335	url	Set	{string,string}	{}	Values	4487
3336	url	Add	{string,string}	{}	Values	4487
3337	url	Del	{string}	{}	Values	4487
3338	url	Encode	{}	{string}	Values	4487
3339	os	Error	{}	{string}	*PathError	4488
3340	os	Unwrap	{}	{error}	*PathError	4488
3341	os	Timeout	{}	{bool}	*PathError	4488
3342	os	Error	{}	{string}	*SyscallError	4489
3343	os	Unwrap	{}	{error}	*SyscallError	4489
3344	os	Timeout	{}	{bool}	*SyscallError	4489
3345	exec	Error	{}	{string}	*Error	4490
3346	exec	Unwrap	{}	{error}	*Error	4490
3347	exec	String	{}	{string}	*Cmd	4491
3348	exec	Run	{}	{error}	*Cmd	4491
3349	exec	Start	{}	{error}	*Cmd	4491
3350	exec	Wait	{}	{error}	*Cmd	4491
3351	exec	Output	{}	{[]byte,error}	*Cmd	4491
3352	exec	CombinedOutput	{}	{[]byte,error}	*Cmd	4491
3353	exec	StdinPipe	{}	{io.WriteCloser,error}	*Cmd	4491
3354	exec	StdoutPipe	{}	{io.ReadCloser,error}	*Cmd	4491
3355	exec	StderrPipe	{}	{io.ReadCloser,error}	*Cmd	4491
3356	exec	Error	{}	{string}	*ExitError	4493
3357	os	Release	{}	{error}	*Process	4494
3358	os	Kill	{}	{error}	*Process	4494
3359	os	Wait	{}	{*os.ProcessState,error}	*Process	4494
3360	os	Signal	{os.Signal}	{error}	*Process	4494
3361	os	UserTime	{}	{time.Duration}	*ProcessState	4497
3362	os	SystemTime	{}	{time.Duration}	*ProcessState	4497
3363	os	Exited	{}	{bool}	*ProcessState	4497
3364	os	Success	{}	{bool}	*ProcessState	4497
3365	os	Sys	{}	{"interface{}"}	*ProcessState	4497
3366	os	SysUsage	{}	{"interface{}"}	*ProcessState	4497
3367	os	Pid	{}	{int}	*ProcessState	4497
3368	os	String	{}	{string}	*ProcessState	4497
3369	os	ExitCode	{}	{int}	*ProcessState	4497
3370	os	Pid	{}	{int}	*ProcessState	4497
3371	os	String	{}	{string}	*ProcessState	4497
3372	os	ExitCode	{}	{int}	*ProcessState	4497
3373	os	Error	{}	{string}	*LinkError	4499
3374	os	Unwrap	{}	{error}	*LinkError	4499
3375	pty	Error	{}	{string}	*PtyError	4500
3376	pty	Unwrap	{}	{error}	*PtyError	4500
3377	os	Readdir	{int}	{[]os.FileInfo,error}	*File	4501
3378	os	Readdirnames	{int}	{[]string,error}	*File	4501
3379	os	Name	{}	{string}	*File	4501
3380	os	Read	{[]byte}	{int,error}	*File	4501
3381	os	ReadAt	{[]byte,int64}	{int,error}	*File	4501
3382	os	Write	{[]byte}	{int,error}	*File	4501
3383	os	WriteAt	{[]byte,int64}	{int,error}	*File	4501
3384	os	Seek	{int64,int}	{int64,error}	*File	4501
3385	os	WriteString	{string}	{int,error}	*File	4501
3386	os	Chmod	{os.FileMode}	{error}	*File	4501
3387	os	SetDeadline	{time.Time}	{error}	*File	4501
3388	os	SetReadDeadline	{time.Time}	{error}	*File	4501
3389	os	SetWriteDeadline	{time.Time}	{error}	*File	4501
3390	os	SyscallConn	{}	{syscall.RawConn,error}	*File	4501
3391	os	Fd	{}	{uintptr}	*File	4501
3392	os	Close	{}	{error}	*File	4501
3393	os	Stat	{}	{os.FileInfo,error}	*File	4501
3394	os	Truncate	{int64}	{error}	*File	4501
3395	os	Sync	{}	{error}	*File	4501
3396	os	Chown	{int,int}	{error}	*File	4501
3397	os	Chdir	{}	{error}	*File	4501
3398	os	Chown	{int,int}	{error}	*File	4501
3399	os	Truncate	{int64}	{error}	*File	4501
3400	os	Sync	{}	{error}	*File	4501
3401	os	Chdir	{}	{error}	*File	4501
3402	os	Fd	{}	{uintptr}	*File	4501
3403	os	Close	{}	{error}	*File	4501
3404	os	Fd	{}	{uintptr}	*File	4501
3405	os	Close	{}	{error}	*File	4501
3406	os	Stat	{}	{os.FileInfo,error}	*File	4501
3407	os	Stat	{}	{os.FileInfo,error}	*File	4501
3408	os	String	{}	{string}	FileMode	4503
3409	os	IsDir	{}	{bool}	FileMode	4503
3410	os	IsRegular	{}	{bool}	FileMode	4503
3411	os	Perm	{}	{os.FileMode}	FileMode	4503
3412	user	GroupIds	{}	{[]string,error}	*User	4504
3413	user	Error	{}	{string}	UnknownUserIdError	4506
3414	user	Error	{}	{string}	UnknownUserError	4507
3415	user	Error	{}	{string}	UnknownGroupIdError	4508
3416	user	Error	{}	{string}	UnknownGroupError	4509
3417	plugin	Lookup	{string}	{plugin.Symbol,error}	*Plugin	4511
3418	reflect	String	{}	{string}	Kind	4514
3419	reflect	String	{}	{string}	ChanDir	4515
3420	reflect	Get	{string}	{string}	StructTag	4518
3421	reflect	Lookup	{string}	{string,bool}	StructTag	4518
3422	reflect	Addr	{}	{reflect.Value}	Value	4519
3423	reflect	Bool	{}	{bool}	Value	4519
3424	reflect	Bytes	{}	{[]byte}	Value	4519
3425	reflect	CanAddr	{}	{bool}	Value	4519
3426	reflect	CanSet	{}	{bool}	Value	4519
3427	reflect	Call	{[]reflect.Value}	{[]reflect.Value}	Value	4519
3428	reflect	CallSlice	{[]reflect.Value}	{[]reflect.Value}	Value	4519
3429	reflect	Cap	{}	{int}	Value	4519
3430	reflect	Close	{}	{}	Value	4519
3431	reflect	Complex	{}	{complex128}	Value	4519
3432	reflect	Elem	{}	{reflect.Value}	Value	4519
3433	reflect	Field	{int}	{reflect.Value}	Value	4519
3434	reflect	FieldByIndex	{[]int}	{reflect.Value}	Value	4519
3435	reflect	FieldByName	{string}	{reflect.Value}	Value	4519
3436	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.Value}	Value	4519
3437	reflect	Float	{}	{float64}	Value	4519
3438	reflect	Index	{int}	{reflect.Value}	Value	4519
3439	reflect	Int	{}	{int64}	Value	4519
3440	reflect	CanInterface	{}	{bool}	Value	4519
3441	reflect	Interface	{}	{"interface{}"}	Value	4519
3442	reflect	InterfaceData	{}	{[]uintptr}	Value	4519
3443	reflect	IsNil	{}	{bool}	Value	4519
3444	reflect	IsValid	{}	{bool}	Value	4519
3445	reflect	IsZero	{}	{bool}	Value	4519
3446	reflect	Kind	{}	{reflect.Kind}	Value	4519
3447	reflect	Len	{}	{int}	Value	4519
3448	reflect	MapIndex	{reflect.Value}	{reflect.Value}	Value	4519
3449	reflect	MapKeys	{}	{[]reflect.Value}	Value	4519
3450	reflect	MapRange	{}	{*reflect.MapIter}	Value	4519
3451	reflect	Method	{int}	{reflect.Value}	Value	4519
3452	reflect	NumMethod	{}	{int}	Value	4519
3453	reflect	MethodByName	{string}	{reflect.Value}	Value	4519
3454	reflect	NumField	{}	{int}	Value	4519
3455	reflect	OverflowComplex	{complex128}	{bool}	Value	4519
3456	reflect	OverflowFloat	{float64}	{bool}	Value	4519
3457	reflect	OverflowInt	{int64}	{bool}	Value	4519
3458	reflect	OverflowUint	{uint64}	{bool}	Value	4519
3459	reflect	Pointer	{}	{uintptr}	Value	4519
3460	reflect	Recv	{}	{reflect.Value,bool}	Value	4519
3461	reflect	Send	{reflect.Value}	{}	Value	4519
3462	reflect	Set	{reflect.Value}	{}	Value	4519
3463	reflect	SetBool	{bool}	{}	Value	4519
3464	reflect	SetBytes	{[]byte}	{}	Value	4519
3465	reflect	SetComplex	{complex128}	{}	Value	4519
3466	reflect	SetFloat	{float64}	{}	Value	4519
3467	reflect	SetInt	{int64}	{}	Value	4519
3468	reflect	SetLen	{int}	{}	Value	4519
3469	reflect	SetCap	{int}	{}	Value	4519
3470	reflect	SetMapIndex	{reflect.Value,reflect.Value}	{}	Value	4519
3471	reflect	SetUint	{uint64}	{}	Value	4519
3472	reflect	SetPointer	{unsafe.Pointer}	{}	Value	4519
3473	reflect	SetString	{string}	{}	Value	4519
3474	reflect	Slice	{int,int}	{reflect.Value}	Value	4519
3475	reflect	Slice3	{int,int,int}	{reflect.Value}	Value	4519
3476	reflect	String	{}	{string}	Value	4519
3477	reflect	TryRecv	{}	{reflect.Value,bool}	Value	4519
3478	reflect	TrySend	{reflect.Value}	{bool}	Value	4519
3479	reflect	Type	{}	{reflect.Type}	Value	4519
3480	reflect	Uint	{}	{uint64}	Value	4519
3481	reflect	UnsafeAddr	{}	{uintptr}	Value	4519
3482	reflect	Convert	{reflect.Type}	{reflect.Value}	Value	4519
3483	reflect	Error	{}	{string}	*ValueError	4520
3484	reflect	Key	{}	{reflect.Value}	*MapIter	4521
3485	reflect	Value	{}	{reflect.Value}	*MapIter	4521
3486	reflect	Next	{}	{bool}	*MapIter	4521
3487	regexp	String	{}	{string}	*Regexp	4526
3488	regexp	Copy	{}	{*regexp.Regexp}	*Regexp	4526
3489	regexp	Longest	{}	{}	*Regexp	4526
3490	regexp	NumSubexp	{}	{int}	*Regexp	4526
3491	regexp	SubexpNames	{}	{[]string}	*Regexp	4526
3492	regexp	LiteralPrefix	{}	{string,bool}	*Regexp	4526
3493	regexp	MatchReader	{io.RuneReader}	{bool}	*Regexp	4526
3494	regexp	MatchString	{string}	{bool}	*Regexp	4526
3495	regexp	Match	{[]byte}	{bool}	*Regexp	4526
3496	regexp	ReplaceAllString	{string,string}	{string}	*Regexp	4526
3497	regexp	ReplaceAllLiteralString	{string,string}	{string}	*Regexp	4526
3498	regexp	ReplaceAllStringFunc	{string,"func(string) string"}	{string}	*Regexp	4526
3499	regexp	ReplaceAll	{[]byte,[]byte}	{[]byte}	*Regexp	4526
3500	regexp	ReplaceAllLiteral	{[]byte,[]byte}	{[]byte}	*Regexp	4526
3501	regexp	ReplaceAllFunc	{[]byte,"func([]byte) []byte"}	{[]byte}	*Regexp	4526
3502	regexp	Find	{[]byte}	{[]byte}	*Regexp	4526
3503	regexp	FindIndex	{[]byte}	{[]int}	*Regexp	4526
3504	regexp	FindString	{string}	{string}	*Regexp	4526
3505	regexp	FindStringIndex	{string}	{[]int}	*Regexp	4526
3506	regexp	FindReaderIndex	{io.RuneReader}	{[]int}	*Regexp	4526
3507	regexp	FindSubmatch	{[]byte}	{[][]byte}	*Regexp	4526
3508	regexp	Expand	{[]byte,[]byte,[]byte,[]int}	{[]byte}	*Regexp	4526
3509	regexp	ExpandString	{[]byte,string,string,[]int}	{[]byte}	*Regexp	4526
3510	regexp	FindSubmatchIndex	{[]byte}	{[]int}	*Regexp	4526
3511	regexp	FindStringSubmatch	{string}	{[]string}	*Regexp	4526
3512	regexp	FindStringSubmatchIndex	{string}	{[]int}	*Regexp	4526
3513	regexp	FindReaderSubmatchIndex	{io.RuneReader}	{[]int}	*Regexp	4526
3514	regexp	FindAll	{[]byte,int}	{[][]byte}	*Regexp	4526
3515	regexp	FindAllIndex	{[]byte,int}	{[][]int}	*Regexp	4526
3516	regexp	FindAllString	{string,int}	{[]string}	*Regexp	4526
3517	regexp	FindAllStringIndex	{string,int}	{[][]int}	*Regexp	4526
3518	regexp	FindAllSubmatch	{[]byte,int}	{[][][]byte}	*Regexp	4526
3519	regexp	FindAllSubmatchIndex	{[]byte,int}	{[][]int}	*Regexp	4526
3520	regexp	FindAllStringSubmatch	{string,int}	{[][]string}	*Regexp	4526
3521	regexp	FindAllStringSubmatchIndex	{string,int}	{[][]int}	*Regexp	4526
3522	regexp	Split	{string,int}	{[]string}	*Regexp	4526
3523	syntax	String	{}	{string}	ErrorCode	4528
3524	syntax	String	{}	{string}	*Prog	4530
3525	syntax	Prefix	{}	{string,bool}	*Prog	4530
3526	syntax	StartCond	{}	{syntax.EmptyOp}	*Prog	4530
3527	syntax	String	{}	{string}	InstOp	4531
3528	syntax	MatchRune	{rune}	{bool}	*Inst	4533
3529	syntax	MatchRunePos	{rune}	{int}	*Inst	4533
3530	syntax	MatchEmptyWidth	{rune,rune}	{bool}	*Inst	4533
3531	syntax	String	{}	{string}	*Inst	4533
3532	syntax	Equal	{*syntax.Regexp}	{bool}	*Regexp	4534
3533	syntax	String	{}	{string}	*Regexp	4534
3534	syntax	MaxCap	{}	{int}	*Regexp	4534
3535	syntax	CapNames	{}	{[]string}	*Regexp	4534
3536	syntax	Simplify	{}	{*syntax.Regexp}	*Regexp	4534
3537	syntax	String	{}	{string}	Op	4535
3538	runtime	RuntimeError	{}	{}	*TypeAssertionError	4683
3539	runtime	Error	{}	{string}	*TypeAssertionError	4683
3540	runtime	Stack	{}	{[]uintptr}	*StackRecord	4698
3541	runtime	InUseBytes	{}	{int64}	*MemProfileRecord	4699
3542	runtime	InUseObjects	{}	{int64}	*MemProfileRecord	4699
3543	runtime	Stack	{}	{[]uintptr}	*MemProfileRecord	4699
3544	pprof	Name	{}	{string}	*Profile	4713
3545	pprof	Count	{}	{int}	*Profile	4713
3546	pprof	Add	{"interface{}",int}	{}	*Profile	4713
3547	pprof	Remove	{"interface{}"}	{}	*Profile	4713
3548	pprof	WriteTo	{io.Writer,int}	{error}	*Profile	4713
3549	runtime	Next	{}	{runtime.Frame,bool}	*Frames	4714
3550	runtime	Name	{}	{string}	*Func	4716
3551	runtime	Entry	{}	{uintptr}	*Func	4716
3552	runtime	FileLine	{uintptr}	{string,int}	*Func	4716
3553	main	String	{}	{string}	P	4717
3554	trace	End	{}	{}	*Task	4718
3555	trace	End	{}	{}	*Region	4719
3556	sort	Search	{int}	{int}	IntSlice	4721
3557	sort	Len	{}	{int}	IntSlice	4721
3558	sort	Less	{int,int}	{bool}	IntSlice	4721
3559	sort	Swap	{int,int}	{}	IntSlice	4721
3560	sort	Sort	{}	{}	IntSlice	4721
3561	sort	Search	{float64}	{int}	Float64Slice	4722
3562	sort	Len	{}	{int}	Float64Slice	4722
3563	sort	Less	{int,int}	{bool}	Float64Slice	4722
3564	sort	Swap	{int,int}	{}	Float64Slice	4722
3565	sort	Sort	{}	{}	Float64Slice	4722
3566	sort	Search	{string}	{int}	StringSlice	4723
3567	sort	Len	{}	{int}	StringSlice	4723
3568	sort	Less	{int,int}	{bool}	StringSlice	4723
3569	sort	Swap	{int,int}	{}	StringSlice	4723
3570	sort	Sort	{}	{}	StringSlice	4723
3571	strconv	Error	{}	{string}	*NumError	4724
3572	strings	String	{}	{string}	*Builder	4725
3573	strings	Len	{}	{int}	*Builder	4725
3574	strings	Cap	{}	{int}	*Builder	4725
3575	strings	Reset	{}	{}	*Builder	4725
3576	strings	Grow	{int}	{}	*Builder	4725
3577	strings	Write	{[]byte}	{int,error}	*Builder	4725
3578	strings	WriteByte	{byte}	{error}	*Builder	4725
3579	strings	WriteRune	{rune}	{int,error}	*Builder	4725
3580	strings	WriteString	{string}	{int,error}	*Builder	4725
3581	strings	Len	{}	{int}	*Reader	4726
3582	strings	Size	{}	{int64}	*Reader	4726
3583	strings	Read	{[]byte}	{int,error}	*Reader	4726
3584	strings	ReadAt	{[]byte,int64}	{int,error}	*Reader	4726
3585	strings	ReadByte	{}	{byte,error}	*Reader	4726
3586	strings	UnreadByte	{}	{error}	*Reader	4726
3587	strings	ReadRune	{}	{rune,int,error}	*Reader	4726
3588	strings	UnreadRune	{}	{error}	*Reader	4726
3589	strings	Seek	{int64,int}	{int64,error}	*Reader	4726
3590	strings	WriteTo	{io.Writer}	{int64,error}	*Reader	4726
3591	strings	Reset	{string}	{}	*Reader	4726
3592	strings	Replace	{string}	{string}	*Replacer	4727
3593	strings	WriteString	{io.Writer,string}	{int,error}	*Replacer	4727
3594	atomic	Load	{}	{"interface{}"}	*Value	4728
3595	atomic	Store	{"interface{}"}	{}	*Value	4728
3596	sync	Wait	{}	{}	*Cond	4729
3597	sync	Signal	{}	{}	*Cond	4729
3598	sync	Broadcast	{}	{}	*Cond	4729
3599	sync	Load	{"interface{}"}	{"interface{}",bool}	*Map	4730
3600	sync	Store	{"interface{}","interface{}"}	{}	*Map	4730
3601	sync	LoadOrStore	{"interface{}","interface{}"}	{"interface{}",bool}	*Map	4730
3602	sync	Delete	{"interface{}"}	{}	*Map	4730
3603	sync	Range	{"func(interface{}) bool"}	{}	*Map	4730
3604	sync	Lock	{}	{}	*Mutex	4731
3605	sync	Unlock	{}	{}	*Mutex	4731
3606	sync	Do	{func()}	{}	*Once	4733
3607	sync	Put	{"interface{}"}	{}	*Pool	4734
3608	sync	Get	{}	{"interface{}"}	*Pool	4734
3609	sync	RLock	{}	{}	*RWMutex	4735
3610	sync	RUnlock	{}	{}	*RWMutex	4735
3611	sync	Lock	{}	{}	*RWMutex	4735
3612	sync	Unlock	{}	{}	*RWMutex	4735
3613	sync	RLocker	{}	{sync.Locker}	*RWMutex	4735
3614	sync	Add	{int}	{}	*WaitGroup	4736
3615	sync	Done	{}	{}	*WaitGroup	4736
3616	sync	Wait	{}	{}	*WaitGroup	4736
3617	syscall	Null	{}	{}	*Dir	4738
3618	syscall	Marshal	{[]byte}	{int,error}	*Dir	4738
3619	syscall	Error	{}	{string}	*DLLError	4739
3620	syscall	FindProc	{string}	{*syscall.Proc,error}	*DLL	4740
3621	syscall	MustFindProc	{string}	{*syscall.Proc}	*DLL	4740
3622	syscall	Release	{}	{error}	*DLL	4740
3623	syscall	Addr	{}	{uintptr}	*Proc	4741
3624	syscall	Call	{...uintptr}	{uintptr,error}	*Proc	4741
3625	syscall	Load	{}	{error}	*LazyDLL	4742
3626	syscall	Handle	{}	{uintptr}	*LazyDLL	4742
3627	syscall	NewProc	{string}	{*syscall.LazyProc}	*LazyDLL	4742
3628	syscall	Find	{}	{error}	*LazyProc	4743
3629	syscall	Addr	{}	{uintptr}	*LazyProc	4743
3630	syscall	Call	{...uintptr}	{uintptr,error}	*LazyProc	4743
3631	js	Release	{}	{}	Func	4755
3632	js	JSValue	{}	{js.Value}	Value	4757
3633	js	Type	{}	{js.Type}	Value	4757
3634	js	Get	{string}	{js.Value}	Value	4757
3635	js	Set	{string,"interface{}"}	{}	Value	4757
3636	js	Index	{int}	{js.Value}	Value	4757
3637	js	SetIndex	{int,"interface{}"}	{}	Value	4757
3638	js	Length	{}	{int}	Value	4757
3639	js	Call	{string,"...interface{}"}	{js.Value}	Value	4757
3640	js	Invoke	{"...interface{}"}	{js.Value}	Value	4757
3641	js	New	{"...interface{}"}	{js.Value}	Value	4757
3642	js	Float	{}	{float64}	Value	4757
3643	js	Int	{}	{int}	Value	4757
3644	js	Bool	{}	{bool}	Value	4757
3645	js	Truthy	{}	{bool}	Value	4757
3646	js	String	{}	{string}	Value	4757
3647	js	InstanceOf	{js.Value}	{bool}	Value	4757
3648	js	Error	{}	{string}	Error	4758
3649	js	String	{}	{string}	Type	4759
3650	js	Error	{}	{string}	*ValueError	4760
3651	syscall	String	{}	{string,error}	*SID	4792
3652	syscall	Len	{}	{int}	*SID	4792
3653	syscall	Copy	{}	{*syscall.SID,error}	*SID	4792
3654	syscall	LookupAccount	{string}	{string,uint32,error}	*SID	4792
3655	syscall	Close	{}	{error}	Token	4796
3656	syscall	GetTokenUser	{}	{*syscall.Tokenuser,error}	Token	4796
3657	syscall	GetTokenPrimaryGroup	{}	{*syscall.Tokenprimarygroup,error}	Token	4796
3658	syscall	GetUserProfileDirectory	{}	{string,error}	Token	4796
3659	syscall	Stopped	{}	{bool}	WaitStatus	4799
3660	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4799
3661	syscall	Exited	{}	{bool}	WaitStatus	4799
3662	syscall	ExitStatus	{}	{int}	WaitStatus	4799
3663	syscall	Signaled	{}	{bool}	WaitStatus	4799
3664	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4799
3665	syscall	Continued	{}	{bool}	WaitStatus	4799
3666	syscall	CoreDump	{}	{bool}	WaitStatus	4799
3667	syscall	TrapCause	{}	{int}	WaitStatus	4799
3668	syscall	Exited	{}	{bool}	WaitStatus	4799
3669	syscall	ExitStatus	{}	{int}	WaitStatus	4799
3670	syscall	Signaled	{}	{bool}	WaitStatus	4799
3671	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4799
3672	syscall	CoreDump	{}	{bool}	WaitStatus	4799
3673	syscall	Stopped	{}	{bool}	WaitStatus	4799
3674	syscall	Continued	{}	{bool}	WaitStatus	4799
3675	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4799
3676	syscall	TrapCause	{}	{int}	WaitStatus	4799
3677	syscall	Exited	{}	{bool}	WaitStatus	4799
3678	syscall	ExitStatus	{}	{int}	WaitStatus	4799
3679	syscall	Signaled	{}	{bool}	WaitStatus	4799
3680	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4799
3681	syscall	CoreDump	{}	{bool}	WaitStatus	4799
3682	syscall	Stopped	{}	{bool}	WaitStatus	4799
3683	syscall	Continued	{}	{bool}	WaitStatus	4799
3684	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4799
3685	syscall	TrapCause	{}	{int}	WaitStatus	4799
3686	syscall	Exited	{}	{bool}	WaitStatus	4799
3687	syscall	Signaled	{}	{bool}	WaitStatus	4799
3688	syscall	Stopped	{}	{bool}	WaitStatus	4799
3689	syscall	Continued	{}	{bool}	WaitStatus	4799
3690	syscall	CoreDump	{}	{bool}	WaitStatus	4799
3691	syscall	ExitStatus	{}	{int}	WaitStatus	4799
3692	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4799
3693	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4799
3694	syscall	TrapCause	{}	{int}	WaitStatus	4799
3695	syscall	Exited	{}	{bool}	WaitStatus	4799
3696	syscall	ExitStatus	{}	{int}	WaitStatus	4799
3697	syscall	Signaled	{}	{bool}	WaitStatus	4799
3698	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4799
3699	syscall	CoreDump	{}	{bool}	WaitStatus	4799
3700	syscall	Stopped	{}	{bool}	WaitStatus	4799
3701	syscall	Continued	{}	{bool}	WaitStatus	4799
3702	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4799
3703	syscall	TrapCause	{}	{int}	WaitStatus	4799
3704	syscall	Exited	{}	{bool}	WaitStatus	4799
3705	syscall	ExitStatus	{}	{int}	WaitStatus	4799
3706	syscall	Signaled	{}	{bool}	WaitStatus	4799
3707	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4799
3708	syscall	CoreDump	{}	{bool}	WaitStatus	4799
3709	syscall	Stopped	{}	{bool}	WaitStatus	4799
3710	syscall	Continued	{}	{bool}	WaitStatus	4799
3711	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4799
3712	syscall	TrapCause	{}	{int}	WaitStatus	4799
3713	syscall	Exited	{}	{bool}	WaitStatus	4799
3714	syscall	ExitStatus	{}	{int}	WaitStatus	4799
3715	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4799
3716	syscall	CoreDump	{}	{bool}	WaitStatus	4799
3717	syscall	Stopped	{}	{bool}	WaitStatus	4799
3718	syscall	Continued	{}	{bool}	WaitStatus	4799
3719	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4799
3720	syscall	Signaled	{}	{bool}	WaitStatus	4799
3721	syscall	TrapCause	{}	{int}	WaitStatus	4799
3722	syscall	Error	{}	{string}	Errno	4805
3723	syscall	Is	{error}	{bool}	Errno	4805
3724	syscall	Temporary	{}	{bool}	Errno	4805
3725	syscall	Timeout	{}	{bool}	Errno	4805
3726	syscall	Error	{}	{string}	Errno	4805
3727	syscall	Is	{error}	{bool}	Errno	4805
3728	syscall	Temporary	{}	{bool}	Errno	4805
3729	syscall	Timeout	{}	{bool}	Errno	4805
3730	syscall	Error	{}	{string}	Errno	4805
3731	syscall	Is	{error}	{bool}	Errno	4805
3732	syscall	Temporary	{}	{bool}	Errno	4805
3733	syscall	Timeout	{}	{bool}	Errno	4805
3734	syscall	Error	{}	{string}	Errno	4805
3735	syscall	Is	{error}	{bool}	Errno	4805
3736	syscall	Temporary	{}	{bool}	Errno	4805
3737	syscall	Timeout	{}	{bool}	Errno	4805
3738	syscall	Signal	{}	{}	Signal	4806
3739	syscall	String	{}	{string}	Signal	4806
3740	syscall	Signal	{}	{}	Signal	4806
3741	syscall	String	{}	{string}	Signal	4806
3742	syscall	Signal	{}	{}	Signal	4806
3743	syscall	String	{}	{string}	Signal	4806
3744	syscall	Signal	{}	{}	Signal	4806
3745	syscall	String	{}	{string}	Signal	4806
3746	syscall	SetLen	{int}	{}	*Iovec	4812
3747	syscall	SetLen	{int}	{}	*Iovec	4812
3748	syscall	SetLen	{int}	{}	*Iovec	4812
3749	syscall	SetLen	{int}	{}	*Iovec	4812
3750	syscall	SetLen	{int}	{}	*Iovec	4812
3751	syscall	SetLen	{int}	{}	*Iovec	4812
3752	syscall	SetLen	{int}	{}	*Iovec	4812
3753	syscall	SetLen	{int}	{}	*Iovec	4812
3754	syscall	SetLen	{int}	{}	*Iovec	4812
3755	syscall	SetLen	{int}	{}	*Iovec	4812
3756	syscall	SetLen	{int}	{}	*Iovec	4812
3757	syscall	SetLen	{int}	{}	*Iovec	4812
3758	syscall	SetLen	{int}	{}	*Iovec	4812
3759	syscall	SetLen	{int}	{}	*Iovec	4812
3760	syscall	SetLen	{int}	{}	*Iovec	4812
3761	syscall	SetLen	{int}	{}	*Iovec	4812
3762	syscall	SetLen	{int}	{}	*Iovec	4812
3763	syscall	SetLen	{int}	{}	*Iovec	4812
3764	syscall	SetLen	{int}	{}	*Iovec	4812
3765	syscall	SetLen	{int}	{}	*Iovec	4812
3766	syscall	SetLen	{int}	{}	*Iovec	4812
3767	syscall	SetLen	{int}	{}	*Iovec	4812
3768	syscall	SetLen	{int}	{}	*Iovec	4812
3769	syscall	SetLen	{int}	{}	*Iovec	4812
3770	syscall	SetLen	{int}	{}	*Iovec	4812
3771	syscall	SetLen	{int}	{}	*Iovec	4812
3772	syscall	Unix	{}	{int64,int64}	*Timespec	4813
3773	syscall	Nano	{}	{int64}	*Timespec	4813
3774	syscall	Unix	{}	{int64,int64}	*Timeval	4814
3775	syscall	Nano	{}	{int64}	*Timeval	4814
3776	syscall	Nanoseconds	{}	{int64}	*Timeval	4814
3777	syscall	Error	{}	{string}	ErrorString	4835
3778	syscall	Is	{error}	{bool}	ErrorString	4835
3779	syscall	Temporary	{}	{bool}	ErrorString	4835
3780	syscall	Timeout	{}	{bool}	ErrorString	4835
3781	syscall	Signal	{}	{}	Note	4836
3782	syscall	String	{}	{string}	Note	4836
3783	syscall	Exited	{}	{bool}	Waitmsg	4837
3784	syscall	Signaled	{}	{bool}	Waitmsg	4837
3785	syscall	ExitStatus	{}	{int}	Waitmsg	4837
3786	syscall	Sockaddr	{}	{syscall.Sockaddr,error}	*RawSockaddrAny	4853
3787	syscall	Unix	{}	{int64,int64}	*StTimespec_t	4876
3788	syscall	Nano	{}	{int64}	*StTimespec_t	4876
3789	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3790	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3791	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3792	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3793	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3794	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3795	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3796	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3797	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3798	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3799	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3800	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3801	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3802	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3803	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3804	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3805	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3806	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3807	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3808	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3809	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3810	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3811	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3812	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3813	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3814	syscall	SetLen	{int}	{}	*Cmsghdr	4884
3815	syscall	SetControllen	{int}	{}	*Msghdr	4890
3816	syscall	SetControllen	{int}	{}	*Msghdr	4890
3817	syscall	SetControllen	{int}	{}	*Msghdr	4890
3818	syscall	SetControllen	{int}	{}	*Msghdr	4890
3819	syscall	SetControllen	{int}	{}	*Msghdr	4890
3820	syscall	SetControllen	{int}	{}	*Msghdr	4890
3821	syscall	SetControllen	{int}	{}	*Msghdr	4890
3822	syscall	SetControllen	{int}	{}	*Msghdr	4890
3823	syscall	SetControllen	{int}	{}	*Msghdr	4890
3824	syscall	SetControllen	{int}	{}	*Msghdr	4890
3825	syscall	SetControllen	{int}	{}	*Msghdr	4890
3826	syscall	SetControllen	{int}	{}	*Msghdr	4890
3827	syscall	SetControllen	{int}	{}	*Msghdr	4890
3828	syscall	SetControllen	{int}	{}	*Msghdr	4890
3829	syscall	SetControllen	{int}	{}	*Msghdr	4890
3830	syscall	SetControllen	{int}	{}	*Msghdr	4890
3831	syscall	SetControllen	{int}	{}	*Msghdr	4890
3832	syscall	SetControllen	{int}	{}	*Msghdr	4890
3833	syscall	SetControllen	{int}	{}	*Msghdr	4890
3834	syscall	SetControllen	{int}	{}	*Msghdr	4890
3835	syscall	SetControllen	{int}	{}	*Msghdr	4890
3836	syscall	SetControllen	{int}	{}	*Msghdr	4890
3837	syscall	SetControllen	{int}	{}	*Msghdr	4890
3838	syscall	SetControllen	{int}	{}	*Msghdr	4890
3839	syscall	SetControllen	{int}	{}	*Msghdr	4890
3840	syscall	PC	{}	{uint64}	*PtraceRegs	5065
3841	syscall	SetPC	{uint64}	{}	*PtraceRegs	5065
3842	syscall	PC	{}	{uint64}	*PtraceRegs	5065
3843	syscall	SetPC	{uint64}	{}	*PtraceRegs	5065
3844	syscall	PC	{}	{uint64}	*PtraceRegs	5065
3845	syscall	SetPC	{uint64}	{}	*PtraceRegs	5065
3846	syscall	PC	{}	{uint64}	*PtraceRegs	5065
3847	syscall	SetPC	{uint64}	{}	*PtraceRegs	5065
3848	syscall	PC	{}	{uint64}	*PtraceRegs	5065
3849	syscall	SetPC	{uint64}	{}	*PtraceRegs	5065
3850	syscall	PC	{}	{uint64}	*PtraceRegs	5065
3851	syscall	SetPC	{uint64}	{}	*PtraceRegs	5065
3852	syscall	PC	{}	{uint64}	*PtraceRegs	5065
3853	syscall	SetPC	{uint64}	{}	*PtraceRegs	5065
3854	syscall	PC	{}	{uint64}	*PtraceRegs	5065
3855	syscall	SetPC	{uint64}	{}	*PtraceRegs	5065
3856	syscall	Nanoseconds	{}	{int64}	*Filetime	5194
3857	testing	Next	{}	{bool}	*PB	6556
3858	testdeps	MatchString	{string,string}	{bool,error}	TestDeps	6560
3859	testdeps	StartCPUProfile	{io.Writer}	{error}	TestDeps	6560
3860	testdeps	StopCPUProfile	{}	{}	TestDeps	6560
3861	testdeps	WriteProfileTo	{string,io.Writer,int}	{error}	TestDeps	6560
3862	testdeps	ImportPath	{}	{string}	TestDeps	6560
3863	testdeps	StartTestLog	{io.Writer}	{}	TestDeps	6560
3864	testdeps	StopTestLog	{}	{error}	TestDeps	6560
3865	quick	Error	{}	{string}	SetupError	6563
3866	quick	Error	{}	{string}	*CheckError	6564
3867	quick	Error	{}	{string}	*CheckEqualError	6565
3868	testing	Run	{}	{int}	*M	6569
3869	scanner	IsValid	{}	{bool}	*Position	6570
3870	scanner	String	{}	{string}	Position	6570
3871	tabwriter	Init	{io.Writer,int,int,int,byte,uint}	{*tabwriter.Writer}	*Writer	6572
3872	tabwriter	Flush	{}	{error}	*Writer	6572
3873	tabwriter	Write	{[]byte}	{int,error}	*Writer	6572
3874	template	Error	{}	{string}	ExecError	6573
3875	template	Unwrap	{}	{error}	ExecError	6573
3876	parse	Type	{}	{parse.NodeType}	NodeType	6576
3877	parse	Position	{}	{parse.Pos}	Pos	6577
3878	parse	String	{}	{string}	*ListNode	6578
3879	parse	CopyList	{}	{*parse.ListNode}	*ListNode	6578
3880	parse	Copy	{}	{parse.Node}	*ListNode	6578
3881	parse	String	{}	{string}	*TextNode	6579
3882	parse	Copy	{}	{parse.Node}	*TextNode	6579
3954	time	Unix	{}	{int64}	Time	6604
3883	parse	String	{}	{string}	*PipeNode	6580
3884	parse	CopyPipe	{}	{*parse.PipeNode}	*PipeNode	6580
3885	parse	Copy	{}	{parse.Node}	*PipeNode	6580
3886	parse	String	{}	{string}	*ActionNode	6581
3887	parse	Copy	{}	{parse.Node}	*ActionNode	6581
3888	parse	String	{}	{string}	*CommandNode	6582
3889	parse	Copy	{}	{parse.Node}	*CommandNode	6582
3890	parse	SetPos	{parse.Pos}	{*parse.IdentifierNode}	*IdentifierNode	6583
3891	parse	SetTree	{*parse.Tree}	{*parse.IdentifierNode}	*IdentifierNode	6583
3892	parse	String	{}	{string}	*IdentifierNode	6583
3893	parse	Copy	{}	{parse.Node}	*IdentifierNode	6583
3894	parse	String	{}	{string}	*VariableNode	6584
3895	parse	Copy	{}	{parse.Node}	*VariableNode	6584
3896	parse	Type	{}	{parse.NodeType}	*DotNode	6585
3897	parse	String	{}	{string}	*DotNode	6585
3898	parse	Copy	{}	{parse.Node}	*DotNode	6585
3899	parse	Type	{}	{parse.NodeType}	*NilNode	6586
3900	parse	String	{}	{string}	*NilNode	6586
3901	parse	Copy	{}	{parse.Node}	*NilNode	6586
3902	parse	String	{}	{string}	*FieldNode	6587
3903	parse	Copy	{}	{parse.Node}	*FieldNode	6587
3904	parse	Add	{string}	{}	*ChainNode	6588
3905	parse	String	{}	{string}	*ChainNode	6588
3906	parse	Copy	{}	{parse.Node}	*ChainNode	6588
3907	parse	String	{}	{string}	*BoolNode	6589
3908	parse	Copy	{}	{parse.Node}	*BoolNode	6589
3909	parse	String	{}	{string}	*NumberNode	6590
3910	parse	Copy	{}	{parse.Node}	*NumberNode	6590
3911	parse	String	{}	{string}	*StringNode	6591
3912	parse	Copy	{}	{parse.Node}	*StringNode	6591
3913	parse	String	{}	{string}	*BranchNode	6592
3914	parse	Copy	{}	{parse.Node}	*BranchNode	6592
3915	parse	Copy	{}	{parse.Node}	*IfNode	6593
3916	parse	Copy	{}	{parse.Node}	*RangeNode	6594
3917	parse	Copy	{}	{parse.Node}	*WithNode	6595
3918	parse	String	{}	{string}	*TemplateNode	6596
3919	parse	Copy	{}	{parse.Node}	*TemplateNode	6596
3920	parse	Copy	{}	{*parse.Tree}	*Tree	6597
3921	parse	ErrorContext	{parse.Node}	{string}	*Tree	6597
3922	parse	Parse	{string,string,string,map[string]*parse.Tree,"...map[string]interface{}"}	{*parse.Tree,error}	*Tree	6597
3923	time	Error	{}	{string}	*ParseError	6599
3924	time	Stop	{}	{bool}	*Timer	6602
3925	time	Reset	{time.Duration}	{bool}	*Timer	6602
3926	time	Stop	{}	{}	*Ticker	6603
3927	time	String	{}	{string}	Time	6604
3928	time	Format	{string}	{string}	Time	6604
3929	time	AppendFormat	{[]byte,string}	{[]byte}	Time	6604
3930	time	After	{time.Time}	{bool}	Time	6604
3931	time	Before	{time.Time}	{bool}	Time	6604
3932	time	Equal	{time.Time}	{bool}	Time	6604
3933	time	IsZero	{}	{bool}	Time	6604
3934	time	Date	{}	{int,time.Month,int}	Time	6604
3935	time	Year	{}	{int}	Time	6604
3936	time	Month	{}	{time.Month}	Time	6604
3937	time	Day	{}	{int}	Time	6604
3938	time	Weekday	{}	{time.Weekday}	Time	6604
3939	time	ISOWeek	{}	{int}	Time	6604
3940	time	Clock	{}	{int}	Time	6604
3941	time	Hour	{}	{int}	Time	6604
3942	time	Minute	{}	{int}	Time	6604
3943	time	Second	{}	{int}	Time	6604
3944	time	Nanosecond	{}	{int}	Time	6604
3945	time	YearDay	{}	{int}	Time	6604
3946	time	Add	{time.Duration}	{time.Time}	Time	6604
3947	time	Sub	{time.Time}	{time.Duration}	Time	6604
3948	time	AddDate	{int,int,int}	{time.Time}	Time	6604
3949	time	UTC	{}	{time.Time}	Time	6604
3950	time	Local	{}	{time.Time}	Time	6604
3951	time	In	{*time.Location}	{time.Time}	Time	6604
3952	time	Location	{}	{*time.Location}	Time	6604
3953	time	Zone	{}	{string,int}	Time	6604
3955	time	UnixNano	{}	{int64}	Time	6604
3956	time	MarshalBinary	{}	{[]byte,error}	Time	6604
3957	time	UnmarshalBinary	{[]byte}	{error}	*Time	6604
3958	time	GobEncode	{}	{[]byte,error}	Time	6604
3959	time	GobDecode	{[]byte}	{error}	*Time	6604
3960	time	MarshalJSON	{}	{[]byte,error}	Time	6604
3961	time	UnmarshalJSON	{[]byte}	{error}	*Time	6604
3962	time	MarshalText	{}	{[]byte,error}	Time	6604
3963	time	UnmarshalText	{[]byte}	{error}	*Time	6604
3964	time	Truncate	{time.Duration}	{time.Time}	Time	6604
3965	time	Round	{time.Duration}	{time.Time}	Time	6604
3966	time	String	{}	{string}	Month	6605
3967	time	String	{}	{string}	Weekday	6606
3968	time	String	{}	{string}	Duration	6607
3969	time	Nanoseconds	{}	{int64}	Duration	6607
3970	time	Microseconds	{}	{int64}	Duration	6607
3971	time	Milliseconds	{}	{int64}	Duration	6607
3972	time	Seconds	{}	{float64}	Duration	6607
3973	time	Minutes	{}	{float64}	Duration	6607
3974	time	Hours	{}	{float64}	Duration	6607
3975	time	Truncate	{time.Duration}	{time.Duration}	Duration	6607
3976	time	Round	{time.Duration}	{time.Duration}	Duration	6607
3977	time	String	{}	{string}	*Location	6608
3978	unicode	ToUpper	{rune}	{rune}	SpecialCase	6613
3979	unicode	ToTitle	{rune}	{rune}	SpecialCase	6613
3980	unicode	ToLower	{rune}	{rune}	SpecialCase	6613
3981	asn1	Constructed	{}	{asn1.Tag}	Tag	6616
3982	asn1	ContextSpecific	{}	{asn1.Tag}	Tag	6616
3983	cryptobyte	AddASN1Int64	{int64}	{}	*Builder	6617
3984	cryptobyte	AddASN1Int64WithTag	{int64,asn1.Tag}	{}	*Builder	6617
3985	cryptobyte	AddASN1Enum	{int64}	{}	*Builder	6617
3986	cryptobyte	AddASN1Uint64	{uint64}	{}	*Builder	6617
3987	cryptobyte	AddASN1BigInt	{*big.Int}	{}	*Builder	6617
3988	cryptobyte	AddASN1OctetString	{[]byte}	{}	*Builder	6617
3989	cryptobyte	AddASN1GeneralizedTime	{time.Time}	{}	*Builder	6617
3990	cryptobyte	AddASN1BitString	{[]byte}	{}	*Builder	6617
3991	cryptobyte	AddASN1ObjectIdentifier	{encoding_asn1.ObjectIdentifier}	{}	*Builder	6617
3992	cryptobyte	AddASN1Boolean	{bool}	{}	*Builder	6617
3993	cryptobyte	AddASN1NULL	{}	{}	*Builder	6617
3994	cryptobyte	MarshalASN1	{"interface{}"}	{}	*Builder	6617
3995	cryptobyte	AddASN1	{asn1.Tag,cryptobyte.BuilderContinuation}	{}	*Builder	6617
3996	cryptobyte	SetError	{error}	{}	*Builder	6617
3997	cryptobyte	Bytes	{}	{[]byte,error}	*Builder	6617
3998	cryptobyte	BytesOrPanic	{}	{[]byte}	*Builder	6617
3999	cryptobyte	AddUint8	{uint8}	{}	*Builder	6617
4000	cryptobyte	AddUint16	{uint16}	{}	*Builder	6617
4001	cryptobyte	AddUint24	{uint32}	{}	*Builder	6617
4002	cryptobyte	AddUint32	{uint32}	{}	*Builder	6617
4003	cryptobyte	AddBytes	{[]byte}	{}	*Builder	6617
4004	cryptobyte	AddUint8LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	6617
4005	cryptobyte	AddUint16LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	6617
4006	cryptobyte	AddUint24LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	6617
4007	cryptobyte	AddUint32LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	6617
4008	cryptobyte	Unwrite	{int}	{}	*Builder	6617
4009	cryptobyte	AddValue	{cryptobyte.MarshalingValue}	{}	*Builder	6617
4010	cryptobyte	ReadASN1Boolean	{*bool}	{bool}	*String	6621
4011	cryptobyte	ReadASN1Integer	{"interface{}"}	{bool}	*String	6621
4012	cryptobyte	ReadASN1Int64WithTag	{*int64,asn1.Tag}	{bool}	*String	6621
4013	cryptobyte	ReadASN1Enum	{*int}	{bool}	*String	6621
4014	cryptobyte	ReadASN1ObjectIdentifier	{*encoding_asn1.ObjectIdentifier}	{bool}	*String	6621
4015	cryptobyte	ReadASN1GeneralizedTime	{*time.Time}	{bool}	*String	6621
4016	cryptobyte	ReadASN1BitString	{*encoding_asn1.BitString}	{bool}	*String	6621
4017	cryptobyte	ReadASN1BitStringAsBytes	{*[]byte}	{bool}	*String	6621
4018	cryptobyte	ReadASN1Bytes	{*[]byte,asn1.Tag}	{bool}	*String	6621
4019	cryptobyte	ReadASN1	{*cryptobyte.String,asn1.Tag}	{bool}	*String	6621
4020	cryptobyte	ReadASN1Element	{*cryptobyte.String,asn1.Tag}	{bool}	*String	6621
4021	cryptobyte	ReadAnyASN1	{*cryptobyte.String,*asn1.Tag}	{bool}	*String	6621
4022	cryptobyte	ReadAnyASN1Element	{*cryptobyte.String,*asn1.Tag}	{bool}	*String	6621
4023	cryptobyte	PeekASN1Tag	{asn1.Tag}	{bool}	String	6621
4024	cryptobyte	SkipASN1	{asn1.Tag}	{bool}	*String	6621
4025	cryptobyte	ReadOptionalASN1	{*cryptobyte.String,*bool,asn1.Tag}	{bool}	*String	6621
4026	cryptobyte	SkipOptionalASN1	{asn1.Tag}	{bool}	*String	6621
4027	cryptobyte	ReadOptionalASN1Integer	{"interface{}",asn1.Tag,"interface{}"}	{bool}	*String	6621
4028	cryptobyte	ReadOptionalASN1OctetString	{*[]byte,*bool,asn1.Tag}	{bool}	*String	6621
4029	cryptobyte	ReadOptionalASN1Boolean	{*bool,bool}	{bool}	*String	6621
4030	cryptobyte	Skip	{int}	{bool}	*String	6621
4031	cryptobyte	ReadUint8	{*uint8}	{bool}	*String	6621
4032	cryptobyte	ReadUint16	{*uint16}	{bool}	*String	6621
4033	cryptobyte	ReadUint24	{*uint32}	{bool}	*String	6621
4034	cryptobyte	ReadUint32	{*uint32}	{bool}	*String	6621
4035	cryptobyte	ReadUint8LengthPrefixed	{*cryptobyte.String}	{bool}	*String	6621
4036	cryptobyte	ReadUint16LengthPrefixed	{*cryptobyte.String}	{bool}	*String	6621
4037	cryptobyte	ReadUint24LengthPrefixed	{*cryptobyte.String}	{bool}	*String	6621
4038	cryptobyte	ReadBytes	{*[]byte,int}	{bool}	*String	6621
4039	cryptobyte	CopyBytes	{[]byte}	{bool}	*String	6621
4040	cryptobyte	Empty	{}	{bool}	String	6621
4041	chacha20	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	6622
4042	chacha20	Advance	{}	{}	*Cipher	6622
4043	poly1305	Size	{}	{int}	*MAC	6623
4044	poly1305	Write	{[]byte}	{int,error}	*MAC	6623
4045	poly1305	Sum	{[]byte}	{[]byte}	*MAC	6623
4046	dnsmessage	String	{}	{string}	Type	6624
4047	dnsmessage	GoString	{}	{string}	Type	6624
4048	dnsmessage	String	{}	{string}	Class	6625
4049	dnsmessage	GoString	{}	{string}	Class	6625
4050	dnsmessage	GoString	{}	{string}	OpCode	6626
4051	dnsmessage	String	{}	{string}	RCode	6627
4052	dnsmessage	GoString	{}	{string}	RCode	6627
4053	dnsmessage	GoString	{}	{string}	*Header	6628
4054	dnsmessage	Unpack	{[]byte}	{error}	*Message	6629
4055	dnsmessage	Pack	{}	{[]byte,error}	*Message	6629
4056	dnsmessage	AppendPack	{[]byte}	{[]byte,error}	*Message	6629
4057	dnsmessage	GoString	{}	{string}	*Message	6629
4058	dnsmessage	GoString	{}	{string}	*Resource	6630
4059	dnsmessage	Start	{[]byte}	{dnsmessage.Header,error}	*Parser	6632
4060	dnsmessage	Question	{}	{dnsmessage.Question,error}	*Parser	6632
4061	dnsmessage	AllQuestions	{}	{[]dnsmessage.Question,error}	*Parser	6632
4062	dnsmessage	SkipQuestion	{}	{error}	*Parser	6632
4063	dnsmessage	SkipAllQuestions	{}	{error}	*Parser	6632
4064	dnsmessage	AnswerHeader	{}	{dnsmessage.ResourceHeader,error}	*Parser	6632
4065	dnsmessage	Answer	{}	{dnsmessage.Resource,error}	*Parser	6632
4066	dnsmessage	AllAnswers	{}	{[]dnsmessage.Resource,error}	*Parser	6632
4067	dnsmessage	SkipAnswer	{}	{error}	*Parser	6632
4068	dnsmessage	SkipAllAnswers	{}	{error}	*Parser	6632
4069	dnsmessage	AuthorityHeader	{}	{dnsmessage.ResourceHeader,error}	*Parser	6632
4070	dnsmessage	Authority	{}	{dnsmessage.Resource,error}	*Parser	6632
4071	dnsmessage	AllAuthorities	{}	{[]dnsmessage.Resource,error}	*Parser	6632
4072	dnsmessage	SkipAuthority	{}	{error}	*Parser	6632
4073	dnsmessage	SkipAllAuthorities	{}	{error}	*Parser	6632
4074	dnsmessage	AdditionalHeader	{}	{dnsmessage.ResourceHeader,error}	*Parser	6632
4075	dnsmessage	Additional	{}	{dnsmessage.Resource,error}	*Parser	6632
4076	dnsmessage	AllAdditionals	{}	{[]dnsmessage.Resource,error}	*Parser	6632
4077	dnsmessage	SkipAdditional	{}	{error}	*Parser	6632
4078	dnsmessage	SkipAllAdditionals	{}	{error}	*Parser	6632
4138	hpack	SetAllowedMaxDynamicTableSize	{uint32}	{}	*Decoder	6653
4079	dnsmessage	CNAMEResource	{}	{dnsmessage.CNAMEResource,error}	*Parser	6632
4080	dnsmessage	MXResource	{}	{dnsmessage.MXResource,error}	*Parser	6632
4081	dnsmessage	NSResource	{}	{dnsmessage.NSResource,error}	*Parser	6632
4082	dnsmessage	PTRResource	{}	{dnsmessage.PTRResource,error}	*Parser	6632
4083	dnsmessage	SOAResource	{}	{dnsmessage.SOAResource,error}	*Parser	6632
4084	dnsmessage	TXTResource	{}	{dnsmessage.TXTResource,error}	*Parser	6632
4085	dnsmessage	SRVResource	{}	{dnsmessage.SRVResource,error}	*Parser	6632
4086	dnsmessage	AResource	{}	{dnsmessage.AResource,error}	*Parser	6632
4087	dnsmessage	AAAAResource	{}	{dnsmessage.AAAAResource,error}	*Parser	6632
4088	dnsmessage	OPTResource	{}	{dnsmessage.OPTResource,error}	*Parser	6632
4089	dnsmessage	EnableCompression	{}	{}	*Builder	6633
4090	dnsmessage	StartQuestions	{}	{error}	*Builder	6633
4091	dnsmessage	StartAnswers	{}	{error}	*Builder	6633
4092	dnsmessage	StartAuthorities	{}	{error}	*Builder	6633
4093	dnsmessage	StartAdditionals	{}	{error}	*Builder	6633
4094	dnsmessage	Question	{dnsmessage.Question}	{error}	*Builder	6633
4095	dnsmessage	CNAMEResource	{dnsmessage.ResourceHeader,dnsmessage.CNAMEResource}	{error}	*Builder	6633
4096	dnsmessage	MXResource	{dnsmessage.ResourceHeader,dnsmessage.MXResource}	{error}	*Builder	6633
4097	dnsmessage	NSResource	{dnsmessage.ResourceHeader,dnsmessage.NSResource}	{error}	*Builder	6633
4098	dnsmessage	PTRResource	{dnsmessage.ResourceHeader,dnsmessage.PTRResource}	{error}	*Builder	6633
4099	dnsmessage	SOAResource	{dnsmessage.ResourceHeader,dnsmessage.SOAResource}	{error}	*Builder	6633
4100	dnsmessage	TXTResource	{dnsmessage.ResourceHeader,dnsmessage.TXTResource}	{error}	*Builder	6633
4101	dnsmessage	SRVResource	{dnsmessage.ResourceHeader,dnsmessage.SRVResource}	{error}	*Builder	6633
4102	dnsmessage	AResource	{dnsmessage.ResourceHeader,dnsmessage.AResource}	{error}	*Builder	6633
4103	dnsmessage	AAAAResource	{dnsmessage.ResourceHeader,dnsmessage.AAAAResource}	{error}	*Builder	6633
4104	dnsmessage	OPTResource	{dnsmessage.ResourceHeader,dnsmessage.OPTResource}	{error}	*Builder	6633
4105	dnsmessage	Finish	{}	{[]byte,error}	*Builder	6633
4106	dnsmessage	GoString	{}	{string}	*ResourceHeader	6634
4107	dnsmessage	SetEDNS0	{int,dnsmessage.RCode,bool}	{error}	*ResourceHeader	6634
4108	dnsmessage	DNSSECAllowed	{}	{bool}	*ResourceHeader	6634
4109	dnsmessage	ExtendedRCode	{dnsmessage.RCode}	{dnsmessage.RCode}	*ResourceHeader	6634
4110	dnsmessage	String	{}	{string}	Name	6635
4111	dnsmessage	GoString	{}	{string}	*Name	6635
4112	dnsmessage	GoString	{}	{string}	*Question	6636
4113	dnsmessage	GoString	{}	{string}	*CNAMEResource	6637
4114	dnsmessage	GoString	{}	{string}	*MXResource	6638
4115	dnsmessage	GoString	{}	{string}	*NSResource	6639
4116	dnsmessage	GoString	{}	{string}	*PTRResource	6640
4117	dnsmessage	GoString	{}	{string}	*SOAResource	6641
4118	dnsmessage	GoString	{}	{string}	*TXTResource	6642
4119	dnsmessage	GoString	{}	{string}	*SRVResource	6643
4120	dnsmessage	GoString	{}	{string}	*AResource	6644
4121	dnsmessage	GoString	{}	{string}	*AAAAResource	6645
4122	dnsmessage	GoString	{}	{string}	*OPTResource	6646
4123	dnsmessage	GoString	{}	{string}	*Option	6647
4124	httpproxy	ProxyFunc	{}	{"func(*url.URL) (*url.URL, error)"}	*Config	6648
4125	hpack	WriteField	{hpack.HeaderField}	{error}	*Encoder	6649
4126	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Encoder	6649
4127	hpack	SetMaxDynamicTableSizeLimit	{uint32}	{}	*Encoder	6649
4128	hpack	Error	{}	{string}	DecodingError	6650
4129	hpack	Error	{}	{string}	InvalidIndexError	6651
4130	hpack	IsPseudo	{}	{bool}	HeaderField	6652
4131	hpack	String	{}	{string}	HeaderField	6652
4132	hpack	Size	{}	{uint32}	HeaderField	6652
4133	hpack	SetMaxStringLength	{int}	{}	*Decoder	6653
4134	hpack	SetEmitFunc	{func(hpack.HeaderField)}	{}	*Decoder	6653
4135	hpack	SetEmitEnabled	{bool}	{}	*Decoder	6653
4136	hpack	EmitEnabled	{}	{bool}	*Decoder	6653
4137	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Decoder	6653
4139	hpack	DecodeFull	{[]byte}	{[]hpack.HeaderField,error}	*Decoder	6653
4140	hpack	Close	{}	{error}	*Decoder	6653
4141	hpack	Write	{[]byte}	{int,error}	*Decoder	6653
4142	idna	ToASCII	{string}	{string,error}	*Profile	6655
4143	idna	ToUnicode	{string}	{string,error}	*Profile	6655
4144	idna	String	{}	{string}	*Profile	6655
4145	idna	ToASCII	{string}	{string,error}	*Profile	6655
4146	idna	ToUnicode	{string}	{string,error}	*Profile	6655
4147	idna	String	{}	{string}	*Profile	6655
4148	lif	Family	{}	{int}	*Inet4Addr	6659
4149	lif	Family	{}	{int}	*Inet6Addr	6660
4150	route	Family	{}	{int}	*LinkAddr	6664
4151	route	Family	{}	{int}	*Inet4Addr	6665
4152	route	Family	{}	{int}	*Inet6Addr	6666
4153	route	Family	{}	{int}	*DefaultAddr	6667
4154	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	6668
4155	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	6668
4156	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	6668
4157	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	6668
4158	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	6668
4159	route	Sys	{}	{[]route.Sys}	*InterfaceAddrMessage	6669
4160	route	Sys	{}	{[]route.Sys}	*InterfaceMulticastAddrMessage	6670
4161	route	Sys	{}	{[]route.Sys}	*InterfaceAnnounceMessage	6671
4162	route	Marshal	{}	{[]byte,error}	*RouteMessage	6675
4163	route	Sys	{}	{[]route.Sys}	*RouteMessage	6675
4164	route	Sys	{}	{[]route.Sys}	*RouteMessage	6675
4165	route	Sys	{}	{[]route.Sys}	*RouteMessage	6675
4166	route	Sys	{}	{[]route.Sys}	*RouteMessage	6675
4167	route	Sys	{}	{[]route.Sys}	*RouteMessage	6675
4168	route	SysType	{}	{route.SysType}	*RouteMetrics	6677
4169	route	SysType	{}	{route.SysType}	*RouteMetrics	6677
4170	route	SysType	{}	{route.SysType}	*RouteMetrics	6677
4171	route	SysType	{}	{route.SysType}	*RouteMetrics	6677
4172	route	SysType	{}	{route.SysType}	*RouteMetrics	6677
4173	route	SysType	{}	{route.SysType}	*InterfaceMetrics	6678
4174	route	SysType	{}	{route.SysType}	*InterfaceMetrics	6678
4175	route	SysType	{}	{route.SysType}	*InterfaceMetrics	6678
4176	route	SysType	{}	{route.SysType}	*InterfaceMetrics	6678
4177	route	SysType	{}	{route.SysType}	*InterfaceMetrics	6678
4178	bidirule	Reset	{}	{}	*Transformer	6688
4179	bidirule	Transform	{[]byte,[]byte,bool}	{int,error}	*Transformer	6688
4180	bidirule	Span	{[]byte,bool}	{int,error}	*Transformer	6688
4181	transform	Reset	{}	{}	NopResetter	6691
4182	transform	Read	{[]byte}	{int,error}	*Reader	6692
4183	transform	Write	{[]byte}	{int,error}	*Writer	6693
4184	transform	Close	{}	{error}	*Writer	6693
4185	bidi	SetBytes	{[]byte,...bidi.Option}	{int,error}	*Paragraph	6696
4186	bidi	SetString	{string,...bidi.Option}	{int,error}	*Paragraph	6696
4187	bidi	IsLeftToRight	{}	{bool}	*Paragraph	6696
4188	bidi	Direction	{}	{bidi.Direction}	*Paragraph	6696
4189	bidi	RunAt	{int}	{bidi.Run}	*Paragraph	6696
4190	bidi	Order	{}	{bidi.Ordering,error}	*Paragraph	6696
4191	bidi	Line	{int,int}	{bidi.Ordering,error}	*Paragraph	6696
4192	bidi	Direction	{}	{bidi.Direction}	*Ordering	6697
4193	bidi	NumRuns	{}	{int}	*Ordering	6697
4194	bidi	Run	{int}	{bidi.Run}	*Ordering	6697
4195	bidi	String	{}	{string}	*Run	6698
4196	bidi	Bytes	{}	{[]byte}	*Run	6698
4197	bidi	Direction	{}	{bidi.Direction}	*Run	6698
4198	bidi	Pos	{}	{int}	*Run	6698
4199	bidi	Class	{}	{bidi.Class}	Properties	6699
4200	bidi	IsBracket	{}	{bool}	Properties	6699
4201	bidi	IsOpeningBracket	{}	{bool}	Properties	6699
4202	norm	BoundaryBefore	{}	{bool}	Properties	6701
4203	norm	BoundaryAfter	{}	{bool}	Properties	6701
4204	norm	Decomposition	{}	{[]byte}	Properties	6701
4205	norm	Size	{}	{int}	Properties	6701
4206	norm	CCC	{}	{uint8}	Properties	6701
4207	norm	LeadCCC	{}	{uint8}	Properties	6701
4208	norm	TrailCCC	{}	{uint8}	Properties	6701
4209	norm	Init	{norm.Form,[]byte}	{}	*Iter	6702
4210	norm	InitString	{norm.Form,string}	{}	*Iter	6702
4211	norm	Seek	{int64,int}	{int64,error}	*Iter	6702
4212	norm	Pos	{}	{int}	*Iter	6702
4213	norm	Done	{}	{bool}	*Iter	6702
4214	norm	Next	{}	{[]byte}	*Iter	6702
4215	norm	Properties	{[]byte}	{norm.Properties}	Form	6703
4216	norm	PropertiesString	{string}	{norm.Properties}	Form	6703
4217	norm	Bytes	{[]byte}	{[]byte}	Form	6703
4218	norm	String	{string}	{string}	Form	6703
4219	norm	IsNormal	{[]byte}	{bool}	Form	6703
4220	norm	IsNormalString	{string}	{bool}	Form	6703
4221	norm	Append	{[]byte,...byte}	{[]byte}	Form	6703
4222	norm	AppendString	{[]byte,string}	{[]byte}	Form	6703
4223	norm	QuickSpan	{[]byte}	{int}	Form	6703
4224	norm	Span	{[]byte,bool}	{int,error}	Form	6703
4225	norm	SpanString	{string,bool}	{int,error}	Form	6703
4226	norm	QuickSpanString	{string}	{int}	Form	6703
4227	norm	FirstBoundary	{[]byte}	{int}	Form	6703
4228	norm	FirstBoundaryInString	{string}	{int}	Form	6703
4229	norm	NextBoundary	{[]byte,bool}	{int}	Form	6703
4230	norm	NextBoundaryInString	{string,bool}	{int}	Form	6703
4231	norm	LastBoundary	{[]byte}	{int}	Form	6703
4232	norm	Writer	{io.Writer}	{io.WriteCloser}	Form	6703
4233	norm	Reader	{io.Reader}	{io.Reader}	Form	6703
4234	norm	Reset	{}	{}	Form	6703
4235	norm	Transform	{[]byte,[]byte,bool}	{int,error}	Form	6703
\.


--
-- Data for Name: concrete_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concrete_types (id, package, name, basetype) FROM stdin;
1	tar	Header	struct
2	tar	Format	int
3	tar	Reader	struct
4	tar	Writer	struct
5	zip	Reader	struct
6	zip	ReadCloser	struct
7	zip	File	struct
8	zip	Compressor	func(io.Writer) (io.WriteCloser, error)
9	zip	Decompressor	func(io.Reader) io.ReadCloser
10	zip	FileHeader	struct
11	zip	Writer	struct
12	bufio	Reader	struct
13	bufio	Writer	struct
14	bufio	ReadWriter	struct
15	bufio	Scanner	struct
16	bufio	SplitFunc	func([]byte, bool) (int, []byte, error)
17	builtin	Type	int
18	builtin	Type1	int
19	builtin	IntegerType	int
20	builtin	FloatType	float32
21	builtin	ComplexType	complex64
22	bytes	Buffer	struct
23	bytes	Reader	struct
24	main	Walker	struct
25	dep	Interface	
26	p1	MyInt	int
27	p1	Time	struct
28	p1	S	struct
29	p1	URL	struct
30	p1	EmbedURLPtr	struct
31	p1	S2	struct
32	p1	Namer	
33	p1	I	
34	p1	Public	
35	p1	Private	
36	p1	Error	
37	p1	Codec	struct
38	p1	SI	struct
39	p1	T	struct
40	p1	B	struct
41	p1	TPtrUnexported	struct
42	p1	TPtrExported	struct
43	p1	FuncType	func(int, string) (*p1.B, error)
44	p1	Embedded	struct
45	p1	EmbedSelector	struct
46	p1	ByteStruct	struct
47	p2	Twoer	
48	p3	ThirdBase	struct
49	arch	Arch	struct
50	asm	Parser	struct
51	asm	Patch	struct
52	flags	MultiFlag	[]string
53	lex	Input	struct
54	lex	ScanToken	rune
55	lex	TokenReader	
56	lex	Token	struct
57	lex	Macro	struct
58	lex	Slice	struct
59	lex	Stack	struct
60	lex	Tokenizer	struct
61	main	Package	struct
62	main	File	struct
63	main	Call	struct
64	main	Ref	struct
65	main	Name	struct
66	main	ExpFunc	struct
67	main	TypeRepr	struct
68	main	Type	struct
69	main	FuncType	struct
70	gc	AlgKind	int
71	gc	Ctype	uint8
72	gc	Val	struct
73	gc	NilVal	struct
74	gc	Level	struct
75	gc	EscStep	struct
76	gc	NodeEscState	struct
77	gc	EscState	struct
78	gc	Escape	struct
79	gc	EscLocation	struct
80	gc	EscEdge	struct
81	gc	EscHole	struct
82	gc	FmtFlag	int
83	gc	Class	uint8
84	gc	Arch	struct
85	gc	Progs	struct
86	gc	InitOrder	struct
87	gc	BoolFlag	
88	gc	CountFlag	
89	gc	Mpflt	struct
90	gc	Mpcplx	struct
91	gc	Mpint	struct
92	gc	Order	struct
93	gc	BlockEffects	struct
94	gc	Liveness	struct
95	gc	LivenessMap	struct
96	gc	LivenessIndex	struct
97	gc	Sig	struct
98	gc	GCProg	struct
99	gc	InitEntry	struct
100	gc	InitPlan	struct
101	gc	InitSchedule	struct
102	gc	Branch	struct
103	gc	SSAGenState	struct
104	gc	FloatingEQNEJump	struct
105	gc	Error	struct
106	gc	Dlist	struct
107	gc	Symlink	struct
108	gc	Node	struct
109	gc	Name	struct
110	gc	Param	struct
111	gc	Func	struct
112	gc	Inline	struct
113	gc	Mark	struct
114	gc	ScopeID	int32
115	gc	Op	uint8
116	gc	Nodes	struct
117	gc	NodeSet	map[*gc.Node]struct{}
118	gc	Timings	struct
119	ssa	Block	struct
120	ssa	Edge	struct
121	ssa	BlockKind	int8
122	ssa	BranchPrediction	int8
123	ssa	Cache	struct
124	ssa	Config	struct
125	ssa	Types	struct
126	ssa	Logger	
127	ssa	Frontend	
128	ssa	GCNode	
129	ssa	StorageClass	uint8
130	ssa	SlotID	int32
131	ssa	VarID	int32
132	ssa	FuncDebug	struct
133	ssa	BlockDebug	struct
134	ssa	StackOffset	int32
135	ssa	VarLoc	struct
136	ssa	RegisterSet	uint64
137	ssa	Func	struct
138	main	ArchsByName	[]main.arch
139	main	Rule	struct
140	ssa	HTMLWriter	struct
141	ssa	FuncLines	struct
142	ssa	ByTopo	[]*ssa.FuncLines
143	ssa	ID	int32
144	ssa	Location	
145	ssa	Register	struct
146	ssa	LocalSlot	struct
147	ssa	LocPair	[]ssa.Location
148	ssa	Op	int32
149	ssa	SymEffect	int8
150	ssa	ValAndOff	int64
151	ssa	BoundsKind	uint8
152	ssa	RBTint32	struct
153	ssa	ValHeap	struct
154	ssa	SparseTreeNode	struct
155	ssa	SparseTree	[]ssa.SparseTreeNode
156	ssa	SparseTreeMap	ssa.RBTint32
157	ssa	SparseTreeHelper	struct
158	ssa	Value	struct
159	ssa	ZeroRegion	struct
160	syntax	Node	
161	syntax	File	struct
162	syntax	Decl	
163	syntax	ImportDecl	struct
164	syntax	ConstDecl	struct
165	syntax	TypeDecl	struct
166	syntax	VarDecl	struct
167	syntax	FuncDecl	struct
168	syntax	Group	struct
169	syntax	Expr	
170	syntax	BadExpr	struct
171	syntax	Name	struct
172	syntax	BasicLit	struct
173	syntax	CompositeLit	struct
174	syntax	KeyValueExpr	struct
175	syntax	FuncLit	struct
176	syntax	ParenExpr	struct
177	syntax	SelectorExpr	struct
178	syntax	IndexExpr	struct
179	syntax	SliceExpr	struct
180	syntax	AssertExpr	struct
181	syntax	TypeSwitchGuard	struct
182	syntax	Operation	struct
183	syntax	CallExpr	struct
184	syntax	ListExpr	struct
185	syntax	ArrayType	struct
186	syntax	SliceType	struct
187	syntax	DotsType	struct
188	syntax	StructType	struct
189	syntax	Field	struct
190	syntax	InterfaceType	struct
191	syntax	FuncType	struct
192	syntax	MapType	struct
193	syntax	ChanType	struct
194	syntax	ChanDir	uint
195	syntax	Stmt	
196	syntax	SimpleStmt	
197	syntax	EmptyStmt	struct
198	syntax	LabeledStmt	struct
199	syntax	BlockStmt	struct
200	syntax	ExprStmt	struct
201	syntax	SendStmt	struct
202	syntax	DeclStmt	struct
203	syntax	AssignStmt	struct
204	syntax	BranchStmt	struct
205	syntax	CallStmt	struct
206	syntax	ReturnStmt	struct
207	syntax	IfStmt	struct
208	syntax	ForStmt	struct
209	syntax	SwitchStmt	struct
210	syntax	SelectStmt	struct
211	syntax	RangeClause	struct
212	syntax	CaseClause	struct
213	syntax	CommClause	struct
214	syntax	CommentKind	uint
215	syntax	Comment	struct
216	syntax	Pos	struct
217	syntax	PosBase	struct
218	syntax	Mode	uint
219	syntax	Error	struct
220	syntax	ErrorHandler	func(error)
221	syntax	Pragma	uint16
222	syntax	PragmaHandler	func(syntax.Pos, string) syntax.Pragma
223	syntax	LitKind	uint
224	syntax	Operator	uint
225	types	Pkg	struct
226	types	Sym	struct
227	types	Node	struct
228	types	EType	uint8
229	types	ChanDir	uint8
230	types	Type	struct
231	types	Map	struct
232	types	Forward	struct
233	types	Func	struct
234	types	Struct	struct
235	types	Funarg	uint8
236	types	Interface	struct
237	types	Ptr	struct
238	types	DDDField	struct
239	types	ChanArgs	struct
240	types	FuncArgs	struct
241	types	Chan	struct
242	types	Tuple	struct
243	types	Array	struct
244	types	Slice	struct
245	types	Field	struct
246	types	Fields	struct
247	types	Cmp	int8
248	main	Block	struct
249	main	File	struct
250	main	FuncExtent	struct
251	main	FuncVisitor	struct
252	main	Pkg	struct
253	main	Profile	struct
254	main	ProfileBlock	struct
255	main	Boundary	struct
256	main	Dir	struct
257	main	Dirs	struct
258	main	Package	struct
259	main	PackageError	string
260	nested	Foo	struct
261	pkg	ExportedType	struct
262	pkg	ExportedStructOneField	struct
263	pkg	ExportedInterface	
264	pkg	T2	int
265	pkg	T1	pkg.T2
266	pkg	ExportedFormattedType	struct
267	main	TypeConfig	struct
268	main	Type	struct
269	base	Command	struct
270	base	StringsFlag	[]string
271	cache	ActionID	[]byte
272	cache	OutputID	[]byte
273	cache	Cache	struct
274	cache	Entry	struct
275	cache	Hash	struct
276	cfg	EnvVar	struct
277	cmdflag	Defn	struct
278	dirhash	Hash	func([]string, func(string) (io.ReadCloser, error)) (string, error)
279	generate	Generator	struct
280	get	RepoRoot	struct
281	get	ModuleMode	int
282	get	ImportMismatchError	struct
283	list	Context	struct
284	list	TrackingWriter	struct
285	load	PerPackageFlag	struct
286	load	Package	struct
287	load	PackagePublic	struct
288	load	PackageInternal	struct
289	load	NoGoError	struct
290	load	CoverVar	struct
291	load	PackageError	struct
292	load	ImportStack	[]string
293	load	TargetDir	int
294	load	TestCover	struct
295	filelock	File	
296	lockedfile	File	struct
297	lockedfile	Mutex	struct
298	codehost	Repo	
299	codehost	RevInfo	struct
300	codehost	FileRev	struct
301	codehost	UnknownRevisionError	struct
302	codehost	RunError	struct
303	codehost	VCSError	struct
304	modfetch	Repo	
305	modfetch	RevInfo	struct
306	modfile	Position	struct
307	modfile	Expr	
308	modfile	Comment	struct
309	modfile	Comments	struct
310	modfile	FileSyntax	struct
311	modfile	CommentBlock	struct
312	modfile	Line	struct
313	modfile	LineBlock	struct
314	modfile	LParen	struct
315	modfile	RParen	struct
316	modfile	File	struct
317	modfile	Module	struct
318	modfile	Go	struct
319	modfile	Require	struct
320	modfile	Exclude	struct
321	modfile	Replace	struct
322	modfile	VersionFixer	func(string) (string, error)
323	modfile	Error	struct
324	modinfo	ModulePublic	struct
325	modinfo	ModuleError	struct
326	modload	ImportMissingError	struct
327	modload	QueryResult	struct
328	modload	NoMatchingVersionError	struct
329	modload	PackageNotInModuleError	struct
330	module	Version	struct
331	module	ModuleError	struct
332	module	InvalidVersionError	struct
333	mvs	Reqs	
334	mvs	BuildListError	struct
335	note	Verifier	
336	note	Signer	
337	note	Verifiers	
338	note	UnknownVerifierError	struct
339	note	Note	struct
340	note	Signature	struct
341	note	UnverifiedNoteError	struct
342	note	InvalidSignatureError	struct
343	par	Work	struct
344	par	Cache	struct
345	search	Match	struct
346	sumweb	Client	
347	sumweb	Conn	struct
348	sumweb	Server	
349	sumweb	Handler	struct
350	sumweb	TestServer	struct
351	tlog	Tree	struct
352	tlog	Tile	struct
353	tlog	TileReader	
354	tlog	Hash	[]byte
355	tlog	HashReader	
356	tlog	HashReaderFunc	func([]int64) ([]tlog.Hash, error)
357	tlog	RecordProof	[]tlog.Hash
358	tlog	TreeProof	[]tlog.Hash
359	txtar	Archive	struct
360	txtar	File	struct
361	web	SecurityMode	int
362	web	HTTPError	struct
363	web	Response	struct
364	work	Builder	struct
365	work	Action	struct
366	work	BuildMode	int
367	p	A1	
368	p	B1	
369	p	C1	
370	p	D1	
371	pkg4	T	struct
372	bio	Reader	struct
373	bio	Writer	struct
374	dwarf	Sym	
375	dwarf	Var	struct
376	dwarf	Scope	struct
377	dwarf	Range	struct
378	dwarf	FnState	struct
379	dwarf	InlCalls	struct
380	dwarf	InlCall	struct
381	dwarf	Context	
382	dwarf	DWAttr	struct
383	dwarf	DWDie	struct
384	dwarf	VarsByOffset	[]*dwarf.Var
385	edit	Buffer	struct
386	gcprog	Writer	struct
387	goobj	Sym	struct
388	goobj	SymID	struct
389	goobj	Data	struct
390	goobj	Reloc	struct
391	goobj	Var	struct
392	goobj	Func	struct
393	goobj	FuncData	struct
394	goobj	InlinedCall	struct
395	goobj	Package	struct
396	goobj	NativeReader	struct
397	arm	Optab	struct
398	arm	Opcross	[][][]uint8
399	arm64	Optab	struct
400	obj	InlTree	struct
401	obj	InlinedCall	struct
402	obj	Addr	struct
403	obj	AddrName	int8
404	obj	AddrType	uint8
405	obj	Prog	struct
406	obj	As	int16
407	obj	LSym	struct
408	obj	FuncInfo	struct
409	obj	InlMark	struct
410	obj	ABI	uint8
411	obj	Attribute	uint16
412	obj	Pcln	struct
413	obj	Reloc	struct
414	obj	Auto	struct
415	obj	Pcdata	struct
416	obj	Link	struct
417	obj	LinkArch	struct
418	mips	Optab	struct
419	mips	Dep	struct
420	mips	Sch	struct
421	obj	DwarfFixupTable	struct
422	obj	Plist	struct
423	obj	ProgAlloc	func() *obj.Prog
424	ppc64	Optab	struct
425	s390x	Optab	struct
426	x86	Optab	struct
427	x86	AsmBuf	struct
428	objabi	FuncID	uint8
429	objabi	HeadType	uint8
430	objabi	RelocType	int16
431	objabi	SymKind	uint8
432	objfile	Disasm	struct
433	objfile	CachedFile	struct
434	objfile	FileCache	struct
435	objfile	Liner	
436	objfile	File	struct
437	objfile	Entry	struct
438	objfile	Sym	struct
439	objfile	Reloc	struct
440	objfile	RelocStringer	
441	src	Pos	struct
442	src	PosBase	struct
443	src	PosXlogue	uint
444	src	XPos	struct
445	src	PosTable	struct
446	sys	ArchFamily	byte
447	sys	Arch	struct
448	test2json	Mode	int
449	ld	ArHdr	struct
450	ld	BuildMode	uint8
451	ld	LinkMode	uint8
452	ld	GCProg	struct
453	ld	ElfEhdr	struct
454	ld	ElfShdr	struct
455	ld	ElfPhdr	struct
456	ld	Elfstring	struct
457	ld	Elfaux	struct
458	ld	Elflib	struct
459	ld	Pkg	struct
460	ld	Arch	struct
461	ld	Hostobj	struct
462	ld	SymbolType	int8
463	ld	Shlib	struct
464	ld	Link	struct
465	ld	MachoHdr	struct
466	ld	MachoSect	struct
467	ld	MachoSeg	struct
468	ld	MachoPlatformLoad	struct
469	ld	MachoLoad	struct
470	ld	MachoPlatform	int
471	ld	Rpath	struct
472	ld	OutBuf	struct
473	ld	PCIter	struct
474	ld	IMAGE_IMPORT_DESCRIPTOR	struct
475	ld	IMAGE_EXPORT_DIRECTORY	struct
476	ld	Imp	struct
477	ld	Dll	struct
478	a	FuncReturningInt	func() int
479	ld	XcoffFileHdr64	struct
480	ld	XcoffAoutHdr64	struct
481	ld	XcoffScnHdr64	struct
482	ld	XcoffSymEnt64	struct
483	ld	XcoffAuxFile64	struct
484	ld	XcoffAuxFcn64	struct
485	ld	XcoffAuxCSect64	struct
486	ld	XcoffAuxDWARF64	struct
487	ld	XcoffLdHdr64	struct
488	ld	XcoffLdSym64	struct
489	ld	XcoffLdImportFile64	struct
490	ld	XcoffLdRel64	struct
491	ld	XcoffLdStr64	struct
492	loadelf	ElfHdrBytes	struct
493	loadelf	ElfSectBytes	struct
494	loadelf	ElfProgBytes	struct
495	loadelf	ElfSymBytes	struct
496	loadelf	ElfHdrBytes64	struct
497	loadelf	ElfSectBytes64	struct
498	loadelf	ElfProgBytes64	struct
499	loadelf	ElfSymBytes64	struct
500	loadelf	ElfSect	struct
501	loadelf	ElfObj	struct
502	loadelf	ElfSym	struct
503	sym	Attribute	int32
504	sym	Library	struct
505	sym	Reloc	struct
506	sym	RelocVariant	uint8
507	sym	RelocByOff	[]sym.Reloc
508	sym	Segment	struct
509	sym	Section	struct
510	sym	Symbol	struct
511	sym	AuxSymbol	struct
512	sym	FuncInfo	struct
513	sym	InlinedCall	struct
514	sym	Pcdata	struct
515	sym	Auto	struct
516	sym	Symbols	struct
517	sym	SymKind	uint8
518	main	Archive	struct
519	main	Entry	struct
520	main	FileLike	
521	main	Record	struct
522	main	Range	struct
523	main	ViewerData	struct
524	main	ViewerEvent	struct
525	main	ViewerFrame	struct
526	main	NameArg	struct
527	main	TaskArg	struct
528	main	RegionArg	struct
529	main	SortIndexArg	struct
530	main	Arg	struct
531	main	Arg	struct
532	driver	HTTPServerArgs	plugin.HTTPServerArgs
533	driver	Options	struct
534	driver	Writer	
535	driver	FlagSet	
536	driver	Fetcher	
537	driver	Symbolizer	
538	driver	MappingSources	map[string][]
539	driver	ObjTool	
540	driver	Inst	struct
541	driver	ObjFile	
542	driver	Frame	struct
543	driver	Sym	struct
544	driver	UI	
545	binutils	Binutils	struct
546	driver	PostProcessor	func(io.Reader, io.Writer, plugin.UI) error
547	driver	GoFlags	struct
548	graph	DotAttributes	struct
549	graph	DotNodeAttributes	struct
550	graph	DotConfig	struct
551	graph	Graph	struct
552	graph	Options	struct
553	graph	Nodes	[]*graph.Node
554	graph	Node	struct
555	graph	NodeInfo	struct
556	graph	NodeMap	map[graph.NodeInfo]*graph.Node
557	graph	NodeSet	map[graph.NodeInfo]bool
558	graph	NodePtrSet	map[*graph.Node]bool
559	graph	EdgeMap	map[*graph.Node]*graph.Edge
560	graph	Edge	struct
561	graph	Tag	struct
562	graph	TagMap	map[string]*graph.Tag
563	graph	NodeOrder	int
564	plugin	Options	struct
565	plugin	Writer	
566	plugin	FlagSet	
567	plugin	Fetcher	
568	plugin	Symbolizer	
569	plugin	MappingSources	map[string][]
570	plugin	ObjTool	
571	plugin	Inst	struct
572	plugin	ObjFile	
573	plugin	Frame	struct
574	plugin	Sym	struct
575	plugin	UI	
576	plugin	HTTPServerArgs	struct
577	report	Options	struct
578	report	TextItem	struct
579	report	Report	struct
580	symbolizer	Symbolizer	struct
581	profile	TagMatch	func(*profile.Sample) bool
582	profile	Profile	struct
583	profile	ValueType	struct
584	profile	Sample	struct
585	profile	Mapping	struct
586	profile	Location	struct
587	profile	Line	struct
588	profile	Function	struct
589	demangle	AST	
590	demangle	Name	struct
591	demangle	Typed	struct
592	demangle	Qualified	struct
593	demangle	Template	struct
594	demangle	TemplateParam	struct
595	demangle	Qualifiers	[]string
596	demangle	TypeWithQualifiers	struct
597	demangle	MethodWithQualifiers	struct
598	demangle	BuiltinType	struct
599	demangle	PointerType	struct
600	demangle	ReferenceType	struct
601	demangle	RvalueReferenceType	struct
602	demangle	ComplexType	struct
603	demangle	ImaginaryType	struct
604	demangle	VendorQualifier	struct
605	demangle	ArrayType	struct
606	demangle	FunctionType	struct
607	demangle	FunctionParam	struct
608	demangle	PtrMem	struct
609	demangle	FixedType	struct
610	demangle	VectorType	struct
611	demangle	Decltype	struct
612	demangle	Operator	struct
613	demangle	Constructor	struct
614	demangle	Destructor	struct
615	demangle	GlobalCDtor	struct
616	demangle	TaggedName	struct
617	demangle	PackExpansion	struct
618	demangle	ArgumentPack	struct
619	demangle	SizeofPack	struct
620	demangle	SizeofArgs	struct
621	demangle	Cast	struct
622	demangle	Nullary	struct
623	demangle	Unary	struct
624	demangle	Binary	struct
625	demangle	Trinary	struct
626	demangle	Fold	struct
627	demangle	New	struct
628	demangle	Literal	struct
629	demangle	ExprList	struct
630	demangle	InitializerList	struct
631	demangle	DefaultArg	struct
632	demangle	Closure	struct
633	demangle	UnnamedType	struct
634	demangle	Clone	struct
635	demangle	Special	struct
636	demangle	Special2	struct
637	demangle	Option	int
638	armasm	Mode	int
639	armasm	Op	uint16
640	armasm	Inst	struct
641	armasm	Args	[]armasm.Arg
642	armasm	Arg	
643	armasm	Float32Imm	float32
644	armasm	Float64Imm	float32
645	armasm	Imm	uint32
646	armasm	ImmAlt	struct
647	armasm	Label	uint32
648	armasm	Reg	uint8
649	armasm	RegX	struct
650	armasm	RegList	uint16
651	armasm	Endian	uint8
652	armasm	Shift	uint8
653	armasm	RegShift	struct
654	armasm	RegShiftReg	struct
655	armasm	PCRel	int32
656	armasm	AddrMode	uint8
657	armasm	Mem	struct
658	arm64asm	Sys	uint8
659	arm64asm	Op	uint16
660	arm64asm	Inst	struct
661	arm64asm	Args	[]arm64asm.Arg
662	arm64asm	Arg	
663	arm64asm	Reg	uint16
664	arm64asm	RegSP	arm64asm.Reg
665	arm64asm	ImmShift	struct
666	arm64asm	ExtShift	uint8
667	arm64asm	RegExtshiftAmount	struct
668	arm64asm	PCRel	int64
669	arm64asm	AddrMode	uint8
670	arm64asm	MemImmediate	struct
671	arm64asm	MemExtend	struct
672	arm64asm	Imm	struct
673	arm64asm	Imm64	struct
674	arm64asm	Imm_hint	uint8
675	arm64asm	Imm_clrex	uint8
676	arm64asm	Imm_dcps	uint16
677	arm64asm	Cond	struct
678	arm64asm	Imm_c	uint8
679	arm64asm	Imm_option	uint8
680	arm64asm	Imm_prfop	uint8
681	arm64asm	Pstatefield	uint8
682	arm64asm	Systemreg	struct
683	arm64asm	Imm_fp	struct
684	arm64asm	Arrangement	uint8
685	arm64asm	RegisterWithArrangement	struct
686	arm64asm	RegisterWithArrangementAndIndex	struct
687	ppc64asm	ArgType	int8
688	ppc64asm	BitField	struct
689	ppc64asm	BitFields	[]ppc64asm.BitField
690	ppc64asm	Inst	struct
691	ppc64asm	Op	uint16
692	ppc64asm	Arg	
693	ppc64asm	Args	[]ppc64asm.Arg
694	ppc64asm	Reg	uint16
695	ppc64asm	CondReg	int8
696	ppc64asm	SpReg	uint16
697	ppc64asm	PCRel	int32
698	ppc64asm	Label	uint32
699	ppc64asm	Imm	int32
700	ppc64asm	Offset	int32
701	x86asm	Inst	struct
702	x86asm	Prefixes	[]x86asm.Prefix
703	x86asm	Prefix	uint16
704	x86asm	Op	uint32
705	x86asm	Args	[]x86asm.Arg
706	x86asm	Arg	
707	x86asm	Reg	uint8
708	x86asm	Mem	struct
709	x86asm	Rel	int32
710	x86asm	Imm	int64
711	x86asm	SymLookup	func(uint64) (string, uint64)
712	terminal	EscapeCodes	struct
713	terminal	Terminal	struct
714	terminal	State	struct
715	terminal	State	struct
716	terminal	State	struct
717	terminal	State	struct
718	unix	CPUSet	[]unix.cpuMask
719	unix	Signal	syscall.Signal
720	unix	Errno	syscall.Errno
721	unix	SysProcAttr	syscall.SysProcAttr
722	unix	SocketControlMessage	struct
723	unix	WaitStatus	uint32
724	unix	WaitStatus	uint32
725	unix	SockaddrDatalink	struct
726	unix	SockaddrDatalink	struct
727	unix	SockaddrDatalink	struct
728	unix	WaitStatus	uint32
729	unix	SockaddrLinklayer	struct
730	unix	SockaddrNetlink	struct
731	unix	SockaddrHCI	struct
732	unix	SockaddrL2	struct
733	unix	SockaddrRFCOMM	struct
734	unix	SockaddrCAN	struct
735	unix	SockaddrALG	struct
736	unix	SockaddrVM	struct
737	unix	SockaddrXDP	struct
738	unix	SockaddrPPPoE	struct
739	unix	FileHandle	struct
740	unix	SockaddrDatalink	struct
741	unix	SockaddrDatalink	struct
742	unix	SockaddrDatalink	struct
743	unix	WaitStatus	uint32
744	unix	Sockaddr	
745	unix	SockaddrInet4	struct
746	unix	SockaddrInet6	struct
747	unix	SockaddrUnix	struct
748	unix	PtraceRegs386	struct
749	unix	PtraceRegsAmd64	struct
750	unix	PtraceRegsArm	struct
751	unix	PtraceRegsArm64	struct
752	unix	PtraceRegsMips	struct
753	unix	PtraceRegsMips64	struct
754	unix	PtraceRegsMipsle	struct
755	unix	PtraceRegsMips64le	struct
756	unix	Mode_t	uint32
757	unix	Timespec	struct
758	unix	StTimespec	struct
759	unix	Timeval	struct
760	unix	Timeval32	struct
761	unix	Timex	struct
762	unix	Time_t	int32
763	unix	Tms	struct
764	unix	Utimbuf	struct
765	unix	Timezone	struct
766	unix	Rusage	struct
767	unix	Rlimit	struct
768	unix	Pid_t	int32
769	unix	Stat_t	struct
770	unix	StatxTimestamp	struct
771	unix	Statx_t	struct
772	unix	Dirent	struct
773	unix	RawSockaddrInet4	struct
774	unix	RawSockaddrInet6	struct
775	unix	RawSockaddrUnix	struct
776	unix	RawSockaddr	struct
777	unix	RawSockaddrAny	struct
778	unix	Cmsghdr	struct
779	unix	ICMPv6Filter	struct
780	unix	Iovec	struct
781	unix	IPMreq	struct
782	unix	IPv6Mreq	struct
783	unix	IPv6MTUInfo	struct
784	unix	Linger	struct
785	unix	Msghdr	struct
786	unix	IfMsgHdr	struct
787	unix	FdSet	struct
788	unix	Utsname	struct
789	unix	Ustat_t	struct
790	unix	Sigset_t	struct
791	unix	Termios	struct
792	unix	Termio	struct
793	unix	Winsize	struct
794	unix	PollFd	struct
795	unix	Flock_t	struct
796	unix	Fsid_t	struct
797	unix	Fsid64_t	struct
798	unix	Statfs_t	struct
799	unix	Mode_t	uint32
800	unix	Timespec	struct
801	unix	StTimespec	struct
802	unix	Timeval	struct
803	unix	Timeval32	struct
804	unix	Timex	struct
805	unix	Time_t	int64
806	unix	Tms	struct
807	unix	Utimbuf	struct
808	unix	Timezone	struct
809	unix	Rusage	struct
810	unix	Rlimit	struct
811	unix	Pid_t	int32
812	unix	Stat_t	struct
813	unix	StatxTimestamp	struct
814	unix	Statx_t	struct
815	unix	Dirent	struct
816	unix	RawSockaddrInet4	struct
817	unix	RawSockaddrInet6	struct
818	unix	RawSockaddrUnix	struct
819	unix	RawSockaddr	struct
820	unix	RawSockaddrAny	struct
821	unix	Cmsghdr	struct
822	unix	ICMPv6Filter	struct
823	unix	Iovec	struct
824	unix	IPMreq	struct
825	unix	IPv6Mreq	struct
826	unix	IPv6MTUInfo	struct
827	unix	Linger	struct
828	unix	Msghdr	struct
829	unix	IfMsgHdr	struct
830	unix	FdSet	struct
831	unix	Utsname	struct
832	unix	Ustat_t	struct
833	unix	Sigset_t	struct
834	unix	Termios	struct
835	unix	Termio	struct
836	unix	Winsize	struct
837	unix	PollFd	struct
838	unix	Flock_t	struct
839	unix	Fsid_t	struct
840	unix	Fsid64_t	struct
841	unix	Statfs_t	struct
842	unix	Timespec	struct
843	unix	Timeval	struct
844	unix	Timeval32	struct
845	unix	Rusage	struct
846	unix	Rlimit	struct
847	unix	Stat_t	struct
848	unix	Statfs_t	struct
849	unix	Flock_t	struct
850	unix	Fstore_t	struct
851	unix	Radvisory_t	struct
852	unix	Fbootstraptransfer_t	struct
853	unix	Log2phys_t	struct
854	unix	Fsid	struct
855	unix	Dirent	struct
856	unix	RawSockaddrInet4	struct
857	unix	RawSockaddrInet6	struct
858	unix	RawSockaddrUnix	struct
859	unix	RawSockaddrDatalink	struct
860	unix	RawSockaddr	struct
861	unix	RawSockaddrAny	struct
862	unix	Linger	struct
863	unix	Iovec	struct
864	unix	IPMreq	struct
865	unix	IPv6Mreq	struct
866	unix	Msghdr	struct
867	unix	Cmsghdr	struct
868	unix	Inet4Pktinfo	struct
869	unix	Inet6Pktinfo	struct
870	unix	IPv6MTUInfo	struct
871	unix	ICMPv6Filter	struct
872	unix	Kevent_t	struct
873	unix	FdSet	struct
874	unix	IfMsghdr	struct
875	unix	IfData	struct
876	unix	IfaMsghdr	struct
877	unix	IfmaMsghdr	struct
878	unix	IfmaMsghdr2	struct
879	unix	RtMsghdr	struct
880	unix	RtMetrics	struct
881	unix	BpfVersion	struct
882	unix	BpfStat	struct
883	unix	BpfProgram	struct
884	unix	BpfInsn	struct
885	unix	BpfHdr	struct
886	unix	Termios	struct
887	unix	Winsize	struct
888	unix	PollFd	struct
889	unix	Utsname	struct
890	unix	Clockinfo	struct
891	unix	Timespec	struct
892	unix	Timeval	struct
893	unix	Timeval32	struct
894	unix	Rusage	struct
895	unix	Rlimit	struct
896	unix	Stat_t	struct
897	unix	Statfs_t	struct
898	unix	Flock_t	struct
899	unix	Fstore_t	struct
900	unix	Radvisory_t	struct
901	unix	Fbootstraptransfer_t	struct
902	unix	Log2phys_t	struct
903	unix	Fsid	struct
904	unix	Dirent	struct
905	unix	RawSockaddrInet4	struct
906	unix	RawSockaddrInet6	struct
907	unix	RawSockaddrUnix	struct
908	unix	RawSockaddrDatalink	struct
909	unix	RawSockaddr	struct
910	unix	RawSockaddrAny	struct
911	unix	Linger	struct
912	unix	Iovec	struct
913	unix	IPMreq	struct
914	unix	IPv6Mreq	struct
915	unix	Msghdr	struct
916	unix	Cmsghdr	struct
917	unix	Inet4Pktinfo	struct
918	unix	Inet6Pktinfo	struct
919	unix	IPv6MTUInfo	struct
920	unix	ICMPv6Filter	struct
921	unix	Kevent_t	struct
922	unix	FdSet	struct
923	unix	IfMsghdr	struct
924	unix	IfData	struct
925	unix	IfaMsghdr	struct
926	unix	IfmaMsghdr	struct
927	unix	IfmaMsghdr2	struct
928	unix	RtMsghdr	struct
929	unix	RtMetrics	struct
930	unix	BpfVersion	struct
931	unix	BpfStat	struct
932	unix	BpfProgram	struct
933	unix	BpfInsn	struct
934	unix	BpfHdr	struct
935	unix	Termios	struct
936	unix	Winsize	struct
937	unix	PollFd	struct
938	unix	Utsname	struct
939	unix	Clockinfo	struct
940	unix	Timespec	struct
941	unix	Timeval	struct
942	unix	Timeval32	[]byte
943	unix	Rusage	struct
944	unix	Rlimit	struct
945	unix	Stat_t	struct
946	unix	Statfs_t	struct
947	unix	Flock_t	struct
948	unix	Fstore_t	struct
949	unix	Radvisory_t	struct
950	unix	Fbootstraptransfer_t	struct
951	unix	Log2phys_t	struct
952	unix	Fsid	struct
953	unix	Dirent	struct
954	unix	RawSockaddrInet4	struct
955	unix	RawSockaddrInet6	struct
956	unix	RawSockaddrUnix	struct
957	unix	RawSockaddrDatalink	struct
958	unix	RawSockaddr	struct
959	unix	RawSockaddrAny	struct
960	unix	Linger	struct
961	unix	Iovec	struct
962	unix	IPMreq	struct
963	unix	IPv6Mreq	struct
964	unix	Msghdr	struct
965	unix	Cmsghdr	struct
966	unix	Inet4Pktinfo	struct
967	unix	Inet6Pktinfo	struct
968	unix	IPv6MTUInfo	struct
969	unix	ICMPv6Filter	struct
970	unix	Kevent_t	struct
971	unix	FdSet	struct
972	unix	IfMsghdr	struct
973	unix	IfData	struct
974	unix	IfaMsghdr	struct
975	unix	IfmaMsghdr	struct
976	unix	IfmaMsghdr2	struct
977	unix	RtMsghdr	struct
978	unix	RtMetrics	struct
979	unix	BpfVersion	struct
980	unix	BpfStat	struct
981	unix	BpfProgram	struct
982	unix	BpfInsn	struct
983	unix	BpfHdr	struct
984	unix	Termios	struct
985	unix	Winsize	struct
986	unix	PollFd	struct
987	unix	Utsname	struct
988	unix	Clockinfo	struct
989	unix	Timespec	struct
990	unix	Timeval	struct
991	unix	Timeval32	struct
992	unix	Rusage	struct
993	unix	Rlimit	struct
994	unix	Stat_t	struct
995	unix	Statfs_t	struct
996	unix	Flock_t	struct
997	unix	Fstore_t	struct
998	unix	Radvisory_t	struct
999	unix	Fbootstraptransfer_t	struct
1000	unix	Log2phys_t	struct
1001	unix	Fsid	struct
1002	unix	Dirent	struct
1003	unix	RawSockaddrInet4	struct
1004	unix	RawSockaddrInet6	struct
1005	unix	RawSockaddrUnix	struct
1006	unix	RawSockaddrDatalink	struct
1007	unix	RawSockaddr	struct
1008	unix	RawSockaddrAny	struct
1009	unix	Linger	struct
1010	unix	Iovec	struct
1011	unix	IPMreq	struct
1012	unix	IPv6Mreq	struct
1013	unix	Msghdr	struct
1014	unix	Cmsghdr	struct
1015	unix	Inet4Pktinfo	struct
1016	unix	Inet6Pktinfo	struct
1017	unix	IPv6MTUInfo	struct
1018	unix	ICMPv6Filter	struct
1019	unix	Kevent_t	struct
1020	unix	FdSet	struct
1021	unix	IfMsghdr	struct
1022	unix	IfData	struct
1023	unix	IfaMsghdr	struct
1024	unix	IfmaMsghdr	struct
1025	unix	IfmaMsghdr2	struct
1026	unix	RtMsghdr	struct
1027	unix	RtMetrics	struct
1028	unix	BpfVersion	struct
1029	unix	BpfStat	struct
1030	unix	BpfProgram	struct
1031	unix	BpfInsn	struct
1032	unix	BpfHdr	struct
1033	unix	Termios	struct
1034	unix	Winsize	struct
1035	unix	PollFd	struct
1036	unix	Utsname	struct
1037	unix	Clockinfo	struct
1038	unix	Timespec	struct
1039	unix	Timeval	struct
1040	unix	Rusage	struct
1041	unix	Rlimit	struct
1042	unix	Stat_t	struct
1043	unix	Statfs_t	struct
1044	unix	Flock_t	struct
1045	unix	Dirent	struct
1046	unix	Fsid	struct
1047	unix	RawSockaddrInet4	struct
1048	unix	RawSockaddrInet6	struct
1049	unix	RawSockaddrUnix	struct
1050	unix	RawSockaddrDatalink	struct
1051	unix	RawSockaddr	struct
1052	unix	RawSockaddrAny	struct
1053	unix	Linger	struct
1054	unix	Iovec	struct
1055	unix	IPMreq	struct
1056	unix	IPv6Mreq	struct
1057	unix	Msghdr	struct
1058	unix	Cmsghdr	struct
1059	unix	Inet6Pktinfo	struct
1060	unix	IPv6MTUInfo	struct
1061	unix	ICMPv6Filter	struct
1062	unix	Kevent_t	struct
1063	unix	FdSet	struct
1064	unix	IfMsghdr	struct
1065	unix	IfData	struct
1066	unix	IfaMsghdr	struct
1067	unix	IfmaMsghdr	struct
1068	unix	IfAnnounceMsghdr	struct
1069	unix	RtMsghdr	struct
1070	unix	RtMetrics	struct
1071	unix	BpfVersion	struct
1072	unix	BpfStat	struct
1073	unix	BpfProgram	struct
1074	unix	BpfInsn	struct
1075	unix	BpfHdr	struct
1076	unix	Termios	struct
1077	unix	Winsize	struct
1078	unix	PollFd	struct
1079	unix	Utsname	struct
1080	unix	Timespec	struct
1081	unix	Timeval	struct
1082	unix	Rusage	struct
1083	unix	Rlimit	struct
1084	unix	Stat_t	struct
1085	unix	Statfs_t	struct
1086	unix	Flock_t	struct
1087	unix	Dirent	struct
1088	unix	Fsid	struct
1089	unix	RawSockaddrInet4	struct
1090	unix	RawSockaddrInet6	struct
1091	unix	RawSockaddrUnix	struct
1092	unix	RawSockaddrDatalink	struct
1093	unix	RawSockaddr	struct
1094	unix	RawSockaddrAny	struct
1095	unix	Linger	struct
1096	unix	Iovec	struct
1097	unix	IPMreq	struct
1098	unix	IPMreqn	struct
1099	unix	IPv6Mreq	struct
1100	unix	Msghdr	struct
1101	unix	Cmsghdr	struct
1102	unix	Inet6Pktinfo	struct
1103	unix	IPv6MTUInfo	struct
1104	unix	ICMPv6Filter	struct
1105	unix	Kevent_t	struct
1106	unix	FdSet	struct
1107	unix	IfMsghdr	struct
1108	unix	IfData	struct
1109	unix	IfaMsghdr	struct
1110	unix	IfmaMsghdr	struct
1111	unix	IfAnnounceMsghdr	struct
1112	unix	RtMsghdr	struct
1113	unix	RtMetrics	struct
1114	unix	BpfVersion	struct
1115	unix	BpfStat	struct
1116	unix	BpfZbuf	struct
1117	unix	BpfProgram	struct
1118	unix	BpfInsn	struct
1119	unix	BpfHdr	struct
1120	unix	BpfZbufHeader	struct
1121	unix	Termios	struct
1122	unix	Winsize	struct
1123	unix	PollFd	struct
1124	unix	CapRights	struct
1125	unix	Utsname	struct
1126	unix	Timespec	struct
1127	unix	Timeval	struct
1128	unix	Rusage	struct
1129	unix	Rlimit	struct
1130	unix	Stat_t	struct
1131	unix	Statfs_t	struct
1132	unix	Flock_t	struct
1133	unix	Dirent	struct
1134	unix	Fsid	struct
1135	unix	RawSockaddrInet4	struct
1136	unix	RawSockaddrInet6	struct
1137	unix	RawSockaddrUnix	struct
1138	unix	RawSockaddrDatalink	struct
1139	unix	RawSockaddr	struct
1140	unix	RawSockaddrAny	struct
1141	unix	Linger	struct
1142	unix	Iovec	struct
1143	unix	IPMreq	struct
1144	unix	IPMreqn	struct
1145	unix	IPv6Mreq	struct
1146	unix	Msghdr	struct
1147	unix	Cmsghdr	struct
1148	unix	Inet6Pktinfo	struct
1149	unix	IPv6MTUInfo	struct
1150	unix	ICMPv6Filter	struct
1151	unix	Kevent_t	struct
1152	unix	FdSet	struct
1153	unix	IfMsghdr	struct
1154	unix	IfData	struct
1155	unix	IfaMsghdr	struct
1156	unix	IfmaMsghdr	struct
1157	unix	IfAnnounceMsghdr	struct
1158	unix	RtMsghdr	struct
1159	unix	RtMetrics	struct
1160	unix	BpfVersion	struct
1161	unix	BpfStat	struct
1162	unix	BpfZbuf	struct
1163	unix	BpfProgram	struct
1164	unix	BpfInsn	struct
1165	unix	BpfHdr	struct
1166	unix	BpfZbufHeader	struct
1167	unix	Termios	struct
1168	unix	Winsize	struct
1169	unix	PollFd	struct
1170	unix	CapRights	struct
1171	unix	Utsname	struct
1172	unix	Timespec	struct
1173	unix	Timeval	struct
1174	unix	Rusage	struct
1175	unix	Rlimit	struct
1176	unix	Stat_t	struct
1177	unix	Statfs_t	struct
1178	unix	Flock_t	struct
1179	unix	Dirent	struct
1180	unix	Fsid	struct
1181	unix	RawSockaddrInet4	struct
1182	unix	RawSockaddrInet6	struct
1183	unix	RawSockaddrUnix	struct
1184	unix	RawSockaddrDatalink	struct
1185	unix	RawSockaddr	struct
1186	unix	RawSockaddrAny	struct
1187	unix	Linger	struct
1188	unix	Iovec	struct
1189	unix	IPMreq	struct
1190	unix	IPMreqn	struct
1191	unix	IPv6Mreq	struct
1192	unix	Msghdr	struct
1193	unix	Cmsghdr	struct
1194	unix	Inet6Pktinfo	struct
1195	unix	IPv6MTUInfo	struct
1196	unix	ICMPv6Filter	struct
1197	unix	Kevent_t	struct
1198	unix	FdSet	struct
1199	unix	IfMsghdr	struct
1200	unix	IfData	struct
1201	unix	IfaMsghdr	struct
1202	unix	IfmaMsghdr	struct
1203	unix	IfAnnounceMsghdr	struct
1204	unix	RtMsghdr	struct
1205	unix	RtMetrics	struct
1206	unix	BpfVersion	struct
1207	unix	BpfStat	struct
1208	unix	BpfZbuf	struct
1209	unix	BpfProgram	struct
1210	unix	BpfInsn	struct
1211	unix	BpfHdr	struct
1212	unix	BpfZbufHeader	struct
1213	unix	Termios	struct
1214	unix	Winsize	struct
1215	unix	PollFd	struct
1216	unix	CapRights	struct
1217	unix	Utsname	struct
1218	unix	Timespec	struct
1219	unix	Timeval	struct
1220	unix	Rusage	struct
1221	unix	Rlimit	struct
1222	unix	Stat_t	struct
1223	unix	Statfs_t	struct
1224	unix	Flock_t	struct
1225	unix	Dirent	struct
1226	unix	Fsid	struct
1227	unix	RawSockaddrInet4	struct
1228	unix	RawSockaddrInet6	struct
1229	unix	RawSockaddrUnix	struct
1230	unix	RawSockaddrDatalink	struct
1231	unix	RawSockaddr	struct
1232	unix	RawSockaddrAny	struct
1233	unix	Linger	struct
1234	unix	Iovec	struct
1235	unix	IPMreq	struct
1236	unix	IPMreqn	struct
1237	unix	IPv6Mreq	struct
1238	unix	Msghdr	struct
1239	unix	Cmsghdr	struct
1240	unix	Inet6Pktinfo	struct
1241	unix	IPv6MTUInfo	struct
1242	unix	ICMPv6Filter	struct
1243	unix	Kevent_t	struct
1244	unix	FdSet	struct
1245	unix	IfMsghdr	struct
1246	unix	IfData	struct
1247	unix	IfaMsghdr	struct
1248	unix	IfmaMsghdr	struct
1249	unix	IfAnnounceMsghdr	struct
1250	unix	RtMsghdr	struct
1251	unix	RtMetrics	struct
1252	unix	BpfVersion	struct
1253	unix	BpfStat	struct
1254	unix	BpfZbuf	struct
1255	unix	BpfProgram	struct
1256	unix	BpfInsn	struct
1257	unix	BpfHdr	struct
1258	unix	BpfZbufHeader	struct
1259	unix	Termios	struct
1260	unix	Winsize	struct
1261	unix	PollFd	struct
1262	unix	CapRights	struct
1263	unix	Utsname	struct
1264	unix	Timespec	struct
1265	unix	Timeval	struct
1266	unix	Timex	struct
1267	unix	Time_t	int32
1268	unix	Tms	struct
1269	unix	Utimbuf	struct
1270	unix	Rusage	struct
1271	unix	Rlimit	struct
1272	unix	Stat_t	struct
1273	unix	StatxTimestamp	struct
1274	unix	Statx_t	struct
1275	unix	Dirent	struct
1276	unix	Fsid	struct
1277	unix	Flock_t	struct
1278	unix	FscryptPolicy	struct
1279	unix	FscryptKey	struct
1280	unix	KeyctlDHParams	struct
1281	unix	RawSockaddrInet4	struct
1282	unix	RawSockaddrInet6	struct
1283	unix	RawSockaddrUnix	struct
1284	unix	RawSockaddrLinklayer	struct
1285	unix	RawSockaddrNetlink	struct
1286	unix	RawSockaddrHCI	struct
1287	unix	RawSockaddrL2	struct
1288	unix	RawSockaddrRFCOMM	struct
1289	unix	RawSockaddrCAN	struct
1290	unix	RawSockaddrALG	struct
1291	unix	RawSockaddrVM	struct
1292	unix	RawSockaddrXDP	struct
1293	unix	RawSockaddrPPPoX	[]byte
1294	unix	RawSockaddr	struct
1295	unix	RawSockaddrAny	struct
1296	unix	Linger	struct
1297	unix	Iovec	struct
1298	unix	IPMreq	struct
1299	unix	IPMreqn	struct
1300	unix	IPv6Mreq	struct
1301	unix	PacketMreq	struct
1302	unix	Msghdr	struct
1303	unix	Cmsghdr	struct
1304	unix	Inet4Pktinfo	struct
1305	unix	Inet6Pktinfo	struct
1306	unix	IPv6MTUInfo	struct
1307	unix	ICMPv6Filter	struct
1308	unix	Ucred	struct
1309	unix	TCPInfo	struct
1310	unix	CanFilter	struct
1311	unix	NlMsghdr	struct
1312	unix	NlMsgerr	struct
1313	unix	RtGenmsg	struct
1314	unix	NlAttr	struct
1315	unix	RtAttr	struct
1316	unix	IfInfomsg	struct
1317	unix	IfAddrmsg	struct
1318	unix	RtMsg	struct
1319	unix	RtNexthop	struct
1320	unix	NdUseroptmsg	struct
1321	unix	NdMsg	struct
1322	unix	SockFilter	struct
1323	unix	SockFprog	struct
1324	unix	InotifyEvent	struct
1325	unix	PtraceRegs	struct
1326	unix	FdSet	struct
1327	unix	Sysinfo_t	struct
1328	unix	Utsname	struct
1329	unix	Ustat_t	struct
1330	unix	EpollEvent	struct
1331	unix	PollFd	struct
1332	unix	Sigset_t	struct
1333	unix	SignalfdSiginfo	struct
1334	unix	Termios	struct
1335	unix	Winsize	struct
1336	unix	Taskstats	struct
1337	unix	CGroupStats	struct
1338	unix	Genlmsghdr	struct
1339	unix	PerfEventAttr	struct
1340	unix	PerfEventMmapPage	struct
1341	unix	SockaddrStorage	struct
1342	unix	TCPMD5Sig	struct
1343	unix	HDDriveCmdHdr	struct
1344	unix	HDGeometry	struct
1345	unix	HDDriveID	struct
1346	unix	Statfs_t	struct
1347	unix	TpacketHdr	struct
1348	unix	Tpacket2Hdr	struct
1349	unix	Tpacket3Hdr	struct
1350	unix	TpacketHdrVariant1	struct
1351	unix	TpacketBlockDesc	struct
1352	unix	TpacketBDTS	struct
1353	unix	TpacketHdrV1	struct
1354	unix	TpacketReq	struct
1355	unix	TpacketReq3	struct
1356	unix	TpacketStats	struct
1357	unix	TpacketStatsV3	struct
1358	unix	TpacketAuxdata	struct
1359	unix	Nfgenmsg	struct
1360	unix	RTCTime	struct
1361	unix	RTCWkAlrm	struct
1362	unix	RTCPLLInfo	struct
1363	unix	BlkpgIoctlArg	struct
1364	unix	BlkpgPartition	struct
1365	unix	XDPRingOffset	struct
1366	unix	XDPMmapOffsets	struct
1367	unix	XDPUmemReg	struct
1368	unix	XDPStatistics	struct
1369	unix	XDPDesc	struct
1370	unix	ScmTimestamping	struct
1371	unix	SockExtendedErr	struct
1372	unix	FanotifyEventMetadata	struct
1373	unix	FanotifyResponse	struct
1374	unix	CryptoUserAlg	struct
1375	unix	CryptoStatAEAD	struct
1376	unix	CryptoStatAKCipher	struct
1377	unix	CryptoStatCipher	struct
1378	unix	CryptoStatCompress	struct
1379	unix	CryptoStatHash	struct
1380	unix	CryptoStatKPP	struct
1381	unix	CryptoStatRNG	struct
1382	unix	CryptoStatLarval	struct
1383	unix	CryptoReportLarval	struct
1384	unix	CryptoReportHash	struct
1385	unix	CryptoReportCipher	struct
1386	unix	CryptoReportBlkCipher	struct
1387	unix	CryptoReportAEAD	struct
1388	unix	CryptoReportComp	struct
1389	unix	CryptoReportRNG	struct
1390	unix	CryptoReportAKCipher	struct
1391	unix	CryptoReportKPP	struct
1392	unix	CryptoReportAcomp	struct
1393	unix	Timespec	struct
1394	unix	Timeval	struct
1395	unix	Timex	struct
1396	unix	Time_t	int64
1397	unix	Tms	struct
1398	unix	Utimbuf	struct
1399	unix	Rusage	struct
1400	unix	Rlimit	struct
1401	unix	Stat_t	struct
1402	unix	StatxTimestamp	struct
1403	unix	Statx_t	struct
1404	unix	Dirent	struct
1405	unix	Fsid	struct
1406	unix	Flock_t	struct
1407	unix	FscryptPolicy	struct
1408	unix	FscryptKey	struct
1409	unix	KeyctlDHParams	struct
1410	unix	RawSockaddrInet4	struct
1411	unix	RawSockaddrInet6	struct
1412	unix	RawSockaddrUnix	struct
1413	unix	RawSockaddrLinklayer	struct
1414	unix	RawSockaddrNetlink	struct
1415	unix	RawSockaddrHCI	struct
1416	unix	RawSockaddrL2	struct
1417	unix	RawSockaddrRFCOMM	struct
1418	unix	RawSockaddrCAN	struct
1419	unix	RawSockaddrALG	struct
1420	unix	RawSockaddrVM	struct
1421	unix	RawSockaddrXDP	struct
1422	unix	RawSockaddrPPPoX	[]byte
1423	unix	RawSockaddr	struct
1424	unix	RawSockaddrAny	struct
1425	unix	Linger	struct
1426	unix	Iovec	struct
1427	unix	IPMreq	struct
1428	unix	IPMreqn	struct
1429	unix	IPv6Mreq	struct
1430	unix	PacketMreq	struct
1431	unix	Msghdr	struct
1432	unix	Cmsghdr	struct
1433	unix	Inet4Pktinfo	struct
1434	unix	Inet6Pktinfo	struct
1435	unix	IPv6MTUInfo	struct
1436	unix	ICMPv6Filter	struct
1437	unix	Ucred	struct
1438	unix	TCPInfo	struct
1439	unix	CanFilter	struct
1440	unix	NlMsghdr	struct
1441	unix	NlMsgerr	struct
1442	unix	RtGenmsg	struct
1443	unix	NlAttr	struct
1444	unix	RtAttr	struct
1445	unix	IfInfomsg	struct
1446	unix	IfAddrmsg	struct
1447	unix	RtMsg	struct
1448	unix	RtNexthop	struct
1449	unix	NdUseroptmsg	struct
1450	unix	NdMsg	struct
1451	unix	SockFilter	struct
1452	unix	SockFprog	struct
1453	unix	InotifyEvent	struct
1454	unix	PtraceRegs	struct
1455	unix	FdSet	struct
1456	unix	Sysinfo_t	struct
1457	unix	Utsname	struct
1458	unix	Ustat_t	struct
1459	unix	EpollEvent	struct
1460	unix	PollFd	struct
1461	unix	Sigset_t	struct
1462	unix	SignalfdSiginfo	struct
1463	unix	Termios	struct
1464	unix	Winsize	struct
1465	unix	Taskstats	struct
1466	unix	CGroupStats	struct
1467	unix	Genlmsghdr	struct
1468	unix	PerfEventAttr	struct
1469	unix	PerfEventMmapPage	struct
1470	unix	SockaddrStorage	struct
1471	unix	TCPMD5Sig	struct
1472	unix	HDDriveCmdHdr	struct
1473	unix	HDGeometry	struct
1474	unix	HDDriveID	struct
1475	unix	Statfs_t	struct
1476	unix	TpacketHdr	struct
1477	unix	Tpacket2Hdr	struct
1478	unix	Tpacket3Hdr	struct
1479	unix	TpacketHdrVariant1	struct
1480	unix	TpacketBlockDesc	struct
1481	unix	TpacketBDTS	struct
1482	unix	TpacketHdrV1	struct
1483	unix	TpacketReq	struct
1484	unix	TpacketReq3	struct
1485	unix	TpacketStats	struct
1486	unix	TpacketStatsV3	struct
1487	unix	TpacketAuxdata	struct
1488	unix	Nfgenmsg	struct
1489	unix	RTCTime	struct
1490	unix	RTCWkAlrm	struct
1491	unix	RTCPLLInfo	struct
1492	unix	BlkpgIoctlArg	struct
1493	unix	BlkpgPartition	struct
1494	unix	XDPRingOffset	struct
1495	unix	XDPMmapOffsets	struct
1496	unix	XDPUmemReg	struct
1497	unix	XDPStatistics	struct
1498	unix	XDPDesc	struct
1499	unix	ScmTimestamping	struct
1500	unix	SockExtendedErr	struct
1501	unix	FanotifyEventMetadata	struct
1502	unix	FanotifyResponse	struct
1503	unix	CryptoUserAlg	struct
1504	unix	CryptoStatAEAD	struct
1505	unix	CryptoStatAKCipher	struct
1506	unix	CryptoStatCipher	struct
1507	unix	CryptoStatCompress	struct
1508	unix	CryptoStatHash	struct
1509	unix	CryptoStatKPP	struct
1510	unix	CryptoStatRNG	struct
1511	unix	CryptoStatLarval	struct
1512	unix	CryptoReportLarval	struct
1513	unix	CryptoReportHash	struct
1514	unix	CryptoReportCipher	struct
1515	unix	CryptoReportBlkCipher	struct
1516	unix	CryptoReportAEAD	struct
1517	unix	CryptoReportComp	struct
1518	unix	CryptoReportRNG	struct
1519	unix	CryptoReportAKCipher	struct
1520	unix	CryptoReportKPP	struct
1521	unix	CryptoReportAcomp	struct
1522	unix	Timespec	struct
1523	unix	Timeval	struct
1524	unix	Timex	struct
1525	unix	Time_t	int32
1526	unix	Tms	struct
1527	unix	Utimbuf	struct
1528	unix	Rusage	struct
1529	unix	Rlimit	struct
1530	unix	Stat_t	struct
1531	unix	StatxTimestamp	struct
1532	unix	Statx_t	struct
1533	unix	Dirent	struct
1534	unix	Fsid	struct
1535	unix	Flock_t	struct
1536	unix	FscryptPolicy	struct
1537	unix	FscryptKey	struct
1538	unix	KeyctlDHParams	struct
1539	unix	RawSockaddrInet4	struct
1540	unix	RawSockaddrInet6	struct
1541	unix	RawSockaddrUnix	struct
1542	unix	RawSockaddrLinklayer	struct
1543	unix	RawSockaddrNetlink	struct
1544	unix	RawSockaddrHCI	struct
1545	unix	RawSockaddrL2	struct
1546	unix	RawSockaddrRFCOMM	struct
1547	unix	RawSockaddrCAN	struct
1548	unix	RawSockaddrALG	struct
1549	unix	RawSockaddrVM	struct
1550	unix	RawSockaddrXDP	struct
1551	unix	RawSockaddrPPPoX	[]byte
1552	unix	RawSockaddr	struct
1553	unix	RawSockaddrAny	struct
1554	unix	Linger	struct
1555	unix	Iovec	struct
1556	unix	IPMreq	struct
1557	unix	IPMreqn	struct
1558	unix	IPv6Mreq	struct
1559	unix	PacketMreq	struct
1560	unix	Msghdr	struct
1561	unix	Cmsghdr	struct
1562	unix	Inet4Pktinfo	struct
1563	unix	Inet6Pktinfo	struct
1564	unix	IPv6MTUInfo	struct
1565	unix	ICMPv6Filter	struct
1566	unix	Ucred	struct
1567	unix	TCPInfo	struct
1568	unix	CanFilter	struct
1569	unix	NlMsghdr	struct
1570	unix	NlMsgerr	struct
1571	unix	RtGenmsg	struct
1572	unix	NlAttr	struct
1573	unix	RtAttr	struct
1574	unix	IfInfomsg	struct
1575	unix	IfAddrmsg	struct
1576	unix	RtMsg	struct
1577	unix	RtNexthop	struct
1578	unix	NdUseroptmsg	struct
1579	unix	NdMsg	struct
1580	unix	SockFilter	struct
1581	unix	SockFprog	struct
1582	unix	InotifyEvent	struct
1583	unix	PtraceRegs	struct
1584	unix	FdSet	struct
1585	unix	Sysinfo_t	struct
1586	unix	Utsname	struct
1587	unix	Ustat_t	struct
1588	unix	EpollEvent	struct
1589	unix	PollFd	struct
1590	unix	Sigset_t	struct
1591	unix	SignalfdSiginfo	struct
1592	unix	Termios	struct
1593	unix	Winsize	struct
1594	unix	Taskstats	struct
1595	unix	CGroupStats	struct
1596	unix	Genlmsghdr	struct
1597	unix	PerfEventAttr	struct
1598	unix	PerfEventMmapPage	struct
1599	unix	SockaddrStorage	struct
1600	unix	TCPMD5Sig	struct
1601	unix	HDDriveCmdHdr	struct
1602	unix	HDGeometry	struct
1603	unix	HDDriveID	struct
1604	unix	Statfs_t	struct
1605	unix	TpacketHdr	struct
1606	unix	Tpacket2Hdr	struct
1607	unix	Tpacket3Hdr	struct
1608	unix	TpacketHdrVariant1	struct
1609	unix	TpacketBlockDesc	struct
1610	unix	TpacketBDTS	struct
1611	unix	TpacketHdrV1	struct
1612	unix	TpacketReq	struct
1613	unix	TpacketReq3	struct
1614	unix	TpacketStats	struct
1615	unix	TpacketStatsV3	struct
1616	unix	TpacketAuxdata	struct
1617	unix	Nfgenmsg	struct
1618	unix	RTCTime	struct
1619	unix	RTCWkAlrm	struct
1620	unix	RTCPLLInfo	struct
1621	unix	BlkpgIoctlArg	struct
1622	unix	BlkpgPartition	struct
1623	unix	XDPRingOffset	struct
1624	unix	XDPMmapOffsets	struct
1625	unix	XDPUmemReg	struct
1626	unix	XDPStatistics	struct
1627	unix	XDPDesc	struct
1628	unix	ScmTimestamping	struct
1629	unix	SockExtendedErr	struct
1630	unix	FanotifyEventMetadata	struct
1631	unix	FanotifyResponse	struct
1632	unix	CryptoUserAlg	struct
1633	unix	CryptoStatAEAD	struct
1634	unix	CryptoStatAKCipher	struct
1635	unix	CryptoStatCipher	struct
1636	unix	CryptoStatCompress	struct
1637	unix	CryptoStatHash	struct
1638	unix	CryptoStatKPP	struct
1639	unix	CryptoStatRNG	struct
1640	unix	CryptoStatLarval	struct
1641	unix	CryptoReportLarval	struct
1642	unix	CryptoReportHash	struct
1643	unix	CryptoReportCipher	struct
1644	unix	CryptoReportBlkCipher	struct
1645	unix	CryptoReportAEAD	struct
1646	unix	CryptoReportComp	struct
1647	unix	CryptoReportRNG	struct
1648	unix	CryptoReportAKCipher	struct
1649	unix	CryptoReportKPP	struct
1650	unix	CryptoReportAcomp	struct
1651	unix	Timespec	struct
1652	unix	Timeval	struct
1653	unix	Timex	struct
1654	unix	Time_t	int64
1655	unix	Tms	struct
1656	unix	Utimbuf	struct
1657	unix	Rusage	struct
1658	unix	Rlimit	struct
1659	unix	Stat_t	struct
1660	unix	StatxTimestamp	struct
1661	unix	Statx_t	struct
1662	unix	Dirent	struct
1663	unix	Fsid	struct
1664	unix	Flock_t	struct
1665	unix	FscryptPolicy	struct
1666	unix	FscryptKey	struct
1667	unix	KeyctlDHParams	struct
1668	unix	RawSockaddrInet4	struct
1669	unix	RawSockaddrInet6	struct
1670	unix	RawSockaddrUnix	struct
1671	unix	RawSockaddrLinklayer	struct
1672	unix	RawSockaddrNetlink	struct
1673	unix	RawSockaddrHCI	struct
1674	unix	RawSockaddrL2	struct
1675	unix	RawSockaddrRFCOMM	struct
1676	unix	RawSockaddrCAN	struct
1677	unix	RawSockaddrALG	struct
1678	unix	RawSockaddrVM	struct
1679	unix	RawSockaddrXDP	struct
1680	unix	RawSockaddrPPPoX	[]byte
1681	unix	RawSockaddr	struct
1682	unix	RawSockaddrAny	struct
1683	unix	Linger	struct
1684	unix	Iovec	struct
1685	unix	IPMreq	struct
1686	unix	IPMreqn	struct
1687	unix	IPv6Mreq	struct
1688	unix	PacketMreq	struct
1689	unix	Msghdr	struct
1690	unix	Cmsghdr	struct
1691	unix	Inet4Pktinfo	struct
1692	unix	Inet6Pktinfo	struct
1693	unix	IPv6MTUInfo	struct
1694	unix	ICMPv6Filter	struct
1695	unix	Ucred	struct
1696	unix	TCPInfo	struct
1697	unix	CanFilter	struct
1698	unix	NlMsghdr	struct
1699	unix	NlMsgerr	struct
1700	unix	RtGenmsg	struct
1701	unix	NlAttr	struct
1702	unix	RtAttr	struct
1703	unix	IfInfomsg	struct
1704	unix	IfAddrmsg	struct
1705	unix	RtMsg	struct
1706	unix	RtNexthop	struct
1707	unix	NdUseroptmsg	struct
1708	unix	NdMsg	struct
1709	unix	SockFilter	struct
1710	unix	SockFprog	struct
1711	unix	InotifyEvent	struct
1712	unix	PtraceRegs	struct
1713	unix	FdSet	struct
1714	unix	Sysinfo_t	struct
1715	unix	Utsname	struct
1716	unix	Ustat_t	struct
1717	unix	EpollEvent	struct
1718	unix	PollFd	struct
1719	unix	Sigset_t	struct
1720	unix	SignalfdSiginfo	struct
1721	unix	Termios	struct
1722	unix	Winsize	struct
1723	unix	Taskstats	struct
1724	unix	CGroupStats	struct
1725	unix	Genlmsghdr	struct
1726	unix	PerfEventAttr	struct
1727	unix	PerfEventMmapPage	struct
1728	unix	SockaddrStorage	struct
1729	unix	TCPMD5Sig	struct
1730	unix	HDDriveCmdHdr	struct
1731	unix	HDGeometry	struct
1732	unix	HDDriveID	struct
1733	unix	Statfs_t	struct
1734	unix	TpacketHdr	struct
1735	unix	Tpacket2Hdr	struct
1736	unix	Tpacket3Hdr	struct
1737	unix	TpacketHdrVariant1	struct
1738	unix	TpacketBlockDesc	struct
1739	unix	TpacketBDTS	struct
1740	unix	TpacketHdrV1	struct
1741	unix	TpacketReq	struct
1742	unix	TpacketReq3	struct
1743	unix	TpacketStats	struct
1744	unix	TpacketStatsV3	struct
1745	unix	TpacketAuxdata	struct
1746	unix	Nfgenmsg	struct
1747	unix	RTCTime	struct
1748	unix	RTCWkAlrm	struct
1749	unix	RTCPLLInfo	struct
1750	unix	BlkpgIoctlArg	struct
1751	unix	BlkpgPartition	struct
1752	unix	XDPRingOffset	struct
1753	unix	XDPMmapOffsets	struct
1754	unix	XDPUmemReg	struct
1755	unix	XDPStatistics	struct
1756	unix	XDPDesc	struct
1757	unix	ScmTimestamping	struct
1758	unix	SockExtendedErr	struct
1759	unix	FanotifyEventMetadata	struct
1760	unix	FanotifyResponse	struct
1761	unix	CryptoUserAlg	struct
1762	unix	CryptoStatAEAD	struct
1763	unix	CryptoStatAKCipher	struct
1764	unix	CryptoStatCipher	struct
1765	unix	CryptoStatCompress	struct
1766	unix	CryptoStatHash	struct
1767	unix	CryptoStatKPP	struct
1768	unix	CryptoStatRNG	struct
1769	unix	CryptoStatLarval	struct
1770	unix	CryptoReportLarval	struct
1771	unix	CryptoReportHash	struct
1772	unix	CryptoReportCipher	struct
1773	unix	CryptoReportBlkCipher	struct
1774	unix	CryptoReportAEAD	struct
1775	unix	CryptoReportComp	struct
1776	unix	CryptoReportRNG	struct
1777	unix	CryptoReportAKCipher	struct
1778	unix	CryptoReportKPP	struct
1779	unix	CryptoReportAcomp	struct
1780	unix	Timespec	struct
1781	unix	Timeval	struct
1782	unix	Timex	struct
1783	unix	Time_t	int32
1784	unix	Tms	struct
1785	unix	Utimbuf	struct
1786	unix	Rusage	struct
1787	unix	Rlimit	struct
1788	unix	Stat_t	struct
1789	unix	StatxTimestamp	struct
1790	unix	Statx_t	struct
1791	unix	Dirent	struct
1792	unix	Fsid	struct
1793	unix	Flock_t	struct
1794	unix	FscryptPolicy	struct
1795	unix	FscryptKey	struct
1796	unix	KeyctlDHParams	struct
1797	unix	RawSockaddrInet4	struct
1798	unix	RawSockaddrInet6	struct
1799	unix	RawSockaddrUnix	struct
1800	unix	RawSockaddrLinklayer	struct
1801	unix	RawSockaddrNetlink	struct
1802	unix	RawSockaddrHCI	struct
1803	unix	RawSockaddrL2	struct
1804	unix	RawSockaddrRFCOMM	struct
1805	unix	RawSockaddrCAN	struct
1806	unix	RawSockaddrALG	struct
1807	unix	RawSockaddrVM	struct
1808	unix	RawSockaddrXDP	struct
1809	unix	RawSockaddrPPPoX	[]byte
1810	unix	RawSockaddr	struct
1811	unix	RawSockaddrAny	struct
1812	unix	Linger	struct
1813	unix	Iovec	struct
1814	unix	IPMreq	struct
1815	unix	IPMreqn	struct
1816	unix	IPv6Mreq	struct
1817	unix	PacketMreq	struct
1818	unix	Msghdr	struct
1819	unix	Cmsghdr	struct
1820	unix	Inet4Pktinfo	struct
1821	unix	Inet6Pktinfo	struct
1822	unix	IPv6MTUInfo	struct
1823	unix	ICMPv6Filter	struct
1824	unix	Ucred	struct
1825	unix	TCPInfo	struct
1826	unix	CanFilter	struct
1827	unix	NlMsghdr	struct
1828	unix	NlMsgerr	struct
1829	unix	RtGenmsg	struct
1830	unix	NlAttr	struct
1831	unix	RtAttr	struct
1832	unix	IfInfomsg	struct
1833	unix	IfAddrmsg	struct
1834	unix	RtMsg	struct
1835	unix	RtNexthop	struct
1836	unix	NdUseroptmsg	struct
1837	unix	NdMsg	struct
1838	unix	SockFilter	struct
1839	unix	SockFprog	struct
1840	unix	InotifyEvent	struct
1841	unix	PtraceRegs	struct
1842	unix	FdSet	struct
1843	unix	Sysinfo_t	struct
1844	unix	Utsname	struct
1845	unix	Ustat_t	struct
1846	unix	EpollEvent	struct
1847	unix	PollFd	struct
1848	unix	Sigset_t	struct
1849	unix	SignalfdSiginfo	struct
1850	unix	Termios	struct
1851	unix	Winsize	struct
1852	unix	Taskstats	struct
1853	unix	CGroupStats	struct
1854	unix	Genlmsghdr	struct
1855	unix	PerfEventAttr	struct
1856	unix	PerfEventMmapPage	struct
1857	unix	SockaddrStorage	struct
1858	unix	TCPMD5Sig	struct
1859	unix	HDDriveCmdHdr	struct
1860	unix	HDGeometry	struct
1861	unix	HDDriveID	struct
1862	unix	Statfs_t	struct
1863	unix	TpacketHdr	struct
1864	unix	Tpacket2Hdr	struct
1865	unix	Tpacket3Hdr	struct
1866	unix	TpacketHdrVariant1	struct
1867	unix	TpacketBlockDesc	struct
1868	unix	TpacketBDTS	struct
1869	unix	TpacketHdrV1	struct
1870	unix	TpacketReq	struct
1871	unix	TpacketReq3	struct
1872	unix	TpacketStats	struct
1873	unix	TpacketStatsV3	struct
1874	unix	TpacketAuxdata	struct
1875	unix	Nfgenmsg	struct
1876	unix	RTCTime	struct
1877	unix	RTCWkAlrm	struct
1878	unix	RTCPLLInfo	struct
1879	unix	BlkpgIoctlArg	struct
1880	unix	BlkpgPartition	struct
1881	unix	XDPRingOffset	struct
1882	unix	XDPMmapOffsets	struct
1883	unix	XDPUmemReg	struct
1884	unix	XDPStatistics	struct
1885	unix	XDPDesc	struct
1886	unix	ScmTimestamping	struct
1887	unix	SockExtendedErr	struct
1888	unix	FanotifyEventMetadata	struct
1889	unix	FanotifyResponse	struct
1890	unix	CryptoUserAlg	struct
1891	unix	CryptoStatAEAD	struct
1892	unix	CryptoStatAKCipher	struct
1893	unix	CryptoStatCipher	struct
1894	unix	CryptoStatCompress	struct
1895	unix	CryptoStatHash	struct
1896	unix	CryptoStatKPP	struct
1897	unix	CryptoStatRNG	struct
1898	unix	CryptoStatLarval	struct
1899	unix	CryptoReportLarval	struct
1900	unix	CryptoReportHash	struct
1901	unix	CryptoReportCipher	struct
1902	unix	CryptoReportBlkCipher	struct
1903	unix	CryptoReportAEAD	struct
1904	unix	CryptoReportComp	struct
1905	unix	CryptoReportRNG	struct
1906	unix	CryptoReportAKCipher	struct
1907	unix	CryptoReportKPP	struct
1908	unix	CryptoReportAcomp	struct
1909	unix	Timespec	struct
1910	unix	Timeval	struct
1911	unix	Timex	struct
1912	unix	Time_t	int64
1913	unix	Tms	struct
1914	unix	Utimbuf	struct
1915	unix	Rusage	struct
1916	unix	Rlimit	struct
1917	unix	Stat_t	struct
1918	unix	StatxTimestamp	struct
1919	unix	Statx_t	struct
1920	unix	Dirent	struct
1921	unix	Fsid	struct
1922	unix	Flock_t	struct
1923	unix	FscryptPolicy	struct
1924	unix	FscryptKey	struct
1925	unix	KeyctlDHParams	struct
1926	unix	RawSockaddrInet4	struct
1927	unix	RawSockaddrInet6	struct
1928	unix	RawSockaddrUnix	struct
1929	unix	RawSockaddrLinklayer	struct
1930	unix	RawSockaddrNetlink	struct
1931	unix	RawSockaddrHCI	struct
1932	unix	RawSockaddrL2	struct
1933	unix	RawSockaddrRFCOMM	struct
1934	unix	RawSockaddrCAN	struct
1935	unix	RawSockaddrALG	struct
1936	unix	RawSockaddrVM	struct
1937	unix	RawSockaddrXDP	struct
1938	unix	RawSockaddrPPPoX	[]byte
1939	unix	RawSockaddr	struct
1940	unix	RawSockaddrAny	struct
1941	unix	Linger	struct
1942	unix	Iovec	struct
1943	unix	IPMreq	struct
1944	unix	IPMreqn	struct
1945	unix	IPv6Mreq	struct
1946	unix	PacketMreq	struct
1947	unix	Msghdr	struct
1948	unix	Cmsghdr	struct
1949	unix	Inet4Pktinfo	struct
1950	unix	Inet6Pktinfo	struct
1951	unix	IPv6MTUInfo	struct
1952	unix	ICMPv6Filter	struct
1953	unix	Ucred	struct
1954	unix	TCPInfo	struct
1955	unix	CanFilter	struct
1956	unix	NlMsghdr	struct
1957	unix	NlMsgerr	struct
1958	unix	RtGenmsg	struct
1959	unix	NlAttr	struct
1960	unix	RtAttr	struct
1961	unix	IfInfomsg	struct
1962	unix	IfAddrmsg	struct
1963	unix	RtMsg	struct
1964	unix	RtNexthop	struct
1965	unix	NdUseroptmsg	struct
1966	unix	NdMsg	struct
1967	unix	SockFilter	struct
1968	unix	SockFprog	struct
1969	unix	InotifyEvent	struct
1970	unix	PtraceRegs	struct
1971	unix	FdSet	struct
1972	unix	Sysinfo_t	struct
1973	unix	Utsname	struct
1974	unix	Ustat_t	struct
1975	unix	EpollEvent	struct
1976	unix	PollFd	struct
1977	unix	Sigset_t	struct
1978	unix	SignalfdSiginfo	struct
1979	unix	Termios	struct
1980	unix	Winsize	struct
1981	unix	Taskstats	struct
1982	unix	CGroupStats	struct
1983	unix	Genlmsghdr	struct
1984	unix	PerfEventAttr	struct
1985	unix	PerfEventMmapPage	struct
1986	unix	SockaddrStorage	struct
1987	unix	TCPMD5Sig	struct
1988	unix	HDDriveCmdHdr	struct
1989	unix	HDGeometry	struct
1990	unix	HDDriveID	struct
1991	unix	Statfs_t	struct
1992	unix	TpacketHdr	struct
1993	unix	Tpacket2Hdr	struct
1994	unix	Tpacket3Hdr	struct
1995	unix	TpacketHdrVariant1	struct
1996	unix	TpacketBlockDesc	struct
1997	unix	TpacketBDTS	struct
1998	unix	TpacketHdrV1	struct
1999	unix	TpacketReq	struct
2000	unix	TpacketReq3	struct
2001	unix	TpacketStats	struct
2002	unix	TpacketStatsV3	struct
2003	unix	TpacketAuxdata	struct
2004	unix	Nfgenmsg	struct
2005	unix	RTCTime	struct
2006	unix	RTCWkAlrm	struct
2007	unix	RTCPLLInfo	struct
2008	unix	BlkpgIoctlArg	struct
2009	unix	BlkpgPartition	struct
2010	unix	XDPRingOffset	struct
2011	unix	XDPMmapOffsets	struct
2012	unix	XDPUmemReg	struct
2013	unix	XDPStatistics	struct
2014	unix	XDPDesc	struct
2015	unix	ScmTimestamping	struct
2016	unix	SockExtendedErr	struct
2017	unix	FanotifyEventMetadata	struct
2018	unix	FanotifyResponse	struct
2019	unix	CryptoUserAlg	struct
2020	unix	CryptoStatAEAD	struct
2021	unix	CryptoStatAKCipher	struct
2022	unix	CryptoStatCipher	struct
2023	unix	CryptoStatCompress	struct
2024	unix	CryptoStatHash	struct
2025	unix	CryptoStatKPP	struct
2026	unix	CryptoStatRNG	struct
2027	unix	CryptoStatLarval	struct
2028	unix	CryptoReportLarval	struct
2029	unix	CryptoReportHash	struct
2030	unix	CryptoReportCipher	struct
2031	unix	CryptoReportBlkCipher	struct
2032	unix	CryptoReportAEAD	struct
2033	unix	CryptoReportComp	struct
2034	unix	CryptoReportRNG	struct
2035	unix	CryptoReportAKCipher	struct
2036	unix	CryptoReportKPP	struct
2037	unix	CryptoReportAcomp	struct
2038	unix	Timespec	struct
2039	unix	Timeval	struct
2040	unix	Timex	struct
2041	unix	Time_t	int64
2042	unix	Tms	struct
2043	unix	Utimbuf	struct
2044	unix	Rusage	struct
2045	unix	Rlimit	struct
2046	unix	Stat_t	struct
2047	unix	StatxTimestamp	struct
2048	unix	Statx_t	struct
2049	unix	Dirent	struct
2050	unix	Fsid	struct
2051	unix	Flock_t	struct
2052	unix	FscryptPolicy	struct
2053	unix	FscryptKey	struct
2054	unix	KeyctlDHParams	struct
2055	unix	RawSockaddrInet4	struct
2056	unix	RawSockaddrInet6	struct
2057	unix	RawSockaddrUnix	struct
2058	unix	RawSockaddrLinklayer	struct
2059	unix	RawSockaddrNetlink	struct
2060	unix	RawSockaddrHCI	struct
2061	unix	RawSockaddrL2	struct
2062	unix	RawSockaddrRFCOMM	struct
2063	unix	RawSockaddrCAN	struct
2064	unix	RawSockaddrALG	struct
2065	unix	RawSockaddrVM	struct
2066	unix	RawSockaddrXDP	struct
2067	unix	RawSockaddrPPPoX	[]byte
2068	unix	RawSockaddr	struct
2069	unix	RawSockaddrAny	struct
2070	unix	Linger	struct
2071	unix	Iovec	struct
2072	unix	IPMreq	struct
2073	unix	IPMreqn	struct
2074	unix	IPv6Mreq	struct
2075	unix	PacketMreq	struct
2076	unix	Msghdr	struct
2077	unix	Cmsghdr	struct
2078	unix	Inet4Pktinfo	struct
2079	unix	Inet6Pktinfo	struct
2080	unix	IPv6MTUInfo	struct
2081	unix	ICMPv6Filter	struct
2082	unix	Ucred	struct
2083	unix	TCPInfo	struct
2084	unix	CanFilter	struct
2085	unix	NlMsghdr	struct
2086	unix	NlMsgerr	struct
2087	unix	RtGenmsg	struct
2088	unix	NlAttr	struct
2089	unix	RtAttr	struct
2090	unix	IfInfomsg	struct
2091	unix	IfAddrmsg	struct
2092	unix	RtMsg	struct
2093	unix	RtNexthop	struct
2094	unix	NdUseroptmsg	struct
2095	unix	NdMsg	struct
2096	unix	SockFilter	struct
2097	unix	SockFprog	struct
2098	unix	InotifyEvent	struct
2099	unix	PtraceRegs	struct
2100	unix	FdSet	struct
2101	unix	Sysinfo_t	struct
2102	unix	Utsname	struct
2103	unix	Ustat_t	struct
2104	unix	EpollEvent	struct
2105	unix	PollFd	struct
2106	unix	Sigset_t	struct
2107	unix	SignalfdSiginfo	struct
2108	unix	Termios	struct
2109	unix	Winsize	struct
2110	unix	Taskstats	struct
2111	unix	CGroupStats	struct
2112	unix	Genlmsghdr	struct
2113	unix	PerfEventAttr	struct
2114	unix	PerfEventMmapPage	struct
2115	unix	SockaddrStorage	struct
2116	unix	TCPMD5Sig	struct
2117	unix	HDDriveCmdHdr	struct
2118	unix	HDGeometry	struct
2119	unix	HDDriveID	struct
2120	unix	Statfs_t	struct
2121	unix	TpacketHdr	struct
2122	unix	Tpacket2Hdr	struct
2123	unix	Tpacket3Hdr	struct
2124	unix	TpacketHdrVariant1	struct
2125	unix	TpacketBlockDesc	struct
2126	unix	TpacketBDTS	struct
2127	unix	TpacketHdrV1	struct
2128	unix	TpacketReq	struct
2129	unix	TpacketReq3	struct
2130	unix	TpacketStats	struct
2131	unix	TpacketStatsV3	struct
2132	unix	TpacketAuxdata	struct
2133	unix	Nfgenmsg	struct
2134	unix	RTCTime	struct
2135	unix	RTCWkAlrm	struct
2136	unix	RTCPLLInfo	struct
2137	unix	BlkpgIoctlArg	struct
2138	unix	BlkpgPartition	struct
2139	unix	XDPRingOffset	struct
2140	unix	XDPMmapOffsets	struct
2141	unix	XDPUmemReg	struct
2142	unix	XDPStatistics	struct
2143	unix	XDPDesc	struct
2144	unix	ScmTimestamping	struct
2145	unix	SockExtendedErr	struct
2146	unix	FanotifyEventMetadata	struct
2147	unix	FanotifyResponse	struct
2148	unix	CryptoUserAlg	struct
2149	unix	CryptoStatAEAD	struct
2150	unix	CryptoStatAKCipher	struct
2151	unix	CryptoStatCipher	struct
2152	unix	CryptoStatCompress	struct
2153	unix	CryptoStatHash	struct
2154	unix	CryptoStatKPP	struct
2155	unix	CryptoStatRNG	struct
2156	unix	CryptoStatLarval	struct
2157	unix	CryptoReportLarval	struct
2158	unix	CryptoReportHash	struct
2159	unix	CryptoReportCipher	struct
2160	unix	CryptoReportBlkCipher	struct
2161	unix	CryptoReportAEAD	struct
2162	unix	CryptoReportComp	struct
2163	unix	CryptoReportRNG	struct
2164	unix	CryptoReportAKCipher	struct
2165	unix	CryptoReportKPP	struct
2166	unix	CryptoReportAcomp	struct
2167	unix	Timespec	struct
2168	unix	Timeval	struct
2169	unix	Timex	struct
2170	unix	Time_t	int32
2171	unix	Tms	struct
2172	unix	Utimbuf	struct
2173	unix	Rusage	struct
2174	unix	Rlimit	struct
2175	unix	Stat_t	struct
2176	unix	StatxTimestamp	struct
2177	unix	Statx_t	struct
2178	unix	Dirent	struct
2179	unix	Fsid	struct
2180	unix	Flock_t	struct
2181	unix	FscryptPolicy	struct
2182	unix	FscryptKey	struct
2183	unix	KeyctlDHParams	struct
2184	unix	RawSockaddrInet4	struct
2185	unix	RawSockaddrInet6	struct
2186	unix	RawSockaddrUnix	struct
2187	unix	RawSockaddrLinklayer	struct
2188	unix	RawSockaddrNetlink	struct
2189	unix	RawSockaddrHCI	struct
2190	unix	RawSockaddrL2	struct
2191	unix	RawSockaddrRFCOMM	struct
2192	unix	RawSockaddrCAN	struct
2193	unix	RawSockaddrALG	struct
2194	unix	RawSockaddrVM	struct
2195	unix	RawSockaddrXDP	struct
2196	unix	RawSockaddrPPPoX	[]byte
2197	unix	RawSockaddr	struct
2198	unix	RawSockaddrAny	struct
2199	unix	Linger	struct
2200	unix	Iovec	struct
2201	unix	IPMreq	struct
2202	unix	IPMreqn	struct
2203	unix	IPv6Mreq	struct
2204	unix	PacketMreq	struct
2205	unix	Msghdr	struct
2206	unix	Cmsghdr	struct
2207	unix	Inet4Pktinfo	struct
2208	unix	Inet6Pktinfo	struct
2209	unix	IPv6MTUInfo	struct
2210	unix	ICMPv6Filter	struct
2211	unix	Ucred	struct
2212	unix	TCPInfo	struct
2213	unix	CanFilter	struct
2214	unix	NlMsghdr	struct
2215	unix	NlMsgerr	struct
2216	unix	RtGenmsg	struct
2217	unix	NlAttr	struct
2218	unix	RtAttr	struct
2219	unix	IfInfomsg	struct
2220	unix	IfAddrmsg	struct
2221	unix	RtMsg	struct
2222	unix	RtNexthop	struct
2223	unix	NdUseroptmsg	struct
2224	unix	NdMsg	struct
2225	unix	SockFilter	struct
2226	unix	SockFprog	struct
2227	unix	InotifyEvent	struct
2228	unix	PtraceRegs	struct
2229	unix	FdSet	struct
2230	unix	Sysinfo_t	struct
2231	unix	Utsname	struct
2232	unix	Ustat_t	struct
2233	unix	EpollEvent	struct
2234	unix	PollFd	struct
2235	unix	Sigset_t	struct
2236	unix	SignalfdSiginfo	struct
2237	unix	Termios	struct
2238	unix	Winsize	struct
2239	unix	Taskstats	struct
2240	unix	CGroupStats	struct
2241	unix	Genlmsghdr	struct
2242	unix	PerfEventAttr	struct
2243	unix	PerfEventMmapPage	struct
2244	unix	SockaddrStorage	struct
2245	unix	TCPMD5Sig	struct
2246	unix	HDDriveCmdHdr	struct
2247	unix	HDGeometry	struct
2248	unix	HDDriveID	struct
2249	unix	Statfs_t	struct
2250	unix	TpacketHdr	struct
2251	unix	Tpacket2Hdr	struct
2252	unix	Tpacket3Hdr	struct
2253	unix	TpacketHdrVariant1	struct
2254	unix	TpacketBlockDesc	struct
2255	unix	TpacketBDTS	struct
2256	unix	TpacketHdrV1	struct
2257	unix	TpacketReq	struct
2258	unix	TpacketReq3	struct
2259	unix	TpacketStats	struct
2260	unix	TpacketStatsV3	struct
2261	unix	TpacketAuxdata	struct
2262	unix	Nfgenmsg	struct
2263	unix	RTCTime	struct
2264	unix	RTCWkAlrm	struct
2265	unix	RTCPLLInfo	struct
2266	unix	BlkpgIoctlArg	struct
2267	unix	BlkpgPartition	struct
2268	unix	XDPRingOffset	struct
2269	unix	XDPMmapOffsets	struct
2270	unix	XDPUmemReg	struct
2271	unix	XDPStatistics	struct
2272	unix	XDPDesc	struct
2273	unix	ScmTimestamping	struct
2274	unix	SockExtendedErr	struct
2275	unix	FanotifyEventMetadata	struct
2276	unix	FanotifyResponse	struct
2277	unix	CryptoUserAlg	struct
2278	unix	CryptoStatAEAD	struct
2279	unix	CryptoStatAKCipher	struct
2280	unix	CryptoStatCipher	struct
2281	unix	CryptoStatCompress	struct
2282	unix	CryptoStatHash	struct
2283	unix	CryptoStatKPP	struct
2284	unix	CryptoStatRNG	struct
2285	unix	CryptoStatLarval	struct
2286	unix	CryptoReportLarval	struct
2287	unix	CryptoReportHash	struct
2288	unix	CryptoReportCipher	struct
2289	unix	CryptoReportBlkCipher	struct
2290	unix	CryptoReportAEAD	struct
2291	unix	CryptoReportComp	struct
2292	unix	CryptoReportRNG	struct
2293	unix	CryptoReportAKCipher	struct
2294	unix	CryptoReportKPP	struct
2295	unix	CryptoReportAcomp	struct
2296	unix	Timespec	struct
2297	unix	Timeval	struct
2298	unix	Timex	struct
2299	unix	Time_t	int64
2300	unix	Tms	struct
2301	unix	Utimbuf	struct
2302	unix	Rusage	struct
2303	unix	Rlimit	struct
2304	unix	Stat_t	struct
2305	unix	StatxTimestamp	struct
2306	unix	Statx_t	struct
2307	unix	Dirent	struct
2308	unix	Fsid	struct
2309	unix	Flock_t	struct
2310	unix	FscryptPolicy	struct
2311	unix	FscryptKey	struct
2312	unix	KeyctlDHParams	struct
2313	unix	RawSockaddrInet4	struct
2314	unix	RawSockaddrInet6	struct
2315	unix	RawSockaddrUnix	struct
2316	unix	RawSockaddrLinklayer	struct
2317	unix	RawSockaddrNetlink	struct
2318	unix	RawSockaddrHCI	struct
2319	unix	RawSockaddrL2	struct
2320	unix	RawSockaddrRFCOMM	struct
2321	unix	RawSockaddrCAN	struct
2322	unix	RawSockaddrALG	struct
2323	unix	RawSockaddrVM	struct
2324	unix	RawSockaddrXDP	struct
2325	unix	RawSockaddrPPPoX	[]byte
2326	unix	RawSockaddr	struct
2327	unix	RawSockaddrAny	struct
2328	unix	Linger	struct
2329	unix	Iovec	struct
2330	unix	IPMreq	struct
2331	unix	IPMreqn	struct
2332	unix	IPv6Mreq	struct
2333	unix	PacketMreq	struct
2334	unix	Msghdr	struct
2335	unix	Cmsghdr	struct
2336	unix	Inet4Pktinfo	struct
2337	unix	Inet6Pktinfo	struct
2338	unix	IPv6MTUInfo	struct
2339	unix	ICMPv6Filter	struct
2340	unix	Ucred	struct
2341	unix	TCPInfo	struct
2342	unix	CanFilter	struct
2343	unix	NlMsghdr	struct
2344	unix	NlMsgerr	struct
2345	unix	RtGenmsg	struct
2346	unix	NlAttr	struct
2347	unix	RtAttr	struct
2348	unix	IfInfomsg	struct
2349	unix	IfAddrmsg	struct
2350	unix	RtMsg	struct
2351	unix	RtNexthop	struct
2352	unix	NdUseroptmsg	struct
2353	unix	NdMsg	struct
2354	unix	SockFilter	struct
2355	unix	SockFprog	struct
2356	unix	InotifyEvent	struct
2357	unix	PtraceRegs	struct
2358	unix	FdSet	struct
2359	unix	Sysinfo_t	struct
2360	unix	Utsname	struct
2361	unix	Ustat_t	struct
2362	unix	EpollEvent	struct
2363	unix	PollFd	struct
2364	unix	Sigset_t	struct
2365	unix	SignalfdSiginfo	struct
2366	unix	Termios	struct
2367	unix	Winsize	struct
2368	unix	Taskstats	struct
2369	unix	CGroupStats	struct
2370	unix	Genlmsghdr	struct
2371	unix	PerfEventAttr	struct
2372	unix	PerfEventMmapPage	struct
2373	unix	SockaddrStorage	struct
2374	unix	TCPMD5Sig	struct
2375	unix	HDDriveCmdHdr	struct
2376	unix	HDGeometry	struct
2377	unix	HDDriveID	struct
2378	unix	Statfs_t	struct
2379	unix	TpacketHdr	struct
2380	unix	Tpacket2Hdr	struct
2381	unix	Tpacket3Hdr	struct
2382	unix	TpacketHdrVariant1	struct
2383	unix	TpacketBlockDesc	struct
2384	unix	TpacketBDTS	struct
2385	unix	TpacketHdrV1	struct
2386	unix	TpacketReq	struct
2387	unix	TpacketReq3	struct
2388	unix	TpacketStats	struct
2389	unix	TpacketStatsV3	struct
2390	unix	TpacketAuxdata	struct
2391	unix	Nfgenmsg	struct
2392	unix	RTCTime	struct
2393	unix	RTCWkAlrm	struct
2394	unix	RTCPLLInfo	struct
2395	unix	BlkpgIoctlArg	struct
2396	unix	BlkpgPartition	struct
2397	unix	XDPRingOffset	struct
2398	unix	XDPMmapOffsets	struct
2399	unix	XDPUmemReg	struct
2400	unix	XDPStatistics	struct
2401	unix	XDPDesc	struct
2402	unix	ScmTimestamping	struct
2403	unix	SockExtendedErr	struct
2404	unix	FanotifyEventMetadata	struct
2405	unix	FanotifyResponse	struct
2406	unix	CryptoUserAlg	struct
2407	unix	CryptoStatAEAD	struct
2408	unix	CryptoStatAKCipher	struct
2409	unix	CryptoStatCipher	struct
2410	unix	CryptoStatCompress	struct
2411	unix	CryptoStatHash	struct
2412	unix	CryptoStatKPP	struct
2413	unix	CryptoStatRNG	struct
2414	unix	CryptoStatLarval	struct
2415	unix	CryptoReportLarval	struct
2416	unix	CryptoReportHash	struct
2417	unix	CryptoReportCipher	struct
2418	unix	CryptoReportBlkCipher	struct
2419	unix	CryptoReportAEAD	struct
2420	unix	CryptoReportComp	struct
2421	unix	CryptoReportRNG	struct
2422	unix	CryptoReportAKCipher	struct
2423	unix	CryptoReportKPP	struct
2424	unix	CryptoReportAcomp	struct
2425	unix	Timespec	struct
2426	unix	Timeval	struct
2427	unix	Timex	struct
2428	unix	Time_t	int64
2429	unix	Tms	struct
2430	unix	Utimbuf	struct
2431	unix	Rusage	struct
2432	unix	Rlimit	struct
2433	unix	Stat_t	struct
2434	unix	StatxTimestamp	struct
2435	unix	Statx_t	struct
2436	unix	Dirent	struct
2437	unix	Fsid	struct
2438	unix	Flock_t	struct
2439	unix	FscryptPolicy	struct
2440	unix	FscryptKey	struct
2441	unix	KeyctlDHParams	struct
2442	unix	RawSockaddrInet4	struct
2443	unix	RawSockaddrInet6	struct
2444	unix	RawSockaddrUnix	struct
2445	unix	RawSockaddrLinklayer	struct
2446	unix	RawSockaddrNetlink	struct
2447	unix	RawSockaddrHCI	struct
2448	unix	RawSockaddrL2	struct
2449	unix	RawSockaddrRFCOMM	struct
2450	unix	RawSockaddrCAN	struct
2451	unix	RawSockaddrALG	struct
2452	unix	RawSockaddrVM	struct
2453	unix	RawSockaddrXDP	struct
2454	unix	RawSockaddrPPPoX	[]byte
2455	unix	RawSockaddr	struct
2456	unix	RawSockaddrAny	struct
2457	unix	Linger	struct
2458	unix	Iovec	struct
2459	unix	IPMreq	struct
2460	unix	IPMreqn	struct
2461	unix	IPv6Mreq	struct
2462	unix	PacketMreq	struct
2463	unix	Msghdr	struct
2464	unix	Cmsghdr	struct
2465	unix	Inet4Pktinfo	struct
2466	unix	Inet6Pktinfo	struct
2467	unix	IPv6MTUInfo	struct
2468	unix	ICMPv6Filter	struct
2469	unix	Ucred	struct
2470	unix	TCPInfo	struct
2471	unix	CanFilter	struct
2472	unix	NlMsghdr	struct
2473	unix	NlMsgerr	struct
2474	unix	RtGenmsg	struct
2475	unix	NlAttr	struct
2476	unix	RtAttr	struct
2477	unix	IfInfomsg	struct
2478	unix	IfAddrmsg	struct
2479	unix	RtMsg	struct
2480	unix	RtNexthop	struct
2481	unix	NdUseroptmsg	struct
2482	unix	NdMsg	struct
2483	unix	SockFilter	struct
2484	unix	SockFprog	struct
2485	unix	InotifyEvent	struct
2486	unix	PtraceRegs	struct
2487	unix	FdSet	struct
2488	unix	Sysinfo_t	struct
2489	unix	Utsname	struct
2490	unix	Ustat_t	struct
2491	unix	EpollEvent	struct
2492	unix	PollFd	struct
2493	unix	Sigset_t	struct
2494	unix	SignalfdSiginfo	struct
2495	unix	Termios	struct
2496	unix	Winsize	struct
2497	unix	Taskstats	struct
2498	unix	CGroupStats	struct
2499	unix	Genlmsghdr	struct
2500	unix	PerfEventAttr	struct
2501	unix	PerfEventMmapPage	struct
2502	unix	SockaddrStorage	struct
2503	unix	TCPMD5Sig	struct
2504	unix	HDDriveCmdHdr	struct
2505	unix	HDGeometry	struct
2506	unix	HDDriveID	struct
2507	unix	Statfs_t	struct
2508	unix	TpacketHdr	struct
2509	unix	Tpacket2Hdr	struct
2510	unix	Tpacket3Hdr	struct
2511	unix	TpacketHdrVariant1	struct
2512	unix	TpacketBlockDesc	struct
2513	unix	TpacketBDTS	struct
2514	unix	TpacketHdrV1	struct
2515	unix	TpacketReq	struct
2516	unix	TpacketReq3	struct
2517	unix	TpacketStats	struct
2518	unix	TpacketStatsV3	struct
2519	unix	TpacketAuxdata	struct
2520	unix	Nfgenmsg	struct
2521	unix	RTCTime	struct
2522	unix	RTCWkAlrm	struct
2523	unix	RTCPLLInfo	struct
2524	unix	BlkpgIoctlArg	struct
2525	unix	BlkpgPartition	struct
2526	unix	XDPRingOffset	struct
2527	unix	XDPMmapOffsets	struct
2528	unix	XDPUmemReg	struct
2529	unix	XDPStatistics	struct
2530	unix	XDPDesc	struct
2531	unix	ScmTimestamping	struct
2532	unix	SockExtendedErr	struct
2533	unix	FanotifyEventMetadata	struct
2534	unix	FanotifyResponse	struct
2535	unix	CryptoUserAlg	struct
2536	unix	CryptoStatAEAD	struct
2537	unix	CryptoStatAKCipher	struct
2538	unix	CryptoStatCipher	struct
2539	unix	CryptoStatCompress	struct
2540	unix	CryptoStatHash	struct
2541	unix	CryptoStatKPP	struct
2542	unix	CryptoStatRNG	struct
2543	unix	CryptoStatLarval	struct
2544	unix	CryptoReportLarval	struct
2545	unix	CryptoReportHash	struct
2546	unix	CryptoReportCipher	struct
2547	unix	CryptoReportBlkCipher	struct
2548	unix	CryptoReportAEAD	struct
2549	unix	CryptoReportComp	struct
2550	unix	CryptoReportRNG	struct
2551	unix	CryptoReportAKCipher	struct
2552	unix	CryptoReportKPP	struct
2553	unix	CryptoReportAcomp	struct
2554	unix	Timespec	struct
2555	unix	Timeval	struct
2556	unix	Timex	struct
2557	unix	Time_t	int64
2558	unix	Tms	struct
2559	unix	Utimbuf	struct
2560	unix	Rusage	struct
2561	unix	Rlimit	struct
2562	unix	Stat_t	struct
2563	unix	StatxTimestamp	struct
2564	unix	Statx_t	struct
2565	unix	Dirent	struct
2566	unix	Fsid	struct
2567	unix	Flock_t	struct
2568	unix	FscryptPolicy	struct
2569	unix	FscryptKey	struct
2570	unix	KeyctlDHParams	struct
2571	unix	RawSockaddrInet4	struct
2572	unix	RawSockaddrInet6	struct
2573	unix	RawSockaddrUnix	struct
2574	unix	RawSockaddrLinklayer	struct
2575	unix	RawSockaddrNetlink	struct
2576	unix	RawSockaddrHCI	struct
2577	unix	RawSockaddrL2	struct
2578	unix	RawSockaddrRFCOMM	struct
2579	unix	RawSockaddrCAN	struct
2580	unix	RawSockaddrALG	struct
2581	unix	RawSockaddrVM	struct
2582	unix	RawSockaddrXDP	struct
2583	unix	RawSockaddrPPPoX	[]byte
2584	unix	RawSockaddr	struct
2585	unix	RawSockaddrAny	struct
2586	unix	Linger	struct
2587	unix	Iovec	struct
2588	unix	IPMreq	struct
2589	unix	IPMreqn	struct
2590	unix	IPv6Mreq	struct
2591	unix	PacketMreq	struct
2592	unix	Msghdr	struct
2593	unix	Cmsghdr	struct
2594	unix	Inet4Pktinfo	struct
2595	unix	Inet6Pktinfo	struct
2596	unix	IPv6MTUInfo	struct
2597	unix	ICMPv6Filter	struct
2598	unix	Ucred	struct
2599	unix	TCPInfo	struct
2600	unix	CanFilter	struct
2601	unix	NlMsghdr	struct
2602	unix	NlMsgerr	struct
2603	unix	RtGenmsg	struct
2604	unix	NlAttr	struct
2605	unix	RtAttr	struct
2606	unix	IfInfomsg	struct
2607	unix	IfAddrmsg	struct
2608	unix	RtMsg	struct
2609	unix	RtNexthop	struct
2610	unix	NdUseroptmsg	struct
2611	unix	NdMsg	struct
2612	unix	SockFilter	struct
2613	unix	SockFprog	struct
2614	unix	InotifyEvent	struct
2615	unix	PtraceRegs	struct
2616	unix	FdSet	struct
2617	unix	Sysinfo_t	struct
2618	unix	Utsname	struct
2619	unix	Ustat_t	struct
2620	unix	EpollEvent	struct
2621	unix	PollFd	struct
2622	unix	Sigset_t	struct
2623	unix	SignalfdSiginfo	struct
2624	unix	Termios	struct
2625	unix	Winsize	struct
2626	unix	Taskstats	struct
2627	unix	CGroupStats	struct
2628	unix	Genlmsghdr	struct
2629	unix	PerfEventAttr	struct
2630	unix	PerfEventMmapPage	struct
2631	unix	SockaddrStorage	struct
2632	unix	TCPMD5Sig	struct
2633	unix	HDDriveCmdHdr	struct
2634	unix	HDGeometry	struct
2635	unix	HDDriveID	struct
2636	unix	Statfs_t	struct
2637	unix	TpacketHdr	struct
2638	unix	Tpacket2Hdr	struct
2639	unix	Tpacket3Hdr	struct
2640	unix	TpacketHdrVariant1	struct
2641	unix	TpacketBlockDesc	struct
2642	unix	TpacketBDTS	struct
2643	unix	TpacketHdrV1	struct
2644	unix	TpacketReq	struct
2645	unix	TpacketReq3	struct
2646	unix	TpacketStats	struct
2647	unix	TpacketStatsV3	struct
2648	unix	TpacketAuxdata	struct
2649	unix	Nfgenmsg	struct
2650	unix	RTCTime	struct
2651	unix	RTCWkAlrm	struct
2652	unix	RTCPLLInfo	struct
2653	unix	BlkpgIoctlArg	struct
2654	unix	BlkpgPartition	struct
2655	unix	XDPRingOffset	struct
2656	unix	XDPMmapOffsets	struct
2657	unix	XDPUmemReg	struct
2658	unix	XDPStatistics	struct
2659	unix	XDPDesc	struct
2660	unix	ScmTimestamping	struct
2661	unix	SockExtendedErr	struct
2662	unix	FanotifyEventMetadata	struct
2663	unix	FanotifyResponse	struct
2664	unix	CryptoUserAlg	struct
2665	unix	CryptoStatAEAD	struct
2666	unix	CryptoStatAKCipher	struct
2667	unix	CryptoStatCipher	struct
2668	unix	CryptoStatCompress	struct
2669	unix	CryptoStatHash	struct
2670	unix	CryptoStatKPP	struct
2671	unix	CryptoStatRNG	struct
2672	unix	CryptoStatLarval	struct
2673	unix	CryptoReportLarval	struct
2674	unix	CryptoReportHash	struct
2675	unix	CryptoReportCipher	struct
2676	unix	CryptoReportBlkCipher	struct
2677	unix	CryptoReportAEAD	struct
2678	unix	CryptoReportComp	struct
2679	unix	CryptoReportRNG	struct
2680	unix	CryptoReportAKCipher	struct
2681	unix	CryptoReportKPP	struct
2682	unix	CryptoReportAcomp	struct
2683	unix	Timespec	struct
2684	unix	Timeval	struct
2685	unix	Timex	struct
2686	unix	Time_t	int64
2687	unix	Tms	struct
2688	unix	Utimbuf	struct
2689	unix	Rusage	struct
2690	unix	Rlimit	struct
2691	unix	Stat_t	struct
2692	unix	StatxTimestamp	struct
2693	unix	Statx_t	struct
2694	unix	Dirent	struct
2695	unix	Fsid	struct
2696	unix	Flock_t	struct
2697	unix	FscryptPolicy	struct
2698	unix	FscryptKey	struct
2699	unix	KeyctlDHParams	struct
2700	unix	RawSockaddrInet4	struct
2701	unix	RawSockaddrInet6	struct
2702	unix	RawSockaddrUnix	struct
2703	unix	RawSockaddrLinklayer	struct
2704	unix	RawSockaddrNetlink	struct
2705	unix	RawSockaddrHCI	struct
2706	unix	RawSockaddrL2	struct
2707	unix	RawSockaddrRFCOMM	struct
2708	unix	RawSockaddrCAN	struct
2709	unix	RawSockaddrALG	struct
2710	unix	RawSockaddrVM	struct
2711	unix	RawSockaddrXDP	struct
2712	unix	RawSockaddrPPPoX	[]byte
2713	unix	RawSockaddr	struct
2714	unix	RawSockaddrAny	struct
2715	unix	Linger	struct
2716	unix	Iovec	struct
2717	unix	IPMreq	struct
2718	unix	IPMreqn	struct
2719	unix	IPv6Mreq	struct
2720	unix	PacketMreq	struct
2721	unix	Msghdr	struct
2722	unix	Cmsghdr	struct
2723	unix	Inet4Pktinfo	struct
2724	unix	Inet6Pktinfo	struct
2725	unix	IPv6MTUInfo	struct
2726	unix	ICMPv6Filter	struct
2727	unix	Ucred	struct
2728	unix	TCPInfo	struct
2729	unix	CanFilter	struct
2730	unix	NlMsghdr	struct
2731	unix	NlMsgerr	struct
2732	unix	RtGenmsg	struct
2733	unix	NlAttr	struct
2734	unix	RtAttr	struct
2735	unix	IfInfomsg	struct
2736	unix	IfAddrmsg	struct
2737	unix	RtMsg	struct
2738	unix	RtNexthop	struct
2739	unix	NdUseroptmsg	struct
2740	unix	NdMsg	struct
2741	unix	SockFilter	struct
2742	unix	SockFprog	struct
2743	unix	InotifyEvent	struct
2744	unix	PtraceRegs	struct
2745	unix	PtracePsw	struct
2746	unix	PtraceFpregs	struct
2747	unix	PtracePer	struct
2748	unix	FdSet	struct
2749	unix	Sysinfo_t	struct
2750	unix	Utsname	struct
2751	unix	Ustat_t	struct
2752	unix	EpollEvent	struct
2753	unix	PollFd	struct
2754	unix	Sigset_t	struct
2755	unix	SignalfdSiginfo	struct
2756	unix	Termios	struct
2757	unix	Winsize	struct
2758	unix	Taskstats	struct
2759	unix	CGroupStats	struct
2760	unix	Genlmsghdr	struct
2761	unix	PerfEventAttr	struct
2762	unix	PerfEventMmapPage	struct
2763	unix	SockaddrStorage	struct
2764	unix	TCPMD5Sig	struct
2765	unix	HDDriveCmdHdr	struct
2766	unix	HDGeometry	struct
2767	unix	HDDriveID	struct
2768	unix	Statfs_t	struct
2769	unix	TpacketHdr	struct
2770	unix	Tpacket2Hdr	struct
2771	unix	Tpacket3Hdr	struct
2772	unix	TpacketHdrVariant1	struct
2773	unix	TpacketBlockDesc	struct
2774	unix	TpacketBDTS	struct
2775	unix	TpacketHdrV1	struct
2776	unix	TpacketReq	struct
2777	unix	TpacketReq3	struct
2778	unix	TpacketStats	struct
2779	unix	TpacketStatsV3	struct
2780	unix	TpacketAuxdata	struct
2781	unix	Nfgenmsg	struct
2782	unix	RTCTime	struct
2783	unix	RTCWkAlrm	struct
2784	unix	RTCPLLInfo	struct
2785	unix	BlkpgIoctlArg	struct
2786	unix	BlkpgPartition	struct
2787	unix	XDPRingOffset	struct
2788	unix	XDPMmapOffsets	struct
2789	unix	XDPUmemReg	struct
2790	unix	XDPStatistics	struct
2791	unix	XDPDesc	struct
2792	unix	ScmTimestamping	struct
2793	unix	SockExtendedErr	struct
2794	unix	FanotifyEventMetadata	struct
2795	unix	FanotifyResponse	struct
2796	unix	CryptoUserAlg	struct
2797	unix	CryptoStatAEAD	struct
2798	unix	CryptoStatAKCipher	struct
2799	unix	CryptoStatCipher	struct
2800	unix	CryptoStatCompress	struct
2801	unix	CryptoStatHash	struct
2802	unix	CryptoStatKPP	struct
2803	unix	CryptoStatRNG	struct
2804	unix	CryptoStatLarval	struct
2805	unix	CryptoReportLarval	struct
2806	unix	CryptoReportHash	struct
2807	unix	CryptoReportCipher	struct
2808	unix	CryptoReportBlkCipher	struct
2809	unix	CryptoReportAEAD	struct
2810	unix	CryptoReportComp	struct
2811	unix	CryptoReportRNG	struct
2812	unix	CryptoReportAKCipher	struct
2813	unix	CryptoReportKPP	struct
2814	unix	CryptoReportAcomp	struct
2815	unix	Timespec	struct
2816	unix	Timeval	struct
2817	unix	Timex	struct
2818	unix	Time_t	int64
2819	unix	Tms	struct
2820	unix	Utimbuf	struct
2821	unix	Rusage	struct
2822	unix	Rlimit	struct
2823	unix	Stat_t	struct
2824	unix	StatxTimestamp	struct
2825	unix	Statx_t	struct
2826	unix	Dirent	struct
2827	unix	Fsid	struct
2828	unix	Flock_t	struct
2829	unix	FscryptPolicy	struct
2830	unix	FscryptKey	struct
2831	unix	KeyctlDHParams	struct
2832	unix	RawSockaddrInet4	struct
2833	unix	RawSockaddrInet6	struct
2834	unix	RawSockaddrUnix	struct
2835	unix	RawSockaddrLinklayer	struct
2836	unix	RawSockaddrNetlink	struct
2837	unix	RawSockaddrHCI	struct
2838	unix	RawSockaddrL2	struct
2839	unix	RawSockaddrRFCOMM	struct
2840	unix	RawSockaddrCAN	struct
2841	unix	RawSockaddrALG	struct
2842	unix	RawSockaddrVM	struct
2843	unix	RawSockaddrXDP	struct
2844	unix	RawSockaddrPPPoX	[]byte
2845	unix	RawSockaddr	struct
2846	unix	RawSockaddrAny	struct
2847	unix	Linger	struct
2848	unix	Iovec	struct
2849	unix	IPMreq	struct
2850	unix	IPMreqn	struct
2851	unix	IPv6Mreq	struct
2852	unix	PacketMreq	struct
2853	unix	Msghdr	struct
2854	unix	Cmsghdr	struct
2855	unix	Inet4Pktinfo	struct
2856	unix	Inet6Pktinfo	struct
2857	unix	IPv6MTUInfo	struct
2858	unix	ICMPv6Filter	struct
2859	unix	Ucred	struct
2860	unix	TCPInfo	struct
2861	unix	CanFilter	struct
2862	unix	NlMsghdr	struct
2863	unix	NlMsgerr	struct
2864	unix	RtGenmsg	struct
2865	unix	NlAttr	struct
2866	unix	RtAttr	struct
2867	unix	IfInfomsg	struct
2868	unix	IfAddrmsg	struct
2869	unix	RtMsg	struct
2870	unix	RtNexthop	struct
2871	unix	NdUseroptmsg	struct
2872	unix	NdMsg	struct
2873	unix	SockFilter	struct
2874	unix	SockFprog	struct
2875	unix	InotifyEvent	struct
2876	unix	PtraceRegs	struct
2877	unix	FdSet	struct
2878	unix	Sysinfo_t	struct
2879	unix	Utsname	struct
2880	unix	Ustat_t	struct
2881	unix	EpollEvent	struct
2882	unix	PollFd	struct
2883	unix	Sigset_t	struct
2884	unix	SignalfdSiginfo	struct
2885	unix	Termios	struct
2886	unix	Winsize	struct
2887	unix	Taskstats	struct
2888	unix	CGroupStats	struct
2889	unix	Genlmsghdr	struct
2890	unix	PerfEventAttr	struct
2891	unix	PerfEventMmapPage	struct
2892	unix	SockaddrStorage	struct
2893	unix	TCPMD5Sig	struct
2894	unix	HDDriveCmdHdr	struct
2895	unix	HDGeometry	struct
2896	unix	HDDriveID	struct
2897	unix	Statfs_t	struct
2898	unix	TpacketHdr	struct
2899	unix	Tpacket2Hdr	struct
2900	unix	Tpacket3Hdr	struct
2901	unix	TpacketHdrVariant1	struct
2902	unix	TpacketBlockDesc	struct
2903	unix	TpacketBDTS	struct
2904	unix	TpacketHdrV1	struct
2905	unix	TpacketReq	struct
2906	unix	TpacketReq3	struct
2907	unix	TpacketStats	struct
2908	unix	TpacketStatsV3	struct
2909	unix	TpacketAuxdata	struct
2910	unix	Nfgenmsg	struct
2911	unix	RTCTime	struct
2912	unix	RTCWkAlrm	struct
2913	unix	RTCPLLInfo	struct
2914	unix	BlkpgIoctlArg	struct
2915	unix	BlkpgPartition	struct
2916	unix	XDPRingOffset	struct
2917	unix	XDPMmapOffsets	struct
2918	unix	XDPUmemReg	struct
2919	unix	XDPStatistics	struct
2920	unix	XDPDesc	struct
2921	unix	ScmTimestamping	struct
2922	unix	SockExtendedErr	struct
2923	unix	FanotifyEventMetadata	struct
2924	unix	FanotifyResponse	struct
2925	unix	CryptoUserAlg	struct
2926	unix	CryptoStatAEAD	struct
2927	unix	CryptoStatAKCipher	struct
2928	unix	CryptoStatCipher	struct
2929	unix	CryptoStatCompress	struct
2930	unix	CryptoStatHash	struct
2931	unix	CryptoStatKPP	struct
2932	unix	CryptoStatRNG	struct
2933	unix	CryptoStatLarval	struct
2934	unix	CryptoReportLarval	struct
2935	unix	CryptoReportHash	struct
2936	unix	CryptoReportCipher	struct
2937	unix	CryptoReportBlkCipher	struct
2938	unix	CryptoReportAEAD	struct
2939	unix	CryptoReportComp	struct
2940	unix	CryptoReportRNG	struct
2941	unix	CryptoReportAKCipher	struct
2942	unix	CryptoReportKPP	struct
2943	unix	CryptoReportAcomp	struct
2944	unix	Timespec	struct
2945	unix	Timeval	struct
2946	unix	Rusage	struct
2947	unix	Rlimit	struct
2948	unix	Stat_t	struct
2949	unix	Statfs_t	[]byte
2950	unix	Flock_t	struct
2951	unix	Dirent	struct
2952	unix	Fsid	struct
2953	unix	RawSockaddrInet4	struct
2954	unix	RawSockaddrInet6	struct
2955	unix	RawSockaddrUnix	struct
2956	unix	RawSockaddrDatalink	struct
2957	unix	RawSockaddr	struct
2958	unix	RawSockaddrAny	struct
2959	unix	Linger	struct
2960	unix	Iovec	struct
2961	unix	IPMreq	struct
2962	unix	IPv6Mreq	struct
2963	unix	Msghdr	struct
2964	unix	Cmsghdr	struct
2965	unix	Inet6Pktinfo	struct
2966	unix	IPv6MTUInfo	struct
2967	unix	ICMPv6Filter	struct
2968	unix	Kevent_t	struct
2969	unix	FdSet	struct
2970	unix	IfMsghdr	struct
2971	unix	IfData	struct
2972	unix	IfaMsghdr	struct
2973	unix	IfAnnounceMsghdr	struct
2974	unix	RtMsghdr	struct
2975	unix	RtMetrics	struct
2976	unix	Mclpool	[]byte
2977	unix	BpfVersion	struct
2978	unix	BpfStat	struct
2979	unix	BpfProgram	struct
2980	unix	BpfInsn	struct
2981	unix	BpfHdr	struct
2982	unix	BpfTimeval	struct
2983	unix	Termios	struct
2984	unix	Winsize	struct
2985	unix	Ptmget	struct
2986	unix	PollFd	struct
2987	unix	Sysctlnode	struct
2988	unix	Utsname	struct
2989	unix	Clockinfo	struct
2990	unix	Timespec	struct
2991	unix	Timeval	struct
2992	unix	Rusage	struct
2993	unix	Rlimit	struct
2994	unix	Stat_t	struct
2995	unix	Statfs_t	[]byte
2996	unix	Flock_t	struct
2997	unix	Dirent	struct
2998	unix	Fsid	struct
2999	unix	RawSockaddrInet4	struct
3000	unix	RawSockaddrInet6	struct
3001	unix	RawSockaddrUnix	struct
3002	unix	RawSockaddrDatalink	struct
3003	unix	RawSockaddr	struct
3004	unix	RawSockaddrAny	struct
3005	unix	Linger	struct
3006	unix	Iovec	struct
3007	unix	IPMreq	struct
3008	unix	IPv6Mreq	struct
3009	unix	Msghdr	struct
3010	unix	Cmsghdr	struct
3011	unix	Inet6Pktinfo	struct
3012	unix	IPv6MTUInfo	struct
3013	unix	ICMPv6Filter	struct
3014	unix	Kevent_t	struct
3015	unix	FdSet	struct
3016	unix	IfMsghdr	struct
3017	unix	IfData	struct
3018	unix	IfaMsghdr	struct
3019	unix	IfAnnounceMsghdr	struct
3020	unix	RtMsghdr	struct
3021	unix	RtMetrics	struct
3022	unix	Mclpool	[]byte
3023	unix	BpfVersion	struct
3024	unix	BpfStat	struct
3025	unix	BpfProgram	struct
3026	unix	BpfInsn	struct
3027	unix	BpfHdr	struct
3028	unix	BpfTimeval	struct
3029	unix	Termios	struct
3030	unix	Winsize	struct
3031	unix	Ptmget	struct
3032	unix	PollFd	struct
3033	unix	Sysctlnode	struct
3034	unix	Utsname	struct
3035	unix	Clockinfo	struct
3036	unix	Timespec	struct
3037	unix	Timeval	struct
3038	unix	Rusage	struct
3039	unix	Rlimit	struct
3040	unix	Stat_t	struct
3041	unix	Statfs_t	[]byte
3042	unix	Flock_t	struct
3043	unix	Dirent	struct
3044	unix	Fsid	struct
3045	unix	RawSockaddrInet4	struct
3046	unix	RawSockaddrInet6	struct
3047	unix	RawSockaddrUnix	struct
3048	unix	RawSockaddrDatalink	struct
3049	unix	RawSockaddr	struct
3050	unix	RawSockaddrAny	struct
3051	unix	Linger	struct
3052	unix	Iovec	struct
3053	unix	IPMreq	struct
3054	unix	IPv6Mreq	struct
3055	unix	Msghdr	struct
3056	unix	Cmsghdr	struct
3057	unix	Inet6Pktinfo	struct
3058	unix	IPv6MTUInfo	struct
3059	unix	ICMPv6Filter	struct
3060	unix	Kevent_t	struct
3061	unix	FdSet	struct
3062	unix	IfMsghdr	struct
3063	unix	IfData	struct
3064	unix	IfaMsghdr	struct
3065	unix	IfAnnounceMsghdr	struct
3066	unix	RtMsghdr	struct
3067	unix	RtMetrics	struct
3068	unix	Mclpool	[]byte
3069	unix	BpfVersion	struct
3070	unix	BpfStat	struct
3071	unix	BpfProgram	struct
3072	unix	BpfInsn	struct
3073	unix	BpfHdr	struct
3074	unix	BpfTimeval	struct
3075	unix	Termios	struct
3076	unix	Winsize	struct
3077	unix	Ptmget	struct
3078	unix	PollFd	struct
3079	unix	Sysctlnode	struct
3080	unix	Utsname	struct
3081	unix	Clockinfo	struct
3082	unix	Timespec	struct
3083	unix	Timeval	struct
3084	unix	Rusage	struct
3085	unix	Rlimit	struct
3086	unix	Stat_t	struct
3087	unix	Statfs_t	[]byte
3088	unix	Flock_t	struct
3089	unix	Dirent	struct
3090	unix	Fsid	struct
3091	unix	RawSockaddrInet4	struct
3092	unix	RawSockaddrInet6	struct
3093	unix	RawSockaddrUnix	struct
3094	unix	RawSockaddrDatalink	struct
3095	unix	RawSockaddr	struct
3096	unix	RawSockaddrAny	struct
3097	unix	Linger	struct
3098	unix	Iovec	struct
3099	unix	IPMreq	struct
3100	unix	IPv6Mreq	struct
3101	unix	Msghdr	struct
3102	unix	Cmsghdr	struct
3103	unix	Inet6Pktinfo	struct
3104	unix	IPv6MTUInfo	struct
3105	unix	ICMPv6Filter	struct
3106	unix	Kevent_t	struct
3107	unix	FdSet	struct
3108	unix	IfMsghdr	struct
3109	unix	IfData	struct
3110	unix	IfaMsghdr	struct
3111	unix	IfAnnounceMsghdr	struct
3112	unix	RtMsghdr	struct
3113	unix	RtMetrics	struct
3114	unix	Mclpool	[]byte
3115	unix	BpfVersion	struct
3116	unix	BpfStat	struct
3117	unix	BpfProgram	struct
3118	unix	BpfInsn	struct
3119	unix	BpfHdr	struct
3120	unix	BpfTimeval	struct
3121	unix	Termios	struct
3122	unix	Winsize	struct
3123	unix	Ptmget	struct
3124	unix	PollFd	struct
3125	unix	Sysctlnode	struct
3126	unix	Utsname	struct
3127	unix	Clockinfo	struct
3128	unix	Timespec	struct
3129	unix	Timeval	struct
3130	unix	Rusage	struct
3131	unix	Rlimit	struct
3132	unix	Stat_t	struct
3133	unix	Statfs_t	struct
3134	unix	Flock_t	struct
3135	unix	Dirent	struct
3136	unix	Fsid	struct
3137	unix	RawSockaddrInet4	struct
3138	unix	RawSockaddrInet6	struct
3139	unix	RawSockaddrUnix	struct
3140	unix	RawSockaddrDatalink	struct
3141	unix	RawSockaddr	struct
3142	unix	RawSockaddrAny	struct
3143	unix	Linger	struct
3144	unix	Iovec	struct
3145	unix	IPMreq	struct
3146	unix	IPv6Mreq	struct
3147	unix	Msghdr	struct
3148	unix	Cmsghdr	struct
3149	unix	Inet6Pktinfo	struct
3150	unix	IPv6MTUInfo	struct
3151	unix	ICMPv6Filter	struct
3152	unix	Kevent_t	struct
3153	unix	FdSet	struct
3154	unix	IfMsghdr	struct
3155	unix	IfData	struct
3156	unix	IfaMsghdr	struct
3157	unix	IfAnnounceMsghdr	struct
3158	unix	RtMsghdr	struct
3159	unix	RtMetrics	struct
3160	unix	Mclpool	struct
3161	unix	BpfVersion	struct
3162	unix	BpfStat	struct
3163	unix	BpfProgram	struct
3164	unix	BpfInsn	struct
3165	unix	BpfHdr	struct
3166	unix	BpfTimeval	struct
3167	unix	Termios	struct
3168	unix	Winsize	struct
3169	unix	PollFd	struct
3170	unix	Sigset_t	uint32
3171	unix	Utsname	struct
3172	unix	Uvmexp	struct
3173	unix	Clockinfo	struct
3174	unix	Timespec	struct
3175	unix	Timeval	struct
3176	unix	Rusage	struct
3177	unix	Rlimit	struct
3178	unix	Stat_t	struct
3179	unix	Statfs_t	struct
3180	unix	Flock_t	struct
3181	unix	Dirent	struct
3182	unix	Fsid	struct
3183	unix	RawSockaddrInet4	struct
3184	unix	RawSockaddrInet6	struct
3185	unix	RawSockaddrUnix	struct
3186	unix	RawSockaddrDatalink	struct
3187	unix	RawSockaddr	struct
3188	unix	RawSockaddrAny	struct
3189	unix	Linger	struct
3190	unix	Iovec	struct
3191	unix	IPMreq	struct
3192	unix	IPv6Mreq	struct
3193	unix	Msghdr	struct
3194	unix	Cmsghdr	struct
3195	unix	Inet6Pktinfo	struct
3196	unix	IPv6MTUInfo	struct
3197	unix	ICMPv6Filter	struct
3198	unix	Kevent_t	struct
3199	unix	FdSet	struct
3200	unix	IfMsghdr	struct
3201	unix	IfData	struct
3202	unix	IfaMsghdr	struct
3203	unix	IfAnnounceMsghdr	struct
3204	unix	RtMsghdr	struct
3205	unix	RtMetrics	struct
3206	unix	Mclpool	struct
3207	unix	BpfVersion	struct
3208	unix	BpfStat	struct
3209	unix	BpfProgram	struct
3210	unix	BpfInsn	struct
3211	unix	BpfHdr	struct
3212	unix	BpfTimeval	struct
3213	unix	Termios	struct
3214	unix	Winsize	struct
3215	unix	PollFd	struct
3216	unix	Sigset_t	uint32
3217	unix	Utsname	struct
3218	unix	Uvmexp	struct
3219	unix	Clockinfo	struct
3220	unix	Timespec	struct
3221	unix	Timeval	struct
3222	unix	Rusage	struct
3223	unix	Rlimit	struct
3224	unix	Stat_t	struct
3225	unix	Statfs_t	struct
3226	unix	Flock_t	struct
3227	unix	Dirent	struct
3228	unix	Fsid	struct
3229	unix	RawSockaddrInet4	struct
3230	unix	RawSockaddrInet6	struct
3231	unix	RawSockaddrUnix	struct
3232	unix	RawSockaddrDatalink	struct
3233	unix	RawSockaddr	struct
3234	unix	RawSockaddrAny	struct
3235	unix	Linger	struct
3236	unix	Iovec	struct
3237	unix	IPMreq	struct
3238	unix	IPv6Mreq	struct
3239	unix	Msghdr	struct
3240	unix	Cmsghdr	struct
3241	unix	Inet6Pktinfo	struct
3242	unix	IPv6MTUInfo	struct
3243	unix	ICMPv6Filter	struct
3244	unix	Kevent_t	struct
3245	unix	FdSet	struct
3246	unix	IfMsghdr	struct
3247	unix	IfData	struct
3248	unix	IfaMsghdr	struct
3249	unix	IfAnnounceMsghdr	struct
3250	unix	RtMsghdr	struct
3251	unix	RtMetrics	struct
3252	unix	Mclpool	struct
3253	unix	BpfVersion	struct
3254	unix	BpfStat	struct
3255	unix	BpfProgram	struct
3256	unix	BpfInsn	struct
3257	unix	BpfHdr	struct
3258	unix	BpfTimeval	struct
3259	unix	Termios	struct
3260	unix	Winsize	struct
3261	unix	PollFd	struct
3262	unix	Sigset_t	uint32
3263	unix	Utsname	struct
3264	unix	Uvmexp	struct
3265	unix	Clockinfo	struct
3266	unix	Timespec	struct
3267	unix	Timeval	struct
3268	unix	Rusage	struct
3269	unix	Rlimit	struct
3270	unix	Stat_t	struct
3271	unix	Statfs_t	struct
3272	unix	Flock_t	struct
3273	unix	Dirent	struct
3274	unix	Fsid	struct
3275	unix	RawSockaddrInet4	struct
3276	unix	RawSockaddrInet6	struct
3277	unix	RawSockaddrUnix	struct
3278	unix	RawSockaddrDatalink	struct
3279	unix	RawSockaddr	struct
3280	unix	RawSockaddrAny	struct
3281	unix	Linger	struct
3282	unix	Iovec	struct
3283	unix	IPMreq	struct
3284	unix	IPv6Mreq	struct
3285	unix	Msghdr	struct
3286	unix	Cmsghdr	struct
3287	unix	Inet6Pktinfo	struct
3288	unix	IPv6MTUInfo	struct
3289	unix	ICMPv6Filter	struct
3290	unix	Kevent_t	struct
3291	unix	FdSet	struct
3292	unix	IfMsghdr	struct
3293	unix	IfData	struct
3294	unix	IfaMsghdr	struct
3295	unix	IfAnnounceMsghdr	struct
3296	unix	RtMsghdr	struct
3297	unix	RtMetrics	struct
3298	unix	Mclpool	struct
3299	unix	BpfVersion	struct
3300	unix	BpfStat	struct
3301	unix	BpfProgram	struct
3302	unix	BpfInsn	struct
3303	unix	BpfHdr	struct
3304	unix	BpfTimeval	struct
3305	unix	Termios	struct
3306	unix	Winsize	struct
3307	unix	PollFd	struct
3308	unix	Sigset_t	uint32
3309	unix	Utsname	struct
3310	unix	Uvmexp	struct
3311	unix	Clockinfo	struct
3312	unix	Timespec	struct
3313	unix	Timeval	struct
3314	unix	Timeval32	struct
3315	unix	Tms	struct
3316	unix	Utimbuf	struct
3317	unix	Rusage	struct
3318	unix	Rlimit	struct
3319	unix	Stat_t	struct
3320	unix	Flock_t	struct
3321	unix	Dirent	struct
3322	unix	Statvfs_t	struct
3323	unix	RawSockaddrInet4	struct
3324	unix	RawSockaddrInet6	struct
3325	unix	RawSockaddrUnix	struct
3326	unix	RawSockaddrDatalink	struct
3327	unix	RawSockaddr	struct
3328	unix	RawSockaddrAny	struct
3329	unix	Linger	struct
3330	unix	Iovec	struct
3331	unix	IPMreq	struct
3332	unix	IPv6Mreq	struct
3333	unix	Msghdr	struct
3334	unix	Cmsghdr	struct
3335	unix	Inet6Pktinfo	struct
3336	unix	IPv6MTUInfo	struct
3337	unix	ICMPv6Filter	struct
3338	unix	FdSet	struct
3339	unix	Utsname	struct
3340	unix	Ustat_t	struct
3341	unix	IfMsghdr	struct
3342	unix	IfData	struct
3343	unix	IfaMsghdr	struct
3344	unix	RtMsghdr	struct
3345	unix	RtMetrics	struct
3346	unix	BpfVersion	struct
3347	unix	BpfStat	struct
3348	unix	BpfProgram	struct
3349	unix	BpfInsn	struct
3350	unix	BpfTimeval	struct
3351	unix	BpfHdr	struct
3352	unix	Termios	struct
3353	unix	Termio	struct
3354	unix	Winsize	struct
3355	unix	PollFd	struct
3356	windows	Errno	syscall.Errno
3357	windows	SysProcAttr	syscall.SysProcAttr
3358	windows	DLLError	struct
3359	windows	DLL	struct
3360	windows	Proc	struct
3361	windows	LazyDLL	struct
3362	windows	LazyProc	struct
3363	windows	UserInfo10	struct
3364	windows	SidIdentifierAuthority	struct
3365	windows	SID	struct
3366	windows	WELL_KNOWN_SID_TYPE	uint32
3367	windows	SIDAndAttributes	struct
3368	windows	Tokenuser	struct
3369	windows	Tokenprimarygroup	struct
3370	windows	Tokengroups	struct
3371	windows	Token	windows.Handle
3372	windows	SERVICE_STATUS	struct
3373	windows	SERVICE_TABLE_ENTRY	struct
3374	windows	QUERY_SERVICE_CONFIG	struct
3375	windows	SERVICE_DESCRIPTION	struct
3376	windows	SERVICE_STATUS_PROCESS	struct
3377	windows	ENUM_SERVICE_STATUS_PROCESS	struct
3378	windows	SERVICE_FAILURE_ACTIONS	struct
3379	windows	SC_ACTION	struct
3380	windows	Handle	uintptr
3381	windows	RawSockaddrInet4	struct
3382	windows	RawSockaddrInet6	struct
3383	windows	RawSockaddr	struct
3384	windows	RawSockaddrAny	struct
3385	windows	Sockaddr	
3386	windows	SockaddrInet4	struct
3387	windows	SockaddrInet6	struct
3388	windows	RawSockaddrUnix	struct
3389	windows	SockaddrUnix	struct
3390	windows	Rusage	struct
3391	windows	WaitStatus	struct
3392	windows	Timespec	struct
3393	windows	Linger	struct
3394	windows	IPMreq	struct
3395	windows	IPv6Mreq	struct
3396	windows	Signal	int
3397	windows	Pointer	*struct{}
3398	windows	Timeval	struct
3399	windows	SecurityAttributes	struct
3400	windows	Overlapped	struct
3401	windows	FileNotifyInformation	struct
3402	windows	Filetime	struct
3403	windows	Win32finddata	struct
3404	windows	ByHandleFileInformation	struct
3405	windows	Win32FileAttributeData	struct
3406	windows	StartupInfo	struct
3407	windows	ProcessInformation	struct
3408	windows	ProcessEntry32	struct
3409	windows	Systemtime	struct
3410	windows	Timezoneinformation	struct
3411	windows	WSABuf	struct
3412	windows	WSAMsg	struct
3413	windows	Hostent	struct
3414	windows	Protoent	struct
3415	windows	DNSSRVData	struct
3416	windows	DNSPTRData	struct
3417	windows	DNSMXData	struct
3418	windows	DNSTXTData	struct
3419	windows	DNSRecord	struct
3420	windows	TransmitFileBuffers	struct
3421	windows	SockaddrGen	[]byte
3422	windows	InterfaceInfo	struct
3423	windows	IpAddressString	struct
3424	windows	IpMaskString	windows.IpAddressString
3425	windows	IpAddrString	struct
3426	windows	IpAdapterInfo	struct
3427	windows	MibIfRow	struct
3428	windows	CertInfo	struct
3429	windows	CertContext	struct
3430	windows	CertChainContext	struct
3431	windows	CertTrustListInfo	struct
3432	windows	CertSimpleChain	struct
3433	windows	CertChainElement	struct
3434	windows	CertRevocationCrlInfo	struct
3435	windows	CertRevocationInfo	struct
3436	windows	CertTrustStatus	struct
3437	windows	CertUsageMatch	struct
3438	windows	CertEnhKeyUsage	struct
3439	windows	CertChainPara	struct
3440	windows	CertChainPolicyPara	struct
3441	windows	SSLExtraCertChainPolicyPara	struct
3442	windows	CertChainPolicyStatus	struct
3443	windows	AddrinfoW	struct
3444	windows	GUID	struct
3445	windows	WSAProtocolInfo	struct
3446	windows	WSAProtocolChain	struct
3447	windows	TCPKeepalive	struct
3448	windows	SocketAddress	struct
3449	windows	IpAdapterUnicastAddress	struct
3450	windows	IpAdapterAnycastAddress	struct
3451	windows	IpAdapterMulticastAddress	struct
3452	windows	IpAdapterDnsServerAdapter	struct
3453	windows	IpAdapterPrefix	struct
3454	windows	IpAdapterAddresses	struct
3455	windows	Coord	struct
3456	windows	SmallRect	struct
3457	windows	ConsoleScreenBufferInfo	struct
3458	windows	WSAData	struct
3459	windows	Servent	struct
3460	windows	WSAData	struct
3461	windows	Servent	struct
3462	windows	WSAData	struct
3463	windows	Servent	struct
3464	analysis	Analyzer	struct
3465	analysis	Pass	struct
3466	analysis	PackageFact	struct
3467	analysis	ObjectFact	struct
3468	analysis	Fact	
3469	analysis	Diagnostic	struct
3470	analysisflags	JSONTree	map[string]map[string]interface{}
3471	facts	Set	struct
3472	ctrlflow	CFGs	struct
3473	unitchecker	Config	struct
3474	astutil	ApplyFunc	func(*astutil.Cursor) bool
3475	astutil	Cursor	struct
3476	inspector	Inspector	struct
3477	cfg	CFG	struct
3478	cfg	Block	struct
3479	objectpath	Path	string
3480	typeutil	Map	struct
3481	typeutil	Hasher	struct
3482	typeutil	MethodSetCache	struct
3483	assign	ST	struct
3484	method	MethodTest	int
3485	print	BoolFormatter	bool
3486	print	FormatterVal	bool
3487	print	RecursiveSlice	[]print.RecursiveSlice
3488	print	RecursiveMap	map[int]print.RecursiveMap
3489	print	RecursiveStruct	struct
3490	print	RecursiveStruct1	struct
3491	print	RecursiveStruct2	struct
3492	print	T2	struct
3493	print	T1	struct
3494	structtag	StructTagTest	struct
3495	bzip2	StructuralError	string
3496	flate	Writer	struct
3497	flate	CorruptInputError	int64
3498	flate	InternalError	string
3499	flate	ReadError	struct
3500	flate	WriteError	struct
3501	flate	Resetter	
3502	flate	Reader	
3503	gzip	Header	struct
3504	gzip	Reader	struct
3505	gzip	Writer	struct
3506	lzw	Order	int
3507	zlib	Resetter	
3508	zlib	Writer	struct
3509	heap	Interface	
3510	list	Element	struct
3511	list	List	struct
3512	ring	Ring	struct
3513	context	Context	
3514	context	CancelFunc	func()
3515	aes	KeySizeError	int
3516	cipher	Block	
3517	cipher	Stream	
3518	cipher	BlockMode	
3519	cipher	AEAD	
3520	cipher	StreamReader	struct
3521	cipher	StreamWriter	struct
3522	crypto	Hash	uint
3523	crypto	PublicKey	interface{}
3524	crypto	PrivateKey	interface{}
3525	crypto	Signer	
3526	crypto	SignerOpts	
3527	crypto	Decrypter	
3528	crypto	DecrypterOpts	interface{}
3529	des	KeySizeError	int
3530	dsa	Parameters	struct
3531	dsa	PublicKey	struct
3532	dsa	PrivateKey	struct
3533	dsa	ParameterSizes	int
3534	ecdsa	PublicKey	struct
3535	ecdsa	PrivateKey	struct
3536	ed25519	PublicKey	[]byte
3537	ed25519	PrivateKey	[]byte
3538	edwards25519	FieldElement	[]int32
3539	edwards25519	ProjectiveGroupElement	struct
3540	edwards25519	ExtendedGroupElement	struct
3541	edwards25519	CompletedGroupElement	struct
3542	edwards25519	PreComputedGroupElement	struct
3543	edwards25519	CachedGroupElement	struct
3544	elliptic	Curve	
3545	elliptic	CurveParams	struct
3546	main	Data	struct
3547	rc4	Cipher	struct
3548	rc4	KeySizeError	int
3549	rsa	PKCS1v15DecryptOptions	struct
3550	rsa	PSSOptions	struct
3551	rsa	PublicKey	struct
3552	rsa	OAEPOptions	struct
3553	rsa	PrivateKey	struct
3554	rsa	PrecomputedValues	struct
3555	rsa	CRTValue	struct
3556	tls	CurveID	uint16
3557	tls	ConnectionState	struct
3558	tls	ClientAuthType	int
3559	tls	ClientSessionState	struct
3560	tls	ClientSessionCache	
3561	tls	SignatureScheme	uint16
3562	tls	ClientHelloInfo	struct
3563	tls	CertificateRequestInfo	struct
3564	tls	RenegotiationSupport	int
3565	tls	Config	struct
3566	tls	Certificate	struct
3567	tls	Conn	struct
3568	tls	RecordHeaderError	struct
3569	x509	CertPool	struct
3570	x509	PEMCipher	int
3571	pkix	AlgorithmIdentifier	struct
3572	pkix	RDNSequence	[]pkix.RelativeDistinguishedNameSET
3573	pkix	RelativeDistinguishedNameSET	[]pkix.AttributeTypeAndValue
3574	pkix	AttributeTypeAndValue	struct
3575	pkix	AttributeTypeAndValueSET	struct
3576	pkix	Extension	struct
3577	pkix	Name	struct
3578	pkix	CertificateList	struct
3579	pkix	TBSCertificateList	struct
3580	pkix	RevokedCertificate	struct
3581	x509	InvalidReason	int
3582	x509	CertificateInvalidError	struct
3583	x509	HostnameError	struct
3584	x509	UnknownAuthorityError	struct
3585	x509	SystemRootsError	struct
3586	x509	VerifyOptions	struct
3587	x509	SignatureAlgorithm	int
3588	x509	PublicKeyAlgorithm	int
3589	x509	KeyUsage	int
3590	x509	ExtKeyUsage	int
3591	x509	Certificate	struct
3592	x509	InsecureAlgorithmError	x509.SignatureAlgorithm
3593	x509	ConstraintViolationError	struct
3594	x509	UnhandledCriticalExtension	struct
3595	x509	CertificateRequest	struct
3596	driver	Value	interface{}
3597	driver	NamedValue	struct
3598	driver	Driver	
3599	driver	DriverContext	
3600	driver	Connector	
3601	driver	Pinger	
3602	driver	Execer	
3603	driver	ExecerContext	
3604	driver	Queryer	
3605	driver	QueryerContext	
3606	driver	Conn	
3607	driver	ConnPrepareContext	
3608	driver	IsolationLevel	int
3609	driver	TxOptions	struct
3610	driver	ConnBeginTx	
3611	driver	SessionResetter	
3612	driver	Result	
3613	driver	Stmt	
3614	driver	StmtExecContext	
3615	driver	StmtQueryContext	
3616	driver	NamedValueChecker	
3617	driver	ColumnConverter	
3618	driver	Rows	
3619	driver	RowsNextResultSet	
3620	driver	RowsColumnTypeScanType	
3621	driver	RowsColumnTypeDatabaseTypeName	
3622	driver	RowsColumnTypeLength	
3623	driver	RowsColumnTypeNullable	
3624	driver	RowsColumnTypePrecisionScale	
3625	driver	Tx	
3626	driver	RowsAffected	int64
3627	driver	ValueConverter	
3628	driver	Valuer	
3629	driver	Null	struct
3630	driver	NotNull	struct
3631	sql	NamedArg	struct
3632	sql	IsolationLevel	int
3633	sql	TxOptions	struct
3634	sql	RawBytes	[]byte
3635	sql	NullString	struct
3636	sql	NullInt64	struct
3637	sql	NullInt32	struct
3638	sql	NullFloat64	struct
3639	sql	NullBool	struct
3640	sql	NullTime	struct
3641	sql	Scanner	
3642	sql	Out	struct
3643	sql	DB	struct
3644	sql	DBStats	struct
3645	sql	Conn	struct
3646	sql	Tx	struct
3647	sql	Stmt	struct
3648	sql	Rows	struct
3649	sql	ColumnType	struct
3650	sql	Row	struct
3651	sql	Result	
3652	dwarf	DecodeError	struct
3653	dwarf	Attr	uint32
3654	dwarf	Tag	uint32
3655	dwarf	Entry	struct
3656	dwarf	Field	struct
3657	dwarf	Class	int
3658	dwarf	Offset	uint32
3659	dwarf	Reader	struct
3660	dwarf	LineReader	struct
3661	dwarf	LineEntry	struct
3662	dwarf	LineFile	struct
3663	dwarf	LineReaderPos	struct
3664	dwarf	Data	struct
3665	dwarf	Type	
3666	dwarf	CommonType	struct
3667	dwarf	BasicType	struct
3668	dwarf	CharType	struct
3669	dwarf	UcharType	struct
3670	dwarf	IntType	struct
3671	dwarf	UintType	struct
3672	dwarf	FloatType	struct
3673	dwarf	ComplexType	struct
3674	dwarf	BoolType	struct
3675	dwarf	AddrType	struct
3676	dwarf	UnspecifiedType	struct
3677	dwarf	QualType	struct
3678	dwarf	ArrayType	struct
3679	dwarf	VoidType	struct
3680	dwarf	PtrType	struct
3681	dwarf	StructType	struct
3682	dwarf	StructField	struct
3683	dwarf	EnumType	struct
3684	dwarf	EnumValue	struct
3685	dwarf	FuncType	struct
3686	dwarf	DotDotDotType	struct
3687	dwarf	TypedefType	struct
3688	dwarf	UnsupportedType	struct
3689	elf	Version	byte
3690	elf	Class	byte
3691	elf	Data	byte
3692	elf	OSABI	byte
3693	elf	Type	uint16
3694	elf	Machine	uint16
3695	elf	SectionIndex	int
3696	elf	SectionType	uint32
3697	elf	SectionFlag	uint32
3698	elf	CompressionType	int
3699	elf	ProgType	int
3700	elf	ProgFlag	uint32
3701	elf	DynTag	int
3702	elf	DynFlag	int
3703	elf	NType	int
3704	elf	SymBind	int
3705	elf	SymType	int
3706	elf	SymVis	int
3707	elf	R_X86_64	int
3708	elf	R_AARCH64	int
3709	elf	R_ALPHA	int
3710	elf	R_ARM	int
3711	elf	R_386	int
3712	elf	R_MIPS	int
3713	elf	R_PPC	int
3714	elf	R_PPC64	int
3715	elf	R_RISCV	int
3716	elf	R_390	int
3717	elf	R_SPARC	int
3718	elf	Header32	struct
3719	elf	Section32	struct
3720	elf	Prog32	struct
3721	elf	Dyn32	struct
3722	elf	Chdr32	struct
3723	elf	Rel32	struct
3724	elf	Rela32	struct
3725	elf	Sym32	struct
3726	elf	Header64	struct
3727	elf	Section64	struct
3728	elf	Prog64	struct
3729	elf	Dyn64	struct
3730	elf	Chdr64	struct
3731	elf	Rel64	struct
3732	elf	Rela64	struct
3733	elf	Sym64	struct
3734	elf	FileHeader	struct
3735	elf	File	struct
3736	elf	SectionHeader	struct
3737	elf	Section	struct
3738	elf	ProgHeader	struct
3739	elf	Prog	struct
3740	elf	Symbol	struct
3741	elf	FormatError	struct
3742	elf	ImportedSymbol	struct
3743	gosym	LineTable	struct
3744	gosym	Sym	struct
3745	gosym	Func	struct
3746	gosym	Obj	struct
3747	gosym	Table	struct
3748	gosym	UnknownFileError	string
3749	gosym	UnknownLineError	struct
3750	gosym	DecodingError	struct
3751	macho	FatFile	struct
3752	macho	FatArchHeader	struct
3753	macho	FatArch	struct
3754	macho	File	struct
3755	macho	Load	
3756	macho	LoadBytes	[]byte
3757	macho	SegmentHeader	struct
3758	macho	Segment	struct
3759	macho	SectionHeader	struct
3760	macho	Reloc	struct
3761	macho	Section	struct
3762	macho	Dylib	struct
3763	macho	Symtab	struct
3764	macho	Dysymtab	struct
3765	macho	Rpath	struct
3766	macho	Symbol	struct
3767	macho	FormatError	struct
3768	macho	FileHeader	struct
3769	macho	Type	uint32
3770	macho	Cpu	uint32
3771	macho	LoadCmd	uint32
3772	macho	Segment32	struct
3773	macho	Segment64	struct
3774	macho	SymtabCmd	struct
3775	macho	DysymtabCmd	struct
3776	macho	DylibCmd	struct
3777	macho	RpathCmd	struct
3778	macho	Thread	struct
3779	macho	Section32	struct
3780	macho	Section64	struct
3781	macho	Nlist32	struct
3782	macho	Nlist64	struct
3783	macho	Regs386	struct
3784	macho	RegsAMD64	struct
3785	macho	RelocTypeGeneric	int
3786	macho	RelocTypeX86_64	int
3787	macho	RelocTypeARM	int
3788	macho	RelocTypeARM64	int
3789	pe	File	struct
3790	pe	ImportDirectory	struct
3791	pe	FormatError	struct
3792	pe	FileHeader	struct
3793	pe	DataDirectory	struct
3794	pe	OptionalHeader32	struct
3795	pe	OptionalHeader64	struct
3796	pe	SectionHeader32	struct
3797	pe	Reloc	struct
3798	pe	SectionHeader	struct
3799	pe	Section	struct
3800	pe	StringTable	[]byte
3801	pe	COFFSymbol	struct
3802	pe	Symbol	struct
3803	plan9obj	FileHeader	struct
3804	plan9obj	File	struct
3805	plan9obj	SectionHeader	struct
3806	plan9obj	Section	struct
3807	plan9obj	Sym	struct
3808	ascii85	CorruptInputError	int64
3809	asn1	StructuralError	struct
3810	asn1	SyntaxError	struct
3811	asn1	BitString	struct
3812	asn1	ObjectIdentifier	[]int
3813	asn1	Enumerated	int
3814	asn1	Flag	bool
3815	asn1	RawValue	struct
3816	asn1	RawContent	[]byte
3817	base32	Encoding	struct
3818	base32	CorruptInputError	int64
3819	base64	Encoding	struct
3820	base64	CorruptInputError	int64
3821	binary	ByteOrder	
3822	csv	ParseError	struct
3823	csv	Reader	struct
3824	csv	Writer	struct
3825	encoding	BinaryMarshaler	
3826	encoding	BinaryUnmarshaler	
3827	encoding	TextMarshaler	
3828	encoding	TextUnmarshaler	
3829	main	Type	struct
3830	gob	Decoder	struct
3831	main	Type	struct
3832	gob	Encoder	struct
3833	gob	CommonType	struct
3834	gob	GobEncoder	
3835	gob	GobDecoder	
3836	hex	InvalidByteError	byte
3837	json	Unmarshaler	
3838	json	UnmarshalTypeError	struct
3839	json	UnmarshalFieldError	struct
3840	json	InvalidUnmarshalError	struct
3841	json	Number	string
3842	json	Marshaler	
3843	json	UnsupportedTypeError	struct
3844	json	UnsupportedValueError	struct
3845	json	InvalidUTF8Error	struct
3846	json	MarshalerError	struct
3847	json	SyntaxError	struct
3848	json	Decoder	struct
3849	json	Encoder	struct
3850	json	RawMessage	[]byte
3851	json	Token	interface{}
3852	json	Delim	rune
3853	pem	Block	struct
3854	xml	Marshaler	
3855	xml	MarshalerAttr	
3856	xml	Encoder	struct
3857	xml	UnsupportedTypeError	struct
3858	xml	UnmarshalError	string
3859	xml	Unmarshaler	
3860	xml	UnmarshalerAttr	
3861	xml	TagPathError	struct
3862	xml	SyntaxError	struct
3863	xml	Name	struct
3864	xml	Attr	struct
3865	xml	Token	interface{}
3866	xml	StartElement	struct
3867	xml	EndElement	struct
3868	xml	CharData	[]byte
3869	xml	Comment	[]byte
3870	xml	ProcInst	struct
3871	xml	Directive	[]byte
3872	xml	TokenReader	
3873	xml	Decoder	struct
3874	expvar	Var	
3875	expvar	Int	struct
3876	expvar	Float	struct
3877	expvar	Map	struct
3878	expvar	KeyValue	struct
3879	expvar	String	struct
3880	expvar	Func	func() interface{}
3881	flag	Value	
3882	flag	Getter	
3883	flag	ErrorHandling	int
3884	flag	FlagSet	struct
3885	flag	Flag	struct
3886	fmt	State	
3887	fmt	Formatter	
3888	fmt	Stringer	
3889	fmt	GoStringer	
3890	fmt	ScanState	
3891	fmt	Scanner	
3892	ast	Node	
3893	ast	Expr	
3894	ast	Stmt	
3895	ast	Decl	
3896	ast	Comment	struct
3897	ast	CommentGroup	struct
3898	ast	Field	struct
3899	ast	FieldList	struct
3900	ast	BadExpr	struct
3901	ast	Ident	struct
3902	ast	Ellipsis	struct
3903	ast	BasicLit	struct
3904	ast	FuncLit	struct
3905	ast	CompositeLit	struct
3906	ast	ParenExpr	struct
3907	ast	SelectorExpr	struct
3908	ast	IndexExpr	struct
3909	ast	SliceExpr	struct
3910	ast	TypeAssertExpr	struct
3911	ast	CallExpr	struct
3912	ast	StarExpr	struct
3913	ast	UnaryExpr	struct
3914	ast	BinaryExpr	struct
3915	ast	KeyValueExpr	struct
3916	ast	ChanDir	int
3917	ast	ArrayType	struct
3918	ast	StructType	struct
3919	ast	FuncType	struct
3920	ast	InterfaceType	struct
3921	ast	MapType	struct
3922	ast	ChanType	struct
3923	ast	BadStmt	struct
3924	ast	DeclStmt	struct
3925	ast	EmptyStmt	struct
3926	ast	LabeledStmt	struct
3927	ast	ExprStmt	struct
3928	ast	SendStmt	struct
3929	ast	IncDecStmt	struct
3930	ast	AssignStmt	struct
3931	ast	GoStmt	struct
3932	ast	DeferStmt	struct
3933	ast	ReturnStmt	struct
3934	ast	BranchStmt	struct
3935	ast	BlockStmt	struct
3936	ast	IfStmt	struct
3937	ast	CaseClause	struct
3938	ast	SwitchStmt	struct
3939	ast	TypeSwitchStmt	struct
3940	ast	CommClause	struct
3941	ast	SelectStmt	struct
3942	ast	ForStmt	struct
3943	ast	RangeStmt	struct
3944	ast	Spec	
3945	ast	ImportSpec	struct
3946	ast	ValueSpec	struct
3947	ast	TypeSpec	struct
3948	ast	BadDecl	struct
3949	ast	GenDecl	struct
3950	ast	FuncDecl	struct
3951	ast	File	struct
3952	ast	Package	struct
3953	ast	CommentMap	map[ast.Node][]*ast.CommentGroup
3954	ast	Filter	func(string) bool
3955	ast	MergeMode	uint
3956	ast	FieldFilter	func(string, reflect.Value) bool
3957	ast	Importer	func(map[string]*ast.Object, string) (*ast.Object, error)
3958	ast	Scope	struct
3959	ast	Object	struct
3960	ast	ObjKind	int
3961	ast	Visitor	
3962	build	Context	struct
3963	build	ImportMode	uint
3964	build	Package	struct
3965	build	NoGoError	struct
3966	build	MultiplePackageError	struct
3967	constant	Kind	int
3968	constant	Value	
3969	doc	Package	struct
3970	doc	Value	struct
3971	doc	Type	struct
3972	doc	Func	struct
3973	doc	Note	struct
3974	doc	Mode	int
3975	doc	Example	struct
3976	doc	Filter	func(string) bool
3977	b	T	struct
3978	testing	InternalBenchmark	struct
3979	testing	B	struct
3980	testing	BenchmarkResult	struct
3981	blank	T	int
3982	blank	S	struct
3983	c	A	struct
3984	c	B	struct
3985	c	C	struct
3986	c	D	struct
3987	c	E1	struct
3988	c	E2	struct
3989	c	E3	struct
3990	c	E4	struct
3991	c	T1	struct
3992	c	T2	struct
3993	d	T2	struct
3994	d	TG2	struct
3995	d	TG1	struct
3996	d	TG0	struct
3997	d	T1	struct
3998	d	T0	struct
3999	e	T1	struct
4000	e	T2	struct
4001	e	T3	struct
4002	e	T4	struct
4003	e	T4	struct
4004	e	T5	struct
4005	e	U1	struct
4006	e	U2	struct
4007	e	U3	struct
4008	e	U4	struct
4009	e	V1	struct
4010	e	V2	struct
4011	e	V3	struct
4012	e	V4	struct
4013	e	V5	struct
4014	e	V6	struct
4015	error1	I0	
4016	error1	T0	struct
4017	error1	S0	struct
4018	error2	I0	
4019	error2	T0	struct
4020	error2	S0	struct
4021	testing	InternalExample	struct
4022	issue12839	T1	struct
4023	issue12839	T2	struct
4024	issue22856	T	struct
4025	testing	T	struct
4026	testing	InternalTest	struct
4027	importer	Lookup	func(string) (io.ReadCloser, error)
4028	gccgoimporter	GccgoInstallation	struct
4029	gccgoimporter	PackageInit	struct
4030	gccgoimporter	InitData	struct
4031	gccgoimporter	Importer	func(map[string]*types.Package, string, func(string) (io.ReadCloser, error)) (*types.Package, error)
4032	aliases	T0	[]int
4033	aliases	T1	[]byte
4034	aliases	T2	struct
4035	aliases	T3	
4036	aliases	T4	func(int, aliases.T0) chan aliases.T2
4037	aliases	Ai	int
4038	aliases	A0	aliases.T0
4039	aliases	A1	aliases.T1
4040	aliases	A2	aliases.T2
4041	aliases	A3	aliases.T3
4042	aliases	A4	aliases.T4
4043	aliases	A10	[]int
4044	aliases	A11	[]byte
4045	aliases	A12	struct
4046	aliases	A13	
4047	aliases	A14	func(int, aliases.A0) chan aliases.A2
4048	aliases	V0	aliases.V1
4049	aliases	V1	(aliases.V2)
4050	aliases	V2	(aliases.V3)
4051	aliases	V3	aliases.T0
4052	aliases	C0	struct
4053	aliases	C1	*aliases.C0
4054	aliases	C2	aliases.C1
4055	aliases	C5	struct
4056	aliases	C6	aliases.C5
4057	conversions	Units	string
4058	escapeinfo	T	struct
4059	lib	M	struct
4060	lib	F	struct
4061	lib	E	lib.F
4062	server	A	struct
4063	server	FooServer	server.Server
4064	server	Server	struct
4065	issue30628	Apple	struct
4066	issue31540	Y	struct
4067	issue31540	Z	map[int]int
4068	issue31540	X	map[issue31540.Y]issue31540.Z
4069	issue31540	A1	issue31540.X
4070	issue31540	A2	issue31540.A1
4071	issue31540	S	struct
4072	nointerface	I	int
4073	pointer	Int8Ptr	*int8
4074	a	A	struct
4075	b	A	a.A
4076	exports	T1	int
4077	exports	T2	[]int
4078	exports	T3	[]int
4079	exports	T4	*int
4080	exports	T5	chan int\n
4081	exports	T6a	chan int\n
4082	exports	T6b	chan (chan int\n)\n
4083	exports	T6c	chan (chan int\n)\n
4084	exports	T7	chan *ast.File\n
4085	exports	T8	struct
4086	exports	T9	struct
4087	exports	T10	struct
4088	exports	T11	map[int]string
4089	exports	T12	interface{}
4090	exports	T13	
4091	exports	T14	
4092	exports	T15	func()
4093	exports	T16	func(int)
4094	exports	T17	func(int)
4095	exports	T18	func() float32
4096	exports	T19	func() float32
4097	exports	T20	func(...interface{})
4098	exports	T21	struct
4099	exports	T22	struct
4100	exports	T23	struct
4101	exports	T24	*exports.T24
4102	exports	T25	*exports.T26
4103	exports	T26	*exports.T27
4104	exports	T27	*exports.T25
4105	exports	T28	func(exports.T28) exports.T28
4106	p	Error	error
4107	issue25301	A	
4108	issue25301	T	
4109	issue25301	S	struct
4110	issue25596	E	
4111	issue25596	T	
4112	test	BlankField	struct
4113	srcimporter	Importer	struct
4114	parser	Mode	uint
4115	printer	Mode	uint
4116	printer	Config	struct
4117	printer	CommentedNode	struct
4118	scanner	Error	struct
4119	scanner	ErrorList	[]*scanner.Error
4120	scanner	ErrorHandler	func(token.Position, string)
4121	scanner	Scanner	struct
4122	scanner	Mode	uint
4123	token	Position	struct
4124	token	Pos	int
4125	token	File	struct
4126	token	FileSet	struct
4127	token	Token	int
4128	types	Error	struct
4129	types	Importer	
4130	types	ImportMode	int
4131	types	ImporterFrom	
4132	types	Config	struct
4133	types	Info	struct
4134	types	TypeAndValue	struct
4135	types	Initializer	struct
4136	types	Checker	struct
4137	types	MethodSet	struct
4138	types	Object	
4139	types	PkgName	struct
4140	types	Const	struct
4141	types	TypeName	struct
4142	types	Var	struct
4143	types	Func	struct
4144	types	Label	struct
4145	types	Builtin	struct
4146	types	Nil	struct
4147	types	Package	struct
4148	types	Scope	struct
4149	types	SelectionKind	int
4150	types	Selection	struct
4151	types	Sizes	
4152	types	StdSizes	struct
4153	types	Type	
4154	types	BasicKind	int
4155	types	BasicInfo	int
4156	types	Basic	struct
4157	types	Array	struct
4158	types	Slice	struct
4159	types	Struct	struct
4160	types	Pointer	struct
4161	types	Tuple	struct
4162	types	Signature	struct
4163	types	Interface	struct
4164	types	Map	struct
4165	types	Chan	struct
4166	types	ChanDir	int
4167	types	Named	struct
4168	types	Qualifier	func(*types.Package) string
4169	crc32	Table	[]uint32
4170	crc64	Table	[]uint64
4171	hash	Hash	
4172	hash	Hash32	
4173	hash	Hash64	
4174	template	CSS	string
4175	template	HTML	string
4176	template	HTMLAttr	string
4177	template	JS	string
4178	template	JSStr	string
4179	template	URL	string
4180	template	Srcset	string
4181	template	Error	struct
4182	template	ErrorCode	int
4183	template	Template	struct
4184	template	FuncMap	map[string]interface{}
4185	color	Color	
4186	color	RGBA	struct
4187	color	RGBA64	struct
4188	color	NRGBA	struct
4189	color	NRGBA64	struct
4190	color	Alpha	struct
4191	color	Alpha16	struct
4192	color	Gray	struct
4193	color	Gray16	struct
4194	color	Model	
4195	color	Palette	[]color.Color
4196	color	YCbCr	struct
4197	color	NYCbCrA	struct
4198	color	CMYK	struct
4199	draw	Image	
4200	draw	Quantizer	
4201	draw	Op	int
4202	draw	Drawer	
4203	image	Point	struct
4204	image	Rectangle	struct
4205	gif	GIF	struct
4206	gif	Options	struct
4207	image	Config	struct
4208	image	Image	
4209	image	PalettedImage	
4210	image	RGBA	struct
4211	image	RGBA64	struct
4212	image	NRGBA	struct
4213	image	NRGBA64	struct
4214	image	Alpha	struct
4215	image	Alpha16	struct
4216	image	Gray	struct
4217	image	Gray16	struct
4218	image	CMYK	struct
4219	image	Paletted	struct
4220	jpeg	FormatError	string
4221	jpeg	UnsupportedError	string
4222	jpeg	Reader	
4223	jpeg	Options	struct
4224	image	Uniform	struct
4225	png	FormatError	string
4226	png	UnsupportedError	string
4227	png	Encoder	struct
4228	png	EncoderBufferPool	
4229	png	EncoderBuffer	png.encoder
4230	png	CompressionLevel	int
4231	image	YCbCrSubsampleRatio	int
4232	image	YCbCr	struct
4233	image	NYCbCrA	struct
4234	suffixarray	Index	struct
4235	cpu	CacheLinePad	struct
4236	fmtsort	SortedMap	struct
4237	lazyregexp	Regexp	struct
4238	lazytemplate	Template	struct
4239	nettrace	TraceKey	struct
4240	nettrace	LookupIPAltResolverKey	struct
4241	nettrace	Trace	struct
4242	poll	TimeoutError	struct
4243	poll	FD	struct
4244	poll	FD	struct
4245	poll	FD	struct
4246	reflectlite	Type	
4247	reflectlite	Kind	uint
4248	reflectlite	Value	struct
4249	reflectlite	ValueError	struct
4250	singleflight	Group	struct
4251	singleflight	Result	struct
4252	unix	GetRandomFlag	uintptr
4253	unix	GetRandomFlag	uintptr
4254	windows	PROCESS_MEMORY_COUNTERS	struct
4255	registry	Key	syscall.Handle
4256	registry	KeyInfo	struct
4257	windows	REPARSE_DATA_BUFFER	struct
4258	windows	REPARSE_DATA_BUFFER_HEADER	struct
4259	windows	SymbolicLinkReparseBuffer	struct
4260	windows	MountPointReparseBuffer	struct
4261	windows	LUID	struct
4262	windows	LUID_AND_ATTRIBUTES	struct
4263	windows	TOKEN_PRIVILEGES	struct
4264	windows	SID_AND_ATTRIBUTES	struct
4265	windows	TOKEN_MANDATORY_LABEL	struct
4266	windows	TokenType	uint32
4267	windows	LocalGroupUserInfo0	struct
4268	windows	UserInfo4	struct
4269	windows	FILE_ATTRIBUTE_TAG_INFO	struct
4270	windows	SocketAddress	struct
4271	windows	IpAdapterUnicastAddress	struct
4272	windows	IpAdapterAnycastAddress	struct
4273	windows	IpAdapterMulticastAddress	struct
4274	windows	IpAdapterDnsServerAdapter	struct
4275	windows	IpAdapterPrefix	struct
4276	windows	IpAdapterAddresses	struct
4277	windows	WSAMsg	struct
4278	windows	SHARE_INFO_2	struct
4279	testlog	Interface	
4280	trace	MutatorUtil	struct
4281	trace	UtilFlags	int
4282	trace	MMUCurve	struct
4283	trace	UtilWindow	struct
4284	trace	GDesc	struct
4285	trace	UserRegionDesc	struct
4286	trace	GExecutionStat	struct
4287	trace	Event	struct
4288	trace	Frame	struct
4289	trace	ParseResult	struct
4290	trace	G	struct
4291	trace	Writer	struct
4292	xcoff	Archive	struct
4293	xcoff	ArchiveHeader	struct
4294	xcoff	Member	struct
4295	xcoff	MemberHeader	struct
4296	xcoff	SectionHeader	struct
4297	xcoff	Section	struct
4298	xcoff	AuxiliaryCSect	struct
4299	xcoff	AuxiliaryFcn	struct
4300	xcoff	Symbol	struct
4301	xcoff	Reloc	struct
4302	xcoff	ImportedSymbol	struct
4303	xcoff	FileHeader	struct
4304	xcoff	File	struct
4305	xcoff	FileHeader32	struct
4306	xcoff	FileHeader64	struct
4307	xcoff	SectionHeader32	struct
4308	xcoff	SectionHeader64	struct
4309	xcoff	SymEnt32	struct
4310	xcoff	SymEnt64	struct
4311	xcoff	AuxFile64	struct
4312	xcoff	AuxFcn32	struct
4313	xcoff	AuxFcn64	struct
4314	xcoff	AuxSect64	struct
4315	xcoff	AuxCSect32	struct
4316	xcoff	AuxCSect64	struct
4317	xcoff	LoaderHeader32	struct
4318	xcoff	LoaderHeader64	struct
4319	xcoff	LoaderSymbol32	struct
4320	xcoff	LoaderSymbol64	struct
4321	xcoff	Reloc32	struct
4322	xcoff	Reloc64	struct
4323	io	Reader	
4324	io	Writer	
4325	io	Closer	
4326	io	Seeker	
4327	io	ReadWriter	
4328	io	ReadCloser	
4329	io	WriteCloser	
4330	io	ReadWriteCloser	
4331	io	ReadSeeker	
4332	io	WriteSeeker	
4333	io	ReadWriteSeeker	
4334	io	ReaderFrom	
4335	io	WriterTo	
4336	io	ReaderAt	
4337	io	WriterAt	
4338	io	ByteReader	
4339	io	ByteScanner	
4340	io	ByteWriter	
4341	io	RuneReader	
4342	io	RuneScanner	
4343	io	StringWriter	
4344	io	LimitedReader	struct
4345	io	SectionReader	struct
4346	io	PipeReader	struct
4347	io	PipeWriter	struct
4348	log	Logger	struct
4349	syslog	Priority	int
4350	syslog	Writer	struct
4351	big	Word	uint
4352	big	Float	struct
4353	big	ErrNaN	struct
4354	big	RoundingMode	byte
4355	big	Accuracy	int8
4356	big	Int	struct
4357	big	Rat	struct
4358	rand	Source	
4359	rand	Source64	
4360	rand	Rand	struct
4361	rand	Zipf	struct
4362	mime	WordEncoder	byte
4363	mime	WordDecoder	struct
4364	multipart	Form	struct
4365	multipart	FileHeader	struct
4366	multipart	File	
4367	multipart	Part	struct
4368	multipart	Reader	struct
4369	multipart	Writer	struct
4370	quotedprintable	Reader	struct
4371	quotedprintable	Writer	struct
4372	net	Dialer	struct
4373	net	ListenConfig	struct
4374	net	SRV	struct
4375	net	MX	struct
4376	net	NS	struct
4377	cgi	Handler	struct
4378	http	Client	struct
4379	http	RoundTripper	
4380	http	Cookie	struct
4381	http	SameSite	int
4382	cookiejar	PublicSuffixList	
4383	cookiejar	Options	struct
4384	cookiejar	Jar	struct
4385	http	Dir	string
4386	http	FileSystem	
4387	http	File	
4388	http	I	
4389	http	Header	map[string][]string
4390	http	PushOptions	struct
4391	http	Pusher	
4392	httptest	ResponseRecorder	struct
4393	httptest	Server	struct
4394	httptrace	ClientTrace	struct
4395	httptrace	WroteRequestInfo	struct
4396	httptrace	DNSStartInfo	struct
4397	httptrace	DNSDoneInfo	struct
4398	httptrace	GotConnInfo	struct
4399	httputil	ServerConn	struct
4400	httputil	ClientConn	struct
4401	httputil	ReverseProxy	struct
4402	httputil	BufferPool	
4403	internal	FlushAfterChunkWriter	struct
4404	http	CookieJar	
4405	http	ProtocolError	struct
4406	http	Request	struct
4407	http	Response	struct
4408	http	Handler	
4409	http	ResponseWriter	
4410	http	Flusher	
4411	http	Hijacker	
4412	http	CloseNotifier	
4413	http	HandlerFunc	func(http.ResponseWriter, *http.Request)
4414	http	ServeMux	struct
4415	http	Server	struct
4416	http	ConnState	int
4417	http	Transport	struct
4418	main	Counter	struct
4419	main	Chan	chan int\n
4420	net	Interface	struct
4421	net	Flags	uint
4422	socktest	Switch	struct
4423	socktest	Cookie	uint64
4424	socktest	Status	struct
4425	socktest	Stat	struct
4426	socktest	FilterType	int
4427	socktest	Filter	func(*socktest.Status) (socktest.AfterFilter, error)
4428	socktest	AfterFilter	func(*socktest.Status) error
4429	socktest	Sockets	map[int]socktest.Status
4430	socktest	Sockets	map[int]socktest.Status
4431	socktest	Sockets	map[syscall.Handle]socktest.Status
4432	net	IP	[]byte
4433	net	IPMask	[]byte
4434	net	IPNet	struct
4435	net	IPAddr	struct
4436	net	IPConn	struct
4437	net	Resolver	struct
4438	net	HardwareAddr	[]byte
4439	mail	Message	struct
4440	mail	Header	map[string][]string
4441	mail	Address	struct
4442	mail	AddressParser	struct
4443	net	Addr	
4444	net	Conn	
4445	net	PacketConn	
4446	net	Listener	
4447	net	Error	
4448	net	OpError	struct
4449	net	ParseError	struct
4450	net	AddrError	struct
4451	net	UnknownNetworkError	string
4452	net	InvalidAddrError	string
4453	net	DNSConfigError	struct
4454	net	DNSError	struct
4455	net	Buffers	[][]byte
4456	rpc	ServerError	string
4457	rpc	Call	struct
4458	rpc	Client	struct
4459	rpc	ClientCodec	
4460	rpc	Request	struct
4461	rpc	Response	struct
4462	rpc	Server	struct
4463	rpc	ServerCodec	
4464	smtp	Auth	
4465	smtp	ServerInfo	struct
4466	smtp	Client	struct
4467	net	TCPAddr	struct
4468	net	TCPConn	struct
4469	net	TCPListener	struct
4470	textproto	MIMEHeader	map[string][]string
4471	textproto	Pipeline	struct
4472	textproto	Reader	struct
4473	textproto	Error	struct
4474	textproto	ProtocolError	string
4475	textproto	Conn	struct
4476	textproto	Writer	struct
4477	net	UDPAddr	struct
4478	net	UDPConn	struct
4479	net	UnixAddr	struct
4480	net	UnixConn	struct
4481	net	UnixListener	struct
4482	url	Error	struct
4483	url	EscapeError	string
4484	url	InvalidHostError	string
4485	url	URL	struct
4486	url	Userinfo	struct
4487	url	Values	map[string][]string
4488	os	PathError	struct
4489	os	SyscallError	struct
4490	exec	Error	struct
4491	exec	Cmd	struct
4492	exec	F	func(*exec.Cmd) (*os.File, error)
4493	exec	ExitError	struct
4494	os	Process	struct
4495	os	ProcAttr	struct
4496	os	Signal	
4497	os	ProcessState	struct
4498	os	ProcessState	struct
4499	os	LinkError	struct
4500	pty	PtyError	struct
4501	os	File	struct
4502	os	FileInfo	
4503	os	FileMode	uint32
4504	user	User	struct
4505	user	Group	struct
4506	user	UnknownUserIdError	int
4507	user	UnknownUserError	string
4508	user	UnknownGroupIdError	string
4509	user	UnknownGroupError	string
4510	filepath	WalkFunc	func(string, os.FileInfo, error) error
4511	plugin	Plugin	struct
4512	plugin	Symbol	interface{}
4513	reflect	Type	
4514	reflect	Kind	uint
4515	reflect	ChanDir	int
4516	reflect	Method	struct
4517	reflect	StructField	struct
4518	reflect	StructTag	string
4519	reflect	Value	struct
4520	reflect	ValueError	struct
4521	reflect	MapIter	struct
4522	reflect	StringHeader	struct
4523	reflect	SliceHeader	struct
4524	reflect	SelectDir	int
4525	reflect	SelectCase	struct
4526	regexp	Regexp	struct
4527	syntax	Error	struct
4528	syntax	ErrorCode	string
4529	syntax	Flags	uint16
4530	syntax	Prog	struct
4531	syntax	InstOp	uint8
4532	syntax	EmptyOp	uint8
4533	syntax	Inst	struct
4534	syntax	Regexp	struct
4535	syntax	Op	uint8
4536	debug	GCStats	struct
4537	debug	BuildInfo	struct
4538	debug	Module	struct
4539	runtime	Usigset	C.__sigset_t
4540	runtime	Fpxreg	C.struct__libc_fpxreg
4541	runtime	Xmmreg	C.struct__libc_xmmreg
4542	runtime	Fpstate	C.struct__libc_fpstate
4543	runtime	Fpxreg1	C.struct__fpxreg
4544	runtime	Xmmreg1	C.struct__xmmreg
4545	runtime	Fpstate1	C.struct__fpstate
4546	runtime	Fpreg1	C.struct__fpreg
4547	runtime	StackT	C.stack_t
4548	runtime	Mcontext	C.mcontext_t
4549	runtime	Ucontext	C.ucontext_t
4550	runtime	Sigcontext	C.struct_sigcontext
4551	runtime	Fpreg	C.struct__fpreg
4552	runtime	Fpxreg	C.struct__fpxreg
4553	runtime	Xmmreg	C.struct__xmmreg
4554	runtime	Fpstate	C.struct__fpstate
4555	runtime	Timespec	C.struct_timespec
4556	runtime	Timeval	C.struct_timeval
4557	runtime	Sigaction	C.struct_kernel_sigaction
4558	runtime	Siginfo	C.siginfo_t
4559	runtime	StackT	C.stack_t
4560	runtime	Sigcontext	C.struct_sigcontext
4561	runtime	Ucontext	C.struct_ucontext
4562	runtime	Itimerval	C.struct_itimerval
4563	runtime	EpollEvent	C.struct_epoll_event
4564	runtime	Usigset	C.__sigset_t
4565	runtime	Ptregs	C.struct_pt_regs
4566	runtime	Gregset	C.elf_gregset_t
4567	runtime	FPregset	C.elf_fpregset_t
4568	runtime	Vreg	C.elf_vrreg_t
4569	runtime	StackT	C.stack_t
4570	runtime	Sigcontext	C.struct_sigcontext
4571	runtime	Ucontext	C.struct_ucontext
4572	runtime	Timespec	C.struct_timespec
4573	runtime	StackT	C.stack_t
4574	runtime	Sigcontext	C.struct_sigcontext
4575	runtime	Ucontext	C.struct_ucontext
4576	runtime	Timeval	C.struct_timeval
4577	runtime	Itimerval	C.struct_itimerval
4578	runtime	Siginfo	C.struct_xsiginfo
4579	runtime	Sigaction	C.struct_xsigaction
4580	runtime	StackT	C.struct_sigaltstack
4581	runtime	Sighandler	C.union___sigaction_u
4582	runtime	Sigaction	C.struct___sigaction
4583	runtime	Usigaction	C.struct_sigaction
4584	runtime	Sigset	C.sigset_t
4585	runtime	Sigval	C.union_sigval
4586	runtime	Siginfo	C.siginfo_t
4587	runtime	Timeval	C.struct_timeval
4588	runtime	Itimerval	C.struct_itimerval
4589	runtime	Timespec	C.struct_timespec
4590	runtime	FPControl	C.struct_fp_control
4591	runtime	FPStatus	C.struct_fp_status
4592	runtime	RegMMST	C.struct_mmst_reg
4593	runtime	RegXMM	C.struct_xmm_reg
4594	runtime	Regs64	C.struct_x86_thread_state64
4595	runtime	FloatState64	C.struct_x86_float_state64
4596	runtime	ExceptionState64	C.struct_x86_exception_state64
4597	runtime	Mcontext64	C.struct_mcontext64
4598	runtime	Regs32	C.struct_i386_thread_state
4599	runtime	FloatState32	C.struct_i386_float_state
4600	runtime	ExceptionState32	C.struct_i386_exception_state
4601	runtime	Mcontext32	C.struct_mcontext32
4602	runtime	Ucontext	C.struct_ucontext
4603	runtime	Kevent	C.struct_kevent
4604	runtime	Pthread	C.pthread_t
4605	runtime	PthreadAttr	C.pthread_attr_t
4606	runtime	PthreadMutex	C.pthread_mutex_t
4607	runtime	PthreadMutexAttr	C.pthread_mutexattr_t
4608	runtime	PthreadCond	C.pthread_cond_t
4609	runtime	PthreadCondAttr	C.pthread_condattr_t
4610	runtime	MachTimebaseInfo	C.mach_timebase_info_data_t
4611	runtime	Rtprio	C.struct_rtprio
4612	runtime	Lwpparams	C.struct_lwp_params
4613	runtime	Sigset	C.struct___sigset
4614	runtime	StackT	C.stack_t
4615	runtime	Siginfo	C.siginfo_t
4616	runtime	Mcontext	C.mcontext_t
4617	runtime	Ucontext	C.ucontext_t
4618	runtime	Timespec	C.struct_timespec
4619	runtime	Timeval	C.struct_timeval
4620	runtime	Itimerval	C.struct_itimerval
4621	runtime	Kevent	C.struct_kevent
4622	runtime	Rtprio	C.struct_rtprio
4623	runtime	ThrParam	C.struct_thr_param
4624	runtime	Sigset	C.struct___sigset
4625	runtime	StackT	C.stack_t
4626	runtime	Siginfo	C.siginfo_t
4627	runtime	Mcontext	C.mcontext_t
4628	runtime	Ucontext	C.ucontext_t
4629	runtime	Timespec	C.struct_timespec
4630	runtime	Timeval	C.struct_timeval
4631	runtime	Itimerval	C.struct_itimerval
4632	runtime	Umtx_time	C.struct__umtx_time
4633	runtime	Kevent	C.struct_kevent_freebsd11
4634	runtime	Sigset	C.sigset_t
4635	runtime	Timespec	C.struct_timespec
4636	runtime	Timeval	C.struct_timeval
4637	runtime	Sigaction	C.struct_sigaction
4638	runtime	Siginfo	C.siginfo_t
4639	runtime	Itimerval	C.struct_itimerval
4640	runtime	EpollEvent	C.struct_epoll_event
4641	runtime	Sigset	C.sigset_t
4642	runtime	Siginfo	C.struct__ksiginfo
4643	runtime	StackT	C.stack_t
4644	runtime	Timespec	C.struct_timespec
4645	runtime	Timeval	C.struct_timeval
4646	runtime	Itimerval	C.struct_itimerval
4647	runtime	McontextT	C.mcontext_t
4648	runtime	UcontextT	C.ucontext_t
4649	runtime	Kevent	C.struct_kevent
4650	runtime	TforkT	C.struct___tfork
4651	runtime	Sigcontext	C.struct_sigcontext
4652	runtime	Siginfo	C.siginfo_t
4653	runtime	Sigset	C.sigset_t
4654	runtime	Sigval	C.union_sigval
4655	runtime	StackT	C.stack_t
4656	runtime	Timespec	C.struct_timespec
4657	runtime	Timeval	C.struct_timeval
4658	runtime	Itimerval	C.struct_itimerval
4659	runtime	KeventT	C.struct_kevent
4660	runtime	SemT	C.sem_t
4661	runtime	Sigset	C.sigset_t
4662	runtime	StackT	C.stack_t
4663	runtime	Siginfo	C.siginfo_t
4664	runtime	Sigaction	C.struct_sigaction
4665	runtime	Fpregset	C.fpregset_t
4666	runtime	Mcontext	C.mcontext_t
4667	runtime	Ucontext	C.ucontext_t
4668	runtime	Timespec	C.struct_timespec
4669	runtime	Timeval	C.struct_timeval
4670	runtime	Itimerval	C.struct_itimerval
4671	runtime	PortEvent	C.port_event_t
4672	runtime	Pthread	C.pthread_t
4673	runtime	PthreadAttr	C.pthread_attr_t
4674	runtime	Stat	C.struct_stat
4675	runtime	SystemInfo	C.SYSTEM_INFO
4676	runtime	ExceptionRecord	C.EXCEPTION_RECORD
4677	runtime	FloatingSaveArea	C.FLOATING_SAVE_AREA
4678	runtime	M128a	C.M128A
4679	runtime	Context	C.CONTEXT
4680	runtime	Overlapped	C.OVERLAPPED
4681	runtime	MemoryBasicInformation	C.MEMORY_BASIC_INFORMATION
4682	runtime	Error	
4683	runtime	TypeAssertionError	struct
4684	sys	ArchFamilyType	int
4685	sys	Uintreg	uint32
4686	sys	Uintreg	uint64
4687	sys	Uintreg	uint64
4688	sys	Uintreg	uint32
4689	sys	Uintreg	uint64
4690	sys	Uintreg	uint32
4691	sys	Uintreg	uint64
4692	sys	Uintreg	uint64
4693	sys	Uintreg	uint32
4694	sys	Uintreg	uint64
4695	sys	Uintreg	uint64
4696	sys	Uintreg	uint64
4697	sys	Uintreg	uint64
4698	runtime	StackRecord	struct
4699	runtime	MemProfileRecord	struct
4700	runtime	BlockProfileRecord	struct
4701	runtime	MemStats	struct
4702	profile	TagMatch	func(string, int64) bool
4703	profile	Profile	struct
4704	profile	ValueType	struct
4705	profile	Sample	struct
4706	profile	Label	struct
4707	profile	Mapping	struct
4708	profile	Location	struct
4709	profile	Line	struct
4710	profile	Function	struct
4711	profile	Demangler	func([]string) (map[string]string, error)
4712	pprof	LabelSet	struct
4713	pprof	Profile	struct
4714	runtime	Frames	struct
4715	runtime	Frame	struct
4716	runtime	Func	struct
4717	main	P	string
4718	trace	Task	struct
4719	trace	Region	struct
4720	sort	Interface	
4721	sort	IntSlice	[]int
4722	sort	Float64Slice	[]float64
4723	sort	StringSlice	[]string
4724	strconv	NumError	struct
4725	strings	Builder	struct
4726	strings	Reader	struct
4727	strings	Replacer	struct
4728	atomic	Value	struct
4729	sync	Cond	struct
4730	sync	Map	struct
4731	sync	Mutex	struct
4732	sync	Locker	
4733	sync	Once	struct
4734	sync	Pool	struct
4735	sync	RWMutex	struct
4736	sync	WaitGroup	struct
4737	syscall	Qid	struct
4738	syscall	Dir	struct
4739	syscall	DLLError	struct
4740	syscall	DLL	struct
4741	syscall	Proc	struct
4742	syscall	LazyDLL	struct
4743	syscall	LazyProc	struct
4744	syscall	SysProcAttr	struct
4745	syscall	SysProcAttr	struct
4746	syscall	SysProcAttr	struct
4747	syscall	SysProcIDMap	struct
4748	syscall	SysProcAttr	struct
4749	syscall	ProcAttr	struct
4750	syscall	SysProcAttr	struct
4751	syscall	Credential	struct
4752	syscall	ProcAttr	struct
4753	syscall	ProcAttr	struct
4754	syscall	SysProcAttr	struct
4755	js	Func	struct
4756	js	Wrapper	
4757	js	Value	struct
4758	js	Error	struct
4759	js	Type	int
4760	js	ValueError	struct
4761	syscall	RawConn	
4762	syscall	Conn	
4763	syscall	Sockaddr	interface{}
4764	syscall	SockaddrInet4	struct
4765	syscall	SockaddrInet6	struct
4766	syscall	SockaddrUnix	struct
4767	syscall	Sockaddr	
4768	syscall	SockaddrInet4	struct
4769	syscall	SockaddrInet6	struct
4770	syscall	SockaddrUnix	struct
4771	syscall	SockaddrDatalink	struct
4772	syscall	RoutingMessage	
4773	syscall	IPMreq	struct
4774	syscall	IPv6Mreq	struct
4775	syscall	Linger	struct
4776	syscall	ICMPv6Filter	struct
4777	syscall	NetlinkRouteRequest	struct
4778	syscall	NetlinkMessage	struct
4779	syscall	NetlinkRouteAttr	struct
4780	syscall	RoutingMessage	
4781	syscall	RouteMessage	struct
4782	syscall	InterfaceMessage	struct
4783	syscall	InterfaceAddrMessage	struct
4784	syscall	InterfaceMulticastAddrMessage	struct
4785	syscall	InterfaceAnnounceMessage	struct
4786	syscall	InterfaceMulticastAddrMessage	struct
4787	syscall	InterfaceAnnounceMessage	struct
4788	syscall	InterfaceMulticastAddrMessage	struct
4789	syscall	InterfaceAnnounceMessage	struct
4790	syscall	InterfaceAnnounceMessage	struct
4791	syscall	UserInfo10	struct
4792	syscall	SID	struct
4793	syscall	SIDAndAttributes	struct
4794	syscall	Tokenuser	struct
4795	syscall	Tokenprimarygroup	struct
4796	syscall	Token	syscall.Handle
4797	syscall	SocketControlMessage	struct
4798	syscall	SockaddrDatalink	struct
4799	syscall	WaitStatus	uint32
4800	syscall	WaitStatus	uint32
4801	syscall	SockaddrDatalink	struct
4802	syscall	SockaddrDatalink	struct
4803	syscall	SockaddrDatalink	struct
4804	syscall	Dirent	struct
4805	syscall	Errno	uintptr
4806	syscall	Signal	int
4807	syscall	Stat_t	struct
4808	syscall	WaitStatus	uint32
4809	syscall	Rusage	struct
4810	syscall	ProcAttr	struct
4811	syscall	SysProcAttr	struct
4812	syscall	Iovec	struct
4813	syscall	Timespec	struct
4814	syscall	Timeval	struct
4815	syscall	WaitStatus	uint32
4816	syscall	SockaddrLinklayer	struct
4817	syscall	SockaddrNetlink	struct
4818	syscall	Dirent	struct
4819	syscall	Errno	uintptr
4820	syscall	Signal	int
4821	syscall	Stat_t	struct
4822	syscall	WaitStatus	uint32
4823	syscall	Rusage	struct
4824	syscall	ProcAttr	struct
4825	syscall	SysProcAttr	struct
4826	syscall	Iovec	struct
4827	syscall	Timespec	struct
4828	syscall	Timeval	struct
4829	syscall	Timespec	struct
4830	syscall	Timeval	struct
4831	syscall	Timespec	struct
4832	syscall	Timeval	struct
4833	syscall	SockaddrDatalink	struct
4834	syscall	SockaddrDatalink	struct
4835	syscall	ErrorString	string
4836	syscall	Note	string
4837	syscall	Waitmsg	struct
4838	syscall	Timespec	struct
4839	syscall	Timeval	struct
4840	syscall	SockaddrDatalink	struct
4841	syscall	WaitStatus	uint32
4842	syscall	Errno	uintptr
4843	syscall	Signal	int
4844	syscall	Sockaddr	
4845	syscall	SockaddrInet4	struct
4846	syscall	SockaddrInet6	struct
4847	syscall	SockaddrUnix	struct
4848	syscall	Handle	uintptr
4849	syscall	Errno	uintptr
4850	syscall	RawSockaddrInet4	struct
4851	syscall	RawSockaddrInet6	struct
4852	syscall	RawSockaddr	struct
4853	syscall	RawSockaddrAny	struct
4854	syscall	Sockaddr	
4855	syscall	SockaddrInet4	struct
4856	syscall	SockaddrInet6	struct
4857	syscall	RawSockaddrUnix	struct
4858	syscall	SockaddrUnix	struct
4859	syscall	Rusage	struct
4860	syscall	WaitStatus	struct
4861	syscall	Timespec	struct
4862	syscall	Linger	struct
4863	syscall	IPMreq	struct
4864	syscall	IPv6Mreq	struct
4865	syscall	Signal	int
4866	syscall	Timespec	C.struct_timespec
4867	syscall	Timeval	C.struct_timeval
4868	syscall	Timeval32	C.struct_timeval32
4869	syscall	Timezone	C.struct_timezone
4870	syscall	Rusage	C.struct_rusage
4871	syscall	Rlimit	C.struct_rlimit
4872	syscall	Flock_t	C.struct_flock
4873	syscall	Stat_t	C.struct_stat
4874	syscall	Statfs_t	C.struct_statfs
4875	syscall	Fsid64_t	C.fsid64_t
4876	syscall	StTimespec_t	C.st_timespec_t
4877	syscall	Dirent	C.struct_dirent
4878	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4879	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4880	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4881	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4882	syscall	RawSockaddr	C.struct_sockaddr
4883	syscall	RawSockaddrAny	C.struct_sockaddr_any
4884	syscall	Cmsghdr	C.struct_cmsghdr
4885	syscall	ICMPv6Filter	C.struct_icmp6_filter
4886	syscall	Iovec	C.struct_iovec
4887	syscall	IPMreq	C.struct_ip_mreq
4888	syscall	IPv6Mreq	C.struct_ipv6_mreq
4889	syscall	Linger	C.struct_linger
4890	syscall	Msghdr	C.struct_msghdr
4891	syscall	IfMsgHdr	C.struct_if_msghdr
4892	syscall	Utsname	C.struct_utsname
4893	syscall	Termios	C.struct_termios
4894	syscall	Timespec	C.struct_timespec
4895	syscall	Timeval	C.struct_timeval
4896	syscall	Timeval32	C.struct_timeval32
4897	syscall	Rusage	C.struct_rusage
4898	syscall	Rlimit	C.struct_rlimit
4899	syscall	Stat_t	C.struct_stat64
4900	syscall	Statfs_t	C.struct_statfs64
4901	syscall	Flock_t	C.struct_flock
4902	syscall	Fstore_t	C.struct_fstore
4903	syscall	Radvisory_t	C.struct_radvisory
4904	syscall	Fbootstraptransfer_t	C.struct_fbootstraptransfer
4905	syscall	Log2phys_t	C.struct_log2phys
4906	syscall	Fsid	C.struct_fsid
4907	syscall	Dirent	C.struct_dirent
4908	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4909	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4910	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4911	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4912	syscall	RawSockaddr	C.struct_sockaddr
4913	syscall	RawSockaddrAny	C.struct_sockaddr_any
4914	syscall	Linger	C.struct_linger
4915	syscall	Iovec	C.struct_iovec
4916	syscall	IPMreq	C.struct_ip_mreq
4917	syscall	IPv6Mreq	C.struct_ipv6_mreq
4918	syscall	Msghdr	C.struct_msghdr
4919	syscall	Cmsghdr	C.struct_cmsghdr
4920	syscall	Inet4Pktinfo	C.struct_in_pktinfo
4921	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4922	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4923	syscall	ICMPv6Filter	C.struct_icmp6_filter
4924	syscall	Kevent_t	C.struct_kevent
4925	syscall	FdSet	C.fd_set
4926	syscall	IfMsghdr	C.struct_if_msghdr
4927	syscall	IfData	C.struct_if_data
4928	syscall	IfaMsghdr	C.struct_ifa_msghdr
4929	syscall	IfmaMsghdr	C.struct_ifma_msghdr
4930	syscall	IfmaMsghdr2	C.struct_ifma_msghdr2
4931	syscall	RtMsghdr	C.struct_rt_msghdr
4932	syscall	RtMetrics	C.struct_rt_metrics
4933	syscall	BpfVersion	C.struct_bpf_version
4934	syscall	BpfStat	C.struct_bpf_stat
4935	syscall	BpfProgram	C.struct_bpf_program
4936	syscall	BpfInsn	C.struct_bpf_insn
4937	syscall	BpfHdr	C.struct_bpf_hdr
4938	syscall	Termios	C.struct_termios
4939	syscall	Timespec	C.struct_timespec
4940	syscall	Timeval	C.struct_timeval
4941	syscall	Rusage	C.struct_rusage
4942	syscall	Rlimit	C.struct_rlimit
4943	syscall	Stat_t	C.struct_stat
4944	syscall	Statfs_t	C.struct_statfs
4945	syscall	Flock_t	C.struct_flock
4946	syscall	Dirent	C.struct_dirent
4947	syscall	Fsid	C.struct_fsid
4948	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4949	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4950	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4951	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4952	syscall	RawSockaddr	C.struct_sockaddr
4953	syscall	RawSockaddrAny	C.struct_sockaddr_any
4954	syscall	Linger	C.struct_linger
4955	syscall	Iovec	C.struct_iovec
4956	syscall	IPMreq	C.struct_ip_mreq
4957	syscall	IPv6Mreq	C.struct_ipv6_mreq
4958	syscall	Msghdr	C.struct_msghdr
4959	syscall	Cmsghdr	C.struct_cmsghdr
4960	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4961	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4962	syscall	ICMPv6Filter	C.struct_icmp6_filter
4963	syscall	Kevent_t	C.struct_kevent
4964	syscall	FdSet	C.fd_set
4965	syscall	IfMsghdr	C.struct_if_msghdr
4966	syscall	IfData	C.struct_if_data
4967	syscall	IfaMsghdr	C.struct_ifa_msghdr
4968	syscall	IfmaMsghdr	C.struct_ifma_msghdr
4969	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
4970	syscall	RtMsghdr	C.struct_rt_msghdr
4971	syscall	RtMetrics	C.struct_rt_metrics
4972	syscall	BpfVersion	C.struct_bpf_version
4973	syscall	BpfStat	C.struct_bpf_stat
4974	syscall	BpfProgram	C.struct_bpf_program
4975	syscall	BpfInsn	C.struct_bpf_insn
4976	syscall	BpfHdr	C.struct_bpf_hdr
4977	syscall	Termios	C.struct_termios
4978	syscall	Timespec	C.struct_timespec
4979	syscall	Timeval	C.struct_timeval
4980	syscall	Rusage	C.struct_rusage
4981	syscall	Rlimit	C.struct_rlimit
4982	syscall	Stat_t	C.struct_stat
4983	syscall	Statfs_t	C.struct_statfs
4984	syscall	Flock_t	C.struct_flock
4985	syscall	Dirent	C.struct_dirent
4986	syscall	Fsid	C.struct_fsid
4987	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4988	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4989	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4990	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4991	syscall	RawSockaddr	C.struct_sockaddr
4992	syscall	RawSockaddrAny	C.struct_sockaddr_any
4993	syscall	Linger	C.struct_linger
4994	syscall	Iovec	C.struct_iovec
4995	syscall	IPMreq	C.struct_ip_mreq
4996	syscall	IPMreqn	C.struct_ip_mreqn
4997	syscall	IPv6Mreq	C.struct_ipv6_mreq
4998	syscall	Msghdr	C.struct_msghdr
4999	syscall	Cmsghdr	C.struct_cmsghdr
5000	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
5001	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
5002	syscall	ICMPv6Filter	C.struct_icmp6_filter
5003	syscall	Kevent_t	C.struct_kevent_freebsd11
5004	syscall	FdSet	C.fd_set
5005	syscall	IfMsghdr	C.struct_if_msghdr8
5006	syscall	IfData	C.struct_if_data8
5007	syscall	IfaMsghdr	C.struct_ifa_msghdr
5008	syscall	IfmaMsghdr	C.struct_ifma_msghdr
5009	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
5010	syscall	RtMsghdr	C.struct_rt_msghdr
5011	syscall	RtMetrics	C.struct_rt_metrics
5012	syscall	BpfVersion	C.struct_bpf_version
5013	syscall	BpfStat	C.struct_bpf_stat
5014	syscall	BpfZbuf	C.struct_bpf_zbuf
5015	syscall	BpfProgram	C.struct_bpf_program
5016	syscall	BpfInsn	C.struct_bpf_insn
5017	syscall	BpfHdr	C.struct_bpf_hdr
5018	syscall	BpfZbufHeader	C.struct_bpf_zbuf_header
5019	syscall	Termios	C.struct_termios
5020	syscall	Timespec	C.struct_timespec
5021	syscall	Timeval	C.struct_timeval
5022	syscall	Timex	C.struct_timex
5023	syscall	Time_t	C.time_t
5024	syscall	Tms	C.struct_tms
5025	syscall	Utimbuf	C.struct_utimbuf
5026	syscall	Rusage	C.struct_rusage
5027	syscall	Rlimit	C.struct_rlimit
5028	syscall	Stat_t	C.struct_stat
5029	syscall	Statfs_t	C.struct_statfs
5030	syscall	Dirent	C.struct_dirent
5031	syscall	Fsid	C.fsid_t
5032	syscall	Flock_t	C.struct_flock
5033	syscall	RawSockaddrInet4	C.struct_sockaddr_in
5034	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
5035	syscall	RawSockaddrUnix	C.struct_my_sockaddr_un
5036	syscall	RawSockaddrLinklayer	C.struct_sockaddr_ll
5037	syscall	RawSockaddrNetlink	C.struct_sockaddr_nl
5038	syscall	RawSockaddr	C.struct_sockaddr
5039	syscall	RawSockaddrAny	C.struct_sockaddr_any
5040	syscall	Linger	C.struct_linger
5041	syscall	Iovec	C.struct_iovec
5042	syscall	IPMreq	C.struct_ip_mreq
5043	syscall	IPMreqn	C.struct_ip_mreqn
5044	syscall	IPv6Mreq	C.struct_ipv6_mreq
5045	syscall	Msghdr	C.struct_msghdr
5046	syscall	Cmsghdr	C.struct_cmsghdr
5047	syscall	Inet4Pktinfo	C.struct_in_pktinfo
5048	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
5049	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
5050	syscall	ICMPv6Filter	C.struct_icmp6_filter
5051	syscall	Ucred	C.struct_ucred
5052	syscall	TCPInfo	C.struct_tcp_info
5053	syscall	NlMsghdr	C.struct_nlmsghdr
5054	syscall	NlMsgerr	C.struct_nlmsgerr
5055	syscall	RtGenmsg	C.struct_rtgenmsg
5056	syscall	NlAttr	C.struct_nlattr
5057	syscall	RtAttr	C.struct_rtattr
5058	syscall	IfInfomsg	C.struct_ifinfomsg
5059	syscall	IfAddrmsg	C.struct_ifaddrmsg
5060	syscall	RtMsg	C.struct_rtmsg
5061	syscall	RtNexthop	C.struct_rtnexthop
5062	syscall	SockFilter	C.struct_sock_filter
5063	syscall	SockFprog	C.struct_sock_fprog
5064	syscall	InotifyEvent	C.struct_inotify_event
5065	syscall	PtraceRegs	C.PtraceRegs
5066	syscall	FdSet	C.fd_set
5067	syscall	Sysinfo_t	C.struct_sysinfo
5068	syscall	Utsname	C.struct_utsname
5069	syscall	Ustat_t	C.struct_ustat
5070	syscall	EpollEvent	C.struct_my_epoll_event
5071	syscall	Termios	C.struct_termios
5072	syscall	Timespec	C.struct_timespec
5073	syscall	Timeval	C.struct_timeval
5074	syscall	Rusage	C.struct_rusage
5075	syscall	Rlimit	C.struct_rlimit
5076	syscall	Stat_t	C.struct_stat
5077	syscall	Statfs_t	C.struct_statfs
5078	syscall	Flock_t	C.struct_flock
5079	syscall	Dirent	C.struct_dirent
5080	syscall	Fsid	C.fsid_t
5081	syscall	RawSockaddrInet4	C.struct_sockaddr_in
5082	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
5083	syscall	RawSockaddrUnix	C.struct_sockaddr_un
5084	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
5085	syscall	RawSockaddr	C.struct_sockaddr
5086	syscall	RawSockaddrAny	C.struct_sockaddr_any
5087	syscall	Linger	C.struct_linger
5088	syscall	Iovec	C.struct_iovec
5089	syscall	IPMreq	C.struct_ip_mreq
5090	syscall	IPv6Mreq	C.struct_ipv6_mreq
5091	syscall	Msghdr	C.struct_msghdr
5092	syscall	Cmsghdr	C.struct_cmsghdr
5093	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
5094	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
5095	syscall	ICMPv6Filter	C.struct_icmp6_filter
5096	syscall	Kevent_t	C.struct_kevent
5097	syscall	FdSet	C.fd_set
5098	syscall	IfMsghdr	C.struct_if_msghdr
5099	syscall	IfData	C.struct_if_data
5100	syscall	IfaMsghdr	C.struct_ifa_msghdr
5101	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
5102	syscall	RtMsghdr	C.struct_rt_msghdr
5103	syscall	RtMetrics	C.struct_rt_metrics
5104	syscall	Mclpool	C.struct_mclpool
5105	syscall	BpfVersion	C.struct_bpf_version
5106	syscall	BpfStat	C.struct_bpf_stat
5107	syscall	BpfProgram	C.struct_bpf_program
5108	syscall	BpfInsn	C.struct_bpf_insn
5109	syscall	BpfHdr	C.struct_bpf_hdr
5110	syscall	BpfTimeval	C.struct_bpf_timeval
5111	syscall	Termios	C.struct_termios
5112	syscall	Sysctlnode	C.struct_sysctlnode
5113	syscall	Timespec	C.struct_timespec
5114	syscall	Timeval	C.struct_timeval
5115	syscall	Rusage	C.struct_rusage
5116	syscall	Rlimit	C.struct_rlimit
5117	syscall	Stat_t	C.struct_stat
5118	syscall	Statfs_t	C.struct_statfs
5119	syscall	Flock_t	C.struct_flock
5120	syscall	Dirent	C.struct_dirent
5121	syscall	Fsid	C.fsid_t
5122	syscall	RawSockaddrInet4	C.struct_sockaddr_in
5123	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
5124	syscall	RawSockaddrUnix	C.struct_sockaddr_un
5125	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
5126	syscall	RawSockaddr	C.struct_sockaddr
5127	syscall	RawSockaddrAny	C.struct_sockaddr_any
5128	syscall	Linger	C.struct_linger
5129	syscall	Iovec	C.struct_iovec
5130	syscall	IPMreq	C.struct_ip_mreq
5131	syscall	IPv6Mreq	C.struct_ipv6_mreq
5132	syscall	Msghdr	C.struct_msghdr
5133	syscall	Cmsghdr	C.struct_cmsghdr
5134	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
5135	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
5136	syscall	ICMPv6Filter	C.struct_icmp6_filter
5137	syscall	Kevent_t	C.struct_kevent
5138	syscall	FdSet	C.fd_set
5139	syscall	IfMsghdr	C.struct_if_msghdr
5140	syscall	IfData	C.struct_if_data
5141	syscall	IfaMsghdr	C.struct_ifa_msghdr
5142	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
5143	syscall	RtMsghdr	C.struct_rt_msghdr
5144	syscall	RtMetrics	C.struct_rt_metrics
5145	syscall	Mclpool	C.struct_mclpool
5146	syscall	BpfVersion	C.struct_bpf_version
5147	syscall	BpfStat	C.struct_bpf_stat
5148	syscall	BpfProgram	C.struct_bpf_program
5149	syscall	BpfInsn	C.struct_bpf_insn
5150	syscall	BpfHdr	C.struct_bpf_hdr
5151	syscall	BpfTimeval	C.struct_bpf_timeval
5152	syscall	Termios	C.struct_termios
5153	syscall	Timespec	C.struct_timespec
5154	syscall	Timeval	C.struct_timeval
5155	syscall	Timeval32	C.struct_timeval32
5156	syscall	Rusage	C.struct_rusage
5157	syscall	Rlimit	C.struct_rlimit
5158	syscall	Stat_t	C.struct_stat
5159	syscall	Flock_t	C.struct_flock
5160	syscall	Dirent	C.struct_dirent
5161	syscall	RawSockaddrInet4	C.struct_sockaddr_in
5162	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
5163	syscall	RawSockaddrUnix	C.struct_sockaddr_un
5164	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
5165	syscall	RawSockaddr	C.struct_sockaddr
5166	syscall	RawSockaddrAny	C.struct_sockaddr_any
5167	syscall	Linger	C.struct_linger
5168	syscall	Iovec	C.struct_iovec
5169	syscall	IPMreq	C.struct_ip_mreq
5170	syscall	IPv6Mreq	C.struct_ipv6_mreq
5171	syscall	Msghdr	C.struct_msghdr
5172	syscall	Cmsghdr	C.struct_cmsghdr
5173	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
5174	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
5175	syscall	ICMPv6Filter	C.struct_icmp6_filter
5176	syscall	FdSet	C.fd_set
5177	syscall	IfMsghdr	C.struct_if_msghdr
5178	syscall	IfData	C.struct_if_data
5179	syscall	IfaMsghdr	C.struct_ifa_msghdr
5180	syscall	RtMsghdr	C.struct_rt_msghdr
5181	syscall	RtMetrics	C.struct_rt_metrics
5182	syscall	BpfVersion	C.struct_bpf_version
5183	syscall	BpfStat	C.struct_bpf_stat
5184	syscall	BpfProgram	C.struct_bpf_program
5185	syscall	BpfInsn	C.struct_bpf_insn
5186	syscall	BpfTimeval	C.struct_bpf_timeval
5187	syscall	BpfHdr	C.struct_bpf_hdr
5188	syscall	Termios	C.struct_termios
5189	syscall	Pointer	*struct{}
5190	syscall	Timeval	struct
5191	syscall	SecurityAttributes	struct
5192	syscall	Overlapped	struct
5193	syscall	FileNotifyInformation	struct
5194	syscall	Filetime	struct
5195	syscall	Win32finddata	struct
5196	syscall	ByHandleFileInformation	struct
5197	syscall	Win32FileAttributeData	struct
5198	syscall	StartupInfo	struct
5199	syscall	ProcessInformation	struct
5200	syscall	ProcessEntry32	struct
5201	syscall	Systemtime	struct
5202	syscall	Timezoneinformation	struct
5203	syscall	WSABuf	struct
5204	syscall	Hostent	struct
5205	syscall	Protoent	struct
5206	syscall	DNSSRVData	struct
5207	syscall	DNSPTRData	struct
5208	syscall	DNSMXData	struct
5209	syscall	DNSTXTData	struct
5210	syscall	DNSRecord	struct
5211	syscall	TransmitFileBuffers	struct
5212	syscall	SockaddrGen	[]byte
5213	syscall	InterfaceInfo	struct
5214	syscall	IpAddressString	struct
5215	syscall	IpMaskString	syscall.IpAddressString
5216	syscall	IpAddrString	struct
5217	syscall	IpAdapterInfo	struct
5218	syscall	MibIfRow	struct
5219	syscall	CertInfo	struct
5220	syscall	CertContext	struct
5221	syscall	CertChainContext	struct
5222	syscall	CertTrustListInfo	struct
5223	syscall	CertSimpleChain	struct
5224	syscall	CertChainElement	struct
5225	syscall	CertRevocationCrlInfo	struct
5226	syscall	CertRevocationInfo	struct
5227	syscall	CertTrustStatus	struct
5228	syscall	CertUsageMatch	struct
5229	syscall	CertEnhKeyUsage	struct
5230	syscall	CertChainPara	struct
5231	syscall	CertChainPolicyPara	struct
5232	syscall	SSLExtraCertChainPolicyPara	struct
5233	syscall	CertChainPolicyStatus	struct
5234	syscall	AddrinfoW	struct
5235	syscall	GUID	struct
5236	syscall	WSAProtocolInfo	struct
5237	syscall	WSAProtocolChain	struct
5238	syscall	TCPKeepalive	struct
5239	syscall	WSAData	struct
5240	syscall	Servent	struct
5241	syscall	WSAData	struct
5242	syscall	Servent	struct
5243	syscall	WSAData	struct
5244	syscall	Servent	struct
5245	syscall	Timespec	struct
5246	syscall	Timeval	struct
5247	syscall	Timeval32	struct
5248	syscall	Timezone	struct
5249	syscall	Rusage	struct
5250	syscall	Rlimit	struct
5251	syscall	Flock_t	struct
5252	syscall	Stat_t	struct
5253	syscall	Statfs_t	struct
5254	syscall	Fsid64_t	struct
5255	syscall	StTimespec_t	struct
5256	syscall	Dirent	struct
5257	syscall	RawSockaddrInet4	struct
5258	syscall	RawSockaddrInet6	struct
5259	syscall	RawSockaddrUnix	struct
5260	syscall	RawSockaddrDatalink	struct
5261	syscall	RawSockaddr	struct
5262	syscall	RawSockaddrAny	struct
5263	syscall	Cmsghdr	struct
5264	syscall	ICMPv6Filter	struct
5265	syscall	Iovec	struct
5266	syscall	IPMreq	struct
5267	syscall	IPv6Mreq	struct
5268	syscall	Linger	struct
5269	syscall	Msghdr	struct
5270	syscall	IfMsgHdr	struct
5271	syscall	Utsname	struct
5272	syscall	Termios	struct
5273	syscall	Timespec	struct
5274	syscall	Timeval	struct
5275	syscall	Timeval32	[]byte
5276	syscall	Rusage	struct
5277	syscall	Rlimit	struct
5278	syscall	Stat_t	struct
5279	syscall	Statfs_t	struct
5280	syscall	Flock_t	struct
5281	syscall	Fstore_t	struct
5282	syscall	Radvisory_t	struct
5283	syscall	Fbootstraptransfer_t	struct
5284	syscall	Log2phys_t	struct
5285	syscall	Fsid	struct
5286	syscall	Dirent	struct
5287	syscall	RawSockaddrInet4	struct
5288	syscall	RawSockaddrInet6	struct
5289	syscall	RawSockaddrUnix	struct
5290	syscall	RawSockaddrDatalink	struct
5291	syscall	RawSockaddr	struct
5292	syscall	RawSockaddrAny	struct
5293	syscall	Linger	struct
5294	syscall	Iovec	struct
5295	syscall	IPMreq	struct
5296	syscall	IPv6Mreq	struct
5297	syscall	Msghdr	struct
5298	syscall	Cmsghdr	struct
5299	syscall	Inet4Pktinfo	struct
5300	syscall	Inet6Pktinfo	struct
5301	syscall	IPv6MTUInfo	struct
5302	syscall	ICMPv6Filter	struct
5303	syscall	Kevent_t	struct
5304	syscall	FdSet	struct
5305	syscall	IfMsghdr	struct
5306	syscall	IfData	struct
5307	syscall	IfaMsghdr	struct
5308	syscall	IfmaMsghdr	struct
5309	syscall	IfmaMsghdr2	struct
5310	syscall	RtMsghdr	struct
5311	syscall	RtMetrics	struct
5312	syscall	BpfVersion	struct
5313	syscall	BpfStat	struct
5314	syscall	BpfProgram	struct
5315	syscall	BpfInsn	struct
5316	syscall	BpfHdr	struct
5317	syscall	Termios	struct
5318	syscall	Timespec	struct
5319	syscall	Timeval	struct
5320	syscall	Timeval32	struct
5321	syscall	Rusage	struct
5322	syscall	Rlimit	struct
5323	syscall	Stat_t	struct
5324	syscall	Statfs_t	struct
5325	syscall	Flock_t	struct
5326	syscall	Fstore_t	struct
5327	syscall	Radvisory_t	struct
5328	syscall	Fbootstraptransfer_t	struct
5329	syscall	Log2phys_t	struct
5330	syscall	Fsid	struct
5331	syscall	Dirent	struct
5332	syscall	RawSockaddrInet4	struct
5333	syscall	RawSockaddrInet6	struct
5334	syscall	RawSockaddrUnix	struct
5335	syscall	RawSockaddrDatalink	struct
5336	syscall	RawSockaddr	struct
5337	syscall	RawSockaddrAny	struct
5338	syscall	Linger	struct
5339	syscall	Iovec	struct
5340	syscall	IPMreq	struct
5341	syscall	IPv6Mreq	struct
5342	syscall	Msghdr	struct
5343	syscall	Cmsghdr	struct
5344	syscall	Inet4Pktinfo	struct
5345	syscall	Inet6Pktinfo	struct
5346	syscall	IPv6MTUInfo	struct
5347	syscall	ICMPv6Filter	struct
5348	syscall	Kevent_t	struct
5349	syscall	FdSet	struct
5350	syscall	IfMsghdr	struct
5351	syscall	IfData	struct
5352	syscall	IfaMsghdr	struct
5353	syscall	IfmaMsghdr	struct
5354	syscall	IfmaMsghdr2	struct
5355	syscall	RtMsghdr	struct
5356	syscall	RtMetrics	struct
5357	syscall	BpfVersion	struct
5358	syscall	BpfStat	struct
5359	syscall	BpfProgram	struct
5360	syscall	BpfInsn	struct
5361	syscall	BpfHdr	struct
5362	syscall	Termios	struct
5363	syscall	Timespec	struct
5364	syscall	Timeval	struct
5365	syscall	Timeval32	[]byte
5366	syscall	Rusage	struct
5367	syscall	Rlimit	struct
5368	syscall	Stat_t	struct
5369	syscall	Statfs_t	struct
5370	syscall	Flock_t	struct
5371	syscall	Fstore_t	struct
5372	syscall	Radvisory_t	struct
5373	syscall	Fbootstraptransfer_t	struct
5374	syscall	Log2phys_t	struct
5375	syscall	Fsid	struct
5376	syscall	Dirent	struct
5377	syscall	RawSockaddrInet4	struct
5378	syscall	RawSockaddrInet6	struct
5379	syscall	RawSockaddrUnix	struct
5380	syscall	RawSockaddrDatalink	struct
5381	syscall	RawSockaddr	struct
5382	syscall	RawSockaddrAny	struct
5383	syscall	Linger	struct
5384	syscall	Iovec	struct
5385	syscall	IPMreq	struct
5386	syscall	IPv6Mreq	struct
5387	syscall	Msghdr	struct
5388	syscall	Cmsghdr	struct
5389	syscall	Inet4Pktinfo	struct
5390	syscall	Inet6Pktinfo	struct
5391	syscall	IPv6MTUInfo	struct
5392	syscall	ICMPv6Filter	struct
5393	syscall	Kevent_t	struct
5394	syscall	FdSet	struct
5395	syscall	IfMsghdr	struct
5396	syscall	IfData	struct
5397	syscall	IfaMsghdr	struct
5398	syscall	IfmaMsghdr	struct
5399	syscall	IfmaMsghdr2	struct
5400	syscall	RtMsghdr	struct
5401	syscall	RtMetrics	struct
5402	syscall	BpfVersion	struct
5403	syscall	BpfStat	struct
5404	syscall	BpfProgram	struct
5405	syscall	BpfInsn	struct
5406	syscall	BpfHdr	struct
5407	syscall	Termios	struct
5408	syscall	Timespec	struct
5409	syscall	Timeval	struct
5410	syscall	Timeval32	struct
5411	syscall	Rusage	struct
5412	syscall	Rlimit	struct
5413	syscall	Stat_t	struct
5414	syscall	Statfs_t	struct
5415	syscall	Flock_t	struct
5416	syscall	Fstore_t	struct
5417	syscall	Radvisory_t	struct
5418	syscall	Fbootstraptransfer_t	struct
5419	syscall	Log2phys_t	struct
5420	syscall	Fsid	struct
5421	syscall	Dirent	struct
5422	syscall	RawSockaddrInet4	struct
5423	syscall	RawSockaddrInet6	struct
5424	syscall	RawSockaddrUnix	struct
5425	syscall	RawSockaddrDatalink	struct
5426	syscall	RawSockaddr	struct
5427	syscall	RawSockaddrAny	struct
5428	syscall	Linger	struct
5429	syscall	Iovec	struct
5430	syscall	IPMreq	struct
5431	syscall	IPv6Mreq	struct
5432	syscall	Msghdr	struct
5433	syscall	Cmsghdr	struct
5434	syscall	Inet4Pktinfo	struct
5435	syscall	Inet6Pktinfo	struct
5436	syscall	IPv6MTUInfo	struct
5437	syscall	ICMPv6Filter	struct
5438	syscall	Kevent_t	struct
5439	syscall	FdSet	struct
5440	syscall	IfMsghdr	struct
5441	syscall	IfData	struct
5442	syscall	IfaMsghdr	struct
5443	syscall	IfmaMsghdr	struct
5444	syscall	IfmaMsghdr2	struct
5445	syscall	RtMsghdr	struct
5446	syscall	RtMetrics	struct
5447	syscall	BpfVersion	struct
5448	syscall	BpfStat	struct
5449	syscall	BpfProgram	struct
5450	syscall	BpfInsn	struct
5451	syscall	BpfHdr	struct
5452	syscall	Termios	struct
5453	syscall	Timespec	struct
5454	syscall	Timeval	struct
5455	syscall	Rusage	struct
5456	syscall	Rlimit	struct
5457	syscall	Stat_t	struct
5458	syscall	Statfs_t	struct
5459	syscall	Flock_t	struct
5460	syscall	Dirent	struct
5461	syscall	Fsid	struct
5462	syscall	RawSockaddrInet4	struct
5463	syscall	RawSockaddrInet6	struct
5464	syscall	RawSockaddrUnix	struct
5465	syscall	RawSockaddrDatalink	struct
5466	syscall	RawSockaddr	struct
5467	syscall	RawSockaddrAny	struct
5468	syscall	Linger	struct
5469	syscall	Iovec	struct
5470	syscall	IPMreq	struct
5471	syscall	IPv6Mreq	struct
5472	syscall	Msghdr	struct
5473	syscall	Cmsghdr	struct
5474	syscall	Inet6Pktinfo	struct
5475	syscall	IPv6MTUInfo	struct
5476	syscall	ICMPv6Filter	struct
5477	syscall	Kevent_t	struct
5478	syscall	FdSet	struct
5479	syscall	IfMsghdr	struct
5480	syscall	IfData	struct
5481	syscall	IfaMsghdr	struct
5482	syscall	IfmaMsghdr	struct
5483	syscall	IfAnnounceMsghdr	struct
5484	syscall	RtMsghdr	struct
5485	syscall	RtMetrics	struct
5486	syscall	BpfVersion	struct
5487	syscall	BpfStat	struct
5488	syscall	BpfProgram	struct
5489	syscall	BpfInsn	struct
5490	syscall	BpfHdr	struct
5491	syscall	Termios	struct
5492	syscall	Timespec	struct
5493	syscall	Timeval	struct
5494	syscall	Rusage	struct
5495	syscall	Rlimit	struct
5496	syscall	Stat_t	struct
5497	syscall	Statfs_t	struct
5498	syscall	Flock_t	struct
5499	syscall	Dirent	struct
5500	syscall	Fsid	struct
5501	syscall	RawSockaddrInet4	struct
5502	syscall	RawSockaddrInet6	struct
5503	syscall	RawSockaddrUnix	struct
5504	syscall	RawSockaddrDatalink	struct
5505	syscall	RawSockaddr	struct
5506	syscall	RawSockaddrAny	struct
5507	syscall	Linger	struct
5508	syscall	Iovec	struct
5509	syscall	IPMreq	struct
5510	syscall	IPMreqn	struct
5511	syscall	IPv6Mreq	struct
5512	syscall	Msghdr	struct
5513	syscall	Cmsghdr	struct
5514	syscall	Inet6Pktinfo	struct
5515	syscall	IPv6MTUInfo	struct
5516	syscall	ICMPv6Filter	struct
5517	syscall	Kevent_t	struct
5518	syscall	FdSet	struct
5519	syscall	IfMsghdr	struct
5520	syscall	IfData	struct
5521	syscall	IfaMsghdr	struct
5522	syscall	IfmaMsghdr	struct
5523	syscall	IfAnnounceMsghdr	struct
5524	syscall	RtMsghdr	struct
5525	syscall	RtMetrics	struct
5526	syscall	BpfVersion	struct
5527	syscall	BpfStat	struct
5528	syscall	BpfZbuf	struct
5529	syscall	BpfProgram	struct
5530	syscall	BpfInsn	struct
5531	syscall	BpfHdr	struct
5532	syscall	BpfZbufHeader	struct
5533	syscall	Termios	struct
5534	syscall	Timespec	struct
5535	syscall	Timeval	struct
5536	syscall	Rusage	struct
5537	syscall	Rlimit	struct
5538	syscall	Stat_t	struct
5539	syscall	Statfs_t	struct
5540	syscall	Flock_t	struct
5541	syscall	Dirent	struct
5542	syscall	Fsid	struct
5543	syscall	RawSockaddrInet4	struct
5544	syscall	RawSockaddrInet6	struct
5545	syscall	RawSockaddrUnix	struct
5546	syscall	RawSockaddrDatalink	struct
5547	syscall	RawSockaddr	struct
5548	syscall	RawSockaddrAny	struct
5549	syscall	Linger	struct
5550	syscall	Iovec	struct
5551	syscall	IPMreq	struct
5552	syscall	IPMreqn	struct
5553	syscall	IPv6Mreq	struct
5554	syscall	Msghdr	struct
5555	syscall	Cmsghdr	struct
5556	syscall	Inet6Pktinfo	struct
5557	syscall	IPv6MTUInfo	struct
5558	syscall	ICMPv6Filter	struct
5559	syscall	Kevent_t	struct
5560	syscall	FdSet	struct
5561	syscall	IfMsghdr	struct
5562	syscall	IfData	struct
5563	syscall	IfaMsghdr	struct
5564	syscall	IfmaMsghdr	struct
5565	syscall	IfAnnounceMsghdr	struct
5566	syscall	RtMsghdr	struct
5567	syscall	RtMetrics	struct
5568	syscall	BpfVersion	struct
5569	syscall	BpfStat	struct
5570	syscall	BpfZbuf	struct
5571	syscall	BpfProgram	struct
5572	syscall	BpfInsn	struct
5573	syscall	BpfHdr	struct
5574	syscall	BpfZbufHeader	struct
5575	syscall	Termios	struct
5576	syscall	Timespec	struct
5577	syscall	Timeval	struct
5578	syscall	Rusage	struct
5579	syscall	Rlimit	struct
5580	syscall	Stat_t	struct
5581	syscall	Statfs_t	struct
5582	syscall	Flock_t	struct
5583	syscall	Dirent	struct
5584	syscall	Fsid	struct
5585	syscall	RawSockaddrInet4	struct
5586	syscall	RawSockaddrInet6	struct
5587	syscall	RawSockaddrUnix	struct
5588	syscall	RawSockaddrDatalink	struct
5589	syscall	RawSockaddr	struct
5590	syscall	RawSockaddrAny	struct
5591	syscall	Linger	struct
5592	syscall	Iovec	struct
5593	syscall	IPMreq	struct
5594	syscall	IPMreqn	struct
5595	syscall	IPv6Mreq	struct
5596	syscall	Msghdr	struct
5597	syscall	Cmsghdr	struct
5598	syscall	Inet6Pktinfo	struct
5599	syscall	IPv6MTUInfo	struct
5600	syscall	ICMPv6Filter	struct
5601	syscall	Kevent_t	struct
5602	syscall	FdSet	struct
5603	syscall	IfMsghdr	struct
5604	syscall	IfData	struct
5605	syscall	IfaMsghdr	struct
5606	syscall	IfmaMsghdr	struct
5607	syscall	IfAnnounceMsghdr	struct
5608	syscall	RtMsghdr	struct
5609	syscall	RtMetrics	struct
5610	syscall	BpfVersion	struct
5611	syscall	BpfStat	struct
5612	syscall	BpfZbuf	struct
5613	syscall	BpfProgram	struct
5614	syscall	BpfInsn	struct
5615	syscall	BpfHdr	struct
5616	syscall	BpfZbufHeader	struct
5617	syscall	Termios	struct
5618	syscall	Timespec	struct
5619	syscall	Timeval	struct
5620	syscall	Timex	struct
5621	syscall	Time_t	int32
5622	syscall	Tms	struct
5623	syscall	Utimbuf	struct
5624	syscall	Rusage	struct
5625	syscall	Rlimit	struct
5626	syscall	Stat_t	struct
5627	syscall	Statfs_t	struct
5628	syscall	Dirent	struct
5629	syscall	Fsid	struct
5630	syscall	Flock_t	struct
5631	syscall	RawSockaddrInet4	struct
5632	syscall	RawSockaddrInet6	struct
5633	syscall	RawSockaddrUnix	struct
5634	syscall	RawSockaddrLinklayer	struct
5635	syscall	RawSockaddrNetlink	struct
5636	syscall	RawSockaddr	struct
5637	syscall	RawSockaddrAny	struct
5638	syscall	Linger	struct
5639	syscall	Iovec	struct
5640	syscall	IPMreq	struct
5641	syscall	IPMreqn	struct
5642	syscall	IPv6Mreq	struct
5643	syscall	Msghdr	struct
5644	syscall	Cmsghdr	struct
5645	syscall	Inet4Pktinfo	struct
5646	syscall	Inet6Pktinfo	struct
5647	syscall	IPv6MTUInfo	struct
5648	syscall	ICMPv6Filter	struct
5649	syscall	Ucred	struct
5650	syscall	TCPInfo	struct
5651	syscall	NlMsghdr	struct
5652	syscall	NlMsgerr	struct
5653	syscall	RtGenmsg	struct
5654	syscall	NlAttr	struct
5655	syscall	RtAttr	struct
5656	syscall	IfInfomsg	struct
5657	syscall	IfAddrmsg	struct
5658	syscall	RtMsg	struct
5659	syscall	RtNexthop	struct
5660	syscall	SockFilter	struct
5661	syscall	SockFprog	struct
5662	syscall	InotifyEvent	struct
5663	syscall	PtraceRegs	struct
5664	syscall	FdSet	struct
5665	syscall	Sysinfo_t	struct
5666	syscall	Utsname	struct
5667	syscall	Ustat_t	struct
5668	syscall	EpollEvent	struct
5669	syscall	Termios	struct
5670	syscall	Timespec	struct
5671	syscall	Timeval	struct
5672	syscall	Timex	struct
5673	syscall	Time_t	int64
5674	syscall	Tms	struct
5675	syscall	Utimbuf	struct
5676	syscall	Rusage	struct
5677	syscall	Rlimit	struct
5678	syscall	Stat_t	struct
5679	syscall	Statfs_t	struct
5680	syscall	Dirent	struct
5681	syscall	Fsid	struct
5682	syscall	Flock_t	struct
5683	syscall	RawSockaddrInet4	struct
5684	syscall	RawSockaddrInet6	struct
5685	syscall	RawSockaddrUnix	struct
5686	syscall	RawSockaddrLinklayer	struct
5687	syscall	RawSockaddrNetlink	struct
5688	syscall	RawSockaddr	struct
5689	syscall	RawSockaddrAny	struct
5690	syscall	Linger	struct
5691	syscall	Iovec	struct
5692	syscall	IPMreq	struct
5693	syscall	IPMreqn	struct
5694	syscall	IPv6Mreq	struct
5695	syscall	Msghdr	struct
5696	syscall	Cmsghdr	struct
5697	syscall	Inet4Pktinfo	struct
5698	syscall	Inet6Pktinfo	struct
5699	syscall	IPv6MTUInfo	struct
5700	syscall	ICMPv6Filter	struct
5701	syscall	Ucred	struct
5702	syscall	TCPInfo	struct
5703	syscall	NlMsghdr	struct
5704	syscall	NlMsgerr	struct
5705	syscall	RtGenmsg	struct
5706	syscall	NlAttr	struct
5707	syscall	RtAttr	struct
5708	syscall	IfInfomsg	struct
5709	syscall	IfAddrmsg	struct
5710	syscall	RtMsg	struct
5711	syscall	RtNexthop	struct
5712	syscall	SockFilter	struct
5713	syscall	SockFprog	struct
5714	syscall	InotifyEvent	struct
5715	syscall	PtraceRegs	struct
5716	syscall	FdSet	struct
5717	syscall	Sysinfo_t	struct
5718	syscall	Utsname	struct
5719	syscall	Ustat_t	struct
5720	syscall	EpollEvent	struct
5721	syscall	Termios	struct
5722	syscall	Timespec	struct
5723	syscall	Timeval	struct
5724	syscall	Timex	struct
5725	syscall	Time_t	int32
5726	syscall	Tms	struct
5727	syscall	Utimbuf	struct
5728	syscall	Rusage	struct
5729	syscall	Rlimit	struct
5730	syscall	Stat_t	struct
5731	syscall	Statfs_t	struct
5732	syscall	Dirent	struct
5733	syscall	Fsid	struct
5734	syscall	Flock_t	struct
5735	syscall	RawSockaddrInet4	struct
5736	syscall	RawSockaddrInet6	struct
5737	syscall	RawSockaddrUnix	struct
5738	syscall	RawSockaddrLinklayer	struct
5739	syscall	RawSockaddrNetlink	struct
5740	syscall	RawSockaddr	struct
5741	syscall	RawSockaddrAny	struct
5742	syscall	Linger	struct
5743	syscall	Iovec	struct
5744	syscall	IPMreq	struct
5745	syscall	IPMreqn	struct
5746	syscall	IPv6Mreq	struct
5747	syscall	Msghdr	struct
5748	syscall	Cmsghdr	struct
5749	syscall	Inet4Pktinfo	struct
5750	syscall	Inet6Pktinfo	struct
5751	syscall	IPv6MTUInfo	struct
5752	syscall	ICMPv6Filter	struct
5753	syscall	Ucred	struct
5754	syscall	TCPInfo	struct
5755	syscall	NlMsghdr	struct
5756	syscall	NlMsgerr	struct
5757	syscall	RtGenmsg	struct
5758	syscall	NlAttr	struct
5759	syscall	RtAttr	struct
5760	syscall	IfInfomsg	struct
5761	syscall	IfAddrmsg	struct
5762	syscall	RtMsg	struct
5763	syscall	RtNexthop	struct
5764	syscall	SockFilter	struct
5765	syscall	SockFprog	struct
5766	syscall	InotifyEvent	struct
5767	syscall	PtraceRegs	struct
5768	syscall	FdSet	struct
5769	syscall	Sysinfo_t	struct
5770	syscall	Utsname	struct
5771	syscall	Ustat_t	struct
5772	syscall	EpollEvent	struct
5773	syscall	Termios	struct
5774	syscall	Timespec	struct
5775	syscall	Timeval	struct
5776	syscall	Timex	struct
5777	syscall	Time_t	int64
5778	syscall	Tms	struct
5779	syscall	Utimbuf	struct
5780	syscall	Rusage	struct
5781	syscall	Rlimit	struct
5782	syscall	Stat_t	struct
5783	syscall	Statfs_t	struct
5784	syscall	Dirent	struct
5785	syscall	Fsid	struct
5786	syscall	Flock_t	struct
5787	syscall	RawSockaddrInet4	struct
5788	syscall	RawSockaddrInet6	struct
5789	syscall	RawSockaddrUnix	struct
5790	syscall	RawSockaddrLinklayer	struct
5791	syscall	RawSockaddrNetlink	struct
5792	syscall	RawSockaddr	struct
5793	syscall	RawSockaddrAny	struct
5794	syscall	Linger	struct
5795	syscall	Iovec	struct
5796	syscall	IPMreq	struct
5797	syscall	IPMreqn	struct
5798	syscall	IPv6Mreq	struct
5799	syscall	Msghdr	struct
5800	syscall	Cmsghdr	struct
5801	syscall	Inet4Pktinfo	struct
5802	syscall	Inet6Pktinfo	struct
5803	syscall	IPv6MTUInfo	struct
5804	syscall	ICMPv6Filter	struct
5805	syscall	Ucred	struct
5806	syscall	TCPInfo	struct
5807	syscall	NlMsghdr	struct
5808	syscall	NlMsgerr	struct
5809	syscall	RtGenmsg	struct
5810	syscall	NlAttr	struct
5811	syscall	RtAttr	struct
5812	syscall	IfInfomsg	struct
5813	syscall	IfAddrmsg	struct
5814	syscall	RtMsg	struct
5815	syscall	RtNexthop	struct
5816	syscall	SockFilter	struct
5817	syscall	SockFprog	struct
5818	syscall	InotifyEvent	struct
5819	syscall	PtraceRegs	struct
5820	syscall	FdSet	struct
5821	syscall	Sysinfo_t	struct
5822	syscall	Utsname	struct
5823	syscall	Ustat_t	struct
5824	syscall	EpollEvent	struct
5825	syscall	Termios	struct
5826	syscall	Timespec	struct
5827	syscall	Timeval	struct
5828	syscall	Timex	struct
5829	syscall	Time_t	int32
5830	syscall	Tms	struct
5831	syscall	Utimbuf	struct
5832	syscall	Rusage	struct
5833	syscall	Rlimit	struct
5834	syscall	Stat_t	struct
5835	syscall	Statfs_t	struct
5836	syscall	Dirent	struct
5837	syscall	Fsid	struct
5838	syscall	Flock_t	struct
5839	syscall	RawSockaddrInet4	struct
5840	syscall	RawSockaddrInet6	struct
5841	syscall	RawSockaddrUnix	struct
5842	syscall	RawSockaddrLinklayer	struct
5843	syscall	RawSockaddrNetlink	struct
5844	syscall	RawSockaddr	struct
5845	syscall	RawSockaddrAny	struct
5846	syscall	Linger	struct
5847	syscall	Iovec	struct
5848	syscall	IPMreq	struct
5849	syscall	IPMreqn	struct
5850	syscall	IPv6Mreq	struct
5851	syscall	Msghdr	struct
5852	syscall	Cmsghdr	struct
5853	syscall	Inet4Pktinfo	struct
5854	syscall	Inet6Pktinfo	struct
5855	syscall	IPv6MTUInfo	struct
5856	syscall	ICMPv6Filter	struct
5857	syscall	Ucred	struct
5858	syscall	TCPInfo	struct
5859	syscall	NlMsghdr	struct
5860	syscall	NlMsgerr	struct
5861	syscall	RtGenmsg	struct
5862	syscall	NlAttr	struct
5863	syscall	RtAttr	struct
5864	syscall	IfInfomsg	struct
5865	syscall	IfAddrmsg	struct
5866	syscall	RtMsg	struct
5867	syscall	RtNexthop	struct
5868	syscall	SockFilter	struct
5869	syscall	SockFprog	struct
5870	syscall	InotifyEvent	struct
5871	syscall	PtraceRegs	struct
5872	syscall	FdSet	struct
5873	syscall	Sysinfo_t	struct
5874	syscall	Utsname	struct
5875	syscall	Ustat_t	struct
5876	syscall	EpollEvent	struct
5877	syscall	Termios	struct
5878	syscall	Timespec	struct
5879	syscall	Timeval	struct
5880	syscall	Timex	struct
5881	syscall	Time_t	int64
5882	syscall	Tms	struct
5883	syscall	Utimbuf	struct
5884	syscall	Rusage	struct
5885	syscall	Rlimit	struct
5886	syscall	Stat_t	struct
5887	syscall	Statfs_t	struct
5888	syscall	Dirent	struct
5889	syscall	Fsid	struct
5890	syscall	Flock_t	struct
5891	syscall	RawSockaddrInet4	struct
5892	syscall	RawSockaddrInet6	struct
5893	syscall	RawSockaddrUnix	struct
5894	syscall	RawSockaddrLinklayer	struct
5895	syscall	RawSockaddrNetlink	struct
5896	syscall	RawSockaddr	struct
5897	syscall	RawSockaddrAny	struct
5898	syscall	Linger	struct
5899	syscall	Iovec	struct
5900	syscall	IPMreq	struct
5901	syscall	IPMreqn	struct
5902	syscall	IPv6Mreq	struct
5903	syscall	Msghdr	struct
5904	syscall	Cmsghdr	struct
5905	syscall	Inet4Pktinfo	struct
5906	syscall	Inet6Pktinfo	struct
5907	syscall	IPv6MTUInfo	struct
5908	syscall	ICMPv6Filter	struct
5909	syscall	Ucred	struct
5910	syscall	TCPInfo	struct
5911	syscall	NlMsghdr	struct
5912	syscall	NlMsgerr	struct
5913	syscall	RtGenmsg	struct
5914	syscall	NlAttr	struct
5915	syscall	RtAttr	struct
5916	syscall	IfInfomsg	struct
5917	syscall	IfAddrmsg	struct
5918	syscall	RtMsg	struct
5919	syscall	RtNexthop	struct
5920	syscall	SockFilter	struct
5921	syscall	SockFprog	struct
5922	syscall	InotifyEvent	struct
5923	syscall	PtraceRegs	struct
5924	syscall	FdSet	struct
5925	syscall	Sysinfo_t	struct
5926	syscall	Utsname	struct
5927	syscall	Ustat_t	struct
5928	syscall	EpollEvent	struct
5929	syscall	Termios	struct
5930	syscall	Timespec	struct
5931	syscall	Timeval	struct
5932	syscall	Timex	struct
5933	syscall	Time_t	int64
5934	syscall	Tms	struct
5935	syscall	Utimbuf	struct
5936	syscall	Rusage	struct
5937	syscall	Rlimit	struct
5938	syscall	Stat_t	struct
5939	syscall	Statfs_t	struct
5940	syscall	Dirent	struct
5941	syscall	Fsid	struct
5942	syscall	Flock_t	struct
5943	syscall	RawSockaddrInet4	struct
5944	syscall	RawSockaddrInet6	struct
5945	syscall	RawSockaddrUnix	struct
5946	syscall	RawSockaddrLinklayer	struct
5947	syscall	RawSockaddrNetlink	struct
5948	syscall	RawSockaddr	struct
5949	syscall	RawSockaddrAny	struct
5950	syscall	Linger	struct
5951	syscall	Iovec	struct
5952	syscall	IPMreq	struct
5953	syscall	IPMreqn	struct
5954	syscall	IPv6Mreq	struct
5955	syscall	Msghdr	struct
5956	syscall	Cmsghdr	struct
5957	syscall	Inet4Pktinfo	struct
5958	syscall	Inet6Pktinfo	struct
5959	syscall	IPv6MTUInfo	struct
5960	syscall	ICMPv6Filter	struct
5961	syscall	Ucred	struct
5962	syscall	TCPInfo	struct
5963	syscall	NlMsghdr	struct
5964	syscall	NlMsgerr	struct
5965	syscall	RtGenmsg	struct
5966	syscall	NlAttr	struct
5967	syscall	RtAttr	struct
5968	syscall	IfInfomsg	struct
5969	syscall	IfAddrmsg	struct
5970	syscall	RtMsg	struct
5971	syscall	RtNexthop	struct
5972	syscall	SockFilter	struct
5973	syscall	SockFprog	struct
5974	syscall	InotifyEvent	struct
5975	syscall	PtraceRegs	struct
5976	syscall	FdSet	struct
5977	syscall	Sysinfo_t	struct
5978	syscall	Utsname	struct
5979	syscall	Ustat_t	struct
5980	syscall	EpollEvent	struct
5981	syscall	Termios	struct
5982	syscall	Timespec	struct
5983	syscall	Timeval	struct
5984	syscall	Timex	struct
5985	syscall	Time_t	int32
5986	syscall	Tms	struct
5987	syscall	Utimbuf	struct
5988	syscall	Rusage	struct
5989	syscall	Rlimit	struct
5990	syscall	Stat_t	struct
5991	syscall	Statfs_t	struct
5992	syscall	Dirent	struct
5993	syscall	Fsid	struct
5994	syscall	Flock_t	struct
5995	syscall	RawSockaddrInet4	struct
5996	syscall	RawSockaddrInet6	struct
5997	syscall	RawSockaddrUnix	struct
5998	syscall	RawSockaddrLinklayer	struct
5999	syscall	RawSockaddrNetlink	struct
6000	syscall	RawSockaddr	struct
6001	syscall	RawSockaddrAny	struct
6002	syscall	Linger	struct
6003	syscall	Iovec	struct
6004	syscall	IPMreq	struct
6005	syscall	IPMreqn	struct
6006	syscall	IPv6Mreq	struct
6007	syscall	Msghdr	struct
6008	syscall	Cmsghdr	struct
6009	syscall	Inet4Pktinfo	struct
6010	syscall	Inet6Pktinfo	struct
6011	syscall	IPv6MTUInfo	struct
6012	syscall	ICMPv6Filter	struct
6013	syscall	Ucred	struct
6014	syscall	TCPInfo	struct
6015	syscall	NlMsghdr	struct
6016	syscall	NlMsgerr	struct
6017	syscall	RtGenmsg	struct
6018	syscall	NlAttr	struct
6019	syscall	RtAttr	struct
6020	syscall	IfInfomsg	struct
6021	syscall	IfAddrmsg	struct
6022	syscall	RtMsg	struct
6023	syscall	RtNexthop	struct
6024	syscall	SockFilter	struct
6025	syscall	SockFprog	struct
6026	syscall	InotifyEvent	struct
6027	syscall	PtraceRegs	struct
6028	syscall	FdSet	struct
6029	syscall	Sysinfo_t	struct
6030	syscall	Utsname	struct
6031	syscall	Ustat_t	struct
6032	syscall	EpollEvent	struct
6033	syscall	Termios	struct
6034	syscall	Timespec	struct
6035	syscall	Timeval	struct
6036	syscall	Timex	struct
6037	syscall	Time_t	int64
6038	syscall	Tms	struct
6039	syscall	Utimbuf	struct
6040	syscall	Rusage	struct
6041	syscall	Rlimit	struct
6042	syscall	Stat_t	struct
6043	syscall	Statfs_t	struct
6044	syscall	Dirent	struct
6045	syscall	Fsid	struct
6046	syscall	Flock_t	struct
6047	syscall	RawSockaddrInet4	struct
6048	syscall	RawSockaddrInet6	struct
6049	syscall	RawSockaddrUnix	struct
6050	syscall	RawSockaddrLinklayer	struct
6051	syscall	RawSockaddrNetlink	struct
6052	syscall	RawSockaddr	struct
6053	syscall	RawSockaddrAny	struct
6054	syscall	Linger	struct
6055	syscall	Iovec	struct
6056	syscall	IPMreq	struct
6057	syscall	IPMreqn	struct
6058	syscall	IPv6Mreq	struct
6059	syscall	Msghdr	struct
6060	syscall	Cmsghdr	struct
6061	syscall	Inet4Pktinfo	struct
6062	syscall	Inet6Pktinfo	struct
6063	syscall	IPv6MTUInfo	struct
6064	syscall	ICMPv6Filter	struct
6065	syscall	Ucred	struct
6066	syscall	TCPInfo	struct
6067	syscall	NlMsghdr	struct
6068	syscall	NlMsgerr	struct
6069	syscall	RtGenmsg	struct
6070	syscall	NlAttr	struct
6071	syscall	RtAttr	struct
6072	syscall	IfInfomsg	struct
6073	syscall	IfAddrmsg	struct
6074	syscall	RtMsg	struct
6075	syscall	RtNexthop	struct
6076	syscall	SockFilter	struct
6077	syscall	SockFprog	struct
6078	syscall	InotifyEvent	struct
6079	syscall	PtraceRegs	struct
6080	syscall	FdSet	struct
6081	syscall	Sysinfo_t	struct
6082	syscall	Utsname	struct
6083	syscall	Ustat_t	struct
6084	syscall	EpollEvent	struct
6085	syscall	Termios	struct
6086	syscall	Timespec	struct
6087	syscall	Timeval	struct
6088	syscall	Timex	struct
6089	syscall	Time_t	int64
6090	syscall	Tms	struct
6091	syscall	Utimbuf	struct
6092	syscall	Rusage	struct
6093	syscall	Rlimit	struct
6094	syscall	Stat_t	struct
6095	syscall	Statfs_t	struct
6096	syscall	Dirent	struct
6097	syscall	Fsid	struct
6098	syscall	Flock_t	struct
6099	syscall	RawSockaddrInet4	struct
6100	syscall	RawSockaddrInet6	struct
6101	syscall	RawSockaddrUnix	struct
6102	syscall	RawSockaddrLinklayer	struct
6103	syscall	RawSockaddrNetlink	struct
6104	syscall	RawSockaddr	struct
6105	syscall	RawSockaddrAny	struct
6106	syscall	Linger	struct
6107	syscall	Iovec	struct
6108	syscall	IPMreq	struct
6109	syscall	IPMreqn	struct
6110	syscall	IPv6Mreq	struct
6111	syscall	Msghdr	struct
6112	syscall	Cmsghdr	struct
6113	syscall	Inet4Pktinfo	struct
6114	syscall	Inet6Pktinfo	struct
6115	syscall	IPv6MTUInfo	struct
6116	syscall	ICMPv6Filter	struct
6117	syscall	Ucred	struct
6118	syscall	TCPInfo	struct
6119	syscall	NlMsghdr	struct
6120	syscall	NlMsgerr	struct
6121	syscall	RtGenmsg	struct
6122	syscall	NlAttr	struct
6123	syscall	RtAttr	struct
6124	syscall	IfInfomsg	struct
6125	syscall	IfAddrmsg	struct
6126	syscall	RtMsg	struct
6127	syscall	RtNexthop	struct
6128	syscall	SockFilter	struct
6129	syscall	SockFprog	struct
6130	syscall	InotifyEvent	struct
6131	syscall	PtraceRegs	struct
6132	syscall	FdSet	struct
6133	syscall	Sysinfo_t	struct
6134	syscall	Utsname	struct
6135	syscall	Ustat_t	struct
6136	syscall	EpollEvent	struct
6137	syscall	Termios	struct
6138	syscall	Timespec	struct
6139	syscall	Timeval	struct
6140	syscall	Timex	struct
6141	syscall	Time_t	int64
6142	syscall	Tms	struct
6143	syscall	Utimbuf	struct
6144	syscall	Rusage	struct
6145	syscall	Rlimit	struct
6146	syscall	Stat_t	struct
6147	syscall	Statfs_t	struct
6148	syscall	Dirent	struct
6149	syscall	Fsid	struct
6150	syscall	Flock_t	struct
6151	syscall	RawSockaddrInet4	struct
6152	syscall	RawSockaddrInet6	struct
6153	syscall	RawSockaddrUnix	struct
6154	syscall	RawSockaddrLinklayer	struct
6155	syscall	RawSockaddrNetlink	struct
6156	syscall	RawSockaddr	struct
6157	syscall	RawSockaddrAny	struct
6158	syscall	Linger	struct
6159	syscall	Iovec	struct
6160	syscall	IPMreq	struct
6161	syscall	IPMreqn	struct
6162	syscall	IPv6Mreq	struct
6163	syscall	Msghdr	struct
6164	syscall	Cmsghdr	struct
6165	syscall	Inet4Pktinfo	struct
6166	syscall	Inet6Pktinfo	struct
6167	syscall	IPv6MTUInfo	struct
6168	syscall	ICMPv6Filter	struct
6169	syscall	Ucred	struct
6170	syscall	TCPInfo	struct
6171	syscall	NlMsghdr	struct
6172	syscall	NlMsgerr	struct
6173	syscall	RtGenmsg	struct
6174	syscall	NlAttr	struct
6175	syscall	RtAttr	struct
6176	syscall	IfInfomsg	struct
6177	syscall	IfAddrmsg	struct
6178	syscall	RtMsg	struct
6179	syscall	RtNexthop	struct
6180	syscall	SockFilter	struct
6181	syscall	SockFprog	struct
6182	syscall	InotifyEvent	struct
6183	syscall	PtraceRegs	struct
6184	syscall	PtracePsw	struct
6185	syscall	PtraceFpregs	struct
6186	syscall	PtracePer	struct
6187	syscall	FdSet	struct
6188	syscall	Sysinfo_t	struct
6189	syscall	Utsname	struct
6190	syscall	Ustat_t	struct
6191	syscall	EpollEvent	struct
6192	syscall	Termios	struct
6193	syscall	Timespec	struct
6194	syscall	Timeval	struct
6195	syscall	Rusage	struct
6196	syscall	Rlimit	struct
6197	syscall	Stat_t	struct
6198	syscall	Statfs_t	[]byte
6199	syscall	Flock_t	struct
6200	syscall	Dirent	struct
6201	syscall	Fsid	struct
6202	syscall	RawSockaddrInet4	struct
6203	syscall	RawSockaddrInet6	struct
6204	syscall	RawSockaddrUnix	struct
6205	syscall	RawSockaddrDatalink	struct
6206	syscall	RawSockaddr	struct
6207	syscall	RawSockaddrAny	struct
6208	syscall	Linger	struct
6209	syscall	Iovec	struct
6210	syscall	IPMreq	struct
6211	syscall	IPv6Mreq	struct
6212	syscall	Msghdr	struct
6213	syscall	Cmsghdr	struct
6214	syscall	Inet6Pktinfo	struct
6215	syscall	IPv6MTUInfo	struct
6216	syscall	ICMPv6Filter	struct
6217	syscall	Kevent_t	struct
6218	syscall	FdSet	struct
6219	syscall	IfMsghdr	struct
6220	syscall	IfData	struct
6221	syscall	IfaMsghdr	struct
6222	syscall	IfAnnounceMsghdr	struct
6223	syscall	RtMsghdr	struct
6224	syscall	RtMetrics	struct
6225	syscall	Mclpool	[]byte
6226	syscall	BpfVersion	struct
6227	syscall	BpfStat	struct
6228	syscall	BpfProgram	struct
6229	syscall	BpfInsn	struct
6230	syscall	BpfHdr	struct
6231	syscall	BpfTimeval	struct
6232	syscall	Termios	struct
6233	syscall	Sysctlnode	struct
6234	syscall	Timespec	struct
6235	syscall	Timeval	struct
6236	syscall	Rusage	struct
6237	syscall	Rlimit	struct
6238	syscall	Stat_t	struct
6239	syscall	Statfs_t	[]byte
6240	syscall	Flock_t	struct
6241	syscall	Dirent	struct
6242	syscall	Fsid	struct
6243	syscall	RawSockaddrInet4	struct
6244	syscall	RawSockaddrInet6	struct
6245	syscall	RawSockaddrUnix	struct
6246	syscall	RawSockaddrDatalink	struct
6247	syscall	RawSockaddr	struct
6248	syscall	RawSockaddrAny	struct
6249	syscall	Linger	struct
6250	syscall	Iovec	struct
6251	syscall	IPMreq	struct
6252	syscall	IPv6Mreq	struct
6253	syscall	Msghdr	struct
6254	syscall	Cmsghdr	struct
6255	syscall	Inet6Pktinfo	struct
6256	syscall	IPv6MTUInfo	struct
6257	syscall	ICMPv6Filter	struct
6258	syscall	Kevent_t	struct
6259	syscall	FdSet	struct
6260	syscall	IfMsghdr	struct
6261	syscall	IfData	struct
6262	syscall	IfaMsghdr	struct
6263	syscall	IfAnnounceMsghdr	struct
6264	syscall	RtMsghdr	struct
6265	syscall	RtMetrics	struct
6266	syscall	Mclpool	[]byte
6267	syscall	BpfVersion	struct
6268	syscall	BpfStat	struct
6269	syscall	BpfProgram	struct
6270	syscall	BpfInsn	struct
6271	syscall	BpfHdr	struct
6272	syscall	BpfTimeval	struct
6273	syscall	Termios	struct
6274	syscall	Sysctlnode	struct
6275	syscall	Timespec	struct
6276	syscall	Timeval	struct
6277	syscall	Rusage	struct
6278	syscall	Rlimit	struct
6279	syscall	Stat_t	struct
6280	syscall	Statfs_t	[]byte
6281	syscall	Flock_t	struct
6282	syscall	Dirent	struct
6283	syscall	Fsid	struct
6284	syscall	RawSockaddrInet4	struct
6285	syscall	RawSockaddrInet6	struct
6286	syscall	RawSockaddrUnix	struct
6287	syscall	RawSockaddrDatalink	struct
6288	syscall	RawSockaddr	struct
6289	syscall	RawSockaddrAny	struct
6290	syscall	Linger	struct
6291	syscall	Iovec	struct
6292	syscall	IPMreq	struct
6293	syscall	IPv6Mreq	struct
6294	syscall	Msghdr	struct
6295	syscall	Cmsghdr	struct
6296	syscall	Inet6Pktinfo	struct
6297	syscall	IPv6MTUInfo	struct
6298	syscall	ICMPv6Filter	struct
6299	syscall	Kevent_t	struct
6300	syscall	FdSet	struct
6301	syscall	IfMsghdr	struct
6302	syscall	IfData	struct
6303	syscall	IfaMsghdr	struct
6304	syscall	IfAnnounceMsghdr	struct
6305	syscall	RtMsghdr	struct
6306	syscall	RtMetrics	struct
6307	syscall	Mclpool	[]byte
6308	syscall	BpfVersion	struct
6309	syscall	BpfStat	struct
6310	syscall	BpfProgram	struct
6311	syscall	BpfInsn	struct
6312	syscall	BpfHdr	struct
6313	syscall	BpfTimeval	struct
6314	syscall	Termios	struct
6315	syscall	Sysctlnode	struct
6316	syscall	Timespec	struct
6317	syscall	Timeval	struct
6318	syscall	Rusage	struct
6319	syscall	Rlimit	struct
6320	syscall	Stat_t	struct
6321	syscall	Statfs_t	[]byte
6322	syscall	Flock_t	struct
6323	syscall	Dirent	struct
6324	syscall	Fsid	struct
6325	syscall	RawSockaddrInet4	struct
6326	syscall	RawSockaddrInet6	struct
6327	syscall	RawSockaddrUnix	struct
6328	syscall	RawSockaddrDatalink	struct
6329	syscall	RawSockaddr	struct
6330	syscall	RawSockaddrAny	struct
6331	syscall	Linger	struct
6332	syscall	Iovec	struct
6333	syscall	IPMreq	struct
6334	syscall	IPv6Mreq	struct
6335	syscall	Msghdr	struct
6336	syscall	Cmsghdr	struct
6337	syscall	Inet6Pktinfo	struct
6338	syscall	IPv6MTUInfo	struct
6339	syscall	ICMPv6Filter	struct
6340	syscall	Kevent_t	struct
6341	syscall	FdSet	struct
6342	syscall	IfMsghdr	struct
6343	syscall	IfData	struct
6344	syscall	IfaMsghdr	struct
6345	syscall	IfAnnounceMsghdr	struct
6346	syscall	RtMsghdr	struct
6347	syscall	RtMetrics	struct
6348	syscall	Mclpool	[]byte
6349	syscall	BpfVersion	struct
6350	syscall	BpfStat	struct
6351	syscall	BpfProgram	struct
6352	syscall	BpfInsn	struct
6353	syscall	BpfHdr	struct
6354	syscall	BpfTimeval	struct
6355	syscall	Termios	struct
6356	syscall	Sysctlnode	struct
6357	syscall	Timespec	struct
6358	syscall	Timeval	struct
6359	syscall	Rusage	struct
6360	syscall	Rlimit	struct
6361	syscall	Stat_t	struct
6362	syscall	Statfs_t	struct
6363	syscall	Flock_t	struct
6364	syscall	Dirent	struct
6365	syscall	Fsid	struct
6366	syscall	RawSockaddrInet4	struct
6367	syscall	RawSockaddrInet6	struct
6368	syscall	RawSockaddrUnix	struct
6369	syscall	RawSockaddrDatalink	struct
6370	syscall	RawSockaddr	struct
6371	syscall	RawSockaddrAny	struct
6372	syscall	Linger	struct
6373	syscall	Iovec	struct
6374	syscall	IPMreq	struct
6375	syscall	IPv6Mreq	struct
6376	syscall	Msghdr	struct
6377	syscall	Cmsghdr	struct
6378	syscall	Inet6Pktinfo	struct
6379	syscall	IPv6MTUInfo	struct
6380	syscall	ICMPv6Filter	struct
6381	syscall	Kevent_t	struct
6382	syscall	FdSet	struct
6383	syscall	IfMsghdr	struct
6384	syscall	IfData	struct
6385	syscall	IfaMsghdr	struct
6386	syscall	IfAnnounceMsghdr	struct
6387	syscall	RtMsghdr	struct
6388	syscall	RtMetrics	struct
6389	syscall	Mclpool	struct
6390	syscall	BpfVersion	struct
6391	syscall	BpfStat	struct
6392	syscall	BpfProgram	struct
6393	syscall	BpfInsn	struct
6394	syscall	BpfHdr	struct
6395	syscall	BpfTimeval	struct
6396	syscall	Termios	struct
6397	syscall	Timespec	struct
6398	syscall	Timeval	struct
6399	syscall	Rusage	struct
6400	syscall	Rlimit	struct
6401	syscall	Stat_t	struct
6402	syscall	Statfs_t	struct
6403	syscall	Flock_t	struct
6404	syscall	Dirent	struct
6405	syscall	Fsid	struct
6406	syscall	RawSockaddrInet4	struct
6407	syscall	RawSockaddrInet6	struct
6408	syscall	RawSockaddrUnix	struct
6409	syscall	RawSockaddrDatalink	struct
6410	syscall	RawSockaddr	struct
6411	syscall	RawSockaddrAny	struct
6412	syscall	Linger	struct
6413	syscall	Iovec	struct
6414	syscall	IPMreq	struct
6415	syscall	IPv6Mreq	struct
6416	syscall	Msghdr	struct
6417	syscall	Cmsghdr	struct
6418	syscall	Inet6Pktinfo	struct
6419	syscall	IPv6MTUInfo	struct
6420	syscall	ICMPv6Filter	struct
6421	syscall	Kevent_t	struct
6422	syscall	FdSet	struct
6423	syscall	IfMsghdr	struct
6424	syscall	IfData	struct
6425	syscall	IfaMsghdr	struct
6426	syscall	IfAnnounceMsghdr	struct
6427	syscall	RtMsghdr	struct
6428	syscall	RtMetrics	struct
6429	syscall	Mclpool	struct
6430	syscall	BpfVersion	struct
6431	syscall	BpfStat	struct
6432	syscall	BpfProgram	struct
6433	syscall	BpfInsn	struct
6434	syscall	BpfHdr	struct
6435	syscall	BpfTimeval	struct
6436	syscall	Termios	struct
6437	syscall	Timespec	struct
6438	syscall	Timeval	struct
6439	syscall	Rusage	struct
6440	syscall	Rlimit	struct
6441	syscall	Stat_t	struct
6442	syscall	Statfs_t	struct
6443	syscall	Flock_t	struct
6444	syscall	Dirent	struct
6445	syscall	Fsid	struct
6446	syscall	RawSockaddrInet4	struct
6447	syscall	RawSockaddrInet6	struct
6448	syscall	RawSockaddrUnix	struct
6449	syscall	RawSockaddrDatalink	struct
6450	syscall	RawSockaddr	struct
6451	syscall	RawSockaddrAny	struct
6452	syscall	Linger	struct
6453	syscall	Iovec	struct
6454	syscall	IPMreq	struct
6455	syscall	IPv6Mreq	struct
6456	syscall	Msghdr	struct
6457	syscall	Cmsghdr	struct
6458	syscall	Inet6Pktinfo	struct
6459	syscall	IPv6MTUInfo	struct
6460	syscall	ICMPv6Filter	struct
6461	syscall	Kevent_t	struct
6462	syscall	FdSet	struct
6463	syscall	IfMsghdr	struct
6464	syscall	IfData	struct
6465	syscall	IfaMsghdr	struct
6466	syscall	IfAnnounceMsghdr	struct
6467	syscall	RtMsghdr	struct
6468	syscall	RtMetrics	struct
6469	syscall	Mclpool	struct
6470	syscall	BpfVersion	struct
6471	syscall	BpfStat	struct
6472	syscall	BpfProgram	struct
6473	syscall	BpfInsn	struct
6474	syscall	BpfHdr	struct
6475	syscall	BpfTimeval	struct
6476	syscall	Termios	struct
6477	syscall	Timespec	struct
6478	syscall	Timeval	struct
6479	syscall	Rusage	struct
6480	syscall	Rlimit	struct
6481	syscall	Stat_t	struct
6482	syscall	Statfs_t	struct
6483	syscall	Flock_t	struct
6484	syscall	Dirent	struct
6485	syscall	Fsid	struct
6486	syscall	RawSockaddrInet4	struct
6487	syscall	RawSockaddrInet6	struct
6488	syscall	RawSockaddrUnix	struct
6489	syscall	RawSockaddrDatalink	struct
6490	syscall	RawSockaddr	struct
6491	syscall	RawSockaddrAny	struct
6492	syscall	Linger	struct
6493	syscall	Iovec	struct
6494	syscall	IPMreq	struct
6495	syscall	IPv6Mreq	struct
6496	syscall	Msghdr	struct
6497	syscall	Cmsghdr	struct
6498	syscall	Inet6Pktinfo	struct
6499	syscall	IPv6MTUInfo	struct
6500	syscall	ICMPv6Filter	struct
6501	syscall	Kevent_t	struct
6502	syscall	FdSet	struct
6503	syscall	IfMsghdr	struct
6504	syscall	IfData	struct
6505	syscall	IfaMsghdr	struct
6506	syscall	IfAnnounceMsghdr	struct
6507	syscall	RtMsghdr	struct
6508	syscall	RtMetrics	struct
6509	syscall	Mclpool	struct
6510	syscall	BpfVersion	struct
6511	syscall	BpfStat	struct
6512	syscall	BpfProgram	struct
6513	syscall	BpfInsn	struct
6514	syscall	BpfHdr	struct
6515	syscall	BpfTimeval	struct
6516	syscall	Termios	struct
6517	syscall	Timespec	struct
6518	syscall	Timeval	struct
6519	syscall	Timeval32	struct
6520	syscall	Rusage	struct
6521	syscall	Rlimit	struct
6522	syscall	Stat_t	struct
6523	syscall	Flock_t	struct
6524	syscall	Dirent	struct
6525	syscall	RawSockaddrInet4	struct
6526	syscall	RawSockaddrInet6	struct
6527	syscall	RawSockaddrUnix	struct
6528	syscall	RawSockaddrDatalink	struct
6529	syscall	RawSockaddr	struct
6530	syscall	RawSockaddrAny	struct
6531	syscall	Linger	struct
6532	syscall	Iovec	struct
6533	syscall	IPMreq	struct
6534	syscall	IPv6Mreq	struct
6535	syscall	Msghdr	struct
6536	syscall	Cmsghdr	struct
6537	syscall	Inet6Pktinfo	struct
6538	syscall	IPv6MTUInfo	struct
6539	syscall	ICMPv6Filter	struct
6540	syscall	FdSet	struct
6541	syscall	IfMsghdr	struct
6542	syscall	IfData	struct
6543	syscall	IfaMsghdr	struct
6544	syscall	RtMsghdr	struct
6545	syscall	RtMetrics	struct
6546	syscall	BpfVersion	struct
6547	syscall	BpfStat	struct
6548	syscall	BpfProgram	struct
6549	syscall	BpfInsn	struct
6550	syscall	BpfTimeval	struct
6551	syscall	BpfHdr	struct
6552	syscall	Termios	struct
6553	testing	InternalBenchmark	struct
6554	testing	B	struct
6555	testing	BenchmarkResult	struct
6556	testing	PB	struct
6557	testing	CoverBlock	struct
6558	testing	Cover	struct
6559	testing	InternalExample	struct
6560	testdeps	TestDeps	struct
6561	quick	Generator	
6562	quick	Config	struct
6563	quick	SetupError	string
6564	quick	CheckError	struct
6565	quick	CheckEqualError	struct
6566	testing	TB	
6567	testing	T	struct
6568	testing	InternalTest	struct
6569	testing	M	struct
6570	scanner	Position	struct
6571	scanner	Scanner	struct
6572	tabwriter	Writer	struct
6573	template	ExecError	struct
6574	template	FuncMap	map[string]interface{}
6575	parse	Node	
6576	parse	NodeType	int
6577	parse	Pos	int
6578	parse	ListNode	struct
6579	parse	TextNode	struct
6580	parse	PipeNode	struct
6581	parse	ActionNode	struct
6582	parse	CommandNode	struct
6583	parse	IdentifierNode	struct
6584	parse	VariableNode	struct
6585	parse	DotNode	struct
6586	parse	NilNode	struct
6587	parse	FieldNode	struct
6588	parse	ChainNode	struct
6589	parse	BoolNode	struct
6590	parse	NumberNode	struct
6591	parse	StringNode	struct
6592	parse	BranchNode	struct
6593	parse	IfNode	struct
6594	parse	RangeNode	struct
6595	parse	WithNode	struct
6596	parse	TemplateNode	struct
6597	parse	Tree	struct
6598	template	Template	struct
6599	time	ParseError	struct
6600	main	MapZone	struct
6601	main	SupplementalData	struct
6602	time	Timer	struct
6603	time	Ticker	struct
6604	time	Time	struct
6605	time	Month	int
6606	time	Weekday	int
6607	time	Duration	int64
6608	time	Location	struct
6609	unicode	RangeTable	struct
6610	unicode	Range16	struct
6611	unicode	Range32	struct
6612	unicode	CaseRange	struct
6613	unicode	SpecialCase	[]unicode.CaseRange
6614	unsafe	ArbitraryType	int
6615	unsafe	Pointer	*unsafe.ArbitraryType
6616	asn1	Tag	uint8
6617	cryptobyte	Builder	struct
6618	cryptobyte	BuilderContinuation	func(*cryptobyte.Builder)
6619	cryptobyte	BuildError	struct
6620	cryptobyte	MarshalingValue	
6621	cryptobyte	String	[]byte
6622	chacha20	Cipher	struct
6623	poly1305	MAC	struct
6624	dnsmessage	Type	uint16
6625	dnsmessage	Class	uint16
6626	dnsmessage	OpCode	uint16
6627	dnsmessage	RCode	uint16
6628	dnsmessage	Header	struct
6629	dnsmessage	Message	struct
6630	dnsmessage	Resource	struct
6631	dnsmessage	ResourceBody	
6632	dnsmessage	Parser	struct
6633	dnsmessage	Builder	struct
6634	dnsmessage	ResourceHeader	struct
6635	dnsmessage	Name	struct
6636	dnsmessage	Question	struct
6637	dnsmessage	CNAMEResource	struct
6638	dnsmessage	MXResource	struct
6639	dnsmessage	NSResource	struct
6640	dnsmessage	PTRResource	struct
6641	dnsmessage	SOAResource	struct
6642	dnsmessage	TXTResource	struct
6643	dnsmessage	SRVResource	struct
6644	dnsmessage	AResource	struct
6645	dnsmessage	AAAAResource	struct
6646	dnsmessage	OPTResource	struct
6647	dnsmessage	Option	struct
6648	httpproxy	Config	struct
6649	hpack	Encoder	struct
6650	hpack	DecodingError	struct
6651	hpack	InvalidIndexError	int
6652	hpack	HeaderField	struct
6653	hpack	Decoder	struct
6654	idna	Option	func(*idna.options)
6655	idna	Profile	struct
6656	idna	Option	func(*idna.options)
6657	idna	Profile	struct
6658	lif	Addr	
6659	lif	Inet4Addr	struct
6660	lif	Inet6Addr	struct
6661	lif	Link	struct
6662	nettest	MakePipe	func() (net.Conn, func(), error)
6663	route	Addr	
6664	route	LinkAddr	struct
6665	route	Inet4Addr	struct
6666	route	Inet6Addr	struct
6667	route	DefaultAddr	struct
6668	route	InterfaceMessage	struct
6669	route	InterfaceAddrMessage	struct
6670	route	InterfaceMulticastAddrMessage	struct
6671	route	InterfaceAnnounceMessage	struct
6672	route	Message	
6673	route	Sys	
6674	route	SysType	int
6675	route	RouteMessage	struct
6676	route	RIBType	int
6677	route	RouteMetrics	struct
6678	route	InterfaceMetrics	struct
6679	route	RouteMetrics	struct
6680	route	InterfaceMetrics	struct
6681	route	RouteMetrics	struct
6682	route	InterfaceMetrics	struct
6683	route	RouteMetrics	struct
6684	route	InterfaceMetrics	struct
6685	route	RouteMetrics	struct
6686	route	InterfaceMetrics	struct
6687	cpu	CacheLinePad	struct
6688	bidirule	Transformer	struct
6689	transform	Transformer	
6690	transform	SpanningTransformer	
6691	transform	NopResetter	struct
6692	transform	Reader	struct
6693	transform	Writer	struct
6694	bidi	Direction	int
6695	bidi	Option	func(*bidi.options)
6696	bidi	Paragraph	struct
6697	bidi	Ordering	struct
6698	bidi	Run	struct
6699	bidi	Properties	struct
6700	bidi	Class	uint
6701	norm	Properties	struct
6702	norm	Iter	struct
6703	norm	Form	int
\.


--
-- Data for Name: interface_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interface_methods (id, package, name, parameters, return_values, receiver_name, receiver_id) FROM stdin;
1	dep	N	{[]byte}	{}		1
2	p1	Name	{}	{string}		2
3	p1	p1.Namer	{}	{}		3
4	p1	ptwo.Twoer	{}	{}		3
5	p1	Set	{string,int64}	{}		3
6	p1	Get	{string}	{int64}		3
7	p1	GetNamed	{string}	{int64}		3
8	p1	X	{}	{}		4
9	p1	Y	{}	{}		4
10	p1	X	{}	{}		5
11	p1	Temporary	{}	{bool}		6
12	p2	PackageTwoMeth	{}	{}		7
13	lex	Next	{}	{lex.ScanToken}		8
14	lex	Text	{}	{string}		8
15	lex	File	{}	{string}		8
16	lex	Base	{}	{*src.PosBase}		8
17	lex	SetBase	{*src.PosBase}	{}		8
18	lex	Line	{}	{int}		8
19	lex	Col	{}	{int}		8
20	lex	Close	{}	{}		8
21	gc	IsBoolFlag	{}	{bool}		10
22	gc	IsCountFlag	{}	{bool}		11
23	ssa	Logf	{string,"...interface{}"}	{}		15
24	ssa	Log	{}	{bool}		15
25	ssa	Fatalf	{src.XPos,string,"...interface{}"}	{}		15
26	ssa	Warnl	{src.XPos,string,"...interface{}"}	{}		15
27	ssa	Debug_checknil	{}	{bool}		15
28	ssa	CanSSA	{*types.Type}	{bool}		16
29	ssa	ssa.Logger	{}	{}		16
30	ssa	StringData	{string}	{"interface{}"}		16
31	ssa	Auto	{src.XPos,*types.Type}	{ssa.GCNode}		16
32	ssa	SplitString	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		16
33	ssa	SplitInterface	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		16
34	ssa	SplitSlice	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot,ssa.LocalSlot}		16
35	ssa	SplitComplex	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		16
36	ssa	SplitStruct	{ssa.LocalSlot,int}	{ssa.LocalSlot}		16
37	ssa	SplitArray	{ssa.LocalSlot}	{ssa.LocalSlot}		16
38	ssa	SplitInt64	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		16
39	ssa	DerefItab	{*obj.LSym,int64}	{*obj.LSym}		16
40	ssa	Line	{src.XPos}	{string}		16
41	ssa	AllocFrame	{*ssa.Func}	{}		16
42	ssa	Syslook	{string}	{*obj.LSym}		16
43	ssa	UseWriteBarrier	{}	{bool}		16
44	ssa	SetWBPos	{src.XPos}	{}		16
45	ssa	Typ	{}	{*types.Type}		17
46	ssa	String	{}	{string}		17
47	ssa	IsSynthetic	{}	{bool}		17
48	ssa	IsAutoTmp	{}	{bool}		17
49	ssa	StorageClass	{}	{ssa.StorageClass}		17
50	ssa	String	{}	{string}		18
51	syntax	Pos	{}	{syntax.Pos}		20
52	syntax	syntax.Node	{}	{}		21
53	syntax	syntax.Node	{}	{}		22
54	syntax	syntax.Node	{}	{}		23
55	syntax	syntax.Stmt	{}	{}		24
56	pkg	ExportedMethod	{}	{}		26
57	pkg	io.Reader	{}	{}		26
58	filelock	Name	{}	{string}		27
59	filelock	Fd	{}	{uintptr}		27
60	filelock	Stat	{}	{os.FileInfo,error}		27
61	codehost	Tags	{string}	{[]string,error}		28
62	codehost	Stat	{string}	{*codehost.RevInfo,error}		28
63	codehost	Latest	{}	{*codehost.RevInfo,error}		28
64	codehost	ReadFile	{string,string,int64}	{[]byte,error}		28
65	codehost	ReadFileRevs	{[]string,string,int64}	{map[string]*codehost.FileRev,error}		28
66	codehost	ReadZip	{string,string,int64}	{io.ReadCloser,string,error}		28
67	codehost	RecentTag	{string,string,string}	{string,error}		28
68	codehost	DescendsFrom	{string,string}	{bool,error}		28
69	modfetch	ModulePath	{}	{string}		29
70	modfetch	Versions	{string}	{[]string,error}		29
71	modfetch	Stat	{string}	{*modfetch.RevInfo,error}		29
72	modfetch	Latest	{}	{*modfetch.RevInfo,error}		29
73	modfetch	GoMod	{string}	{[]byte,error}		29
74	modfetch	Zip	{io.Writer,string}	{error}		29
75	modfile	Span	{}	{modfile.Position}		30
76	modfile	Comment	{}	{*modfile.Comments}		30
77	mvs	Required	{module.Version}	{[]module.Version,error}		31
78	mvs	Max	{string,string}	{string}		31
79	mvs	Upgrade	{module.Version}	{module.Version,error}		31
80	mvs	Previous	{module.Version}	{module.Version,error}		31
81	note	Name	{}	{string}		32
82	note	KeyHash	{}	{uint32}		32
83	note	Verify	{[]byte,[]byte}	{bool}		32
84	note	Name	{}	{string}		33
85	note	KeyHash	{}	{uint32}		33
86	note	Sign	{[]byte}	{[]byte,error}		33
87	note	Verifier	{string,uint32}	{note.Verifier,error}		34
88	sumweb	ReadRemote	{string}	{[]byte,error}		35
89	sumweb	ReadConfig	{string}	{[]byte,error}		35
90	sumweb	WriteConfig	{string,[]byte,[]byte}	{error}		35
91	sumweb	ReadCache	{string}	{[]byte,error}		35
92	sumweb	WriteCache	{string,[]byte}	{}		35
93	sumweb	Log	{string}	{}		35
94	sumweb	SecurityError	{string}	{}		35
95	sumweb	NewContext	{*http.Request}	{context.Context,error}		36
96	sumweb	Signed	{context.Context}	{[]byte,error}		36
97	sumweb	ReadRecords	{context.Context,int64,int64}	{[][]byte,error}		36
98	sumweb	Lookup	{context.Context,string}	{int64,error}		36
99	sumweb	ReadTileData	{context.Context,tlog.Tile}	{[]byte,error}		36
100	tlog	Height	{}	{int}		37
101	tlog	ReadTiles	{[]tlog.Tile}	{[][]byte,error}		37
102	tlog	SaveTiles	{[]tlog.Tile,[][]byte}	{}		37
103	tlog	ReadHashes	{[]int64}	{[]tlog.Hash,error}		38
104	p	p.A1	{}	{}		40
105	p	p.B1	{}	{}		41
106	p	p.C1	{}	{}		42
107	dwarf	Len	{}	{int64}		43
108	dwarf	PtrSize	{}	{int}		44
109	dwarf	AddInt	{dwarf.Sym,int,int64}	{}		44
110	dwarf	AddBytes	{dwarf.Sym,[]byte}	{}		44
111	dwarf	AddAddress	{dwarf.Sym,"interface{}",int64}	{}		44
112	dwarf	AddCURelativeAddress	{dwarf.Sym,"interface{}",int64}	{}		44
113	dwarf	AddSectionOffset	{dwarf.Sym,int,"interface{}",int64}	{}		44
114	dwarf	AddDWARFAddrSectionOffset	{dwarf.Sym,"interface{}",int64}	{}		44
115	dwarf	CurrentOffset	{dwarf.Sym}	{int64}		44
116	dwarf	RecordDclReference	{dwarf.Sym,dwarf.Sym,int,int}	{}		44
117	dwarf	RecordChildDieOffsets	{dwarf.Sym,[]*dwarf.Var,[]int32}	{}		44
118	dwarf	AddString	{dwarf.Sym,string}	{}		44
119	dwarf	AddFileRef	{dwarf.Sym,"interface{}"}	{}		44
120	dwarf	Logf	{string,"...interface{}"}	{}		44
121	objfile	PCToLine	{uint64}	{string,int,*gosym.Func}		48
122	objfile	String	{uint64}	{string}		49
123	main	Name	{}	{string}		51
124	main	Stat	{}	{os.FileInfo,error}		51
125	main	Read	{[]byte}	{int,error}		51
126	main	Close	{}	{error}		51
127	driver	Open	{string}	{io.WriteCloser,error}		53
128	driver	Bool	{string,bool,string}	{*bool}		54
129	driver	Int	{string,int,string}	{*int}		54
130	driver	Float64	{string,float64,string}	{*float64}		54
131	driver	String	{string,string,string}	{*string}		54
132	driver	BoolVar	{*bool,string,bool,string}	{}		54
133	driver	IntVar	{*int,string,int,string}	{}		54
134	driver	Float64Var	{*float64,string,float64,string}	{}		54
135	driver	StringVar	{*string,string,string,string}	{}		54
202	heap	Pop	{}	{"interface{}"}		81
136	driver	StringList	{string,string,string}	{*[]*string}		54
137	driver	ExtraUsage	{}	{string}		54
138	driver	AddExtraUsage	{string}	{}		54
139	driver	Parse	{func()}	{[]string}		54
140	driver	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		55
141	driver	Symbolize	{string,driver.MappingSources,*profile.Profile}	{error}		56
142	driver	Open	{string,uint64,uint64,uint64}	{driver.ObjFile,error}		57
143	driver	Disasm	{string,uint64,uint64}	{[]driver.Inst,error}		57
144	driver	Name	{}	{string}		58
145	driver	Base	{}	{uint64}		58
146	driver	BuildID	{}	{string}		58
147	driver	SourceLine	{uint64}	{[]driver.Frame,error}		58
148	driver	Symbols	{*regexp.Regexp,uint64}	{[]*driver.Sym,error}		58
149	driver	Close	{}	{error}		58
150	driver	ReadLine	{string}	{string,error}		59
151	driver	Print	{"...interface{}"}	{}		59
152	driver	PrintErr	{"...interface{}"}	{}		59
153	driver	IsTerminal	{}	{bool}		59
154	driver	WantBrowser	{}	{bool}		59
155	driver	SetAutoComplete	{"func(string) string"}	{}		59
156	plugin	Open	{string}	{io.WriteCloser,error}		60
157	plugin	Bool	{string,bool,string}	{*bool}		61
158	plugin	Int	{string,int,string}	{*int}		61
159	plugin	Float64	{string,float64,string}	{*float64}		61
160	plugin	String	{string,string,string}	{*string}		61
161	plugin	BoolVar	{*bool,string,bool,string}	{}		61
162	plugin	IntVar	{*int,string,int,string}	{}		61
163	plugin	Float64Var	{*float64,string,float64,string}	{}		61
164	plugin	StringVar	{*string,string,string,string}	{}		61
165	plugin	StringList	{string,string,string}	{*[]*string}		61
166	plugin	ExtraUsage	{}	{string}		61
167	plugin	AddExtraUsage	{string}	{}		61
168	plugin	Parse	{func()}	{[]string}		61
169	plugin	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		62
170	plugin	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}		63
171	plugin	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}		64
172	plugin	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}		64
173	plugin	Name	{}	{string}		65
174	plugin	Base	{}	{uint64}		65
175	plugin	BuildID	{}	{string}		65
176	plugin	SourceLine	{uint64}	{[]plugin.Frame,error}		65
177	plugin	Symbols	{*regexp.Regexp,uint64}	{[]*plugin.Sym,error}		65
178	plugin	Close	{}	{error}		65
179	plugin	ReadLine	{string}	{string,error}		66
180	plugin	Print	{"...interface{}"}	{}		66
181	plugin	PrintErr	{"...interface{}"}	{}		66
182	plugin	IsTerminal	{}	{bool}		66
183	plugin	WantBrowser	{}	{bool}		66
184	plugin	SetAutoComplete	{"func(string) string"}	{}		66
185	demangle	Traverse	{"func(demangle.AST) bool"}	{}		67
186	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}		67
187	demangle	GoString	{}	{string}		67
188	armasm	IsArg	{}	{}		68
189	armasm	String	{}	{string}		68
190	arm64asm	String	{}	{string}		69
191	ppc64asm	IsArg	{}	{}		70
192	ppc64asm	String	{}	{string}		70
193	x86asm	String	{}	{string}		71
194	analysis	AFact	{}	{}		75
195	analysisflags	IsBoolFlag	{}	{bool}		76
196	flate	Reset	{io.Reader,[]byte}	{error}		78
197	flate	io.Reader	{}	{}		79
198	flate	io.ByteReader	{}	{}		79
199	zlib	Reset	{io.Reader,[]byte}	{error}		80
200	heap	sort.Interface	{}	{}		81
201	heap	Push	{"interface{}"}	{}		81
203	context	Deadline	{}	{time.Time,bool}		84
204	context	Done	{}	{"chan struct{}\n"}		84
205	context	Err	{}	{error}		84
206	context	Value	{"interface{}"}	{"interface{}"}		84
207	cipher	BlockSize	{}	{int}		85
208	cipher	Encrypt	{[]byte,[]byte}	{}		85
209	cipher	Decrypt	{[]byte,[]byte}	{}		85
210	cipher	XORKeyStream	{[]byte,[]byte}	{}		86
211	cipher	BlockSize	{}	{int}		87
212	cipher	CryptBlocks	{[]byte,[]byte}	{}		87
213	cipher	NonceSize	{}	{int}		88
214	cipher	Overhead	{}	{int}		88
215	cipher	Seal	{[]byte,[]byte,[]byte,[]byte}	{[]byte}		88
216	cipher	Open	{[]byte,[]byte,[]byte,[]byte}	{[]byte,error}		88
217	crypto	Public	{}	{crypto.PublicKey}		91
218	crypto	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}		91
219	crypto	HashFunc	{}	{crypto.Hash}		92
220	crypto	Public	{}	{crypto.PublicKey}		93
221	crypto	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}		93
222	elliptic	Params	{}	{*elliptic.CurveParams}		95
223	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}		95
224	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}		95
225	elliptic	Double	{*big.Int,*big.Int}	{*big.Int}		95
226	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int}		95
227	elliptic	ScalarBaseMult	{[]byte}	{*big.Int}		95
228	tls	Get	{string}	{*tls.ClientSessionState,bool}		96
229	tls	Put	{string,*tls.ClientSessionState}	{}		96
230	driver	Open	{string}	{driver.Conn,error}		101
231	driver	OpenConnector	{string}	{driver.Connector,error}		102
232	driver	Connect	{context.Context}	{driver.Conn,error}		103
233	driver	Driver	{}	{driver.Driver}		103
234	driver	Ping	{context.Context}	{error}		104
235	driver	Exec	{string,[]driver.Value}	{driver.Result,error}		105
236	driver	ExecContext	{context.Context,string,[]driver.NamedValue}	{driver.Result,error}		106
237	driver	Query	{string,[]driver.Value}	{driver.Rows,error}		107
238	driver	QueryContext	{context.Context,string,[]driver.NamedValue}	{driver.Rows,error}		108
239	driver	Prepare	{string}	{driver.Stmt,error}		109
240	driver	Close	{}	{error}		109
241	driver	Begin	{}	{driver.Tx,error}		109
242	driver	PrepareContext	{context.Context,string}	{driver.Stmt,error}		110
243	driver	BeginTx	{context.Context,driver.TxOptions}	{driver.Tx,error}		111
244	driver	ResetSession	{context.Context}	{error}		112
245	driver	LastInsertId	{}	{int64,error}		113
246	driver	RowsAffected	{}	{int64,error}		113
247	driver	Close	{}	{error}		114
248	driver	NumInput	{}	{int}		114
249	driver	Exec	{[]driver.Value}	{driver.Result,error}		114
250	driver	Query	{[]driver.Value}	{driver.Rows,error}		114
251	driver	ExecContext	{context.Context,[]driver.NamedValue}	{driver.Result,error}		115
252	driver	QueryContext	{context.Context,[]driver.NamedValue}	{driver.Rows,error}		116
253	driver	CheckNamedValue	{*driver.NamedValue}	{error}		117
254	driver	ColumnConverter	{int}	{driver.ValueConverter}		118
255	driver	Columns	{}	{[]string}		119
256	driver	Close	{}	{error}		119
257	driver	Next	{[]driver.Value}	{error}		119
258	driver	driver.Rows	{}	{}		120
259	driver	HasNextResultSet	{}	{bool}		120
260	driver	NextResultSet	{}	{error}		120
261	driver	driver.Rows	{}	{}		121
262	driver	ColumnTypeScanType	{int}	{reflect.Type}		121
263	driver	driver.Rows	{}	{}		122
264	driver	ColumnTypeDatabaseTypeName	{int}	{string}		122
265	driver	driver.Rows	{}	{}		123
492	os	IsDir	{}	{bool}		260
266	driver	ColumnTypeLength	{int}	{int64,bool}		123
267	driver	driver.Rows	{}	{}		124
268	driver	ColumnTypeNullable	{int}	{bool}		124
269	driver	driver.Rows	{}	{}		125
270	driver	ColumnTypePrecisionScale	{int}	{int64,bool}		125
271	driver	Commit	{}	{error}		126
272	driver	Rollback	{}	{error}		126
273	driver	ConvertValue	{"interface{}"}	{driver.Value,error}		127
274	driver	Value	{}	{driver.Value,error}		128
275	sql	Scan	{"interface{}"}	{error}		130
276	sql	LastInsertId	{}	{int64,error}		132
277	sql	RowsAffected	{}	{int64,error}		132
278	dwarf	Common	{}	{*dwarf.CommonType}		134
279	dwarf	String	{}	{string}		134
280	dwarf	Size	{}	{int64}		134
281	macho	Raw	{}	{[]byte}		135
282	binary	Uint16	{[]byte}	{uint16}		137
283	binary	Uint32	{[]byte}	{uint32}		137
284	binary	Uint64	{[]byte}	{uint64}		137
285	binary	PutUint16	{[]byte,uint16}	{}		137
286	binary	PutUint32	{[]byte,uint32}	{}		137
287	binary	PutUint64	{[]byte,uint64}	{}		137
288	binary	String	{}	{string}		137
289	encoding	MarshalBinary	{}	{[]byte,error}		138
290	encoding	UnmarshalBinary	{[]byte}	{error}		139
291	encoding	MarshalText	{}	{[]byte,error}		140
292	encoding	UnmarshalText	{[]byte}	{error}		141
293	gob	GobEncode	{}	{[]byte,error}		142
294	gob	GobDecode	{[]byte}	{error}		143
295	json	UnmarshalJSON	{[]byte}	{error}		144
296	json	MarshalJSON	{}	{[]byte,error}		145
297	xml	MarshalXML	{*xml.Encoder,xml.StartElement}	{error}		147
298	xml	MarshalXMLAttr	{xml.Name}	{xml.Attr,error}		148
299	xml	UnmarshalXML	{*xml.Decoder,xml.StartElement}	{error}		149
300	xml	UnmarshalXMLAttr	{xml.Attr}	{error}		150
301	xml	Token	{}	{xml.Token,error}		152
302	expvar	String	{}	{string}		153
303	flag	String	{}	{string}		154
304	flag	Set	{string}	{error}		154
305	flag	flag.Value	{}	{}		155
306	flag	Get	{}	{"interface{}"}		155
307	fmt	Write	{[]byte}	{int,error}		156
308	fmt	Width	{}	{int,bool}		156
309	fmt	Precision	{}	{int,bool}		156
310	fmt	Flag	{int}	{bool}		156
311	fmt	Format	{fmt.State,rune}	{}		157
312	fmt	String	{}	{string}		158
313	fmt	GoString	{}	{string}		159
314	fmt	ReadRune	{}	{rune,int,error}		160
315	fmt	UnreadRune	{}	{error}		160
316	fmt	SkipSpace	{}	{}		160
317	fmt	Token	{bool,"func(rune) bool"}	{[]byte,error}		160
318	fmt	Width	{}	{int,bool}		160
319	fmt	Read	{[]byte}	{int,error}		160
320	fmt	Scan	{fmt.ScanState,rune}	{error}		161
321	ast	Pos	{}	{token.Pos}		162
322	ast	End	{}	{token.Pos}		162
323	ast	ast.Node	{}	{}		163
324	ast	ast.Node	{}	{}		164
325	ast	ast.Node	{}	{}		165
326	ast	ast.Node	{}	{}		166
327	ast	Visit	{ast.Node}	{ast.Visitor}		170
328	constant	Kind	{}	{constant.Kind}		171
329	constant	String	{}	{string}		171
330	constant	ExactString	{}	{string}		171
331	exports	exports.T12	{}	{}		180
332	exports	exports.T13	{}	{}		180
333	p	M	{}	{}		181
334	issue25301	M	{}	{}		182
335	issue25301	issue25301.A	{}	{}		183
336	issue25596	M	{}	{issue25596.T}		184
337	issue25596	issue25596.E	{}	{}		185
338	types	Import	{string}	{*types.Package,error}		187
339	types	types.Importer	{}	{}		188
340	types	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}		188
341	types	Parent	{}	{*types.Scope}		189
342	types	Pos	{}	{token.Pos}		189
343	types	Pkg	{}	{*types.Package}		189
344	types	Name	{}	{string}		189
345	types	Type	{}	{types.Type}		189
346	types	Exported	{}	{bool}		189
347	types	Id	{}	{string}		189
348	types	String	{}	{string}		189
349	types	Alignof	{types.Type}	{int64}		190
350	types	Offsetsof	{[]*types.Var}	{[]int64}		190
351	types	Sizeof	{types.Type}	{int64}		190
352	types	Underlying	{}	{types.Type}		191
353	types	String	{}	{string}		191
354	hash	io.Writer	{}	{}		192
355	hash	Sum	{[]byte}	{[]byte}		192
356	hash	Reset	{}	{}		192
357	hash	Size	{}	{int}		192
358	hash	BlockSize	{}	{int}		192
359	hash	hash.Hash	{}	{}		193
360	hash	Sum32	{}	{uint32}		193
361	hash	hash.Hash	{}	{}		194
362	hash	Sum64	{}	{uint64}		194
363	color	RGBA	{}	{uint32}		195
364	color	Convert	{color.Color}	{color.Color}		196
365	draw	image.Image	{}	{}		197
366	draw	Set	{int,int,color.Color}	{}		197
367	draw	Quantize	{color.Palette,image.Image}	{color.Palette}		198
368	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}		199
369	image	ColorModel	{}	{color.Model}		200
370	image	Bounds	{}	{image.Rectangle}		200
371	image	At	{int,int}	{color.Color}		200
372	image	ColorIndexAt	{int,int}	{uint8}		201
373	image	image.Image	{}	{}		201
374	jpeg	io.ByteReader	{}	{}		202
375	jpeg	io.Reader	{}	{}		202
376	png	Get	{}	{*png.EncoderBuffer}		203
377	png	Put	{*png.EncoderBuffer}	{}		203
378	reflectlite	Name	{}	{string}		204
379	reflectlite	PkgPath	{}	{string}		204
380	reflectlite	Size	{}	{uintptr}		204
381	reflectlite	Kind	{}	{reflectlite.Kind}		204
382	reflectlite	Implements	{reflectlite.Type}	{bool}		204
383	reflectlite	AssignableTo	{reflectlite.Type}	{bool}		204
384	reflectlite	Comparable	{}	{bool}		204
385	reflectlite	String	{}	{string}		204
386	reflectlite	Elem	{}	{reflectlite.Type}		204
387	testlog	Getenv	{string}	{}		206
388	testlog	Stat	{string}	{}		206
389	testlog	Open	{string}	{}		206
390	testlog	Chdir	{string}	{}		206
391	io	Read	{[]byte}	{int,error}		207
392	io	Write	{[]byte}	{int,error}		208
393	io	Close	{}	{error}		209
394	io	Seek	{int64,int}	{int64,error}		210
395	io	io.Reader	{}	{}		211
396	io	io.Writer	{}	{}		211
397	io	io.Reader	{}	{}		212
398	io	io.Closer	{}	{}		212
399	io	io.Writer	{}	{}		213
400	io	io.Closer	{}	{}		213
401	io	io.Reader	{}	{}		214
402	io	io.Writer	{}	{}		214
403	io	io.Closer	{}	{}		214
404	io	io.Reader	{}	{}		215
405	io	io.Seeker	{}	{}		215
406	io	io.Writer	{}	{}		216
407	io	io.Seeker	{}	{}		216
408	io	io.Reader	{}	{}		217
409	io	io.Writer	{}	{}		217
410	io	io.Seeker	{}	{}		217
411	io	ReadFrom	{io.Reader}	{int64,error}		218
412	io	WriteTo	{io.Writer}	{int64,error}		219
413	io	ReadAt	{[]byte,int64}	{int,error}		220
414	io	WriteAt	{[]byte,int64}	{int,error}		221
415	io	ReadByte	{}	{byte,error}		222
416	io	io.ByteReader	{}	{}		223
417	io	UnreadByte	{}	{error}		223
418	io	WriteByte	{byte}	{error}		224
419	io	ReadRune	{}	{rune,int,error}		225
420	io	io.RuneReader	{}	{}		226
421	io	UnreadRune	{}	{error}		226
422	io	WriteString	{string}	{int,error}		227
423	rand	Int63	{}	{int64}		228
424	rand	Seed	{int64}	{}		228
425	rand	rand.Source	{}	{}		229
426	rand	Uint64	{}	{uint64}		229
427	multipart	io.Reader	{}	{}		230
428	multipart	io.ReaderAt	{}	{}		230
429	multipart	io.Seeker	{}	{}		230
430	multipart	io.Closer	{}	{}		230
431	http	RoundTrip	{*http.Request}	{*http.Response,error}		231
432	cookiejar	PublicSuffix	{string}	{string}		232
433	cookiejar	String	{}	{string}		232
434	http	Open	{string}	{http.File,error}		233
435	http	io.Closer	{}	{}		234
436	http	io.Reader	{}	{}		234
437	http	io.Seeker	{}	{}		234
438	http	Readdir	{int}	{[]os.FileInfo,error}		234
439	http	Stat	{}	{os.FileInfo,error}		234
440	http	Push	{string,*http.PushOptions}	{error}		236
441	httputil	Get	{}	{[]byte}		237
442	httputil	Put	{[]byte}	{}		237
443	http	SetCookies	{*url.URL,[]*http.Cookie}	{}		238
444	http	Cookies	{*url.URL}	{[]*http.Cookie}		238
445	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}		239
446	http	Header	{}	{http.Header}		240
447	http	Write	{[]byte}	{int,error}		240
448	http	WriteHeader	{int}	{}		240
449	http	Flush	{}	{}		241
450	http	Hijack	{}	{net.Conn,*bufio.ReadWriter,error}		242
451	http	CloseNotify	{}	{"chan bool\n"}		243
452	net	Network	{}	{string}		244
453	net	String	{}	{string}		244
454	net	Read	{[]byte}	{int,error}		245
455	net	Write	{[]byte}	{int,error}		245
456	net	Close	{}	{error}		245
457	net	LocalAddr	{}	{net.Addr}		245
458	net	RemoteAddr	{}	{net.Addr}		245
459	net	SetDeadline	{time.Time}	{error}		245
460	net	SetReadDeadline	{time.Time}	{error}		245
461	net	SetWriteDeadline	{time.Time}	{error}		245
462	net	ReadFrom	{[]byte}	{int,net.Addr,error}		246
463	net	WriteTo	{[]byte,net.Addr}	{int,error}		246
464	net	Close	{}	{error}		246
465	net	LocalAddr	{}	{net.Addr}		246
466	net	SetDeadline	{time.Time}	{error}		246
467	net	SetReadDeadline	{time.Time}	{error}		246
468	net	SetWriteDeadline	{time.Time}	{error}		246
469	net	Accept	{}	{net.Conn,error}		247
470	net	Close	{}	{error}		247
471	net	Addr	{}	{net.Addr}		247
472	net	Timeout	{}	{bool}		248
473	net	Temporary	{}	{bool}		248
474	rpc	WriteRequest	{*rpc.Request,"interface{}"}	{error}		251
475	rpc	ReadResponseHeader	{*rpc.Response}	{error}		251
476	rpc	ReadResponseBody	{"interface{}"}	{error}		251
477	rpc	Close	{}	{error}		251
478	rpc	ReadRequestHeader	{*rpc.Request}	{error}		255
479	rpc	ReadRequestBody	{"interface{}"}	{error}		255
480	rpc	WriteResponse	{*rpc.Response,"interface{}"}	{error}		255
481	rpc	Close	{}	{error}		255
482	smtp	Start	{*smtp.ServerInfo}	{string,[]byte,error}		256
483	smtp	Next	{[]byte,bool}	{[]byte,error}		256
484	url	Timeout	{}	{bool}		257
485	url	Temporary	{}	{bool}		258
486	os	String	{}	{string}		259
487	os	Signal	{}	{}		259
488	os	Name	{}	{string}		260
489	os	Size	{}	{int64}		260
490	os	Mode	{}	{os.FileMode}		260
491	os	ModTime	{}	{time.Time}		260
493	os	Sys	{}	{"interface{}"}		260
494	reflect	Align	{}	{int}		262
495	reflect	FieldAlign	{}	{int}		262
496	reflect	Method	{int}	{reflect.Method}		262
497	reflect	MethodByName	{string}	{reflect.Method,bool}		262
498	reflect	NumMethod	{}	{int}		262
499	reflect	Name	{}	{string}		262
500	reflect	PkgPath	{}	{string}		262
501	reflect	Size	{}	{uintptr}		262
502	reflect	String	{}	{string}		262
503	reflect	Kind	{}	{reflect.Kind}		262
504	reflect	Implements	{reflect.Type}	{bool}		262
505	reflect	AssignableTo	{reflect.Type}	{bool}		262
506	reflect	ConvertibleTo	{reflect.Type}	{bool}		262
507	reflect	Comparable	{}	{bool}		262
508	reflect	Bits	{}	{int}		262
509	reflect	ChanDir	{}	{reflect.ChanDir}		262
510	reflect	IsVariadic	{}	{bool}		262
511	reflect	Elem	{}	{reflect.Type}		262
512	reflect	Field	{int}	{reflect.StructField}		262
513	reflect	FieldByIndex	{[]int}	{reflect.StructField}		262
514	reflect	FieldByName	{string}	{reflect.StructField,bool}		262
515	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.StructField,bool}		262
516	reflect	In	{int}	{reflect.Type}		262
517	reflect	Key	{}	{reflect.Type}		262
518	reflect	Len	{}	{int}		262
519	reflect	NumField	{}	{int}		262
520	reflect	NumIn	{}	{int}		262
521	reflect	NumOut	{}	{int}		262
522	reflect	Out	{int}	{reflect.Type}		262
523	runtime	RuntimeError	{}	{}		263
524	sort	Len	{}	{int}		264
525	sort	Less	{int,int}	{bool}		264
526	sort	Swap	{int,int}	{}		264
527	sync	Lock	{}	{}		265
528	sync	Unlock	{}	{}		265
529	js	JSValue	{}	{js.Value}		266
530	syscall	Control	{func(uintptr)}	{error}		267
531	syscall	Read	{"func(uintptr) bool"}	{error}		267
532	syscall	Write	{"func(uintptr) bool"}	{error}		267
533	syscall	SyscallConn	{}	{syscall.RawConn,error}		268
534	quick	Generate	{*rand.Rand,int}	{reflect.Value}		275
535	testing	Error	{"...interface{}"}	{}		276
536	testing	Errorf	{string,"...interface{}"}	{}		276
537	testing	Fail	{}	{}		276
538	testing	FailNow	{}	{}		276
539	testing	Failed	{}	{bool}		276
540	testing	Fatal	{"...interface{}"}	{}		276
541	testing	Fatalf	{string,"...interface{}"}	{}		276
542	testing	Log	{"...interface{}"}	{}		276
543	testing	Logf	{string,"...interface{}"}	{}		276
544	testing	Name	{}	{string}		276
545	testing	Skip	{"...interface{}"}	{}		276
546	testing	SkipNow	{}	{}		276
547	testing	Skipf	{string,"...interface{}"}	{}		276
548	testing	Skipped	{}	{bool}		276
549	testing	Helper	{}	{}		276
550	parse	Type	{}	{parse.NodeType}		277
551	parse	String	{}	{string}		277
552	parse	Copy	{}	{parse.Node}		277
553	parse	Position	{}	{parse.Pos}		277
554	cryptobyte	Marshal	{*cryptobyte.Builder}	{error}		278
555	dnsmessage	GoString	{}	{string}		279
556	lif	Family	{}	{int}		280
557	route	Family	{}	{int}		281
558	route	Sys	{}	{[]route.Sys}		282
559	route	SysType	{}	{route.SysType}		283
560	transform	Transform	{[]byte,[]byte,bool}	{int,error}		284
561	transform	Reset	{}	{}		284
562	transform	transform.Transformer	{}	{}		285
563	transform	Span	{[]byte,bool}	{int,error}		285
\.


--
-- Data for Name: interfaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interfaces (id, package, name, implementable) FROM stdin;
1	dep	Interface	t
2	p1	Namer	t
3	p1	I	f
4	p1	Public	t
5	p1	Private	f
6	p1	Error	f
7	p2	Twoer	t
8	lex	TokenReader	t
9	gc	U	t
10	gc	BoolFlag	t
11	gc	CountFlag	t
12	gc	E	t
13	ssa	Aux	t
14	ssa	Liveness	t
15	ssa	Logger	t
16	ssa	Frontend	t
17	ssa	GCNode	t
18	ssa	Location	t
19	ssa	Aux	t
20	syntax	Node	f
21	syntax	Decl	f
22	syntax	Expr	f
23	syntax	Stmt	f
24	syntax	SimpleStmt	f
25	types	Extra	t
26	pkg	ExportedInterface	f
27	filelock	File	t
28	codehost	Repo	t
29	modfetch	Repo	t
30	modfile	Expr	t
31	mvs	Reqs	t
32	note	Verifier	t
33	note	Signer	t
34	note	Verifiers	t
35	sumweb	Client	t
36	sumweb	Server	t
37	tlog	TileReader	t
38	tlog	HashReader	t
39	p	A1	f
40	p	B1	t
41	p	C1	t
42	p	D1	t
43	dwarf	Sym	t
44	dwarf	Context	t
45	dwarf	Data	t
46	obj	Val	t
47	obj	Curfn	t
48	objfile	Liner	t
49	objfile	RelocStringer	t
50	sym	Elfsect	t
51	main	FileLike	t
52	main	Arg	t
53	driver	Writer	t
54	driver	FlagSet	t
55	driver	Fetcher	t
56	driver	Symbolizer	t
57	driver	ObjTool	t
58	driver	ObjFile	t
59	driver	UI	t
60	plugin	Writer	t
61	plugin	FlagSet	t
62	plugin	Fetcher	t
63	plugin	Symbolizer	t
64	plugin	ObjTool	t
65	plugin	ObjFile	t
66	plugin	UI	t
67	demangle	AST	f
68	armasm	Arg	t
69	arm64asm	Arg	f
70	ppc64asm	Arg	t
71	x86asm	Arg	f
72	unix	Sockaddr	f
73	windows	Sockaddr	f
74	analysis	Analyzer	t
75	analysis	Fact	t
76	analysisflags	Value	t
77	unitchecker	Analyzer	t
78	flate	Resetter	t
79	flate	Reader	t
80	zlib	Resetter	t
81	heap	Interface	t
82	list	Value	t
83	ring	Value	t
84	context	Context	t
85	cipher	Block	t
86	cipher	Stream	t
87	cipher	BlockMode	t
88	cipher	AEAD	t
89	crypto	PublicKey	t
90	crypto	PrivateKey	t
91	crypto	Signer	t
92	crypto	SignerOpts	t
93	crypto	Decrypter	t
94	crypto	DecrypterOpts	t
95	elliptic	Curve	t
96	tls	ClientSessionCache	t
97	pkix	Value	t
98	x509	PublicKey	t
99	x509	PublicKey	t
100	driver	Value	t
101	driver	Driver	t
102	driver	DriverContext	t
103	driver	Connector	t
104	driver	Pinger	t
105	driver	Execer	t
106	driver	ExecerContext	t
107	driver	Queryer	t
108	driver	QueryerContext	t
109	driver	Conn	t
110	driver	ConnPrepareContext	t
111	driver	ConnBeginTx	t
112	driver	SessionResetter	t
113	driver	Result	t
114	driver	Stmt	t
115	driver	StmtExecContext	t
116	driver	StmtQueryContext	t
117	driver	NamedValueChecker	t
118	driver	ColumnConverter	t
119	driver	Rows	t
120	driver	RowsNextResultSet	t
121	driver	RowsColumnTypeScanType	t
122	driver	RowsColumnTypeDatabaseTypeName	t
123	driver	RowsColumnTypeLength	t
124	driver	RowsColumnTypeNullable	t
125	driver	RowsColumnTypePrecisionScale	t
126	driver	Tx	t
127	driver	ValueConverter	t
128	driver	Valuer	t
129	sql	Value	t
130	sql	Scanner	t
131	sql	Dest	t
132	sql	Result	t
133	dwarf	Val	t
134	dwarf	Type	t
135	macho	Load	t
136	pe	OptionalHeader	t
137	binary	ByteOrder	t
138	encoding	BinaryMarshaler	t
139	encoding	BinaryUnmarshaler	t
140	encoding	TextMarshaler	t
141	encoding	TextUnmarshaler	t
142	gob	GobEncoder	t
143	gob	GobDecoder	t
144	json	Unmarshaler	t
145	json	Marshaler	t
146	json	Token	t
147	xml	Marshaler	t
148	xml	MarshalerAttr	t
149	xml	Unmarshaler	t
150	xml	UnmarshalerAttr	t
151	xml	Token	t
152	xml	TokenReader	t
153	expvar	Var	t
154	flag	Value	t
155	flag	Getter	t
156	fmt	State	t
157	fmt	Formatter	t
158	fmt	Stringer	t
159	fmt	GoStringer	t
160	fmt	ScanState	t
161	fmt	Scanner	t
162	ast	Node	t
163	ast	Expr	f
164	ast	Stmt	f
165	ast	Decl	f
166	ast	Spec	f
167	ast	Decl	t
168	ast	Data	t
169	ast	Type	t
170	ast	Visitor	t
171	constant	Value	f
172	error1	I0	f
173	error1	ExportedField	f
174	error2	I0	f
175	error2	ExportedField	f
176	aliases	T3	f
177	aliases	A13	f
178	exports	T12	t
179	exports	T13	f
180	exports	T14	f
181	p	V	t
182	issue25301	A	t
183	issue25301	T	t
184	issue25596	E	t
185	issue25596	T	t
186	printer	Node	t
187	types	Importer	t
188	types	ImporterFrom	t
189	types	Object	f
190	types	Sizes	t
191	types	Type	t
192	hash	Hash	t
193	hash	Hash32	t
194	hash	Hash64	t
195	color	Color	t
196	color	Model	t
197	draw	Image	t
198	draw	Quantizer	t
199	draw	Drawer	t
200	image	Image	t
201	image	PalettedImage	t
202	jpeg	Reader	t
203	png	EncoderBufferPool	t
204	reflectlite	Type	f
205	singleflight	Val	t
206	testlog	Interface	t
207	io	Reader	t
208	io	Writer	t
209	io	Closer	t
210	io	Seeker	t
211	io	ReadWriter	t
212	io	ReadCloser	t
213	io	WriteCloser	t
214	io	ReadWriteCloser	t
215	io	ReadSeeker	t
216	io	WriteSeeker	t
217	io	ReadWriteSeeker	t
218	io	ReaderFrom	t
219	io	WriterTo	t
220	io	ReaderAt	t
221	io	WriterAt	t
222	io	ByteReader	t
223	io	ByteScanner	t
224	io	ByteWriter	t
225	io	RuneReader	t
226	io	RuneScanner	t
227	io	StringWriter	t
228	rand	Source	t
229	rand	Source64	t
230	multipart	File	t
231	http	RoundTripper	t
232	cookiejar	PublicSuffixList	t
233	http	FileSystem	t
234	http	File	t
235	http	I	f
236	http	Pusher	t
237	httputil	BufferPool	t
238	http	CookieJar	t
239	http	Handler	t
240	http	ResponseWriter	t
241	http	Flusher	t
242	http	Hijacker	t
243	http	CloseNotifier	t
244	net	Addr	t
245	net	Conn	t
246	net	PacketConn	t
247	net	Listener	t
248	net	Error	f
249	rpc	Args	t
250	rpc	Reply	t
251	rpc	ClientCodec	t
252	jsonrpc	Error	t
253	jsonrpc	Result	t
254	jsonrpc	Error	t
255	rpc	ServerCodec	t
256	smtp	Auth	t
257	url	Err	t
258	url	Err	t
259	os	Signal	t
260	os	FileInfo	t
261	plugin	Symbol	t
262	reflect	Type	f
263	runtime	Error	f
264	sort	Interface	t
265	sync	Locker	t
266	js	Wrapper	t
267	syscall	RawConn	t
268	syscall	Conn	t
269	syscall	Sockaddr	t
270	syscall	Sockaddr	f
271	syscall	RoutingMessage	f
272	syscall	RoutingMessage	f
273	syscall	Sockaddr	f
274	syscall	Sockaddr	f
275	quick	Generator	t
276	testing	TB	f
277	parse	Node	f
278	cryptobyte	MarshalingValue	t
279	dnsmessage	ResourceBody	f
280	lif	Addr	t
281	route	Addr	t
282	route	Message	t
283	route	Sys	t
284	transform	Transformer	t
285	transform	SpanningTransformer	t
\.


--
-- Name: concrete_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_methods_id_seq', 4235, true);


--
-- Name: concrete_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_types_id_seq', 6703, true);


--
-- Name: interface_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interface_methods_id_seq', 563, true);


--
-- Name: interfaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interfaces_id_seq', 285, true);


--
-- Name: concrete_methods concrete_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concrete_methods
    ADD CONSTRAINT concrete_methods_pkey PRIMARY KEY (id);


--
-- Name: concrete_types concrete_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concrete_types
    ADD CONSTRAINT concrete_types_pkey PRIMARY KEY (id);


--
-- Name: interface_methods interface_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interface_methods
    ADD CONSTRAINT interface_methods_pkey PRIMARY KEY (id);


--
-- Name: interfaces interfaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interfaces
    ADD CONSTRAINT interfaces_pkey PRIMARY KEY (id);


--
-- Name: concrete_methods concrete_methods_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.concrete_methods
    ADD CONSTRAINT concrete_methods_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.concrete_types(id) ON DELETE CASCADE;


--
-- Name: interface_methods interface_methods_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interface_methods
    ADD CONSTRAINT interface_methods_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.interfaces(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

