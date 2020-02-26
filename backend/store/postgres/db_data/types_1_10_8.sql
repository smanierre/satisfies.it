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
90	p1	StructValueMethod	{}	{}	S	27
91	p1	StructValueMethodNamedRecv	{}	{}	S	27
92	p1	SMethod	{int8,int16,int64}	{}	*S2	30
93	p1	JustOnT	{}	{}	*T	38
94	p1	JustOnB	{}	{}	*B	39
95	p1	OnEmbedded	{}	{}	*Embedded	43
96	p3	GoodPlayer	{}	{int}	*ThirdBase	47
97	asm	Parse	{}	{*obj.Prog,bool}	*Parser	49
98	flags	String	{}	{string}	*MultiFlag	51
99	flags	Set	{string}	{error}	*MultiFlag	51
100	lex	Error	{"...interface{}"}	{}	*Input	52
101	lex	Next	{}	{lex.ScanToken}	*Input	52
102	lex	Text	{}	{string}	*Input	52
103	lex	Push	{lex.TokenReader}	{}	*Input	52
104	lex	Close	{}	{}	*Input	52
105	lex	String	{}	{string}	ScanToken	53
106	lex	String	{}	{string}	Token	55
107	lex	Next	{}	{lex.ScanToken}	*Slice	57
108	lex	Text	{}	{string}	*Slice	57
109	lex	File	{}	{string}	*Slice	57
110	lex	Base	{}	{*src.PosBase}	*Slice	57
111	lex	SetBase	{*src.PosBase}	{}	*Slice	57
112	lex	Line	{}	{int}	*Slice	57
113	lex	Col	{}	{int}	*Slice	57
114	lex	Close	{}	{}	*Slice	57
115	lex	Push	{lex.TokenReader}	{}	*Stack	58
116	lex	Next	{}	{lex.ScanToken}	*Stack	58
117	lex	Text	{}	{string}	*Stack	58
118	lex	File	{}	{string}	*Stack	58
119	lex	Base	{}	{*src.PosBase}	*Stack	58
120	lex	SetBase	{*src.PosBase}	{}	*Stack	58
121	lex	Line	{}	{int}	*Stack	58
122	lex	Col	{}	{int}	*Stack	58
123	lex	Close	{}	{}	*Stack	58
124	lex	Text	{}	{string}	*Tokenizer	59
125	lex	File	{}	{string}	*Tokenizer	59
126	lex	Base	{}	{*src.PosBase}	*Tokenizer	59
127	lex	SetBase	{*src.PosBase}	{}	*Tokenizer	59
128	lex	Line	{}	{int}	*Tokenizer	59
129	lex	Col	{}	{int}	*Tokenizer	59
130	lex	Next	{}	{lex.ScanToken}	*Tokenizer	59
131	lex	Close	{}	{}	*Tokenizer	59
132	main	Translate	{*main.File}	{}	*Package	60
133	main	Record	{*main.File}	{}	*Package	60
134	main	Fatalf	{string,"...interface{}"}	{}	*Package	60
135	main	Printf	{string,"...interface{}"}	{}	*Package	60
136	main	ParseGo	{string,[]byte}	{}	*File	61
137	main	DiscardCgoDirectives	{}	{}	*File	61
138	main	Visit	{ast.Node}	{ast.Visitor}	*File	61
139	main	Bad	{token.Pos,"...interface{}"}	{}	*File	61
140	main	Badf	{token.Pos,string,"...interface{}"}	{}	*File	61
141	main	Warn	{token.Pos,"...interface{}"}	{}	*File	61
142	main	Warnf	{token.Pos,string,"...interface{}"}	{}	*File	61
143	main	Visit	{ast.Node}	{ast.Visitor}	*File	61
144	main	Pos	{}	{token.Pos}	*Ref	63
145	main	IsVar	{}	{bool}	*Name	64
146	main	IsConst	{}	{bool}	*Name	64
147	main	String	{}	{string}	*TypeRepr	66
148	main	Empty	{}	{bool}	*TypeRepr	66
149	main	Set	{string,"...interface{}"}	{}	*TypeRepr	66
150	gc	Ctype	{}	{gc.Ctype}	Val	71
151	gc	Interface	{}	{"interface{}"}	Val	71
152	gc	Format	{fmt.State,rune}	{}	Val	71
153	gc	String	{}	{string}	Class	78
154	gc	NewProg	{}	{*obj.Prog}	*Progs	80
155	gc	Flush	{}	{}	*Progs	80
156	gc	Free	{}	{}	*Progs	80
157	gc	Prog	{obj.As}	{*obj.Prog}	*Progs	80
158	gc	Appendpp	{*obj.Prog,obj.As,obj.AddrType,int16,int64,obj.AddrType,int16,int64}	{*obj.Prog}	*Progs	80
159	gc	SetInt	{*gc.Mpint}	{}	*Mpflt	83
160	gc	Set	{*gc.Mpflt}	{}	*Mpflt	83
161	gc	Add	{*gc.Mpflt}	{}	*Mpflt	83
162	gc	AddFloat64	{float64}	{}	*Mpflt	83
163	gc	Sub	{*gc.Mpflt}	{}	*Mpflt	83
164	gc	Mul	{*gc.Mpflt}	{}	*Mpflt	83
165	gc	MulFloat64	{float64}	{}	*Mpflt	83
166	gc	Quo	{*gc.Mpflt}	{}	*Mpflt	83
167	gc	Cmp	{*gc.Mpflt}	{int}	*Mpflt	83
168	gc	CmpFloat64	{float64}	{int}	*Mpflt	83
169	gc	Float64	{}	{float64}	*Mpflt	83
170	gc	Float32	{}	{float64}	*Mpflt	83
171	gc	SetFloat64	{float64}	{}	*Mpflt	83
172	gc	Neg	{}	{}	*Mpflt	83
173	gc	SetString	{string}	{}	*Mpflt	83
174	gc	String	{}	{string}	*Mpflt	83
175	gc	SetOverflow	{}	{}	*Mpint	85
176	gc	Set	{*gc.Mpint}	{}	*Mpint	85
177	gc	SetFloat	{*gc.Mpflt}	{bool}	*Mpint	85
178	gc	Add	{*gc.Mpint}	{}	*Mpint	85
179	gc	Sub	{*gc.Mpint}	{}	*Mpint	85
180	gc	Mul	{*gc.Mpint}	{}	*Mpint	85
181	gc	Quo	{*gc.Mpint}	{}	*Mpint	85
182	gc	Rem	{*gc.Mpint}	{}	*Mpint	85
183	gc	Or	{*gc.Mpint}	{}	*Mpint	85
184	gc	And	{*gc.Mpint}	{}	*Mpint	85
185	gc	AndNot	{*gc.Mpint}	{}	*Mpint	85
186	gc	Xor	{*gc.Mpint}	{}	*Mpint	85
187	gc	Lsh	{*gc.Mpint}	{}	*Mpint	85
188	gc	Rsh	{*gc.Mpint}	{}	*Mpint	85
189	gc	Cmp	{*gc.Mpint}	{int}	*Mpint	85
190	gc	CmpInt64	{int64}	{int}	*Mpint	85
191	gc	Neg	{}	{}	*Mpint	85
192	gc	Int64	{}	{int64}	*Mpint	85
193	gc	SetInt64	{int64}	{}	*Mpint	85
194	gc	SetString	{string}	{}	*Mpint	85
195	gc	String	{}	{string}	*Mpint	85
196	gc	Prog	{obj.As}	{*obj.Prog}	*SSAGenState	94
197	gc	Pc	{}	{*obj.Prog}	*SSAGenState	94
198	gc	SetPos	{src.XPos}	{}	*SSAGenState	94
199	gc	DebugFriendlySetPosFrom	{*ssa.Value}	{}	*SSAGenState	94
200	gc	FPJump	{*ssa.Block,*ssa.Block,*[][]gc.FloatingEQNEJump}	{}	*SSAGenState	94
201	gc	AddrScratch	{*obj.Addr}	{}	*SSAGenState	94
202	gc	Call	{*ssa.Value}	{*obj.Prog}	*SSAGenState	94
203	gc	Int64	{}	{int64}	*Node	99
204	gc	CanInt64	{}	{bool}	*Node	99
205	gc	Bool	{}	{bool}	*Node	99
206	gc	Format	{fmt.State,rune}	{}	*Node	99
207	gc	String	{}	{string}	*Node	99
208	gc	Typ	{}	{*types.Type}	*Node	99
209	gc	StorageClass	{}	{ssa.StorageClass}	*Node	99
210	gc	IsMethod	{}	{bool}	*Node	99
211	gc	SliceBounds	{}	{*gc.Node}	*Node	99
212	gc	SetSliceBounds	{*gc.Node,*gc.Node,*gc.Node}	{}	*Node	99
213	gc	IsAutoTmp	{}	{bool}	*Node	99
214	gc	Class	{}	{gc.Class}	*Node	99
215	gc	Walkdef	{}	{uint8}	*Node	99
216	gc	Typecheck	{}	{uint8}	*Node	99
217	gc	Initorder	{}	{uint8}	*Node	99
218	gc	HasBreak	{}	{bool}	*Node	99
219	gc	IsClosureVar	{}	{bool}	*Node	99
220	gc	NoInline	{}	{bool}	*Node	99
221	gc	IsOutputParamHeapAddr	{}	{bool}	*Node	99
222	gc	Assigned	{}	{bool}	*Node	99
223	gc	Addrtaken	{}	{bool}	*Node	99
224	gc	Implicit	{}	{bool}	*Node	99
225	gc	Isddd	{}	{bool}	*Node	99
226	gc	Diag	{}	{bool}	*Node	99
227	gc	Colas	{}	{bool}	*Node	99
228	gc	NonNil	{}	{bool}	*Node	99
229	gc	Noescape	{}	{bool}	*Node	99
230	gc	Bounded	{}	{bool}	*Node	99
231	gc	Addable	{}	{bool}	*Node	99
232	gc	HasCall	{}	{bool}	*Node	99
233	gc	Likely	{}	{bool}	*Node	99
234	gc	HasVal	{}	{bool}	*Node	99
235	gc	HasOpt	{}	{bool}	*Node	99
236	gc	Embedded	{}	{bool}	*Node	99
237	gc	InlFormal	{}	{bool}	*Node	99
238	gc	InlLocal	{}	{bool}	*Node	99
239	gc	SetClass	{gc.Class}	{}	*Node	99
240	gc	SetWalkdef	{uint8}	{}	*Node	99
241	gc	SetTypecheck	{uint8}	{}	*Node	99
242	gc	SetInitorder	{uint8}	{}	*Node	99
243	gc	SetHasBreak	{bool}	{}	*Node	99
244	gc	SetIsClosureVar	{bool}	{}	*Node	99
245	gc	SetNoInline	{bool}	{}	*Node	99
246	gc	SetIsOutputParamHeapAddr	{bool}	{}	*Node	99
247	gc	SetAssigned	{bool}	{}	*Node	99
248	gc	SetAddrtaken	{bool}	{}	*Node	99
249	gc	SetImplicit	{bool}	{}	*Node	99
250	gc	SetIsddd	{bool}	{}	*Node	99
251	gc	SetDiag	{bool}	{}	*Node	99
252	gc	SetColas	{bool}	{}	*Node	99
253	gc	SetNonNil	{bool}	{}	*Node	99
254	gc	SetNoescape	{bool}	{}	*Node	99
255	gc	SetBounded	{bool}	{}	*Node	99
256	gc	SetAddable	{bool}	{}	*Node	99
257	gc	SetHasCall	{bool}	{}	*Node	99
258	gc	SetLikely	{bool}	{}	*Node	99
259	gc	SetHasVal	{bool}	{}	*Node	99
260	gc	SetHasOpt	{bool}	{}	*Node	99
261	gc	SetEmbedded	{bool}	{}	*Node	99
262	gc	SetInlFormal	{bool}	{}	*Node	99
263	gc	SetInlLocal	{bool}	{}	*Node	99
264	gc	Val	{}	{gc.Val}	*Node	99
265	gc	SetVal	{gc.Val}	{}	*Node	99
266	gc	Opt	{}	{"interface{}"}	*Node	99
267	gc	SetOpt	{"interface{}"}	{}	*Node	99
268	gc	Iota	{}	{int64}	*Node	99
269	gc	SetIota	{int64}	{}	*Node	99
270	gc	Line	{}	{string}	*Node	99
271	gc	Captured	{}	{bool}	*Name	100
272	gc	Readonly	{}	{bool}	*Name	100
273	gc	Byval	{}	{bool}	*Name	100
274	gc	Needzero	{}	{bool}	*Name	100
275	gc	Keepalive	{}	{bool}	*Name	100
276	gc	AutoTemp	{}	{bool}	*Name	100
277	gc	Used	{}	{bool}	*Name	100
278	gc	SetCaptured	{bool}	{}	*Name	100
279	gc	SetReadonly	{bool}	{}	*Name	100
280	gc	SetByval	{bool}	{}	*Name	100
281	gc	SetNeedzero	{bool}	{}	*Name	100
282	gc	SetKeepalive	{bool}	{}	*Name	100
283	gc	SetAutoTemp	{bool}	{}	*Name	100
284	gc	SetUsed	{bool}	{}	*Name	100
285	gc	Dupok	{}	{bool}	*Func	102
286	gc	Wrapper	{}	{bool}	*Func	102
287	gc	Needctxt	{}	{bool}	*Func	102
288	gc	ReflectMethod	{}	{bool}	*Func	102
289	gc	IsHiddenClosure	{}	{bool}	*Func	102
290	gc	NoFramePointer	{}	{bool}	*Func	102
291	gc	HasDefer	{}	{bool}	*Func	102
292	gc	NilCheckDisabled	{}	{bool}	*Func	102
293	gc	InlinabilityChecked	{}	{bool}	*Func	102
294	gc	ExportInline	{}	{bool}	*Func	102
295	gc	SetDupok	{bool}	{}	*Func	102
296	gc	SetWrapper	{bool}	{}	*Func	102
297	gc	SetNeedctxt	{bool}	{}	*Func	102
298	gc	SetReflectMethod	{bool}	{}	*Func	102
299	gc	SetIsHiddenClosure	{bool}	{}	*Func	102
300	gc	SetNoFramePointer	{bool}	{}	*Func	102
301	gc	SetHasDefer	{bool}	{}	*Func	102
302	gc	SetNilCheckDisabled	{bool}	{}	*Func	102
303	gc	SetInlinabilityChecked	{bool}	{}	*Func	102
304	gc	SetExportInline	{bool}	{}	*Func	102
305	gc	GoString	{}	{string}	Op	105
306	gc	Format	{fmt.State,rune}	{}	Op	105
307	gc	String	{}	{string}	Op	105
308	gc	IsSlice3	{}	{bool}	Op	105
309	gc	Format	{fmt.State,rune}	{}	Nodes	106
310	gc	String	{}	{string}	Nodes	106
311	gc	Slice	{}	{[]*gc.Node}	Nodes	106
312	gc	Len	{}	{int}	Nodes	106
313	gc	Index	{int}	{*gc.Node}	Nodes	106
314	gc	First	{}	{*gc.Node}	Nodes	106
315	gc	Second	{}	{*gc.Node}	Nodes	106
316	gc	Set	{[]*gc.Node}	{}	*Nodes	106
317	gc	Set1	{*gc.Node}	{}	*Nodes	106
318	gc	Set2	{*gc.Node,*gc.Node}	{}	*Nodes	106
319	gc	Set3	{*gc.Node,*gc.Node,*gc.Node}	{}	*Nodes	106
320	gc	MoveNodes	{*gc.Nodes}	{}	*Nodes	106
321	gc	SetIndex	{int,*gc.Node}	{}	Nodes	106
322	gc	SetFirst	{*gc.Node}	{}	Nodes	106
323	gc	SetSecond	{*gc.Node}	{}	Nodes	106
324	gc	Addr	{int}	{**gc.Node}	Nodes	106
325	gc	Append	{...*gc.Node}	{}	*Nodes	106
326	gc	Prepend	{...*gc.Node}	{}	*Nodes	106
327	gc	AppendNodes	{*gc.Nodes}	{}	*Nodes	106
328	main	F	{}	{}	*S	108
329	main	F	{}	{}	*T	109
330	gc	Start	{...string}	{}	*Timings	185
331	gc	Stop	{...string}	{}	*Timings	185
332	gc	AddEvent	{int64,string}	{}	*Timings	185
333	gc	Write	{io.Writer,string}	{}	*Timings	185
334	ssa	String	{}	{string}	*Block	186
335	ssa	LongString	{}	{string}	*Block	186
336	ssa	SetControl	{*ssa.Value}	{}	*Block	186
337	ssa	AddEdgeTo	{*ssa.Block}	{}	*Block	186
338	ssa	LackingPos	{}	{bool}	*Block	186
339	ssa	Logf	{string,"...interface{}"}	{}	*Block	186
340	ssa	Log	{}	{bool}	*Block	186
341	ssa	Fatalf	{string,"...interface{}"}	{}	*Block	186
342	ssa	NewValue0	{src.XPos,ssa.Op,*types.Type}	{*ssa.Value}	*Block	186
343	ssa	NewValue0I	{src.XPos,ssa.Op,*types.Type,int64}	{*ssa.Value}	*Block	186
344	ssa	NewValue0A	{src.XPos,ssa.Op,*types.Type,"interface{}"}	{*ssa.Value}	*Block	186
345	ssa	NewValue0IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}"}	{*ssa.Value}	*Block	186
346	ssa	NewValue1	{src.XPos,ssa.Op,*types.Type,*ssa.Value}	{*ssa.Value}	*Block	186
347	ssa	NewValue1I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Block	186
348	ssa	NewValue1A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	186
349	ssa	NewValue1IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	186
350	ssa	NewValue2	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	186
351	ssa	NewValue2I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	186
352	ssa	NewValue3	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	186
353	ssa	NewValue3I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	186
354	ssa	NewValue3A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	186
355	ssa	NewValue4	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	186
356	ssa	HTML	{}	{string}	*Block	186
357	ssa	LongHTML	{}	{string}	*Block	186
358	ssa	Block	{}	{*ssa.Block}	Edge	187
359	ssa	Index	{}	{int}	Edge	187
360	ssa	String	{}	{string}	BlockKind	188
361	ssa	Reset	{}	{}	*Cache	190
362	ssa	NewVarLoc	{}	{*ssa.VarLoc}	*Cache	190
363	ssa	Set387	{bool}	{}	*Config	191
364	ssa	SparsePhiCutoff	{}	{uint64}	*Config	191
365	ssa	Ctxt	{}	{*obj.Link}	*Config	191
366	ssa	BlockString	{*ssa.BlockDebug}	{string}	*FuncDebug	198
367	ssa	SlotLocsString	{ssa.SlotID}	{string}	*FuncDebug	198
368	ssa	LocString	{*ssa.VarLoc}	{string}	*BlockDebug	199
369	ssa	NumBlocks	{}	{int}	*Func	203
370	ssa	NumValues	{}	{int}	*Func	203
371	ssa	LogStat	{string,"...interface{}"}	{}	*Func	203
372	ssa	NewBlock	{ssa.BlockKind}	{*ssa.Block}	*Func	203
373	ssa	ConstBool	{src.XPos,*types.Type,bool}	{*ssa.Value}	*Func	203
374	ssa	ConstInt8	{src.XPos,*types.Type,int8}	{*ssa.Value}	*Func	203
375	ssa	ConstInt16	{src.XPos,*types.Type,int16}	{*ssa.Value}	*Func	203
376	ssa	ConstInt32	{src.XPos,*types.Type,int32}	{*ssa.Value}	*Func	203
377	ssa	ConstInt64	{src.XPos,*types.Type,int64}	{*ssa.Value}	*Func	203
378	ssa	ConstFloat32	{src.XPos,*types.Type,float64}	{*ssa.Value}	*Func	203
379	ssa	ConstFloat64	{src.XPos,*types.Type,float64}	{*ssa.Value}	*Func	203
380	ssa	ConstSlice	{src.XPos,*types.Type}	{*ssa.Value}	*Func	203
381	ssa	ConstInterface	{src.XPos,*types.Type}	{*ssa.Value}	*Func	203
382	ssa	ConstNil	{src.XPos,*types.Type}	{*ssa.Value}	*Func	203
383	ssa	ConstEmptyString	{src.XPos,*types.Type}	{*ssa.Value}	*Func	203
384	ssa	ConstOffPtrSP	{src.XPos,*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Func	203
385	ssa	Frontend	{}	{ssa.Frontend}	*Func	203
386	ssa	Warnl	{src.XPos,string,"...interface{}"}	{}	*Func	203
387	ssa	Logf	{string,"...interface{}"}	{}	*Func	203
388	ssa	Log	{}	{bool}	*Func	203
389	ssa	Fatalf	{string,"...interface{}"}	{}	*Func	203
390	ssa	Postorder	{}	{[]*ssa.Block}	*Func	203
391	ssa	Idom	{}	{[]*ssa.Block}	*Func	203
392	ssa	DebugHashMatch	{string,string}	{bool}	*Func	203
393	ssa	HTML	{}	{string}	*Func	203
394	ssa	String	{}	{string}	*Func	203
395	main	Len	{}	{int}	ArchsByName	204
396	main	Swap	{int,int}	{}	ArchsByName	204
397	main	Less	{int,int}	{bool}	ArchsByName	204
398	main	String	{}	{string}	Rule	205
399	ssa	Close	{}	{}	*HTMLWriter	206
400	ssa	WriteFunc	{string,*ssa.Func}	{}	*HTMLWriter	206
401	ssa	WriteColumn	{string,string,string}	{}	*HTMLWriter	206
402	ssa	Printf	{string,"...interface{}"}	{}	*HTMLWriter	206
403	ssa	WriteString	{string}	{}	*HTMLWriter	206
404	ssa	String	{}	{string}	*Register	209
405	ssa	ObjNum	{}	{int16}	*Register	209
406	ssa	String	{}	{string}	LocalSlot	210
407	ssa	String	{}	{string}	LocPair	211
408	ssa	Asm	{}	{obj.As}	Op	212
409	ssa	String	{}	{string}	Op	212
410	ssa	UsesScratch	{}	{bool}	Op	212
411	ssa	SymEffect	{}	{ssa.SymEffect}	Op	212
412	ssa	IsCall	{}	{bool}	Op	212
413	ssa	Val	{}	{int64}	ValAndOff	214
414	ssa	Off	{}	{int64}	ValAndOff	214
415	ssa	Int64	{}	{int64}	ValAndOff	214
416	ssa	String	{}	{string}	ValAndOff	214
417	ssa	String	{}	{string}	*RBTint32	215
418	ssa	IsEmpty	{}	{bool}	*RBTint32	215
419	ssa	IsSingle	{}	{bool}	*RBTint32	215
420	ssa	VisitInOrder	{"func(int32, interface{})"}	{}	*RBTint32	215
421	ssa	Find	{int32}	{"interface{}"}	*RBTint32	215
422	ssa	Insert	{int32,"interface{}"}	{"interface{}"}	*RBTint32	215
423	ssa	Min	{}	{int32,"interface{}"}	*RBTint32	215
424	ssa	Max	{}	{int32,"interface{}"}	*RBTint32	215
425	ssa	Glb	{int32}	{int32,"interface{}"}	*RBTint32	215
426	ssa	GlbEq	{int32}	{int32,"interface{}"}	*RBTint32	215
427	ssa	Lub	{int32}	{int32,"interface{}"}	*RBTint32	215
428	ssa	LubEq	{int32}	{int32,"interface{}"}	*RBTint32	215
429	ssa	Len	{}	{int}	ValHeap	216
430	ssa	Swap	{int,int}	{}	ValHeap	216
431	ssa	Push	{"interface{}"}	{}	*ValHeap	216
432	ssa	Pop	{}	{"interface{}"}	*ValHeap	216
433	ssa	Less	{int,int}	{bool}	ValHeap	216
434	ssa	String	{}	{string}	*SparseTreeNode	217
435	ssa	Entry	{}	{int32}	*SparseTreeNode	217
436	ssa	Exit	{}	{int32}	*SparseTreeNode	217
437	ssa	Sibling	{*ssa.Block}	{*ssa.Block}	SparseTree	218
438	ssa	Child	{*ssa.Block}	{*ssa.Block}	SparseTree	218
439	ssa	Insert	{*ssa.Block,int32,"interface{}",*ssa.SparseTreeHelper}	{}	*SparseTreeMap	219
440	ssa	Find	{*ssa.Block,int32,*ssa.SparseTreeHelper}	{"interface{}"}	*SparseTreeMap	219
441	ssa	String	{}	{string}	*SparseTreeMap	219
442	ssa	NewTree	{}	{*ssa.SparseTreeMap}	*SparseTreeHelper	220
443	ssa	HTML	{}	{string}	*Value	221
444	ssa	LongHTML	{}	{string}	*Value	221
445	ssa	String	{}	{string}	*Value	221
446	ssa	AuxInt8	{}	{int8}	*Value	221
447	ssa	AuxInt16	{}	{int16}	*Value	221
448	ssa	AuxInt32	{}	{int32}	*Value	221
449	ssa	AuxFloat	{}	{float64}	*Value	221
450	ssa	AuxValAndOff	{}	{ssa.ValAndOff}	*Value	221
451	ssa	LongString	{}	{string}	*Value	221
452	ssa	AddArg	{*ssa.Value}	{}	*Value	221
453	ssa	AddArgs	{...*ssa.Value}	{}	*Value	221
454	ssa	SetArg	{int,*ssa.Value}	{}	*Value	221
455	ssa	RemoveArg	{int}	{}	*Value	221
456	ssa	SetArgs1	{*ssa.Value}	{}	*Value	221
457	ssa	SetArgs2	{*ssa.Value,*ssa.Value}	{}	*Value	221
458	ssa	Logf	{string,"...interface{}"}	{}	*Value	221
459	ssa	Log	{}	{bool}	*Value	221
460	ssa	Fatalf	{string,"...interface{}"}	{}	*Value	221
461	ssa	Reg	{}	{int16}	*Value	221
462	ssa	Reg0	{}	{int16}	*Value	221
463	ssa	Reg1	{}	{int16}	*Value	221
464	ssa	RegName	{}	{string}	*Value	221
465	ssa	MemoryArg	{}	{*ssa.Value}	*Value	221
466	ssa	LackingPos	{}	{bool}	*Value	221
467	syntax	Error	{}	{string}	Error	279
468	syntax	Error	{}	{string}	*Error	279
469	syntax	String	{}	{string}	Operator	285
470	types	Lookup	{string}	{*types.Sym}	*Pkg	286
471	types	LookupOK	{string}	{*types.Sym,bool}	*Pkg	286
472	types	LookupBytes	{[]byte}	{*types.Sym}	*Pkg	286
473	types	Export	{}	{bool}	*Sym	287
474	types	Package	{}	{bool}	*Sym	287
475	types	Exported	{}	{bool}	*Sym	287
476	types	Uniq	{}	{bool}	*Sym	287
477	types	Siggen	{}	{bool}	*Sym	287
478	types	Asm	{}	{bool}	*Sym	287
479	types	AlgGen	{}	{bool}	*Sym	287
480	types	SetExport	{bool}	{}	*Sym	287
481	types	SetPackage	{bool}	{}	*Sym	287
482	types	SetExported	{bool}	{}	*Sym	287
483	types	SetUniq	{bool}	{}	*Sym	287
484	types	SetSiggen	{bool}	{}	*Sym	287
485	types	SetAsm	{bool}	{}	*Sym	287
486	types	SetAlgGen	{bool}	{}	*Sym	287
487	types	IsBlank	{}	{bool}	*Sym	287
488	types	LinksymName	{}	{string}	*Sym	287
489	types	Linksym	{}	{*obj.LSym}	*Sym	287
490	types	String	{}	{string}	*Sym	287
491	types	Format	{fmt.State,rune}	{}	*Sym	287
492	types	String	{}	{string}	EType	289
493	types	CanRecv	{}	{bool}	ChanDir	290
494	types	CanSend	{}	{bool}	ChanDir	290
495	types	NotInHeap	{}	{bool}	*Type	291
496	types	Broke	{}	{bool}	*Type	291
497	types	Noalg	{}	{bool}	*Type	291
498	types	Deferwidth	{}	{bool}	*Type	291
499	types	Recur	{}	{bool}	*Type	291
500	types	SetNotInHeap	{bool}	{}	*Type	291
501	types	SetBroke	{bool}	{}	*Type	291
502	types	SetNoalg	{bool}	{}	*Type	291
503	types	SetDeferwidth	{bool}	{}	*Type	291
504	types	SetRecur	{bool}	{}	*Type	291
505	types	MapType	{}	{*types.Map}	*Type	291
506	types	ForwardType	{}	{*types.Forward}	*Type	291
507	types	FuncType	{}	{*types.Func}	*Type	291
508	types	StructType	{}	{*types.Struct}	*Type	291
509	types	ChanType	{}	{*types.Chan}	*Type	291
510	types	Recvs	{}	{*types.Type}	*Type	291
511	types	Params	{}	{*types.Type}	*Type	291
512	types	Results	{}	{*types.Type}	*Type	291
513	types	NumRecvs	{}	{int}	*Type	291
514	types	NumParams	{}	{int}	*Type	291
515	types	NumResults	{}	{int}	*Type	291
516	types	Recv	{}	{*types.Field}	*Type	291
517	types	Key	{}	{*types.Type}	*Type	291
518	types	Val	{}	{*types.Type}	*Type	291
519	types	Elem	{}	{*types.Type}	*Type	291
520	types	DDDField	{}	{*types.Type}	*Type	291
521	types	ChanArgs	{}	{*types.Type}	*Type	291
522	types	FuncArgs	{}	{*types.Type}	*Type	291
523	types	Nname	{}	{*types.Node}	*Type	291
524	types	SetNname	{*types.Node}	{}	*Type	291
525	types	IsFuncArgStruct	{}	{bool}	*Type	291
526	types	Methods	{}	{*types.Fields}	*Type	291
527	types	AllMethods	{}	{*types.Fields}	*Type	291
528	types	Fields	{}	{*types.Fields}	*Type	291
529	types	Field	{int}	{*types.Field}	*Type	291
530	types	FieldSlice	{}	{[]*types.Field}	*Type	291
531	types	SetFields	{[]*types.Field}	{}	*Type	291
532	types	SetInterface	{[]*types.Field}	{}	*Type	291
533	types	IsDDDArray	{}	{bool}	*Type	291
534	types	WidthCalculated	{}	{bool}	*Type	291
535	types	ArgWidth	{}	{int64}	*Type	291
536	types	Size	{}	{int64}	*Type	291
537	types	Alignment	{}	{int64}	*Type	291
538	types	SimpleString	{}	{string}	*Type	291
539	types	Compare	{*types.Type}	{types.Cmp}	*Type	291
540	types	IsKind	{types.EType}	{bool}	*Type	291
541	types	IsBoolean	{}	{bool}	*Type	291
542	types	ToUnsigned	{}	{*types.Type}	*Type	291
543	types	IsInteger	{}	{bool}	*Type	291
544	types	IsSigned	{}	{bool}	*Type	291
545	types	IsFloat	{}	{bool}	*Type	291
546	types	IsComplex	{}	{bool}	*Type	291
547	types	IsPtr	{}	{bool}	*Type	291
548	types	IsUnsafePtr	{}	{bool}	*Type	291
549	types	IsPtrShaped	{}	{bool}	*Type	291
550	types	IsString	{}	{bool}	*Type	291
551	types	IsMap	{}	{bool}	*Type	291
552	types	IsChan	{}	{bool}	*Type	291
553	types	IsSlice	{}	{bool}	*Type	291
554	types	IsArray	{}	{bool}	*Type	291
555	types	IsStruct	{}	{bool}	*Type	291
556	types	IsInterface	{}	{bool}	*Type	291
557	types	IsEmptyInterface	{}	{bool}	*Type	291
558	types	ElemType	{}	{*types.Type}	*Type	291
559	types	PtrTo	{}	{*types.Type}	*Type	291
560	types	NumFields	{}	{int}	*Type	291
561	types	FieldType	{int}	{*types.Type}	*Type	291
562	types	FieldOff	{int}	{int64}	*Type	291
563	types	FieldName	{int}	{string}	*Type	291
564	types	NumElem	{}	{int64}	*Type	291
565	types	SetNumElem	{int64}	{}	*Type	291
566	types	NumComponents	{}	{int64}	*Type	291
567	types	ChanDir	{}	{types.ChanDir}	*Type	291
568	types	IsMemory	{}	{bool}	*Type	291
569	types	IsFlags	{}	{bool}	*Type	291
570	types	IsVoid	{}	{bool}	*Type	291
571	types	IsTuple	{}	{bool}	*Type	291
572	types	IsUntyped	{}	{bool}	*Type	291
573	types	HasHeapPointer	{}	{bool}	*Type	291
574	types	Symbol	{}	{*obj.LSym}	*Type	291
575	types	Tie	{}	{byte}	*Type	291
576	types	String	{}	{string}	*Type	291
577	types	ShortString	{}	{string}	*Type	291
578	types	LongString	{}	{string}	*Type	291
579	types	Format	{fmt.State,rune}	{}	*Type	291
580	types	Key	{}	{types.Type}	*Map	292
581	types	Elem	{}	{types.Type}	*Map	292
582	types	Underlying	{}	{types.Type}	*Map	292
583	types	String	{}	{string}	*Map	292
584	types	FullName	{}	{string}	*Func	294
585	types	Scope	{}	{*types.Scope}	*Func	294
586	types	String	{}	{string}	*Func	294
587	types	NumFields	{}	{int}	*Struct	295
588	types	Field	{int}	{*types.Var}	*Struct	295
589	types	Tag	{int}	{string}	*Struct	295
590	types	Underlying	{}	{types.Type}	*Struct	295
591	types	String	{}	{string}	*Struct	295
592	types	NumExplicitMethods	{}	{int}	*Interface	297
593	types	ExplicitMethod	{int}	{*types.Func}	*Interface	297
594	types	NumEmbeddeds	{}	{int}	*Interface	297
595	types	Embedded	{int}	{*types.Named}	*Interface	297
596	types	NumMethods	{}	{int}	*Interface	297
597	types	Method	{int}	{*types.Func}	*Interface	297
598	types	Empty	{}	{bool}	*Interface	297
599	types	Complete	{}	{*types.Interface}	*Interface	297
600	types	Underlying	{}	{types.Type}	*Interface	297
601	types	String	{}	{string}	*Interface	297
602	types	Dir	{}	{types.ChanDir}	*Chan	302
603	types	Elem	{}	{types.Type}	*Chan	302
604	types	Underlying	{}	{types.Type}	*Chan	302
605	types	String	{}	{string}	*Chan	302
606	types	Len	{}	{int}	*Tuple	303
607	types	At	{int}	{*types.Var}	*Tuple	303
608	types	Underlying	{}	{types.Type}	*Tuple	303
609	types	String	{}	{string}	*Tuple	303
610	types	Len	{}	{int64}	*Array	304
611	types	Elem	{}	{types.Type}	*Array	304
612	types	Underlying	{}	{types.Type}	*Array	304
613	types	String	{}	{string}	*Array	304
614	types	Elem	{}	{types.Type}	*Slice	305
615	types	Underlying	{}	{types.Type}	*Slice	305
616	types	String	{}	{string}	*Slice	305
617	types	Isddd	{}	{bool}	*Field	306
618	types	Broke	{}	{bool}	*Field	306
619	types	Nointerface	{}	{bool}	*Field	306
620	types	SetIsddd	{bool}	{}	*Field	306
621	types	SetBroke	{bool}	{}	*Field	306
622	types	SetNointerface	{bool}	{}	*Field	306
623	types	End	{}	{int64}	*Field	306
624	types	Copy	{}	{*types.Field}	*Field	306
625	types	Len	{}	{int}	*Fields	307
626	types	Slice	{}	{[]*types.Field}	*Fields	307
627	types	Index	{int}	{*types.Field}	*Fields	307
628	types	Set	{[]*types.Field}	{}	*Fields	307
629	types	Append	{...*types.Field}	{}	*Fields	307
630	main	Visit	{ast.Node}	{ast.Visitor}	*FuncVisitor	312
631	main	Boundaries	{[]byte}	{[]main.Boundary}	*Profile	313
632	main	Reset	{}	{}	*Dirs	316
633	main	Next	{}	{string,bool}	*Dirs	316
634	main	Error	{}	{string}	PackageError	318
635	pkg	ExportedMethod	{int}	{bool}	ExportedType	319
636	base	Name	{}	{string}	*Command	326
637	base	Usage	{}	{}	*Command	326
638	base	Runnable	{}	{bool}	*Command	326
639	base	Set	{string}	{error}	*StringsFlag	327
640	base	String	{}	{string}	*StringsFlag	327
641	cache	Get	{cache.ActionID}	{cache.Entry,error}	*Cache	330
642	cache	GetBytes	{cache.ActionID}	{[]byte,cache.Entry,error}	*Cache	330
643	cache	OutputFile	{cache.OutputID}	{string}	*Cache	330
644	cache	Trim	{}	{}	*Cache	330
645	cache	Put	{cache.ActionID,io.ReadSeeker}	{cache.OutputID,int64,error}	*Cache	330
646	cache	PutNoVerify	{cache.ActionID,io.ReadSeeker}	{cache.OutputID,int64,error}	*Cache	330
647	cache	PutBytes	{cache.ActionID,[]byte}	{error}	*Cache	330
648	cache	Write	{[]byte}	{int,error}	*Hash	332
649	cache	Sum	{}	{[]byte}	*Hash	332
650	get	Error	{}	{string}	ImportMismatchError	336
651	list	Write	{[]byte}	{int,error}	*TrackingWriter	338
652	list	Flush	{}	{}	*TrackingWriter	338
653	list	NeedNL	{}	{bool}	*TrackingWriter	338
654	load	Set	{string}	{error}	*PerPackageFlag	339
655	load	String	{}	{string}	*PerPackageFlag	339
656	load	Present	{}	{bool}	*PerPackageFlag	339
657	load	For	{*load.Package}	{[]string}	*PerPackageFlag	339
658	load	AllFiles	{}	{[]string}	*Package	340
659	load	Resolve	{[]string}	{[]string}	*Package	340
660	load	InternalGoFiles	{}	{[]string}	*Package	340
661	load	InternalAllGoFiles	{}	{[]string}	*Package	340
662	load	UsesSwig	{}	{bool}	*Package	340
663	load	UsesCgo	{}	{bool}	*Package	340
664	load	Error	{}	{string}	*NoGoError	343
665	load	Error	{}	{string}	*PackageError	345
666	load	Push	{string}	{}	*ImportStack	346
667	load	Pop	{}	{}	*ImportStack	346
668	load	Copy	{}	{[]string}	*ImportStack	346
669	web	Error	{}	{string}	*HTTPError	348
670	web	Error	{}	{string}	*HTTPError	348
671	work	Init	{}	{}	*Builder	351
672	work	NewObjdir	{}	{string}	*Builder	351
673	work	AutoAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	351
674	work	CompileAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	351
675	work	VetAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	351
676	work	LinkAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	351
677	work	Do	{*work.Action}	{}	*Builder	351
678	work	PkgconfigCmd	{}	{string}	*Builder	351
679	work	Showcmd	{string,string,"...interface{}"}	{}	*Builder	351
680	work	Mkdir	{string}	{error}	*Builder	351
681	work	Symlink	{string,string}	{error}	*Builder	351
682	work	GccCmd	{string,string}	{[]string}	*Builder	351
683	work	GxxCmd	{string,string}	{[]string}	*Builder	351
684	work	CFlags	{*load.Package}	{[]string,error}	*Builder	351
685	work	BuildActionID	{}	{string}	*Action	352
686	work	BuildContentID	{}	{string}	*Action	352
687	work	BuildID	{}	{string}	*Action	352
688	work	BuiltTarget	{}	{string}	*Action	352
689	bio	Seek	{int64,int}	{int64}	*Reader	358
690	bio	Offset	{}	{int64}	*Reader	358
691	bio	Close	{}	{error}	*Reader	358
692	bio	Seek	{int64,int}	{int64}	*Writer	359
693	bio	Offset	{}	{int64}	*Writer	359
694	bio	Close	{}	{error}	*Writer	359
695	dwarf	UnifyRanges	{*dwarf.Scope}	{}	*Scope	364
696	dwarf	Len	{}	{int}	VarsByOffset	372
697	dwarf	Less	{int,int}	{bool}	VarsByOffset	372
698	dwarf	Swap	{int,int}	{}	VarsByOffset	372
699	edit	Insert	{int,string}	{}	*Buffer	373
700	edit	Delete	{int,int}	{}	*Buffer	373
701	edit	Replace	{int,int,string}	{}	*Buffer	373
702	edit	Bytes	{}	{[]byte}	*Buffer	373
703	edit	String	{}	{string}	*Buffer	373
704	gcprog	Init	{func(byte)}	{}	*Writer	374
705	gcprog	Debug	{io.Writer}	{}	*Writer	374
706	gcprog	BitIndex	{}	{int64}	*Writer	374
707	gcprog	End	{}	{}	*Writer	374
708	gcprog	Ptr	{int64}	{}	*Writer	374
709	gcprog	ShouldRepeat	{int64,int64}	{bool}	*Writer	374
710	gcprog	Repeat	{int64,int64}	{}	*Writer	374
711	gcprog	ZeroUntil	{int64}	{}	*Writer	374
712	gcprog	Append	{[]byte,int64}	{}	*Writer	374
713	goobj	String	{}	{string}	SymID	376
714	goobj	String	{uint64}	{string}	*Reloc	378
715	obj	Add	{int,src.XPos,*obj.LSym}	{int}	*InlTree	388
716	obj	Parent	{int}	{int}	*InlTree	388
717	obj	InlinedFunction	{int}	{*obj.LSym}	*InlTree	388
718	obj	CallPos	{int}	{src.XPos}	*InlTree	388
719	obj	String	{}	{string}	AddrType	392
720	obj	From3Type	{}	{obj.AddrType}	*Prog	393
721	obj	GetFrom3	{}	{*obj.Addr}	*Prog	393
722	obj	SetFrom3	{obj.Addr}	{}	*Prog	393
723	obj	Line	{}	{string}	*Prog	393
724	obj	InnermostLineNumber	{}	{string}	*Prog	393
725	obj	InnermostFilename	{}	{string}	*Prog	393
726	obj	String	{}	{string}	*Prog	393
727	obj	InstructionString	{}	{string}	*Prog	393
728	obj	String	{}	{string}	As	394
729	obj	Grow	{int64}	{}	*LSym	395
730	obj	GrowCap	{int64}	{}	*LSym	395
731	obj	WriteFloat32	{*obj.Link,int64,float32}	{}	*LSym	395
732	obj	WriteFloat64	{*obj.Link,int64,float64}	{}	*LSym	395
733	obj	WriteInt	{*obj.Link,int64,int,int64}	{}	*LSym	395
734	obj	WriteAddr	{*obj.Link,int64,int,*obj.LSym,int64}	{}	*LSym	395
735	obj	WriteCURelativeAddr	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	395
736	obj	WriteOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	395
737	obj	WriteWeakOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	395
738	obj	WriteString	{*obj.Link,int64,int,string}	{}	*LSym	395
739	obj	WriteBytes	{*obj.Link,int64,[]byte}	{int64}	*LSym	395
740	obj	String	{}	{string}	*LSym	395
741	obj	Len	{}	{int64}	*LSym	395
742	obj	DuplicateOK	{}	{bool}	Attribute	397
743	obj	MakeTypelink	{}	{bool}	Attribute	397
744	obj	CFunc	{}	{bool}	Attribute	397
745	obj	NoSplit	{}	{bool}	Attribute	397
746	obj	Leaf	{}	{bool}	Attribute	397
747	obj	SeenGlobl	{}	{bool}	Attribute	397
748	obj	OnList	{}	{bool}	Attribute	397
749	obj	ReflectMethod	{}	{bool}	Attribute	397
750	obj	Local	{}	{bool}	Attribute	397
751	obj	Wrapper	{}	{bool}	Attribute	397
752	obj	NeedCtxt	{}	{bool}	Attribute	397
753	obj	NoFrame	{}	{bool}	Attribute	397
754	obj	Static	{}	{bool}	Attribute	397
755	obj	WasInlined	{}	{bool}	Attribute	397
756	obj	Set	{obj.Attribute,bool}	{}	*Attribute	397
757	obj	TextAttrString	{}	{string}	Attribute	397
758	obj	OutermostPos	{src.XPos}	{src.Pos}	*Link	402
759	obj	InnermostPos	{src.XPos}	{src.Pos}	*Link	402
760	obj	AddImport	{string}	{}	*Link	402
761	obj	Diag	{string,"...interface{}"}	{}	*Link	402
762	obj	Logf	{string,"...interface{}"}	{}	*Link	402
763	obj	FixedFrameSize	{}	{int64}	*Link	402
764	obj	DwarfIntConst	{string,string,string,int64}	{}	*Link	402
765	obj	DwarfAbstractFunc	{"interface{}",*obj.LSym,string}	{}	*Link	402
766	obj	InitTextSym	{*obj.LSym,int}	{}	*Link	402
767	obj	Globl	{*obj.LSym,int64,int}	{}	*Link	402
768	obj	LookupDerived	{*obj.LSym,string}	{*obj.LSym}	*Link	402
769	obj	LookupStatic	{string}	{*obj.LSym}	*Link	402
770	obj	Lookup	{string}	{*obj.LSym}	*Link	402
771	obj	LookupInit	{string,func(*obj.LSym)}	{*obj.LSym}	*Link	402
772	obj	Float32Sym	{float32}	{*obj.LSym}	*Link	402
773	obj	Float64Sym	{float64}	{*obj.LSym}	*Link	402
774	obj	Int64Sym	{int64}	{*obj.LSym}	*Link	402
775	obj	NewProg	{}	{*obj.Prog}	*Link	402
776	obj	CanReuseProgs	{}	{bool}	*Link	402
777	obj	Dconv	{*obj.Addr}	{string}	*Link	402
778	obj	GetPrecursorFunc	{*obj.LSym}	{"interface{}"}	*DwarfFixupTable	407
779	obj	SetPrecursorFunc	{*obj.LSym,"interface{}"}	{}	*DwarfFixupTable	407
780	obj	ReferenceChildDIE	{*obj.LSym,int,*obj.LSym,int,int}	{}	*DwarfFixupTable	407
781	obj	RegisterChildDIEOffsets	{*obj.LSym,[]*dwarf.Var,[]int32}	{}	*DwarfFixupTable	407
852	ld	End	{int64}	{}	*GCProg	438
782	obj	AbsFuncDwarfSym	{*obj.LSym}	{*obj.LSym}	*DwarfFixupTable	407
783	obj	Finalize	{string,bool}	{}	*DwarfFixupTable	407
784	x86	Put1	{byte}	{}	*AsmBuf	414
785	x86	Put2	{byte,byte}	{}	*AsmBuf	414
786	x86	Put3	{byte,byte,byte}	{}	*AsmBuf	414
787	x86	Put4	{byte,byte,byte,byte}	{}	*AsmBuf	414
788	x86	PutInt16	{int16}	{}	*AsmBuf	414
789	x86	PutInt32	{int32}	{}	*AsmBuf	414
790	x86	PutInt64	{int64}	{}	*AsmBuf	414
791	x86	Put	{[]byte}	{}	*AsmBuf	414
792	x86	Insert	{int,byte}	{}	*AsmBuf	414
793	x86	Last	{}	{byte}	*AsmBuf	414
794	x86	Len	{}	{int}	*AsmBuf	414
795	x86	Bytes	{}	{[]byte}	*AsmBuf	414
796	x86	Reset	{}	{}	*AsmBuf	414
797	x86	At	{int}	{byte}	*AsmBuf	414
798	objabi	Set	{string}	{error}	*HeadType	416
799	objabi	String	{}	{string}	*HeadType	416
800	objabi	IsDirectJump	{}	{bool}	RelocType	417
801	objabi	String	{}	{string}	RelocType	417
802	objabi	String	{}	{string}	SymKind	418
803	objfile	Print	{io.Writer,*regexp.Regexp,uint64,uint64,bool}	{}	*Disasm	419
804	objfile	Decode	{uint64,uint64,[]objfile.Reloc,"func(uint64, string, int, string)"}	{}	*Disasm	419
805	objfile	Line	{string,int}	{[]byte,error}	*FileCache	421
806	objfile	Close	{}	{error}	*File	423
807	objfile	Entries	{}	{[]*objfile.Entry}	*File	423
808	objfile	Symbols	{}	{[]objfile.Sym,error}	*File	423
809	objfile	PCLineTable	{}	{objfile.Liner,error}	*File	423
810	objfile	Text	{}	{uint64,[]byte,error}	*File	423
811	objfile	GOARCH	{}	{string}	*File	423
812	objfile	LoadAddress	{}	{uint64,error}	*File	423
813	objfile	DWARF	{}	{*dwarf.Data,error}	*File	423
814	objfile	Disasm	{}	{*objfile.Disasm,error}	*File	423
815	objfile	Disasm	{}	{*objfile.Disasm,error}	*Entry	424
816	objfile	Name	{}	{string}	*Entry	424
817	objfile	Symbols	{}	{[]objfile.Sym,error}	*Entry	424
818	objfile	PCLineTable	{}	{objfile.Liner,error}	*Entry	424
819	objfile	Text	{}	{uint64,[]byte,error}	*Entry	424
820	objfile	GOARCH	{}	{string}	*Entry	424
821	objfile	LoadAddress	{}	{uint64,error}	*Entry	424
822	objfile	DWARF	{}	{*dwarf.Data,error}	*Entry	424
823	src	IsKnown	{}	{bool}	Pos	428
824	src	Before	{src.Pos}	{bool}	Pos	428
825	src	After	{src.Pos}	{bool}	Pos	428
826	src	Filename	{}	{string}	Pos	428
827	src	Base	{}	{*src.PosBase}	Pos	428
828	src	SetBase	{*src.PosBase}	{}	*Pos	428
829	src	RelFilename	{}	{string}	Pos	428
830	src	RelLine	{}	{uint}	Pos	428
831	src	AbsFilename	{}	{string}	Pos	428
832	src	SymFilename	{}	{string}	Pos	428
833	src	String	{}	{string}	Pos	428
834	src	Format	{bool,bool}	{string}	Pos	428
835	src	Pos	{}	{*src.Pos}	*PosBase	429
836	src	Filename	{}	{string}	*PosBase	429
837	src	AbsFilename	{}	{string}	*PosBase	429
838	src	SymFilename	{}	{string}	*PosBase	429
839	src	Line	{}	{uint}	*PosBase	429
840	src	InliningIndex	{}	{int}	*PosBase	429
841	src	IsKnown	{}	{bool}	XPos	430
842	src	Before	{src.XPos}	{bool}	XPos	430
843	src	After	{src.XPos}	{bool}	XPos	430
844	src	XPos	{src.Pos}	{src.XPos}	*PosTable	431
845	src	Pos	{src.XPos}	{src.Pos}	*PosTable	431
846	sys	InFamily	{...sys.ArchFamily}	{bool}	*Arch	433
847	ld	Set	{string}	{error}	*BuildMode	436
848	ld	String	{}	{string}	*BuildMode	436
849	ld	Set	{string}	{error}	*LinkMode	437
850	ld	String	{}	{string}	*LinkMode	437
851	ld	Init	{*ld.Link,string}	{}	*GCProg	438
853	ld	AddSym	{*sym.Symbol}	{}	*GCProg	438
854	ld	AddTramp	{*sym.Symbol}	{}	*Link	450
855	ld	DynlinkingGo	{}	{bool}	*Link	450
856	ld	CanUsePlugins	{}	{bool}	*Link	450
857	ld	UseRelro	{}	{bool}	*Link	450
858	ld	FixedFrameSize	{}	{int64}	*Link	450
859	ld	Logf	{string,"...interface{}"}	{}	*Link	450
860	ld	Set	{string}	{error}	*Rpath	456
861	ld	String	{}	{string}	*Rpath	456
862	ld	SeekSet	{int64}	{}	*OutBuf	457
863	ld	Offset	{}	{int64}	*OutBuf	457
864	ld	Write	{[]byte}	{int,error}	*OutBuf	457
865	ld	Write8	{uint8}	{}	*OutBuf	457
866	ld	Write16	{uint16}	{}	*OutBuf	457
867	ld	Write32	{uint32}	{}	*OutBuf	457
868	ld	Write32b	{uint32}	{}	*OutBuf	457
869	ld	Write64	{uint64}	{}	*OutBuf	457
870	ld	Write64b	{uint64}	{}	*OutBuf	457
871	ld	WriteString	{string}	{}	*OutBuf	457
872	ld	WriteStringN	{string,int}	{}	*OutBuf	457
873	ld	WriteStringPad	{string,int,[]byte}	{}	*OutBuf	457
874	ld	Flush	{}	{}	*OutBuf	457
875	sym	DuplicateOK	{}	{bool}	Attribute	473
876	sym	External	{}	{bool}	Attribute	473
877	sym	NoSplit	{}	{bool}	Attribute	473
878	sym	Reachable	{}	{bool}	Attribute	473
879	sym	CgoExportDynamic	{}	{bool}	Attribute	473
880	sym	CgoExportStatic	{}	{bool}	Attribute	473
881	sym	Special	{}	{bool}	Attribute	473
882	sym	StackCheck	{}	{bool}	Attribute	473
883	sym	NotInSymbolTable	{}	{bool}	Attribute	473
884	sym	OnList	{}	{bool}	Attribute	473
885	sym	Local	{}	{bool}	Attribute	473
886	sym	ReflectMethod	{}	{bool}	Attribute	473
887	sym	MakeTypelink	{}	{bool}	Attribute	473
888	sym	Shared	{}	{bool}	Attribute	473
889	sym	VisibilityHidden	{}	{bool}	Attribute	473
890	sym	SubSymbol	{}	{bool}	Attribute	473
891	sym	Container	{}	{bool}	Attribute	473
892	sym	CgoExport	{}	{bool}	Attribute	473
893	sym	Set	{sym.Attribute,bool}	{}	*Attribute	473
894	sym	String	{}	{string}	Library	474
895	sym	Len	{}	{int}	RelocByOff	477
896	sym	Swap	{int,int}	{}	RelocByOff	477
897	sym	Less	{int,int}	{bool}	RelocByOff	477
898	sym	String	{}	{string}	*Symbol	480
899	sym	ElfsymForReloc	{}	{int32}	*Symbol	480
900	sym	Len	{}	{int64}	*Symbol	480
901	sym	Grow	{int64}	{}	*Symbol	480
902	sym	AddBytes	{[]byte}	{int64}	*Symbol	480
903	sym	AddUint8	{uint8}	{int64}	*Symbol	480
904	sym	AddUint16	{*sys.Arch,uint16}	{int64}	*Symbol	480
905	sym	AddUint32	{*sys.Arch,uint32}	{int64}	*Symbol	480
906	sym	AddUint64	{*sys.Arch,uint64}	{int64}	*Symbol	480
907	sym	AddUint	{*sys.Arch,uint64}	{int64}	*Symbol	480
908	sym	SetUint8	{*sys.Arch,int64,uint8}	{int64}	*Symbol	480
909	sym	SetUint32	{*sys.Arch,int64,uint32}	{int64}	*Symbol	480
910	sym	SetUint	{*sys.Arch,int64,uint64}	{int64}	*Symbol	480
911	sym	AddAddrPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	480
912	sym	AddCURelativeAddrPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	480
913	sym	AddPCRelPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	480
914	sym	AddAddr	{*sys.Arch,*sym.Symbol}	{int64}	*Symbol	480
915	sym	SetAddrPlus	{*sys.Arch,int64,*sym.Symbol,int64}	{int64}	*Symbol	480
916	sym	SetAddr	{*sys.Arch,int64,*sym.Symbol}	{int64}	*Symbol	480
917	sym	AddSize	{*sys.Arch,*sym.Symbol}	{int64}	*Symbol	480
918	sym	AddAddrPlus4	{*sym.Symbol,int64}	{int64}	*Symbol	480
919	sym	AddRel	{}	{*sym.Reloc}	*Symbol	480
920	sym	AddUintXX	{*sys.Arch,uint64,int}	{int64}	*Symbol	480
921	sym	Newsym	{string,int}	{*sym.Symbol}	*Symbols	485
922	sym	Lookup	{string,int}	{*sym.Symbol}	*Symbols	485
923	sym	ROLookup	{string,int}	{*sym.Symbol}	*Symbols	485
924	sym	IncVersion	{}	{int}	*Symbols	485
925	sym	Rename	{string,string,int}	{}	*Symbols	485
926	sym	String	{}	{string}	SymKind	486
927	main	String	{}	{string}	*Entry	488
928	binutils	SetFastSymbolization	{bool}	{}	*Binutils	510
929	binutils	SetTools	{string}	{}	*Binutils	510
930	binutils	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}	*Binutils	510
931	binutils	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}	*Binutils	510
932	graph	TrimTree	{graph.NodePtrSet}	{}	*Graph	515
933	graph	String	{}	{string}	*Graph	515
934	graph	DiscardLowFrequencyNodes	{int64}	{graph.NodeSet}	*Graph	515
935	graph	DiscardLowFrequencyNodePtrs	{int64}	{graph.NodePtrSet}	*Graph	515
936	graph	TrimLowFrequencyTags	{int64}	{}	*Graph	515
937	graph	TrimLowFrequencyEdges	{int64}	{int}	*Graph	515
938	graph	SortNodes	{bool,bool}	{}	*Graph	515
939	graph	SelectTopNodePtrs	{int,bool}	{graph.NodePtrSet}	*Graph	515
940	graph	SelectTopNodes	{int,bool}	{graph.NodeSet}	*Graph	515
941	graph	RemoveRedundantEdges	{}	{}	*Graph	515
942	graph	Sum	{}	{int64,int64}	Nodes	517
943	graph	Sort	{graph.NodeOrder}	{error}	Nodes	517
944	graph	FlatValue	{}	{int64}	*Node	518
945	graph	CumValue	{}	{int64}	*Node	518
946	graph	AddToEdge	{*graph.Node,int64,bool,bool}	{}	*Node	518
947	graph	AddToEdgeDiv	{*graph.Node,int64,int64,bool,bool}	{}	*Node	518
948	graph	PrintableName	{}	{string}	*NodeInfo	519
949	graph	NameComponents	{}	{[]string}	*NodeInfo	519
950	graph	FindOrInsertNode	{graph.NodeInfo,graph.NodeSet}	{*graph.Node}	NodeMap	520
951	graph	Sort	{}	{[]*graph.Edge}	EdgeMap	523
952	graph	Sum	{}	{int64}	EdgeMap	523
953	graph	WeightValue	{}	{int64}	*Edge	524
954	graph	FlatValue	{}	{int64}	*Tag	525
955	graph	CumValue	{}	{int64}	*Tag	525
956	proftest	ReadLine	{string}	{string,error}	*TestUI	541
957	proftest	Print	{"...interface{}"}	{}	*TestUI	541
958	proftest	PrintErr	{"...interface{}"}	{}	*TestUI	541
959	proftest	IsTerminal	{}	{bool}	*TestUI	541
960	proftest	SetAutoComplete	{"func(string) string"}	{}	*TestUI	541
961	report	Total	{}	{int64}	*Report	544
962	symbolizer	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}	*Symbolizer	545
963	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	547
964	profile	FilterTagsByName	{*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	547
965	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	547
966	profile	SampleIndexByName	{string}	{int,error}	*Profile	547
967	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	547
968	profile	ParseMemoryMapFromScanner	{*bufio.Scanner}	{error}	*Profile	547
969	profile	Compact	{}	{*profile.Profile}	*Profile	547
970	profile	Normalize	{*profile.Profile}	{error}	*Profile	547
971	profile	Write	{io.Writer}	{error}	*Profile	547
972	profile	WriteUncompressed	{io.Writer}	{error}	*Profile	547
973	profile	CheckValid	{}	{error}	*Profile	547
974	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	547
975	profile	NumLabelUnits	{}	{map[string]string,map[string][]string}	*Profile	547
976	profile	String	{}	{string}	*Profile	547
977	profile	Scale	{float64}	{}	*Profile	547
978	profile	ScaleN	{[]float64}	{error}	*Profile	547
979	profile	HasFunctions	{}	{bool}	*Profile	547
980	profile	HasFileLines	{}	{bool}	*Profile	547
981	profile	Copy	{}	{*profile.Profile}	*Profile	547
982	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	547
983	profile	RemoveUninteresting	{}	{error}	*Profile	547
984	profile	PruneFrom	{*regexp.Regexp}	{}	*Profile	547
985	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	547
986	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	547
987	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	547
988	profile	Write	{io.Writer}	{error}	*Profile	547
989	profile	CheckValid	{}	{error}	*Profile	547
990	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	547
991	profile	String	{}	{string}	*Profile	547
992	profile	Merge	{*profile.Profile,float64}	{error}	*Profile	547
993	profile	Compatible	{*profile.Profile}	{error}	*Profile	547
994	profile	HasFunctions	{}	{bool}	*Profile	547
995	profile	HasFileLines	{}	{bool}	*Profile	547
996	profile	Copy	{}	{*profile.Profile}	*Profile	547
997	profile	Demangle	{profile.Demangler}	{error}	*Profile	547
998	profile	Empty	{}	{bool}	*Profile	547
999	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	547
1000	profile	RemoveUninteresting	{}	{error}	*Profile	547
1001	profile	Unsymbolizable	{}	{bool}	*Mapping	550
1002	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Name	555
1003	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Name	555
1004	demangle	GoString	{}	{string}	*Name	555
1005	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Typed	556
1006	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Typed	556
1007	demangle	GoString	{}	{string}	*Typed	556
1008	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Qualified	557
1009	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Qualified	557
1010	demangle	GoString	{}	{string}	*Qualified	557
1011	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Template	558
1012	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Template	558
1013	demangle	GoString	{}	{string}	*Template	558
1014	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TemplateParam	559
1015	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TemplateParam	559
1016	demangle	GoString	{}	{string}	*TemplateParam	559
1017	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TypeWithQualifiers	561
1018	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TypeWithQualifiers	561
1019	demangle	GoString	{}	{string}	*TypeWithQualifiers	561
1020	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*MethodWithQualifiers	562
1021	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*MethodWithQualifiers	562
1022	demangle	GoString	{}	{string}	*MethodWithQualifiers	562
1023	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*BuiltinType	563
1024	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*BuiltinType	563
1025	demangle	GoString	{}	{string}	*BuiltinType	563
1026	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PointerType	564
1027	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PointerType	564
1028	demangle	GoString	{}	{string}	*PointerType	564
1029	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ReferenceType	565
1030	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ReferenceType	565
1031	demangle	GoString	{}	{string}	*ReferenceType	565
1032	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*RvalueReferenceType	566
1033	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*RvalueReferenceType	566
1034	demangle	GoString	{}	{string}	*RvalueReferenceType	566
1035	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ComplexType	567
1036	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ComplexType	567
1037	demangle	GoString	{}	{string}	*ComplexType	567
1038	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ImaginaryType	568
1039	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ImaginaryType	568
1040	demangle	GoString	{}	{string}	*ImaginaryType	568
1041	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VendorQualifier	569
1042	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VendorQualifier	569
1043	demangle	GoString	{}	{string}	*VendorQualifier	569
1044	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArrayType	570
1045	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArrayType	570
1046	demangle	GoString	{}	{string}	*ArrayType	570
1047	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionType	571
1048	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionType	571
1049	demangle	GoString	{}	{string}	*FunctionType	571
1050	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionParam	572
1051	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionParam	572
1052	demangle	GoString	{}	{string}	*FunctionParam	572
1053	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PtrMem	573
1054	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PtrMem	573
1055	demangle	GoString	{}	{string}	*PtrMem	573
1056	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FixedType	574
1057	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FixedType	574
1058	demangle	GoString	{}	{string}	*FixedType	574
1059	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VectorType	575
1060	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VectorType	575
1061	demangle	GoString	{}	{string}	*VectorType	575
1062	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Decltype	576
1063	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Decltype	576
1064	demangle	GoString	{}	{string}	*Decltype	576
1065	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Operator	577
1066	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Operator	577
1067	demangle	GoString	{}	{string}	*Operator	577
1068	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Constructor	578
1069	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Constructor	578
1070	demangle	GoString	{}	{string}	*Constructor	578
1071	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Destructor	579
1072	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Destructor	579
1073	demangle	GoString	{}	{string}	*Destructor	579
1074	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*GlobalCDtor	580
1075	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*GlobalCDtor	580
1076	demangle	GoString	{}	{string}	*GlobalCDtor	580
1077	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TaggedName	581
1078	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TaggedName	581
1079	demangle	GoString	{}	{string}	*TaggedName	581
1080	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PackExpansion	582
1081	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PackExpansion	582
1082	demangle	GoString	{}	{string}	*PackExpansion	582
1083	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArgumentPack	583
1084	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArgumentPack	583
1085	demangle	GoString	{}	{string}	*ArgumentPack	583
1086	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofPack	584
1087	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofPack	584
1088	demangle	GoString	{}	{string}	*SizeofPack	584
1089	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofArgs	585
1090	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofArgs	585
1091	demangle	GoString	{}	{string}	*SizeofArgs	585
1092	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Cast	586
1093	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Cast	586
1094	demangle	GoString	{}	{string}	*Cast	586
1095	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Nullary	587
1096	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Nullary	587
1097	demangle	GoString	{}	{string}	*Nullary	587
1098	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Unary	588
1099	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Unary	588
1100	demangle	GoString	{}	{string}	*Unary	588
1101	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Binary	589
1102	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Binary	589
1103	demangle	GoString	{}	{string}	*Binary	589
1104	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Trinary	590
1105	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Trinary	590
1106	demangle	GoString	{}	{string}	*Trinary	590
1107	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Fold	591
1108	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Fold	591
1109	demangle	GoString	{}	{string}	*Fold	591
1110	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*New	592
1111	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*New	592
1112	demangle	GoString	{}	{string}	*New	592
1113	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Literal	593
1114	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Literal	593
1115	demangle	GoString	{}	{string}	*Literal	593
1116	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ExprList	594
1117	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ExprList	594
1118	demangle	GoString	{}	{string}	*ExprList	594
1119	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*InitializerList	595
1120	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*InitializerList	595
1121	demangle	GoString	{}	{string}	*InitializerList	595
1122	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*DefaultArg	596
1123	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*DefaultArg	596
1124	demangle	GoString	{}	{string}	*DefaultArg	596
1125	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Closure	597
1126	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Closure	597
1127	demangle	GoString	{}	{string}	*Closure	597
1128	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*UnnamedType	598
1129	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*UnnamedType	598
1130	demangle	GoString	{}	{string}	*UnnamedType	598
1131	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Clone	599
1132	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Clone	599
1133	demangle	GoString	{}	{string}	*Clone	599
1134	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special	600
1135	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special	600
1136	demangle	GoString	{}	{string}	*Special	600
1137	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special2	601
1138	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special2	601
1139	demangle	GoString	{}	{string}	*Special2	601
1140	armasm	String	{}	{string}	Mode	603
1141	armasm	String	{}	{string}	Op	604
1142	armasm	String	{}	{string}	Inst	605
1143	armasm	IsArg	{}	{}	Float32Imm	608
1144	armasm	String	{}	{string}	Float32Imm	608
1145	armasm	IsArg	{}	{}	Float64Imm	609
1146	armasm	String	{}	{string}	Float64Imm	609
1147	armasm	IsArg	{}	{}	Imm	610
1148	armasm	String	{}	{string}	Imm	610
1149	armasm	IsArg	{}	{}	ImmAlt	611
1150	armasm	Imm	{}	{armasm.Imm}	ImmAlt	611
1151	armasm	String	{}	{string}	ImmAlt	611
1152	armasm	IsArg	{}	{}	Label	612
1153	armasm	String	{}	{string}	Label	612
1154	armasm	IsArg	{}	{}	Reg	613
1155	armasm	String	{}	{string}	Reg	613
1156	armasm	IsArg	{}	{}	RegX	614
1157	armasm	String	{}	{string}	RegX	614
1158	armasm	IsArg	{}	{}	RegList	615
1159	armasm	String	{}	{string}	RegList	615
1160	armasm	IsArg	{}	{}	Endian	616
1161	armasm	String	{}	{string}	Endian	616
1162	armasm	String	{}	{string}	Shift	617
1163	armasm	IsArg	{}	{}	RegShift	618
1164	armasm	String	{}	{string}	RegShift	618
1165	armasm	IsArg	{}	{}	RegShiftReg	619
1166	armasm	String	{}	{string}	RegShiftReg	619
1167	armasm	IsArg	{}	{}	PCRel	620
1168	armasm	String	{}	{string}	PCRel	620
1169	armasm	IsArg	{}	{}	Mem	622
1170	armasm	String	{}	{string}	Mem	622
1171	arm64asm	String	{}	{string}	Op	624
1172	arm64asm	String	{}	{string}	Inst	625
1173	arm64asm	String	{}	{string}	Reg	628
1174	arm64asm	String	{}	{string}	RegSP	629
1175	arm64asm	String	{}	{string}	ImmShift	630
1176	arm64asm	String	{}	{string}	ExtShift	631
1177	arm64asm	String	{}	{string}	RegExtshiftAmount	632
1178	arm64asm	String	{}	{string}	PCRel	633
1179	arm64asm	String	{}	{string}	MemImmediate	635
1180	arm64asm	String	{}	{string}	MemExtend	636
1181	arm64asm	String	{}	{string}	Imm	637
1182	arm64asm	String	{}	{string}	Imm64	638
1183	arm64asm	String	{}	{string}	Imm_hint	639
1184	arm64asm	String	{}	{string}	Imm_clrex	640
1185	arm64asm	String	{}	{string}	Imm_dcps	641
1186	arm64asm	String	{}	{string}	Cond	642
1187	arm64asm	String	{}	{string}	Imm_c	643
1188	arm64asm	String	{}	{string}	Imm_option	644
1189	arm64asm	String	{}	{string}	Imm_prfop	645
1190	arm64asm	String	{}	{string}	Pstatefield	646
1191	arm64asm	String	{}	{string}	Systemreg	647
1192	arm64asm	String	{}	{string}	Imm_fp	648
1193	arm64asm	String	{}	{string}	Arrangement	649
1194	arm64asm	String	{}	{string}	RegisterWithArrangement	650
1195	arm64asm	String	{}	{string}	RegisterWithArrangementAndIndex	651
1196	ppc64asm	String	{}	{string}	ArgType	652
1197	ppc64asm	GoString	{}	{string}	ArgType	652
1198	ppc64asm	String	{}	{string}	BitField	653
1199	ppc64asm	Parse	{uint32}	{uint32}	BitField	653
1200	ppc64asm	ParseSigned	{uint32}	{int32}	BitField	653
1201	ppc64asm	String	{}	{string}	BitFields	654
1202	ppc64asm	Append	{ppc64asm.BitField}	{}	*BitFields	654
1203	ppc64asm	Parse	{uint32}	{uint32}	BitFields	654
1204	ppc64asm	ParseSigned	{uint32}	{int32}	BitFields	654
1205	ppc64asm	String	{}	{string}	Inst	655
1206	ppc64asm	String	{}	{string}	Op	656
1207	ppc64asm	IsArg	{}	{}	Reg	659
1208	ppc64asm	String	{}	{string}	Reg	659
1209	ppc64asm	IsArg	{}	{}	CondReg	660
1210	ppc64asm	String	{}	{string}	CondReg	660
1211	ppc64asm	IsArg	{}	{}	SpReg	661
1212	ppc64asm	String	{}	{string}	SpReg	661
1213	ppc64asm	IsArg	{}	{}	PCRel	662
1214	ppc64asm	String	{}	{string}	PCRel	662
1215	ppc64asm	IsArg	{}	{}	Label	663
1216	ppc64asm	String	{}	{string}	Label	663
1217	ppc64asm	IsArg	{}	{}	Imm	664
1218	ppc64asm	String	{}	{string}	Imm	664
1219	ppc64asm	IsArg	{}	{}	Offset	665
1220	ppc64asm	String	{}	{string}	Offset	665
1221	x86asm	String	{}	{string}	Inst	666
1222	x86asm	IsREX	{}	{bool}	Prefix	668
1223	x86asm	IsVEX	{}	{bool}	Prefix	668
1224	x86asm	String	{}	{string}	Prefix	668
1225	x86asm	String	{}	{string}	Op	669
1226	x86asm	String	{}	{string}	Reg	672
1227	x86asm	String	{}	{string}	Mem	673
1228	x86asm	String	{}	{string}	Rel	674
1229	x86asm	String	{}	{string}	Imm	675
1230	cfg	Format	{*token.FileSet}	{string}	*CFG	677
1231	cfg	String	{}	{string}	*Block	678
1232	cfg	Return	{}	{*ast.ReturnStmt}	*Block	678
1233	testdata	SetX	{int,"chan int\n"}	{}	*ST	684
1234	testdata	OkMeth	{}	{}	*EmbeddedRWMutex	688
1235	testdata	BadMeth	{}	{}	EmbeddedRWMutex	688
1236	testdata	OkMeth	{}	{}	*FieldMutex	689
1237	testdata	BadMeth	{}	{}	FieldMutex	689
1238	testdata	Ok	{}	{}	*L0	690
1239	testdata	Bad	{}	{}	L0	690
1240	testdata	Ok	{}	{}	*EmbeddedMutexPointer	693
1241	testdata	AlsoOk	{}	{}	EmbeddedMutexPointer	693
1242	testdata	Ok	{}	{}	*EmbeddedLocker	694
1243	testdata	AlsoOk	{}	{}	EmbeddedLocker	694
1244	testdata	Lock	{}	{}	*CustomLock	695
1245	testdata	Unlock	{}	{}	*CustomLock	695
1246	testdata	Bad	{}	{}	LocalOnce	696
1247	testdata	Bad	{}	{}	LocalMutex	697
1248	testdata	M	{}	{}	T	698
1249	buf	Append	{[]byte}	{}	*Buf	699
1250	buf	Reset	{}	{}	Buf	699
1251	buf	Len	{}	{int}	Buf	699
1252	testdata	Scan	{fmt.ScanState,byte}	{}	*MethodTest	700
1253	testdata	Format	{fmt.State,rune}	{}	*BoolFormatter	703
1254	testdata	Format	{fmt.State,rune}	{}	FormatterVal	704
1255	bzip2	Error	{}	{string}	StructuralError	721
1256	flate	Write	{[]byte}	{int,error}	*Writer	722
1257	flate	Flush	{}	{error}	*Writer	722
1258	flate	Close	{}	{error}	*Writer	722
1259	flate	Reset	{io.Writer}	{}	*Writer	722
1260	flate	Error	{}	{string}	CorruptInputError	723
1261	flate	Error	{}	{string}	InternalError	724
1262	flate	Error	{}	{string}	*ReadError	725
1263	flate	Error	{}	{string}	*WriteError	726
1264	gzip	Reset	{io.Reader}	{error}	*Reader	730
1265	gzip	Multistream	{bool}	{}	*Reader	730
1266	gzip	Read	{[]byte}	{int,error}	*Reader	730
1267	gzip	Close	{}	{error}	*Reader	730
1268	gzip	Reset	{io.Writer}	{}	*Writer	731
1269	gzip	Write	{[]byte}	{int,error}	*Writer	731
1270	gzip	Flush	{}	{error}	*Writer	731
1271	gzip	Close	{}	{error}	*Writer	731
1272	zlib	Reset	{io.Writer}	{}	*Writer	734
1273	zlib	Write	{[]byte}	{int,error}	*Writer	734
1274	zlib	Flush	{}	{error}	*Writer	734
1275	zlib	Close	{}	{error}	*Writer	734
1276	list	Next	{}	{*list.Element}	*Element	736
1277	list	Prev	{}	{*list.Element}	*Element	736
1278	list	Init	{}	{*list.List}	*List	737
1279	list	Len	{}	{int}	*List	737
1280	list	Front	{}	{*list.Element}	*List	737
1281	list	Back	{}	{*list.Element}	*List	737
1282	list	Remove	{*list.Element}	{"interface{}"}	*List	737
1283	list	PushFront	{"interface{}"}	{*list.Element}	*List	737
1284	list	PushBack	{"interface{}"}	{*list.Element}	*List	737
1285	list	InsertBefore	{"interface{}",*list.Element}	{*list.Element}	*List	737
1286	list	InsertAfter	{"interface{}",*list.Element}	{*list.Element}	*List	737
1287	list	MoveToFront	{*list.Element}	{}	*List	737
1288	list	MoveToBack	{*list.Element}	{}	*List	737
1289	list	MoveBefore	{*list.Element,*list.Element}	{}	*List	737
1290	list	MoveAfter	{*list.Element,*list.Element}	{}	*List	737
1291	list	PushBackList	{*list.List}	{}	*List	737
1292	list	PushFrontList	{*list.List}	{}	*List	737
1293	ring	Next	{}	{*ring.Ring}	*Ring	738
1294	ring	Prev	{}	{*ring.Ring}	*Ring	738
1295	ring	Move	{int}	{*ring.Ring}	*Ring	738
1296	ring	Link	{*ring.Ring}	{*ring.Ring}	*Ring	738
1297	ring	Unlink	{int}	{*ring.Ring}	*Ring	738
1298	ring	Len	{}	{int}	*Ring	738
1299	ring	Do	{"func(interface{})"}	{}	*Ring	738
1300	aes	Error	{}	{string}	KeySizeError	741
1301	cipher	Read	{[]byte}	{int,error}	StreamReader	746
1302	cipher	Write	{[]byte}	{int,error}	StreamWriter	747
1303	cipher	Close	{}	{error}	StreamWriter	747
1304	crypto	HashFunc	{}	{crypto.Hash}	Hash	748
1305	crypto	Size	{}	{int}	Hash	748
1306	crypto	New	{}	{hash.Hash}	Hash	748
1307	crypto	Available	{}	{bool}	Hash	748
1308	des	Error	{}	{string}	KeySizeError	755
1309	ecdsa	Public	{}	{crypto.PublicKey}	*PrivateKey	761
1310	ecdsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	761
1311	elliptic	Params	{}	{*elliptic.CurveParams}	*CurveParams	763
1312	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}	*CurveParams	763
1313	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	763
1314	elliptic	Double	{*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	763
1315	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int,*big.Int}	*CurveParams	763
1316	elliptic	ScalarBaseMult	{[]byte}	{*big.Int,*big.Int}	*CurveParams	763
1317	rc4	Reset	{}	{}	*Cipher	765
1318	rc4	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	765
1319	rc4	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	765
1320	rc4	Error	{}	{string}	KeySizeError	766
1321	rsa	HashFunc	{}	{crypto.Hash}	*PSSOptions	768
1322	rsa	Public	{}	{crypto.PublicKey}	*PrivateKey	771
1323	rsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	771
1324	rsa	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}	*PrivateKey	771
1325	rsa	Validate	{}	{error}	*PrivateKey	771
1326	rsa	Precompute	{}	{}	*PrivateKey	771
1327	tls	Clone	{}	{*tls.Config}	*Config	783
1328	tls	SetSessionTicketKeys	{[][]byte}	{}	*Config	783
1329	tls	BuildNameToCertificate	{}	{}	*Config	783
1330	tls	LocalAddr	{}	{net.Addr}	*Conn	785
1331	tls	RemoteAddr	{}	{net.Addr}	*Conn	785
1332	tls	SetDeadline	{time.Time}	{error}	*Conn	785
1333	tls	SetReadDeadline	{time.Time}	{error}	*Conn	785
1334	tls	SetWriteDeadline	{time.Time}	{error}	*Conn	785
1335	tls	Write	{[]byte}	{int,error}	*Conn	785
1336	tls	Read	{[]byte}	{int,error}	*Conn	785
1337	tls	Close	{}	{error}	*Conn	785
1338	tls	CloseWrite	{}	{error}	*Conn	785
1339	tls	Handshake	{}	{error}	*Conn	785
1340	tls	ConnectionState	{}	{tls.ConnectionState}	*Conn	785
1341	tls	OCSPResponse	{}	{[]byte}	*Conn	785
1342	tls	VerifyHostname	{string}	{error}	*Conn	785
1343	tls	Error	{}	{string}	RecordHeaderError	786
1344	x509	AddCert	{*x509.Certificate}	{}	*CertPool	787
1345	x509	AppendCertsFromPEM	{[]byte}	{bool}	*CertPool	787
1346	x509	Subjects	{}	{[][]byte}	*CertPool	787
1347	pkix	String	{}	{string}	RDNSequence	790
1348	pkix	FillFromRDNSequence	{*pkix.RDNSequence}	{}	*Name	795
1349	pkix	ToRDNSequence	{}	{pkix.RDNSequence}	Name	795
1350	pkix	String	{}	{string}	Name	795
1351	pkix	HasExpired	{time.Time}	{bool}	*CertificateList	796
1352	x509	Error	{}	{string}	CertificateInvalidError	800
1353	x509	Error	{}	{string}	HostnameError	801
1354	x509	Error	{}	{string}	UnknownAuthorityError	802
1355	x509	Error	{}	{string}	SystemRootsError	803
1356	x509	String	{}	{string}	SignatureAlgorithm	805
1357	x509	String	{}	{string}	PublicKeyAlgorithm	806
1358	x509	Verify	{x509.VerifyOptions}	{[][]*x509.Certificate,error}	*Certificate	809
1359	x509	VerifyHostname	{string}	{error}	*Certificate	809
1360	x509	Equal	{*x509.Certificate}	{bool}	*Certificate	809
1361	x509	CheckSignatureFrom	{*x509.Certificate}	{error}	*Certificate	809
1362	x509	CheckSignature	{x509.SignatureAlgorithm,[]byte,[]byte}	{error}	*Certificate	809
1363	x509	CheckCRLSignature	{*pkix.CertificateList}	{error}	*Certificate	809
1364	x509	CreateCRL	{io.Reader,"interface{}",[]pkix.RevokedCertificate,time.Time,time.Time}	{[]byte,error}	*Certificate	809
1365	x509	Error	{}	{string}	InsecureAlgorithmError	810
1366	x509	Error	{}	{string}	ConstraintViolationError	811
1367	x509	Error	{}	{string}	UnhandledCriticalExtension	812
1368	x509	CheckSignature	{}	{error}	*CertificateRequest	813
1369	driver	LastInsertId	{}	{int64,error}	RowsAffected	844
1370	driver	RowsAffected	{}	{int64,error}	RowsAffected	844
1371	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	Null	847
1372	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	NotNull	848
1373	sql	Scan	{"interface{}"}	{error}	*NullString	853
1374	sql	Value	{}	{driver.Value,error}	NullString	853
1375	sql	Scan	{"interface{}"}	{error}	*NullInt64	854
1376	sql	Value	{}	{driver.Value,error}	NullInt64	854
1377	sql	Scan	{"interface{}"}	{error}	*NullFloat64	855
1378	sql	Value	{}	{driver.Value,error}	NullFloat64	855
1379	sql	Scan	{"interface{}"}	{error}	*NullBool	856
1380	sql	Value	{}	{driver.Value,error}	NullBool	856
1381	sql	PingContext	{context.Context}	{error}	*DB	859
1382	sql	Ping	{}	{error}	*DB	859
1383	sql	Close	{}	{error}	*DB	859
1384	sql	SetMaxIdleConns	{int}	{}	*DB	859
1385	sql	SetMaxOpenConns	{int}	{}	*DB	859
1386	sql	SetConnMaxLifetime	{time.Duration}	{}	*DB	859
1387	sql	Stats	{}	{sql.DBStats}	*DB	859
1388	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*DB	859
1389	sql	Prepare	{string}	{*sql.Stmt,error}	*DB	859
1390	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*DB	859
1391	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*DB	859
1392	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*DB	859
1393	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*DB	859
1394	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*DB	859
1395	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*DB	859
1396	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*DB	859
1397	sql	Begin	{}	{*sql.Tx,error}	*DB	859
1398	sql	Driver	{}	{driver.Driver}	*DB	859
1399	sql	Conn	{context.Context}	{*sql.Conn,error}	*DB	859
1400	sql	PingContext	{context.Context}	{error}	*Conn	861
1401	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Conn	861
1402	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Conn	861
1403	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Conn	861
1404	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Conn	861
1405	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*Conn	861
1406	sql	Close	{}	{error}	*Conn	861
1407	sql	Commit	{}	{error}	*Tx	862
1408	sql	Rollback	{}	{error}	*Tx	862
1409	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Tx	862
1410	sql	Prepare	{string}	{*sql.Stmt,error}	*Tx	862
1411	sql	StmtContext	{context.Context,*sql.Stmt}	{*sql.Stmt}	*Tx	862
1412	sql	Stmt	{*sql.Stmt}	{*sql.Stmt}	*Tx	862
1413	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Tx	862
1414	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*Tx	862
1415	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Tx	862
1416	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*Tx	862
1417	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Tx	862
1418	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*Tx	862
1419	sql	ExecContext	{context.Context,"...interface{}"}	{sql.Result,error}	*Stmt	863
1420	sql	Exec	{"...interface{}"}	{sql.Result,error}	*Stmt	863
1421	sql	QueryContext	{context.Context,"...interface{}"}	{*sql.Rows,error}	*Stmt	863
1422	sql	Query	{"...interface{}"}	{*sql.Rows,error}	*Stmt	863
1423	sql	QueryRowContext	{context.Context,"...interface{}"}	{*sql.Row}	*Stmt	863
1424	sql	QueryRow	{"...interface{}"}	{*sql.Row}	*Stmt	863
1425	sql	Close	{}	{error}	*Stmt	863
1426	sql	Next	{}	{bool}	*Rows	864
1427	sql	NextResultSet	{}	{bool}	*Rows	864
1428	sql	Err	{}	{error}	*Rows	864
1429	sql	Columns	{}	{[]string,error}	*Rows	864
1430	sql	ColumnTypes	{}	{[]*sql.ColumnType,error}	*Rows	864
1431	sql	Scan	{"...interface{}"}	{error}	*Rows	864
1432	sql	Close	{}	{error}	*Rows	864
1433	sql	Name	{}	{string}	*ColumnType	865
1434	sql	Length	{}	{int64,bool}	*ColumnType	865
1435	sql	DecimalSize	{}	{int64,bool}	*ColumnType	865
1436	sql	ScanType	{}	{reflect.Type}	*ColumnType	865
1437	sql	Nullable	{}	{bool}	*ColumnType	865
1438	sql	DatabaseTypeName	{}	{string}	*ColumnType	865
1439	sql	Scan	{"...interface{}"}	{error}	*Row	866
1440	dwarf	Error	{}	{string}	DecodeError	868
1441	dwarf	String	{}	{string}	Attr	869
1442	dwarf	GoString	{}	{string}	Attr	869
1443	dwarf	String	{}	{string}	Tag	870
1444	dwarf	GoString	{}	{string}	Tag	870
1445	dwarf	Val	{dwarf.Attr}	{"interface{}"}	*Entry	871
1446	dwarf	AttrField	{dwarf.Attr}	{*dwarf.Field}	*Entry	871
1447	dwarf	String	{}	{string}	Class	873
1448	dwarf	GoString	{}	{string}	Class	873
1449	dwarf	AddressSize	{}	{int}	*Reader	875
1450	dwarf	Seek	{dwarf.Offset}	{}	*Reader	875
1451	dwarf	Next	{}	{*dwarf.Entry,error}	*Reader	875
1452	dwarf	SkipChildren	{}	{}	*Reader	875
1453	dwarf	SeekPC	{uint64}	{*dwarf.Entry,error}	*Reader	875
1454	dwarf	Next	{*dwarf.LineEntry}	{error}	*LineReader	876
1455	dwarf	Tell	{}	{dwarf.LineReaderPos}	*LineReader	876
1456	dwarf	Seek	{dwarf.LineReaderPos}	{}	*LineReader	876
1457	dwarf	Reset	{}	{}	*LineReader	876
1458	dwarf	SeekPC	{uint64,*dwarf.LineEntry}	{error}	*LineReader	876
1459	dwarf	Reader	{}	{*dwarf.Reader}	*Data	880
1460	dwarf	Ranges	{*dwarf.Entry}	{[][]uint64,error}	*Data	880
1461	dwarf	LineReader	{*dwarf.Entry}	{*dwarf.LineReader,error}	*Data	880
1462	dwarf	AddTypes	{string,[]byte}	{error}	*Data	880
1463	dwarf	Type	{dwarf.Offset}	{dwarf.Type,error}	*Data	880
1464	dwarf	Common	{}	{*dwarf.CommonType}	*CommonType	882
1465	dwarf	Size	{}	{int64}	*CommonType	882
1466	dwarf	Basic	{}	{*dwarf.BasicType}	*BasicType	883
1467	dwarf	String	{}	{string}	*BasicType	883
1468	dwarf	String	{}	{string}	*QualType	893
1469	dwarf	Size	{}	{int64}	*QualType	893
1470	dwarf	String	{}	{string}	*ArrayType	894
1471	dwarf	Size	{}	{int64}	*ArrayType	894
1472	dwarf	String	{}	{string}	*VoidType	895
1473	dwarf	String	{}	{string}	*PtrType	896
1474	dwarf	String	{}	{string}	*StructType	897
1475	dwarf	Defn	{}	{string}	*StructType	897
1476	dwarf	String	{}	{string}	*EnumType	899
1477	dwarf	String	{}	{string}	*FuncType	901
1478	dwarf	String	{}	{string}	*DotDotDotType	902
1479	dwarf	String	{}	{string}	*TypedefType	903
1480	dwarf	Size	{}	{int64}	*TypedefType	903
1481	elf	String	{}	{string}	Version	904
1482	elf	GoString	{}	{string}	Version	904
1483	elf	String	{}	{string}	Class	905
1484	elf	GoString	{}	{string}	Class	905
1485	elf	String	{}	{string}	Data	906
1486	elf	GoString	{}	{string}	Data	906
1487	elf	String	{}	{string}	OSABI	907
1488	elf	GoString	{}	{string}	OSABI	907
1489	elf	String	{}	{string}	Type	908
1490	elf	GoString	{}	{string}	Type	908
1491	elf	String	{}	{string}	Machine	909
1492	elf	GoString	{}	{string}	Machine	909
1493	elf	String	{}	{string}	SectionIndex	910
1494	elf	GoString	{}	{string}	SectionIndex	910
1495	elf	String	{}	{string}	SectionType	911
1496	elf	GoString	{}	{string}	SectionType	911
1497	elf	String	{}	{string}	SectionFlag	912
1498	elf	GoString	{}	{string}	SectionFlag	912
1851	ast	End	{}	{token.Pos}	*File	1165
1499	elf	String	{}	{string}	CompressionType	913
1500	elf	GoString	{}	{string}	CompressionType	913
1501	elf	String	{}	{string}	ProgType	914
1502	elf	GoString	{}	{string}	ProgType	914
1503	elf	String	{}	{string}	ProgFlag	915
1504	elf	GoString	{}	{string}	ProgFlag	915
1505	elf	String	{}	{string}	DynTag	916
1506	elf	GoString	{}	{string}	DynTag	916
1507	elf	String	{}	{string}	DynFlag	917
1508	elf	GoString	{}	{string}	DynFlag	917
1509	elf	String	{}	{string}	NType	918
1510	elf	GoString	{}	{string}	NType	918
1511	elf	String	{}	{string}	SymBind	919
1512	elf	GoString	{}	{string}	SymBind	919
1513	elf	String	{}	{string}	SymType	920
1514	elf	GoString	{}	{string}	SymType	920
1515	elf	String	{}	{string}	SymVis	921
1516	elf	GoString	{}	{string}	SymVis	921
1517	elf	String	{}	{string}	R_X86_64	922
1518	elf	GoString	{}	{string}	R_X86_64	922
1519	elf	String	{}	{string}	R_AARCH64	923
1520	elf	GoString	{}	{string}	R_AARCH64	923
1521	elf	String	{}	{string}	R_ALPHA	924
1522	elf	GoString	{}	{string}	R_ALPHA	924
1523	elf	String	{}	{string}	R_ARM	925
1524	elf	GoString	{}	{string}	R_ARM	925
1525	elf	String	{}	{string}	R_386	926
1526	elf	GoString	{}	{string}	R_386	926
1527	elf	String	{}	{string}	R_MIPS	927
1528	elf	GoString	{}	{string}	R_MIPS	927
1529	elf	String	{}	{string}	R_PPC	928
1530	elf	GoString	{}	{string}	R_PPC	928
1531	elf	String	{}	{string}	R_PPC64	929
1532	elf	GoString	{}	{string}	R_PPC64	929
1533	elf	String	{}	{string}	R_390	930
1534	elf	GoString	{}	{string}	R_390	930
1535	elf	String	{}	{string}	R_SPARC	931
1536	elf	GoString	{}	{string}	R_SPARC	931
1537	elf	Close	{}	{error}	*File	949
1538	elf	SectionByType	{elf.SectionType}	{*elf.Section}	*File	949
1539	elf	Section	{string}	{*elf.Section}	*File	949
1540	elf	DWARF	{}	{*dwarf.Data,error}	*File	949
1541	elf	Symbols	{}	{[]elf.Symbol,error}	*File	949
1542	elf	DynamicSymbols	{}	{[]elf.Symbol,error}	*File	949
1543	elf	ImportedSymbols	{}	{[]elf.ImportedSymbol,error}	*File	949
1544	elf	ImportedLibraries	{}	{[]string,error}	*File	949
1545	elf	DynString	{elf.DynTag}	{[]string,error}	*File	949
1546	elf	Data	{}	{[]byte,error}	*Section	951
1547	elf	Open	{}	{io.ReadSeeker}	*Section	951
1548	elf	Open	{}	{io.ReadSeeker}	*Prog	953
1549	elf	Error	{}	{string}	*FormatError	955
1550	gosym	PCToLine	{uint64}	{int}	*LineTable	957
1551	gosym	LineToPC	{int,uint64}	{uint64}	*LineTable	957
1552	gosym	Static	{}	{bool}	*Sym	958
1553	gosym	PackageName	{}	{string}	*Sym	958
1554	gosym	ReceiverName	{}	{string}	*Sym	958
1555	gosym	BaseName	{}	{string}	*Sym	958
1556	gosym	PCToFunc	{uint64}	{*gosym.Func}	*Table	961
1557	gosym	PCToLine	{uint64}	{string,int,*gosym.Func}	*Table	961
1558	gosym	LineToPC	{string,int}	{uint64,*gosym.Func,error}	*Table	961
1559	gosym	LookupSym	{string}	{*gosym.Sym}	*Table	961
1560	gosym	LookupFunc	{string}	{*gosym.Func}	*Table	961
1561	gosym	SymByAddr	{uint64}	{*gosym.Sym}	*Table	961
1562	gosym	Error	{}	{string}	UnknownFileError	962
1563	gosym	Error	{}	{string}	*UnknownLineError	963
1564	gosym	Error	{}	{string}	*DecodingError	964
1565	macho	Close	{}	{error}	*FatFile	965
1566	macho	Close	{}	{error}	*File	968
1567	macho	Segment	{string}	{*macho.Segment}	*File	968
1568	macho	Section	{string}	{*macho.Section}	*File	968
1569	macho	DWARF	{}	{*dwarf.Data,error}	*File	968
1570	macho	ImportedSymbols	{}	{[]string,error}	*File	968
1571	macho	ImportedLibraries	{}	{[]string,error}	*File	968
1572	macho	Raw	{}	{[]byte}	LoadBytes	970
1573	macho	Data	{}	{[]byte,error}	*Segment	972
1574	macho	Open	{}	{io.ReadSeeker}	*Segment	972
1575	macho	Data	{}	{[]byte,error}	*Section	975
1576	macho	Open	{}	{io.ReadSeeker}	*Section	975
1577	macho	Error	{}	{string}	*FormatError	981
1578	macho	String	{}	{string}	Type	983
1579	macho	GoString	{}	{string}	Type	983
1580	macho	String	{}	{string}	Cpu	984
1581	macho	GoString	{}	{string}	Cpu	984
1582	macho	String	{}	{string}	LoadCmd	985
1583	macho	GoString	{}	{string}	LoadCmd	985
1584	macho	GoString	{}	{string}	RelocTypeGeneric	999
1585	macho	String	{}	{string}	RelocTypeGeneric	999
1586	macho	GoString	{}	{string}	RelocTypeX86_64	1000
1587	macho	String	{}	{string}	RelocTypeX86_64	1000
1588	macho	GoString	{}	{string}	RelocTypeARM	1001
1589	macho	String	{}	{string}	RelocTypeARM	1001
1590	macho	GoString	{}	{string}	RelocTypeARM64	1002
1591	macho	String	{}	{string}	RelocTypeARM64	1002
1592	pe	Close	{}	{error}	*File	1003
1593	pe	Section	{string}	{*pe.Section}	*File	1003
1594	pe	DWARF	{}	{*dwarf.Data,error}	*File	1003
1595	pe	ImportedSymbols	{}	{[]string,error}	*File	1003
1596	pe	ImportedLibraries	{}	{[]string,error}	*File	1003
1597	pe	Error	{}	{string}	*FormatError	1005
1598	pe	Data	{}	{[]byte,error}	*Section	1013
1599	pe	Open	{}	{io.ReadSeeker}	*Section	1013
1600	pe	String	{uint32}	{string,error}	StringTable	1014
1601	pe	FullName	{pe.StringTable}	{string,error}	*COFFSymbol	1015
1602	plan9obj	Close	{}	{error}	*File	1018
1603	plan9obj	Symbols	{}	{[]plan9obj.Sym,error}	*File	1018
1604	plan9obj	Section	{string}	{*plan9obj.Section}	*File	1018
1605	plan9obj	Data	{}	{[]byte,error}	*Section	1020
1606	plan9obj	Open	{}	{io.ReadSeeker}	*Section	1020
1607	ascii85	Error	{}	{string}	CorruptInputError	1022
1608	asn1	Error	{}	{string}	StructuralError	1023
1609	asn1	Error	{}	{string}	SyntaxError	1024
1610	asn1	At	{int}	{int}	BitString	1025
1611	asn1	RightAlign	{}	{[]byte}	BitString	1025
1612	asn1	Equal	{asn1.ObjectIdentifier}	{bool}	ObjectIdentifier	1026
1613	asn1	String	{}	{string}	ObjectIdentifier	1026
1614	base32	WithPadding	{rune}	{*base32.Encoding}	Encoding	1031
1615	base32	Encode	{[]byte,[]byte}	{}	*Encoding	1031
1616	base32	EncodeToString	{[]byte}	{string}	*Encoding	1031
1617	base32	EncodedLen	{int}	{int}	*Encoding	1031
1618	base32	Decode	{[]byte,[]byte}	{int,error}	*Encoding	1031
1619	base32	DecodeString	{string}	{[]byte,error}	*Encoding	1031
1620	base32	DecodedLen	{int}	{int}	*Encoding	1031
1621	base32	Error	{}	{string}	CorruptInputError	1032
1622	base64	WithPadding	{rune}	{*base64.Encoding}	Encoding	1033
1623	base64	Strict	{}	{*base64.Encoding}	Encoding	1033
1624	base64	Encode	{[]byte,[]byte}	{}	*Encoding	1033
1625	base64	EncodeToString	{[]byte}	{string}	*Encoding	1033
1626	base64	EncodedLen	{int}	{int}	*Encoding	1033
1627	base64	DecodeString	{string}	{[]byte,error}	*Encoding	1033
1628	base64	Decode	{[]byte,[]byte}	{int,error}	*Encoding	1033
1629	base64	DecodedLen	{int}	{int}	*Encoding	1033
1630	base64	Error	{}	{string}	CorruptInputError	1034
1631	csv	Error	{}	{string}	*ParseError	1036
1632	csv	Read	{}	{[]string,error}	*Reader	1037
1633	csv	ReadAll	{}	{[][]string,error}	*Reader	1037
1634	csv	Write	{[]string}	{error}	*Writer	1038
1635	csv	Flush	{}	{}	*Writer	1038
1636	csv	Error	{}	{error}	*Writer	1038
1637	csv	WriteAll	{[][]string}	{error}	*Writer	1038
1638	gob	Decode	{"interface{}"}	{error}	*Decoder	1044
1639	gob	DecodeValue	{reflect.Value}	{error}	*Decoder	1044
1640	gob	Encode	{"interface{}"}	{error}	*Encoder	1046
1641	gob	EncodeValue	{reflect.Value}	{error}	*Encoder	1046
1642	hex	Error	{}	{string}	InvalidByteError	1050
1643	json	Error	{}	{string}	*UnmarshalTypeError	1052
1644	json	Error	{}	{string}	*UnmarshalFieldError	1053
1645	json	Error	{}	{string}	*InvalidUnmarshalError	1054
1646	json	String	{}	{string}	Number	1055
1647	json	Float64	{}	{float64,error}	Number	1055
1648	json	Int64	{}	{int64,error}	Number	1055
1649	json	Error	{}	{string}	*UnsupportedTypeError	1057
1650	json	Error	{}	{string}	*UnsupportedValueError	1058
1651	json	Error	{}	{string}	*InvalidUTF8Error	1059
1652	json	Error	{}	{string}	*MarshalerError	1060
1653	json	Error	{}	{string}	*SyntaxError	1061
1654	json	UseNumber	{}	{}	*Decoder	1062
1655	json	DisallowUnknownFields	{}	{}	*Decoder	1062
1656	json	Decode	{"interface{}"}	{error}	*Decoder	1062
1657	json	Buffered	{}	{io.Reader}	*Decoder	1062
1658	json	Token	{}	{json.Token,error}	*Decoder	1062
1659	json	More	{}	{bool}	*Decoder	1062
1660	json	Encode	{"interface{}"}	{error}	*Encoder	1063
1661	json	SetIndent	{string,string}	{}	*Encoder	1063
1662	json	SetEscapeHTML	{bool}	{}	*Encoder	1063
1663	json	MarshalJSON	{}	{[]byte,error}	RawMessage	1064
1664	json	UnmarshalJSON	{[]byte}	{error}	*RawMessage	1064
1665	json	String	{}	{string}	Delim	1066
1666	xml	Indent	{string,string}	{}	*Encoder	1070
1667	xml	Encode	{"interface{}"}	{error}	*Encoder	1070
1668	xml	EncodeElement	{"interface{}",xml.StartElement}	{error}	*Encoder	1070
1669	xml	EncodeToken	{xml.Token}	{error}	*Encoder	1070
1670	xml	Flush	{}	{error}	*Encoder	1070
1671	xml	Error	{}	{string}	*UnsupportedTypeError	1071
1672	xml	Error	{}	{string}	UnmarshalError	1072
1673	xml	Error	{}	{string}	*TagPathError	1075
1674	xml	Error	{}	{string}	*SyntaxError	1076
1675	xml	Copy	{}	{xml.StartElement}	StartElement	1080
1676	xml	End	{}	{xml.EndElement}	StartElement	1080
1677	xml	Copy	{}	{xml.CharData}	CharData	1082
1678	xml	Copy	{}	{xml.Comment}	Comment	1083
1679	xml	Copy	{}	{xml.ProcInst}	ProcInst	1084
1680	xml	Copy	{}	{xml.Directive}	Directive	1085
1681	xml	Decode	{"interface{}"}	{error}	*Decoder	1087
1682	xml	DecodeElement	{"interface{}",*xml.StartElement}	{error}	*Decoder	1087
1683	xml	Skip	{}	{error}	*Decoder	1087
1684	xml	Token	{}	{xml.Token,error}	*Decoder	1087
1685	xml	RawToken	{}	{xml.Token,error}	*Decoder	1087
1686	xml	InputOffset	{}	{int64}	*Decoder	1087
1687	expvar	Value	{}	{int64}	*Int	1089
1688	expvar	String	{}	{string}	*Int	1089
1689	expvar	Add	{int64}	{}	*Int	1089
1690	expvar	Set	{int64}	{}	*Int	1089
1691	expvar	Value	{}	{float64}	*Float	1090
1692	expvar	String	{}	{string}	*Float	1090
1693	expvar	Add	{float64}	{}	*Float	1090
1694	expvar	Set	{float64}	{}	*Float	1090
1695	expvar	String	{}	{string}	*Map	1091
1696	expvar	Init	{}	{*expvar.Map}	*Map	1091
1697	expvar	Get	{string}	{expvar.Var}	*Map	1091
1698	expvar	Set	{string,expvar.Var}	{}	*Map	1091
1699	expvar	Add	{string,int64}	{}	*Map	1091
1700	expvar	AddFloat	{string,float64}	{}	*Map	1091
1701	expvar	Do	{func(expvar.KeyValue)}	{}	*Map	1091
1702	expvar	Value	{}	{string}	*String	1093
1703	expvar	String	{}	{string}	*String	1093
1704	expvar	Set	{string}	{}	*String	1093
1705	expvar	Value	{}	{"interface{}"}	Func	1094
1706	expvar	String	{}	{string}	Func	1094
1707	flag	Output	{}	{io.Writer}	*FlagSet	1098
1708	flag	Name	{}	{string}	*FlagSet	1098
1709	flag	ErrorHandling	{}	{flag.ErrorHandling}	*FlagSet	1098
1710	flag	SetOutput	{io.Writer}	{}	*FlagSet	1098
1711	flag	VisitAll	{func(*flag.Flag)}	{}	*FlagSet	1098
1712	flag	Visit	{func(*flag.Flag)}	{}	*FlagSet	1098
1713	flag	Lookup	{string}	{*flag.Flag}	*FlagSet	1098
1714	flag	Set	{string,string}	{error}	*FlagSet	1098
1715	flag	PrintDefaults	{}	{}	*FlagSet	1098
1716	flag	NFlag	{}	{int}	*FlagSet	1098
1717	flag	Arg	{int}	{string}	*FlagSet	1098
1718	flag	NArg	{}	{int}	*FlagSet	1098
1719	flag	Args	{}	{[]string}	*FlagSet	1098
1720	flag	BoolVar	{*bool,string,bool,string}	{}	*FlagSet	1098
1721	flag	Bool	{string,bool,string}	{*bool}	*FlagSet	1098
1722	flag	IntVar	{*int,string,int,string}	{}	*FlagSet	1098
1723	flag	Int	{string,int,string}	{*int}	*FlagSet	1098
1724	flag	Int64Var	{*int64,string,int64,string}	{}	*FlagSet	1098
1725	flag	Int64	{string,int64,string}	{*int64}	*FlagSet	1098
1726	flag	UintVar	{*uint,string,uint,string}	{}	*FlagSet	1098
1727	flag	Uint	{string,uint,string}	{*uint}	*FlagSet	1098
1728	flag	Uint64Var	{*uint64,string,uint64,string}	{}	*FlagSet	1098
1729	flag	Uint64	{string,uint64,string}	{*uint64}	*FlagSet	1098
1730	flag	StringVar	{*string,string,string,string}	{}	*FlagSet	1098
1731	flag	String	{string,string,string}	{*string}	*FlagSet	1098
1732	flag	Float64Var	{*float64,string,float64,string}	{}	*FlagSet	1098
1733	flag	Float64	{string,float64,string}	{*float64}	*FlagSet	1098
1734	flag	DurationVar	{*time.Duration,string,time.Duration,string}	{}	*FlagSet	1098
1735	flag	Duration	{string,time.Duration,string}	{*time.Duration}	*FlagSet	1098
1736	flag	Var	{flag.Value,string,string}	{}	*FlagSet	1098
1737	flag	Parse	{[]string}	{error}	*FlagSet	1098
1738	flag	Parsed	{}	{bool}	*FlagSet	1098
1739	flag	Init	{string,flag.ErrorHandling}	{}	*FlagSet	1098
1740	ast	Pos	{}	{token.Pos}	*Comment	1110
1741	ast	End	{}	{token.Pos}	*Comment	1110
1742	ast	Pos	{}	{token.Pos}	*CommentGroup	1111
1743	ast	End	{}	{token.Pos}	*CommentGroup	1111
1744	ast	Text	{}	{string}	*CommentGroup	1111
1745	ast	Pos	{}	{token.Pos}	*Field	1112
1746	ast	End	{}	{token.Pos}	*Field	1112
1747	ast	Pos	{}	{token.Pos}	*FieldList	1113
1748	ast	End	{}	{token.Pos}	*FieldList	1113
1749	ast	NumFields	{}	{int}	*FieldList	1113
1750	ast	Pos	{}	{token.Pos}	*BadExpr	1114
1751	ast	End	{}	{token.Pos}	*BadExpr	1114
1752	ast	Pos	{}	{token.Pos}	*Ident	1115
1753	ast	End	{}	{token.Pos}	*Ident	1115
1754	ast	IsExported	{}	{bool}	*Ident	1115
1755	ast	String	{}	{string}	*Ident	1115
1756	ast	Pos	{}	{token.Pos}	*Ellipsis	1116
1757	ast	End	{}	{token.Pos}	*Ellipsis	1116
1758	ast	Pos	{}	{token.Pos}	*BasicLit	1117
1759	ast	End	{}	{token.Pos}	*BasicLit	1117
1760	ast	Pos	{}	{token.Pos}	*FuncLit	1118
1761	ast	End	{}	{token.Pos}	*FuncLit	1118
1762	ast	Pos	{}	{token.Pos}	*CompositeLit	1119
1763	ast	End	{}	{token.Pos}	*CompositeLit	1119
1764	ast	Pos	{}	{token.Pos}	*ParenExpr	1120
1765	ast	End	{}	{token.Pos}	*ParenExpr	1120
1766	ast	Pos	{}	{token.Pos}	*SelectorExpr	1121
1767	ast	End	{}	{token.Pos}	*SelectorExpr	1121
1768	ast	Pos	{}	{token.Pos}	*IndexExpr	1122
1769	ast	End	{}	{token.Pos}	*IndexExpr	1122
1770	ast	Pos	{}	{token.Pos}	*SliceExpr	1123
1771	ast	End	{}	{token.Pos}	*SliceExpr	1123
1772	ast	Pos	{}	{token.Pos}	*TypeAssertExpr	1124
1773	ast	End	{}	{token.Pos}	*TypeAssertExpr	1124
1774	ast	Pos	{}	{token.Pos}	*CallExpr	1125
1775	ast	End	{}	{token.Pos}	*CallExpr	1125
1776	ast	Pos	{}	{token.Pos}	*StarExpr	1126
1777	ast	End	{}	{token.Pos}	*StarExpr	1126
1778	ast	Pos	{}	{token.Pos}	*UnaryExpr	1127
1779	ast	End	{}	{token.Pos}	*UnaryExpr	1127
1780	ast	Pos	{}	{token.Pos}	*BinaryExpr	1128
1781	ast	End	{}	{token.Pos}	*BinaryExpr	1128
1782	ast	Pos	{}	{token.Pos}	*KeyValueExpr	1129
1783	ast	End	{}	{token.Pos}	*KeyValueExpr	1129
1784	ast	Pos	{}	{token.Pos}	*ArrayType	1131
1785	ast	End	{}	{token.Pos}	*ArrayType	1131
1786	ast	Pos	{}	{token.Pos}	*StructType	1132
1787	ast	End	{}	{token.Pos}	*StructType	1132
1788	ast	Pos	{}	{token.Pos}	*FuncType	1133
1789	ast	End	{}	{token.Pos}	*FuncType	1133
1790	ast	Pos	{}	{token.Pos}	*InterfaceType	1134
1791	ast	End	{}	{token.Pos}	*InterfaceType	1134
1792	ast	Pos	{}	{token.Pos}	*MapType	1135
1793	ast	End	{}	{token.Pos}	*MapType	1135
1794	ast	Pos	{}	{token.Pos}	*ChanType	1136
1795	ast	End	{}	{token.Pos}	*ChanType	1136
1796	ast	Pos	{}	{token.Pos}	*BadStmt	1137
1797	ast	End	{}	{token.Pos}	*BadStmt	1137
1798	ast	Pos	{}	{token.Pos}	*DeclStmt	1138
1799	ast	End	{}	{token.Pos}	*DeclStmt	1138
1800	ast	Pos	{}	{token.Pos}	*EmptyStmt	1139
1801	ast	End	{}	{token.Pos}	*EmptyStmt	1139
1802	ast	Pos	{}	{token.Pos}	*LabeledStmt	1140
1803	ast	End	{}	{token.Pos}	*LabeledStmt	1140
1804	ast	Pos	{}	{token.Pos}	*ExprStmt	1141
1805	ast	End	{}	{token.Pos}	*ExprStmt	1141
1806	ast	Pos	{}	{token.Pos}	*SendStmt	1142
1807	ast	End	{}	{token.Pos}	*SendStmt	1142
1808	ast	Pos	{}	{token.Pos}	*IncDecStmt	1143
1809	ast	End	{}	{token.Pos}	*IncDecStmt	1143
1810	ast	Pos	{}	{token.Pos}	*AssignStmt	1144
1811	ast	End	{}	{token.Pos}	*AssignStmt	1144
1812	ast	Pos	{}	{token.Pos}	*GoStmt	1145
1813	ast	End	{}	{token.Pos}	*GoStmt	1145
1814	ast	Pos	{}	{token.Pos}	*DeferStmt	1146
1815	ast	End	{}	{token.Pos}	*DeferStmt	1146
1816	ast	Pos	{}	{token.Pos}	*ReturnStmt	1147
1817	ast	End	{}	{token.Pos}	*ReturnStmt	1147
1818	ast	Pos	{}	{token.Pos}	*BranchStmt	1148
1819	ast	End	{}	{token.Pos}	*BranchStmt	1148
1820	ast	Pos	{}	{token.Pos}	*BlockStmt	1149
1821	ast	End	{}	{token.Pos}	*BlockStmt	1149
1822	ast	Pos	{}	{token.Pos}	*IfStmt	1150
1823	ast	End	{}	{token.Pos}	*IfStmt	1150
1824	ast	Pos	{}	{token.Pos}	*CaseClause	1151
1825	ast	End	{}	{token.Pos}	*CaseClause	1151
1826	ast	Pos	{}	{token.Pos}	*SwitchStmt	1152
1827	ast	End	{}	{token.Pos}	*SwitchStmt	1152
1828	ast	Pos	{}	{token.Pos}	*TypeSwitchStmt	1153
1829	ast	End	{}	{token.Pos}	*TypeSwitchStmt	1153
1830	ast	Pos	{}	{token.Pos}	*CommClause	1154
1831	ast	End	{}	{token.Pos}	*CommClause	1154
1832	ast	Pos	{}	{token.Pos}	*SelectStmt	1155
1833	ast	End	{}	{token.Pos}	*SelectStmt	1155
1834	ast	Pos	{}	{token.Pos}	*ForStmt	1156
1835	ast	End	{}	{token.Pos}	*ForStmt	1156
1836	ast	Pos	{}	{token.Pos}	*RangeStmt	1157
1837	ast	End	{}	{token.Pos}	*RangeStmt	1157
1838	ast	Pos	{}	{token.Pos}	*ImportSpec	1159
1839	ast	End	{}	{token.Pos}	*ImportSpec	1159
1840	ast	Pos	{}	{token.Pos}	*ValueSpec	1160
1841	ast	End	{}	{token.Pos}	*ValueSpec	1160
1842	ast	Pos	{}	{token.Pos}	*TypeSpec	1161
1843	ast	End	{}	{token.Pos}	*TypeSpec	1161
1844	ast	Pos	{}	{token.Pos}	*BadDecl	1162
1845	ast	End	{}	{token.Pos}	*BadDecl	1162
1846	ast	Pos	{}	{token.Pos}	*GenDecl	1163
1847	ast	End	{}	{token.Pos}	*GenDecl	1163
1848	ast	Pos	{}	{token.Pos}	*FuncDecl	1164
1849	ast	End	{}	{token.Pos}	*FuncDecl	1164
1850	ast	Pos	{}	{token.Pos}	*File	1165
1852	ast	Pos	{}	{token.Pos}	*Package	1166
1853	ast	End	{}	{token.Pos}	*Package	1166
1854	ast	Update	{ast.Node,ast.Node}	{ast.Node}	CommentMap	1167
1855	ast	Filter	{ast.Node}	{ast.CommentMap}	CommentMap	1167
1856	ast	Comments	{}	{[]*ast.CommentGroup}	CommentMap	1167
1857	ast	String	{}	{string}	CommentMap	1167
1858	ast	Lookup	{string}	{*ast.Object}	*Scope	1172
1859	ast	Insert	{*ast.Object}	{*ast.Object}	*Scope	1172
1860	ast	String	{}	{string}	*Scope	1172
1861	ast	Pos	{}	{token.Pos}	*Object	1173
1862	ast	String	{}	{string}	ObjKind	1174
1863	build	SrcDirs	{}	{[]string}	*Context	1176
1864	build	ImportDir	{string,build.ImportMode}	{*build.Package,error}	*Context	1176
1865	build	Import	{string,string,build.ImportMode}	{*build.Package,error}	*Context	1176
1866	build	MatchFile	{string,string}	{bool,error}	*Context	1176
1867	build	IsCommand	{}	{bool}	*Package	1178
1868	build	Error	{}	{string}	*NoGoError	1179
1869	build	Error	{}	{string}	*MultiplePackageError	1180
1870	doc	Filter	{doc.Filter}	{}	*Package	1183
1871	b	M	{}	{}	*T	1191
1872	testing	StartTimer	{}	{}	*B	1193
1873	testing	StopTimer	{}	{}	*B	1193
1874	testing	ResetTimer	{}	{}	*B	1193
1875	testing	SetBytes	{int64}	{}	*B	1193
1876	testing	StartTimer	{}	{}	*B	1193
1877	testing	StopTimer	{}	{}	*B	1193
1878	testing	ResetTimer	{}	{}	*B	1193
1879	testing	SetBytes	{int64}	{}	*B	1193
1880	testing	ReportAllocs	{}	{}	*B	1193
1881	testing	Run	{string,func(*testing.B)}	{bool}	*B	1193
1882	testing	RunParallel	{func(*testing.PB)}	{}	*B	1193
1883	testing	SetParallelism	{int}	{}	*B	1193
1884	testing	NsPerOp	{}	{int64}	BenchmarkResult	1194
1885	testing	String	{}	{string}	BenchmarkResult	1194
1886	testing	NsPerOp	{}	{int64}	BenchmarkResult	1194
1887	testing	AllocsPerOp	{}	{int64}	BenchmarkResult	1194
1888	testing	AllocedBytesPerOp	{}	{int64}	BenchmarkResult	1194
1889	testing	String	{}	{string}	BenchmarkResult	1194
1890	testing	MemString	{}	{string}	BenchmarkResult	1194
1891	c	M	{}	{}	*T1	1205
1892	e	M	{}	{}	T2	1214
1893	e	M	{}	{}	T3	1215
1894	e	M	{}	{}	*T4	1216
1895	e	M	{}	{}	*U1	1219
1896	e	M	{}	{}	*U2	1220
1897	e	N	{}	{}	*U3	1221
1898	e	M	{}	{}	*U4	1222
1899	e	M	{}	{}	*V4	1226
1900	e	M	{}	{}	*V6	1228
1901	testing	Parallel	{}	{}	*T	1237
1902	testing	Parallel	{}	{}	*T	1237
1903	testing	Run	{string,func(*testing.T)}	{bool}	*T	1237
1904	gccgoimporter	InitFromDriver	{string}	{error}	*GccgoInstallation	1240
1905	gccgoimporter	SearchPaths	{}	{[]string}	*GccgoInstallation	1240
1906	gccgoimporter	GetImporter	{[]string,map[*types.Package]gccgoimporter.InitData}	{gccgoimporter.Importer}	*GccgoInstallation	1240
1907	escapeinfo	Read	{[]byte}	{}	*T	1245
1908	exports	M1	{}	{}	*T1	1249
1909	srcimporter	Import	{string}	{*types.Package,error}	*Importer	1281
1910	srcimporter	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}	*Importer	1281
1911	printer	Fprint	{io.Writer,*token.FileSet,"interface{}"}	{error}	*Config	1284
1912	scanner	Error	{}	{string}	Error	1286
1913	scanner	Add	{token.Position,string}	{}	*ErrorList	1287
1914	scanner	Reset	{}	{}	*ErrorList	1287
1915	scanner	Len	{}	{int}	ErrorList	1287
1916	scanner	Swap	{int,int}	{}	ErrorList	1287
1917	scanner	Less	{int,int}	{bool}	ErrorList	1287
1918	scanner	Sort	{}	{}	ErrorList	1287
1919	scanner	RemoveMultiples	{}	{}	*ErrorList	1287
1920	scanner	Error	{}	{string}	ErrorList	1287
1921	scanner	Err	{}	{error}	ErrorList	1287
1922	scanner	Init	{*token.File,[]byte,scanner.ErrorHandler,scanner.Mode}	{}	*Scanner	1289
1923	scanner	Scan	{}	{token.Pos,token.Token,string}	*Scanner	1289
1924	scanner	Init	{io.Reader}	{*scanner.Scanner}	*Scanner	1289
1925	scanner	Next	{}	{rune}	*Scanner	1289
1926	scanner	Peek	{}	{rune}	*Scanner	1289
1927	scanner	Scan	{}	{rune}	*Scanner	1289
1928	scanner	Pos	{}	{scanner.Position}	*Scanner	1289
1929	scanner	TokenText	{}	{string}	*Scanner	1289
1930	token	IsValid	{}	{bool}	*Position	1291
1931	token	String	{}	{string}	Position	1291
1932	token	IsValid	{}	{bool}	Pos	1292
1933	token	Name	{}	{string}	*File	1293
1934	token	Base	{}	{int}	*File	1293
1935	token	Size	{}	{int}	*File	1293
1936	token	LineCount	{}	{int}	*File	1293
1937	token	AddLine	{int}	{}	*File	1293
1938	token	MergeLine	{int}	{}	*File	1293
1939	token	SetLines	{[]int}	{bool}	*File	1293
1940	token	SetLinesForContent	{[]byte}	{}	*File	1293
1941	token	AddLineInfo	{int,string,int}	{}	*File	1293
1942	token	Pos	{int}	{token.Pos}	*File	1293
1943	token	Offset	{token.Pos}	{int}	*File	1293
1944	token	Line	{token.Pos}	{int}	*File	1293
1945	token	PositionFor	{token.Pos,bool}	{token.Position}	*File	1293
1946	token	Position	{token.Pos}	{token.Position}	*File	1293
1947	token	Base	{}	{int}	*FileSet	1294
1948	token	AddFile	{string,int,int}	{*token.File}	*FileSet	1294
1949	token	Iterate	{"func(*token.File) bool"}	{}	*FileSet	1294
1950	token	File	{token.Pos}	{*token.File}	*FileSet	1294
1951	token	PositionFor	{token.Pos,bool}	{token.Position}	*FileSet	1294
1952	token	Position	{token.Pos}	{token.Position}	*FileSet	1294
1953	token	Read	{"func(interface{}) error"}	{error}	*FileSet	1294
1954	token	Write	{"func(interface{}) error"}	{error}	*FileSet	1294
1955	token	String	{}	{string}	Token	1295
1956	token	Precedence	{}	{int}	Token	1295
1957	token	IsLiteral	{}	{bool}	Token	1295
1958	token	IsOperator	{}	{bool}	Token	1295
1959	token	IsKeyword	{}	{bool}	Token	1295
1960	types	Error	{}	{string}	Error	1296
1961	types	Check	{string,*token.FileSet,[]*ast.File,*types.Info}	{*types.Package,error}	*Config	1300
1962	types	TypeOf	{ast.Expr}	{types.Type}	*Info	1301
1963	types	ObjectOf	{*ast.Ident}	{types.Object}	*Info	1301
1964	types	IsVoid	{}	{bool}	TypeAndValue	1302
1965	types	IsType	{}	{bool}	TypeAndValue	1302
1966	types	IsBuiltin	{}	{bool}	TypeAndValue	1302
1967	types	IsValue	{}	{bool}	TypeAndValue	1302
1968	types	IsNil	{}	{bool}	TypeAndValue	1302
1969	types	Addressable	{}	{bool}	TypeAndValue	1302
1970	types	Assignable	{}	{bool}	TypeAndValue	1302
1971	types	HasOk	{}	{bool}	TypeAndValue	1302
1972	types	String	{}	{string}	*Initializer	1303
1973	types	Files	{[]*ast.File}	{error}	*Checker	1304
1974	types	String	{}	{string}	*MethodSet	1305
1975	types	Len	{}	{int}	*MethodSet	1305
1976	types	At	{int}	{*types.Selection}	*MethodSet	1305
1977	types	Lookup	{*types.Package,string}	{*types.Selection}	*MethodSet	1305
1978	types	Imported	{}	{*types.Package}	*PkgName	1307
1979	types	String	{}	{string}	*PkgName	1307
1980	types	Val	{}	{constant.Value}	*Const	1308
1981	types	String	{}	{string}	*Const	1308
1982	types	IsAlias	{}	{bool}	*TypeName	1309
1983	types	String	{}	{string}	*TypeName	1309
1984	types	Anonymous	{}	{bool}	*Var	1310
1985	types	IsField	{}	{bool}	*Var	1310
1986	types	String	{}	{string}	*Var	1310
1987	types	String	{}	{string}	*Label	1312
1988	types	String	{}	{string}	*Builtin	1313
1989	types	String	{}	{string}	*Nil	1314
1990	types	Path	{}	{string}	*Package	1315
1991	types	Name	{}	{string}	*Package	1315
1992	types	SetName	{string}	{}	*Package	1315
1993	types	Scope	{}	{*types.Scope}	*Package	1315
1994	types	Complete	{}	{bool}	*Package	1315
1995	types	MarkComplete	{}	{}	*Package	1315
1996	types	Imports	{}	{[]*types.Package}	*Package	1315
1997	types	SetImports	{[]*types.Package}	{}	*Package	1315
1998	types	String	{}	{string}	*Package	1315
1999	types	Parent	{}	{*types.Scope}	*Scope	1316
2000	types	Len	{}	{int}	*Scope	1316
2001	types	Names	{}	{[]string}	*Scope	1316
2002	types	NumChildren	{}	{int}	*Scope	1316
2003	types	Child	{int}	{*types.Scope}	*Scope	1316
2004	types	Lookup	{string}	{types.Object}	*Scope	1316
2005	types	LookupParent	{string,token.Pos}	{*types.Scope,types.Object}	*Scope	1316
2006	types	Insert	{types.Object}	{types.Object}	*Scope	1316
2007	types	Pos	{}	{token.Pos}	*Scope	1316
2008	types	End	{}	{token.Pos}	*Scope	1316
2009	types	Contains	{token.Pos}	{bool}	*Scope	1316
2010	types	Innermost	{token.Pos}	{*types.Scope}	*Scope	1316
2011	types	WriteTo	{io.Writer,int,bool}	{}	*Scope	1316
2012	types	String	{}	{string}	*Scope	1316
2013	types	Kind	{}	{types.SelectionKind}	*Selection	1318
2014	types	Recv	{}	{types.Type}	*Selection	1318
2015	types	Obj	{}	{types.Object}	*Selection	1318
2016	types	Type	{}	{types.Type}	*Selection	1318
2017	types	Index	{}	{[]int}	*Selection	1318
2018	types	Indirect	{}	{bool}	*Selection	1318
2019	types	String	{}	{string}	*Selection	1318
2020	types	Alignof	{types.Type}	{int64}	*StdSizes	1320
2021	types	Offsetsof	{[]*types.Var}	{[]int64}	*StdSizes	1320
2022	types	Sizeof	{types.Type}	{int64}	*StdSizes	1320
2023	types	Kind	{}	{types.BasicKind}	*Basic	1324
2024	types	Info	{}	{types.BasicInfo}	*Basic	1324
2025	types	Name	{}	{string}	*Basic	1324
2026	types	Underlying	{}	{types.Type}	*Basic	1324
2027	types	String	{}	{string}	*Basic	1324
2028	types	Elem	{}	{types.Type}	*Pointer	1328
2029	types	Underlying	{}	{types.Type}	*Pointer	1328
2030	types	String	{}	{string}	*Pointer	1328
2031	types	Recv	{}	{*types.Var}	*Signature	1330
2032	types	Params	{}	{*types.Tuple}	*Signature	1330
2033	types	Results	{}	{*types.Tuple}	*Signature	1330
2034	types	Variadic	{}	{bool}	*Signature	1330
2035	types	Underlying	{}	{types.Type}	*Signature	1330
2036	types	String	{}	{string}	*Signature	1330
2037	types	Obj	{}	{*types.TypeName}	*Named	1335
2038	types	NumMethods	{}	{int}	*Named	1335
2039	types	Method	{int}	{*types.Func}	*Named	1335
2040	types	SetUnderlying	{types.Type}	{}	*Named	1335
2041	types	AddMethod	{*types.Func}	{}	*Named	1335
2042	types	Underlying	{}	{types.Type}	*Named	1335
2043	types	String	{}	{string}	*Named	1335
2044	template	Error	{}	{string}	*Error	1349
2045	template	Templates	{}	{[]*template.Template}	*Template	1351
2046	template	Option	{...string}	{*template.Template}	*Template	1351
2047	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	1351
2048	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	1351
2049	template	DefinedTemplates	{}	{string}	*Template	1351
2050	template	Parse	{string}	{*template.Template,error}	*Template	1351
2051	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	1351
2052	template	Clone	{}	{*template.Template,error}	*Template	1351
2053	template	New	{string}	{*template.Template}	*Template	1351
2054	template	Name	{}	{string}	*Template	1351
2055	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	1351
2056	template	Delims	{string,string}	{*template.Template}	*Template	1351
2057	template	Lookup	{string}	{*template.Template}	*Template	1351
2058	template	ParseFiles	{...string}	{*template.Template,error}	*Template	1351
2059	template	ParseGlob	{string}	{*template.Template,error}	*Template	1351
2374	big	MinPrec	{}	{uint}	*Float	1469
2060	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	1351
2061	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	1351
2062	template	DefinedTemplates	{}	{string}	*Template	1351
2063	template	ParseFiles	{...string}	{*template.Template,error}	*Template	1351
2064	template	ParseGlob	{string}	{*template.Template,error}	*Template	1351
2065	template	Option	{...string}	{*template.Template}	*Template	1351
2066	template	Name	{}	{string}	*Template	1351
2067	template	New	{string}	{*template.Template}	*Template	1351
2068	template	Clone	{}	{*template.Template,error}	*Template	1351
2069	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	1351
2070	template	Templates	{}	{[]*template.Template}	*Template	1351
2071	template	Delims	{string,string}	{*template.Template}	*Template	1351
2072	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	1351
2073	template	Lookup	{string}	{*template.Template}	*Template	1351
2074	template	Parse	{string}	{*template.Template,error}	*Template	1351
2075	color	RGBA	{}	{uint32}	RGBA	1354
2076	color	RGBA	{}	{uint32}	RGBA64	1355
2077	color	RGBA	{}	{uint32}	NRGBA	1356
2078	color	RGBA	{}	{uint32}	NRGBA64	1357
2079	color	RGBA	{}	{uint32}	Alpha	1358
2080	color	RGBA	{}	{uint32}	Alpha16	1359
2081	color	RGBA	{}	{uint32}	Gray	1360
2082	color	RGBA	{}	{uint32}	Gray16	1361
2083	color	Convert	{color.Color}	{color.Color}	Palette	1363
2084	color	Index	{color.Color}	{int}	Palette	1363
2085	color	RGBA	{}	{uint32,uint32,uint32,uint32}	YCbCr	1364
2086	color	RGBA	{}	{uint32,uint32,uint32,uint32}	NYCbCrA	1365
2087	color	RGBA	{}	{uint32,uint32,uint32,uint32}	CMYK	1366
2088	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}	Op	1369
2089	image	String	{}	{string}	Point	1371
2090	image	Add	{image.Point}	{image.Point}	Point	1371
2091	image	Sub	{image.Point}	{image.Point}	Point	1371
2092	image	Mul	{int}	{image.Point}	Point	1371
2093	image	Div	{int}	{image.Point}	Point	1371
2094	image	In	{image.Rectangle}	{bool}	Point	1371
2095	image	Mod	{image.Rectangle}	{image.Point}	Point	1371
2096	image	Eq	{image.Point}	{bool}	Point	1371
2097	image	String	{}	{string}	Rectangle	1372
2098	image	Dx	{}	{int}	Rectangle	1372
2099	image	Dy	{}	{int}	Rectangle	1372
2100	image	Size	{}	{image.Point}	Rectangle	1372
2101	image	Add	{image.Point}	{image.Rectangle}	Rectangle	1372
2102	image	Sub	{image.Point}	{image.Rectangle}	Rectangle	1372
2103	image	Inset	{int}	{image.Rectangle}	Rectangle	1372
2104	image	Intersect	{image.Rectangle}	{image.Rectangle}	Rectangle	1372
2105	image	Union	{image.Rectangle}	{image.Rectangle}	Rectangle	1372
2106	image	Empty	{}	{bool}	Rectangle	1372
2107	image	Eq	{image.Rectangle}	{bool}	Rectangle	1372
2108	image	Overlaps	{image.Rectangle}	{bool}	Rectangle	1372
2109	image	In	{image.Rectangle}	{bool}	Rectangle	1372
2110	image	Canon	{}	{image.Rectangle}	Rectangle	1372
2111	image	At	{int,int}	{color.Color}	Rectangle	1372
2112	image	Bounds	{}	{image.Rectangle}	Rectangle	1372
2113	image	ColorModel	{}	{color.Model}	Rectangle	1372
2114	image	ColorModel	{}	{color.Model}	*RGBA	1378
2115	image	Bounds	{}	{image.Rectangle}	*RGBA	1378
2116	image	At	{int,int}	{color.Color}	*RGBA	1378
2117	image	RGBAAt	{int,int}	{color.RGBA}	*RGBA	1378
2118	image	PixOffset	{int,int}	{int}	*RGBA	1378
2119	image	Set	{int,int,color.Color}	{}	*RGBA	1378
2120	image	SetRGBA	{int,int,color.RGBA}	{}	*RGBA	1378
2121	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA	1378
2122	image	Opaque	{}	{bool}	*RGBA	1378
2123	image	ColorModel	{}	{color.Model}	*RGBA64	1379
2124	image	Bounds	{}	{image.Rectangle}	*RGBA64	1379
2125	image	At	{int,int}	{color.Color}	*RGBA64	1379
2126	image	RGBA64At	{int,int}	{color.RGBA64}	*RGBA64	1379
2127	image	PixOffset	{int,int}	{int}	*RGBA64	1379
2128	image	Set	{int,int,color.Color}	{}	*RGBA64	1379
2129	image	SetRGBA64	{int,int,color.RGBA64}	{}	*RGBA64	1379
2130	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA64	1379
2131	image	Opaque	{}	{bool}	*RGBA64	1379
2132	image	ColorModel	{}	{color.Model}	*NRGBA	1380
2133	image	Bounds	{}	{image.Rectangle}	*NRGBA	1380
2134	image	At	{int,int}	{color.Color}	*NRGBA	1380
2135	image	NRGBAAt	{int,int}	{color.NRGBA}	*NRGBA	1380
2136	image	PixOffset	{int,int}	{int}	*NRGBA	1380
2137	image	Set	{int,int,color.Color}	{}	*NRGBA	1380
2138	image	SetNRGBA	{int,int,color.NRGBA}	{}	*NRGBA	1380
2139	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA	1380
2140	image	Opaque	{}	{bool}	*NRGBA	1380
2141	image	ColorModel	{}	{color.Model}	*NRGBA64	1381
2142	image	Bounds	{}	{image.Rectangle}	*NRGBA64	1381
2143	image	At	{int,int}	{color.Color}	*NRGBA64	1381
2144	image	NRGBA64At	{int,int}	{color.NRGBA64}	*NRGBA64	1381
2145	image	PixOffset	{int,int}	{int}	*NRGBA64	1381
2146	image	Set	{int,int,color.Color}	{}	*NRGBA64	1381
2147	image	SetNRGBA64	{int,int,color.NRGBA64}	{}	*NRGBA64	1381
2148	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA64	1381
2149	image	Opaque	{}	{bool}	*NRGBA64	1381
2150	image	ColorModel	{}	{color.Model}	*Alpha	1382
2151	image	Bounds	{}	{image.Rectangle}	*Alpha	1382
2152	image	At	{int,int}	{color.Color}	*Alpha	1382
2153	image	AlphaAt	{int,int}	{color.Alpha}	*Alpha	1382
2154	image	PixOffset	{int,int}	{int}	*Alpha	1382
2155	image	Set	{int,int,color.Color}	{}	*Alpha	1382
2156	image	SetAlpha	{int,int,color.Alpha}	{}	*Alpha	1382
2157	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha	1382
2158	image	Opaque	{}	{bool}	*Alpha	1382
2159	image	ColorModel	{}	{color.Model}	*Alpha16	1383
2160	image	Bounds	{}	{image.Rectangle}	*Alpha16	1383
2161	image	At	{int,int}	{color.Color}	*Alpha16	1383
2162	image	Alpha16At	{int,int}	{color.Alpha16}	*Alpha16	1383
2163	image	PixOffset	{int,int}	{int}	*Alpha16	1383
2164	image	Set	{int,int,color.Color}	{}	*Alpha16	1383
2165	image	SetAlpha16	{int,int,color.Alpha16}	{}	*Alpha16	1383
2166	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha16	1383
2167	image	Opaque	{}	{bool}	*Alpha16	1383
2168	image	ColorModel	{}	{color.Model}	*Gray	1384
2169	image	Bounds	{}	{image.Rectangle}	*Gray	1384
2170	image	At	{int,int}	{color.Color}	*Gray	1384
2171	image	GrayAt	{int,int}	{color.Gray}	*Gray	1384
2172	image	PixOffset	{int,int}	{int}	*Gray	1384
2173	image	Set	{int,int,color.Color}	{}	*Gray	1384
2174	image	SetGray	{int,int,color.Gray}	{}	*Gray	1384
2175	image	SubImage	{image.Rectangle}	{image.Image}	*Gray	1384
2176	image	Opaque	{}	{bool}	*Gray	1384
2177	image	ColorModel	{}	{color.Model}	*Gray16	1385
2178	image	Bounds	{}	{image.Rectangle}	*Gray16	1385
2179	image	At	{int,int}	{color.Color}	*Gray16	1385
2180	image	Gray16At	{int,int}	{color.Gray16}	*Gray16	1385
2181	image	PixOffset	{int,int}	{int}	*Gray16	1385
2182	image	Set	{int,int,color.Color}	{}	*Gray16	1385
2183	image	SetGray16	{int,int,color.Gray16}	{}	*Gray16	1385
2184	image	SubImage	{image.Rectangle}	{image.Image}	*Gray16	1385
2185	image	Opaque	{}	{bool}	*Gray16	1385
2186	image	ColorModel	{}	{color.Model}	*CMYK	1386
2187	image	Bounds	{}	{image.Rectangle}	*CMYK	1386
2188	image	At	{int,int}	{color.Color}	*CMYK	1386
2189	image	CMYKAt	{int,int}	{color.CMYK}	*CMYK	1386
2190	image	PixOffset	{int,int}	{int}	*CMYK	1386
2191	image	Set	{int,int,color.Color}	{}	*CMYK	1386
2192	image	SetCMYK	{int,int,color.CMYK}	{}	*CMYK	1386
2193	image	SubImage	{image.Rectangle}	{image.Image}	*CMYK	1386
2194	image	Opaque	{}	{bool}	*CMYK	1386
2195	image	ColorModel	{}	{color.Model}	*Paletted	1387
2196	image	Bounds	{}	{image.Rectangle}	*Paletted	1387
2197	image	At	{int,int}	{color.Color}	*Paletted	1387
2198	image	PixOffset	{int,int}	{int}	*Paletted	1387
2199	image	Set	{int,int,color.Color}	{}	*Paletted	1387
2200	image	ColorIndexAt	{int,int}	{uint8}	*Paletted	1387
2201	image	SetColorIndex	{int,int,uint8}	{}	*Paletted	1387
2202	image	SubImage	{image.Rectangle}	{image.Image}	*Paletted	1387
2203	image	Opaque	{}	{bool}	*Paletted	1387
2204	jpeg	Error	{}	{string}	FormatError	1388
2205	jpeg	Error	{}	{string}	UnsupportedError	1389
2206	image	RGBA	{}	{uint32}	*Uniform	1392
2207	image	ColorModel	{}	{color.Model}	*Uniform	1392
2208	image	Convert	{color.Color}	{color.Color}	*Uniform	1392
2209	image	Bounds	{}	{image.Rectangle}	*Uniform	1392
2210	image	At	{int,int}	{color.Color}	*Uniform	1392
2211	image	Opaque	{}	{bool}	*Uniform	1392
2212	png	Error	{}	{string}	FormatError	1393
2213	png	Error	{}	{string}	UnsupportedError	1394
2214	png	Encode	{io.Writer,image.Image}	{error}	*Encoder	1395
2215	image	String	{}	{string}	YCbCrSubsampleRatio	1399
2216	image	ColorModel	{}	{color.Model}	*YCbCr	1400
2217	image	Bounds	{}	{image.Rectangle}	*YCbCr	1400
2218	image	At	{int,int}	{color.Color}	*YCbCr	1400
2219	image	YCbCrAt	{int,int}	{color.YCbCr}	*YCbCr	1400
2220	image	YOffset	{int,int}	{int}	*YCbCr	1400
2221	image	COffset	{int,int}	{int}	*YCbCr	1400
2222	image	SubImage	{image.Rectangle}	{image.Image}	*YCbCr	1400
2223	image	Opaque	{}	{bool}	*YCbCr	1400
2224	image	ColorModel	{}	{color.Model}	*NYCbCrA	1401
2225	image	At	{int,int}	{color.Color}	*NYCbCrA	1401
2226	image	NYCbCrAAt	{int,int}	{color.NYCbCrA}	*NYCbCrA	1401
2227	image	AOffset	{int,int}	{int}	*NYCbCrA	1401
2228	image	SubImage	{image.Rectangle}	{image.Image}	*NYCbCrA	1401
2229	image	Opaque	{}	{bool}	*NYCbCrA	1401
2230	suffixarray	Read	{io.Reader}	{error}	*Index	1402
2231	suffixarray	Write	{io.Writer}	{error}	*Index	1402
2232	suffixarray	Bytes	{}	{[]byte}	*Index	1402
2233	suffixarray	Lookup	{[]byte,int}	{[]int}	*Index	1402
2234	suffixarray	FindAllIndex	{*regexp.Regexp,int}	{[][]int}	*Index	1402
2235	poll	Error	{}	{string}	*TimeoutError	1406
2236	poll	Timeout	{}	{bool}	*TimeoutError	1406
2237	poll	Temporary	{}	{bool}	*TimeoutError	1406
2238	poll	Close	{}	{error}	*FD	1407
2239	poll	Read	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	1407
2240	poll	Write	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	1407
2241	poll	SetDeadline	{time.Time}	{error}	*FD	1407
2242	poll	SetReadDeadline	{time.Time}	{error}	*FD	1407
2243	poll	SetWriteDeadline	{time.Time}	{error}	*FD	1407
2244	poll	ReadLock	{}	{error}	*FD	1407
2245	poll	ReadUnlock	{}	{}	*FD	1407
2246	poll	RawControl	{func(uintptr)}	{error}	*FD	1407
2247	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	1407
2248	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	1407
2249	poll	SetDeadline	{time.Time}	{error}	*FD	1407
2250	poll	SetReadDeadline	{time.Time}	{error}	*FD	1407
2251	poll	SetWriteDeadline	{time.Time}	{error}	*FD	1407
2252	poll	SetDeadline	{time.Time}	{error}	*FD	1407
2253	poll	SetReadDeadline	{time.Time}	{error}	*FD	1407
2254	poll	SetWriteDeadline	{time.Time}	{error}	*FD	1407
2255	poll	Fchmod	{uint32}	{error}	*FD	1407
2256	poll	Fchown	{int,int}	{error}	*FD	1407
2257	poll	Ftruncate	{int64}	{error}	*FD	1407
2258	poll	Fsync	{}	{error}	*FD	1407
2259	poll	Init	{string,bool}	{error}	*FD	1407
2260	poll	Close	{}	{error}	*FD	1407
2261	poll	Shutdown	{int}	{error}	*FD	1407
2262	poll	SetBlocking	{}	{error}	*FD	1407
2263	poll	Read	{[]byte}	{int,error}	*FD	1407
2264	poll	Pread	{[]byte,int64}	{int,error}	*FD	1407
2265	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	1407
2266	poll	ReadMsg	{[]byte,[]byte}	{int,int,int,syscall.Sockaddr,error}	*FD	1407
2267	poll	Write	{[]byte}	{int,error}	*FD	1407
2268	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	1407
2269	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	1407
2270	poll	WriteMsg	{[]byte,[]byte,syscall.Sockaddr}	{int,int,error}	*FD	1407
2271	poll	Accept	{}	{int,syscall.Sockaddr,string,error}	*FD	1407
2272	poll	Seek	{int64,int}	{int64,error}	*FD	1407
2273	poll	ReadDirent	{[]byte}	{int,error}	*FD	1407
2274	poll	Fchdir	{}	{error}	*FD	1407
2275	poll	Fstat	{*syscall.Stat_t}	{error}	*FD	1407
2276	poll	WaitWrite	{}	{error}	*FD	1407
2277	poll	WriteOnce	{[]byte}	{int,error}	*FD	1407
2278	poll	RawControl	{func(uintptr)}	{error}	*FD	1407
2279	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	1407
2280	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	1407
2281	poll	Init	{string,bool}	{string,error}	*FD	1407
2282	poll	Close	{}	{error}	*FD	1407
2283	poll	Shutdown	{int}	{error}	*FD	1407
2284	poll	Read	{[]byte}	{int,error}	*FD	1407
2285	poll	Pread	{[]byte,int64}	{int,error}	*FD	1407
2286	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	1407
2287	poll	Write	{[]byte}	{int,error}	*FD	1407
2288	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	1407
2289	poll	Writev	{*[][]byte}	{int64,error}	*FD	1407
2290	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	1407
2291	poll	ConnectEx	{syscall.Sockaddr}	{error}	*FD	1407
2292	poll	Accept	{"func() (syscall.Handle, error)"}	{syscall.Handle,[]syscall.RawSockaddrAny,uint32,string,error}	*FD	1407
2293	poll	Seek	{int64,int}	{int64,error}	*FD	1407
2294	poll	FindNextFile	{*syscall.Win32finddata}	{error}	*FD	1407
2295	poll	Fchdir	{}	{error}	*FD	1407
2296	poll	GetFileType	{}	{uint32,error}	*FD	1407
2297	poll	GetFileInformationByHandle	{*syscall.ByHandleFileInformation}	{error}	*FD	1407
2298	poll	RawControl	{func(uintptr)}	{error}	*FD	1407
2299	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	1407
2300	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	1407
2301	poll	ReadMsg	{[]byte,[]byte}	{int,int,int,syscall.Sockaddr,error}	*FD	1407
2302	poll	WriteMsg	{[]byte,[]byte,syscall.Sockaddr}	{int,int,error}	*FD	1407
2303	poll	SetsockoptInt	{int,int,int}	{error}	*FD	1407
2304	poll	SetsockoptInet4Addr	{int,int,[]byte}	{error}	*FD	1407
2305	poll	SetsockoptLinger	{int,int,*syscall.Linger}	{error}	*FD	1407
2306	poll	SetsockoptIPMreqn	{int,int,*syscall.IPMreqn}	{error}	*FD	1407
2307	poll	SetsockoptByte	{int,int,byte}	{error}	*FD	1407
2308	poll	Setsockopt	{int32,int32,*byte,int32}	{error}	*FD	1407
2309	poll	WSAIoctl	{uint32,*byte,uint32,*byte,uint32,*uint32,*syscall.Overlapped,uintptr}	{error}	*FD	1407
2310	poll	SetsockoptIPMreq	{int,int,*syscall.IPMreq}	{error}	*FD	1407
2311	poll	SetsockoptIPv6Mreq	{int,int,*syscall.IPv6Mreq}	{error}	*FD	1407
2440	big	Int64	{}	{int64}	*Int	1473
2312	poll	Writev	{*[][]byte}	{int64,error}	*FD	1407
2313	singleflight	Do	{string,"func() (interface{}, error)"}	{"interface{}",error,bool}	*Group	1410
2314	singleflight	DoChan	{string,"func() (interface{}, error)"}	{"chan singleflight.Result\n",bool}	*Group	1410
2315	singleflight	ForgetUnshared	{string}	{bool}	*Group	1410
2316	registry	Close	{}	{error}	Key	1414
2317	registry	ReadSubKeyNames	{int}	{[]string,error}	Key	1414
2318	registry	Stat	{}	{*registry.KeyInfo,error}	Key	1414
2319	registry	GetValue	{string,[]byte}	{int,uint32,error}	Key	1414
2320	registry	GetStringValue	{string}	{string,uint32,error}	Key	1414
2321	registry	GetMUIStringValue	{string}	{string,error}	Key	1414
2322	registry	GetStringsValue	{string}	{[]string,uint32,error}	Key	1414
2323	registry	GetIntegerValue	{string}	{uint64,uint32,error}	Key	1414
2324	registry	GetBinaryValue	{string}	{[]byte,uint32,error}	Key	1414
2325	registry	SetDWordValue	{string,uint32}	{error}	Key	1414
2326	registry	SetQWordValue	{string,uint64}	{error}	Key	1414
2327	registry	SetStringValue	{string,string}	{error}	Key	1414
2328	registry	SetExpandStringValue	{string,string}	{error}	Key	1414
2329	registry	SetStringsValue	{string,[]string}	{error}	Key	1414
2330	registry	SetBinaryValue	{string,[]byte}	{error}	Key	1414
2331	registry	DeleteValue	{string}	{error}	Key	1414
2332	registry	ReadValueNames	{int}	{[]string,error}	Key	1414
2333	windows	Size	{}	{uint32}	*TOKEN_MANDATORY_LABEL	1423
2334	trace	Emit	{byte,...uint64}	{}	*Writer	1440
2335	io	Read	{[]byte}	{int,error}	*LimitedReader	1461
2336	io	Read	{[]byte}	{int,error}	*SectionReader	1462
2337	io	Seek	{int64,int}	{int64,error}	*SectionReader	1462
2338	io	ReadAt	{[]byte,int64}	{int,error}	*SectionReader	1462
2339	io	Size	{}	{int64}	*SectionReader	1462
2340	io	Read	{[]byte}	{int,error}	*PipeReader	1463
2341	io	Close	{}	{error}	*PipeReader	1463
2342	io	CloseWithError	{error}	{error}	*PipeReader	1463
2343	io	Write	{[]byte}	{int,error}	*PipeWriter	1464
2344	io	Close	{}	{error}	*PipeWriter	1464
2345	io	CloseWithError	{error}	{error}	*PipeWriter	1464
2346	log	SetOutput	{io.Writer}	{}	*Logger	1465
2347	log	Output	{int,string}	{error}	*Logger	1465
2348	log	Printf	{string,"...interface{}"}	{}	*Logger	1465
2349	log	Print	{"...interface{}"}	{}	*Logger	1465
2350	log	Println	{"...interface{}"}	{}	*Logger	1465
2351	log	Fatal	{"...interface{}"}	{}	*Logger	1465
2352	log	Fatalf	{string,"...interface{}"}	{}	*Logger	1465
2353	log	Fatalln	{"...interface{}"}	{}	*Logger	1465
2354	log	Panic	{"...interface{}"}	{}	*Logger	1465
2355	log	Panicf	{string,"...interface{}"}	{}	*Logger	1465
2356	log	Panicln	{"...interface{}"}	{}	*Logger	1465
2357	log	Flags	{}	{int}	*Logger	1465
2358	log	SetFlags	{int}	{}	*Logger	1465
2359	log	Prefix	{}	{string}	*Logger	1465
2360	log	SetPrefix	{string}	{}	*Logger	1465
2361	syslog	Write	{[]byte}	{int,error}	*Writer	1467
2362	syslog	Close	{}	{error}	*Writer	1467
2363	syslog	Emerg	{string}	{error}	*Writer	1467
2364	syslog	Alert	{string}	{error}	*Writer	1467
2365	syslog	Crit	{string}	{error}	*Writer	1467
2366	syslog	Err	{string}	{error}	*Writer	1467
2367	syslog	Warning	{string}	{error}	*Writer	1467
2368	syslog	Notice	{string}	{error}	*Writer	1467
2369	syslog	Info	{string}	{error}	*Writer	1467
2370	syslog	Debug	{string}	{error}	*Writer	1467
2371	big	SetPrec	{uint}	{*big.Float}	*Float	1469
2372	big	SetMode	{big.RoundingMode}	{*big.Float}	*Float	1469
2373	big	Prec	{}	{uint}	*Float	1469
2375	big	Mode	{}	{big.RoundingMode}	*Float	1469
2376	big	Acc	{}	{big.Accuracy}	*Float	1469
2377	big	Sign	{}	{int}	*Float	1469
2378	big	MantExp	{*big.Float}	{int}	*Float	1469
2379	big	SetMantExp	{*big.Float,int}	{*big.Float}	*Float	1469
2380	big	Signbit	{}	{bool}	*Float	1469
2381	big	IsInf	{}	{bool}	*Float	1469
2382	big	IsInt	{}	{bool}	*Float	1469
2383	big	SetUint64	{uint64}	{*big.Float}	*Float	1469
2384	big	SetInt64	{int64}	{*big.Float}	*Float	1469
2385	big	SetFloat64	{float64}	{*big.Float}	*Float	1469
2386	big	SetInt	{*big.Int}	{*big.Float}	*Float	1469
2387	big	SetRat	{*big.Rat}	{*big.Float}	*Float	1469
2388	big	SetInf	{bool}	{*big.Float}	*Float	1469
2389	big	Set	{*big.Float}	{*big.Float}	*Float	1469
2390	big	Copy	{*big.Float}	{*big.Float}	*Float	1469
2391	big	Uint64	{}	{uint64,big.Accuracy}	*Float	1469
2392	big	Int64	{}	{int64,big.Accuracy}	*Float	1469
2393	big	Float32	{}	{float32,big.Accuracy}	*Float	1469
2394	big	Float64	{}	{float64,big.Accuracy}	*Float	1469
2395	big	Int	{*big.Int}	{*big.Int,big.Accuracy}	*Float	1469
2396	big	Rat	{*big.Rat}	{*big.Rat,big.Accuracy}	*Float	1469
2397	big	Abs	{*big.Float}	{*big.Float}	*Float	1469
2398	big	Neg	{*big.Float}	{*big.Float}	*Float	1469
2399	big	Add	{*big.Float,*big.Float}	{*big.Float}	*Float	1469
2400	big	Sub	{*big.Float,*big.Float}	{*big.Float}	*Float	1469
2401	big	Mul	{*big.Float,*big.Float}	{*big.Float}	*Float	1469
2402	big	Quo	{*big.Float,*big.Float}	{*big.Float}	*Float	1469
2403	big	Cmp	{*big.Float}	{int}	*Float	1469
2404	big	SetString	{string}	{*big.Float,bool}	*Float	1469
2405	big	Parse	{string,int}	{*big.Float,int,error}	*Float	1469
2406	big	Scan	{fmt.ScanState,rune}	{error}	*Float	1469
2407	big	GobEncode	{}	{[]byte,error}	*Float	1469
2408	big	GobDecode	{[]byte}	{error}	*Float	1469
2409	big	MarshalText	{}	{[]byte,error}	*Float	1469
2410	big	UnmarshalText	{[]byte}	{error}	*Float	1469
2411	big	Text	{byte,int}	{string}	*Float	1469
2412	big	String	{}	{string}	*Float	1469
2413	big	Append	{[]byte,byte,int}	{[]byte}	*Float	1469
2414	big	Format	{fmt.State,rune}	{}	*Float	1469
2415	big	Sqrt	{*big.Float}	{*big.Float}	*Float	1469
2416	big	Error	{}	{string}	ErrNaN	1470
2417	big	String	{}	{string}	RoundingMode	1471
2418	big	String	{}	{string}	Accuracy	1472
2419	big	Sign	{}	{int}	*Int	1473
2420	big	SetInt64	{int64}	{*big.Int}	*Int	1473
2421	big	SetUint64	{uint64}	{*big.Int}	*Int	1473
2422	big	Set	{*big.Int}	{*big.Int}	*Int	1473
2423	big	Bits	{}	{[]big.Word}	*Int	1473
2424	big	SetBits	{[]big.Word}	{*big.Int}	*Int	1473
2425	big	Abs	{*big.Int}	{*big.Int}	*Int	1473
2426	big	Neg	{*big.Int}	{*big.Int}	*Int	1473
2427	big	Add	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2428	big	Sub	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2429	big	Mul	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2430	big	MulRange	{int64,int64}	{*big.Int}	*Int	1473
2431	big	Binomial	{int64,int64}	{*big.Int}	*Int	1473
2432	big	Quo	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2433	big	Rem	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2434	big	QuoRem	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	1473
2435	big	Div	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2436	big	Mod	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2437	big	DivMod	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	1473
2438	big	Cmp	{*big.Int}	{int}	*Int	1473
2439	big	CmpAbs	{*big.Int}	{int}	*Int	1473
2441	big	Uint64	{}	{uint64}	*Int	1473
2442	big	IsInt64	{}	{bool}	*Int	1473
2443	big	IsUint64	{}	{bool}	*Int	1473
2444	big	SetString	{string,int}	{*big.Int,bool}	*Int	1473
2445	big	SetBytes	{[]byte}	{*big.Int}	*Int	1473
2446	big	Bytes	{}	{[]byte}	*Int	1473
2447	big	BitLen	{}	{int}	*Int	1473
2448	big	Exp	{*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	1473
2449	big	GCD	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	1473
2450	big	Rand	{*rand.Rand,*big.Int}	{*big.Int}	*Int	1473
2451	big	ModInverse	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2452	big	ModSqrt	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2453	big	Lsh	{*big.Int,uint}	{*big.Int}	*Int	1473
2454	big	Rsh	{*big.Int,uint}	{*big.Int}	*Int	1473
2455	big	Bit	{int}	{uint}	*Int	1473
2456	big	SetBit	{*big.Int,int,uint}	{*big.Int}	*Int	1473
2457	big	And	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2458	big	AndNot	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2459	big	Or	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2460	big	Xor	{*big.Int,*big.Int}	{*big.Int}	*Int	1473
2461	big	Not	{*big.Int}	{*big.Int}	*Int	1473
2462	big	Sqrt	{*big.Int}	{*big.Int}	*Int	1473
2463	big	Text	{int}	{string}	*Int	1473
2464	big	Append	{[]byte,int}	{[]byte}	*Int	1473
2465	big	String	{}	{string}	*Int	1473
2466	big	Format	{fmt.State,rune}	{}	*Int	1473
2467	big	Scan	{fmt.ScanState,rune}	{error}	*Int	1473
2468	big	GobEncode	{}	{[]byte,error}	*Int	1473
2469	big	GobDecode	{[]byte}	{error}	*Int	1473
2470	big	MarshalText	{}	{[]byte,error}	*Int	1473
2471	big	UnmarshalText	{[]byte}	{error}	*Int	1473
2472	big	MarshalJSON	{}	{[]byte,error}	*Int	1473
2473	big	UnmarshalJSON	{[]byte}	{error}	*Int	1473
2474	big	ProbablyPrime	{int}	{bool}	*Int	1473
2475	big	SetFloat64	{float64}	{*big.Rat}	*Rat	1474
2476	big	Float32	{}	{float32,bool}	*Rat	1474
2477	big	Float64	{}	{float64,bool}	*Rat	1474
2478	big	SetFrac	{*big.Int,*big.Int}	{*big.Rat}	*Rat	1474
2479	big	SetFrac64	{int64,int64}	{*big.Rat}	*Rat	1474
2480	big	SetInt	{*big.Int}	{*big.Rat}	*Rat	1474
2481	big	SetInt64	{int64}	{*big.Rat}	*Rat	1474
2482	big	Set	{*big.Rat}	{*big.Rat}	*Rat	1474
2483	big	Abs	{*big.Rat}	{*big.Rat}	*Rat	1474
2484	big	Neg	{*big.Rat}	{*big.Rat}	*Rat	1474
2485	big	Inv	{*big.Rat}	{*big.Rat}	*Rat	1474
2486	big	Sign	{}	{int}	*Rat	1474
2487	big	IsInt	{}	{bool}	*Rat	1474
2488	big	Num	{}	{*big.Int}	*Rat	1474
2489	big	Denom	{}	{*big.Int}	*Rat	1474
2490	big	Cmp	{*big.Rat}	{int}	*Rat	1474
2491	big	Add	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	1474
2492	big	Sub	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	1474
2493	big	Mul	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	1474
2494	big	Quo	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	1474
2495	big	Scan	{fmt.ScanState,rune}	{error}	*Rat	1474
2496	big	SetString	{string}	{*big.Rat,bool}	*Rat	1474
2497	big	String	{}	{string}	*Rat	1474
2498	big	RatString	{}	{string}	*Rat	1474
2499	big	FloatString	{int}	{string}	*Rat	1474
2500	big	GobEncode	{}	{[]byte,error}	*Rat	1474
2501	big	GobDecode	{[]byte}	{error}	*Rat	1474
2502	big	MarshalText	{}	{[]byte,error}	*Rat	1474
2503	big	UnmarshalText	{[]byte}	{error}	*Rat	1474
2504	rand	ExpFloat64	{}	{float64}	*Rand	1477
2505	rand	NormFloat64	{}	{float64}	*Rand	1477
2506	rand	Seed	{int64}	{}	*Rand	1477
2507	rand	Int63	{}	{int64}	*Rand	1477
2508	rand	Uint32	{}	{uint32}	*Rand	1477
2509	rand	Uint64	{}	{uint64}	*Rand	1477
2510	rand	Int31	{}	{int32}	*Rand	1477
2511	rand	Int	{}	{int}	*Rand	1477
2512	rand	Int63n	{int64}	{int64}	*Rand	1477
2513	rand	Int31n	{int32}	{int32}	*Rand	1477
2514	rand	Intn	{int}	{int}	*Rand	1477
2515	rand	Float64	{}	{float64}	*Rand	1477
2516	rand	Float32	{}	{float32}	*Rand	1477
2517	rand	Perm	{int}	{[]int}	*Rand	1477
2518	rand	Shuffle	{int,func(int)}	{}	*Rand	1477
2519	rand	Read	{[]byte}	{int,error}	*Rand	1477
2520	rand	Uint64	{}	{uint64}	*Zipf	1478
2521	mime	Encode	{string,string}	{string}	WordEncoder	1479
2522	mime	Decode	{string}	{string,error}	*WordDecoder	1480
2523	mime	DecodeHeader	{string}	{string,error}	*WordDecoder	1480
2524	multipart	RemoveAll	{}	{error}	*Form	1481
2525	multipart	Open	{}	{multipart.File,error}	*FileHeader	1482
2526	multipart	FormName	{}	{string}	*Part	1484
2527	multipart	FileName	{}	{string}	*Part	1484
2528	multipart	Read	{[]byte}	{int,error}	*Part	1484
2529	multipart	Close	{}	{error}	*Part	1484
2530	multipart	ReadForm	{int64}	{*multipart.Form,error}	*Reader	1485
2531	multipart	NextPart	{}	{*multipart.Part,error}	*Reader	1485
2532	multipart	Boundary	{}	{string}	*Writer	1486
2533	multipart	SetBoundary	{string}	{error}	*Writer	1486
2534	multipart	FormDataContentType	{}	{string}	*Writer	1486
2535	multipart	CreatePart	{textproto.MIMEHeader}	{io.Writer,error}	*Writer	1486
2536	multipart	CreateFormFile	{string,string}	{io.Writer,error}	*Writer	1486
2537	multipart	CreateFormField	{string}	{io.Writer,error}	*Writer	1486
2538	multipart	WriteField	{string,string}	{error}	*Writer	1486
2539	multipart	Close	{}	{error}	*Writer	1486
2540	quotedprintable	Read	{[]byte}	{int,error}	*Reader	1487
2541	quotedprintable	Write	{[]byte}	{int,error}	*Writer	1488
2542	quotedprintable	Close	{}	{error}	*Writer	1488
2543	net	Dial	{string,string}	{net.Conn,error}	*Dialer	1489
2544	net	DialContext	{context.Context,string,string}	{net.Conn,error}	*Dialer	1489
2545	cgi	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Handler	1493
2546	http	Get	{string}	{*http.Response,error}	*Client	1494
2547	http	Do	{*http.Request}	{*http.Response,error}	*Client	1494
2548	http	Post	{string,string,io.Reader}	{*http.Response,error}	*Client	1494
2549	http	PostForm	{string,url.Values}	{*http.Response,error}	*Client	1494
2550	http	Head	{string}	{*http.Response,error}	*Client	1494
2551	http	String	{}	{string}	*Cookie	1496
2552	cookiejar	Cookies	{*url.URL}	{[]*http.Cookie}	*Jar	1499
2553	cookiejar	SetCookies	{*url.URL,[]*http.Cookie}	{}	*Jar	1499
2554	http	Open	{string}	{http.File,error}	Dir	1500
2555	http	Add	{string,string}	{}	Header	1504
2556	http	Set	{string,string}	{}	Header	1504
2557	http	Get	{string}	{string}	Header	1504
2558	http	Del	{string}	{}	Header	1504
2559	http	Write	{io.Writer}	{error}	Header	1504
2560	http	WriteSubset	{io.Writer,map[string]bool}	{error}	Header	1504
2561	httptest	Header	{}	{http.Header}	*ResponseRecorder	1507
2562	httptest	Write	{[]byte}	{int,error}	*ResponseRecorder	1507
2563	httptest	WriteString	{string}	{int,error}	*ResponseRecorder	1507
2564	httptest	WriteHeader	{int}	{}	*ResponseRecorder	1507
2565	httptest	Flush	{}	{}	*ResponseRecorder	1507
2566	httptest	Result	{}	{*http.Response}	*ResponseRecorder	1507
2567	httptest	Start	{}	{}	*Server	1508
2568	httptest	StartTLS	{}	{}	*Server	1508
2569	httptest	Close	{}	{}	*Server	1508
2570	httptest	CloseClientConnections	{}	{}	*Server	1508
2571	httptest	Certificate	{}	{*x509.Certificate}	*Server	1508
2572	httptest	Client	{}	{*http.Client}	*Server	1508
2573	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ServerConn	1514
2574	httputil	Close	{}	{error}	*ServerConn	1514
2575	httputil	Read	{}	{*http.Request,error}	*ServerConn	1514
2576	httputil	Pending	{}	{int}	*ServerConn	1514
2577	httputil	Write	{*http.Request,*http.Response}	{error}	*ServerConn	1514
2578	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ClientConn	1515
2579	httputil	Close	{}	{error}	*ClientConn	1515
2580	httputil	Write	{*http.Request}	{error}	*ClientConn	1515
2581	httputil	Pending	{}	{int}	*ClientConn	1515
2582	httputil	Read	{*http.Request}	{*http.Response,error}	*ClientConn	1515
2583	httputil	Do	{*http.Request}	{*http.Response,error}	*ClientConn	1515
2584	httputil	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ReverseProxy	1516
2585	http	Error	{}	{string}	*ProtocolError	1520
2586	http	Context	{}	{context.Context}	*Request	1521
2587	http	WithContext	{context.Context}	{*http.Request}	*Request	1521
2588	http	ProtoAtLeast	{int,int}	{bool}	*Request	1521
2589	http	UserAgent	{}	{string}	*Request	1521
2590	http	Cookies	{}	{[]*http.Cookie}	*Request	1521
2591	http	Cookie	{string}	{*http.Cookie,error}	*Request	1521
2592	http	AddCookie	{*http.Cookie}	{}	*Request	1521
2593	http	Referer	{}	{string}	*Request	1521
2594	http	MultipartReader	{}	{*multipart.Reader,error}	*Request	1521
2595	http	Write	{io.Writer}	{error}	*Request	1521
2596	http	WriteProxy	{io.Writer}	{error}	*Request	1521
2597	http	BasicAuth	{}	{string,bool}	*Request	1521
2598	http	SetBasicAuth	{string,string}	{}	*Request	1521
2599	http	ParseForm	{}	{error}	*Request	1521
2600	http	ParseMultipartForm	{int64}	{error}	*Request	1521
2601	http	FormValue	{string}	{string}	*Request	1521
2602	http	PostFormValue	{string}	{string}	*Request	1521
2603	http	FormFile	{string}	{multipart.File,*multipart.FileHeader,error}	*Request	1521
2604	http	Cookies	{}	{[]*http.Cookie}	*Response	1522
2605	http	Location	{}	{*url.URL,error}	*Response	1522
2606	http	ProtoAtLeast	{int,int}	{bool}	*Response	1522
2607	http	Write	{io.Writer}	{error}	*Response	1522
2608	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	HandlerFunc	1528
2609	http	Handler	{*http.Request}	{http.Handler,string}	*ServeMux	1529
2610	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ServeMux	1529
2611	http	Handle	{string,http.Handler}	{}	*ServeMux	1529
2612	http	HandleFunc	{string,"func(http.ResponseWriter, *http.Request)"}	{}	*ServeMux	1529
2613	http	Close	{}	{error}	*Server	1530
2614	http	Shutdown	{context.Context}	{error}	*Server	1530
2615	http	RegisterOnShutdown	{func()}	{}	*Server	1530
2616	http	ListenAndServe	{}	{error}	*Server	1530
2617	http	Serve	{net.Listener}	{error}	*Server	1530
2618	http	ServeTLS	{net.Listener,string,string}	{error}	*Server	1530
2619	http	SetKeepAlivesEnabled	{bool}	{}	*Server	1530
2620	http	ListenAndServeTLS	{string,string}	{error}	*Server	1530
2621	http	String	{}	{string}	ConnState	1531
2622	http	RoundTrip	{*http.Request}	{*http.Response,error}	*Transport	1532
2623	http	RegisterProtocol	{string,http.RoundTripper}	{}	*Transport	1532
2624	http	CloseIdleConnections	{}	{}	*Transport	1532
2625	http	CancelRequest	{*http.Request}	{}	*Transport	1532
2626	main	String	{}	{string}	*Counter	1533
2627	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Counter	1533
2628	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	Chan	1534
2629	net	Addrs	{}	{[]net.Addr,error}	*Interface	1535
2630	net	MulticastAddrs	{}	{[]net.Addr,error}	*Interface	1535
2631	net	String	{}	{string}	Flags	1536
2632	socktest	Stats	{}	{[]socktest.Stat}	*Switch	1537
2633	socktest	Sockets	{}	{socktest.Sockets}	*Switch	1537
2634	socktest	Set	{socktest.FilterType,socktest.Filter}	{}	*Switch	1537
2694	mail	Date	{}	{time.Time,error}	Header	1555
2635	socktest	Accept4	{int,int}	{int,syscall.Sockaddr,error}	*Switch	1537
2636	socktest	Socket	{int,int,int}	{int,error}	*Switch	1537
2637	socktest	Close	{int}	{error}	*Switch	1537
2638	socktest	Connect	{int,syscall.Sockaddr}	{error}	*Switch	1537
2639	socktest	Listen	{int,int}	{error}	*Switch	1537
2640	socktest	Accept	{int}	{int,syscall.Sockaddr,error}	*Switch	1537
2641	socktest	GetsockoptInt	{int,int,int}	{int,error}	*Switch	1537
2642	socktest	Socket	{int,int,int}	{syscall.Handle,error}	*Switch	1537
2643	socktest	WSASocket	{int32,int32,int32,*syscall.WSAProtocolInfo,uint32,uint32}	{syscall.Handle,error}	*Switch	1537
2644	socktest	Closesocket	{syscall.Handle}	{error}	*Switch	1537
2645	socktest	Connect	{syscall.Handle,syscall.Sockaddr}	{error}	*Switch	1537
2646	socktest	ConnectEx	{syscall.Handle,syscall.Sockaddr,*byte,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	1537
2647	socktest	Listen	{syscall.Handle,int}	{error}	*Switch	1537
2648	socktest	AcceptEx	{syscall.Handle,syscall.Handle,*byte,uint32,uint32,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	1537
2649	socktest	Family	{}	{int}	Cookie	1538
2650	socktest	Type	{}	{int}	Cookie	1538
2651	socktest	Protocol	{}	{int}	Cookie	1538
2652	socktest	String	{}	{string}	Status	1539
2653	socktest	String	{}	{string}	Stat	1540
2654	net	IsUnspecified	{}	{bool}	IP	1547
2655	net	IsLoopback	{}	{bool}	IP	1547
2656	net	IsMulticast	{}	{bool}	IP	1547
2657	net	IsInterfaceLocalMulticast	{}	{bool}	IP	1547
2658	net	IsLinkLocalMulticast	{}	{bool}	IP	1547
2659	net	IsLinkLocalUnicast	{}	{bool}	IP	1547
2660	net	IsGlobalUnicast	{}	{bool}	IP	1547
2661	net	To4	{}	{net.IP}	IP	1547
2662	net	To16	{}	{net.IP}	IP	1547
2663	net	DefaultMask	{}	{net.IPMask}	IP	1547
2664	net	Mask	{net.IPMask}	{net.IP}	IP	1547
2665	net	String	{}	{string}	IP	1547
2666	net	MarshalText	{}	{[]byte,error}	IP	1547
2667	net	UnmarshalText	{[]byte}	{error}	*IP	1547
2668	net	Equal	{net.IP}	{bool}	IP	1547
2669	net	Size	{}	{int}	IPMask	1548
2670	net	String	{}	{string}	IPMask	1548
2671	net	Contains	{net.IP}	{bool}	*IPNet	1549
2672	net	Network	{}	{string}	*IPNet	1549
2673	net	String	{}	{string}	*IPNet	1549
2674	net	Network	{}	{string}	*IPAddr	1550
2675	net	String	{}	{string}	*IPAddr	1550
2676	net	SyscallConn	{}	{syscall.RawConn,error}	*IPConn	1551
2677	net	ReadFromIP	{[]byte}	{int,*net.IPAddr,error}	*IPConn	1551
2678	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*IPConn	1551
2679	net	ReadMsgIP	{[]byte,[]byte}	{int,*net.IPAddr,error}	*IPConn	1551
2680	net	WriteToIP	{[]byte,*net.IPAddr}	{int,error}	*IPConn	1551
2681	net	WriteTo	{[]byte,net.Addr}	{int,error}	*IPConn	1551
2682	net	WriteMsgIP	{[]byte,[]byte,*net.IPAddr}	{int,error}	*IPConn	1551
2683	net	LookupHost	{context.Context,string}	{[]string,error}	*Resolver	1552
2684	net	LookupIPAddr	{context.Context,string}	{[]net.IPAddr,error}	*Resolver	1552
2685	net	LookupPort	{context.Context,string,string}	{int,error}	*Resolver	1552
2686	net	LookupCNAME	{context.Context,string}	{string,error}	*Resolver	1552
2687	net	LookupSRV	{context.Context,string,string,string}	{string,[]*net.SRV,error}	*Resolver	1552
2688	net	LookupMX	{context.Context,string}	{[]*net.MX,error}	*Resolver	1552
2689	net	LookupNS	{context.Context,string}	{[]*net.NS,error}	*Resolver	1552
2690	net	LookupTXT	{context.Context,string}	{[]string,error}	*Resolver	1552
2691	net	LookupAddr	{context.Context,string}	{[]string,error}	*Resolver	1552
2692	net	String	{}	{string}	HardwareAddr	1553
2693	mail	Get	{string}	{string}	Header	1555
2896	os	Close	{}	{error}	*File	1616
2695	mail	AddressList	{string}	{[]*mail.Address,error}	Header	1555
2696	mail	String	{}	{string}	*Address	1556
2697	mail	Parse	{string}	{*mail.Address,error}	*AddressParser	1557
2698	mail	ParseList	{string}	{[]*mail.Address,error}	*AddressParser	1557
2699	net	Error	{}	{string}	*OpError	1563
2700	net	Timeout	{}	{bool}	*OpError	1563
2701	net	Temporary	{}	{bool}	*OpError	1563
2702	net	Error	{}	{string}	*ParseError	1564
2703	net	Error	{}	{string}	*AddrError	1565
2704	net	Timeout	{}	{bool}	*AddrError	1565
2705	net	Temporary	{}	{bool}	*AddrError	1565
2706	net	Error	{}	{string}	UnknownNetworkError	1566
2707	net	Timeout	{}	{bool}	UnknownNetworkError	1566
2708	net	Temporary	{}	{bool}	UnknownNetworkError	1566
2709	net	Error	{}	{string}	InvalidAddrError	1567
2710	net	Timeout	{}	{bool}	InvalidAddrError	1567
2711	net	Temporary	{}	{bool}	InvalidAddrError	1567
2712	net	Error	{}	{string}	*DNSConfigError	1568
2713	net	Timeout	{}	{bool}	*DNSConfigError	1568
2714	net	Temporary	{}	{bool}	*DNSConfigError	1568
2715	net	Error	{}	{string}	*DNSError	1569
2716	net	Timeout	{}	{bool}	*DNSError	1569
2717	net	Temporary	{}	{bool}	*DNSError	1569
2718	net	WriteTo	{io.Writer}	{int64,error}	*Buffers	1570
2719	net	Read	{[]byte}	{int,error}	*Buffers	1570
2720	rpc	Error	{}	{string}	ServerError	1571
2721	rpc	Close	{}	{error}	*Client	1573
2722	rpc	Go	{string,"interface{}","interface{}","chan *rpc.Call\n"}	{*rpc.Call}	*Client	1573
2723	rpc	Call	{string,"interface{}","interface{}"}	{error}	*Client	1573
2724	rpc	Register	{"interface{}"}	{error}	*Server	1577
2725	rpc	RegisterName	{string,"interface{}"}	{error}	*Server	1577
2726	rpc	ServeConn	{io.ReadWriteCloser}	{}	*Server	1577
2727	rpc	ServeCodec	{rpc.ServerCodec}	{}	*Server	1577
2728	rpc	ServeRequest	{rpc.ServerCodec}	{error}	*Server	1577
2729	rpc	Accept	{net.Listener}	{}	*Server	1577
2730	rpc	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Server	1577
2731	rpc	HandleHTTP	{string,string}	{}	*Server	1577
2732	smtp	Close	{}	{error}	*Client	1581
2733	smtp	Hello	{string}	{error}	*Client	1581
2734	smtp	StartTLS	{*tls.Config}	{error}	*Client	1581
2735	smtp	TLSConnectionState	{}	{tls.ConnectionState,bool}	*Client	1581
2736	smtp	Verify	{string}	{error}	*Client	1581
2737	smtp	Auth	{smtp.Auth}	{error}	*Client	1581
2738	smtp	Mail	{string}	{error}	*Client	1581
2739	smtp	Rcpt	{string}	{error}	*Client	1581
2740	smtp	Data	{}	{io.WriteCloser,error}	*Client	1581
2741	smtp	Extension	{string}	{bool,string}	*Client	1581
2742	smtp	Reset	{}	{error}	*Client	1581
2743	smtp	Noop	{}	{error}	*Client	1581
2744	smtp	Quit	{}	{error}	*Client	1581
2745	net	Network	{}	{string}	*TCPAddr	1582
2746	net	String	{}	{string}	*TCPAddr	1582
2747	net	SyscallConn	{}	{syscall.RawConn,error}	*TCPConn	1583
2748	net	ReadFrom	{io.Reader}	{int64,error}	*TCPConn	1583
2749	net	CloseRead	{}	{error}	*TCPConn	1583
2750	net	CloseWrite	{}	{error}	*TCPConn	1583
2751	net	SetLinger	{int}	{error}	*TCPConn	1583
2752	net	SetKeepAlive	{bool}	{error}	*TCPConn	1583
2753	net	SetKeepAlivePeriod	{time.Duration}	{error}	*TCPConn	1583
2754	net	SetNoDelay	{bool}	{error}	*TCPConn	1583
2755	net	SyscallConn	{}	{syscall.RawConn,error}	*TCPListener	1584
2756	net	AcceptTCP	{}	{*net.TCPConn,error}	*TCPListener	1584
2757	net	Accept	{}	{net.Conn,error}	*TCPListener	1584
2758	net	Close	{}	{error}	*TCPListener	1584
2759	net	Addr	{}	{net.Addr}	*TCPListener	1584
2760	net	SetDeadline	{time.Time}	{error}	*TCPListener	1584
2761	net	File	{}	{*os.File,error}	*TCPListener	1584
2762	textproto	Add	{string,string}	{}	MIMEHeader	1585
2763	textproto	Set	{string,string}	{}	MIMEHeader	1585
2764	textproto	Get	{string}	{string}	MIMEHeader	1585
2765	textproto	Del	{string}	{}	MIMEHeader	1585
2766	textproto	Next	{}	{uint}	*Pipeline	1586
2767	textproto	StartRequest	{uint}	{}	*Pipeline	1586
2768	textproto	EndRequest	{uint}	{}	*Pipeline	1586
2769	textproto	StartResponse	{uint}	{}	*Pipeline	1586
2770	textproto	EndResponse	{uint}	{}	*Pipeline	1586
2771	textproto	ReadLine	{}	{string,error}	*Reader	1587
2772	textproto	ReadLineBytes	{}	{[]byte,error}	*Reader	1587
2773	textproto	ReadContinuedLine	{}	{string,error}	*Reader	1587
2774	textproto	ReadContinuedLineBytes	{}	{[]byte,error}	*Reader	1587
2775	textproto	ReadCodeLine	{int}	{int,string,error}	*Reader	1587
2776	textproto	ReadResponse	{int}	{int,string,error}	*Reader	1587
2777	textproto	DotReader	{}	{io.Reader}	*Reader	1587
2778	textproto	ReadDotBytes	{}	{[]byte,error}	*Reader	1587
2779	textproto	ReadDotLines	{}	{[]string,error}	*Reader	1587
2780	textproto	ReadMIMEHeader	{}	{textproto.MIMEHeader,error}	*Reader	1587
2781	textproto	Error	{}	{string}	*Error	1588
2782	textproto	Error	{}	{string}	ProtocolError	1589
2783	textproto	Close	{}	{error}	*Conn	1590
2784	textproto	Cmd	{string,"...interface{}"}	{uint,error}	*Conn	1590
2785	textproto	PrintfLine	{string,"...interface{}"}	{error}	*Writer	1591
2786	textproto	DotWriter	{}	{io.WriteCloser}	*Writer	1591
2787	net	Network	{}	{string}	*UDPAddr	1592
2788	net	String	{}	{string}	*UDPAddr	1592
2789	net	SyscallConn	{}	{syscall.RawConn,error}	*UDPConn	1593
2790	net	ReadFromUDP	{[]byte}	{int,*net.UDPAddr,error}	*UDPConn	1593
2791	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UDPConn	1593
2792	net	ReadMsgUDP	{[]byte,[]byte}	{int,*net.UDPAddr,error}	*UDPConn	1593
2793	net	WriteToUDP	{[]byte,*net.UDPAddr}	{int,error}	*UDPConn	1593
2794	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UDPConn	1593
2795	net	WriteMsgUDP	{[]byte,[]byte,*net.UDPAddr}	{int,error}	*UDPConn	1593
2796	net	Network	{}	{string}	*UnixAddr	1594
2797	net	String	{}	{string}	*UnixAddr	1594
2798	net	SyscallConn	{}	{syscall.RawConn,error}	*UnixConn	1595
2799	net	CloseRead	{}	{error}	*UnixConn	1595
2800	net	CloseWrite	{}	{error}	*UnixConn	1595
2801	net	ReadFromUnix	{[]byte}	{int,*net.UnixAddr,error}	*UnixConn	1595
2802	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UnixConn	1595
2803	net	ReadMsgUnix	{[]byte,[]byte}	{int,*net.UnixAddr,error}	*UnixConn	1595
2804	net	WriteToUnix	{[]byte,*net.UnixAddr}	{int,error}	*UnixConn	1595
2805	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UnixConn	1595
2806	net	WriteMsgUnix	{[]byte,[]byte,*net.UnixAddr}	{int,error}	*UnixConn	1595
2807	net	SyscallConn	{}	{syscall.RawConn,error}	*UnixListener	1596
2808	net	AcceptUnix	{}	{*net.UnixConn,error}	*UnixListener	1596
2809	net	Accept	{}	{net.Conn,error}	*UnixListener	1596
2810	net	Close	{}	{error}	*UnixListener	1596
2811	net	Addr	{}	{net.Addr}	*UnixListener	1596
2812	net	SetDeadline	{time.Time}	{error}	*UnixListener	1596
2813	net	File	{}	{*os.File,error}	*UnixListener	1596
2814	net	SetUnlinkOnClose	{bool}	{}	*UnixListener	1596
2815	url	Error	{}	{string}	*Error	1597
2816	url	Timeout	{}	{bool}	*Error	1597
2817	url	Temporary	{}	{bool}	*Error	1597
2818	url	Error	{}	{string}	EscapeError	1598
2819	url	Error	{}	{string}	InvalidHostError	1599
2820	url	EscapedPath	{}	{string}	*URL	1600
2821	url	String	{}	{string}	*URL	1600
2822	url	IsAbs	{}	{bool}	*URL	1600
2823	url	Parse	{string}	{*url.URL,error}	*URL	1600
2824	url	ResolveReference	{*url.URL}	{*url.URL}	*URL	1600
2825	url	Query	{}	{url.Values}	*URL	1600
2826	url	RequestURI	{}	{string}	*URL	1600
2827	url	Hostname	{}	{string}	*URL	1600
2828	url	Port	{}	{string}	*URL	1600
2829	url	MarshalBinary	{}	{[]byte,error}	*URL	1600
2830	url	UnmarshalBinary	{[]byte}	{error}	*URL	1600
2831	url	Username	{}	{string}	*Userinfo	1601
2832	url	Password	{}	{string,bool}	*Userinfo	1601
2833	url	String	{}	{string}	*Userinfo	1601
2834	url	Get	{string}	{string}	Values	1602
2835	url	Set	{string,string}	{}	Values	1602
2836	url	Add	{string,string}	{}	Values	1602
2837	url	Del	{string}	{}	Values	1602
2838	url	Encode	{}	{string}	Values	1602
2839	os	Error	{}	{string}	*PathError	1603
2840	os	Timeout	{}	{bool}	*PathError	1603
2841	os	Error	{}	{string}	*SyscallError	1604
2842	os	Timeout	{}	{bool}	*SyscallError	1604
2843	exec	Error	{}	{string}	*Error	1605
2844	exec	Run	{}	{error}	*Cmd	1606
2845	exec	Start	{}	{error}	*Cmd	1606
2846	exec	Wait	{}	{error}	*Cmd	1606
2847	exec	Output	{}	{[]byte,error}	*Cmd	1606
2848	exec	CombinedOutput	{}	{[]byte,error}	*Cmd	1606
2849	exec	StdinPipe	{}	{io.WriteCloser,error}	*Cmd	1606
2850	exec	StdoutPipe	{}	{io.ReadCloser,error}	*Cmd	1606
2851	exec	StderrPipe	{}	{io.ReadCloser,error}	*Cmd	1606
2852	exec	Error	{}	{string}	*ExitError	1608
2853	os	Release	{}	{error}	*Process	1609
2854	os	Kill	{}	{error}	*Process	1609
2855	os	Wait	{}	{*os.ProcessState,error}	*Process	1609
2856	os	Signal	{os.Signal}	{error}	*Process	1609
2857	os	UserTime	{}	{time.Duration}	*ProcessState	1612
2858	os	SystemTime	{}	{time.Duration}	*ProcessState	1612
2859	os	Exited	{}	{bool}	*ProcessState	1612
2860	os	Success	{}	{bool}	*ProcessState	1612
2861	os	Sys	{}	{"interface{}"}	*ProcessState	1612
2862	os	SysUsage	{}	{"interface{}"}	*ProcessState	1612
2863	os	Pid	{}	{int}	*ProcessState	1612
2864	os	String	{}	{string}	*ProcessState	1612
2865	os	Pid	{}	{int}	*ProcessState	1612
2866	os	String	{}	{string}	*ProcessState	1612
2867	os	Error	{}	{string}	*LinkError	1614
2868	pty	Error	{}	{string}	*PtyError	1615
2869	os	Readdir	{int}	{[]os.FileInfo,error}	*File	1616
2870	os	Readdirnames	{int}	{[]string,error}	*File	1616
2871	os	Name	{}	{string}	*File	1616
2872	os	Read	{[]byte}	{int,error}	*File	1616
2873	os	ReadAt	{[]byte,int64}	{int,error}	*File	1616
2874	os	Write	{[]byte}	{int,error}	*File	1616
2875	os	WriteAt	{[]byte,int64}	{int,error}	*File	1616
2876	os	Seek	{int64,int}	{int64,error}	*File	1616
2877	os	WriteString	{string}	{int,error}	*File	1616
2878	os	Chmod	{os.FileMode}	{error}	*File	1616
2879	os	SetDeadline	{time.Time}	{error}	*File	1616
2880	os	SetReadDeadline	{time.Time}	{error}	*File	1616
2881	os	SetWriteDeadline	{time.Time}	{error}	*File	1616
2882	os	Fd	{}	{uintptr}	*File	1616
2883	os	Close	{}	{error}	*File	1616
2884	os	Stat	{}	{os.FileInfo,error}	*File	1616
2885	os	Truncate	{int64}	{error}	*File	1616
2886	os	Sync	{}	{error}	*File	1616
2887	os	Chown	{int,int}	{error}	*File	1616
2888	os	Chdir	{}	{error}	*File	1616
2889	os	Chown	{int,int}	{error}	*File	1616
2890	os	Truncate	{int64}	{error}	*File	1616
2891	os	Sync	{}	{error}	*File	1616
2892	os	Chdir	{}	{error}	*File	1616
2893	os	Fd	{}	{uintptr}	*File	1616
2894	os	Close	{}	{error}	*File	1616
2895	os	Fd	{}	{uintptr}	*File	1616
2897	os	Stat	{}	{os.FileInfo,error}	*File	1616
2898	os	Stat	{}	{os.FileInfo,error}	*File	1616
2899	os	String	{}	{string}	FileMode	1618
2900	os	IsDir	{}	{bool}	FileMode	1618
2901	os	IsRegular	{}	{bool}	FileMode	1618
2902	os	Perm	{}	{os.FileMode}	FileMode	1618
2903	user	GroupIds	{}	{[]string,error}	*User	1619
2904	user	Error	{}	{string}	UnknownUserIdError	1621
2905	user	Error	{}	{string}	UnknownUserError	1622
2906	user	Error	{}	{string}	UnknownGroupIdError	1623
2907	user	Error	{}	{string}	UnknownGroupError	1624
2908	plugin	Lookup	{string}	{plugin.Symbol,error}	*Plugin	1626
2909	reflect	String	{}	{string}	Kind	1629
2910	reflect	String	{}	{string}	ChanDir	1630
2911	reflect	Get	{string}	{string}	StructTag	1633
2912	reflect	Lookup	{string}	{string,bool}	StructTag	1633
2913	reflect	Addr	{}	{reflect.Value}	Value	1634
2914	reflect	Bool	{}	{bool}	Value	1634
2915	reflect	Bytes	{}	{[]byte}	Value	1634
2916	reflect	CanAddr	{}	{bool}	Value	1634
2917	reflect	CanSet	{}	{bool}	Value	1634
2918	reflect	Call	{[]reflect.Value}	{[]reflect.Value}	Value	1634
2919	reflect	CallSlice	{[]reflect.Value}	{[]reflect.Value}	Value	1634
2920	reflect	Cap	{}	{int}	Value	1634
2921	reflect	Close	{}	{}	Value	1634
2922	reflect	Complex	{}	{complex128}	Value	1634
2923	reflect	Elem	{}	{reflect.Value}	Value	1634
2924	reflect	Field	{int}	{reflect.Value}	Value	1634
2925	reflect	FieldByIndex	{[]int}	{reflect.Value}	Value	1634
2926	reflect	FieldByName	{string}	{reflect.Value}	Value	1634
2927	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.Value}	Value	1634
2928	reflect	Float	{}	{float64}	Value	1634
2929	reflect	Index	{int}	{reflect.Value}	Value	1634
2930	reflect	Int	{}	{int64}	Value	1634
2931	reflect	CanInterface	{}	{bool}	Value	1634
2932	reflect	Interface	{}	{"interface{}"}	Value	1634
2933	reflect	InterfaceData	{}	{[]uintptr}	Value	1634
2934	reflect	IsNil	{}	{bool}	Value	1634
2935	reflect	IsValid	{}	{bool}	Value	1634
2936	reflect	Kind	{}	{reflect.Kind}	Value	1634
2937	reflect	Len	{}	{int}	Value	1634
2938	reflect	MapIndex	{reflect.Value}	{reflect.Value}	Value	1634
2939	reflect	MapKeys	{}	{[]reflect.Value}	Value	1634
2940	reflect	Method	{int}	{reflect.Value}	Value	1634
2941	reflect	NumMethod	{}	{int}	Value	1634
2942	reflect	MethodByName	{string}	{reflect.Value}	Value	1634
2943	reflect	NumField	{}	{int}	Value	1634
2944	reflect	OverflowComplex	{complex128}	{bool}	Value	1634
2945	reflect	OverflowFloat	{float64}	{bool}	Value	1634
2946	reflect	OverflowInt	{int64}	{bool}	Value	1634
2947	reflect	OverflowUint	{uint64}	{bool}	Value	1634
2948	reflect	Pointer	{}	{uintptr}	Value	1634
2949	reflect	Recv	{}	{reflect.Value,bool}	Value	1634
2950	reflect	Send	{reflect.Value}	{}	Value	1634
2951	reflect	Set	{reflect.Value}	{}	Value	1634
2952	reflect	SetBool	{bool}	{}	Value	1634
2953	reflect	SetBytes	{[]byte}	{}	Value	1634
2954	reflect	SetComplex	{complex128}	{}	Value	1634
2955	reflect	SetFloat	{float64}	{}	Value	1634
2956	reflect	SetInt	{int64}	{}	Value	1634
2957	reflect	SetLen	{int}	{}	Value	1634
2958	reflect	SetCap	{int}	{}	Value	1634
2959	reflect	SetMapIndex	{reflect.Value,reflect.Value}	{}	Value	1634
2960	reflect	SetUint	{uint64}	{}	Value	1634
2961	reflect	SetPointer	{unsafe.Pointer}	{}	Value	1634
2962	reflect	SetString	{string}	{}	Value	1634
2963	reflect	Slice	{int,int}	{reflect.Value}	Value	1634
2964	reflect	Slice3	{int,int,int}	{reflect.Value}	Value	1634
2965	reflect	String	{}	{string}	Value	1634
2966	reflect	TryRecv	{}	{reflect.Value,bool}	Value	1634
2967	reflect	TrySend	{reflect.Value}	{bool}	Value	1634
2968	reflect	Type	{}	{reflect.Type}	Value	1634
2969	reflect	Uint	{}	{uint64}	Value	1634
2970	reflect	UnsafeAddr	{}	{uintptr}	Value	1634
2971	reflect	Convert	{reflect.Type}	{reflect.Value}	Value	1634
2972	reflect	Error	{}	{string}	*ValueError	1635
2973	regexp	String	{}	{string}	*Regexp	1640
2974	regexp	Copy	{}	{*regexp.Regexp}	*Regexp	1640
2975	regexp	Longest	{}	{}	*Regexp	1640
2976	regexp	NumSubexp	{}	{int}	*Regexp	1640
2977	regexp	SubexpNames	{}	{[]string}	*Regexp	1640
2978	regexp	LiteralPrefix	{}	{string,bool}	*Regexp	1640
2979	regexp	MatchReader	{io.RuneReader}	{bool}	*Regexp	1640
2980	regexp	MatchString	{string}	{bool}	*Regexp	1640
2981	regexp	Match	{[]byte}	{bool}	*Regexp	1640
2982	regexp	ReplaceAllString	{string,string}	{string}	*Regexp	1640
2983	regexp	ReplaceAllLiteralString	{string,string}	{string}	*Regexp	1640
2984	regexp	ReplaceAllStringFunc	{string,"func(string) string"}	{string}	*Regexp	1640
2985	regexp	ReplaceAll	{[]byte,[]byte}	{[]byte}	*Regexp	1640
2986	regexp	ReplaceAllLiteral	{[]byte,[]byte}	{[]byte}	*Regexp	1640
2987	regexp	ReplaceAllFunc	{[]byte,"func([]byte) []byte"}	{[]byte}	*Regexp	1640
2988	regexp	Find	{[]byte}	{[]byte}	*Regexp	1640
2989	regexp	FindIndex	{[]byte}	{[]int}	*Regexp	1640
2990	regexp	FindString	{string}	{string}	*Regexp	1640
2991	regexp	FindStringIndex	{string}	{[]int}	*Regexp	1640
2992	regexp	FindReaderIndex	{io.RuneReader}	{[]int}	*Regexp	1640
2993	regexp	FindSubmatch	{[]byte}	{[][]byte}	*Regexp	1640
2994	regexp	Expand	{[]byte,[]byte,[]byte,[]int}	{[]byte}	*Regexp	1640
2995	regexp	ExpandString	{[]byte,string,string,[]int}	{[]byte}	*Regexp	1640
2996	regexp	FindSubmatchIndex	{[]byte}	{[]int}	*Regexp	1640
2997	regexp	FindStringSubmatch	{string}	{[]string}	*Regexp	1640
2998	regexp	FindStringSubmatchIndex	{string}	{[]int}	*Regexp	1640
2999	regexp	FindReaderSubmatchIndex	{io.RuneReader}	{[]int}	*Regexp	1640
3000	regexp	FindAll	{[]byte,int}	{[][]byte}	*Regexp	1640
3001	regexp	FindAllIndex	{[]byte,int}	{[][]int}	*Regexp	1640
3002	regexp	FindAllString	{string,int}	{[]string}	*Regexp	1640
3003	regexp	FindAllStringIndex	{string,int}	{[][]int}	*Regexp	1640
3004	regexp	FindAllSubmatch	{[]byte,int}	{[][][]byte}	*Regexp	1640
3005	regexp	FindAllSubmatchIndex	{[]byte,int}	{[][]int}	*Regexp	1640
3006	regexp	FindAllStringSubmatch	{string,int}	{[][]string}	*Regexp	1640
3007	regexp	FindAllStringSubmatchIndex	{string,int}	{[][]int}	*Regexp	1640
3008	regexp	Split	{string,int}	{[]string}	*Regexp	1640
3009	syntax	String	{}	{string}	ErrorCode	1642
3010	syntax	String	{}	{string}	*Prog	1644
3011	syntax	Prefix	{}	{string,bool}	*Prog	1644
3012	syntax	StartCond	{}	{syntax.EmptyOp}	*Prog	1644
3013	syntax	String	{}	{string}	InstOp	1645
3014	syntax	MatchRune	{rune}	{bool}	*Inst	1647
3015	syntax	MatchRunePos	{rune}	{int}	*Inst	1647
3016	syntax	MatchEmptyWidth	{rune,rune}	{bool}	*Inst	1647
3017	syntax	String	{}	{string}	*Inst	1647
3018	syntax	Equal	{*syntax.Regexp}	{bool}	*Regexp	1648
3019	syntax	String	{}	{string}	*Regexp	1648
3020	syntax	MaxCap	{}	{int}	*Regexp	1648
3021	syntax	CapNames	{}	{[]string}	*Regexp	1648
3022	syntax	Simplify	{}	{*syntax.Regexp}	*Regexp	1648
3023	runtime	RuntimeError	{}	{}	*TypeAssertionError	1790
3024	runtime	Error	{}	{string}	*TypeAssertionError	1790
3025	runtime	Stack	{}	{[]uintptr}	*StackRecord	1804
3026	runtime	InUseBytes	{}	{int64}	*MemProfileRecord	1805
3027	runtime	InUseObjects	{}	{int64}	*MemProfileRecord	1805
3028	runtime	Stack	{}	{[]uintptr}	*MemProfileRecord	1805
3029	pprof	Name	{}	{string}	*Profile	1819
3030	pprof	Count	{}	{int}	*Profile	1819
3031	pprof	Add	{"interface{}",int}	{}	*Profile	1819
3032	pprof	Remove	{"interface{}"}	{}	*Profile	1819
3033	pprof	WriteTo	{io.Writer,int}	{error}	*Profile	1819
3034	runtime	Next	{}	{runtime.Frame,bool}	*Frames	1820
3035	runtime	Name	{}	{string}	*Func	1822
3036	runtime	Entry	{}	{uintptr}	*Func	1822
3037	runtime	FileLine	{uintptr}	{string,int}	*Func	1822
3038	sort	Search	{int}	{int}	IntSlice	1824
3039	sort	Len	{}	{int}	IntSlice	1824
3040	sort	Less	{int,int}	{bool}	IntSlice	1824
3041	sort	Swap	{int,int}	{}	IntSlice	1824
3042	sort	Sort	{}	{}	IntSlice	1824
3043	sort	Search	{float64}	{int}	Float64Slice	1825
3044	sort	Len	{}	{int}	Float64Slice	1825
3045	sort	Less	{int,int}	{bool}	Float64Slice	1825
3046	sort	Swap	{int,int}	{}	Float64Slice	1825
3047	sort	Sort	{}	{}	Float64Slice	1825
3048	sort	Search	{string}	{int}	StringSlice	1826
3049	sort	Len	{}	{int}	StringSlice	1826
3050	sort	Less	{int,int}	{bool}	StringSlice	1826
3051	sort	Swap	{int,int}	{}	StringSlice	1826
3052	sort	Sort	{}	{}	StringSlice	1826
3053	strconv	Error	{}	{string}	*NumError	1827
3054	strings	String	{}	{string}	*Builder	1828
3055	strings	Len	{}	{int}	*Builder	1828
3056	strings	Reset	{}	{}	*Builder	1828
3057	strings	Grow	{int}	{}	*Builder	1828
3058	strings	Write	{[]byte}	{int,error}	*Builder	1828
3059	strings	WriteByte	{byte}	{error}	*Builder	1828
3060	strings	WriteRune	{rune}	{int,error}	*Builder	1828
3061	strings	WriteString	{string}	{int,error}	*Builder	1828
3062	strings	Len	{}	{int}	*Reader	1829
3063	strings	Size	{}	{int64}	*Reader	1829
3064	strings	Read	{[]byte}	{int,error}	*Reader	1829
3065	strings	ReadAt	{[]byte,int64}	{int,error}	*Reader	1829
3066	strings	ReadByte	{}	{byte,error}	*Reader	1829
3067	strings	UnreadByte	{}	{error}	*Reader	1829
3068	strings	ReadRune	{}	{rune,int,error}	*Reader	1829
3069	strings	UnreadRune	{}	{error}	*Reader	1829
3070	strings	Seek	{int64,int}	{int64,error}	*Reader	1829
3071	strings	WriteTo	{io.Writer}	{int64,error}	*Reader	1829
3072	strings	Reset	{string}	{}	*Reader	1829
3073	strings	Replace	{string}	{string}	*Replacer	1830
3074	strings	WriteString	{io.Writer,string}	{int,error}	*Replacer	1830
3075	atomic	Load	{}	{"interface{}"}	*Value	1831
3076	atomic	Store	{"interface{}"}	{}	*Value	1831
3077	sync	Wait	{}	{}	*Cond	1832
3078	sync	Signal	{}	{}	*Cond	1832
3079	sync	Broadcast	{}	{}	*Cond	1832
3080	sync	Load	{"interface{}"}	{"interface{}",bool}	*Map	1833
3081	sync	Store	{"interface{}","interface{}"}	{}	*Map	1833
3082	sync	LoadOrStore	{"interface{}","interface{}"}	{"interface{}",bool}	*Map	1833
3083	sync	Delete	{"interface{}"}	{}	*Map	1833
3084	sync	Range	{"func(interface{}) bool"}	{}	*Map	1833
3085	sync	Lock	{}	{}	*Mutex	1834
3086	sync	Unlock	{}	{}	*Mutex	1834
3087	sync	Do	{func()}	{}	*Once	1836
3088	sync	Put	{"interface{}"}	{}	*Pool	1837
3089	sync	Get	{}	{"interface{}"}	*Pool	1837
3090	sync	RLock	{}	{}	*RWMutex	1838
3091	sync	RUnlock	{}	{}	*RWMutex	1838
3092	sync	Lock	{}	{}	*RWMutex	1838
3093	sync	Unlock	{}	{}	*RWMutex	1838
3094	sync	RLocker	{}	{sync.Locker}	*RWMutex	1838
3095	sync	Add	{int}	{}	*WaitGroup	1839
3096	sync	Done	{}	{}	*WaitGroup	1839
3097	sync	Wait	{}	{}	*WaitGroup	1839
3098	syscall	Null	{}	{}	*Dir	1841
3099	syscall	Marshal	{[]byte}	{int,error}	*Dir	1841
3100	syscall	Error	{}	{string}	*DLLError	1842
3172	syscall	TrapCause	{}	{int}	WaitStatus	1894
3101	syscall	FindProc	{string}	{*syscall.Proc,error}	*DLL	1843
3102	syscall	MustFindProc	{string}	{*syscall.Proc}	*DLL	1843
3103	syscall	Release	{}	{error}	*DLL	1843
3104	syscall	Addr	{}	{uintptr}	*Proc	1844
3105	syscall	Call	{...uintptr}	{uintptr,error}	*Proc	1844
3106	syscall	Load	{}	{error}	*LazyDLL	1845
3107	syscall	Handle	{}	{uintptr}	*LazyDLL	1845
3108	syscall	NewProc	{string}	{*syscall.LazyProc}	*LazyDLL	1845
3109	syscall	Find	{}	{error}	*LazyProc	1846
3110	syscall	Addr	{}	{uintptr}	*LazyProc	1846
3111	syscall	Call	{...uintptr}	{uintptr,error}	*LazyProc	1846
3112	main	BoolTmpVarCode	{}	{string}	*Param	1857
3113	main	SliceTmpVarCode	{}	{string}	*Param	1857
3114	main	StringTmpVarCode	{}	{string}	*Param	1857
3115	main	TmpVarCode	{}	{string}	*Param	1857
3116	main	TmpVarHelperCode	{}	{string}	*Param	1857
3117	main	SyscallArgList	{}	{[]string}	*Param	1857
3118	main	IsError	{}	{bool}	*Param	1857
3119	main	HelperType	{}	{string}	*Param	1857
3120	main	ErrorVarName	{}	{string}	*Rets	1858
3121	main	ToParams	{}	{[]*main.Param}	*Rets	1858
3122	main	List	{}	{string}	*Rets	1858
3123	main	PrintList	{}	{string}	*Rets	1858
3124	main	SetReturnValuesCode	{}	{string}	*Rets	1858
3125	main	SetErrorCode	{}	{string}	*Rets	1858
3126	main	DLLName	{}	{string}	*Fn	1859
3127	main	DLLFuncName	{}	{string}	*Fn	1859
3128	main	ParamList	{}	{string}	*Fn	1859
3129	main	HelperParamList	{}	{string}	*Fn	1859
3130	main	ParamPrintList	{}	{string}	*Fn	1859
3131	main	ParamCount	{}	{int}	*Fn	1859
3132	main	SyscallParamCount	{}	{int}	*Fn	1859
3133	main	Syscall	{}	{string}	*Fn	1859
3134	main	SyscallParamList	{}	{string}	*Fn	1859
3135	main	HelperCallParamList	{}	{string}	*Fn	1859
3136	main	IsUTF16	{}	{bool}	*Fn	1859
3137	main	StrconvFunc	{}	{string}	*Fn	1859
3138	main	StrconvType	{}	{string}	*Fn	1859
3139	main	HasStringParam	{}	{bool}	*Fn	1859
3140	main	HelperName	{}	{string}	*Fn	1859
3141	main	Import	{string}	{}	*Source	1860
3142	main	ExternalImport	{string}	{}	*Source	1860
3143	main	DLLs	{}	{[]string}	*Source	1860
3144	main	ParseFile	{string}	{error}	*Source	1860
3145	main	IsStdRepo	{}	{bool,error}	*Source	1860
3146	main	Generate	{io.Writer}	{error}	*Source	1860
3147	syscall	String	{}	{string,error}	*SID	1888
3148	syscall	Len	{}	{int}	*SID	1888
3149	syscall	Copy	{}	{*syscall.SID,error}	*SID	1888
3150	syscall	LookupAccount	{string}	{string,uint32,error}	*SID	1888
3151	syscall	Close	{}	{error}	Token	1892
3152	syscall	GetTokenUser	{}	{*syscall.Tokenuser,error}	Token	1892
3153	syscall	GetTokenPrimaryGroup	{}	{*syscall.Tokenprimarygroup,error}	Token	1892
3154	syscall	GetUserProfileDirectory	{}	{string,error}	Token	1892
3155	syscall	Exited	{}	{bool}	WaitStatus	1894
3156	syscall	ExitStatus	{}	{int}	WaitStatus	1894
3157	syscall	Signaled	{}	{bool}	WaitStatus	1894
3158	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1894
3159	syscall	CoreDump	{}	{bool}	WaitStatus	1894
3160	syscall	Stopped	{}	{bool}	WaitStatus	1894
3161	syscall	Continued	{}	{bool}	WaitStatus	1894
3162	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1894
3163	syscall	TrapCause	{}	{int}	WaitStatus	1894
3164	syscall	Exited	{}	{bool}	WaitStatus	1894
3165	syscall	Signaled	{}	{bool}	WaitStatus	1894
3166	syscall	Stopped	{}	{bool}	WaitStatus	1894
3167	syscall	Continued	{}	{bool}	WaitStatus	1894
3168	syscall	CoreDump	{}	{bool}	WaitStatus	1894
3169	syscall	ExitStatus	{}	{int}	WaitStatus	1894
3170	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1894
3171	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1894
3173	syscall	Exited	{}	{bool}	WaitStatus	1894
3174	syscall	ExitStatus	{}	{int}	WaitStatus	1894
3175	syscall	Signaled	{}	{bool}	WaitStatus	1894
3176	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1894
3177	syscall	CoreDump	{}	{bool}	WaitStatus	1894
3178	syscall	Stopped	{}	{bool}	WaitStatus	1894
3179	syscall	Continued	{}	{bool}	WaitStatus	1894
3180	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1894
3181	syscall	TrapCause	{}	{int}	WaitStatus	1894
3182	syscall	Exited	{}	{bool}	WaitStatus	1894
3183	syscall	ExitStatus	{}	{int}	WaitStatus	1894
3184	syscall	Signaled	{}	{bool}	WaitStatus	1894
3185	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1894
3186	syscall	CoreDump	{}	{bool}	WaitStatus	1894
3187	syscall	Stopped	{}	{bool}	WaitStatus	1894
3188	syscall	Continued	{}	{bool}	WaitStatus	1894
3189	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1894
3190	syscall	TrapCause	{}	{int}	WaitStatus	1894
3191	syscall	Exited	{}	{bool}	WaitStatus	1894
3192	syscall	ExitStatus	{}	{int}	WaitStatus	1894
3193	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1894
3194	syscall	CoreDump	{}	{bool}	WaitStatus	1894
3195	syscall	Stopped	{}	{bool}	WaitStatus	1894
3196	syscall	Continued	{}	{bool}	WaitStatus	1894
3197	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1894
3198	syscall	Signaled	{}	{bool}	WaitStatus	1894
3199	syscall	TrapCause	{}	{int}	WaitStatus	1894
3200	syscall	Error	{}	{string}	Errno	1902
3201	syscall	Temporary	{}	{bool}	Errno	1902
3202	syscall	Timeout	{}	{bool}	Errno	1902
3203	syscall	Error	{}	{string}	Errno	1902
3204	syscall	Temporary	{}	{bool}	Errno	1902
3205	syscall	Timeout	{}	{bool}	Errno	1902
3206	syscall	Error	{}	{string}	Errno	1902
3207	syscall	Temporary	{}	{bool}	Errno	1902
3208	syscall	Timeout	{}	{bool}	Errno	1902
3209	syscall	Signal	{}	{}	Signal	1903
3210	syscall	String	{}	{string}	Signal	1903
3211	syscall	Signal	{}	{}	Signal	1903
3212	syscall	String	{}	{string}	Signal	1903
3213	syscall	Signal	{}	{}	Signal	1903
3214	syscall	String	{}	{string}	Signal	1903
3215	syscall	SetLen	{int}	{}	*Iovec	1909
3216	syscall	SetLen	{int}	{}	*Iovec	1909
3217	syscall	SetLen	{int}	{}	*Iovec	1909
3218	syscall	SetLen	{int}	{}	*Iovec	1909
3219	syscall	SetLen	{int}	{}	*Iovec	1909
3220	syscall	SetLen	{int}	{}	*Iovec	1909
3221	syscall	SetLen	{int}	{}	*Iovec	1909
3222	syscall	SetLen	{int}	{}	*Iovec	1909
3223	syscall	SetLen	{int}	{}	*Iovec	1909
3224	syscall	SetLen	{int}	{}	*Iovec	1909
3225	syscall	SetLen	{int}	{}	*Iovec	1909
3226	syscall	SetLen	{int}	{}	*Iovec	1909
3227	syscall	SetLen	{int}	{}	*Iovec	1909
3228	syscall	SetLen	{int}	{}	*Iovec	1909
3229	syscall	SetLen	{int}	{}	*Iovec	1909
3230	syscall	SetLen	{int}	{}	*Iovec	1909
3231	syscall	SetLen	{int}	{}	*Iovec	1909
3232	syscall	SetLen	{int}	{}	*Iovec	1909
3233	syscall	SetLen	{int}	{}	*Iovec	1909
3234	syscall	SetLen	{int}	{}	*Iovec	1909
3235	syscall	SetLen	{int}	{}	*Iovec	1909
3236	syscall	SetLen	{int}	{}	*Iovec	1909
3237	syscall	SetLen	{int}	{}	*Iovec	1909
3238	syscall	Unix	{}	{int64,int64}	*Timespec	1910
3239	syscall	Nano	{}	{int64}	*Timespec	1910
3240	syscall	Unix	{}	{int64,int64}	*Timeval	1911
3241	syscall	Nano	{}	{int64}	*Timeval	1911
3242	syscall	Nanoseconds	{}	{int64}	*Timeval	1911
3243	syscall	Error	{}	{string}	ErrorString	1918
3244	syscall	Temporary	{}	{bool}	ErrorString	1918
3245	syscall	Timeout	{}	{bool}	ErrorString	1918
3246	syscall	Signal	{}	{}	Note	1919
3247	syscall	String	{}	{string}	Note	1919
3248	syscall	Exited	{}	{bool}	Waitmsg	1920
3249	syscall	Signaled	{}	{bool}	Waitmsg	1920
3250	syscall	ExitStatus	{}	{int}	Waitmsg	1920
3251	syscall	Sockaddr	{}	{syscall.Sockaddr,error}	*RawSockaddrAny	1936
3252	syscall	SetControllen	{int}	{}	*Msghdr	1972
3253	syscall	SetControllen	{int}	{}	*Msghdr	1972
3254	syscall	SetControllen	{int}	{}	*Msghdr	1972
3255	syscall	SetControllen	{int}	{}	*Msghdr	1972
3256	syscall	SetControllen	{int}	{}	*Msghdr	1972
3257	syscall	SetControllen	{int}	{}	*Msghdr	1972
3258	syscall	SetControllen	{int}	{}	*Msghdr	1972
3259	syscall	SetControllen	{int}	{}	*Msghdr	1972
3260	syscall	SetControllen	{int}	{}	*Msghdr	1972
3261	syscall	SetControllen	{int}	{}	*Msghdr	1972
3262	syscall	SetControllen	{int}	{}	*Msghdr	1972
3263	syscall	SetControllen	{int}	{}	*Msghdr	1972
3264	syscall	SetControllen	{int}	{}	*Msghdr	1972
3265	syscall	SetControllen	{int}	{}	*Msghdr	1972
3266	syscall	SetControllen	{int}	{}	*Msghdr	1972
3267	syscall	SetControllen	{int}	{}	*Msghdr	1972
3268	syscall	SetControllen	{int}	{}	*Msghdr	1972
3269	syscall	SetControllen	{int}	{}	*Msghdr	1972
3270	syscall	SetControllen	{int}	{}	*Msghdr	1972
3271	syscall	SetControllen	{int}	{}	*Msghdr	1972
3272	syscall	SetControllen	{int}	{}	*Msghdr	1972
3273	syscall	SetControllen	{int}	{}	*Msghdr	1972
3274	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3275	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3276	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3277	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3278	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3279	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3280	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3281	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3282	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3283	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3284	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3285	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3286	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3287	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3288	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3289	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3290	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3291	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3292	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3293	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3294	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3295	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3296	syscall	SetLen	{int}	{}	*Cmsghdr	1973
3297	syscall	PC	{}	{uint64}	*PtraceRegs	2119
3298	syscall	SetPC	{uint64}	{}	*PtraceRegs	2119
3299	syscall	PC	{}	{uint64}	*PtraceRegs	2119
3300	syscall	SetPC	{uint64}	{}	*PtraceRegs	2119
3301	syscall	PC	{}	{uint64}	*PtraceRegs	2119
3302	syscall	SetPC	{uint64}	{}	*PtraceRegs	2119
3303	syscall	PC	{}	{uint64}	*PtraceRegs	2119
3304	syscall	SetPC	{uint64}	{}	*PtraceRegs	2119
3305	syscall	PC	{}	{uint64}	*PtraceRegs	2119
3306	syscall	SetPC	{uint64}	{}	*PtraceRegs	2119
3307	syscall	PC	{}	{uint64}	*PtraceRegs	2119
3308	syscall	SetPC	{uint64}	{}	*PtraceRegs	2119
3309	syscall	PC	{}	{uint64}	*PtraceRegs	2119
3310	syscall	SetPC	{uint64}	{}	*PtraceRegs	2119
3311	syscall	PC	{}	{uint64}	*PtraceRegs	2119
3312	syscall	SetPC	{uint64}	{}	*PtraceRegs	2119
3313	syscall	Nanoseconds	{}	{int64}	*Filetime	2247
3314	testing	Next	{}	{bool}	*PB	3495
3315	testdeps	MatchString	{string,string}	{bool,error}	TestDeps	3499
3316	testdeps	StartCPUProfile	{io.Writer}	{error}	TestDeps	3499
3317	testdeps	StopCPUProfile	{}	{}	TestDeps	3499
3318	testdeps	WriteHeapProfile	{io.Writer}	{error}	TestDeps	3499
3319	testdeps	WriteProfileTo	{string,io.Writer,int}	{error}	TestDeps	3499
3320	testdeps	ImportPath	{}	{string}	TestDeps	3499
3321	testdeps	StartTestLog	{io.Writer}	{}	TestDeps	3499
3322	testdeps	StopTestLog	{}	{error}	TestDeps	3499
3323	quick	Error	{}	{string}	SetupError	3502
3324	quick	Error	{}	{string}	*CheckError	3503
3325	quick	Error	{}	{string}	*CheckEqualError	3504
3326	testing	Run	{}	{int}	*M	3508
3327	scanner	IsValid	{}	{bool}	*Position	3509
3328	scanner	String	{}	{string}	Position	3509
3329	tabwriter	Init	{io.Writer,int,int,int,byte,uint}	{*tabwriter.Writer}	*Writer	3511
3330	tabwriter	Flush	{}	{error}	*Writer	3511
3331	tabwriter	Write	{[]byte}	{int,error}	*Writer	3511
3332	template	Error	{}	{string}	ExecError	3512
3333	parse	Type	{}	{parse.NodeType}	NodeType	3515
3334	parse	Position	{}	{parse.Pos}	Pos	3516
3335	parse	String	{}	{string}	*ListNode	3517
3336	parse	CopyList	{}	{*parse.ListNode}	*ListNode	3517
3337	parse	Copy	{}	{parse.Node}	*ListNode	3517
3338	parse	String	{}	{string}	*TextNode	3518
3339	parse	Copy	{}	{parse.Node}	*TextNode	3518
3340	parse	String	{}	{string}	*PipeNode	3519
3341	parse	CopyPipe	{}	{*parse.PipeNode}	*PipeNode	3519
3342	parse	Copy	{}	{parse.Node}	*PipeNode	3519
3343	parse	String	{}	{string}	*ActionNode	3520
3344	parse	Copy	{}	{parse.Node}	*ActionNode	3520
3345	parse	String	{}	{string}	*CommandNode	3521
3346	parse	Copy	{}	{parse.Node}	*CommandNode	3521
3347	parse	SetPos	{parse.Pos}	{*parse.IdentifierNode}	*IdentifierNode	3522
3348	parse	SetTree	{*parse.Tree}	{*parse.IdentifierNode}	*IdentifierNode	3522
3349	parse	String	{}	{string}	*IdentifierNode	3522
3350	parse	Copy	{}	{parse.Node}	*IdentifierNode	3522
3351	parse	String	{}	{string}	*VariableNode	3523
3352	parse	Copy	{}	{parse.Node}	*VariableNode	3523
3353	parse	Type	{}	{parse.NodeType}	*DotNode	3524
3354	parse	String	{}	{string}	*DotNode	3524
3355	parse	Copy	{}	{parse.Node}	*DotNode	3524
3356	parse	Type	{}	{parse.NodeType}	*NilNode	3525
3357	parse	String	{}	{string}	*NilNode	3525
3358	parse	Copy	{}	{parse.Node}	*NilNode	3525
3359	parse	String	{}	{string}	*FieldNode	3526
3360	parse	Copy	{}	{parse.Node}	*FieldNode	3526
3361	parse	Add	{string}	{}	*ChainNode	3527
3362	parse	String	{}	{string}	*ChainNode	3527
3363	parse	Copy	{}	{parse.Node}	*ChainNode	3527
3364	parse	String	{}	{string}	*BoolNode	3528
3365	parse	Copy	{}	{parse.Node}	*BoolNode	3528
3366	parse	String	{}	{string}	*NumberNode	3529
3367	parse	Copy	{}	{parse.Node}	*NumberNode	3529
3368	parse	String	{}	{string}	*StringNode	3530
3369	parse	Copy	{}	{parse.Node}	*StringNode	3530
3370	parse	String	{}	{string}	*BranchNode	3531
3371	parse	Copy	{}	{parse.Node}	*BranchNode	3531
3372	parse	Copy	{}	{parse.Node}	*IfNode	3532
3373	parse	Copy	{}	{parse.Node}	*RangeNode	3533
3374	parse	Copy	{}	{parse.Node}	*WithNode	3534
3375	parse	String	{}	{string}	*TemplateNode	3535
3376	parse	Copy	{}	{parse.Node}	*TemplateNode	3535
3377	parse	Copy	{}	{*parse.Tree}	*Tree	3536
3378	parse	ErrorContext	{parse.Node}	{string}	*Tree	3536
3379	parse	Parse	{string,string,string,map[string]*parse.Tree,"...map[string]interface{}"}	{*parse.Tree,error}	*Tree	3536
3380	time	Error	{}	{string}	*ParseError	3538
3381	time	Stop	{}	{bool}	*Timer	3541
3382	time	Reset	{time.Duration}	{bool}	*Timer	3541
3383	time	Stop	{}	{}	*Ticker	3542
3384	time	String	{}	{string}	Time	3543
3385	time	Format	{string}	{string}	Time	3543
3386	time	AppendFormat	{[]byte,string}	{[]byte}	Time	3543
3387	time	After	{time.Time}	{bool}	Time	3543
3388	time	Before	{time.Time}	{bool}	Time	3543
3389	time	Equal	{time.Time}	{bool}	Time	3543
3390	time	IsZero	{}	{bool}	Time	3543
3391	time	Date	{}	{int,time.Month,int}	Time	3543
3392	time	Year	{}	{int}	Time	3543
3393	time	Month	{}	{time.Month}	Time	3543
3394	time	Day	{}	{int}	Time	3543
3395	time	Weekday	{}	{time.Weekday}	Time	3543
3396	time	ISOWeek	{}	{int}	Time	3543
3397	time	Clock	{}	{int}	Time	3543
3398	time	Hour	{}	{int}	Time	3543
3399	time	Minute	{}	{int}	Time	3543
3400	time	Second	{}	{int}	Time	3543
3401	time	Nanosecond	{}	{int}	Time	3543
3402	time	YearDay	{}	{int}	Time	3543
3403	time	Add	{time.Duration}	{time.Time}	Time	3543
3404	time	Sub	{time.Time}	{time.Duration}	Time	3543
3405	time	AddDate	{int,int,int}	{time.Time}	Time	3543
3406	time	UTC	{}	{time.Time}	Time	3543
3407	time	Local	{}	{time.Time}	Time	3543
3408	time	In	{*time.Location}	{time.Time}	Time	3543
3409	time	Location	{}	{*time.Location}	Time	3543
3410	time	Zone	{}	{string,int}	Time	3543
3411	time	Unix	{}	{int64}	Time	3543
3412	time	UnixNano	{}	{int64}	Time	3543
3413	time	MarshalBinary	{}	{[]byte,error}	Time	3543
3414	time	UnmarshalBinary	{[]byte}	{error}	*Time	3543
3415	time	GobEncode	{}	{[]byte,error}	Time	3543
3416	time	GobDecode	{[]byte}	{error}	*Time	3543
3417	time	MarshalJSON	{}	{[]byte,error}	Time	3543
3418	time	UnmarshalJSON	{[]byte}	{error}	*Time	3543
3419	time	MarshalText	{}	{[]byte,error}	Time	3543
3420	time	UnmarshalText	{[]byte}	{error}	*Time	3543
3421	time	Truncate	{time.Duration}	{time.Time}	Time	3543
3422	time	Round	{time.Duration}	{time.Time}	Time	3543
3423	time	String	{}	{string}	Month	3544
3424	time	String	{}	{string}	Weekday	3545
3425	time	String	{}	{string}	Duration	3546
3426	time	Nanoseconds	{}	{int64}	Duration	3546
3427	time	Seconds	{}	{float64}	Duration	3546
3428	time	Minutes	{}	{float64}	Duration	3546
3429	time	Hours	{}	{float64}	Duration	3546
3430	time	Truncate	{time.Duration}	{time.Duration}	Duration	3546
3431	time	Round	{time.Duration}	{time.Duration}	Duration	3546
3432	time	String	{}	{string}	*Location	3547
3433	unicode	ToUpper	{rune}	{rune}	SpecialCase	3552
3434	unicode	ToTitle	{rune}	{rune}	SpecialCase	3552
3435	unicode	ToLower	{rune}	{rune}	SpecialCase	3552
3436	asn1	Constructed	{}	{asn1.Tag}	Tag	3559
3437	asn1	ContextSpecific	{}	{asn1.Tag}	Tag	3559
3438	cryptobyte	AddASN1Int64	{int64}	{}	*Builder	3560
3439	cryptobyte	AddASN1Enum	{int64}	{}	*Builder	3560
3440	cryptobyte	AddASN1Uint64	{uint64}	{}	*Builder	3560
3441	cryptobyte	AddASN1BigInt	{*big.Int}	{}	*Builder	3560
3442	cryptobyte	AddASN1OctetString	{[]byte}	{}	*Builder	3560
3443	cryptobyte	AddASN1GeneralizedTime	{time.Time}	{}	*Builder	3560
3444	cryptobyte	AddASN1BitString	{[]byte}	{}	*Builder	3560
3445	cryptobyte	AddASN1ObjectIdentifier	{encoding_asn1.ObjectIdentifier}	{}	*Builder	3560
3446	cryptobyte	AddASN1Boolean	{bool}	{}	*Builder	3560
3447	cryptobyte	AddASN1NULL	{}	{}	*Builder	3560
3448	cryptobyte	MarshalASN1	{"interface{}"}	{}	*Builder	3560
3449	cryptobyte	AddASN1	{asn1.Tag,cryptobyte.BuilderContinuation}	{}	*Builder	3560
3450	cryptobyte	Bytes	{}	{[]byte,error}	*Builder	3560
3451	cryptobyte	BytesOrPanic	{}	{[]byte}	*Builder	3560
3452	cryptobyte	AddUint8	{uint8}	{}	*Builder	3560
3453	cryptobyte	AddUint16	{uint16}	{}	*Builder	3560
3454	cryptobyte	AddUint24	{uint32}	{}	*Builder	3560
3455	cryptobyte	AddUint32	{uint32}	{}	*Builder	3560
3456	cryptobyte	AddBytes	{[]byte}	{}	*Builder	3560
3457	cryptobyte	AddUint8LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	3560
3458	cryptobyte	AddUint16LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	3560
3459	cryptobyte	AddUint24LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	3560
3460	cryptobyte	AddUint32LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	3560
3461	cryptobyte	AddValue	{cryptobyte.MarshalingValue}	{}	*Builder	3560
3462	cryptobyte	ReadASN1Boolean	{*bool}	{bool}	*String	3564
3463	cryptobyte	ReadASN1Integer	{"interface{}"}	{bool}	*String	3564
3464	cryptobyte	ReadASN1Enum	{*int}	{bool}	*String	3564
3465	cryptobyte	ReadASN1ObjectIdentifier	{*encoding_asn1.ObjectIdentifier}	{bool}	*String	3564
3466	cryptobyte	ReadASN1GeneralizedTime	{*time.Time}	{bool}	*String	3564
3467	cryptobyte	ReadASN1BitString	{*encoding_asn1.BitString}	{bool}	*String	3564
3468	cryptobyte	ReadASN1BitStringAsBytes	{*[]byte}	{bool}	*String	3564
3469	cryptobyte	ReadASN1Bytes	{*[]byte,asn1.Tag}	{bool}	*String	3564
3470	cryptobyte	ReadASN1	{*cryptobyte.String,asn1.Tag}	{bool}	*String	3564
3471	cryptobyte	ReadASN1Element	{*cryptobyte.String,asn1.Tag}	{bool}	*String	3564
3472	cryptobyte	ReadAnyASN1	{*cryptobyte.String,*asn1.Tag}	{bool}	*String	3564
3473	cryptobyte	ReadAnyASN1Element	{*cryptobyte.String,*asn1.Tag}	{bool}	*String	3564
3474	cryptobyte	PeekASN1Tag	{asn1.Tag}	{bool}	String	3564
3475	cryptobyte	SkipASN1	{asn1.Tag}	{bool}	*String	3564
3476	cryptobyte	ReadOptionalASN1	{*cryptobyte.String,*bool,asn1.Tag}	{bool}	*String	3564
3477	cryptobyte	SkipOptionalASN1	{asn1.Tag}	{bool}	*String	3564
3478	cryptobyte	ReadOptionalASN1Integer	{"interface{}",asn1.Tag,"interface{}"}	{bool}	*String	3564
3479	cryptobyte	ReadOptionalASN1OctetString	{*[]byte,*bool,asn1.Tag}	{bool}	*String	3564
3480	cryptobyte	ReadOptionalASN1Boolean	{*bool,bool}	{bool}	*String	3564
3481	cryptobyte	Skip	{int}	{bool}	*String	3564
3482	cryptobyte	ReadUint8	{*uint8}	{bool}	*String	3564
3483	cryptobyte	ReadUint16	{*uint16}	{bool}	*String	3564
3484	cryptobyte	ReadUint24	{*uint32}	{bool}	*String	3564
3485	cryptobyte	ReadUint32	{*uint32}	{bool}	*String	3564
3486	cryptobyte	ReadUint8LengthPrefixed	{*cryptobyte.String}	{bool}	*String	3564
3487	cryptobyte	ReadUint16LengthPrefixed	{*cryptobyte.String}	{bool}	*String	3564
3488	cryptobyte	ReadUint24LengthPrefixed	{*cryptobyte.String}	{bool}	*String	3564
3489	cryptobyte	ReadBytes	{*[]byte,int}	{bool}	*String	3564
3490	cryptobyte	CopyBytes	{[]byte}	{bool}	*String	3564
3491	cryptobyte	Empty	{}	{bool}	String	3564
3492	hpack	WriteField	{hpack.HeaderField}	{error}	*Encoder	3565
3493	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Encoder	3565
3494	hpack	SetMaxDynamicTableSizeLimit	{uint32}	{}	*Encoder	3565
3495	hpack	Error	{}	{string}	DecodingError	3566
3496	hpack	Error	{}	{string}	InvalidIndexError	3567
3497	hpack	IsPseudo	{}	{bool}	HeaderField	3568
3498	hpack	String	{}	{string}	HeaderField	3568
3499	hpack	Size	{}	{uint32}	HeaderField	3568
3500	hpack	SetMaxStringLength	{int}	{}	*Decoder	3569
3501	hpack	SetEmitFunc	{func(hpack.HeaderField)}	{}	*Decoder	3569
3502	hpack	SetEmitEnabled	{bool}	{}	*Decoder	3569
3503	hpack	EmitEnabled	{}	{bool}	*Decoder	3569
3504	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Decoder	3569
3505	hpack	SetAllowedMaxDynamicTableSize	{uint32}	{}	*Decoder	3569
3506	hpack	DecodeFull	{[]byte}	{[]hpack.HeaderField,error}	*Decoder	3569
3507	hpack	Close	{}	{error}	*Decoder	3569
3508	hpack	Write	{[]byte}	{int,error}	*Decoder	3569
3509	idna	ToASCII	{string}	{string,error}	*Profile	3571
3510	idna	ToUnicode	{string}	{string,error}	*Profile	3571
3511	idna	String	{}	{string}	*Profile	3571
3512	lif	Family	{}	{int}	*Inet4Addr	3573
3513	lif	Family	{}	{int}	*Inet6Addr	3574
3514	proxy	Dial	{string,string}	{net.Conn,error}	*PerHost	3577
3515	proxy	AddFromString	{string}	{}	*PerHost	3577
3516	proxy	AddIP	{net.IP}	{}	*PerHost	3577
3517	proxy	AddNetwork	{*net.IPNet}	{}	*PerHost	3577
3518	proxy	AddZone	{string}	{}	*PerHost	3577
3519	proxy	AddHost	{string}	{}	*PerHost	3577
3520	route	Family	{}	{int}	*LinkAddr	3581
3521	route	Family	{}	{int}	*Inet4Addr	3582
3522	route	Family	{}	{int}	*Inet6Addr	3583
3523	route	Family	{}	{int}	*DefaultAddr	3584
3524	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3585
3525	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3585
3526	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3585
3527	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3585
3528	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3585
3529	route	Sys	{}	{[]route.Sys}	*InterfaceAddrMessage	3586
3530	route	Sys	{}	{[]route.Sys}	*InterfaceMulticastAddrMessage	3587
3531	route	Sys	{}	{[]route.Sys}	*InterfaceAnnounceMessage	3588
3532	route	Marshal	{}	{[]byte,error}	*RouteMessage	3592
3533	route	Sys	{}	{[]route.Sys}	*RouteMessage	3592
3534	route	Sys	{}	{[]route.Sys}	*RouteMessage	3592
3535	route	Sys	{}	{[]route.Sys}	*RouteMessage	3592
3536	route	Sys	{}	{[]route.Sys}	*RouteMessage	3592
3537	route	Sys	{}	{[]route.Sys}	*RouteMessage	3592
3538	route	SysType	{}	{route.SysType}	*RouteMetrics	3594
3539	route	SysType	{}	{route.SysType}	*RouteMetrics	3594
3540	route	SysType	{}	{route.SysType}	*RouteMetrics	3594
3541	route	SysType	{}	{route.SysType}	*RouteMetrics	3594
3542	route	SysType	{}	{route.SysType}	*RouteMetrics	3594
3543	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3595
3544	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3595
3545	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3595
3546	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3595
3547	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3595
3548	bidirule	Reset	{}	{}	*Transformer	3604
3549	bidirule	Transform	{[]byte,[]byte,bool}	{int,error}	*Transformer	3604
3550	bidirule	Span	{[]byte,bool}	{int,error}	*Transformer	3604
3551	transform	Reset	{}	{}	NopResetter	3607
3552	transform	Read	{[]byte}	{int,error}	*Reader	3608
3553	transform	Write	{[]byte}	{int,error}	*Writer	3609
3554	transform	Close	{}	{error}	*Writer	3609
3555	bidi	SetBytes	{[]byte,...bidi.Option}	{int,error}	*Paragraph	3612
3556	bidi	SetString	{string,...bidi.Option}	{int,error}	*Paragraph	3612
3557	bidi	IsLeftToRight	{}	{bool}	*Paragraph	3612
3558	bidi	Direction	{}	{bidi.Direction}	*Paragraph	3612
3559	bidi	RunAt	{int}	{bidi.Run}	*Paragraph	3612
3560	bidi	Order	{}	{bidi.Ordering,error}	*Paragraph	3612
3561	bidi	Line	{int,int}	{bidi.Ordering,error}	*Paragraph	3612
3562	bidi	Direction	{}	{bidi.Direction}	*Ordering	3613
3563	bidi	NumRuns	{}	{int}	*Ordering	3613
3564	bidi	Run	{int}	{bidi.Run}	*Ordering	3613
3565	bidi	String	{}	{string}	*Run	3614
3566	bidi	Bytes	{}	{[]byte}	*Run	3614
3567	bidi	Direction	{}	{bidi.Direction}	*Run	3614
3568	bidi	Pos	{}	{int}	*Run	3614
3569	bidi	Class	{}	{bidi.Class}	Properties	3615
3570	bidi	IsBracket	{}	{bool}	Properties	3615
3571	bidi	IsOpeningBracket	{}	{bool}	Properties	3615
3572	norm	BoundaryBefore	{}	{bool}	Properties	3617
3573	norm	BoundaryAfter	{}	{bool}	Properties	3617
3574	norm	Decomposition	{}	{[]byte}	Properties	3617
3575	norm	Size	{}	{int}	Properties	3617
3576	norm	CCC	{}	{uint8}	Properties	3617
3577	norm	LeadCCC	{}	{uint8}	Properties	3617
3578	norm	TrailCCC	{}	{uint8}	Properties	3617
3579	norm	Init	{norm.Form,[]byte}	{}	*Iter	3618
3580	norm	InitString	{norm.Form,string}	{}	*Iter	3618
3581	norm	Seek	{int64,int}	{int64,error}	*Iter	3618
3582	norm	Pos	{}	{int}	*Iter	3618
3583	norm	Done	{}	{bool}	*Iter	3618
3584	norm	Next	{}	{[]byte}	*Iter	3618
3585	norm	Properties	{[]byte}	{norm.Properties}	Form	3619
3586	norm	PropertiesString	{string}	{norm.Properties}	Form	3619
3587	norm	Bytes	{[]byte}	{[]byte}	Form	3619
3588	norm	String	{string}	{string}	Form	3619
3589	norm	IsNormal	{[]byte}	{bool}	Form	3619
3590	norm	IsNormalString	{string}	{bool}	Form	3619
3591	norm	Append	{[]byte,...byte}	{[]byte}	Form	3619
3592	norm	AppendString	{[]byte,string}	{[]byte}	Form	3619
3593	norm	QuickSpan	{[]byte}	{int}	Form	3619
3594	norm	Span	{[]byte,bool}	{int,error}	Form	3619
3595	norm	SpanString	{string,bool}	{int,error}	Form	3619
3596	norm	QuickSpanString	{string}	{int}	Form	3619
3597	norm	FirstBoundary	{[]byte}	{int}	Form	3619
3598	norm	FirstBoundaryInString	{string}	{int}	Form	3619
3599	norm	NextBoundary	{[]byte,bool}	{int}	Form	3619
3600	norm	NextBoundaryInString	{string,bool}	{int}	Form	3619
3601	norm	LastBoundary	{[]byte}	{int}	Form	3619
3602	norm	Writer	{io.Writer}	{io.WriteCloser}	Form	3619
3603	norm	Reader	{io.Reader}	{io.Reader}	Form	3619
3604	norm	Reset	{}	{}	Form	3619
3605	norm	Transform	{[]byte,[]byte,bool}	{int,error}	Form	3619
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
25	p1	MyInt	int
26	p1	Time	struct
27	p1	S	struct
28	p1	URL	struct
29	p1	EmbedURLPtr	struct
30	p1	S2	struct
31	p1	Namer	
32	p1	I	
33	p1	Public	
34	p1	Private	
35	p1	Error	
36	p1	Codec	struct
37	p1	SI	struct
38	p1	T	struct
39	p1	B	struct
40	p1	TPtrUnexported	struct
41	p1	TPtrExported	struct
42	p1	FuncType	func(int, string) (*p1.B, error)
43	p1	Embedded	struct
44	p1	EmbedSelector	struct
45	p1	ByteStruct	struct
46	p2	Twoer	
47	p3	ThirdBase	struct
48	arch	Arch	struct
49	asm	Parser	struct
50	asm	Patch	struct
51	flags	MultiFlag	[]string
52	lex	Input	struct
53	lex	ScanToken	rune
54	lex	TokenReader	
55	lex	Token	struct
56	lex	Macro	struct
57	lex	Slice	struct
58	lex	Stack	struct
59	lex	Tokenizer	struct
60	main	Package	struct
61	main	File	struct
62	main	Call	struct
63	main	Ref	struct
64	main	Name	struct
65	main	ExpFunc	struct
66	main	TypeRepr	struct
67	main	Type	struct
68	main	FuncType	struct
69	gc	AlgKind	int
70	gc	Ctype	uint8
71	gc	Val	struct
72	gc	NilVal	struct
73	gc	Level	struct
74	gc	EscStep	struct
75	gc	NodeEscState	struct
76	gc	EscState	struct
77	gc	FmtFlag	int
78	gc	Class	uint8
79	gc	Arch	struct
80	gc	Progs	struct
81	gc	BoolFlag	
82	gc	CountFlag	
83	gc	Mpflt	struct
84	gc	Mpcplx	struct
85	gc	Mpint	struct
86	gc	Order	struct
87	gc	BlockEffects	struct
88	gc	Liveness	struct
89	gc	Sig	struct
90	gc	GCProg	struct
91	gc	InitEntry	struct
92	gc	InitPlan	struct
93	gc	Branch	struct
94	gc	SSAGenState	struct
95	gc	FloatingEQNEJump	struct
96	gc	Error	struct
97	gc	Dlist	struct
98	gc	Symlink	struct
99	gc	Node	struct
100	gc	Name	struct
101	gc	Param	struct
102	gc	Func	struct
103	gc	Mark	struct
104	gc	ScopeID	int32
105	gc	Op	uint8
106	gc	Nodes	struct
107	main	V	struct
108	main	S	struct
109	main	T	struct
110	main	I	
111	main	T1	struct
112	main	T2	struct
113	main	T3	struct
114	main	T4	struct
115	main	T5	struct
116	main	T6	struct
117	main	T7	struct
118	main	T8	struct
119	main	T9	struct
120	main	T10	struct
121	main	T15	struct
122	main	T16	struct
123	main	T17	struct
124	main	T23	struct
125	main	T24	struct
126	main	T25	struct
127	main	T31	struct
128	main	T32	struct
129	main	T33	struct
130	main	T63	struct
131	main	T64	struct
132	main	T65	struct
133	main	T1023	struct
134	main	T1024	struct
135	main	T1025	struct
136	main	T1031	struct
137	main	T1032	struct
138	main	T1033	struct
139	main	T1039	struct
140	main	T1040	struct
141	main	T1041	struct
142	main	B	[]int
143	main	T1	[]*main.B
144	main	T2	[]*main.B
145	main	T3	struct
146	main	T4	struct
147	main	T	struct
148	main	T1	struct
149	main	T2	struct
150	main	T3	struct
151	main	T4	struct
152	main	T5	struct
153	main	T6	struct
154	main	T7	struct
155	main	T8	struct
156	main	T9	struct
157	main	T10	struct
158	main	T15	struct
159	main	T16	struct
160	main	T17	struct
161	main	T23	struct
162	main	T24	struct
163	main	T25	struct
164	main	T31	struct
165	main	T32	struct
166	main	T33	struct
167	main	T63	struct
168	main	T64	struct
169	main	T65	struct
170	main	T1023	struct
171	main	T1024	struct
172	main	T1025	struct
173	main	T8u1	struct
174	main	T8u2	struct
175	main	T16u1	struct
176	main	T16u2	struct
177	main	T24u1	struct
178	main	T24u2	struct
179	main	T32u1	struct
180	main	T32u2	struct
181	main	T64u1	struct
182	main	T64u2	struct
183	main	T256u1	struct
184	main	T256u2	struct
185	gc	Timings	struct
186	ssa	Block	struct
187	ssa	Edge	struct
188	ssa	BlockKind	int8
189	ssa	BranchPrediction	int8
190	ssa	Cache	struct
191	ssa	Config	struct
192	ssa	Types	struct
193	ssa	Logger	
194	ssa	Frontend	
195	ssa	GCNode	
196	ssa	StorageClass	uint8
197	ssa	SlotID	int32
198	ssa	FuncDebug	struct
199	ssa	BlockDebug	struct
200	ssa	VarLocList	struct
201	ssa	VarLoc	struct
202	ssa	RegisterSet	uint64
203	ssa	Func	struct
204	main	ArchsByName	[]main.arch
205	main	Rule	struct
206	ssa	HTMLWriter	struct
207	ssa	ID	int32
208	ssa	Location	
209	ssa	Register	struct
210	ssa	LocalSlot	struct
211	ssa	LocPair	[]ssa.Location
212	ssa	Op	int32
213	ssa	SymEffect	int8
214	ssa	ValAndOff	int64
215	ssa	RBTint32	struct
216	ssa	ValHeap	struct
217	ssa	SparseTreeNode	struct
218	ssa	SparseTree	[]ssa.SparseTreeNode
219	ssa	SparseTreeMap	ssa.RBTint32
220	ssa	SparseTreeHelper	struct
221	ssa	Value	struct
222	syntax	Node	
223	syntax	File	struct
224	syntax	Decl	
225	syntax	ImportDecl	struct
226	syntax	ConstDecl	struct
227	syntax	TypeDecl	struct
228	syntax	VarDecl	struct
229	syntax	FuncDecl	struct
230	syntax	Group	struct
231	syntax	Expr	
232	syntax	BadExpr	struct
233	syntax	Name	struct
234	syntax	BasicLit	struct
235	syntax	CompositeLit	struct
236	syntax	KeyValueExpr	struct
237	syntax	FuncLit	struct
238	syntax	ParenExpr	struct
239	syntax	SelectorExpr	struct
240	syntax	IndexExpr	struct
241	syntax	SliceExpr	struct
242	syntax	AssertExpr	struct
243	syntax	Operation	struct
244	syntax	CallExpr	struct
245	syntax	ListExpr	struct
246	syntax	ArrayType	struct
247	syntax	SliceType	struct
248	syntax	DotsType	struct
249	syntax	StructType	struct
250	syntax	Field	struct
251	syntax	InterfaceType	struct
252	syntax	FuncType	struct
253	syntax	MapType	struct
254	syntax	ChanType	struct
255	syntax	ChanDir	uint
256	syntax	Stmt	
257	syntax	SimpleStmt	
258	syntax	EmptyStmt	struct
259	syntax	LabeledStmt	struct
260	syntax	BlockStmt	struct
261	syntax	ExprStmt	struct
262	syntax	SendStmt	struct
263	syntax	DeclStmt	struct
264	syntax	AssignStmt	struct
265	syntax	BranchStmt	struct
266	syntax	CallStmt	struct
267	syntax	ReturnStmt	struct
268	syntax	IfStmt	struct
269	syntax	ForStmt	struct
270	syntax	SwitchStmt	struct
271	syntax	SelectStmt	struct
272	syntax	RangeClause	struct
273	syntax	TypeSwitchGuard	struct
274	syntax	CaseClause	struct
275	syntax	CommClause	struct
276	syntax	CommentKind	uint
277	syntax	Comment	struct
278	syntax	Mode	uint
279	syntax	Error	struct
280	syntax	ErrorHandler	func(error)
281	syntax	Pragma	uint16
282	syntax	PragmaHandler	func(src.Pos, string) syntax.Pragma
283	syntax	FilenameHandler	func(string) string
284	syntax	LitKind	uint
285	syntax	Operator	uint
286	types	Pkg	struct
287	types	Sym	struct
288	types	Node	struct
289	types	EType	uint8
290	types	ChanDir	uint8
291	types	Type	struct
292	types	Map	struct
293	types	Forward	struct
294	types	Func	struct
295	types	Struct	struct
296	types	Funarg	uint8
297	types	Interface	struct
298	types	Ptr	struct
299	types	DDDField	struct
300	types	ChanArgs	struct
301	types	FuncArgs	struct
302	types	Chan	struct
303	types	Tuple	struct
304	types	Array	struct
305	types	Slice	struct
306	types	Field	struct
307	types	Fields	struct
308	types	Cmp	int8
309	main	Block	struct
310	main	File	struct
311	main	FuncExtent	struct
312	main	FuncVisitor	struct
313	main	Profile	struct
314	main	ProfileBlock	struct
315	main	Boundary	struct
316	main	Dirs	struct
317	main	Package	struct
318	main	PackageError	string
319	pkg	ExportedType	struct
320	pkg	ExportedStructOneField	struct
321	pkg	ExportedInterface	
322	pkg	T2	int
323	pkg	T1	pkg.T2
324	main	TypeConfig	struct
325	main	Type	struct
326	base	Command	struct
327	base	StringsFlag	[]string
328	cache	ActionID	[]byte
329	cache	OutputID	[]byte
330	cache	Cache	struct
331	cache	Entry	struct
332	cache	Hash	struct
333	cfg	EnvVar	struct
334	cmdflag	Defn	struct
335	generate	Generator	struct
336	get	ImportMismatchError	struct
337	list	Context	struct
338	list	TrackingWriter	struct
339	load	PerPackageFlag	struct
340	load	Package	struct
341	load	PackagePublic	struct
342	load	PackageInternal	struct
343	load	NoGoError	struct
344	load	CoverVar	struct
345	load	PackageError	struct
346	load	ImportStack	[]string
347	load	TargetDir	int
348	web	HTTPError	struct
349	web	HTTPError	struct
350	web	SecurityMode	int
351	work	Builder	struct
352	work	Action	struct
353	work	BuildMode	int
354	p	A1	
355	p	B1	
356	p	C1	
357	p	D1	
358	bio	Reader	struct
359	bio	Writer	struct
360	dwarf	Sym	
361	dwarf	Location	struct
362	dwarf	Piece	struct
363	dwarf	Var	struct
364	dwarf	Scope	struct
365	dwarf	Range	struct
366	dwarf	FnState	struct
367	dwarf	InlCalls	struct
368	dwarf	InlCall	struct
369	dwarf	Context	
370	dwarf	DWAttr	struct
371	dwarf	DWDie	struct
372	dwarf	VarsByOffset	[]*dwarf.Var
373	edit	Buffer	struct
374	gcprog	Writer	struct
375	goobj	Sym	struct
376	goobj	SymID	struct
377	goobj	Data	struct
378	goobj	Reloc	struct
379	goobj	Var	struct
380	goobj	Func	struct
381	goobj	FuncData	struct
382	goobj	InlinedCall	struct
383	goobj	Package	struct
384	goobj	NativeReader	struct
385	arm	Optab	struct
386	arm	Opcross	[][][]uint8
387	arm64	Optab	struct
388	obj	InlTree	struct
389	obj	InlinedCall	struct
390	obj	Addr	struct
391	obj	AddrName	int8
392	obj	AddrType	uint8
393	obj	Prog	struct
394	obj	As	int16
395	obj	LSym	struct
396	obj	FuncInfo	struct
397	obj	Attribute	int16
398	obj	Pcln	struct
399	obj	Reloc	struct
400	obj	Auto	struct
401	obj	Pcdata	struct
402	obj	Link	struct
403	obj	LinkArch	struct
404	mips	Optab	struct
405	mips	Dep	struct
406	mips	Sch	struct
407	obj	DwarfFixupTable	struct
408	obj	Plist	struct
409	obj	ProgAlloc	func() *obj.Prog
410	ppc64	Optab	struct
411	s390x	Optab	struct
412	x86	Optab	struct
413	x86	Movtab	struct
414	x86	AsmBuf	struct
415	objabi	FuncID	uint32
416	objabi	HeadType	uint8
417	objabi	RelocType	int32
418	objabi	SymKind	uint8
419	objfile	Disasm	struct
420	objfile	CachedFile	struct
421	objfile	FileCache	struct
422	objfile	Liner	
423	objfile	File	struct
424	objfile	Entry	struct
425	objfile	Sym	struct
426	objfile	Reloc	struct
427	objfile	RelocStringer	
428	src	Pos	struct
429	src	PosBase	struct
430	src	XPos	struct
431	src	PosTable	struct
432	sys	ArchFamily	byte
433	sys	Arch	struct
434	test2json	Mode	int
435	ld	ArHdr	struct
436	ld	BuildMode	uint8
437	ld	LinkMode	uint8
438	ld	GCProg	struct
439	ld	ElfEhdr	struct
440	ld	ElfShdr	struct
441	ld	ElfPhdr	struct
442	ld	Elfstring	struct
443	ld	Elfaux	struct
444	ld	Elflib	struct
445	ld	Pkg	struct
446	ld	Arch	struct
447	ld	Hostobj	struct
448	ld	SymbolType	int8
449	ld	Shlib	struct
450	ld	Link	struct
451	ld	Pciter	struct
452	ld	MachoHdr	struct
453	ld	MachoSect	struct
454	ld	MachoSeg	struct
455	ld	MachoLoad	struct
456	ld	Rpath	struct
457	ld	OutBuf	struct
458	ld	IMAGE_IMPORT_DESCRIPTOR	struct
459	ld	IMAGE_EXPORT_DIRECTORY	struct
460	ld	Imp	struct
461	ld	Dll	struct
462	loadelf	ElfHdrBytes	struct
463	loadelf	ElfSectBytes	struct
464	loadelf	ElfProgBytes	struct
465	loadelf	ElfSymBytes	struct
466	loadelf	ElfHdrBytes64	struct
467	loadelf	ElfSectBytes64	struct
468	loadelf	ElfProgBytes64	struct
469	loadelf	ElfSymBytes64	struct
470	loadelf	ElfSect	struct
471	loadelf	ElfObj	struct
472	loadelf	ElfSym	struct
473	sym	Attribute	int32
474	sym	Library	struct
475	sym	Reloc	struct
476	sym	RelocVariant	uint8
477	sym	RelocByOff	[]sym.Reloc
478	sym	Segment	struct
479	sym	Section	struct
480	sym	Symbol	struct
481	sym	FuncInfo	struct
482	sym	InlinedCall	struct
483	sym	Pcdata	struct
484	sym	Auto	struct
485	sym	Symbols	struct
486	sym	SymKind	uint8
487	main	Archive	struct
488	main	Entry	struct
489	main	FileLike	
490	main	Record	struct
491	main	Range	struct
492	main	ViewerData	struct
493	main	ViewerEvent	struct
494	main	ViewerFrame	struct
495	main	NameArg	struct
496	main	SortIndexArg	struct
497	main	Arg	struct
498	driver	Options	struct
499	driver	Writer	
500	driver	FlagSet	
501	driver	Fetcher	
502	driver	Symbolizer	
503	driver	MappingSources	map[string][]
504	driver	ObjTool	
505	driver	Inst	struct
506	driver	ObjFile	
507	driver	Frame	struct
508	driver	Sym	struct
509	driver	UI	
510	binutils	Binutils	struct
511	driver	PostProcessor	func(io.Reader, io.Writer, plugin.UI) error
512	graph	DotAttributes	struct
513	graph	DotNodeAttributes	struct
514	graph	DotConfig	struct
515	graph	Graph	struct
516	graph	Options	struct
517	graph	Nodes	[]*graph.Node
518	graph	Node	struct
519	graph	NodeInfo	struct
520	graph	NodeMap	map[graph.NodeInfo]*graph.Node
521	graph	NodeSet	map[graph.NodeInfo]bool
522	graph	NodePtrSet	map[*graph.Node]bool
523	graph	EdgeMap	map[*graph.Node]*graph.Edge
524	graph	Edge	struct
525	graph	Tag	struct
526	graph	TagMap	map[string]*graph.Tag
527	graph	NodeOrder	int
528	plugin	Options	struct
529	plugin	Writer	
530	plugin	FlagSet	
531	plugin	Fetcher	
532	plugin	Symbolizer	
533	plugin	MappingSources	map[string][]
534	plugin	ObjTool	
535	plugin	Inst	struct
536	plugin	ObjFile	
537	plugin	Frame	struct
538	plugin	Sym	struct
539	plugin	UI	
540	plugin	HTTPServerArgs	struct
541	proftest	TestUI	struct
542	report	Options	struct
543	report	TextItem	struct
544	report	Report	struct
545	symbolizer	Symbolizer	struct
546	profile	TagMatch	func(*profile.Sample) bool
547	profile	Profile	struct
548	profile	ValueType	struct
549	profile	Sample	struct
550	profile	Mapping	struct
551	profile	Location	struct
552	profile	Line	struct
553	profile	Function	struct
554	demangle	AST	
555	demangle	Name	struct
556	demangle	Typed	struct
557	demangle	Qualified	struct
558	demangle	Template	struct
559	demangle	TemplateParam	struct
560	demangle	Qualifiers	[]string
561	demangle	TypeWithQualifiers	struct
562	demangle	MethodWithQualifiers	struct
563	demangle	BuiltinType	struct
564	demangle	PointerType	struct
565	demangle	ReferenceType	struct
566	demangle	RvalueReferenceType	struct
567	demangle	ComplexType	struct
568	demangle	ImaginaryType	struct
569	demangle	VendorQualifier	struct
570	demangle	ArrayType	struct
571	demangle	FunctionType	struct
572	demangle	FunctionParam	struct
573	demangle	PtrMem	struct
574	demangle	FixedType	struct
575	demangle	VectorType	struct
576	demangle	Decltype	struct
577	demangle	Operator	struct
578	demangle	Constructor	struct
579	demangle	Destructor	struct
580	demangle	GlobalCDtor	struct
581	demangle	TaggedName	struct
582	demangle	PackExpansion	struct
583	demangle	ArgumentPack	struct
584	demangle	SizeofPack	struct
585	demangle	SizeofArgs	struct
586	demangle	Cast	struct
587	demangle	Nullary	struct
588	demangle	Unary	struct
589	demangle	Binary	struct
590	demangle	Trinary	struct
591	demangle	Fold	struct
592	demangle	New	struct
593	demangle	Literal	struct
594	demangle	ExprList	struct
595	demangle	InitializerList	struct
596	demangle	DefaultArg	struct
597	demangle	Closure	struct
598	demangle	UnnamedType	struct
599	demangle	Clone	struct
600	demangle	Special	struct
601	demangle	Special2	struct
602	demangle	Option	int
603	armasm	Mode	int
604	armasm	Op	uint16
605	armasm	Inst	struct
606	armasm	Args	[]armasm.Arg
607	armasm	Arg	
608	armasm	Float32Imm	float32
609	armasm	Float64Imm	float32
610	armasm	Imm	uint32
611	armasm	ImmAlt	struct
612	armasm	Label	uint32
613	armasm	Reg	uint8
614	armasm	RegX	struct
615	armasm	RegList	uint16
616	armasm	Endian	uint8
617	armasm	Shift	uint8
618	armasm	RegShift	struct
619	armasm	RegShiftReg	struct
620	armasm	PCRel	int32
621	armasm	AddrMode	uint8
622	armasm	Mem	struct
623	arm64asm	Sys	uint8
624	arm64asm	Op	uint16
625	arm64asm	Inst	struct
626	arm64asm	Args	[]arm64asm.Arg
627	arm64asm	Arg	
628	arm64asm	Reg	uint16
629	arm64asm	RegSP	arm64asm.Reg
630	arm64asm	ImmShift	struct
631	arm64asm	ExtShift	uint8
632	arm64asm	RegExtshiftAmount	struct
633	arm64asm	PCRel	int64
634	arm64asm	AddrMode	uint8
635	arm64asm	MemImmediate	struct
636	arm64asm	MemExtend	struct
637	arm64asm	Imm	struct
638	arm64asm	Imm64	struct
639	arm64asm	Imm_hint	uint8
640	arm64asm	Imm_clrex	uint8
641	arm64asm	Imm_dcps	uint16
642	arm64asm	Cond	struct
643	arm64asm	Imm_c	uint8
644	arm64asm	Imm_option	uint8
645	arm64asm	Imm_prfop	uint8
646	arm64asm	Pstatefield	uint8
647	arm64asm	Systemreg	struct
648	arm64asm	Imm_fp	struct
649	arm64asm	Arrangement	uint8
650	arm64asm	RegisterWithArrangement	struct
651	arm64asm	RegisterWithArrangementAndIndex	struct
652	ppc64asm	ArgType	int8
653	ppc64asm	BitField	struct
654	ppc64asm	BitFields	[]ppc64asm.BitField
655	ppc64asm	Inst	struct
656	ppc64asm	Op	uint16
657	ppc64asm	Arg	
658	ppc64asm	Args	[]ppc64asm.Arg
659	ppc64asm	Reg	uint16
660	ppc64asm	CondReg	int8
661	ppc64asm	SpReg	uint16
662	ppc64asm	PCRel	int32
663	ppc64asm	Label	uint32
664	ppc64asm	Imm	int32
665	ppc64asm	Offset	int32
666	x86asm	Inst	struct
667	x86asm	Prefixes	[]x86asm.Prefix
668	x86asm	Prefix	uint16
669	x86asm	Op	uint32
670	x86asm	Args	[]x86asm.Arg
671	x86asm	Arg	
672	x86asm	Reg	uint8
673	x86asm	Mem	struct
674	x86asm	Rel	int32
675	x86asm	Imm	int64
676	x86asm	SymLookup	func(uint64) (string, uint64)
677	cfg	CFG	struct
678	cfg	Block	struct
679	main	File	struct
680	main	Package	struct
681	main	MethodSig	struct
682	main	Span	struct
683	testdata	S	struct
684	testdata	ST	struct
685	testdata	Counter	uint64
686	testdata	MyStruct	struct
687	testdata	Tlock	struct
688	testdata	EmbeddedRWMutex	struct
689	testdata	FieldMutex	struct
690	testdata	L0	struct
691	testdata	L1	struct
692	testdata	L2	struct
693	testdata	EmbeddedMutexPointer	struct
694	testdata	EmbeddedLocker	struct
695	testdata	CustomLock	struct
696	testdata	LocalOnce	sync.Once
697	testdata	LocalMutex	sync.Mutex
698	testdata	T	int
699	buf	Buf	[]byte
700	testdata	MethodTest	int
701	testdata	MethodTestInterface	
702	testdata	T	struct
703	testdata	BoolFormatter	bool
704	testdata	FormatterVal	bool
705	testdata	RecursiveSlice	[]testdata.RecursiveSlice
706	testdata	RecursiveMap	map[int]testdata.RecursiveMap
707	testdata	RecursiveStruct	struct
708	testdata	RecursiveStruct1	struct
709	testdata	RecursiveStruct2	struct
710	testdata	T	struct
711	testdata	StructTagTest	struct
712	testdata	UnexportedEncodingTagTest	struct
713	testdata	JSONEmbeddedField	struct
714	testdata	AnonymousJSON	struct
715	testdata	AnonymousXML	struct
716	testdata	DuplicateJSONFields	struct
717	testdata	UnexpectedSpacetest	struct
718	testdata	V	
719	testdata	StringHeader	struct
720	testdata	SliceHeader	struct
721	bzip2	StructuralError	string
722	flate	Writer	struct
723	flate	CorruptInputError	int64
724	flate	InternalError	string
725	flate	ReadError	struct
726	flate	WriteError	struct
727	flate	Resetter	
728	flate	Reader	
729	gzip	Header	struct
730	gzip	Reader	struct
731	gzip	Writer	struct
732	lzw	Order	int
733	zlib	Resetter	
734	zlib	Writer	struct
735	heap	Interface	
736	list	Element	struct
737	list	List	struct
738	ring	Ring	struct
739	context	Context	
740	context	CancelFunc	func()
741	aes	KeySizeError	int
742	cipher	Block	
743	cipher	Stream	
744	cipher	BlockMode	
745	cipher	AEAD	
746	cipher	StreamReader	struct
747	cipher	StreamWriter	struct
748	crypto	Hash	uint
749	crypto	PublicKey	interface{}
750	crypto	PrivateKey	interface{}
751	crypto	Signer	
752	crypto	SignerOpts	
753	crypto	Decrypter	
754	crypto	DecrypterOpts	interface{}
755	des	KeySizeError	int
756	dsa	Parameters	struct
757	dsa	PublicKey	struct
758	dsa	PrivateKey	struct
759	dsa	ParameterSizes	int
760	ecdsa	PublicKey	struct
761	ecdsa	PrivateKey	struct
762	elliptic	Curve	
763	elliptic	CurveParams	struct
764	main	Data	struct
765	rc4	Cipher	struct
766	rc4	KeySizeError	int
767	rsa	PKCS1v15DecryptOptions	struct
768	rsa	PSSOptions	struct
769	rsa	PublicKey	struct
770	rsa	OAEPOptions	struct
771	rsa	PrivateKey	struct
772	rsa	PrecomputedValues	struct
773	rsa	CRTValue	struct
774	tls	CurveID	uint16
775	tls	ConnectionState	struct
776	tls	ClientAuthType	int
777	tls	ClientSessionState	struct
778	tls	ClientSessionCache	
779	tls	SignatureScheme	uint16
780	tls	ClientHelloInfo	struct
781	tls	CertificateRequestInfo	struct
782	tls	RenegotiationSupport	int
783	tls	Config	struct
784	tls	Certificate	struct
785	tls	Conn	struct
786	tls	RecordHeaderError	struct
787	x509	CertPool	struct
788	x509	PEMCipher	int
789	pkix	AlgorithmIdentifier	struct
790	pkix	RDNSequence	[]pkix.RelativeDistinguishedNameSET
791	pkix	RelativeDistinguishedNameSET	[]pkix.AttributeTypeAndValue
792	pkix	AttributeTypeAndValue	struct
793	pkix	AttributeTypeAndValueSET	struct
794	pkix	Extension	struct
795	pkix	Name	struct
796	pkix	CertificateList	struct
797	pkix	TBSCertificateList	struct
798	pkix	RevokedCertificate	struct
799	x509	InvalidReason	int
800	x509	CertificateInvalidError	struct
801	x509	HostnameError	struct
802	x509	UnknownAuthorityError	struct
803	x509	SystemRootsError	struct
804	x509	VerifyOptions	struct
805	x509	SignatureAlgorithm	int
806	x509	PublicKeyAlgorithm	int
807	x509	KeyUsage	int
808	x509	ExtKeyUsage	int
809	x509	Certificate	struct
810	x509	InsecureAlgorithmError	x509.SignatureAlgorithm
811	x509	ConstraintViolationError	struct
812	x509	UnhandledCriticalExtension	struct
813	x509	CertificateRequest	struct
814	driver	Value	interface{}
815	driver	NamedValue	struct
816	driver	Driver	
817	driver	DriverContext	
818	driver	Connector	
819	driver	Pinger	
820	driver	Execer	
821	driver	ExecerContext	
822	driver	Queryer	
823	driver	QueryerContext	
824	driver	Conn	
825	driver	ConnPrepareContext	
826	driver	IsolationLevel	int
827	driver	TxOptions	struct
828	driver	ConnBeginTx	
829	driver	SessionResetter	
830	driver	Result	
831	driver	Stmt	
832	driver	StmtExecContext	
833	driver	StmtQueryContext	
834	driver	NamedValueChecker	
835	driver	ColumnConverter	
836	driver	Rows	
837	driver	RowsNextResultSet	
838	driver	RowsColumnTypeScanType	
839	driver	RowsColumnTypeDatabaseTypeName	
840	driver	RowsColumnTypeLength	
841	driver	RowsColumnTypeNullable	
842	driver	RowsColumnTypePrecisionScale	
843	driver	Tx	
844	driver	RowsAffected	int64
845	driver	ValueConverter	
846	driver	Valuer	
847	driver	Null	struct
848	driver	NotNull	struct
849	sql	NamedArg	struct
850	sql	IsolationLevel	int
851	sql	TxOptions	struct
852	sql	RawBytes	[]byte
853	sql	NullString	struct
854	sql	NullInt64	struct
855	sql	NullFloat64	struct
856	sql	NullBool	struct
857	sql	Scanner	
858	sql	Out	struct
859	sql	DB	struct
860	sql	DBStats	struct
861	sql	Conn	struct
862	sql	Tx	struct
863	sql	Stmt	struct
864	sql	Rows	struct
865	sql	ColumnType	struct
866	sql	Row	struct
867	sql	Result	
868	dwarf	DecodeError	struct
869	dwarf	Attr	uint32
870	dwarf	Tag	uint32
871	dwarf	Entry	struct
872	dwarf	Field	struct
873	dwarf	Class	int
874	dwarf	Offset	uint32
875	dwarf	Reader	struct
876	dwarf	LineReader	struct
877	dwarf	LineEntry	struct
878	dwarf	LineFile	struct
879	dwarf	LineReaderPos	struct
880	dwarf	Data	struct
881	dwarf	Type	
882	dwarf	CommonType	struct
883	dwarf	BasicType	struct
884	dwarf	CharType	struct
885	dwarf	UcharType	struct
886	dwarf	IntType	struct
887	dwarf	UintType	struct
888	dwarf	FloatType	struct
889	dwarf	ComplexType	struct
890	dwarf	BoolType	struct
891	dwarf	AddrType	struct
892	dwarf	UnspecifiedType	struct
893	dwarf	QualType	struct
894	dwarf	ArrayType	struct
895	dwarf	VoidType	struct
896	dwarf	PtrType	struct
897	dwarf	StructType	struct
898	dwarf	StructField	struct
899	dwarf	EnumType	struct
900	dwarf	EnumValue	struct
901	dwarf	FuncType	struct
902	dwarf	DotDotDotType	struct
903	dwarf	TypedefType	struct
904	elf	Version	byte
905	elf	Class	byte
906	elf	Data	byte
907	elf	OSABI	byte
908	elf	Type	uint16
909	elf	Machine	uint16
910	elf	SectionIndex	int
911	elf	SectionType	uint32
912	elf	SectionFlag	uint32
913	elf	CompressionType	int
914	elf	ProgType	int
915	elf	ProgFlag	uint32
916	elf	DynTag	int
917	elf	DynFlag	int
918	elf	NType	int
919	elf	SymBind	int
920	elf	SymType	int
921	elf	SymVis	int
922	elf	R_X86_64	int
923	elf	R_AARCH64	int
924	elf	R_ALPHA	int
925	elf	R_ARM	int
926	elf	R_386	int
927	elf	R_MIPS	int
928	elf	R_PPC	int
929	elf	R_PPC64	int
930	elf	R_390	int
931	elf	R_SPARC	int
932	elf	Header32	struct
933	elf	Section32	struct
934	elf	Prog32	struct
935	elf	Dyn32	struct
936	elf	Chdr32	struct
937	elf	Rel32	struct
938	elf	Rela32	struct
939	elf	Sym32	struct
940	elf	Header64	struct
941	elf	Section64	struct
942	elf	Prog64	struct
943	elf	Dyn64	struct
944	elf	Chdr64	struct
945	elf	Rel64	struct
946	elf	Rela64	struct
947	elf	Sym64	struct
948	elf	FileHeader	struct
949	elf	File	struct
950	elf	SectionHeader	struct
951	elf	Section	struct
952	elf	ProgHeader	struct
953	elf	Prog	struct
954	elf	Symbol	struct
955	elf	FormatError	struct
956	elf	ImportedSymbol	struct
957	gosym	LineTable	struct
958	gosym	Sym	struct
959	gosym	Func	struct
960	gosym	Obj	struct
961	gosym	Table	struct
962	gosym	UnknownFileError	string
963	gosym	UnknownLineError	struct
964	gosym	DecodingError	struct
965	macho	FatFile	struct
966	macho	FatArchHeader	struct
967	macho	FatArch	struct
968	macho	File	struct
969	macho	Load	
970	macho	LoadBytes	[]byte
971	macho	SegmentHeader	struct
972	macho	Segment	struct
973	macho	SectionHeader	struct
974	macho	Reloc	struct
975	macho	Section	struct
976	macho	Dylib	struct
977	macho	Symtab	struct
978	macho	Dysymtab	struct
979	macho	Rpath	struct
980	macho	Symbol	struct
981	macho	FormatError	struct
982	macho	FileHeader	struct
983	macho	Type	uint32
984	macho	Cpu	uint32
985	macho	LoadCmd	uint32
986	macho	Segment32	struct
987	macho	Segment64	struct
988	macho	SymtabCmd	struct
989	macho	DysymtabCmd	struct
990	macho	DylibCmd	struct
991	macho	RpathCmd	struct
992	macho	Thread	struct
993	macho	Section32	struct
994	macho	Section64	struct
995	macho	Nlist32	struct
996	macho	Nlist64	struct
997	macho	Regs386	struct
998	macho	RegsAMD64	struct
999	macho	RelocTypeGeneric	int
1000	macho	RelocTypeX86_64	int
1001	macho	RelocTypeARM	int
1002	macho	RelocTypeARM64	int
1003	pe	File	struct
1004	pe	ImportDirectory	struct
1005	pe	FormatError	struct
1006	pe	FileHeader	struct
1007	pe	DataDirectory	struct
1008	pe	OptionalHeader32	struct
1009	pe	OptionalHeader64	struct
1010	pe	SectionHeader32	struct
1011	pe	Reloc	struct
1012	pe	SectionHeader	struct
1013	pe	Section	struct
1014	pe	StringTable	[]byte
1015	pe	COFFSymbol	struct
1016	pe	Symbol	struct
1017	plan9obj	FileHeader	struct
1018	plan9obj	File	struct
1019	plan9obj	SectionHeader	struct
1020	plan9obj	Section	struct
1021	plan9obj	Sym	struct
1022	ascii85	CorruptInputError	int64
1023	asn1	StructuralError	struct
1024	asn1	SyntaxError	struct
1025	asn1	BitString	struct
1026	asn1	ObjectIdentifier	[]int
1027	asn1	Enumerated	int
1028	asn1	Flag	bool
1029	asn1	RawValue	struct
1030	asn1	RawContent	[]byte
1031	base32	Encoding	struct
1032	base32	CorruptInputError	int64
1033	base64	Encoding	struct
1034	base64	CorruptInputError	int64
1035	binary	ByteOrder	
1036	csv	ParseError	struct
1037	csv	Reader	struct
1038	csv	Writer	struct
1039	encoding	BinaryMarshaler	
1040	encoding	BinaryUnmarshaler	
1041	encoding	TextMarshaler	
1042	encoding	TextUnmarshaler	
1043	main	Type	struct
1044	gob	Decoder	struct
1045	main	Type	struct
1046	gob	Encoder	struct
1047	gob	CommonType	struct
1048	gob	GobEncoder	
1049	gob	GobDecoder	
1050	hex	InvalidByteError	byte
1051	json	Unmarshaler	
1052	json	UnmarshalTypeError	struct
1053	json	UnmarshalFieldError	struct
1054	json	InvalidUnmarshalError	struct
1055	json	Number	string
1056	json	Marshaler	
1057	json	UnsupportedTypeError	struct
1058	json	UnsupportedValueError	struct
1059	json	InvalidUTF8Error	struct
1060	json	MarshalerError	struct
1061	json	SyntaxError	struct
1062	json	Decoder	struct
1063	json	Encoder	struct
1064	json	RawMessage	[]byte
1065	json	Token	interface{}
1066	json	Delim	rune
1067	pem	Block	struct
1068	xml	Marshaler	
1069	xml	MarshalerAttr	
1070	xml	Encoder	struct
1071	xml	UnsupportedTypeError	struct
1072	xml	UnmarshalError	string
1073	xml	Unmarshaler	
1074	xml	UnmarshalerAttr	
1075	xml	TagPathError	struct
1076	xml	SyntaxError	struct
1077	xml	Name	struct
1078	xml	Attr	struct
1079	xml	Token	interface{}
1080	xml	StartElement	struct
1081	xml	EndElement	struct
1082	xml	CharData	[]byte
1083	xml	Comment	[]byte
1084	xml	ProcInst	struct
1085	xml	Directive	[]byte
1086	xml	TokenReader	
1087	xml	Decoder	struct
1088	expvar	Var	
1089	expvar	Int	struct
1090	expvar	Float	struct
1091	expvar	Map	struct
1092	expvar	KeyValue	struct
1093	expvar	String	struct
1094	expvar	Func	func() interface{}
1095	flag	Value	
1096	flag	Getter	
1097	flag	ErrorHandling	int
1098	flag	FlagSet	struct
1099	flag	Flag	struct
1100	fmt	State	
1101	fmt	Formatter	
1102	fmt	Stringer	
1103	fmt	GoStringer	
1104	fmt	ScanState	
1105	fmt	Scanner	
1106	ast	Node	
1107	ast	Expr	
1108	ast	Stmt	
1109	ast	Decl	
1110	ast	Comment	struct
1111	ast	CommentGroup	struct
1112	ast	Field	struct
1113	ast	FieldList	struct
1114	ast	BadExpr	struct
1115	ast	Ident	struct
1116	ast	Ellipsis	struct
1117	ast	BasicLit	struct
1118	ast	FuncLit	struct
1119	ast	CompositeLit	struct
1120	ast	ParenExpr	struct
1121	ast	SelectorExpr	struct
1122	ast	IndexExpr	struct
1123	ast	SliceExpr	struct
1124	ast	TypeAssertExpr	struct
1125	ast	CallExpr	struct
1126	ast	StarExpr	struct
1127	ast	UnaryExpr	struct
1128	ast	BinaryExpr	struct
1129	ast	KeyValueExpr	struct
1130	ast	ChanDir	int
1131	ast	ArrayType	struct
1132	ast	StructType	struct
1133	ast	FuncType	struct
1134	ast	InterfaceType	struct
1135	ast	MapType	struct
1136	ast	ChanType	struct
1137	ast	BadStmt	struct
1138	ast	DeclStmt	struct
1139	ast	EmptyStmt	struct
1140	ast	LabeledStmt	struct
1141	ast	ExprStmt	struct
1142	ast	SendStmt	struct
1143	ast	IncDecStmt	struct
1144	ast	AssignStmt	struct
1145	ast	GoStmt	struct
1146	ast	DeferStmt	struct
1147	ast	ReturnStmt	struct
1148	ast	BranchStmt	struct
1149	ast	BlockStmt	struct
1150	ast	IfStmt	struct
1151	ast	CaseClause	struct
1152	ast	SwitchStmt	struct
1153	ast	TypeSwitchStmt	struct
1154	ast	CommClause	struct
1155	ast	SelectStmt	struct
1156	ast	ForStmt	struct
1157	ast	RangeStmt	struct
1158	ast	Spec	
1159	ast	ImportSpec	struct
1160	ast	ValueSpec	struct
1161	ast	TypeSpec	struct
1162	ast	BadDecl	struct
1163	ast	GenDecl	struct
1164	ast	FuncDecl	struct
1165	ast	File	struct
1166	ast	Package	struct
1167	ast	CommentMap	map[ast.Node][]*ast.CommentGroup
1168	ast	Filter	func(string) bool
1169	ast	MergeMode	uint
1170	ast	FieldFilter	func(string, reflect.Value) bool
1171	ast	Importer	func(map[string]*ast.Object, string) (*ast.Object, error)
1172	ast	Scope	struct
1173	ast	Object	struct
1174	ast	ObjKind	int
1175	ast	Visitor	
1176	build	Context	struct
1177	build	ImportMode	uint
1178	build	Package	struct
1179	build	NoGoError	struct
1180	build	MultiplePackageError	struct
1181	constant	Kind	int
1182	constant	Value	
1183	doc	Package	struct
1184	doc	Value	struct
1185	doc	Type	struct
1186	doc	Func	struct
1187	doc	Note	struct
1188	doc	Mode	int
1189	doc	Example	struct
1190	doc	Filter	func(string) bool
1191	b	T	struct
1192	testing	InternalBenchmark	struct
1193	testing	B	struct
1194	testing	BenchmarkResult	struct
1195	blank	T	int
1196	blank	S	struct
1197	c	A	struct
1198	c	B	struct
1199	c	C	struct
1200	c	D	struct
1201	c	E1	struct
1202	c	E2	struct
1203	c	E3	struct
1204	c	E4	struct
1205	c	T1	struct
1206	c	T2	struct
1207	d	T2	struct
1208	d	TG2	struct
1209	d	TG1	struct
1210	d	TG0	struct
1211	d	T1	struct
1212	d	T0	struct
1213	e	T1	struct
1214	e	T2	struct
1215	e	T3	struct
1216	e	T4	struct
1217	e	T4	struct
1218	e	T5	struct
1219	e	U1	struct
1220	e	U2	struct
1221	e	U3	struct
1222	e	U4	struct
1223	e	V1	struct
1224	e	V2	struct
1225	e	V3	struct
1226	e	V4	struct
1227	e	V5	struct
1228	e	V6	struct
1229	error1	I0	
1230	error1	T0	struct
1231	error1	S0	struct
1232	error2	I0	
1233	error2	T0	struct
1234	error2	S0	struct
1235	testing	InternalExample	struct
1236	issue18063	T	struct
1237	testing	T	struct
1238	testing	InternalTest	struct
1239	importer	Lookup	func(string) (io.ReadCloser, error)
1240	gccgoimporter	GccgoInstallation	struct
1241	gccgoimporter	PackageInit	struct
1242	gccgoimporter	InitData	struct
1243	gccgoimporter	Importer	func(map[string]*types.Package, string, func(string) (io.ReadCloser, error)) (*types.Package, error)
1244	conversions	Units	string
1245	escapeinfo	T	struct
1246	pointer	Int8Ptr	*int8
1247	a	A	struct
1248	b	A	a.A
1249	exports	T1	int
1250	exports	T2	[]int
1251	exports	T3	[]int
1252	exports	T4	*int
1253	exports	T5	chan int\n
1254	exports	T6a	chan int\n
1255	exports	T6b	chan (chan int\n)\n
1256	exports	T6c	chan (chan int\n)\n
1257	exports	T7	chan *ast.File\n
1258	exports	T8	struct
1259	exports	T9	struct
1260	exports	T10	struct
1261	exports	T11	map[int]string
1262	exports	T12	interface{}
1263	exports	T13	
1264	exports	T14	
1265	exports	T15	func()
1266	exports	T16	func(int)
1267	exports	T17	func(int)
1268	exports	T18	func() float32
1269	exports	T19	func() float32
1270	exports	T20	func(...interface{})
1271	exports	T21	struct
1272	exports	T22	struct
1273	exports	T23	struct
1274	exports	T24	*exports.T24
1275	exports	T25	*exports.T26
1276	exports	T26	*exports.T27
1277	exports	T27	*exports.T25
1278	exports	T28	func(exports.T28) exports.T28
1279	p	Error	error
1280	test	BlankField	struct
1281	srcimporter	Importer	struct
1282	parser	Mode	uint
1283	printer	Mode	uint
1284	printer	Config	struct
1285	printer	CommentedNode	struct
1286	scanner	Error	struct
1287	scanner	ErrorList	[]*scanner.Error
1288	scanner	ErrorHandler	func(token.Position, string)
1289	scanner	Scanner	struct
1290	scanner	Mode	uint
1291	token	Position	struct
1292	token	Pos	int
1293	token	File	struct
1294	token	FileSet	struct
1295	token	Token	int
1296	types	Error	struct
1297	types	Importer	
1298	types	ImportMode	int
1299	types	ImporterFrom	
1300	types	Config	struct
1301	types	Info	struct
1302	types	TypeAndValue	struct
1303	types	Initializer	struct
1304	types	Checker	struct
1305	types	MethodSet	struct
1306	types	Object	
1307	types	PkgName	struct
1308	types	Const	struct
1309	types	TypeName	struct
1310	types	Var	struct
1311	types	Func	struct
1312	types	Label	struct
1313	types	Builtin	struct
1314	types	Nil	struct
1315	types	Package	struct
1316	types	Scope	struct
1317	types	SelectionKind	int
1318	types	Selection	struct
1319	types	Sizes	
1320	types	StdSizes	struct
1321	types	Type	
1322	types	BasicKind	int
1323	types	BasicInfo	int
1324	types	Basic	struct
1325	types	Array	struct
1326	types	Slice	struct
1327	types	Struct	struct
1328	types	Pointer	struct
1329	types	Tuple	struct
1330	types	Signature	struct
1331	types	Interface	struct
1332	types	Map	struct
1333	types	Chan	struct
1334	types	ChanDir	int
1335	types	Named	struct
1336	types	Qualifier	func(*types.Package) string
1337	crc32	Table	[]uint32
1338	crc64	Table	[]uint64
1339	hash	Hash	
1340	hash	Hash32	
1341	hash	Hash64	
1342	template	CSS	string
1343	template	HTML	string
1344	template	HTMLAttr	string
1345	template	JS	string
1346	template	JSStr	string
1347	template	URL	string
1348	template	Srcset	string
1349	template	Error	struct
1350	template	ErrorCode	int
1351	template	Template	struct
1352	template	FuncMap	map[string]interface{}
1353	color	Color	
1354	color	RGBA	struct
1355	color	RGBA64	struct
1356	color	NRGBA	struct
1357	color	NRGBA64	struct
1358	color	Alpha	struct
1359	color	Alpha16	struct
1360	color	Gray	struct
1361	color	Gray16	struct
1362	color	Model	
1363	color	Palette	[]color.Color
1364	color	YCbCr	struct
1365	color	NYCbCrA	struct
1366	color	CMYK	struct
1367	draw	Image	
1368	draw	Quantizer	
1369	draw	Op	int
1370	draw	Drawer	
1371	image	Point	struct
1372	image	Rectangle	struct
1373	gif	GIF	struct
1374	gif	Options	struct
1375	image	Config	struct
1376	image	Image	
1377	image	PalettedImage	
1378	image	RGBA	struct
1379	image	RGBA64	struct
1380	image	NRGBA	struct
1381	image	NRGBA64	struct
1382	image	Alpha	struct
1383	image	Alpha16	struct
1384	image	Gray	struct
1385	image	Gray16	struct
1386	image	CMYK	struct
1387	image	Paletted	struct
1388	jpeg	FormatError	string
1389	jpeg	UnsupportedError	string
1390	jpeg	Reader	
1391	jpeg	Options	struct
1392	image	Uniform	struct
1393	png	FormatError	string
1394	png	UnsupportedError	string
1395	png	Encoder	struct
1396	png	EncoderBufferPool	
1397	png	EncoderBuffer	png.encoder
1398	png	CompressionLevel	int
1399	image	YCbCrSubsampleRatio	int
1400	image	YCbCr	struct
1401	image	NYCbCrA	struct
1402	suffixarray	Index	struct
1403	nettrace	TraceKey	struct
1404	nettrace	LookupIPAltResolverKey	struct
1405	nettrace	Trace	struct
1406	poll	TimeoutError	struct
1407	poll	FD	struct
1408	poll	FD	struct
1409	poll	FD	struct
1410	singleflight	Group	struct
1411	singleflight	Result	struct
1412	unix	GetRandomFlag	uintptr
1413	windows	PROCESS_MEMORY_COUNTERS	struct
1414	registry	Key	syscall.Handle
1415	registry	KeyInfo	struct
1416	windows	REPARSE_DATA_BUFFER_HEADER	struct
1417	windows	SymbolicLinkReparseBuffer	struct
1418	windows	MountPointReparseBuffer	struct
1419	windows	LUID	struct
1420	windows	LUID_AND_ATTRIBUTES	struct
1421	windows	TOKEN_PRIVILEGES	struct
1422	windows	SID_AND_ATTRIBUTES	struct
1423	windows	TOKEN_MANDATORY_LABEL	struct
1424	windows	TokenType	uint32
1425	windows	SocketAddress	struct
1426	windows	IpAdapterUnicastAddress	struct
1427	windows	IpAdapterAnycastAddress	struct
1428	windows	IpAdapterMulticastAddress	struct
1429	windows	IpAdapterDnsServerAdapter	struct
1430	windows	IpAdapterPrefix	struct
1431	windows	IpAdapterAddresses	struct
1432	windows	WSAMsg	struct
1433	windows	SHARE_INFO_2	struct
1434	testlog	Interface	
1435	trace	GDesc	struct
1436	trace	Event	struct
1437	trace	Frame	struct
1438	trace	ParseResult	struct
1439	trace	G	struct
1440	trace	Writer	struct
1441	io	Reader	
1442	io	Writer	
1443	io	Closer	
1444	io	Seeker	
1445	io	ReadWriter	
1446	io	ReadCloser	
1447	io	WriteCloser	
1448	io	ReadWriteCloser	
1449	io	ReadSeeker	
1450	io	WriteSeeker	
1451	io	ReadWriteSeeker	
1452	io	ReaderFrom	
1453	io	WriterTo	
1454	io	ReaderAt	
1455	io	WriterAt	
1456	io	ByteReader	
1457	io	ByteScanner	
1458	io	ByteWriter	
1459	io	RuneReader	
1460	io	RuneScanner	
1461	io	LimitedReader	struct
1462	io	SectionReader	struct
1463	io	PipeReader	struct
1464	io	PipeWriter	struct
1465	log	Logger	struct
1466	syslog	Priority	int
1467	syslog	Writer	struct
1468	big	Word	uint
1469	big	Float	struct
1470	big	ErrNaN	struct
1471	big	RoundingMode	byte
1472	big	Accuracy	int8
1473	big	Int	struct
1474	big	Rat	struct
1475	rand	Source	
1476	rand	Source64	
1477	rand	Rand	struct
1478	rand	Zipf	struct
1479	mime	WordEncoder	byte
1480	mime	WordDecoder	struct
1481	multipart	Form	struct
1482	multipart	FileHeader	struct
1483	multipart	File	
1484	multipart	Part	struct
1485	multipart	Reader	struct
1486	multipart	Writer	struct
1487	quotedprintable	Reader	struct
1488	quotedprintable	Writer	struct
1489	net	Dialer	struct
1490	net	SRV	struct
1491	net	MX	struct
1492	net	NS	struct
1493	cgi	Handler	struct
1494	http	Client	struct
1495	http	RoundTripper	
1496	http	Cookie	struct
1497	cookiejar	PublicSuffixList	
1498	cookiejar	Options	struct
1499	cookiejar	Jar	struct
1500	http	Dir	string
1501	http	FileSystem	
1502	http	File	
1503	http	I	
1504	http	Header	map[string][]string
1505	http	PushOptions	struct
1506	http	Pusher	
1507	httptest	ResponseRecorder	struct
1508	httptest	Server	struct
1509	httptrace	ClientTrace	struct
1510	httptrace	WroteRequestInfo	struct
1511	httptrace	DNSStartInfo	struct
1512	httptrace	DNSDoneInfo	struct
1513	httptrace	GotConnInfo	struct
1514	httputil	ServerConn	struct
1515	httputil	ClientConn	struct
1516	httputil	ReverseProxy	struct
1517	httputil	BufferPool	
1518	internal	FlushAfterChunkWriter	struct
1519	http	CookieJar	
1520	http	ProtocolError	struct
1521	http	Request	struct
1522	http	Response	struct
1523	http	Handler	
1524	http	ResponseWriter	
1525	http	Flusher	
1526	http	Hijacker	
1527	http	CloseNotifier	
1528	http	HandlerFunc	func(http.ResponseWriter, *http.Request)
1529	http	ServeMux	struct
1530	http	Server	struct
1531	http	ConnState	int
1532	http	Transport	struct
1533	main	Counter	struct
1534	main	Chan	chan int\n
1535	net	Interface	struct
1536	net	Flags	uint
1537	socktest	Switch	struct
1538	socktest	Cookie	uint64
1539	socktest	Status	struct
1540	socktest	Stat	struct
1541	socktest	FilterType	int
1542	socktest	Filter	func(*socktest.Status) (socktest.AfterFilter, error)
1543	socktest	AfterFilter	func(*socktest.Status) error
1544	socktest	Sockets	map[int]socktest.Status
1545	socktest	Sockets	map[int]socktest.Status
1546	socktest	Sockets	map[syscall.Handle]socktest.Status
1547	net	IP	[]byte
1548	net	IPMask	[]byte
1549	net	IPNet	struct
1550	net	IPAddr	struct
1551	net	IPConn	struct
1552	net	Resolver	struct
1553	net	HardwareAddr	[]byte
1554	mail	Message	struct
1555	mail	Header	map[string][]string
1556	mail	Address	struct
1557	mail	AddressParser	struct
1558	net	Addr	
1559	net	Conn	
1560	net	PacketConn	
1561	net	Listener	
1562	net	Error	
1563	net	OpError	struct
1564	net	ParseError	struct
1565	net	AddrError	struct
1566	net	UnknownNetworkError	string
1567	net	InvalidAddrError	string
1568	net	DNSConfigError	struct
1569	net	DNSError	struct
1570	net	Buffers	[][]byte
1571	rpc	ServerError	string
1572	rpc	Call	struct
1573	rpc	Client	struct
1574	rpc	ClientCodec	
1575	rpc	Request	struct
1576	rpc	Response	struct
1577	rpc	Server	struct
1578	rpc	ServerCodec	
1579	smtp	Auth	
1580	smtp	ServerInfo	struct
1581	smtp	Client	struct
1582	net	TCPAddr	struct
1583	net	TCPConn	struct
1584	net	TCPListener	struct
1585	textproto	MIMEHeader	map[string][]string
1586	textproto	Pipeline	struct
1587	textproto	Reader	struct
1588	textproto	Error	struct
1589	textproto	ProtocolError	string
1590	textproto	Conn	struct
1591	textproto	Writer	struct
1592	net	UDPAddr	struct
1593	net	UDPConn	struct
1594	net	UnixAddr	struct
1595	net	UnixConn	struct
1596	net	UnixListener	struct
1597	url	Error	struct
1598	url	EscapeError	string
1599	url	InvalidHostError	string
1600	url	URL	struct
1601	url	Userinfo	struct
1602	url	Values	map[string][]string
1603	os	PathError	struct
1604	os	SyscallError	struct
1605	exec	Error	struct
1606	exec	Cmd	struct
1607	exec	F	func(*exec.Cmd) (*os.File, error)
1608	exec	ExitError	struct
1609	os	Process	struct
1610	os	ProcAttr	struct
1611	os	Signal	
1612	os	ProcessState	struct
1613	os	ProcessState	struct
1614	os	LinkError	struct
1615	pty	PtyError	struct
1616	os	File	struct
1617	os	FileInfo	
1618	os	FileMode	uint32
1619	user	User	struct
1620	user	Group	struct
1621	user	UnknownUserIdError	int
1622	user	UnknownUserError	string
1623	user	UnknownGroupIdError	string
1624	user	UnknownGroupError	string
1625	filepath	WalkFunc	func(string, os.FileInfo, error) error
1626	plugin	Plugin	struct
1627	plugin	Symbol	interface{}
1628	reflect	Type	
1629	reflect	Kind	uint
1630	reflect	ChanDir	int
1631	reflect	Method	struct
1632	reflect	StructField	struct
1633	reflect	StructTag	string
1634	reflect	Value	struct
1635	reflect	ValueError	struct
1636	reflect	StringHeader	struct
1637	reflect	SliceHeader	struct
1638	reflect	SelectDir	int
1639	reflect	SelectCase	struct
1640	regexp	Regexp	struct
1641	syntax	Error	struct
1642	syntax	ErrorCode	string
1643	syntax	Flags	uint16
1644	syntax	Prog	struct
1645	syntax	InstOp	uint8
1646	syntax	EmptyOp	uint8
1647	syntax	Inst	struct
1648	syntax	Regexp	struct
1649	syntax	Op	uint8
1650	debug	GCStats	struct
1651	runtime	Usigset	C.__sigset_t
1652	runtime	Fpxreg	C.struct__libc_fpxreg
1653	runtime	Xmmreg	C.struct__libc_xmmreg
1654	runtime	Fpstate	C.struct__libc_fpstate
1655	runtime	Fpxreg1	C.struct__fpxreg
1656	runtime	Xmmreg1	C.struct__xmmreg
1657	runtime	Fpstate1	C.struct__fpstate
1658	runtime	Fpreg1	C.struct__fpreg
1659	runtime	StackT	C.stack_t
1660	runtime	Mcontext	C.mcontext_t
1661	runtime	Ucontext	C.ucontext_t
1662	runtime	Sigcontext	C.struct_sigcontext
1663	runtime	Fpreg	C.struct__fpreg
1664	runtime	Fpxreg	C.struct__fpxreg
1665	runtime	Xmmreg	C.struct__xmmreg
1666	runtime	Fpstate	C.struct__fpstate
1667	runtime	Timespec	C.struct_timespec
1668	runtime	Timeval	C.struct_timeval
1669	runtime	Sigaction	C.struct_kernel_sigaction
1670	runtime	Siginfo	C.siginfo_t
1671	runtime	StackT	C.stack_t
1672	runtime	Sigcontext	C.struct_sigcontext
1673	runtime	Ucontext	C.struct_ucontext
1674	runtime	Itimerval	C.struct_itimerval
1675	runtime	EpollEvent	C.struct_epoll_event
1676	runtime	Usigset	C.__sigset_t
1677	runtime	Ptregs	C.struct_pt_regs
1678	runtime	Gregset	C.elf_gregset_t
1679	runtime	FPregset	C.elf_fpregset_t
1680	runtime	Vreg	C.elf_vrreg_t
1681	runtime	StackT	C.stack_t
1682	runtime	Sigcontext	C.struct_sigcontext
1683	runtime	Ucontext	C.struct_ucontext
1684	runtime	Timespec	C.struct_timespec
1685	runtime	StackT	C.stack_t
1686	runtime	Sigcontext	C.struct_sigcontext
1687	runtime	Ucontext	C.struct_ucontext
1688	runtime	Timeval	C.struct_timeval
1689	runtime	Itimerval	C.struct_itimerval
1690	runtime	Siginfo	C.struct_xsiginfo
1691	runtime	Sigaction	C.struct_xsigaction
1692	runtime	MachBody	C.mach_msg_body_t
1693	runtime	MachHeader	C.mach_msg_header_t
1694	runtime	MachNDR	C.NDR_record_t
1695	runtime	MachPort	C.mach_msg_port_descriptor_t
1696	runtime	StackT	C.struct_sigaltstack
1697	runtime	Sighandler	C.union___sigaction_u
1698	runtime	Sigaction	C.struct___sigaction
1699	runtime	Usigaction	C.struct_sigaction
1700	runtime	Sigval	C.union_sigval
1701	runtime	Siginfo	C.siginfo_t
1702	runtime	Timeval	C.struct_timeval
1703	runtime	Itimerval	C.struct_itimerval
1704	runtime	Timespec	C.struct_timespec
1705	runtime	FPControl	C.struct_fp_control
1706	runtime	FPStatus	C.struct_fp_status
1707	runtime	RegMMST	C.struct_mmst_reg
1708	runtime	RegXMM	C.struct_xmm_reg
1709	runtime	Regs64	C.struct_x86_thread_state64
1710	runtime	FloatState64	C.struct_x86_float_state64
1711	runtime	ExceptionState64	C.struct_x86_exception_state64
1712	runtime	Mcontext64	C.struct_mcontext64
1713	runtime	Regs32	C.struct_i386_thread_state
1714	runtime	FloatState32	C.struct_i386_float_state
1715	runtime	ExceptionState32	C.struct_i386_exception_state
1716	runtime	Mcontext32	C.struct_mcontext32
1717	runtime	Ucontext	C.struct_ucontext
1718	runtime	Kevent	C.struct_kevent
1719	runtime	Rtprio	C.struct_rtprio
1720	runtime	Lwpparams	C.struct_lwp_params
1721	runtime	Sigset	C.struct___sigset
1722	runtime	StackT	C.stack_t
1723	runtime	Siginfo	C.siginfo_t
1724	runtime	Mcontext	C.mcontext_t
1725	runtime	Ucontext	C.ucontext_t
1726	runtime	Timespec	C.struct_timespec
1727	runtime	Timeval	C.struct_timeval
1728	runtime	Itimerval	C.struct_itimerval
1729	runtime	Kevent	C.struct_kevent
1730	runtime	Rtprio	C.struct_rtprio
1731	runtime	ThrParam	C.struct_thr_param
1732	runtime	Sigset	C.struct___sigset
1733	runtime	StackT	C.stack_t
1734	runtime	Siginfo	C.siginfo_t
1735	runtime	Mcontext	C.mcontext_t
1736	runtime	Ucontext	C.ucontext_t
1737	runtime	Timespec	C.struct_timespec
1738	runtime	Timeval	C.struct_timeval
1739	runtime	Itimerval	C.struct_itimerval
1740	runtime	Umtx_time	C.struct__umtx_time
1741	runtime	Kevent	C.struct_kevent
1742	runtime	Sigset	C.sigset_t
1743	runtime	Timespec	C.struct_timespec
1744	runtime	Timeval	C.struct_timeval
1745	runtime	Sigaction	C.struct_sigaction
1746	runtime	Siginfo	C.siginfo_t
1747	runtime	Itimerval	C.struct_itimerval
1748	runtime	EpollEvent	C.struct_epoll_event
1749	runtime	Sigset	C.sigset_t
1750	runtime	Siginfo	C.struct__ksiginfo
1751	runtime	StackT	C.stack_t
1752	runtime	Timespec	C.struct_timespec
1753	runtime	Timeval	C.struct_timeval
1754	runtime	Itimerval	C.struct_itimerval
1755	runtime	McontextT	C.mcontext_t
1756	runtime	UcontextT	C.ucontext_t
1757	runtime	Kevent	C.struct_kevent
1758	runtime	TforkT	C.struct___tfork
1759	runtime	Sigcontext	C.struct_sigcontext
1760	runtime	Siginfo	C.siginfo_t
1761	runtime	Sigset	C.sigset_t
1762	runtime	Sigval	C.union_sigval
1763	runtime	StackT	C.stack_t
1764	runtime	Timespec	C.struct_timespec
1765	runtime	Timeval	C.struct_timeval
1766	runtime	Itimerval	C.struct_itimerval
1767	runtime	KeventT	C.struct_kevent
1768	runtime	SemT	C.sem_t
1769	runtime	Sigset	C.sigset_t
1770	runtime	StackT	C.stack_t
1771	runtime	Siginfo	C.siginfo_t
1772	runtime	Sigaction	C.struct_sigaction
1773	runtime	Fpregset	C.fpregset_t
1774	runtime	Mcontext	C.mcontext_t
1775	runtime	Ucontext	C.ucontext_t
1776	runtime	Timespec	C.struct_timespec
1777	runtime	Timeval	C.struct_timeval
1778	runtime	Itimerval	C.struct_itimerval
1779	runtime	PortEvent	C.port_event_t
1780	runtime	Pthread	C.pthread_t
1781	runtime	PthreadAttr	C.pthread_attr_t
1782	runtime	Stat	C.struct_stat
1783	runtime	SystemInfo	C.SYSTEM_INFO
1784	runtime	ExceptionRecord	C.EXCEPTION_RECORD
1785	runtime	FloatingSaveArea	C.FLOATING_SAVE_AREA
1786	runtime	M128a	C.M128A
1787	runtime	Context	C.CONTEXT
1788	runtime	Overlapped	C.OVERLAPPED
1789	runtime	Error	
1790	runtime	TypeAssertionError	struct
1791	sys	ArchFamilyType	int
1792	sys	Uintreg	uint32
1793	sys	Uintreg	uint64
1794	sys	Uintreg	uint64
1795	sys	Uintreg	uint32
1796	sys	Uintreg	uint64
1797	sys	Uintreg	uint32
1798	sys	Uintreg	uint64
1799	sys	Uintreg	uint64
1800	sys	Uintreg	uint32
1801	sys	Uintreg	uint64
1802	sys	Uintreg	uint64
1803	sys	Uintreg	uint64
1804	runtime	StackRecord	struct
1805	runtime	MemProfileRecord	struct
1806	runtime	BlockProfileRecord	struct
1807	runtime	MemStats	struct
1808	profile	TagMatch	func(string, int64) bool
1809	profile	Profile	struct
1810	profile	ValueType	struct
1811	profile	Sample	struct
1812	profile	Label	struct
1813	profile	Mapping	struct
1814	profile	Location	struct
1815	profile	Line	struct
1816	profile	Function	struct
1817	profile	Demangler	func([]string) (map[string]string, error)
1818	pprof	LabelSet	struct
1819	pprof	Profile	struct
1820	runtime	Frames	struct
1821	runtime	Frame	struct
1822	runtime	Func	struct
1823	sort	Interface	
1824	sort	IntSlice	[]int
1825	sort	Float64Slice	[]float64
1826	sort	StringSlice	[]string
1827	strconv	NumError	struct
1828	strings	Builder	struct
1829	strings	Reader	struct
1830	strings	Replacer	struct
1831	atomic	Value	struct
1832	sync	Cond	struct
1833	sync	Map	struct
1834	sync	Mutex	struct
1835	sync	Locker	
1836	sync	Once	struct
1837	sync	Pool	struct
1838	sync	RWMutex	struct
1839	sync	WaitGroup	struct
1840	syscall	Qid	struct
1841	syscall	Dir	struct
1842	syscall	DLLError	struct
1843	syscall	DLL	struct
1844	syscall	Proc	struct
1845	syscall	LazyDLL	struct
1846	syscall	LazyProc	struct
1847	syscall	SysProcAttr	struct
1848	syscall	SysProcIDMap	struct
1849	syscall	SysProcAttr	struct
1850	syscall	ProcAttr	struct
1851	syscall	SysProcAttr	struct
1852	syscall	SysProcAttr	struct
1853	syscall	Credential	struct
1854	syscall	ProcAttr	struct
1855	syscall	ProcAttr	struct
1856	syscall	SysProcAttr	struct
1857	main	Param	struct
1858	main	Rets	struct
1859	main	Fn	struct
1860	main	Source	struct
1861	syscall	RawConn	
1862	syscall	Conn	
1863	syscall	Sockaddr	
1864	syscall	SockaddrInet4	struct
1865	syscall	SockaddrInet6	struct
1866	syscall	SockaddrUnix	struct
1867	syscall	SockaddrDatalink	struct
1868	syscall	RoutingMessage	
1869	syscall	IPMreq	struct
1870	syscall	IPv6Mreq	struct
1871	syscall	Linger	struct
1872	syscall	ICMPv6Filter	struct
1873	syscall	NetlinkRouteRequest	struct
1874	syscall	NetlinkMessage	struct
1875	syscall	NetlinkRouteAttr	struct
1876	syscall	RoutingMessage	
1877	syscall	RouteMessage	struct
1878	syscall	InterfaceMessage	struct
1879	syscall	InterfaceAddrMessage	struct
1880	syscall	InterfaceMulticastAddrMessage	struct
1881	syscall	InterfaceAnnounceMessage	struct
1882	syscall	InterfaceMulticastAddrMessage	struct
1883	syscall	InterfaceAnnounceMessage	struct
1884	syscall	InterfaceMulticastAddrMessage	struct
1885	syscall	InterfaceAnnounceMessage	struct
1886	syscall	InterfaceAnnounceMessage	struct
1887	syscall	UserInfo10	struct
1888	syscall	SID	struct
1889	syscall	SIDAndAttributes	struct
1890	syscall	Tokenuser	struct
1891	syscall	Tokenprimarygroup	struct
1892	syscall	Token	syscall.Handle
1893	syscall	SocketControlMessage	struct
1894	syscall	WaitStatus	uint32
1895	syscall	SockaddrDatalink	struct
1896	syscall	SockaddrDatalink	struct
1897	syscall	SockaddrDatalink	struct
1898	syscall	WaitStatus	uint32
1899	syscall	SockaddrLinklayer	struct
1900	syscall	SockaddrNetlink	struct
1901	syscall	Dirent	struct
1902	syscall	Errno	uintptr
1903	syscall	Signal	int
1904	syscall	Stat_t	struct
1905	syscall	WaitStatus	uint32
1906	syscall	Rusage	struct
1907	syscall	ProcAttr	struct
1908	syscall	SysProcAttr	struct
1909	syscall	Iovec	struct
1910	syscall	Timespec	struct
1911	syscall	Timeval	struct
1912	syscall	Timespec	struct
1913	syscall	Timeval	struct
1914	syscall	Timespec	struct
1915	syscall	Timeval	struct
1916	syscall	SockaddrDatalink	struct
1917	syscall	SockaddrDatalink	struct
1918	syscall	ErrorString	string
1919	syscall	Note	string
1920	syscall	Waitmsg	struct
1921	syscall	Timespec	struct
1922	syscall	Timeval	struct
1923	syscall	SockaddrDatalink	struct
1924	syscall	WaitStatus	uint32
1925	syscall	Errno	uintptr
1926	syscall	Signal	int
1927	syscall	Sockaddr	
1928	syscall	SockaddrInet4	struct
1929	syscall	SockaddrInet6	struct
1930	syscall	SockaddrUnix	struct
1931	syscall	Handle	uintptr
1932	syscall	Errno	uintptr
1933	syscall	RawSockaddrInet4	struct
1934	syscall	RawSockaddrInet6	struct
1935	syscall	RawSockaddr	struct
1936	syscall	RawSockaddrAny	struct
1937	syscall	Sockaddr	
1938	syscall	SockaddrInet4	struct
1939	syscall	SockaddrInet6	struct
1940	syscall	SockaddrUnix	struct
1941	syscall	Rusage	struct
1942	syscall	WaitStatus	struct
1943	syscall	Timespec	struct
1944	syscall	Linger	struct
1945	syscall	IPMreq	struct
1946	syscall	IPv6Mreq	struct
1947	syscall	Signal	int
1948	syscall	Timespec	C.struct_timespec
1949	syscall	Timeval	C.struct_timeval
1950	syscall	Timeval32	C.struct_timeval32
1951	syscall	Rusage	C.struct_rusage
1952	syscall	Rlimit	C.struct_rlimit
1953	syscall	Stat_t	C.struct_stat64
1954	syscall	Statfs_t	C.struct_statfs64
1955	syscall	Flock_t	C.struct_flock
1956	syscall	Fstore_t	C.struct_fstore
1957	syscall	Radvisory_t	C.struct_radvisory
1958	syscall	Fbootstraptransfer_t	C.struct_fbootstraptransfer
1959	syscall	Log2phys_t	C.struct_log2phys
1960	syscall	Fsid	C.struct_fsid
1961	syscall	Dirent	C.struct_dirent
1962	syscall	RawSockaddrInet4	C.struct_sockaddr_in
1963	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
1964	syscall	RawSockaddrUnix	C.struct_sockaddr_un
1965	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
1966	syscall	RawSockaddr	C.struct_sockaddr
1967	syscall	RawSockaddrAny	C.struct_sockaddr_any
1968	syscall	Linger	C.struct_linger
1969	syscall	Iovec	C.struct_iovec
1970	syscall	IPMreq	C.struct_ip_mreq
1971	syscall	IPv6Mreq	C.struct_ipv6_mreq
1972	syscall	Msghdr	C.struct_msghdr
1973	syscall	Cmsghdr	C.struct_cmsghdr
1974	syscall	Inet4Pktinfo	C.struct_in_pktinfo
1975	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
1976	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
1977	syscall	ICMPv6Filter	C.struct_icmp6_filter
1978	syscall	Kevent_t	C.struct_kevent
1979	syscall	FdSet	C.fd_set
1980	syscall	IfMsghdr	C.struct_if_msghdr
1981	syscall	IfData	C.struct_if_data
1982	syscall	IfaMsghdr	C.struct_ifa_msghdr
1983	syscall	IfmaMsghdr	C.struct_ifma_msghdr
1984	syscall	IfmaMsghdr2	C.struct_ifma_msghdr2
1985	syscall	RtMsghdr	C.struct_rt_msghdr
1986	syscall	RtMetrics	C.struct_rt_metrics
1987	syscall	BpfVersion	C.struct_bpf_version
1988	syscall	BpfStat	C.struct_bpf_stat
1989	syscall	BpfProgram	C.struct_bpf_program
1990	syscall	BpfInsn	C.struct_bpf_insn
1991	syscall	BpfHdr	C.struct_bpf_hdr
1992	syscall	Termios	C.struct_termios
1993	syscall	Timespec	C.struct_timespec
1994	syscall	Timeval	C.struct_timeval
1995	syscall	Rusage	C.struct_rusage
1996	syscall	Rlimit	C.struct_rlimit
1997	syscall	Stat_t	C.struct_stat
1998	syscall	Statfs_t	C.struct_statfs
1999	syscall	Flock_t	C.struct_flock
2000	syscall	Dirent	C.struct_dirent
2001	syscall	Fsid	C.struct_fsid
2002	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2003	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2004	syscall	RawSockaddrUnix	C.struct_sockaddr_un
2005	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
2006	syscall	RawSockaddr	C.struct_sockaddr
2007	syscall	RawSockaddrAny	C.struct_sockaddr_any
2008	syscall	Linger	C.struct_linger
2009	syscall	Iovec	C.struct_iovec
2010	syscall	IPMreq	C.struct_ip_mreq
2011	syscall	IPv6Mreq	C.struct_ipv6_mreq
2012	syscall	Msghdr	C.struct_msghdr
2013	syscall	Cmsghdr	C.struct_cmsghdr
2014	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2015	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2016	syscall	ICMPv6Filter	C.struct_icmp6_filter
2017	syscall	Kevent_t	C.struct_kevent
2018	syscall	FdSet	C.fd_set
2019	syscall	IfMsghdr	C.struct_if_msghdr
2020	syscall	IfData	C.struct_if_data
2021	syscall	IfaMsghdr	C.struct_ifa_msghdr
2022	syscall	IfmaMsghdr	C.struct_ifma_msghdr
2023	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
2024	syscall	RtMsghdr	C.struct_rt_msghdr
2025	syscall	RtMetrics	C.struct_rt_metrics
2026	syscall	BpfVersion	C.struct_bpf_version
2027	syscall	BpfStat	C.struct_bpf_stat
2028	syscall	BpfProgram	C.struct_bpf_program
2029	syscall	BpfInsn	C.struct_bpf_insn
2030	syscall	BpfHdr	C.struct_bpf_hdr
2031	syscall	Termios	C.struct_termios
2032	syscall	Timespec	C.struct_timespec
2033	syscall	Timeval	C.struct_timeval
2034	syscall	Rusage	C.struct_rusage
2035	syscall	Rlimit	C.struct_rlimit
2036	syscall	Stat_t	C.struct_stat8
2037	syscall	Statfs_t	C.struct_statfs
2038	syscall	Flock_t	C.struct_flock
2039	syscall	Dirent	C.struct_dirent
2040	syscall	Fsid	C.struct_fsid
2041	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2042	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2043	syscall	RawSockaddrUnix	C.struct_sockaddr_un
2044	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
2045	syscall	RawSockaddr	C.struct_sockaddr
2046	syscall	RawSockaddrAny	C.struct_sockaddr_any
2047	syscall	Linger	C.struct_linger
2048	syscall	Iovec	C.struct_iovec
2049	syscall	IPMreq	C.struct_ip_mreq
2050	syscall	IPMreqn	C.struct_ip_mreqn
2051	syscall	IPv6Mreq	C.struct_ipv6_mreq
2052	syscall	Msghdr	C.struct_msghdr
2053	syscall	Cmsghdr	C.struct_cmsghdr
2054	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2055	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2056	syscall	ICMPv6Filter	C.struct_icmp6_filter
2057	syscall	Kevent_t	C.struct_kevent
2058	syscall	FdSet	C.fd_set
2059	syscall	IfMsghdr	C.struct_if_msghdr8
2060	syscall	IfData	C.struct_if_data8
2061	syscall	IfaMsghdr	C.struct_ifa_msghdr
2062	syscall	IfmaMsghdr	C.struct_ifma_msghdr
2063	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
2064	syscall	RtMsghdr	C.struct_rt_msghdr
2065	syscall	RtMetrics	C.struct_rt_metrics
2066	syscall	BpfVersion	C.struct_bpf_version
2067	syscall	BpfStat	C.struct_bpf_stat
2068	syscall	BpfZbuf	C.struct_bpf_zbuf
2069	syscall	BpfProgram	C.struct_bpf_program
2070	syscall	BpfInsn	C.struct_bpf_insn
2071	syscall	BpfHdr	C.struct_bpf_hdr
2072	syscall	BpfZbufHeader	C.struct_bpf_zbuf_header
2073	syscall	Termios	C.struct_termios
2074	syscall	Timespec	C.struct_timespec
2075	syscall	Timeval	C.struct_timeval
2076	syscall	Timex	C.struct_timex
2077	syscall	Time_t	C.time_t
2078	syscall	Tms	C.struct_tms
2079	syscall	Utimbuf	C.struct_utimbuf
2080	syscall	Rusage	C.struct_rusage
2081	syscall	Rlimit	C.struct_rlimit
2082	syscall	Stat_t	C.struct_stat
2083	syscall	Statfs_t	C.struct_statfs
2084	syscall	Dirent	C.struct_dirent
2085	syscall	Fsid	C.fsid_t
2086	syscall	Flock_t	C.struct_flock
2087	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2088	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2089	syscall	RawSockaddrUnix	C.struct_my_sockaddr_un
2090	syscall	RawSockaddrLinklayer	C.struct_sockaddr_ll
2091	syscall	RawSockaddrNetlink	C.struct_sockaddr_nl
2092	syscall	RawSockaddr	C.struct_sockaddr
2093	syscall	RawSockaddrAny	C.struct_sockaddr_any
2094	syscall	Linger	C.struct_linger
2095	syscall	Iovec	C.struct_iovec
2096	syscall	IPMreq	C.struct_ip_mreq
2097	syscall	IPMreqn	C.struct_ip_mreqn
2098	syscall	IPv6Mreq	C.struct_ipv6_mreq
2099	syscall	Msghdr	C.struct_msghdr
2100	syscall	Cmsghdr	C.struct_cmsghdr
2101	syscall	Inet4Pktinfo	C.struct_in_pktinfo
2102	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2103	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2104	syscall	ICMPv6Filter	C.struct_icmp6_filter
2105	syscall	Ucred	C.struct_ucred
2106	syscall	TCPInfo	C.struct_tcp_info
2107	syscall	NlMsghdr	C.struct_nlmsghdr
2108	syscall	NlMsgerr	C.struct_nlmsgerr
2109	syscall	RtGenmsg	C.struct_rtgenmsg
2110	syscall	NlAttr	C.struct_nlattr
2111	syscall	RtAttr	C.struct_rtattr
2112	syscall	IfInfomsg	C.struct_ifinfomsg
2113	syscall	IfAddrmsg	C.struct_ifaddrmsg
2114	syscall	RtMsg	C.struct_rtmsg
2115	syscall	RtNexthop	C.struct_rtnexthop
2116	syscall	SockFilter	C.struct_sock_filter
2117	syscall	SockFprog	C.struct_sock_fprog
2118	syscall	InotifyEvent	C.struct_inotify_event
2119	syscall	PtraceRegs	C.PtraceRegs
2120	syscall	FdSet	C.fd_set
2121	syscall	Sysinfo_t	C.struct_sysinfo
2122	syscall	Utsname	C.struct_utsname
2123	syscall	Ustat_t	C.struct_ustat
2124	syscall	EpollEvent	C.struct_my_epoll_event
2125	syscall	Termios	C.struct_termios
2126	syscall	Timespec	C.struct_timespec
2127	syscall	Timeval	C.struct_timeval
2128	syscall	Rusage	C.struct_rusage
2129	syscall	Rlimit	C.struct_rlimit
2130	syscall	Stat_t	C.struct_stat
2131	syscall	Statfs_t	C.struct_statfs
2132	syscall	Flock_t	C.struct_flock
2133	syscall	Dirent	C.struct_dirent
2134	syscall	Fsid	C.fsid_t
2135	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2136	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2137	syscall	RawSockaddrUnix	C.struct_sockaddr_un
2138	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
2139	syscall	RawSockaddr	C.struct_sockaddr
2140	syscall	RawSockaddrAny	C.struct_sockaddr_any
2141	syscall	Linger	C.struct_linger
2142	syscall	Iovec	C.struct_iovec
2143	syscall	IPMreq	C.struct_ip_mreq
2144	syscall	IPv6Mreq	C.struct_ipv6_mreq
2145	syscall	Msghdr	C.struct_msghdr
2146	syscall	Cmsghdr	C.struct_cmsghdr
2147	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2148	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2149	syscall	ICMPv6Filter	C.struct_icmp6_filter
2150	syscall	Kevent_t	C.struct_kevent
2151	syscall	FdSet	C.fd_set
2152	syscall	IfMsghdr	C.struct_if_msghdr
2153	syscall	IfData	C.struct_if_data
2154	syscall	IfaMsghdr	C.struct_ifa_msghdr
2155	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
2156	syscall	RtMsghdr	C.struct_rt_msghdr
2157	syscall	RtMetrics	C.struct_rt_metrics
2158	syscall	Mclpool	C.struct_mclpool
2159	syscall	BpfVersion	C.struct_bpf_version
2160	syscall	BpfStat	C.struct_bpf_stat
2161	syscall	BpfProgram	C.struct_bpf_program
2162	syscall	BpfInsn	C.struct_bpf_insn
2163	syscall	BpfHdr	C.struct_bpf_hdr
2164	syscall	BpfTimeval	C.struct_bpf_timeval
2165	syscall	Termios	C.struct_termios
2166	syscall	Sysctlnode	C.struct_sysctlnode
2167	syscall	Timespec	C.struct_timespec
2168	syscall	Timeval	C.struct_timeval
2169	syscall	Rusage	C.struct_rusage
2170	syscall	Rlimit	C.struct_rlimit
2171	syscall	Stat_t	C.struct_stat
2172	syscall	Statfs_t	C.struct_statfs
2173	syscall	Flock_t	C.struct_flock
2174	syscall	Dirent	C.struct_dirent
2175	syscall	Fsid	C.fsid_t
2176	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2177	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2178	syscall	RawSockaddrUnix	C.struct_sockaddr_un
2179	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
2180	syscall	RawSockaddr	C.struct_sockaddr
2181	syscall	RawSockaddrAny	C.struct_sockaddr_any
2182	syscall	Linger	C.struct_linger
2183	syscall	Iovec	C.struct_iovec
2184	syscall	IPMreq	C.struct_ip_mreq
2185	syscall	IPv6Mreq	C.struct_ipv6_mreq
2186	syscall	Msghdr	C.struct_msghdr
2187	syscall	Cmsghdr	C.struct_cmsghdr
2188	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2189	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2190	syscall	ICMPv6Filter	C.struct_icmp6_filter
2191	syscall	Kevent_t	C.struct_kevent
2192	syscall	FdSet	C.fd_set
2193	syscall	IfMsghdr	C.struct_if_msghdr
2194	syscall	IfData	C.struct_if_data
2195	syscall	IfaMsghdr	C.struct_ifa_msghdr
2196	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
2197	syscall	RtMsghdr	C.struct_rt_msghdr
2198	syscall	RtMetrics	C.struct_rt_metrics
2199	syscall	Mclpool	C.struct_mclpool
2200	syscall	BpfVersion	C.struct_bpf_version
2201	syscall	BpfStat	C.struct_bpf_stat
2202	syscall	BpfProgram	C.struct_bpf_program
2203	syscall	BpfInsn	C.struct_bpf_insn
2204	syscall	BpfHdr	C.struct_bpf_hdr
2205	syscall	BpfTimeval	C.struct_bpf_timeval
2206	syscall	Termios	C.struct_termios
2207	syscall	Timespec	C.struct_timespec
2208	syscall	Timeval	C.struct_timeval
2209	syscall	Timeval32	C.struct_timeval32
2210	syscall	Rusage	C.struct_rusage
2211	syscall	Rlimit	C.struct_rlimit
2212	syscall	Stat_t	C.struct_stat
2213	syscall	Flock_t	C.struct_flock
2214	syscall	Dirent	C.struct_dirent
2215	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2216	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2217	syscall	RawSockaddrUnix	C.struct_sockaddr_un
2218	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
2219	syscall	RawSockaddr	C.struct_sockaddr
2220	syscall	RawSockaddrAny	C.struct_sockaddr_any
2221	syscall	Linger	C.struct_linger
2222	syscall	Iovec	C.struct_iovec
2223	syscall	IPMreq	C.struct_ip_mreq
2224	syscall	IPv6Mreq	C.struct_ipv6_mreq
2225	syscall	Msghdr	C.struct_msghdr
2226	syscall	Cmsghdr	C.struct_cmsghdr
2227	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2228	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2229	syscall	ICMPv6Filter	C.struct_icmp6_filter
2230	syscall	FdSet	C.fd_set
2231	syscall	IfMsghdr	C.struct_if_msghdr
2232	syscall	IfData	C.struct_if_data
2233	syscall	IfaMsghdr	C.struct_ifa_msghdr
2234	syscall	RtMsghdr	C.struct_rt_msghdr
2235	syscall	RtMetrics	C.struct_rt_metrics
2236	syscall	BpfVersion	C.struct_bpf_version
2237	syscall	BpfStat	C.struct_bpf_stat
2238	syscall	BpfProgram	C.struct_bpf_program
2239	syscall	BpfInsn	C.struct_bpf_insn
2240	syscall	BpfTimeval	C.struct_bpf_timeval
2241	syscall	BpfHdr	C.struct_bpf_hdr
2242	syscall	Termios	C.struct_termios
2243	syscall	Timeval	struct
2244	syscall	SecurityAttributes	struct
2245	syscall	Overlapped	struct
2246	syscall	FileNotifyInformation	struct
2247	syscall	Filetime	struct
2248	syscall	Win32finddata	struct
2249	syscall	ByHandleFileInformation	struct
2250	syscall	Win32FileAttributeData	struct
2251	syscall	StartupInfo	struct
2252	syscall	ProcessInformation	struct
2253	syscall	ProcessEntry32	struct
2254	syscall	Systemtime	struct
2255	syscall	Timezoneinformation	struct
2256	syscall	WSABuf	struct
2257	syscall	Hostent	struct
2258	syscall	Protoent	struct
2259	syscall	DNSSRVData	struct
2260	syscall	DNSPTRData	struct
2261	syscall	DNSMXData	struct
2262	syscall	DNSTXTData	struct
2263	syscall	DNSRecord	struct
2264	syscall	TransmitFileBuffers	struct
2265	syscall	SockaddrGen	[]byte
2266	syscall	InterfaceInfo	struct
2267	syscall	IpAddressString	struct
2268	syscall	IpMaskString	syscall.IpAddressString
2269	syscall	IpAddrString	struct
2270	syscall	IpAdapterInfo	struct
2271	syscall	MibIfRow	struct
2272	syscall	CertContext	struct
2273	syscall	CertChainContext	struct
2274	syscall	CertSimpleChain	struct
2275	syscall	CertChainElement	struct
2276	syscall	CertRevocationInfo	struct
2277	syscall	CertTrustStatus	struct
2278	syscall	CertUsageMatch	struct
2279	syscall	CertEnhKeyUsage	struct
2280	syscall	CertChainPara	struct
2281	syscall	CertChainPolicyPara	struct
2282	syscall	SSLExtraCertChainPolicyPara	struct
2283	syscall	CertChainPolicyStatus	struct
2284	syscall	AddrinfoW	struct
2285	syscall	GUID	struct
2286	syscall	WSAProtocolInfo	struct
2287	syscall	WSAProtocolChain	struct
2288	syscall	TCPKeepalive	struct
2289	syscall	WSAData	struct
2290	syscall	Servent	struct
2291	syscall	WSAData	struct
2292	syscall	Servent	struct
2293	syscall	Timespec	struct
2294	syscall	Timeval	struct
2295	syscall	Timeval32	[]byte
2296	syscall	Rusage	struct
2297	syscall	Rlimit	struct
2298	syscall	Stat_t	struct
2299	syscall	Statfs_t	struct
2300	syscall	Flock_t	struct
2301	syscall	Fstore_t	struct
2302	syscall	Radvisory_t	struct
2303	syscall	Fbootstraptransfer_t	struct
2304	syscall	Log2phys_t	struct
2305	syscall	Fsid	struct
2306	syscall	Dirent	struct
2307	syscall	RawSockaddrInet4	struct
2308	syscall	RawSockaddrInet6	struct
2309	syscall	RawSockaddrUnix	struct
2310	syscall	RawSockaddrDatalink	struct
2311	syscall	RawSockaddr	struct
2312	syscall	RawSockaddrAny	struct
2313	syscall	Linger	struct
2314	syscall	Iovec	struct
2315	syscall	IPMreq	struct
2316	syscall	IPv6Mreq	struct
2317	syscall	Msghdr	struct
2318	syscall	Cmsghdr	struct
2319	syscall	Inet4Pktinfo	struct
2320	syscall	Inet6Pktinfo	struct
2321	syscall	IPv6MTUInfo	struct
2322	syscall	ICMPv6Filter	struct
2323	syscall	Kevent_t	struct
2324	syscall	FdSet	struct
2325	syscall	IfMsghdr	struct
2326	syscall	IfData	struct
2327	syscall	IfaMsghdr	struct
2328	syscall	IfmaMsghdr	struct
2329	syscall	IfmaMsghdr2	struct
2330	syscall	RtMsghdr	struct
2331	syscall	RtMetrics	struct
2332	syscall	BpfVersion	struct
2333	syscall	BpfStat	struct
2334	syscall	BpfProgram	struct
2335	syscall	BpfInsn	struct
2336	syscall	BpfHdr	struct
2337	syscall	Termios	struct
2338	syscall	Timespec	struct
2339	syscall	Timeval	struct
2340	syscall	Timeval32	struct
2341	syscall	Rusage	struct
2342	syscall	Rlimit	struct
2343	syscall	Stat_t	struct
2344	syscall	Statfs_t	struct
2345	syscall	Flock_t	struct
2346	syscall	Fstore_t	struct
2347	syscall	Radvisory_t	struct
2348	syscall	Fbootstraptransfer_t	struct
2349	syscall	Log2phys_t	struct
2350	syscall	Fsid	struct
2351	syscall	Dirent	struct
2352	syscall	RawSockaddrInet4	struct
2353	syscall	RawSockaddrInet6	struct
2354	syscall	RawSockaddrUnix	struct
2355	syscall	RawSockaddrDatalink	struct
2356	syscall	RawSockaddr	struct
2357	syscall	RawSockaddrAny	struct
2358	syscall	Linger	struct
2359	syscall	Iovec	struct
2360	syscall	IPMreq	struct
2361	syscall	IPv6Mreq	struct
2362	syscall	Msghdr	struct
2363	syscall	Cmsghdr	struct
2364	syscall	Inet4Pktinfo	struct
2365	syscall	Inet6Pktinfo	struct
2366	syscall	IPv6MTUInfo	struct
2367	syscall	ICMPv6Filter	struct
2368	syscall	Kevent_t	struct
2369	syscall	FdSet	struct
2370	syscall	IfMsghdr	struct
2371	syscall	IfData	struct
2372	syscall	IfaMsghdr	struct
2373	syscall	IfmaMsghdr	struct
2374	syscall	IfmaMsghdr2	struct
2375	syscall	RtMsghdr	struct
2376	syscall	RtMetrics	struct
2377	syscall	BpfVersion	struct
2378	syscall	BpfStat	struct
2379	syscall	BpfProgram	struct
2380	syscall	BpfInsn	struct
2381	syscall	BpfHdr	struct
2382	syscall	Termios	struct
2383	syscall	Timespec	struct
2384	syscall	Timeval	struct
2385	syscall	Timeval32	[]byte
2386	syscall	Rusage	struct
2387	syscall	Rlimit	struct
2388	syscall	Stat_t	struct
2389	syscall	Statfs_t	struct
2390	syscall	Flock_t	struct
2391	syscall	Fstore_t	struct
2392	syscall	Radvisory_t	struct
2393	syscall	Fbootstraptransfer_t	struct
2394	syscall	Log2phys_t	struct
2395	syscall	Fsid	struct
2396	syscall	Dirent	struct
2397	syscall	RawSockaddrInet4	struct
2398	syscall	RawSockaddrInet6	struct
2399	syscall	RawSockaddrUnix	struct
2400	syscall	RawSockaddrDatalink	struct
2401	syscall	RawSockaddr	struct
2402	syscall	RawSockaddrAny	struct
2403	syscall	Linger	struct
2404	syscall	Iovec	struct
2405	syscall	IPMreq	struct
2406	syscall	IPv6Mreq	struct
2407	syscall	Msghdr	struct
2408	syscall	Cmsghdr	struct
2409	syscall	Inet4Pktinfo	struct
2410	syscall	Inet6Pktinfo	struct
2411	syscall	IPv6MTUInfo	struct
2412	syscall	ICMPv6Filter	struct
2413	syscall	Kevent_t	struct
2414	syscall	FdSet	struct
2415	syscall	IfMsghdr	struct
2416	syscall	IfData	struct
2417	syscall	IfaMsghdr	struct
2418	syscall	IfmaMsghdr	struct
2419	syscall	IfmaMsghdr2	struct
2420	syscall	RtMsghdr	struct
2421	syscall	RtMetrics	struct
2422	syscall	BpfVersion	struct
2423	syscall	BpfStat	struct
2424	syscall	BpfProgram	struct
2425	syscall	BpfInsn	struct
2426	syscall	BpfHdr	struct
2427	syscall	Termios	struct
2428	syscall	Timespec	struct
2429	syscall	Timeval	struct
2430	syscall	Timeval32	struct
2431	syscall	Rusage	struct
2432	syscall	Rlimit	struct
2433	syscall	Stat_t	struct
2434	syscall	Statfs_t	struct
2435	syscall	Flock_t	struct
2436	syscall	Fstore_t	struct
2437	syscall	Radvisory_t	struct
2438	syscall	Fbootstraptransfer_t	struct
2439	syscall	Log2phys_t	struct
2440	syscall	Fsid	struct
2441	syscall	Dirent	struct
2442	syscall	RawSockaddrInet4	struct
2443	syscall	RawSockaddrInet6	struct
2444	syscall	RawSockaddrUnix	struct
2445	syscall	RawSockaddrDatalink	struct
2446	syscall	RawSockaddr	struct
2447	syscall	RawSockaddrAny	struct
2448	syscall	Linger	struct
2449	syscall	Iovec	struct
2450	syscall	IPMreq	struct
2451	syscall	IPv6Mreq	struct
2452	syscall	Msghdr	struct
2453	syscall	Cmsghdr	struct
2454	syscall	Inet4Pktinfo	struct
2455	syscall	Inet6Pktinfo	struct
2456	syscall	IPv6MTUInfo	struct
2457	syscall	ICMPv6Filter	struct
2458	syscall	Kevent_t	struct
2459	syscall	FdSet	struct
2460	syscall	IfMsghdr	struct
2461	syscall	IfData	struct
2462	syscall	IfaMsghdr	struct
2463	syscall	IfmaMsghdr	struct
2464	syscall	IfmaMsghdr2	struct
2465	syscall	RtMsghdr	struct
2466	syscall	RtMetrics	struct
2467	syscall	BpfVersion	struct
2468	syscall	BpfStat	struct
2469	syscall	BpfProgram	struct
2470	syscall	BpfInsn	struct
2471	syscall	BpfHdr	struct
2472	syscall	Termios	struct
2473	syscall	Timespec	struct
2474	syscall	Timeval	struct
2475	syscall	Rusage	struct
2476	syscall	Rlimit	struct
2477	syscall	Stat_t	struct
2478	syscall	Statfs_t	struct
2479	syscall	Flock_t	struct
2480	syscall	Dirent	struct
2481	syscall	Fsid	struct
2482	syscall	RawSockaddrInet4	struct
2483	syscall	RawSockaddrInet6	struct
2484	syscall	RawSockaddrUnix	struct
2485	syscall	RawSockaddrDatalink	struct
2486	syscall	RawSockaddr	struct
2487	syscall	RawSockaddrAny	struct
2488	syscall	Linger	struct
2489	syscall	Iovec	struct
2490	syscall	IPMreq	struct
2491	syscall	IPv6Mreq	struct
2492	syscall	Msghdr	struct
2493	syscall	Cmsghdr	struct
2494	syscall	Inet6Pktinfo	struct
2495	syscall	IPv6MTUInfo	struct
2496	syscall	ICMPv6Filter	struct
2497	syscall	Kevent_t	struct
2498	syscall	FdSet	struct
2499	syscall	IfMsghdr	struct
2500	syscall	IfData	struct
2501	syscall	IfaMsghdr	struct
2502	syscall	IfmaMsghdr	struct
2503	syscall	IfAnnounceMsghdr	struct
2504	syscall	RtMsghdr	struct
2505	syscall	RtMetrics	struct
2506	syscall	BpfVersion	struct
2507	syscall	BpfStat	struct
2508	syscall	BpfProgram	struct
2509	syscall	BpfInsn	struct
2510	syscall	BpfHdr	struct
2511	syscall	Termios	struct
2512	syscall	Timespec	struct
2513	syscall	Timeval	struct
2514	syscall	Rusage	struct
2515	syscall	Rlimit	struct
2516	syscall	Stat_t	struct
2517	syscall	Statfs_t	struct
2518	syscall	Flock_t	struct
2519	syscall	Dirent	struct
2520	syscall	Fsid	struct
2521	syscall	RawSockaddrInet4	struct
2522	syscall	RawSockaddrInet6	struct
2523	syscall	RawSockaddrUnix	struct
2524	syscall	RawSockaddrDatalink	struct
2525	syscall	RawSockaddr	struct
2526	syscall	RawSockaddrAny	struct
2527	syscall	Linger	struct
2528	syscall	Iovec	struct
2529	syscall	IPMreq	struct
2530	syscall	IPMreqn	struct
2531	syscall	IPv6Mreq	struct
2532	syscall	Msghdr	struct
2533	syscall	Cmsghdr	struct
2534	syscall	Inet6Pktinfo	struct
2535	syscall	IPv6MTUInfo	struct
2536	syscall	ICMPv6Filter	struct
2537	syscall	Kevent_t	struct
2538	syscall	FdSet	struct
2539	syscall	IfMsghdr	struct
2540	syscall	IfData	struct
2541	syscall	IfaMsghdr	struct
2542	syscall	IfmaMsghdr	struct
2543	syscall	IfAnnounceMsghdr	struct
2544	syscall	RtMsghdr	struct
2545	syscall	RtMetrics	struct
2546	syscall	BpfVersion	struct
2547	syscall	BpfStat	struct
2548	syscall	BpfZbuf	struct
2549	syscall	BpfProgram	struct
2550	syscall	BpfInsn	struct
2551	syscall	BpfHdr	struct
2552	syscall	BpfZbufHeader	struct
2553	syscall	Termios	struct
2554	syscall	Timespec	struct
2555	syscall	Timeval	struct
2556	syscall	Rusage	struct
2557	syscall	Rlimit	struct
2558	syscall	Stat_t	struct
2559	syscall	Statfs_t	struct
2560	syscall	Flock_t	struct
2561	syscall	Dirent	struct
2562	syscall	Fsid	struct
2563	syscall	RawSockaddrInet4	struct
2564	syscall	RawSockaddrInet6	struct
2565	syscall	RawSockaddrUnix	struct
2566	syscall	RawSockaddrDatalink	struct
2567	syscall	RawSockaddr	struct
2568	syscall	RawSockaddrAny	struct
2569	syscall	Linger	struct
2570	syscall	Iovec	struct
2571	syscall	IPMreq	struct
2572	syscall	IPMreqn	struct
2573	syscall	IPv6Mreq	struct
2574	syscall	Msghdr	struct
2575	syscall	Cmsghdr	struct
2576	syscall	Inet6Pktinfo	struct
2577	syscall	IPv6MTUInfo	struct
2578	syscall	ICMPv6Filter	struct
2579	syscall	Kevent_t	struct
2580	syscall	FdSet	struct
2581	syscall	IfMsghdr	struct
2582	syscall	IfData	struct
2583	syscall	IfaMsghdr	struct
2584	syscall	IfmaMsghdr	struct
2585	syscall	IfAnnounceMsghdr	struct
2586	syscall	RtMsghdr	struct
2587	syscall	RtMetrics	struct
2588	syscall	BpfVersion	struct
2589	syscall	BpfStat	struct
2590	syscall	BpfZbuf	struct
2591	syscall	BpfProgram	struct
2592	syscall	BpfInsn	struct
2593	syscall	BpfHdr	struct
2594	syscall	BpfZbufHeader	struct
2595	syscall	Termios	struct
2596	syscall	Timespec	struct
2597	syscall	Timeval	struct
2598	syscall	Rusage	struct
2599	syscall	Rlimit	struct
2600	syscall	Stat_t	struct
2601	syscall	Statfs_t	struct
2602	syscall	Flock_t	struct
2603	syscall	Dirent	struct
2604	syscall	Fsid	struct
2605	syscall	RawSockaddrInet4	struct
2606	syscall	RawSockaddrInet6	struct
2607	syscall	RawSockaddrUnix	struct
2608	syscall	RawSockaddrDatalink	struct
2609	syscall	RawSockaddr	struct
2610	syscall	RawSockaddrAny	struct
2611	syscall	Linger	struct
2612	syscall	Iovec	struct
2613	syscall	IPMreq	struct
2614	syscall	IPMreqn	struct
2615	syscall	IPv6Mreq	struct
2616	syscall	Msghdr	struct
2617	syscall	Cmsghdr	struct
2618	syscall	Inet6Pktinfo	struct
2619	syscall	IPv6MTUInfo	struct
2620	syscall	ICMPv6Filter	struct
2621	syscall	Kevent_t	struct
2622	syscall	FdSet	struct
2623	syscall	IfMsghdr	struct
2624	syscall	IfData	struct
2625	syscall	IfaMsghdr	struct
2626	syscall	IfmaMsghdr	struct
2627	syscall	IfAnnounceMsghdr	struct
2628	syscall	RtMsghdr	struct
2629	syscall	RtMetrics	struct
2630	syscall	BpfVersion	struct
2631	syscall	BpfStat	struct
2632	syscall	BpfZbuf	struct
2633	syscall	BpfProgram	struct
2634	syscall	BpfInsn	struct
2635	syscall	BpfHdr	struct
2636	syscall	BpfZbufHeader	struct
2637	syscall	Termios	struct
2638	syscall	Timespec	struct
2639	syscall	Timeval	struct
2640	syscall	Timex	struct
2641	syscall	Time_t	int32
2642	syscall	Tms	struct
2643	syscall	Utimbuf	struct
2644	syscall	Rusage	struct
2645	syscall	Rlimit	struct
2646	syscall	Stat_t	struct
2647	syscall	Statfs_t	struct
2648	syscall	Dirent	struct
2649	syscall	Fsid	struct
2650	syscall	Flock_t	struct
2651	syscall	RawSockaddrInet4	struct
2652	syscall	RawSockaddrInet6	struct
2653	syscall	RawSockaddrUnix	struct
2654	syscall	RawSockaddrLinklayer	struct
2655	syscall	RawSockaddrNetlink	struct
2656	syscall	RawSockaddr	struct
2657	syscall	RawSockaddrAny	struct
2658	syscall	Linger	struct
2659	syscall	Iovec	struct
2660	syscall	IPMreq	struct
2661	syscall	IPMreqn	struct
2662	syscall	IPv6Mreq	struct
2663	syscall	Msghdr	struct
2664	syscall	Cmsghdr	struct
2665	syscall	Inet4Pktinfo	struct
2666	syscall	Inet6Pktinfo	struct
2667	syscall	IPv6MTUInfo	struct
2668	syscall	ICMPv6Filter	struct
2669	syscall	Ucred	struct
2670	syscall	TCPInfo	struct
2671	syscall	NlMsghdr	struct
2672	syscall	NlMsgerr	struct
2673	syscall	RtGenmsg	struct
2674	syscall	NlAttr	struct
2675	syscall	RtAttr	struct
2676	syscall	IfInfomsg	struct
2677	syscall	IfAddrmsg	struct
2678	syscall	RtMsg	struct
2679	syscall	RtNexthop	struct
2680	syscall	SockFilter	struct
2681	syscall	SockFprog	struct
2682	syscall	InotifyEvent	struct
2683	syscall	PtraceRegs	struct
2684	syscall	FdSet	struct
2685	syscall	Sysinfo_t	struct
2686	syscall	Utsname	struct
2687	syscall	Ustat_t	struct
2688	syscall	EpollEvent	struct
2689	syscall	Termios	struct
2690	syscall	Timespec	struct
2691	syscall	Timeval	struct
2692	syscall	Timex	struct
2693	syscall	Time_t	int64
2694	syscall	Tms	struct
2695	syscall	Utimbuf	struct
2696	syscall	Rusage	struct
2697	syscall	Rlimit	struct
2698	syscall	Stat_t	struct
2699	syscall	Statfs_t	struct
2700	syscall	Dirent	struct
2701	syscall	Fsid	struct
2702	syscall	Flock_t	struct
2703	syscall	RawSockaddrInet4	struct
2704	syscall	RawSockaddrInet6	struct
2705	syscall	RawSockaddrUnix	struct
2706	syscall	RawSockaddrLinklayer	struct
2707	syscall	RawSockaddrNetlink	struct
2708	syscall	RawSockaddr	struct
2709	syscall	RawSockaddrAny	struct
2710	syscall	Linger	struct
2711	syscall	Iovec	struct
2712	syscall	IPMreq	struct
2713	syscall	IPMreqn	struct
2714	syscall	IPv6Mreq	struct
2715	syscall	Msghdr	struct
2716	syscall	Cmsghdr	struct
2717	syscall	Inet4Pktinfo	struct
2718	syscall	Inet6Pktinfo	struct
2719	syscall	IPv6MTUInfo	struct
2720	syscall	ICMPv6Filter	struct
2721	syscall	Ucred	struct
2722	syscall	TCPInfo	struct
2723	syscall	NlMsghdr	struct
2724	syscall	NlMsgerr	struct
2725	syscall	RtGenmsg	struct
2726	syscall	NlAttr	struct
2727	syscall	RtAttr	struct
2728	syscall	IfInfomsg	struct
2729	syscall	IfAddrmsg	struct
2730	syscall	RtMsg	struct
2731	syscall	RtNexthop	struct
2732	syscall	SockFilter	struct
2733	syscall	SockFprog	struct
2734	syscall	InotifyEvent	struct
2735	syscall	PtraceRegs	struct
2736	syscall	FdSet	struct
2737	syscall	Sysinfo_t	struct
2738	syscall	Utsname	struct
2739	syscall	Ustat_t	struct
2740	syscall	EpollEvent	struct
2741	syscall	Termios	struct
2742	syscall	Timespec	struct
2743	syscall	Timeval	struct
2744	syscall	Timex	struct
2745	syscall	Time_t	int32
2746	syscall	Tms	struct
2747	syscall	Utimbuf	struct
2748	syscall	Rusage	struct
2749	syscall	Rlimit	struct
2750	syscall	Stat_t	struct
2751	syscall	Statfs_t	struct
2752	syscall	Dirent	struct
2753	syscall	Fsid	struct
2754	syscall	Flock_t	struct
2755	syscall	RawSockaddrInet4	struct
2756	syscall	RawSockaddrInet6	struct
2757	syscall	RawSockaddrUnix	struct
2758	syscall	RawSockaddrLinklayer	struct
2759	syscall	RawSockaddrNetlink	struct
2760	syscall	RawSockaddr	struct
2761	syscall	RawSockaddrAny	struct
2762	syscall	Linger	struct
2763	syscall	Iovec	struct
2764	syscall	IPMreq	struct
2765	syscall	IPMreqn	struct
2766	syscall	IPv6Mreq	struct
2767	syscall	Msghdr	struct
2768	syscall	Cmsghdr	struct
2769	syscall	Inet4Pktinfo	struct
2770	syscall	Inet6Pktinfo	struct
2771	syscall	IPv6MTUInfo	struct
2772	syscall	ICMPv6Filter	struct
2773	syscall	Ucred	struct
2774	syscall	TCPInfo	struct
2775	syscall	NlMsghdr	struct
2776	syscall	NlMsgerr	struct
2777	syscall	RtGenmsg	struct
2778	syscall	NlAttr	struct
2779	syscall	RtAttr	struct
2780	syscall	IfInfomsg	struct
2781	syscall	IfAddrmsg	struct
2782	syscall	RtMsg	struct
2783	syscall	RtNexthop	struct
2784	syscall	SockFilter	struct
2785	syscall	SockFprog	struct
2786	syscall	InotifyEvent	struct
2787	syscall	PtraceRegs	struct
2788	syscall	FdSet	struct
2789	syscall	Sysinfo_t	struct
2790	syscall	Utsname	struct
2791	syscall	Ustat_t	struct
2792	syscall	EpollEvent	struct
2793	syscall	Termios	struct
2794	syscall	Timespec	struct
2795	syscall	Timeval	struct
2796	syscall	Timex	struct
2797	syscall	Time_t	int64
2798	syscall	Tms	struct
2799	syscall	Utimbuf	struct
2800	syscall	Rusage	struct
2801	syscall	Rlimit	struct
2802	syscall	Stat_t	struct
2803	syscall	Statfs_t	struct
2804	syscall	Dirent	struct
2805	syscall	Fsid	struct
2806	syscall	Flock_t	struct
2807	syscall	RawSockaddrInet4	struct
2808	syscall	RawSockaddrInet6	struct
2809	syscall	RawSockaddrUnix	struct
2810	syscall	RawSockaddrLinklayer	struct
2811	syscall	RawSockaddrNetlink	struct
2812	syscall	RawSockaddr	struct
2813	syscall	RawSockaddrAny	struct
2814	syscall	Linger	struct
2815	syscall	Iovec	struct
2816	syscall	IPMreq	struct
2817	syscall	IPMreqn	struct
2818	syscall	IPv6Mreq	struct
2819	syscall	Msghdr	struct
2820	syscall	Cmsghdr	struct
2821	syscall	Inet4Pktinfo	struct
2822	syscall	Inet6Pktinfo	struct
2823	syscall	IPv6MTUInfo	struct
2824	syscall	ICMPv6Filter	struct
2825	syscall	Ucred	struct
2826	syscall	TCPInfo	struct
2827	syscall	NlMsghdr	struct
2828	syscall	NlMsgerr	struct
2829	syscall	RtGenmsg	struct
2830	syscall	NlAttr	struct
2831	syscall	RtAttr	struct
2832	syscall	IfInfomsg	struct
2833	syscall	IfAddrmsg	struct
2834	syscall	RtMsg	struct
2835	syscall	RtNexthop	struct
2836	syscall	SockFilter	struct
2837	syscall	SockFprog	struct
2838	syscall	InotifyEvent	struct
2839	syscall	PtraceRegs	struct
2840	syscall	FdSet	struct
2841	syscall	Sysinfo_t	struct
2842	syscall	Utsname	struct
2843	syscall	Ustat_t	struct
2844	syscall	EpollEvent	struct
2845	syscall	Termios	struct
2846	syscall	Timespec	struct
2847	syscall	Timeval	struct
2848	syscall	Timex	struct
2849	syscall	Time_t	int32
2850	syscall	Tms	struct
2851	syscall	Utimbuf	struct
2852	syscall	Rusage	struct
2853	syscall	Rlimit	struct
2854	syscall	Stat_t	struct
2855	syscall	Statfs_t	struct
2856	syscall	Dirent	struct
2857	syscall	Fsid	struct
2858	syscall	Flock_t	struct
2859	syscall	RawSockaddrInet4	struct
2860	syscall	RawSockaddrInet6	struct
2861	syscall	RawSockaddrUnix	struct
2862	syscall	RawSockaddrLinklayer	struct
2863	syscall	RawSockaddrNetlink	struct
2864	syscall	RawSockaddr	struct
2865	syscall	RawSockaddrAny	struct
2866	syscall	Linger	struct
2867	syscall	Iovec	struct
2868	syscall	IPMreq	struct
2869	syscall	IPMreqn	struct
2870	syscall	IPv6Mreq	struct
2871	syscall	Msghdr	struct
2872	syscall	Cmsghdr	struct
2873	syscall	Inet4Pktinfo	struct
2874	syscall	Inet6Pktinfo	struct
2875	syscall	IPv6MTUInfo	struct
2876	syscall	ICMPv6Filter	struct
2877	syscall	Ucred	struct
2878	syscall	TCPInfo	struct
2879	syscall	NlMsghdr	struct
2880	syscall	NlMsgerr	struct
2881	syscall	RtGenmsg	struct
2882	syscall	NlAttr	struct
2883	syscall	RtAttr	struct
2884	syscall	IfInfomsg	struct
2885	syscall	IfAddrmsg	struct
2886	syscall	RtMsg	struct
2887	syscall	RtNexthop	struct
2888	syscall	SockFilter	struct
2889	syscall	SockFprog	struct
2890	syscall	InotifyEvent	struct
2891	syscall	PtraceRegs	struct
2892	syscall	FdSet	struct
2893	syscall	Sysinfo_t	struct
2894	syscall	Utsname	struct
2895	syscall	Ustat_t	struct
2896	syscall	EpollEvent	struct
2897	syscall	Termios	struct
2898	syscall	Timespec	struct
2899	syscall	Timeval	struct
2900	syscall	Timex	struct
2901	syscall	Time_t	int64
2902	syscall	Tms	struct
2903	syscall	Utimbuf	struct
2904	syscall	Rusage	struct
2905	syscall	Rlimit	struct
2906	syscall	Stat_t	struct
2907	syscall	Statfs_t	struct
2908	syscall	Dirent	struct
2909	syscall	Fsid	struct
2910	syscall	Flock_t	struct
2911	syscall	RawSockaddrInet4	struct
2912	syscall	RawSockaddrInet6	struct
2913	syscall	RawSockaddrUnix	struct
2914	syscall	RawSockaddrLinklayer	struct
2915	syscall	RawSockaddrNetlink	struct
2916	syscall	RawSockaddr	struct
2917	syscall	RawSockaddrAny	struct
2918	syscall	Linger	struct
2919	syscall	Iovec	struct
2920	syscall	IPMreq	struct
2921	syscall	IPMreqn	struct
2922	syscall	IPv6Mreq	struct
2923	syscall	Msghdr	struct
2924	syscall	Cmsghdr	struct
2925	syscall	Inet4Pktinfo	struct
2926	syscall	Inet6Pktinfo	struct
2927	syscall	IPv6MTUInfo	struct
2928	syscall	ICMPv6Filter	struct
2929	syscall	Ucred	struct
2930	syscall	TCPInfo	struct
2931	syscall	NlMsghdr	struct
2932	syscall	NlMsgerr	struct
2933	syscall	RtGenmsg	struct
2934	syscall	NlAttr	struct
2935	syscall	RtAttr	struct
2936	syscall	IfInfomsg	struct
2937	syscall	IfAddrmsg	struct
2938	syscall	RtMsg	struct
2939	syscall	RtNexthop	struct
2940	syscall	SockFilter	struct
2941	syscall	SockFprog	struct
2942	syscall	InotifyEvent	struct
2943	syscall	PtraceRegs	struct
2944	syscall	FdSet	struct
2945	syscall	Sysinfo_t	struct
2946	syscall	Utsname	struct
2947	syscall	Ustat_t	struct
2948	syscall	EpollEvent	struct
2949	syscall	Termios	struct
2950	syscall	Timespec	struct
2951	syscall	Timeval	struct
2952	syscall	Timex	struct
2953	syscall	Time_t	int64
2954	syscall	Tms	struct
2955	syscall	Utimbuf	struct
2956	syscall	Rusage	struct
2957	syscall	Rlimit	struct
2958	syscall	Stat_t	struct
2959	syscall	Statfs_t	struct
2960	syscall	Dirent	struct
2961	syscall	Fsid	struct
2962	syscall	Flock_t	struct
2963	syscall	RawSockaddrInet4	struct
2964	syscall	RawSockaddrInet6	struct
2965	syscall	RawSockaddrUnix	struct
2966	syscall	RawSockaddrLinklayer	struct
2967	syscall	RawSockaddrNetlink	struct
2968	syscall	RawSockaddr	struct
2969	syscall	RawSockaddrAny	struct
2970	syscall	Linger	struct
2971	syscall	Iovec	struct
2972	syscall	IPMreq	struct
2973	syscall	IPMreqn	struct
2974	syscall	IPv6Mreq	struct
2975	syscall	Msghdr	struct
2976	syscall	Cmsghdr	struct
2977	syscall	Inet4Pktinfo	struct
2978	syscall	Inet6Pktinfo	struct
2979	syscall	IPv6MTUInfo	struct
2980	syscall	ICMPv6Filter	struct
2981	syscall	Ucred	struct
2982	syscall	TCPInfo	struct
2983	syscall	NlMsghdr	struct
2984	syscall	NlMsgerr	struct
2985	syscall	RtGenmsg	struct
2986	syscall	NlAttr	struct
2987	syscall	RtAttr	struct
2988	syscall	IfInfomsg	struct
2989	syscall	IfAddrmsg	struct
2990	syscall	RtMsg	struct
2991	syscall	RtNexthop	struct
2992	syscall	SockFilter	struct
2993	syscall	SockFprog	struct
2994	syscall	InotifyEvent	struct
2995	syscall	PtraceRegs	struct
2996	syscall	FdSet	struct
2997	syscall	Sysinfo_t	struct
2998	syscall	Utsname	struct
2999	syscall	Ustat_t	struct
3000	syscall	EpollEvent	struct
3001	syscall	Termios	struct
3002	syscall	Timespec	struct
3003	syscall	Timeval	struct
3004	syscall	Timex	struct
3005	syscall	Time_t	int32
3006	syscall	Tms	struct
3007	syscall	Utimbuf	struct
3008	syscall	Rusage	struct
3009	syscall	Rlimit	struct
3010	syscall	Stat_t	struct
3011	syscall	Statfs_t	struct
3012	syscall	Dirent	struct
3013	syscall	Fsid	struct
3014	syscall	Flock_t	struct
3015	syscall	RawSockaddrInet4	struct
3016	syscall	RawSockaddrInet6	struct
3017	syscall	RawSockaddrUnix	struct
3018	syscall	RawSockaddrLinklayer	struct
3019	syscall	RawSockaddrNetlink	struct
3020	syscall	RawSockaddr	struct
3021	syscall	RawSockaddrAny	struct
3022	syscall	Linger	struct
3023	syscall	Iovec	struct
3024	syscall	IPMreq	struct
3025	syscall	IPMreqn	struct
3026	syscall	IPv6Mreq	struct
3027	syscall	Msghdr	struct
3028	syscall	Cmsghdr	struct
3029	syscall	Inet4Pktinfo	struct
3030	syscall	Inet6Pktinfo	struct
3031	syscall	IPv6MTUInfo	struct
3032	syscall	ICMPv6Filter	struct
3033	syscall	Ucred	struct
3034	syscall	TCPInfo	struct
3035	syscall	NlMsghdr	struct
3036	syscall	NlMsgerr	struct
3037	syscall	RtGenmsg	struct
3038	syscall	NlAttr	struct
3039	syscall	RtAttr	struct
3040	syscall	IfInfomsg	struct
3041	syscall	IfAddrmsg	struct
3042	syscall	RtMsg	struct
3043	syscall	RtNexthop	struct
3044	syscall	SockFilter	struct
3045	syscall	SockFprog	struct
3046	syscall	InotifyEvent	struct
3047	syscall	PtraceRegs	struct
3048	syscall	FdSet	struct
3049	syscall	Sysinfo_t	struct
3050	syscall	Utsname	struct
3051	syscall	Ustat_t	struct
3052	syscall	EpollEvent	struct
3053	syscall	Termios	struct
3054	syscall	Timespec	struct
3055	syscall	Timeval	struct
3056	syscall	Timex	struct
3057	syscall	Time_t	int64
3058	syscall	Tms	struct
3059	syscall	Utimbuf	struct
3060	syscall	Rusage	struct
3061	syscall	Rlimit	struct
3062	syscall	Stat_t	struct
3063	syscall	Statfs_t	struct
3064	syscall	Dirent	struct
3065	syscall	Fsid	struct
3066	syscall	Flock_t	struct
3067	syscall	RawSockaddrInet4	struct
3068	syscall	RawSockaddrInet6	struct
3069	syscall	RawSockaddrUnix	struct
3070	syscall	RawSockaddrLinklayer	struct
3071	syscall	RawSockaddrNetlink	struct
3072	syscall	RawSockaddr	struct
3073	syscall	RawSockaddrAny	struct
3074	syscall	Linger	struct
3075	syscall	Iovec	struct
3076	syscall	IPMreq	struct
3077	syscall	IPMreqn	struct
3078	syscall	IPv6Mreq	struct
3079	syscall	Msghdr	struct
3080	syscall	Cmsghdr	struct
3081	syscall	Inet4Pktinfo	struct
3082	syscall	Inet6Pktinfo	struct
3083	syscall	IPv6MTUInfo	struct
3084	syscall	ICMPv6Filter	struct
3085	syscall	Ucred	struct
3086	syscall	TCPInfo	struct
3087	syscall	NlMsghdr	struct
3088	syscall	NlMsgerr	struct
3089	syscall	RtGenmsg	struct
3090	syscall	NlAttr	struct
3091	syscall	RtAttr	struct
3092	syscall	IfInfomsg	struct
3093	syscall	IfAddrmsg	struct
3094	syscall	RtMsg	struct
3095	syscall	RtNexthop	struct
3096	syscall	SockFilter	struct
3097	syscall	SockFprog	struct
3098	syscall	InotifyEvent	struct
3099	syscall	PtraceRegs	struct
3100	syscall	FdSet	struct
3101	syscall	Sysinfo_t	struct
3102	syscall	Utsname	struct
3103	syscall	Ustat_t	struct
3104	syscall	EpollEvent	struct
3105	syscall	Termios	struct
3106	syscall	Timespec	struct
3107	syscall	Timeval	struct
3108	syscall	Timex	struct
3109	syscall	Time_t	int64
3110	syscall	Tms	struct
3111	syscall	Utimbuf	struct
3112	syscall	Rusage	struct
3113	syscall	Rlimit	struct
3114	syscall	Stat_t	struct
3115	syscall	Statfs_t	struct
3116	syscall	Dirent	struct
3117	syscall	Fsid	struct
3118	syscall	Flock_t	struct
3119	syscall	RawSockaddrInet4	struct
3120	syscall	RawSockaddrInet6	struct
3121	syscall	RawSockaddrUnix	struct
3122	syscall	RawSockaddrLinklayer	struct
3123	syscall	RawSockaddrNetlink	struct
3124	syscall	RawSockaddr	struct
3125	syscall	RawSockaddrAny	struct
3126	syscall	Linger	struct
3127	syscall	Iovec	struct
3128	syscall	IPMreq	struct
3129	syscall	IPMreqn	struct
3130	syscall	IPv6Mreq	struct
3131	syscall	Msghdr	struct
3132	syscall	Cmsghdr	struct
3133	syscall	Inet4Pktinfo	struct
3134	syscall	Inet6Pktinfo	struct
3135	syscall	IPv6MTUInfo	struct
3136	syscall	ICMPv6Filter	struct
3137	syscall	Ucred	struct
3138	syscall	TCPInfo	struct
3139	syscall	NlMsghdr	struct
3140	syscall	NlMsgerr	struct
3141	syscall	RtGenmsg	struct
3142	syscall	NlAttr	struct
3143	syscall	RtAttr	struct
3144	syscall	IfInfomsg	struct
3145	syscall	IfAddrmsg	struct
3146	syscall	RtMsg	struct
3147	syscall	RtNexthop	struct
3148	syscall	SockFilter	struct
3149	syscall	SockFprog	struct
3150	syscall	InotifyEvent	struct
3151	syscall	PtraceRegs	struct
3152	syscall	FdSet	struct
3153	syscall	Sysinfo_t	struct
3154	syscall	Utsname	struct
3155	syscall	Ustat_t	struct
3156	syscall	EpollEvent	struct
3157	syscall	Termios	struct
3158	syscall	Timespec	struct
3159	syscall	Timeval	struct
3160	syscall	Timex	struct
3161	syscall	Time_t	int64
3162	syscall	Tms	struct
3163	syscall	Utimbuf	struct
3164	syscall	Rusage	struct
3165	syscall	Rlimit	struct
3166	syscall	Stat_t	struct
3167	syscall	Statfs_t	struct
3168	syscall	Dirent	struct
3169	syscall	Fsid	struct
3170	syscall	Flock_t	struct
3171	syscall	RawSockaddrInet4	struct
3172	syscall	RawSockaddrInet6	struct
3173	syscall	RawSockaddrUnix	struct
3174	syscall	RawSockaddrLinklayer	struct
3175	syscall	RawSockaddrNetlink	struct
3176	syscall	RawSockaddr	struct
3177	syscall	RawSockaddrAny	struct
3178	syscall	Linger	struct
3179	syscall	Iovec	struct
3180	syscall	IPMreq	struct
3181	syscall	IPMreqn	struct
3182	syscall	IPv6Mreq	struct
3183	syscall	Msghdr	struct
3184	syscall	Cmsghdr	struct
3185	syscall	Inet4Pktinfo	struct
3186	syscall	Inet6Pktinfo	struct
3187	syscall	IPv6MTUInfo	struct
3188	syscall	ICMPv6Filter	struct
3189	syscall	Ucred	struct
3190	syscall	TCPInfo	struct
3191	syscall	NlMsghdr	struct
3192	syscall	NlMsgerr	struct
3193	syscall	RtGenmsg	struct
3194	syscall	NlAttr	struct
3195	syscall	RtAttr	struct
3196	syscall	IfInfomsg	struct
3197	syscall	IfAddrmsg	struct
3198	syscall	RtMsg	struct
3199	syscall	RtNexthop	struct
3200	syscall	SockFilter	struct
3201	syscall	SockFprog	struct
3202	syscall	InotifyEvent	struct
3203	syscall	PtraceRegs	struct
3204	syscall	PtracePsw	struct
3205	syscall	PtraceFpregs	struct
3206	syscall	PtracePer	struct
3207	syscall	FdSet	struct
3208	syscall	Sysinfo_t	struct
3209	syscall	Utsname	struct
3210	syscall	Ustat_t	struct
3211	syscall	EpollEvent	struct
3212	syscall	Termios	struct
3213	syscall	Timespec	struct
3214	syscall	Timeval	struct
3215	syscall	Rusage	struct
3216	syscall	Rlimit	struct
3217	syscall	Stat_t	struct
3218	syscall	Statfs_t	[]byte
3219	syscall	Flock_t	struct
3220	syscall	Dirent	struct
3221	syscall	Fsid	struct
3222	syscall	RawSockaddrInet4	struct
3223	syscall	RawSockaddrInet6	struct
3224	syscall	RawSockaddrUnix	struct
3225	syscall	RawSockaddrDatalink	struct
3226	syscall	RawSockaddr	struct
3227	syscall	RawSockaddrAny	struct
3228	syscall	Linger	struct
3229	syscall	Iovec	struct
3230	syscall	IPMreq	struct
3231	syscall	IPv6Mreq	struct
3232	syscall	Msghdr	struct
3233	syscall	Cmsghdr	struct
3234	syscall	Inet6Pktinfo	struct
3235	syscall	IPv6MTUInfo	struct
3236	syscall	ICMPv6Filter	struct
3237	syscall	Kevent_t	struct
3238	syscall	FdSet	struct
3239	syscall	IfMsghdr	struct
3240	syscall	IfData	struct
3241	syscall	IfaMsghdr	struct
3242	syscall	IfAnnounceMsghdr	struct
3243	syscall	RtMsghdr	struct
3244	syscall	RtMetrics	struct
3245	syscall	Mclpool	[]byte
3246	syscall	BpfVersion	struct
3247	syscall	BpfStat	struct
3248	syscall	BpfProgram	struct
3249	syscall	BpfInsn	struct
3250	syscall	BpfHdr	struct
3251	syscall	BpfTimeval	struct
3252	syscall	Termios	struct
3253	syscall	Sysctlnode	struct
3254	syscall	Timespec	struct
3255	syscall	Timeval	struct
3256	syscall	Rusage	struct
3257	syscall	Rlimit	struct
3258	syscall	Stat_t	struct
3259	syscall	Statfs_t	[]byte
3260	syscall	Flock_t	struct
3261	syscall	Dirent	struct
3262	syscall	Fsid	struct
3263	syscall	RawSockaddrInet4	struct
3264	syscall	RawSockaddrInet6	struct
3265	syscall	RawSockaddrUnix	struct
3266	syscall	RawSockaddrDatalink	struct
3267	syscall	RawSockaddr	struct
3268	syscall	RawSockaddrAny	struct
3269	syscall	Linger	struct
3270	syscall	Iovec	struct
3271	syscall	IPMreq	struct
3272	syscall	IPv6Mreq	struct
3273	syscall	Msghdr	struct
3274	syscall	Cmsghdr	struct
3275	syscall	Inet6Pktinfo	struct
3276	syscall	IPv6MTUInfo	struct
3277	syscall	ICMPv6Filter	struct
3278	syscall	Kevent_t	struct
3279	syscall	FdSet	struct
3280	syscall	IfMsghdr	struct
3281	syscall	IfData	struct
3282	syscall	IfaMsghdr	struct
3283	syscall	IfAnnounceMsghdr	struct
3284	syscall	RtMsghdr	struct
3285	syscall	RtMetrics	struct
3286	syscall	Mclpool	[]byte
3287	syscall	BpfVersion	struct
3288	syscall	BpfStat	struct
3289	syscall	BpfProgram	struct
3290	syscall	BpfInsn	struct
3291	syscall	BpfHdr	struct
3292	syscall	BpfTimeval	struct
3293	syscall	Termios	struct
3294	syscall	Sysctlnode	struct
3295	syscall	Timespec	struct
3296	syscall	Timeval	struct
3297	syscall	Rusage	struct
3298	syscall	Rlimit	struct
3299	syscall	Stat_t	struct
3300	syscall	Statfs_t	[]byte
3301	syscall	Flock_t	struct
3302	syscall	Dirent	struct
3303	syscall	Fsid	struct
3304	syscall	RawSockaddrInet4	struct
3305	syscall	RawSockaddrInet6	struct
3306	syscall	RawSockaddrUnix	struct
3307	syscall	RawSockaddrDatalink	struct
3308	syscall	RawSockaddr	struct
3309	syscall	RawSockaddrAny	struct
3310	syscall	Linger	struct
3311	syscall	Iovec	struct
3312	syscall	IPMreq	struct
3313	syscall	IPv6Mreq	struct
3314	syscall	Msghdr	struct
3315	syscall	Cmsghdr	struct
3316	syscall	Inet6Pktinfo	struct
3317	syscall	IPv6MTUInfo	struct
3318	syscall	ICMPv6Filter	struct
3319	syscall	Kevent_t	struct
3320	syscall	FdSet	struct
3321	syscall	IfMsghdr	struct
3322	syscall	IfData	struct
3323	syscall	IfaMsghdr	struct
3324	syscall	IfAnnounceMsghdr	struct
3325	syscall	RtMsghdr	struct
3326	syscall	RtMetrics	struct
3327	syscall	Mclpool	[]byte
3328	syscall	BpfVersion	struct
3329	syscall	BpfStat	struct
3330	syscall	BpfProgram	struct
3331	syscall	BpfInsn	struct
3332	syscall	BpfHdr	struct
3333	syscall	BpfTimeval	struct
3334	syscall	Termios	struct
3335	syscall	Sysctlnode	struct
3336	syscall	Timespec	struct
3337	syscall	Timeval	struct
3338	syscall	Rusage	struct
3339	syscall	Rlimit	struct
3340	syscall	Stat_t	struct
3341	syscall	Statfs_t	struct
3342	syscall	Flock_t	struct
3343	syscall	Dirent	struct
3344	syscall	Fsid	struct
3345	syscall	RawSockaddrInet4	struct
3346	syscall	RawSockaddrInet6	struct
3347	syscall	RawSockaddrUnix	struct
3348	syscall	RawSockaddrDatalink	struct
3349	syscall	RawSockaddr	struct
3350	syscall	RawSockaddrAny	struct
3351	syscall	Linger	struct
3352	syscall	Iovec	struct
3353	syscall	IPMreq	struct
3354	syscall	IPv6Mreq	struct
3355	syscall	Msghdr	struct
3356	syscall	Cmsghdr	struct
3357	syscall	Inet6Pktinfo	struct
3358	syscall	IPv6MTUInfo	struct
3359	syscall	ICMPv6Filter	struct
3360	syscall	Kevent_t	struct
3361	syscall	FdSet	struct
3362	syscall	IfMsghdr	struct
3363	syscall	IfData	struct
3364	syscall	IfaMsghdr	struct
3365	syscall	IfAnnounceMsghdr	struct
3366	syscall	RtMsghdr	struct
3367	syscall	RtMetrics	struct
3368	syscall	Mclpool	struct
3369	syscall	BpfVersion	struct
3370	syscall	BpfStat	struct
3371	syscall	BpfProgram	struct
3372	syscall	BpfInsn	struct
3373	syscall	BpfHdr	struct
3374	syscall	BpfTimeval	struct
3375	syscall	Termios	struct
3376	syscall	Timespec	struct
3377	syscall	Timeval	struct
3378	syscall	Rusage	struct
3379	syscall	Rlimit	struct
3380	syscall	Stat_t	struct
3381	syscall	Statfs_t	struct
3382	syscall	Flock_t	struct
3383	syscall	Dirent	struct
3384	syscall	Fsid	struct
3385	syscall	RawSockaddrInet4	struct
3386	syscall	RawSockaddrInet6	struct
3387	syscall	RawSockaddrUnix	struct
3388	syscall	RawSockaddrDatalink	struct
3389	syscall	RawSockaddr	struct
3390	syscall	RawSockaddrAny	struct
3391	syscall	Linger	struct
3392	syscall	Iovec	struct
3393	syscall	IPMreq	struct
3394	syscall	IPv6Mreq	struct
3395	syscall	Msghdr	struct
3396	syscall	Cmsghdr	struct
3397	syscall	Inet6Pktinfo	struct
3398	syscall	IPv6MTUInfo	struct
3399	syscall	ICMPv6Filter	struct
3400	syscall	Kevent_t	struct
3401	syscall	FdSet	struct
3402	syscall	IfMsghdr	struct
3403	syscall	IfData	struct
3404	syscall	IfaMsghdr	struct
3405	syscall	IfAnnounceMsghdr	struct
3406	syscall	RtMsghdr	struct
3407	syscall	RtMetrics	struct
3408	syscall	Mclpool	struct
3409	syscall	BpfVersion	struct
3410	syscall	BpfStat	struct
3411	syscall	BpfProgram	struct
3412	syscall	BpfInsn	struct
3413	syscall	BpfHdr	struct
3414	syscall	BpfTimeval	struct
3415	syscall	Termios	struct
3416	syscall	Timespec	struct
3417	syscall	Timeval	struct
3418	syscall	Rusage	struct
3419	syscall	Rlimit	struct
3420	syscall	Stat_t	struct
3421	syscall	Statfs_t	struct
3422	syscall	Flock_t	struct
3423	syscall	Dirent	struct
3424	syscall	Fsid	struct
3425	syscall	RawSockaddrInet4	struct
3426	syscall	RawSockaddrInet6	struct
3427	syscall	RawSockaddrUnix	struct
3428	syscall	RawSockaddrDatalink	struct
3429	syscall	RawSockaddr	struct
3430	syscall	RawSockaddrAny	struct
3431	syscall	Linger	struct
3432	syscall	Iovec	struct
3433	syscall	IPMreq	struct
3434	syscall	IPv6Mreq	struct
3435	syscall	Msghdr	struct
3436	syscall	Cmsghdr	struct
3437	syscall	Inet6Pktinfo	struct
3438	syscall	IPv6MTUInfo	struct
3439	syscall	ICMPv6Filter	struct
3440	syscall	Kevent_t	struct
3441	syscall	FdSet	struct
3442	syscall	IfMsghdr	struct
3443	syscall	IfData	struct
3444	syscall	IfaMsghdr	struct
3445	syscall	IfAnnounceMsghdr	struct
3446	syscall	RtMsghdr	struct
3447	syscall	RtMetrics	struct
3448	syscall	Mclpool	struct
3449	syscall	BpfVersion	struct
3450	syscall	BpfStat	struct
3451	syscall	BpfProgram	struct
3452	syscall	BpfInsn	struct
3453	syscall	BpfHdr	struct
3454	syscall	BpfTimeval	struct
3455	syscall	Termios	struct
3456	syscall	Timespec	struct
3457	syscall	Timeval	struct
3458	syscall	Timeval32	struct
3459	syscall	Rusage	struct
3460	syscall	Rlimit	struct
3461	syscall	Stat_t	struct
3462	syscall	Flock_t	struct
3463	syscall	Dirent	struct
3464	syscall	RawSockaddrInet4	struct
3465	syscall	RawSockaddrInet6	struct
3466	syscall	RawSockaddrUnix	struct
3467	syscall	RawSockaddrDatalink	struct
3468	syscall	RawSockaddr	struct
3469	syscall	RawSockaddrAny	struct
3470	syscall	Linger	struct
3471	syscall	Iovec	struct
3472	syscall	IPMreq	struct
3473	syscall	IPv6Mreq	struct
3474	syscall	Msghdr	struct
3475	syscall	Cmsghdr	struct
3476	syscall	Inet6Pktinfo	struct
3477	syscall	IPv6MTUInfo	struct
3478	syscall	ICMPv6Filter	struct
3479	syscall	FdSet	struct
3480	syscall	IfMsghdr	struct
3481	syscall	IfData	struct
3482	syscall	IfaMsghdr	struct
3483	syscall	RtMsghdr	struct
3484	syscall	RtMetrics	struct
3485	syscall	BpfVersion	struct
3486	syscall	BpfStat	struct
3487	syscall	BpfProgram	struct
3488	syscall	BpfInsn	struct
3489	syscall	BpfTimeval	struct
3490	syscall	BpfHdr	struct
3491	syscall	Termios	struct
3492	testing	InternalBenchmark	struct
3493	testing	B	struct
3494	testing	BenchmarkResult	struct
3495	testing	PB	struct
3496	testing	CoverBlock	struct
3497	testing	Cover	struct
3498	testing	InternalExample	struct
3499	testdeps	TestDeps	struct
3500	quick	Generator	
3501	quick	Config	struct
3502	quick	SetupError	string
3503	quick	CheckError	struct
3504	quick	CheckEqualError	struct
3505	testing	TB	
3506	testing	T	struct
3507	testing	InternalTest	struct
3508	testing	M	struct
3509	scanner	Position	struct
3510	scanner	Scanner	struct
3511	tabwriter	Writer	struct
3512	template	ExecError	struct
3513	template	FuncMap	map[string]interface{}
3514	parse	Node	
3515	parse	NodeType	int
3516	parse	Pos	int
3517	parse	ListNode	struct
3518	parse	TextNode	struct
3519	parse	PipeNode	struct
3520	parse	ActionNode	struct
3521	parse	CommandNode	struct
3522	parse	IdentifierNode	struct
3523	parse	VariableNode	struct
3524	parse	DotNode	struct
3525	parse	NilNode	struct
3526	parse	FieldNode	struct
3527	parse	ChainNode	struct
3528	parse	BoolNode	struct
3529	parse	NumberNode	struct
3530	parse	StringNode	struct
3531	parse	BranchNode	struct
3532	parse	IfNode	struct
3533	parse	RangeNode	struct
3534	parse	WithNode	struct
3535	parse	TemplateNode	struct
3536	parse	Tree	struct
3537	template	Template	struct
3538	time	ParseError	struct
3539	main	MapZone	struct
3540	main	SupplementalData	struct
3541	time	Timer	struct
3542	time	Ticker	struct
3543	time	Time	struct
3544	time	Month	int
3545	time	Weekday	int
3546	time	Duration	int64
3547	time	Location	struct
3548	unicode	RangeTable	struct
3549	unicode	Range16	struct
3550	unicode	Range32	struct
3551	unicode	CaseRange	struct
3552	unicode	SpecialCase	[]unicode.CaseRange
3553	main	Char	struct
3554	main	Script	struct
3555	main	State	int
3556	main	Op	func(rune) bool
3557	unsafe	ArbitraryType	int
3558	unsafe	Pointer	*unsafe.ArbitraryType
3559	asn1	Tag	uint8
3560	cryptobyte	Builder	struct
3561	cryptobyte	BuilderContinuation	func(*cryptobyte.Builder)
3562	cryptobyte	BuildError	struct
3563	cryptobyte	MarshalingValue	
3564	cryptobyte	String	[]byte
3565	hpack	Encoder	struct
3566	hpack	DecodingError	struct
3567	hpack	InvalidIndexError	int
3568	hpack	HeaderField	struct
3569	hpack	Decoder	struct
3570	idna	Option	func(*idna.options)
3571	idna	Profile	struct
3572	lif	Addr	
3573	lif	Inet4Addr	struct
3574	lif	Inet6Addr	struct
3575	lif	Link	struct
3576	nettest	MakePipe	func() (net.Conn, func(), error)
3577	proxy	PerHost	struct
3578	proxy	Dialer	
3579	proxy	Auth	struct
3580	route	Addr	
3581	route	LinkAddr	struct
3582	route	Inet4Addr	struct
3583	route	Inet6Addr	struct
3584	route	DefaultAddr	struct
3585	route	InterfaceMessage	struct
3586	route	InterfaceAddrMessage	struct
3587	route	InterfaceMulticastAddrMessage	struct
3588	route	InterfaceAnnounceMessage	struct
3589	route	Message	
3590	route	Sys	
3591	route	SysType	int
3592	route	RouteMessage	struct
3593	route	RIBType	int
3594	route	RouteMetrics	struct
3595	route	InterfaceMetrics	struct
3596	route	RouteMetrics	struct
3597	route	InterfaceMetrics	struct
3598	route	RouteMetrics	struct
3599	route	InterfaceMetrics	struct
3600	route	RouteMetrics	struct
3601	route	InterfaceMetrics	struct
3602	route	RouteMetrics	struct
3603	route	InterfaceMetrics	struct
3604	bidirule	Transformer	struct
3605	transform	Transformer	
3606	transform	SpanningTransformer	
3607	transform	NopResetter	struct
3608	transform	Reader	struct
3609	transform	Writer	struct
3610	bidi	Direction	int
3611	bidi	Option	func(*bidi.options)
3612	bidi	Paragraph	struct
3613	bidi	Ordering	struct
3614	bidi	Run	struct
3615	bidi	Properties	struct
3616	bidi	Class	uint
3617	norm	Properties	struct
3618	norm	Iter	struct
3619	norm	Form	int
\.


--
-- Data for Name: interface_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interface_methods (id, package, name, parameters, return_values, receiver_name, receiver_id) FROM stdin;
1	p1	Name	{}	{string}		1
2	p1	p1.Namer	{}	{}		2
3	p1	ptwo.Twoer	{}	{}		2
4	p1	Set	{string,int64}	{}		2
5	p1	Get	{string}	{int64}		2
6	p1	GetNamed	{string}	{int64}		2
7	p1	X	{}	{}		3
8	p1	Y	{}	{}		3
9	p1	X	{}	{}		4
10	p1	Temporary	{}	{bool}		5
11	p2	PackageTwoMeth	{}	{}		6
12	lex	Next	{}	{lex.ScanToken}		7
13	lex	Text	{}	{string}		7
14	lex	File	{}	{string}		7
15	lex	Base	{}	{*src.PosBase}		7
16	lex	SetBase	{*src.PosBase}	{}		7
17	lex	Line	{}	{int}		7
18	lex	Col	{}	{int}		7
19	lex	Close	{}	{}		7
20	gc	IsBoolFlag	{}	{bool}		9
21	gc	IsCountFlag	{}	{bool}		10
22	main	F	{}	{}		12
23	ssa	Logf	{string,"...interface{}"}	{}		14
24	ssa	Log	{}	{bool}		14
25	ssa	Fatalf	{src.XPos,string,"...interface{}"}	{}		14
26	ssa	Warnl	{src.XPos,string,"...interface{}"}	{}		14
27	ssa	Debug_checknil	{}	{bool}		14
28	ssa	Debug_eagerwb	{}	{bool}		14
29	ssa	CanSSA	{*types.Type}	{bool}		15
30	ssa	ssa.Logger	{}	{}		15
31	ssa	StringData	{string}	{"interface{}"}		15
32	ssa	Auto	{src.XPos,*types.Type}	{ssa.GCNode}		15
33	ssa	SplitString	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		15
34	ssa	SplitInterface	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		15
35	ssa	SplitSlice	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot,ssa.LocalSlot}		15
36	ssa	SplitComplex	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		15
37	ssa	SplitStruct	{ssa.LocalSlot,int}	{ssa.LocalSlot}		15
38	ssa	SplitArray	{ssa.LocalSlot}	{ssa.LocalSlot}		15
39	ssa	SplitInt64	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		15
40	ssa	DerefItab	{*obj.LSym,int64}	{*obj.LSym}		15
41	ssa	Line	{src.XPos}	{string}		15
42	ssa	AllocFrame	{*ssa.Func}	{}		15
43	ssa	Syslook	{string}	{*obj.LSym}		15
44	ssa	UseWriteBarrier	{}	{bool}		15
45	ssa	SetWBPos	{src.XPos}	{}		15
46	ssa	Typ	{}	{*types.Type}		16
47	ssa	String	{}	{string}		16
48	ssa	StorageClass	{}	{ssa.StorageClass}		16
49	ssa	String	{}	{string}		17
50	syntax	Pos	{}	{src.Pos}		19
51	syntax	syntax.Node	{}	{}		20
52	syntax	syntax.Node	{}	{}		21
53	syntax	syntax.Node	{}	{}		22
54	syntax	syntax.Stmt	{}	{}		23
55	pkg	ExportedMethod	{}	{}		25
56	pkg	io.Reader	{}	{}		25
57	p	p.A1	{}	{}		27
58	p	p.B1	{}	{}		28
59	p	p.C1	{}	{}		29
60	dwarf	Len	{}	{int64}		30
61	dwarf	PtrSize	{}	{int}		31
62	dwarf	AddInt	{dwarf.Sym,int,int64}	{}		31
63	dwarf	AddBytes	{dwarf.Sym,[]byte}	{}		31
64	dwarf	AddAddress	{dwarf.Sym,"interface{}",int64}	{}		31
65	dwarf	AddCURelativeAddress	{dwarf.Sym,"interface{}",int64}	{}		31
66	dwarf	AddSectionOffset	{dwarf.Sym,int,"interface{}",int64}	{}		31
67	dwarf	CurrentOffset	{dwarf.Sym}	{int64}		31
68	dwarf	RecordDclReference	{dwarf.Sym,dwarf.Sym,int,int}	{}		31
69	dwarf	RecordChildDieOffsets	{dwarf.Sym,[]*dwarf.Var,[]int32}	{}		31
70	dwarf	AddString	{dwarf.Sym,string}	{}		31
71	dwarf	AddFileRef	{dwarf.Sym,"interface{}"}	{}		31
72	dwarf	Logf	{string,"...interface{}"}	{}		31
73	objfile	PCToLine	{uint64}	{string,int,*gosym.Func}		35
74	objfile	String	{uint64}	{string}		36
75	main	Name	{}	{string}		38
76	main	Stat	{}	{os.FileInfo,error}		38
77	main	Read	{[]byte}	{int,error}		38
78	main	Close	{}	{error}		38
79	driver	Open	{string}	{io.WriteCloser,error}		40
80	driver	Bool	{string,bool,string}	{*bool}		41
81	driver	Int	{string,int,string}	{*int}		41
82	driver	Float64	{string,float64,string}	{*float64}		41
83	driver	String	{string,string,string}	{*string}		41
84	driver	BoolVar	{*bool,string,bool,string}	{}		41
85	driver	IntVar	{*int,string,int,string}	{}		41
86	driver	Float64Var	{*float64,string,float64,string}	{}		41
87	driver	StringVar	{*string,string,string,string}	{}		41
88	driver	StringList	{string,string,string}	{*[]*string}		41
89	driver	ExtraUsage	{}	{string}		41
90	driver	Parse	{func()}	{[]string}		41
91	driver	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		42
92	driver	Symbolize	{string,driver.MappingSources,*profile.Profile}	{error}		43
93	driver	Open	{string,uint64,uint64,uint64}	{driver.ObjFile,error}		44
94	driver	Disasm	{string,uint64,uint64}	{[]driver.Inst,error}		44
95	driver	Name	{}	{string}		45
96	driver	Base	{}	{uint64}		45
97	driver	BuildID	{}	{string}		45
98	driver	SourceLine	{uint64}	{[]driver.Frame,error}		45
99	driver	Symbols	{*regexp.Regexp,uint64}	{[]*driver.Sym,error}		45
100	driver	Close	{}	{error}		45
101	driver	ReadLine	{string}	{string,error}		46
102	driver	Print	{"...interface{}"}	{}		46
103	driver	PrintErr	{"...interface{}"}	{}		46
104	driver	IsTerminal	{}	{bool}		46
105	driver	SetAutoComplete	{"func(string) string"}	{}		46
106	plugin	Open	{string}	{io.WriteCloser,error}		47
107	plugin	Bool	{string,bool,string}	{*bool}		48
108	plugin	Int	{string,int,string}	{*int}		48
109	plugin	Float64	{string,float64,string}	{*float64}		48
110	plugin	String	{string,string,string}	{*string}		48
111	plugin	BoolVar	{*bool,string,bool,string}	{}		48
112	plugin	IntVar	{*int,string,int,string}	{}		48
113	plugin	Float64Var	{*float64,string,float64,string}	{}		48
114	plugin	StringVar	{*string,string,string,string}	{}		48
115	plugin	StringList	{string,string,string}	{*[]*string}		48
116	plugin	ExtraUsage	{}	{string}		48
117	plugin	Parse	{func()}	{[]string}		48
118	plugin	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		49
119	plugin	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}		50
120	plugin	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}		51
121	plugin	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}		51
122	plugin	Name	{}	{string}		52
123	plugin	Base	{}	{uint64}		52
124	plugin	BuildID	{}	{string}		52
125	plugin	SourceLine	{uint64}	{[]plugin.Frame,error}		52
126	plugin	Symbols	{*regexp.Regexp,uint64}	{[]*plugin.Sym,error}		52
127	plugin	Close	{}	{error}		52
128	plugin	ReadLine	{string}	{string,error}		53
129	plugin	Print	{"...interface{}"}	{}		53
130	plugin	PrintErr	{"...interface{}"}	{}		53
131	plugin	IsTerminal	{}	{bool}		53
132	plugin	SetAutoComplete	{"func(string) string"}	{}		53
133	demangle	Traverse	{"func(demangle.AST) bool"}	{}		54
134	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}		54
135	demangle	GoString	{}	{string}		54
136	armasm	IsArg	{}	{}		55
137	armasm	String	{}	{string}		55
138	arm64asm	String	{}	{string}		56
139	ppc64asm	IsArg	{}	{}		57
140	ppc64asm	String	{}	{string}		57
141	x86asm	String	{}	{string}		58
142	testdata	ReadByte	{}	{byte}		59
143	testdata	Pointer	{}	{uintptr}		60
144	testdata	UnsafeAddr	{}	{uintptr}		60
145	flate	Reset	{io.Reader,[]byte}	{error}		61
146	flate	io.Reader	{}	{}		62
147	flate	io.ByteReader	{}	{}		62
148	zlib	Reset	{io.Reader,[]byte}	{error}		63
149	heap	sort.Interface	{}	{}		64
150	heap	Push	{"interface{}"}	{}		64
151	heap	Pop	{}	{"interface{}"}		64
152	context	Deadline	{}	{time.Time,bool}		67
153	context	Done	{}	{"chan struct{}\n"}		67
154	context	Err	{}	{error}		67
155	context	Value	{"interface{}"}	{"interface{}"}		67
156	cipher	BlockSize	{}	{int}		68
157	cipher	Encrypt	{[]byte,[]byte}	{}		68
158	cipher	Decrypt	{[]byte,[]byte}	{}		68
159	cipher	XORKeyStream	{[]byte,[]byte}	{}		69
160	cipher	BlockSize	{}	{int}		70
161	cipher	CryptBlocks	{[]byte,[]byte}	{}		70
162	cipher	NonceSize	{}	{int}		71
163	cipher	Overhead	{}	{int}		71
164	cipher	Seal	{[]byte,[]byte,[]byte,[]byte}	{[]byte}		71
165	cipher	Open	{[]byte,[]byte,[]byte,[]byte}	{[]byte,error}		71
166	crypto	Public	{}	{crypto.PublicKey}		74
167	crypto	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}		74
168	crypto	HashFunc	{}	{crypto.Hash}		75
169	crypto	Public	{}	{crypto.PublicKey}		76
170	crypto	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}		76
171	elliptic	Params	{}	{*elliptic.CurveParams}		78
172	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}		78
173	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}		78
174	elliptic	Double	{*big.Int,*big.Int}	{*big.Int}		78
175	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int}		78
176	elliptic	ScalarBaseMult	{[]byte}	{*big.Int}		78
177	tls	Get	{string}	{*tls.ClientSessionState,bool}		79
178	tls	Put	{string,*tls.ClientSessionState}	{}		79
179	driver	Open	{string}	{driver.Conn,error}		84
180	driver	OpenConnector	{string}	{driver.Connector,error}		85
181	driver	Connect	{context.Context}	{driver.Conn,error}		86
182	driver	Driver	{}	{driver.Driver}		86
183	driver	Ping	{context.Context}	{error}		87
184	driver	Exec	{string,[]driver.Value}	{driver.Result,error}		88
185	driver	ExecContext	{context.Context,string,[]driver.NamedValue}	{driver.Result,error}		89
186	driver	Query	{string,[]driver.Value}	{driver.Rows,error}		90
187	driver	QueryContext	{context.Context,string,[]driver.NamedValue}	{driver.Rows,error}		91
188	driver	Prepare	{string}	{driver.Stmt,error}		92
189	driver	Close	{}	{error}		92
190	driver	Begin	{}	{driver.Tx,error}		92
191	driver	PrepareContext	{context.Context,string}	{driver.Stmt,error}		93
192	driver	BeginTx	{context.Context,driver.TxOptions}	{driver.Tx,error}		94
193	driver	ResetSession	{context.Context}	{error}		95
194	driver	LastInsertId	{}	{int64,error}		96
195	driver	RowsAffected	{}	{int64,error}		96
196	driver	Close	{}	{error}		97
197	driver	NumInput	{}	{int}		97
198	driver	Exec	{[]driver.Value}	{driver.Result,error}		97
199	driver	Query	{[]driver.Value}	{driver.Rows,error}		97
200	driver	ExecContext	{context.Context,[]driver.NamedValue}	{driver.Result,error}		98
201	driver	QueryContext	{context.Context,[]driver.NamedValue}	{driver.Rows,error}		99
202	driver	CheckNamedValue	{*driver.NamedValue}	{error}		100
203	driver	ColumnConverter	{int}	{driver.ValueConverter}		101
204	driver	Columns	{}	{[]string}		102
205	driver	Close	{}	{error}		102
206	driver	Next	{[]driver.Value}	{error}		102
207	driver	driver.Rows	{}	{}		103
208	driver	HasNextResultSet	{}	{bool}		103
209	driver	NextResultSet	{}	{error}		103
210	driver	driver.Rows	{}	{}		104
211	driver	ColumnTypeScanType	{int}	{reflect.Type}		104
212	driver	driver.Rows	{}	{}		105
213	driver	ColumnTypeDatabaseTypeName	{int}	{string}		105
214	driver	driver.Rows	{}	{}		106
215	driver	ColumnTypeLength	{int}	{int64,bool}		106
216	driver	driver.Rows	{}	{}		107
217	driver	ColumnTypeNullable	{int}	{bool}		107
218	driver	driver.Rows	{}	{}		108
219	driver	ColumnTypePrecisionScale	{int}	{int64,bool}		108
220	driver	Commit	{}	{error}		109
221	driver	Rollback	{}	{error}		109
222	driver	ConvertValue	{"interface{}"}	{driver.Value,error}		110
223	driver	Value	{}	{driver.Value,error}		111
224	sql	Scan	{"interface{}"}	{error}		113
225	sql	LastInsertId	{}	{int64,error}		115
226	sql	RowsAffected	{}	{int64,error}		115
227	dwarf	Common	{}	{*dwarf.CommonType}		117
228	dwarf	String	{}	{string}		117
229	dwarf	Size	{}	{int64}		117
230	macho	Raw	{}	{[]byte}		118
231	binary	Uint16	{[]byte}	{uint16}		120
232	binary	Uint32	{[]byte}	{uint32}		120
233	binary	Uint64	{[]byte}	{uint64}		120
234	binary	PutUint16	{[]byte,uint16}	{}		120
235	binary	PutUint32	{[]byte,uint32}	{}		120
236	binary	PutUint64	{[]byte,uint64}	{}		120
237	binary	String	{}	{string}		120
238	encoding	MarshalBinary	{}	{[]byte,error}		121
239	encoding	UnmarshalBinary	{[]byte}	{error}		122
240	encoding	MarshalText	{}	{[]byte,error}		123
241	encoding	UnmarshalText	{[]byte}	{error}		124
242	gob	GobEncode	{}	{[]byte,error}		125
243	gob	GobDecode	{[]byte}	{error}		126
244	json	UnmarshalJSON	{[]byte}	{error}		127
245	json	MarshalJSON	{}	{[]byte,error}		128
246	xml	MarshalXML	{*xml.Encoder,xml.StartElement}	{error}		130
247	xml	MarshalXMLAttr	{xml.Name}	{xml.Attr,error}		131
248	xml	UnmarshalXML	{*xml.Decoder,xml.StartElement}	{error}		132
249	xml	UnmarshalXMLAttr	{xml.Attr}	{error}		133
250	xml	Token	{}	{xml.Token,error}		135
251	expvar	String	{}	{string}		136
252	flag	String	{}	{string}		137
253	flag	Set	{string}	{error}		137
254	flag	flag.Value	{}	{}		138
255	flag	Get	{}	{"interface{}"}		138
256	fmt	Write	{[]byte}	{int,error}		139
257	fmt	Width	{}	{int,bool}		139
258	fmt	Precision	{}	{int,bool}		139
259	fmt	Flag	{int}	{bool}		139
260	fmt	Format	{fmt.State,rune}	{}		140
261	fmt	String	{}	{string}		141
262	fmt	GoString	{}	{string}		142
263	fmt	ReadRune	{}	{rune,int,error}		143
264	fmt	UnreadRune	{}	{error}		143
265	fmt	SkipSpace	{}	{}		143
266	fmt	Token	{bool,"func(rune) bool"}	{[]byte,error}		143
267	fmt	Width	{}	{int,bool}		143
268	fmt	Read	{[]byte}	{int,error}		143
269	fmt	Scan	{fmt.ScanState,rune}	{error}		144
270	ast	Pos	{}	{token.Pos}		145
271	ast	End	{}	{token.Pos}		145
272	ast	ast.Node	{}	{}		146
273	ast	ast.Node	{}	{}		147
274	ast	ast.Node	{}	{}		148
275	ast	ast.Node	{}	{}		149
276	ast	Visit	{ast.Node}	{ast.Visitor}		153
277	constant	Kind	{}	{constant.Kind}		154
278	constant	String	{}	{string}		154
279	constant	ExactString	{}	{string}		154
280	exports	exports.T12	{}	{}		161
281	exports	exports.T13	{}	{}		161
282	p	M	{}	{}		162
283	types	Import	{string}	{*types.Package,error}		164
284	types	types.Importer	{}	{}		165
285	types	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}		165
286	types	Parent	{}	{*types.Scope}		166
287	types	Pos	{}	{token.Pos}		166
288	types	Pkg	{}	{*types.Package}		166
289	types	Name	{}	{string}		166
290	types	Type	{}	{types.Type}		166
291	types	Exported	{}	{bool}		166
292	types	Id	{}	{string}		166
293	types	String	{}	{string}		166
294	types	Alignof	{types.Type}	{int64}		167
295	types	Offsetsof	{[]*types.Var}	{[]int64}		167
296	types	Sizeof	{types.Type}	{int64}		167
297	types	Underlying	{}	{types.Type}		168
298	types	String	{}	{string}		168
299	hash	io.Writer	{}	{}		169
300	hash	Sum	{[]byte}	{[]byte}		169
301	hash	Reset	{}	{}		169
302	hash	Size	{}	{int}		169
303	hash	BlockSize	{}	{int}		169
304	hash	hash.Hash	{}	{}		170
305	hash	Sum32	{}	{uint32}		170
306	hash	hash.Hash	{}	{}		171
307	hash	Sum64	{}	{uint64}		171
308	color	RGBA	{}	{uint32}		172
309	color	Convert	{color.Color}	{color.Color}		173
310	draw	image.Image	{}	{}		174
311	draw	Set	{int,int,color.Color}	{}		174
312	draw	Quantize	{color.Palette,image.Image}	{color.Palette}		175
313	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}		176
314	image	ColorModel	{}	{color.Model}		177
315	image	Bounds	{}	{image.Rectangle}		177
316	image	At	{int,int}	{color.Color}		177
317	image	ColorIndexAt	{int,int}	{uint8}		178
318	image	image.Image	{}	{}		178
319	jpeg	io.ByteReader	{}	{}		179
320	jpeg	io.Reader	{}	{}		179
321	png	Get	{}	{*png.EncoderBuffer}		180
322	png	Put	{*png.EncoderBuffer}	{}		180
323	testlog	Getenv	{string}	{}		182
324	testlog	Stat	{string}	{}		182
325	testlog	Open	{string}	{}		182
326	testlog	Chdir	{string}	{}		182
327	io	Read	{[]byte}	{int,error}		183
328	io	Write	{[]byte}	{int,error}		184
329	io	Close	{}	{error}		185
330	io	Seek	{int64,int}	{int64,error}		186
331	io	io.Reader	{}	{}		187
332	io	io.Writer	{}	{}		187
333	io	io.Reader	{}	{}		188
334	io	io.Closer	{}	{}		188
335	io	io.Writer	{}	{}		189
336	io	io.Closer	{}	{}		189
337	io	io.Reader	{}	{}		190
338	io	io.Writer	{}	{}		190
339	io	io.Closer	{}	{}		190
340	io	io.Reader	{}	{}		191
341	io	io.Seeker	{}	{}		191
342	io	io.Writer	{}	{}		192
343	io	io.Seeker	{}	{}		192
344	io	io.Reader	{}	{}		193
345	io	io.Writer	{}	{}		193
346	io	io.Seeker	{}	{}		193
347	io	ReadFrom	{io.Reader}	{int64,error}		194
348	io	WriteTo	{io.Writer}	{int64,error}		195
349	io	ReadAt	{[]byte,int64}	{int,error}		196
350	io	WriteAt	{[]byte,int64}	{int,error}		197
351	io	ReadByte	{}	{byte,error}		198
352	io	io.ByteReader	{}	{}		199
353	io	UnreadByte	{}	{error}		199
354	io	WriteByte	{byte}	{error}		200
355	io	ReadRune	{}	{rune,int,error}		201
356	io	io.RuneReader	{}	{}		202
357	io	UnreadRune	{}	{error}		202
358	rand	Int63	{}	{int64}		203
359	rand	Seed	{int64}	{}		203
360	rand	rand.Source	{}	{}		204
361	rand	Uint64	{}	{uint64}		204
362	multipart	io.Reader	{}	{}		205
363	multipart	io.ReaderAt	{}	{}		205
364	multipart	io.Seeker	{}	{}		205
365	multipart	io.Closer	{}	{}		205
366	http	RoundTrip	{*http.Request}	{*http.Response,error}		206
367	cookiejar	PublicSuffix	{string}	{string}		207
368	cookiejar	String	{}	{string}		207
369	http	Open	{string}	{http.File,error}		208
370	http	io.Closer	{}	{}		209
371	http	io.Reader	{}	{}		209
372	http	io.Seeker	{}	{}		209
373	http	Readdir	{int}	{[]os.FileInfo,error}		209
374	http	Stat	{}	{os.FileInfo,error}		209
375	http	Push	{string,*http.PushOptions}	{error}		211
376	httputil	Get	{}	{[]byte}		212
377	httputil	Put	{[]byte}	{}		212
378	http	SetCookies	{*url.URL,[]*http.Cookie}	{}		213
379	http	Cookies	{*url.URL}	{[]*http.Cookie}		213
380	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}		214
381	http	Header	{}	{http.Header}		215
382	http	Write	{[]byte}	{int,error}		215
383	http	WriteHeader	{int}	{}		215
384	http	Flush	{}	{}		216
385	http	Hijack	{}	{net.Conn,*bufio.ReadWriter,error}		217
386	http	CloseNotify	{}	{"chan bool\n"}		218
387	net	Network	{}	{string}		219
388	net	String	{}	{string}		219
389	net	Read	{[]byte}	{int,error}		220
390	net	Write	{[]byte}	{int,error}		220
391	net	Close	{}	{error}		220
392	net	LocalAddr	{}	{net.Addr}		220
393	net	RemoteAddr	{}	{net.Addr}		220
394	net	SetDeadline	{time.Time}	{error}		220
395	net	SetReadDeadline	{time.Time}	{error}		220
396	net	SetWriteDeadline	{time.Time}	{error}		220
397	net	ReadFrom	{[]byte}	{int,net.Addr,error}		221
398	net	WriteTo	{[]byte,net.Addr}	{int,error}		221
399	net	Close	{}	{error}		221
400	net	LocalAddr	{}	{net.Addr}		221
401	net	SetDeadline	{time.Time}	{error}		221
402	net	SetReadDeadline	{time.Time}	{error}		221
403	net	SetWriteDeadline	{time.Time}	{error}		221
404	net	Accept	{}	{net.Conn,error}		222
405	net	Close	{}	{error}		222
406	net	Addr	{}	{net.Addr}		222
407	net	Timeout	{}	{bool}		223
408	net	Temporary	{}	{bool}		223
409	rpc	WriteRequest	{*rpc.Request,"interface{}"}	{error}		226
410	rpc	ReadResponseHeader	{*rpc.Response}	{error}		226
411	rpc	ReadResponseBody	{"interface{}"}	{error}		226
412	rpc	Close	{}	{error}		226
413	rpc	ReadRequestHeader	{*rpc.Request}	{error}		230
414	rpc	ReadRequestBody	{"interface{}"}	{error}		230
415	rpc	WriteResponse	{*rpc.Response,"interface{}"}	{error}		230
416	rpc	Close	{}	{error}		230
417	smtp	Start	{*smtp.ServerInfo}	{string,[]byte,error}		231
418	smtp	Next	{[]byte,bool}	{[]byte,error}		231
419	os	String	{}	{string}		232
420	os	Signal	{}	{}		232
421	os	Name	{}	{string}		233
422	os	Size	{}	{int64}		233
423	os	Mode	{}	{os.FileMode}		233
424	os	ModTime	{}	{time.Time}		233
425	os	IsDir	{}	{bool}		233
426	os	Sys	{}	{"interface{}"}		233
427	reflect	Align	{}	{int}		235
428	reflect	FieldAlign	{}	{int}		235
429	reflect	Method	{int}	{reflect.Method}		235
430	reflect	MethodByName	{string}	{reflect.Method,bool}		235
431	reflect	NumMethod	{}	{int}		235
432	reflect	Name	{}	{string}		235
433	reflect	PkgPath	{}	{string}		235
434	reflect	Size	{}	{uintptr}		235
435	reflect	String	{}	{string}		235
436	reflect	Kind	{}	{reflect.Kind}		235
437	reflect	Implements	{reflect.Type}	{bool}		235
438	reflect	AssignableTo	{reflect.Type}	{bool}		235
439	reflect	ConvertibleTo	{reflect.Type}	{bool}		235
440	reflect	Comparable	{}	{bool}		235
441	reflect	Bits	{}	{int}		235
442	reflect	ChanDir	{}	{reflect.ChanDir}		235
443	reflect	IsVariadic	{}	{bool}		235
444	reflect	Elem	{}	{reflect.Type}		235
445	reflect	Field	{int}	{reflect.StructField}		235
446	reflect	FieldByIndex	{[]int}	{reflect.StructField}		235
447	reflect	FieldByName	{string}	{reflect.StructField,bool}		235
448	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.StructField,bool}		235
449	reflect	In	{int}	{reflect.Type}		235
450	reflect	Key	{}	{reflect.Type}		235
451	reflect	Len	{}	{int}		235
452	reflect	NumField	{}	{int}		235
453	reflect	NumIn	{}	{int}		235
454	reflect	NumOut	{}	{int}		235
455	reflect	Out	{int}	{reflect.Type}		235
456	runtime	RuntimeError	{}	{}		236
457	sort	Len	{}	{int}		237
458	sort	Less	{int,int}	{bool}		237
459	sort	Swap	{int,int}	{}		237
460	sync	Lock	{}	{}		238
461	sync	Unlock	{}	{}		238
462	syscall	Control	{func(uintptr)}	{error}		239
463	syscall	Read	{"func(uintptr) bool"}	{error}		239
464	syscall	Write	{"func(uintptr) bool"}	{error}		239
465	syscall	SyscallConn	{}	{syscall.RawConn,error}		240
466	quick	Generate	{*rand.Rand,int}	{reflect.Value}		246
467	testing	Error	{"...interface{}"}	{}		247
468	testing	Errorf	{string,"...interface{}"}	{}		247
469	testing	Fail	{}	{}		247
470	testing	FailNow	{}	{}		247
471	testing	Failed	{}	{bool}		247
472	testing	Fatal	{"...interface{}"}	{}		247
473	testing	Fatalf	{string,"...interface{}"}	{}		247
474	testing	Log	{"...interface{}"}	{}		247
475	testing	Logf	{string,"...interface{}"}	{}		247
476	testing	Name	{}	{string}		247
477	testing	Skip	{"...interface{}"}	{}		247
478	testing	SkipNow	{}	{}		247
479	testing	Skipf	{string,"...interface{}"}	{}		247
480	testing	Skipped	{}	{bool}		247
481	testing	Helper	{}	{}		247
482	parse	Type	{}	{parse.NodeType}		248
483	parse	String	{}	{string}		248
484	parse	Copy	{}	{parse.Node}		248
485	parse	Position	{}	{parse.Pos}		248
486	cryptobyte	Marshal	{*cryptobyte.Builder}	{error}		249
487	lif	Family	{}	{int}		250
488	proxy	Dial	{string,string}	{net.Conn,error}		251
489	route	Family	{}	{int}		252
490	route	Sys	{}	{[]route.Sys}		253
491	route	SysType	{}	{route.SysType}		254
492	transform	Transform	{[]byte,[]byte,bool}	{int,error}		255
493	transform	Reset	{}	{}		255
494	transform	transform.Transformer	{}	{}		256
495	transform	Span	{[]byte,bool}	{int,error}		256
\.


--
-- Data for Name: interfaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interfaces (id, package, name, implementable) FROM stdin;
1	p1	Namer	t
2	p1	I	f
3	p1	Public	t
4	p1	Private	f
5	p1	Error	f
6	p2	Twoer	t
7	lex	TokenReader	t
8	gc	U	t
9	gc	BoolFlag	t
10	gc	CountFlag	t
11	gc	E	t
12	main	I	t
13	ssa	Aux	t
14	ssa	Logger	t
15	ssa	Frontend	t
16	ssa	GCNode	t
17	ssa	Location	t
18	ssa	Aux	t
19	syntax	Node	f
20	syntax	Decl	f
21	syntax	Expr	f
22	syntax	Stmt	f
23	syntax	SimpleStmt	f
24	types	Extra	t
25	pkg	ExportedInterface	f
26	p	A1	f
27	p	B1	t
28	p	C1	t
29	p	D1	t
30	dwarf	Sym	t
31	dwarf	Context	t
32	dwarf	Data	t
33	obj	Val	t
34	obj	Curfn	t
35	objfile	Liner	t
36	objfile	RelocStringer	t
37	sym	Elfsect	t
38	main	FileLike	t
39	main	Arg	t
40	driver	Writer	t
41	driver	FlagSet	t
42	driver	Fetcher	t
43	driver	Symbolizer	t
44	driver	ObjTool	t
45	driver	ObjFile	t
46	driver	UI	t
47	plugin	Writer	t
48	plugin	FlagSet	t
49	plugin	Fetcher	t
50	plugin	Symbolizer	t
51	plugin	ObjTool	t
52	plugin	ObjFile	t
53	plugin	UI	t
54	demangle	AST	f
55	armasm	Arg	t
56	arm64asm	Arg	f
57	ppc64asm	Arg	t
58	x86asm	Arg	f
59	testdata	MethodTestInterface	t
60	testdata	V	t
61	flate	Resetter	t
62	flate	Reader	t
63	zlib	Resetter	t
64	heap	Interface	t
65	list	Value	t
66	ring	Value	t
67	context	Context	t
68	cipher	Block	t
69	cipher	Stream	t
70	cipher	BlockMode	t
71	cipher	AEAD	t
72	crypto	PublicKey	t
73	crypto	PrivateKey	t
74	crypto	Signer	t
75	crypto	SignerOpts	t
76	crypto	Decrypter	t
77	crypto	DecrypterOpts	t
78	elliptic	Curve	t
79	tls	ClientSessionCache	t
80	pkix	Value	t
81	x509	PublicKey	t
82	x509	PublicKey	t
83	driver	Value	t
84	driver	Driver	t
85	driver	DriverContext	t
86	driver	Connector	t
87	driver	Pinger	t
88	driver	Execer	t
89	driver	ExecerContext	t
90	driver	Queryer	t
91	driver	QueryerContext	t
92	driver	Conn	t
93	driver	ConnPrepareContext	t
94	driver	ConnBeginTx	t
95	driver	SessionResetter	t
96	driver	Result	t
97	driver	Stmt	t
98	driver	StmtExecContext	t
99	driver	StmtQueryContext	t
100	driver	NamedValueChecker	t
101	driver	ColumnConverter	t
102	driver	Rows	t
103	driver	RowsNextResultSet	t
104	driver	RowsColumnTypeScanType	t
105	driver	RowsColumnTypeDatabaseTypeName	t
106	driver	RowsColumnTypeLength	t
107	driver	RowsColumnTypeNullable	t
108	driver	RowsColumnTypePrecisionScale	t
109	driver	Tx	t
110	driver	ValueConverter	t
111	driver	Valuer	t
112	sql	Value	t
113	sql	Scanner	t
114	sql	Dest	t
115	sql	Result	t
116	dwarf	Val	t
117	dwarf	Type	t
118	macho	Load	t
119	pe	OptionalHeader	t
120	binary	ByteOrder	t
121	encoding	BinaryMarshaler	t
122	encoding	BinaryUnmarshaler	t
123	encoding	TextMarshaler	t
124	encoding	TextUnmarshaler	t
125	gob	GobEncoder	t
126	gob	GobDecoder	t
127	json	Unmarshaler	t
128	json	Marshaler	t
129	json	Token	t
130	xml	Marshaler	t
131	xml	MarshalerAttr	t
132	xml	Unmarshaler	t
133	xml	UnmarshalerAttr	t
134	xml	Token	t
135	xml	TokenReader	t
136	expvar	Var	t
137	flag	Value	t
138	flag	Getter	t
139	fmt	State	t
140	fmt	Formatter	t
141	fmt	Stringer	t
142	fmt	GoStringer	t
143	fmt	ScanState	t
144	fmt	Scanner	t
145	ast	Node	t
146	ast	Expr	f
147	ast	Stmt	f
148	ast	Decl	f
149	ast	Spec	f
150	ast	Decl	t
151	ast	Data	t
152	ast	Type	t
153	ast	Visitor	t
154	constant	Value	f
155	error1	I0	f
156	error1	ExportedField	f
157	error2	I0	f
158	error2	ExportedField	f
159	exports	T12	t
160	exports	T13	f
161	exports	T14	f
162	p	V	t
163	printer	Node	t
164	types	Importer	t
165	types	ImporterFrom	t
166	types	Object	f
167	types	Sizes	t
168	types	Type	t
169	hash	Hash	t
170	hash	Hash32	t
171	hash	Hash64	t
172	color	Color	t
173	color	Model	t
174	draw	Image	t
175	draw	Quantizer	t
176	draw	Drawer	t
177	image	Image	t
178	image	PalettedImage	t
179	jpeg	Reader	t
180	png	EncoderBufferPool	t
181	singleflight	Val	t
182	testlog	Interface	t
183	io	Reader	t
184	io	Writer	t
185	io	Closer	t
186	io	Seeker	t
187	io	ReadWriter	t
188	io	ReadCloser	t
189	io	WriteCloser	t
190	io	ReadWriteCloser	t
191	io	ReadSeeker	t
192	io	WriteSeeker	t
193	io	ReadWriteSeeker	t
194	io	ReaderFrom	t
195	io	WriterTo	t
196	io	ReaderAt	t
197	io	WriterAt	t
198	io	ByteReader	t
199	io	ByteScanner	t
200	io	ByteWriter	t
201	io	RuneReader	t
202	io	RuneScanner	t
203	rand	Source	t
204	rand	Source64	t
205	multipart	File	t
206	http	RoundTripper	t
207	cookiejar	PublicSuffixList	t
208	http	FileSystem	t
209	http	File	t
210	http	I	f
211	http	Pusher	t
212	httputil	BufferPool	t
213	http	CookieJar	t
214	http	Handler	t
215	http	ResponseWriter	t
216	http	Flusher	t
217	http	Hijacker	t
218	http	CloseNotifier	t
219	net	Addr	t
220	net	Conn	t
221	net	PacketConn	t
222	net	Listener	t
223	net	Error	f
224	rpc	Args	t
225	rpc	Reply	t
226	rpc	ClientCodec	t
227	jsonrpc	Error	t
228	jsonrpc	Result	t
229	jsonrpc	Error	t
230	rpc	ServerCodec	t
231	smtp	Auth	t
232	os	Signal	t
233	os	FileInfo	t
234	plugin	Symbol	t
235	reflect	Type	f
236	runtime	Error	f
237	sort	Interface	t
238	sync	Locker	t
239	syscall	RawConn	t
240	syscall	Conn	t
241	syscall	Sockaddr	f
242	syscall	RoutingMessage	f
243	syscall	RoutingMessage	f
244	syscall	Sockaddr	f
245	syscall	Sockaddr	f
246	quick	Generator	t
247	testing	TB	f
248	parse	Node	f
249	cryptobyte	MarshalingValue	t
250	lif	Addr	t
251	proxy	Dialer	t
252	route	Addr	t
253	route	Message	t
254	route	Sys	t
255	transform	Transformer	t
256	transform	SpanningTransformer	t
\.


--
-- Name: concrete_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_methods_id_seq', 3605, true);


--
-- Name: concrete_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_types_id_seq', 3619, true);


--
-- Name: interface_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interface_methods_id_seq', 495, true);


--
-- Name: interfaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interfaces_id_seq', 256, true);


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

