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
90	p1	StructValueMethod	{}	{}	S	28
91	p1	StructValueMethodNamedRecv	{}	{}	S	28
92	p1	SMethod	{int8,int16,int64}	{}	*S2	31
93	p1	JustOnT	{}	{}	*T	39
94	p1	JustOnB	{}	{}	*B	40
95	p1	OnEmbedded	{}	{}	*Embedded	44
96	p3	GoodPlayer	{}	{int}	*ThirdBase	48
97	asm	Parse	{}	{*obj.Prog,bool}	*Parser	50
98	asm	ParseSymABIs	{io.Writer}	{bool}	*Parser	50
99	flags	String	{}	{string}	*MultiFlag	52
100	flags	Set	{string}	{error}	*MultiFlag	52
101	lex	Error	{"...interface{}"}	{}	*Input	53
102	lex	Next	{}	{lex.ScanToken}	*Input	53
103	lex	Text	{}	{string}	*Input	53
104	lex	Push	{lex.TokenReader}	{}	*Input	53
105	lex	Close	{}	{}	*Input	53
106	lex	String	{}	{string}	ScanToken	54
107	lex	String	{}	{string}	Token	56
108	lex	Next	{}	{lex.ScanToken}	*Slice	58
109	lex	Text	{}	{string}	*Slice	58
110	lex	File	{}	{string}	*Slice	58
111	lex	Base	{}	{*src.PosBase}	*Slice	58
112	lex	SetBase	{*src.PosBase}	{}	*Slice	58
113	lex	Line	{}	{int}	*Slice	58
114	lex	Col	{}	{int}	*Slice	58
115	lex	Close	{}	{}	*Slice	58
116	lex	Push	{lex.TokenReader}	{}	*Stack	59
117	lex	Next	{}	{lex.ScanToken}	*Stack	59
118	lex	Text	{}	{string}	*Stack	59
119	lex	File	{}	{string}	*Stack	59
120	lex	Base	{}	{*src.PosBase}	*Stack	59
121	lex	SetBase	{*src.PosBase}	{}	*Stack	59
122	lex	Line	{}	{int}	*Stack	59
123	lex	Col	{}	{int}	*Stack	59
124	lex	Close	{}	{}	*Stack	59
125	lex	Text	{}	{string}	*Tokenizer	60
126	lex	File	{}	{string}	*Tokenizer	60
127	lex	Base	{}	{*src.PosBase}	*Tokenizer	60
128	lex	SetBase	{*src.PosBase}	{}	*Tokenizer	60
129	lex	Line	{}	{int}	*Tokenizer	60
130	lex	Col	{}	{int}	*Tokenizer	60
131	lex	Next	{}	{lex.ScanToken}	*Tokenizer	60
132	lex	Close	{}	{}	*Tokenizer	60
133	main	Translate	{*main.File}	{}	*Package	61
134	main	Record	{*main.File}	{}	*Package	61
135	main	Fatalf	{string,"...interface{}"}	{}	*Package	61
136	main	Printf	{string,"...interface{}"}	{}	*Package	61
137	main	ParseGo	{string,[]byte}	{}	*File	62
138	main	DiscardCgoDirectives	{}	{}	*File	62
139	main	Visit	{ast.Node}	{ast.Visitor}	*File	62
140	main	Pos	{}	{token.Pos}	*Ref	64
141	main	IsVar	{}	{bool}	*Name	65
142	main	IsConst	{}	{bool}	*Name	65
143	main	String	{}	{string}	*TypeRepr	67
144	main	Empty	{}	{bool}	*TypeRepr	67
145	main	Set	{string,"...interface{}"}	{}	*TypeRepr	67
146	gc	Ctype	{}	{gc.Ctype}	Val	72
147	gc	Interface	{}	{"interface{}"}	Val	72
148	gc	Format	{fmt.State,rune}	{}	Val	72
149	gc	String	{}	{string}	Class	79
150	gc	NewProg	{}	{*obj.Prog}	*Progs	81
151	gc	Flush	{}	{}	*Progs	81
152	gc	Free	{}	{}	*Progs	81
153	gc	Prog	{obj.As}	{*obj.Prog}	*Progs	81
154	gc	Appendpp	{*obj.Prog,obj.As,obj.AddrType,int16,int64,obj.AddrType,int16,int64}	{*obj.Prog}	*Progs	81
155	gc	SetInt	{*gc.Mpint}	{}	*Mpflt	84
156	gc	Set	{*gc.Mpflt}	{}	*Mpflt	84
157	gc	Add	{*gc.Mpflt}	{}	*Mpflt	84
158	gc	AddFloat64	{float64}	{}	*Mpflt	84
159	gc	Sub	{*gc.Mpflt}	{}	*Mpflt	84
160	gc	Mul	{*gc.Mpflt}	{}	*Mpflt	84
161	gc	MulFloat64	{float64}	{}	*Mpflt	84
162	gc	Quo	{*gc.Mpflt}	{}	*Mpflt	84
163	gc	Cmp	{*gc.Mpflt}	{int}	*Mpflt	84
164	gc	CmpFloat64	{float64}	{int}	*Mpflt	84
165	gc	Float64	{}	{float64}	*Mpflt	84
166	gc	Float32	{}	{float64}	*Mpflt	84
167	gc	SetFloat64	{float64}	{}	*Mpflt	84
168	gc	Neg	{}	{}	*Mpflt	84
169	gc	SetString	{string}	{}	*Mpflt	84
170	gc	String	{}	{string}	*Mpflt	84
171	gc	GoString	{}	{string}	*Mpflt	84
172	gc	Mul	{*gc.Mpcplx}	{}	*Mpcplx	85
173	gc	Div	{*gc.Mpcplx}	{bool}	*Mpcplx	85
174	gc	String	{}	{string}	*Mpcplx	85
175	gc	GoString	{}	{string}	*Mpcplx	85
176	gc	SetOverflow	{}	{}	*Mpint	86
177	gc	Set	{*gc.Mpint}	{}	*Mpint	86
178	gc	SetFloat	{*gc.Mpflt}	{bool}	*Mpint	86
179	gc	Add	{*gc.Mpint}	{}	*Mpint	86
180	gc	Sub	{*gc.Mpint}	{}	*Mpint	86
181	gc	Mul	{*gc.Mpint}	{}	*Mpint	86
182	gc	Quo	{*gc.Mpint}	{}	*Mpint	86
183	gc	Rem	{*gc.Mpint}	{}	*Mpint	86
184	gc	Or	{*gc.Mpint}	{}	*Mpint	86
185	gc	And	{*gc.Mpint}	{}	*Mpint	86
186	gc	AndNot	{*gc.Mpint}	{}	*Mpint	86
187	gc	Xor	{*gc.Mpint}	{}	*Mpint	86
188	gc	Lsh	{*gc.Mpint}	{}	*Mpint	86
189	gc	Rsh	{*gc.Mpint}	{}	*Mpint	86
190	gc	Cmp	{*gc.Mpint}	{int}	*Mpint	86
191	gc	CmpInt64	{int64}	{int}	*Mpint	86
192	gc	Neg	{}	{}	*Mpint	86
193	gc	Int64	{}	{int64}	*Mpint	86
194	gc	SetInt64	{int64}	{}	*Mpint	86
195	gc	SetString	{string}	{}	*Mpint	86
196	gc	GoString	{}	{string}	*Mpint	86
197	gc	String	{}	{string}	*Mpint	86
198	gc	Get	{*ssa.Value}	{gc.LivenessIndex}	LivenessMap	90
199	gc	Valid	{}	{bool}	LivenessIndex	91
200	gc	Prog	{obj.As}	{*obj.Prog}	*SSAGenState	97
201	gc	Pc	{}	{*obj.Prog}	*SSAGenState	97
202	gc	SetPos	{src.XPos}	{}	*SSAGenState	97
203	gc	Br	{obj.As,*ssa.Block}	{*obj.Prog}	*SSAGenState	97
204	gc	DebugFriendlySetPosFrom	{*ssa.Value}	{}	*SSAGenState	97
205	gc	FPJump	{*ssa.Block,*ssa.Block,*[][]gc.FloatingEQNEJump}	{}	*SSAGenState	97
206	gc	AddrScratch	{*obj.Addr}	{}	*SSAGenState	97
207	gc	Call	{*ssa.Value}	{*obj.Prog}	*SSAGenState	97
208	gc	PrepareCall	{*ssa.Value}	{}	*SSAGenState	97
209	gc	Int64	{}	{int64}	*Node	102
210	gc	CanInt64	{}	{bool}	*Node	102
211	gc	Bool	{}	{bool}	*Node	102
212	gc	Format	{fmt.State,rune}	{}	*Node	102
213	gc	String	{}	{string}	*Node	102
214	gc	Typ	{}	{*types.Type}	*Node	102
215	gc	StorageClass	{}	{ssa.StorageClass}	*Node	102
216	gc	IsMethod	{}	{bool}	*Node	102
217	gc	SliceBounds	{}	{*gc.Node}	*Node	102
218	gc	SetSliceBounds	{*gc.Node,*gc.Node,*gc.Node}	{}	*Node	102
219	gc	ResetAux	{}	{}	*Node	102
220	gc	SubOp	{}	{gc.Op}	*Node	102
221	gc	SetSubOp	{gc.Op}	{}	*Node	102
222	gc	IndexMapLValue	{}	{bool}	*Node	102
223	gc	SetIndexMapLValue	{bool}	{}	*Node	102
224	gc	TChanDir	{}	{types.ChanDir}	*Node	102
225	gc	SetTChanDir	{types.ChanDir}	{}	*Node	102
226	gc	IsSynthetic	{}	{bool}	*Node	102
227	gc	IsAutoTmp	{}	{bool}	*Node	102
228	gc	Class	{}	{gc.Class}	*Node	102
229	gc	Walkdef	{}	{uint8}	*Node	102
230	gc	Typecheck	{}	{uint8}	*Node	102
231	gc	Initorder	{}	{uint8}	*Node	102
232	gc	HasBreak	{}	{bool}	*Node	102
233	gc	IsClosureVar	{}	{bool}	*Node	102
234	gc	NoInline	{}	{bool}	*Node	102
235	gc	IsOutputParamHeapAddr	{}	{bool}	*Node	102
236	gc	Assigned	{}	{bool}	*Node	102
237	gc	Addrtaken	{}	{bool}	*Node	102
238	gc	Implicit	{}	{bool}	*Node	102
239	gc	IsDDD	{}	{bool}	*Node	102
240	gc	Diag	{}	{bool}	*Node	102
241	gc	Colas	{}	{bool}	*Node	102
242	gc	NonNil	{}	{bool}	*Node	102
243	gc	Noescape	{}	{bool}	*Node	102
244	gc	Bounded	{}	{bool}	*Node	102
245	gc	Addable	{}	{bool}	*Node	102
246	gc	HasCall	{}	{bool}	*Node	102
247	gc	Likely	{}	{bool}	*Node	102
248	gc	HasVal	{}	{bool}	*Node	102
249	gc	HasOpt	{}	{bool}	*Node	102
250	gc	Embedded	{}	{bool}	*Node	102
251	gc	InlFormal	{}	{bool}	*Node	102
252	gc	InlLocal	{}	{bool}	*Node	102
253	gc	SetClass	{gc.Class}	{}	*Node	102
254	gc	SetWalkdef	{uint8}	{}	*Node	102
255	gc	SetTypecheck	{uint8}	{}	*Node	102
256	gc	SetInitorder	{uint8}	{}	*Node	102
257	gc	SetHasBreak	{bool}	{}	*Node	102
258	gc	SetIsClosureVar	{bool}	{}	*Node	102
259	gc	SetNoInline	{bool}	{}	*Node	102
260	gc	SetIsOutputParamHeapAddr	{bool}	{}	*Node	102
261	gc	SetAssigned	{bool}	{}	*Node	102
262	gc	SetAddrtaken	{bool}	{}	*Node	102
263	gc	SetImplicit	{bool}	{}	*Node	102
264	gc	SetIsDDD	{bool}	{}	*Node	102
265	gc	SetDiag	{bool}	{}	*Node	102
266	gc	SetColas	{bool}	{}	*Node	102
267	gc	SetNonNil	{bool}	{}	*Node	102
268	gc	SetNoescape	{bool}	{}	*Node	102
269	gc	SetBounded	{bool}	{}	*Node	102
270	gc	SetAddable	{bool}	{}	*Node	102
271	gc	SetHasCall	{bool}	{}	*Node	102
272	gc	SetLikely	{bool}	{}	*Node	102
273	gc	SetHasVal	{bool}	{}	*Node	102
274	gc	SetHasOpt	{bool}	{}	*Node	102
275	gc	SetEmbedded	{bool}	{}	*Node	102
276	gc	SetInlFormal	{bool}	{}	*Node	102
277	gc	SetInlLocal	{bool}	{}	*Node	102
278	gc	Val	{}	{gc.Val}	*Node	102
279	gc	SetVal	{gc.Val}	{}	*Node	102
280	gc	Opt	{}	{"interface{}"}	*Node	102
281	gc	SetOpt	{"interface{}"}	{}	*Node	102
282	gc	Iota	{}	{int64}	*Node	102
283	gc	SetIota	{int64}	{}	*Node	102
284	gc	Line	{}	{string}	*Node	102
285	gc	Captured	{}	{bool}	*Name	103
286	gc	Readonly	{}	{bool}	*Name	103
287	gc	Byval	{}	{bool}	*Name	103
288	gc	Needzero	{}	{bool}	*Name	103
289	gc	Keepalive	{}	{bool}	*Name	103
290	gc	AutoTemp	{}	{bool}	*Name	103
291	gc	Used	{}	{bool}	*Name	103
292	gc	SetCaptured	{bool}	{}	*Name	103
293	gc	SetReadonly	{bool}	{}	*Name	103
294	gc	SetByval	{bool}	{}	*Name	103
295	gc	SetNeedzero	{bool}	{}	*Name	103
296	gc	SetKeepalive	{bool}	{}	*Name	103
297	gc	SetAutoTemp	{bool}	{}	*Name	103
298	gc	SetUsed	{bool}	{}	*Name	103
299	gc	Dupok	{}	{bool}	*Func	105
300	gc	Wrapper	{}	{bool}	*Func	105
301	gc	Needctxt	{}	{bool}	*Func	105
302	gc	ReflectMethod	{}	{bool}	*Func	105
303	gc	IsHiddenClosure	{}	{bool}	*Func	105
304	gc	HasDefer	{}	{bool}	*Func	105
305	gc	NilCheckDisabled	{}	{bool}	*Func	105
306	gc	InlinabilityChecked	{}	{bool}	*Func	105
307	gc	ExportInline	{}	{bool}	*Func	105
308	gc	InstrumentBody	{}	{bool}	*Func	105
309	gc	SetDupok	{bool}	{}	*Func	105
310	gc	SetWrapper	{bool}	{}	*Func	105
311	gc	SetNeedctxt	{bool}	{}	*Func	105
312	gc	SetReflectMethod	{bool}	{}	*Func	105
313	gc	SetIsHiddenClosure	{bool}	{}	*Func	105
314	gc	SetHasDefer	{bool}	{}	*Func	105
315	gc	SetNilCheckDisabled	{bool}	{}	*Func	105
316	gc	SetInlinabilityChecked	{bool}	{}	*Func	105
317	gc	SetExportInline	{bool}	{}	*Func	105
318	gc	SetInstrumentBody	{bool}	{}	*Func	105
319	gc	GoString	{}	{string}	Op	109
320	gc	Format	{fmt.State,rune}	{}	Op	109
321	gc	String	{}	{string}	Op	109
322	gc	IsSlice3	{}	{bool}	Op	109
323	gc	Format	{fmt.State,rune}	{}	Nodes	110
324	gc	String	{}	{string}	Nodes	110
325	gc	Slice	{}	{[]*gc.Node}	Nodes	110
326	gc	Len	{}	{int}	Nodes	110
327	gc	Index	{int}	{*gc.Node}	Nodes	110
328	gc	First	{}	{*gc.Node}	Nodes	110
329	gc	Second	{}	{*gc.Node}	Nodes	110
330	gc	Set	{[]*gc.Node}	{}	*Nodes	110
331	gc	Set1	{*gc.Node}	{}	*Nodes	110
332	gc	Set2	{*gc.Node,*gc.Node}	{}	*Nodes	110
333	gc	Set3	{*gc.Node,*gc.Node,*gc.Node}	{}	*Nodes	110
334	gc	MoveNodes	{*gc.Nodes}	{}	*Nodes	110
335	gc	SetIndex	{int,*gc.Node}	{}	Nodes	110
336	gc	SetFirst	{*gc.Node}	{}	Nodes	110
337	gc	SetSecond	{*gc.Node}	{}	Nodes	110
338	gc	Addr	{int}	{**gc.Node}	Nodes	110
339	gc	Append	{...*gc.Node}	{}	*Nodes	110
340	gc	Prepend	{...*gc.Node}	{}	*Nodes	110
341	gc	AppendNodes	{*gc.Nodes}	{}	*Nodes	110
342	gc	Start	{...string}	{}	*Timings	111
343	gc	Stop	{...string}	{}	*Timings	111
344	gc	AddEvent	{int64,string}	{}	*Timings	111
345	gc	Write	{io.Writer,string}	{}	*Timings	111
346	ssa	String	{}	{string}	*Block	112
347	ssa	LongString	{}	{string}	*Block	112
348	ssa	SetControl	{*ssa.Value}	{}	*Block	112
349	ssa	AddEdgeTo	{*ssa.Block}	{}	*Block	112
350	ssa	LackingPos	{}	{bool}	*Block	112
351	ssa	Logf	{string,"...interface{}"}	{}	*Block	112
352	ssa	Log	{}	{bool}	*Block	112
353	ssa	Fatalf	{string,"...interface{}"}	{}	*Block	112
354	ssa	NewValue0	{src.XPos,ssa.Op,*types.Type}	{*ssa.Value}	*Block	112
355	ssa	NewValue0I	{src.XPos,ssa.Op,*types.Type,int64}	{*ssa.Value}	*Block	112
356	ssa	NewValue0A	{src.XPos,ssa.Op,*types.Type,"interface{}"}	{*ssa.Value}	*Block	112
357	ssa	NewValue0IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}"}	{*ssa.Value}	*Block	112
358	ssa	NewValue1	{src.XPos,ssa.Op,*types.Type,*ssa.Value}	{*ssa.Value}	*Block	112
359	ssa	NewValue1I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Block	112
360	ssa	NewValue1A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	112
361	ssa	NewValue1IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	112
362	ssa	NewValue2	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	112
363	ssa	NewValue2A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	112
364	ssa	NewValue2I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	112
429	ssa	IsCall	{}	{bool}	Op	141
365	ssa	NewValue2IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}",*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	112
366	ssa	NewValue3	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	112
367	ssa	NewValue3I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	112
368	ssa	NewValue3A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	112
369	ssa	NewValue4	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	112
370	ssa	HTML	{}	{string}	*Block	112
371	ssa	LongHTML	{}	{string}	*Block	112
372	ssa	Block	{}	{*ssa.Block}	Edge	113
373	ssa	Index	{}	{int}	Edge	113
374	ssa	String	{}	{string}	BlockKind	114
375	ssa	Reset	{}	{}	*Cache	116
376	ssa	Set387	{bool}	{}	*Config	117
377	ssa	Ctxt	{}	{*obj.Link}	*Config	117
378	ssa	SetTypPtrs	{}	{}	*Types	118
379	ssa	PutLocationList	{[]byte,*obj.Link,*obj.LSym,*obj.LSym}	{}	*FuncDebug	125
380	ssa	NumBlocks	{}	{int}	*Func	130
381	ssa	NumValues	{}	{int}	*Func	130
382	ssa	LogStat	{string,"...interface{}"}	{}	*Func	130
383	ssa	NewBlock	{ssa.BlockKind}	{*ssa.Block}	*Func	130
384	ssa	ConstBool	{*types.Type,bool}	{*ssa.Value}	*Func	130
385	ssa	ConstInt8	{*types.Type,int8}	{*ssa.Value}	*Func	130
386	ssa	ConstInt16	{*types.Type,int16}	{*ssa.Value}	*Func	130
387	ssa	ConstInt32	{*types.Type,int32}	{*ssa.Value}	*Func	130
388	ssa	ConstInt64	{*types.Type,int64}	{*ssa.Value}	*Func	130
389	ssa	ConstFloat32	{*types.Type,float64}	{*ssa.Value}	*Func	130
390	ssa	ConstFloat64	{*types.Type,float64}	{*ssa.Value}	*Func	130
391	ssa	ConstSlice	{*types.Type}	{*ssa.Value}	*Func	130
392	ssa	ConstInterface	{*types.Type}	{*ssa.Value}	*Func	130
393	ssa	ConstNil	{*types.Type}	{*ssa.Value}	*Func	130
394	ssa	ConstEmptyString	{*types.Type}	{*ssa.Value}	*Func	130
395	ssa	ConstOffPtrSP	{*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Func	130
396	ssa	Frontend	{}	{ssa.Frontend}	*Func	130
397	ssa	Warnl	{src.XPos,string,"...interface{}"}	{}	*Func	130
398	ssa	Logf	{string,"...interface{}"}	{}	*Func	130
399	ssa	Log	{}	{bool}	*Func	130
400	ssa	Fatalf	{string,"...interface{}"}	{}	*Func	130
401	ssa	Postorder	{}	{[]*ssa.Block}	*Func	130
402	ssa	Idom	{}	{[]*ssa.Block}	*Func	130
403	ssa	DebugHashMatch	{string,string}	{bool}	*Func	130
404	ssa	HTML	{string,*ssa.dotWriter}	{string}	*Func	130
405	ssa	String	{}	{string}	*Func	130
406	main	Len	{}	{int}	ArchsByName	131
407	main	Swap	{int,int}	{}	ArchsByName	131
408	main	Less	{int,int}	{bool}	ArchsByName	131
409	main	String	{}	{string}	Rule	132
410	ssa	Close	{}	{}	*HTMLWriter	133
411	ssa	WriteFunc	{string,string,*ssa.Func}	{}	*HTMLWriter	133
412	ssa	WriteSources	{string,[]*ssa.FuncLines}	{}	*HTMLWriter	133
413	ssa	WriteAST	{string,*bytes.Buffer}	{}	*HTMLWriter	133
414	ssa	WriteColumn	{string,string,string,string}	{}	*HTMLWriter	133
415	ssa	Printf	{string,"...interface{}"}	{}	*HTMLWriter	133
416	ssa	WriteString	{string}	{}	*HTMLWriter	133
417	ssa	Len	{}	{int}	ByTopo	135
418	ssa	Swap	{int,int}	{}	ByTopo	135
419	ssa	Less	{int,int}	{bool}	ByTopo	135
420	ssa	String	{}	{string}	*Register	138
421	ssa	ObjNum	{}	{int16}	*Register	138
422	ssa	GCNum	{}	{int16}	*Register	138
423	ssa	String	{}	{string}	LocalSlot	139
424	ssa	String	{}	{string}	LocPair	140
425	ssa	Asm	{}	{obj.As}	Op	141
426	ssa	String	{}	{string}	Op	141
427	ssa	UsesScratch	{}	{bool}	Op	141
428	ssa	SymEffect	{}	{ssa.SymEffect}	Op	141
430	ssa	Val	{}	{int64}	ValAndOff	143
431	ssa	Off	{}	{int64}	ValAndOff	143
432	ssa	Int64	{}	{int64}	ValAndOff	143
433	ssa	String	{}	{string}	ValAndOff	143
434	ssa	String	{}	{string}	*RBTint32	144
435	ssa	IsEmpty	{}	{bool}	*RBTint32	144
436	ssa	IsSingle	{}	{bool}	*RBTint32	144
437	ssa	VisitInOrder	{"func(int32, interface{})"}	{}	*RBTint32	144
438	ssa	Find	{int32}	{"interface{}"}	*RBTint32	144
439	ssa	Insert	{int32,"interface{}"}	{"interface{}"}	*RBTint32	144
440	ssa	Min	{}	{int32,"interface{}"}	*RBTint32	144
441	ssa	Max	{}	{int32,"interface{}"}	*RBTint32	144
442	ssa	Glb	{int32}	{int32,"interface{}"}	*RBTint32	144
443	ssa	GlbEq	{int32}	{int32,"interface{}"}	*RBTint32	144
444	ssa	Lub	{int32}	{int32,"interface{}"}	*RBTint32	144
445	ssa	LubEq	{int32}	{int32,"interface{}"}	*RBTint32	144
446	ssa	Len	{}	{int}	ValHeap	145
447	ssa	Swap	{int,int}	{}	ValHeap	145
448	ssa	Push	{"interface{}"}	{}	*ValHeap	145
449	ssa	Pop	{}	{"interface{}"}	*ValHeap	145
450	ssa	Less	{int,int}	{bool}	ValHeap	145
451	ssa	String	{}	{string}	*SparseTreeNode	146
452	ssa	Entry	{}	{int32}	*SparseTreeNode	146
453	ssa	Exit	{}	{int32}	*SparseTreeNode	146
454	ssa	Sibling	{*ssa.Block}	{*ssa.Block}	SparseTree	147
455	ssa	Child	{*ssa.Block}	{*ssa.Block}	SparseTree	147
456	ssa	Insert	{*ssa.Block,int32,"interface{}",*ssa.SparseTreeHelper}	{}	*SparseTreeMap	148
457	ssa	Find	{*ssa.Block,int32,*ssa.SparseTreeHelper}	{"interface{}"}	*SparseTreeMap	148
458	ssa	String	{}	{string}	*SparseTreeMap	148
459	ssa	NewTree	{}	{*ssa.SparseTreeMap}	*SparseTreeHelper	149
460	ssa	HTML	{}	{string}	*Value	150
461	ssa	LongHTML	{}	{string}	*Value	150
462	ssa	String	{}	{string}	*Value	150
463	ssa	AuxInt8	{}	{int8}	*Value	150
464	ssa	AuxInt16	{}	{int16}	*Value	150
465	ssa	AuxInt32	{}	{int32}	*Value	150
466	ssa	AuxUnsigned	{}	{uint64}	*Value	150
467	ssa	AuxFloat	{}	{float64}	*Value	150
468	ssa	AuxValAndOff	{}	{ssa.ValAndOff}	*Value	150
469	ssa	LongString	{}	{string}	*Value	150
470	ssa	AddArg	{*ssa.Value}	{}	*Value	150
471	ssa	AddArgs	{...*ssa.Value}	{}	*Value	150
472	ssa	SetArg	{int,*ssa.Value}	{}	*Value	150
473	ssa	RemoveArg	{int}	{}	*Value	150
474	ssa	SetArgs1	{*ssa.Value}	{}	*Value	150
475	ssa	SetArgs2	{*ssa.Value,*ssa.Value}	{}	*Value	150
476	ssa	Logf	{string,"...interface{}"}	{}	*Value	150
477	ssa	Log	{}	{bool}	*Value	150
478	ssa	Fatalf	{string,"...interface{}"}	{}	*Value	150
479	ssa	Reg	{}	{int16}	*Value	150
480	ssa	Reg0	{}	{int16}	*Value	150
481	ssa	Reg1	{}	{int16}	*Value	150
482	ssa	RegName	{}	{string}	*Value	150
483	ssa	MemoryArg	{}	{*ssa.Value}	*Value	150
484	ssa	LackingPos	{}	{bool}	*Value	150
485	syntax	IsKnown	{}	{bool}	Pos	207
486	syntax	Base	{}	{*syntax.PosBase}	Pos	207
487	syntax	Line	{}	{uint}	Pos	207
488	syntax	Col	{}	{uint}	Pos	207
489	syntax	RelFilename	{}	{string}	Pos	207
490	syntax	RelLine	{}	{uint}	Pos	207
491	syntax	RelCol	{}	{uint}	Pos	207
492	syntax	String	{}	{string}	Pos	207
493	syntax	IsFileBase	{}	{bool}	*PosBase	208
494	syntax	Pos	{}	{syntax.Pos}	*PosBase	208
495	syntax	Filename	{}	{string}	*PosBase	208
496	syntax	Line	{}	{uint}	*PosBase	208
497	syntax	Col	{}	{uint}	*PosBase	208
498	syntax	Error	{}	{string}	Error	210
499	syntax	Error	{}	{string}	*Error	210
500	syntax	String	{}	{string}	Operator	215
501	types	Lookup	{string}	{*types.Sym}	*Pkg	216
502	types	LookupOK	{string}	{*types.Sym,bool}	*Pkg	216
503	types	LookupBytes	{[]byte}	{*types.Sym}	*Pkg	216
504	types	PkgDef	{}	{*types.Node}	*Sym	217
505	types	SetPkgDef	{*types.Node}	{}	*Sym	217
506	types	OnExportList	{}	{bool}	*Sym	217
507	types	Uniq	{}	{bool}	*Sym	217
508	types	Siggen	{}	{bool}	*Sym	217
509	types	Asm	{}	{bool}	*Sym	217
510	types	AlgGen	{}	{bool}	*Sym	217
511	types	Func	{}	{bool}	*Sym	217
512	types	SetOnExportList	{bool}	{}	*Sym	217
513	types	SetUniq	{bool}	{}	*Sym	217
514	types	SetSiggen	{bool}	{}	*Sym	217
515	types	SetAsm	{bool}	{}	*Sym	217
516	types	SetAlgGen	{bool}	{}	*Sym	217
517	types	SetFunc	{bool}	{}	*Sym	217
518	types	IsBlank	{}	{bool}	*Sym	217
519	types	LinksymName	{}	{string}	*Sym	217
520	types	Linksym	{}	{*obj.LSym}	*Sym	217
521	types	Less	{*types.Sym}	{bool}	*Sym	217
522	types	String	{}	{string}	*Sym	217
523	types	Format	{fmt.State,rune}	{}	*Sym	217
524	types	String	{}	{string}	EType	219
525	types	CanRecv	{}	{bool}	ChanDir	220
526	types	CanSend	{}	{bool}	ChanDir	220
527	types	NotInHeap	{}	{bool}	*Type	221
528	types	Broke	{}	{bool}	*Type	221
529	types	Noalg	{}	{bool}	*Type	221
530	types	Deferwidth	{}	{bool}	*Type	221
531	types	Recur	{}	{bool}	*Type	221
532	types	SetNotInHeap	{bool}	{}	*Type	221
533	types	SetBroke	{bool}	{}	*Type	221
534	types	SetNoalg	{bool}	{}	*Type	221
535	types	SetDeferwidth	{bool}	{}	*Type	221
536	types	SetRecur	{bool}	{}	*Type	221
537	types	Pkg	{}	{*types.Pkg}	*Type	221
538	types	SetPkg	{*types.Pkg}	{}	*Type	221
539	types	MapType	{}	{*types.Map}	*Type	221
540	types	ForwardType	{}	{*types.Forward}	*Type	221
541	types	FuncType	{}	{*types.Func}	*Type	221
542	types	StructType	{}	{*types.Struct}	*Type	221
543	types	ChanType	{}	{*types.Chan}	*Type	221
544	types	Recvs	{}	{*types.Type}	*Type	221
545	types	Params	{}	{*types.Type}	*Type	221
546	types	Results	{}	{*types.Type}	*Type	221
547	types	NumRecvs	{}	{int}	*Type	221
548	types	NumParams	{}	{int}	*Type	221
549	types	NumResults	{}	{int}	*Type	221
550	types	IsVariadic	{}	{bool}	*Type	221
551	types	Recv	{}	{*types.Field}	*Type	221
552	types	Key	{}	{*types.Type}	*Type	221
553	types	Elem	{}	{*types.Type}	*Type	221
554	types	DDDField	{}	{*types.Type}	*Type	221
555	types	ChanArgs	{}	{*types.Type}	*Type	221
556	types	FuncArgs	{}	{*types.Type}	*Type	221
557	types	Nname	{}	{*types.Node}	*Type	221
558	types	SetNname	{*types.Node}	{}	*Type	221
559	types	IsFuncArgStruct	{}	{bool}	*Type	221
560	types	Methods	{}	{*types.Fields}	*Type	221
561	types	AllMethods	{}	{*types.Fields}	*Type	221
562	types	Fields	{}	{*types.Fields}	*Type	221
563	types	Field	{int}	{*types.Field}	*Type	221
564	types	FieldSlice	{}	{[]*types.Field}	*Type	221
565	types	SetFields	{[]*types.Field}	{}	*Type	221
566	types	SetInterface	{[]*types.Field}	{}	*Type	221
567	types	IsDDDArray	{}	{bool}	*Type	221
568	types	WidthCalculated	{}	{bool}	*Type	221
569	types	ArgWidth	{}	{int64}	*Type	221
570	types	Size	{}	{int64}	*Type	221
571	types	Alignment	{}	{int64}	*Type	221
572	types	SimpleString	{}	{string}	*Type	221
573	types	Compare	{*types.Type}	{types.Cmp}	*Type	221
574	types	IsKind	{types.EType}	{bool}	*Type	221
575	types	IsBoolean	{}	{bool}	*Type	221
576	types	ToUnsigned	{}	{*types.Type}	*Type	221
577	types	IsInteger	{}	{bool}	*Type	221
578	types	IsSigned	{}	{bool}	*Type	221
579	types	IsFloat	{}	{bool}	*Type	221
580	types	IsComplex	{}	{bool}	*Type	221
581	types	IsPtr	{}	{bool}	*Type	221
582	types	IsPtrElem	{}	{bool}	*Type	221
583	types	IsUnsafePtr	{}	{bool}	*Type	221
584	types	IsPtrShaped	{}	{bool}	*Type	221
585	types	IsString	{}	{bool}	*Type	221
586	types	IsMap	{}	{bool}	*Type	221
587	types	IsChan	{}	{bool}	*Type	221
588	types	IsSlice	{}	{bool}	*Type	221
589	types	IsArray	{}	{bool}	*Type	221
590	types	IsStruct	{}	{bool}	*Type	221
591	types	IsInterface	{}	{bool}	*Type	221
592	types	IsEmptyInterface	{}	{bool}	*Type	221
593	types	PtrTo	{}	{*types.Type}	*Type	221
594	types	NumFields	{}	{int}	*Type	221
595	types	FieldType	{int}	{*types.Type}	*Type	221
596	types	FieldOff	{int}	{int64}	*Type	221
597	types	FieldName	{int}	{string}	*Type	221
598	types	NumElem	{}	{int64}	*Type	221
599	types	SetNumElem	{int64}	{}	*Type	221
600	types	NumComponents	{types.componentsIncludeBlankFields}	{int64}	*Type	221
601	types	ChanDir	{}	{types.ChanDir}	*Type	221
602	types	IsMemory	{}	{bool}	*Type	221
603	types	IsFlags	{}	{bool}	*Type	221
604	types	IsVoid	{}	{bool}	*Type	221
605	types	IsTuple	{}	{bool}	*Type	221
606	types	IsUntyped	{}	{bool}	*Type	221
607	types	HasHeapPointer	{}	{bool}	*Type	221
608	types	Symbol	{}	{*obj.LSym}	*Type	221
609	types	Tie	{}	{byte}	*Type	221
610	types	String	{}	{string}	*Type	221
611	types	ShortString	{}	{string}	*Type	221
612	types	LongString	{}	{string}	*Type	221
613	types	Format	{fmt.State,rune}	{}	*Type	221
614	types	Key	{}	{types.Type}	*Map	222
615	types	Elem	{}	{types.Type}	*Map	222
616	types	Underlying	{}	{types.Type}	*Map	222
617	types	String	{}	{string}	*Map	222
618	types	FullName	{}	{string}	*Func	224
619	types	Scope	{}	{*types.Scope}	*Func	224
620	types	String	{}	{string}	*Func	224
621	types	NumFields	{}	{int}	*Struct	225
622	types	Field	{int}	{*types.Var}	*Struct	225
623	types	Tag	{int}	{string}	*Struct	225
624	types	Underlying	{}	{types.Type}	*Struct	225
625	types	String	{}	{string}	*Struct	225
626	types	NumExplicitMethods	{}	{int}	*Interface	227
627	types	ExplicitMethod	{int}	{*types.Func}	*Interface	227
628	types	NumEmbeddeds	{}	{int}	*Interface	227
629	types	Embedded	{int}	{*types.Named}	*Interface	227
630	types	EmbeddedType	{int}	{types.Type}	*Interface	227
631	types	NumMethods	{}	{int}	*Interface	227
632	types	Method	{int}	{*types.Func}	*Interface	227
633	types	Empty	{}	{bool}	*Interface	227
634	types	Complete	{}	{*types.Interface}	*Interface	227
635	types	Underlying	{}	{types.Type}	*Interface	227
636	types	String	{}	{string}	*Interface	227
637	types	Dir	{}	{types.ChanDir}	*Chan	232
638	types	Elem	{}	{types.Type}	*Chan	232
639	types	Underlying	{}	{types.Type}	*Chan	232
640	types	String	{}	{string}	*Chan	232
641	types	Len	{}	{int}	*Tuple	233
642	types	At	{int}	{*types.Var}	*Tuple	233
643	types	Underlying	{}	{types.Type}	*Tuple	233
644	types	String	{}	{string}	*Tuple	233
645	types	Len	{}	{int64}	*Array	234
646	types	Elem	{}	{types.Type}	*Array	234
647	types	Underlying	{}	{types.Type}	*Array	234
648	types	String	{}	{string}	*Array	234
649	types	Elem	{}	{types.Type}	*Slice	235
650	types	Underlying	{}	{types.Type}	*Slice	235
651	types	String	{}	{string}	*Slice	235
652	types	IsDDD	{}	{bool}	*Field	236
653	types	Broke	{}	{bool}	*Field	236
654	types	Nointerface	{}	{bool}	*Field	236
655	types	SetIsDDD	{bool}	{}	*Field	236
656	types	SetBroke	{bool}	{}	*Field	236
657	types	SetNointerface	{bool}	{}	*Field	236
658	types	End	{}	{int64}	*Field	236
659	types	Copy	{}	{*types.Field}	*Field	236
660	types	Len	{}	{int}	*Fields	237
661	types	Slice	{}	{[]*types.Field}	*Fields	237
662	types	Index	{int}	{*types.Field}	*Fields	237
663	types	Set	{[]*types.Field}	{}	*Fields	237
664	types	Append	{...*types.Field}	{}	*Fields	237
665	main	Visit	{ast.Node}	{ast.Visitor}	*FuncVisitor	242
666	main	Boundaries	{[]byte}	{[]main.Boundary}	*Profile	244
667	main	Reset	{}	{}	*Dirs	248
668	main	Next	{}	{main.Dir,bool}	*Dirs	248
669	main	Error	{}	{string}	PackageError	250
670	pkg	ExportedMethod	{int}	{bool}	ExportedType	252
671	base	LongName	{}	{string}	*Command	259
672	base	Name	{}	{string}	*Command	259
673	base	Usage	{}	{}	*Command	259
674	base	Runnable	{}	{bool}	*Command	259
675	base	Set	{string}	{error}	*StringsFlag	260
676	base	String	{}	{string}	*StringsFlag	260
677	cache	Get	{cache.ActionID}	{cache.Entry,error}	*Cache	263
678	cache	GetFile	{cache.ActionID}	{string,cache.Entry,error}	*Cache	263
679	cache	GetBytes	{cache.ActionID}	{[]byte,cache.Entry,error}	*Cache	263
680	cache	OutputFile	{cache.OutputID}	{string}	*Cache	263
681	cache	Trim	{}	{}	*Cache	263
682	cache	Put	{cache.ActionID,io.ReadSeeker}	{cache.OutputID,int64,error}	*Cache	263
683	cache	PutNoVerify	{cache.ActionID,io.ReadSeeker}	{cache.OutputID,int64,error}	*Cache	263
684	cache	PutBytes	{cache.ActionID,[]byte}	{error}	*Cache	263
685	cache	Write	{[]byte}	{int,error}	*Hash	265
686	cache	Sum	{}	{[]byte}	*Hash	265
687	get	Error	{}	{string}	ImportMismatchError	272
688	list	Write	{[]byte}	{int,error}	*TrackingWriter	274
689	list	Flush	{}	{}	*TrackingWriter	274
690	list	NeedNL	{}	{bool}	*TrackingWriter	274
691	load	Set	{string}	{error}	*PerPackageFlag	275
692	load	String	{}	{string}	*PerPackageFlag	275
693	load	Present	{}	{bool}	*PerPackageFlag	275
694	load	For	{*load.Package}	{[]string}	*PerPackageFlag	275
695	load	AllFiles	{}	{[]string}	*Package	276
696	load	Desc	{}	{string}	*Package	276
697	load	Resolve	{[]string}	{[]string}	*Package	276
698	load	InternalGoFiles	{}	{[]string}	*Package	276
699	load	InternalXGoFiles	{}	{[]string}	*Package	276
700	load	InternalAllGoFiles	{}	{[]string}	*Package	276
701	load	UsesSwig	{}	{bool}	*Package	276
702	load	UsesCgo	{}	{bool}	*Package	276
703	load	Error	{}	{string}	*NoGoError	279
704	load	Error	{}	{string}	*PackageError	281
705	load	Push	{string}	{}	*ImportStack	282
706	load	Pop	{}	{}	*ImportStack	282
707	load	Copy	{}	{[]string}	*ImportStack	282
708	lockedfile	Close	{}	{error}	*File	286
709	lockedfile	String	{}	{string}	*Mutex	287
710	lockedfile	Lock	{}	{func(),error}	*Mutex	287
711	codehost	Error	{}	{string}	*RunError	291
712	codehost	Error	{}	{string}	*VCSError	292
713	modfile	Comment	{}	{*modfile.Comments}	*Comments	298
714	modfile	Span	{}	{modfile.Position}	*FileSyntax	299
715	modfile	Cleanup	{}	{}	*FileSyntax	299
716	modfile	Span	{}	{modfile.Position}	*CommentBlock	300
717	modfile	Span	{}	{modfile.Position}	*Line	301
718	modfile	Span	{}	{modfile.Position}	*LineBlock	302
719	modfile	Span	{}	{modfile.Position}	*LParen	303
720	modfile	Span	{}	{modfile.Position}	*RParen	304
721	modfile	AddModuleStmt	{string}	{error}	*File	305
722	modfile	AddComment	{string}	{}	*File	305
723	modfile	Format	{}	{[]byte,error}	*File	305
724	modfile	Cleanup	{}	{}	*File	305
725	modfile	AddGoStmt	{string}	{error}	*File	305
726	modfile	AddRequire	{string,string}	{error}	*File	305
727	modfile	AddNewRequire	{string,string,bool}	{}	*File	305
728	modfile	SetRequire	{[]*modfile.Require}	{}	*File	305
729	modfile	DropRequire	{string}	{error}	*File	305
730	modfile	AddExclude	{string,string}	{error}	*File	305
731	modfile	DropExclude	{string,string}	{error}	*File	305
732	modfile	AddReplace	{string,string,string,string}	{error}	*File	305
733	modfile	DropReplace	{string,string}	{error}	*File	305
734	modfile	SortBlocks	{}	{}	*File	305
735	modinfo	String	{}	{string}	*ModulePublic	312
736	modload	Error	{}	{string}	*ImportMissingError	314
737	mvs	Error	{}	{string}	*MissingModuleError	317
738	par	Add	{"interface{}"}	{}	*Work	318
739	par	Do	{int,"func(interface{})"}	{}	*Work	318
740	par	Do	{"interface{}","func() interface{}"}	{"interface{}"}	*Cache	319
741	par	Get	{"interface{}"}	{"interface{}"}	*Cache	319
742	web	Error	{}	{string}	*HTTPError	323
743	web	Error	{}	{string}	*HTTPError	323
744	work	Init	{}	{}	*Builder	327
745	work	NewObjdir	{}	{string}	*Builder	327
746	work	AutoAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	327
747	work	CompileAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	327
748	work	VetAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	327
749	work	LinkAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	327
750	work	Do	{*work.Action}	{}	*Builder	327
751	work	PkgconfigCmd	{}	{string}	*Builder	327
752	work	Showcmd	{string,string,"...interface{}"}	{}	*Builder	327
753	work	Mkdir	{string}	{error}	*Builder	327
754	work	Symlink	{string,string}	{error}	*Builder	327
755	work	GccCmd	{string,string}	{[]string}	*Builder	327
756	work	GxxCmd	{string,string}	{[]string}	*Builder	327
757	work	CFlags	{*load.Package}	{[]string,error}	*Builder	327
758	work	BuildActionID	{}	{string}	*Action	328
759	work	BuildContentID	{}	{string}	*Action	328
760	work	BuildID	{}	{string}	*Action	328
761	work	BuiltTarget	{}	{string}	*Action	328
762	bio	Seek	{int64,int}	{int64}	*Reader	334
763	bio	Offset	{}	{int64}	*Reader	334
764	bio	Close	{}	{error}	*Reader	334
765	bio	File	{}	{*os.File}	*Reader	334
766	bio	Seek	{int64,int}	{int64}	*Writer	335
767	bio	Offset	{}	{int64}	*Writer	335
768	bio	Close	{}	{error}	*Writer	335
769	bio	File	{}	{*os.File}	*Writer	335
770	dwarf	UnifyRanges	{*dwarf.Scope}	{}	*Scope	338
771	dwarf	Len	{}	{int}	VarsByOffset	346
772	dwarf	Less	{int,int}	{bool}	VarsByOffset	346
773	dwarf	Swap	{int,int}	{}	VarsByOffset	346
774	edit	Insert	{int,string}	{}	*Buffer	347
775	edit	Delete	{int,int}	{}	*Buffer	347
776	edit	Replace	{int,int,string}	{}	*Buffer	347
777	edit	Bytes	{}	{[]byte}	*Buffer	347
778	edit	String	{}	{string}	*Buffer	347
779	gcprog	Init	{func(byte)}	{}	*Writer	348
780	gcprog	Debug	{io.Writer}	{}	*Writer	348
781	gcprog	BitIndex	{}	{int64}	*Writer	348
782	gcprog	End	{}	{}	*Writer	348
783	gcprog	Ptr	{int64}	{}	*Writer	348
784	gcprog	ShouldRepeat	{int64,int64}	{bool}	*Writer	348
785	gcprog	Repeat	{int64,int64}	{}	*Writer	348
786	gcprog	ZeroUntil	{int64}	{}	*Writer	348
998	sym	Grow	{int64}	{}	*Symbol	470
787	gcprog	Append	{[]byte,int64}	{}	*Writer	348
788	goobj	String	{}	{string}	SymID	350
789	goobj	String	{uint64}	{string}	*Reloc	352
790	obj	Add	{int,src.XPos,*obj.LSym}	{int}	*InlTree	362
791	obj	Parent	{int}	{int}	*InlTree	362
792	obj	InlinedFunction	{int}	{*obj.LSym}	*InlTree	362
793	obj	CallPos	{int}	{src.XPos}	*InlTree	362
794	obj	String	{}	{string}	AddrType	366
795	obj	From3Type	{}	{obj.AddrType}	*Prog	367
796	obj	GetFrom3	{}	{*obj.Addr}	*Prog	367
797	obj	SetFrom3	{obj.Addr}	{}	*Prog	367
798	obj	Line	{}	{string}	*Prog	367
799	obj	InnermostLine	{}	{string}	*Prog	367
800	obj	InnermostLineNumber	{}	{string}	*Prog	367
801	obj	InnermostLineNumberHTML	{}	{string}	*Prog	367
802	obj	InnermostFilename	{}	{string}	*Prog	367
803	obj	String	{}	{string}	*Prog	367
804	obj	InnermostString	{}	{string}	*Prog	367
805	obj	InstructionString	{}	{string}	*Prog	367
806	obj	String	{}	{string}	As	368
807	obj	Grow	{int64}	{}	*LSym	369
808	obj	GrowCap	{int64}	{}	*LSym	369
809	obj	WriteFloat32	{*obj.Link,int64,float32}	{}	*LSym	369
810	obj	WriteFloat64	{*obj.Link,int64,float64}	{}	*LSym	369
811	obj	WriteInt	{*obj.Link,int64,int,int64}	{}	*LSym	369
812	obj	WriteAddr	{*obj.Link,int64,int,*obj.LSym,int64}	{}	*LSym	369
813	obj	WriteOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	369
814	obj	WriteWeakOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	369
815	obj	WriteString	{*obj.Link,int64,int,string}	{}	*LSym	369
816	obj	WriteBytes	{*obj.Link,int64,[]byte}	{int64}	*LSym	369
817	obj	String	{}	{string}	*LSym	369
818	obj	Len	{}	{int64}	*LSym	369
819	obj	AddInlMark	{*obj.Prog,int32}	{}	*FuncInfo	370
820	obj	String	{}	{string}	ABI	372
821	obj	DuplicateOK	{}	{bool}	Attribute	373
822	obj	MakeTypelink	{}	{bool}	Attribute	373
823	obj	CFunc	{}	{bool}	Attribute	373
824	obj	NoSplit	{}	{bool}	Attribute	373
825	obj	Leaf	{}	{bool}	Attribute	373
826	obj	SeenGlobl	{}	{bool}	Attribute	373
827	obj	OnList	{}	{bool}	Attribute	373
828	obj	ReflectMethod	{}	{bool}	Attribute	373
829	obj	Local	{}	{bool}	Attribute	373
830	obj	Wrapper	{}	{bool}	Attribute	373
831	obj	NeedCtxt	{}	{bool}	Attribute	373
832	obj	NoFrame	{}	{bool}	Attribute	373
833	obj	Static	{}	{bool}	Attribute	373
834	obj	WasInlined	{}	{bool}	Attribute	373
835	obj	Set	{obj.Attribute,bool}	{}	*Attribute	373
836	obj	ABI	{}	{obj.ABI}	Attribute	373
837	obj	SetABI	{obj.ABI}	{}	*Attribute	373
838	obj	TextAttrString	{}	{string}	Attribute	373
839	obj	OutermostPos	{src.XPos}	{src.Pos}	*Link	378
840	obj	InnermostPos	{src.XPos}	{src.Pos}	*Link	378
841	obj	AddImport	{string}	{}	*Link	378
842	obj	Diag	{string,"...interface{}"}	{}	*Link	378
843	obj	Logf	{string,"...interface{}"}	{}	*Link	378
844	obj	FixedFrameSize	{}	{int64}	*Link	378
845	obj	DwarfIntConst	{string,string,string,int64}	{}	*Link	378
846	obj	DwarfAbstractFunc	{"interface{}",*obj.LSym,string}	{}	*Link	378
847	obj	InitTextSym	{*obj.LSym,int}	{}	*Link	378
848	obj	Globl	{*obj.LSym,int64,int}	{}	*Link	378
849	obj	EmitEntryLiveness	{*obj.LSym,*obj.Prog,obj.ProgAlloc}	{*obj.Prog}	*Link	378
850	obj	LookupDerived	{*obj.LSym,string}	{*obj.LSym}	*Link	378
851	obj	LookupStatic	{string}	{*obj.LSym}	*Link	378
852	obj	LookupABI	{string,obj.ABI}	{*obj.LSym}	*Link	378
853	obj	Lookup	{string}	{*obj.LSym}	*Link	378
854	obj	LookupInit	{string,func(*obj.LSym)}	{*obj.LSym}	*Link	378
855	obj	Float32Sym	{float32}	{*obj.LSym}	*Link	378
856	obj	Float64Sym	{float64}	{*obj.LSym}	*Link	378
857	obj	Int64Sym	{int64}	{*obj.LSym}	*Link	378
858	obj	NewProg	{}	{*obj.Prog}	*Link	378
859	obj	CanReuseProgs	{}	{bool}	*Link	378
860	obj	GetPrecursorFunc	{*obj.LSym}	{"interface{}"}	*DwarfFixupTable	383
861	obj	SetPrecursorFunc	{*obj.LSym,"interface{}"}	{}	*DwarfFixupTable	383
862	obj	ReferenceChildDIE	{*obj.LSym,int,*obj.LSym,int,int}	{}	*DwarfFixupTable	383
863	obj	RegisterChildDIEOffsets	{*obj.LSym,[]*dwarf.Var,[]int32}	{}	*DwarfFixupTable	383
864	obj	AbsFuncDwarfSym	{*obj.LSym}	{*obj.LSym}	*DwarfFixupTable	383
865	obj	Finalize	{string,bool}	{}	*DwarfFixupTable	383
866	x86	Put1	{byte}	{}	*AsmBuf	390
867	x86	Put2	{byte,byte}	{}	*AsmBuf	390
868	x86	Put3	{byte,byte,byte}	{}	*AsmBuf	390
869	x86	Put4	{byte,byte,byte,byte}	{}	*AsmBuf	390
870	x86	PutInt16	{int16}	{}	*AsmBuf	390
871	x86	PutInt32	{int32}	{}	*AsmBuf	390
872	x86	PutInt64	{int64}	{}	*AsmBuf	390
873	x86	Put	{[]byte}	{}	*AsmBuf	390
874	x86	PutOpBytesLit	{int,*x86.opBytes}	{}	*AsmBuf	390
875	x86	Insert	{int,byte}	{}	*AsmBuf	390
876	x86	Last	{}	{byte}	*AsmBuf	390
877	x86	Len	{}	{int}	*AsmBuf	390
878	x86	Bytes	{}	{[]byte}	*AsmBuf	390
879	x86	Reset	{}	{}	*AsmBuf	390
880	x86	At	{int}	{byte}	*AsmBuf	390
881	objabi	Set	{string}	{error}	*HeadType	392
882	objabi	String	{}	{string}	*HeadType	392
883	objabi	IsDirectJump	{}	{bool}	RelocType	393
884	objabi	String	{}	{string}	RelocType	393
885	objabi	String	{}	{string}	SymKind	394
886	objfile	Print	{io.Writer,*regexp.Regexp,uint64,uint64,bool}	{}	*Disasm	395
887	objfile	Decode	{uint64,uint64,[]objfile.Reloc,"func(uint64, string, int, string)"}	{}	*Disasm	395
888	objfile	Line	{string,int}	{[]byte,error}	*FileCache	397
889	objfile	Close	{}	{error}	*File	399
890	objfile	Entries	{}	{[]*objfile.Entry}	*File	399
891	objfile	Symbols	{}	{[]objfile.Sym,error}	*File	399
892	objfile	PCLineTable	{}	{objfile.Liner,error}	*File	399
893	objfile	Text	{}	{uint64,[]byte,error}	*File	399
894	objfile	GOARCH	{}	{string}	*File	399
895	objfile	LoadAddress	{}	{uint64,error}	*File	399
896	objfile	DWARF	{}	{*dwarf.Data,error}	*File	399
897	objfile	Disasm	{}	{*objfile.Disasm,error}	*File	399
898	objfile	Disasm	{}	{*objfile.Disasm,error}	*Entry	400
899	objfile	Name	{}	{string}	*Entry	400
900	objfile	Symbols	{}	{[]objfile.Sym,error}	*Entry	400
901	objfile	PCLineTable	{}	{objfile.Liner,error}	*Entry	400
902	objfile	Text	{}	{uint64,[]byte,error}	*Entry	400
903	objfile	GOARCH	{}	{string}	*Entry	400
904	objfile	LoadAddress	{}	{uint64,error}	*Entry	400
905	objfile	DWARF	{}	{*dwarf.Data,error}	*Entry	400
906	src	IsKnown	{}	{bool}	Pos	404
907	src	Before	{src.Pos}	{bool}	Pos	404
908	src	After	{src.Pos}	{bool}	Pos	404
909	src	LineNumber	{}	{string}	Pos	404
910	src	LineNumberHTML	{}	{string}	Pos	404
911	src	Filename	{}	{string}	Pos	404
912	src	Base	{}	{*src.PosBase}	Pos	404
913	src	SetBase	{*src.PosBase}	{}	*Pos	404
914	src	RelFilename	{}	{string}	Pos	404
915	src	RelLine	{}	{uint}	Pos	404
916	src	RelCol	{}	{uint}	Pos	404
917	src	AbsFilename	{}	{string}	Pos	404
918	src	SymFilename	{}	{string}	Pos	404
919	src	String	{}	{string}	Pos	404
920	src	Format	{bool,bool}	{string}	Pos	404
921	src	Pos	{}	{*src.Pos}	*PosBase	405
922	src	Filename	{}	{string}	*PosBase	405
923	src	AbsFilename	{}	{string}	*PosBase	405
924	src	SymFilename	{}	{string}	*PosBase	405
925	src	Line	{}	{uint}	*PosBase	405
926	src	Col	{}	{uint}	*PosBase	405
927	src	InliningIndex	{}	{int}	*PosBase	405
928	src	IsKnown	{}	{bool}	XPos	407
929	src	Before	{src.XPos}	{bool}	XPos	407
930	src	SameFile	{src.XPos}	{bool}	XPos	407
931	src	After	{src.XPos}	{bool}	XPos	407
932	src	WithNotStmt	{}	{src.XPos}	XPos	407
933	src	WithDefaultStmt	{}	{src.XPos}	XPos	407
934	src	WithIsStmt	{}	{src.XPos}	XPos	407
935	src	WithXlogue	{src.PosXlogue}	{src.XPos}	XPos	407
936	src	LineNumber	{}	{string}	XPos	407
937	src	LineNumberHTML	{}	{string}	XPos	407
938	src	XPos	{src.Pos}	{src.XPos}	*PosTable	408
939	src	Pos	{src.XPos}	{src.Pos}	*PosTable	408
940	sys	InFamily	{...sys.ArchFamily}	{bool}	*Arch	410
941	ld	Set	{string}	{error}	*BuildMode	413
942	ld	String	{}	{string}	*BuildMode	413
943	ld	Set	{string}	{error}	*LinkMode	414
944	ld	String	{}	{string}	*LinkMode	414
945	ld	Init	{*ld.Link,string}	{}	*GCProg	415
946	ld	End	{int64}	{}	*GCProg	415
947	ld	AddSym	{*sym.Symbol}	{}	*GCProg	415
948	ld	AddTramp	{*sym.Symbol}	{}	*Link	427
949	ld	DynlinkingGo	{}	{bool}	*Link	427
950	ld	CanUsePlugins	{}	{bool}	*Link	427
951	ld	UseRelro	{}	{bool}	*Link	427
952	ld	ErrorUnresolved	{*sym.Symbol,*sym.Reloc}	{}	*Link	427
953	ld	FixedFrameSize	{}	{int64}	*Link	427
954	ld	Logf	{string,"...interface{}"}	{}	*Link	427
955	ld	Set	{string}	{error}	*Rpath	433
956	ld	String	{}	{string}	*Rpath	433
957	ld	SeekSet	{int64}	{}	*OutBuf	434
958	ld	Offset	{}	{int64}	*OutBuf	434
959	ld	Write	{[]byte}	{int,error}	*OutBuf	434
960	ld	Write8	{uint8}	{}	*OutBuf	434
961	ld	WriteByte	{byte}	{error}	*OutBuf	434
962	ld	Write16	{uint16}	{}	*OutBuf	434
963	ld	Write32	{uint32}	{}	*OutBuf	434
964	ld	Write32b	{uint32}	{}	*OutBuf	434
965	ld	Write64	{uint64}	{}	*OutBuf	434
966	ld	Write64b	{uint64}	{}	*OutBuf	434
967	ld	WriteString	{string}	{}	*OutBuf	434
968	ld	WriteStringN	{string,int}	{}	*OutBuf	434
969	ld	WriteStringPad	{string,int,[]byte}	{}	*OutBuf	434
970	ld	Flush	{}	{}	*OutBuf	434
971	sym	DuplicateOK	{}	{bool}	Attribute	463
972	sym	External	{}	{bool}	Attribute	463
973	sym	NoSplit	{}	{bool}	Attribute	463
974	sym	Reachable	{}	{bool}	Attribute	463
975	sym	CgoExportDynamic	{}	{bool}	Attribute	463
976	sym	CgoExportStatic	{}	{bool}	Attribute	463
977	sym	Special	{}	{bool}	Attribute	463
978	sym	StackCheck	{}	{bool}	Attribute	463
979	sym	NotInSymbolTable	{}	{bool}	Attribute	463
980	sym	OnList	{}	{bool}	Attribute	463
981	sym	Local	{}	{bool}	Attribute	463
982	sym	ReflectMethod	{}	{bool}	Attribute	463
983	sym	MakeTypelink	{}	{bool}	Attribute	463
984	sym	Shared	{}	{bool}	Attribute	463
985	sym	VisibilityHidden	{}	{bool}	Attribute	463
986	sym	SubSymbol	{}	{bool}	Attribute	463
987	sym	Container	{}	{bool}	Attribute	463
988	sym	CgoExport	{}	{bool}	Attribute	463
989	sym	Set	{sym.Attribute,bool}	{}	*Attribute	463
990	sym	String	{}	{string}	Library	464
991	sym	Len	{}	{int}	RelocByOff	467
992	sym	Swap	{int,int}	{}	RelocByOff	467
993	sym	Less	{int,int}	{bool}	RelocByOff	467
994	sym	String	{}	{string}	*Symbol	470
995	sym	IsFileLocal	{}	{bool}	*Symbol	470
996	sym	ElfsymForReloc	{}	{int32}	*Symbol	470
997	sym	Len	{}	{int64}	*Symbol	470
999	sym	AddBytes	{[]byte}	{int64}	*Symbol	470
1000	sym	AddUint8	{uint8}	{int64}	*Symbol	470
1001	sym	AddUint16	{*sys.Arch,uint16}	{int64}	*Symbol	470
1002	sym	AddUint32	{*sys.Arch,uint32}	{int64}	*Symbol	470
1003	sym	AddUint64	{*sys.Arch,uint64}	{int64}	*Symbol	470
1004	sym	AddUint	{*sys.Arch,uint64}	{int64}	*Symbol	470
1005	sym	SetUint8	{*sys.Arch,int64,uint8}	{int64}	*Symbol	470
1006	sym	SetUint16	{*sys.Arch,int64,uint16}	{int64}	*Symbol	470
1007	sym	SetUint32	{*sys.Arch,int64,uint32}	{int64}	*Symbol	470
1008	sym	SetUint	{*sys.Arch,int64,uint64}	{int64}	*Symbol	470
1009	sym	AddAddrPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	470
1010	sym	AddPCRelPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	470
1011	sym	AddAddr	{*sys.Arch,*sym.Symbol}	{int64}	*Symbol	470
1012	sym	SetAddrPlus	{*sys.Arch,int64,*sym.Symbol,int64}	{int64}	*Symbol	470
1013	sym	SetAddr	{*sys.Arch,int64,*sym.Symbol}	{int64}	*Symbol	470
1014	sym	AddSize	{*sys.Arch,*sym.Symbol}	{int64}	*Symbol	470
1015	sym	AddAddrPlus4	{*sym.Symbol,int64}	{int64}	*Symbol	470
1016	sym	AddRel	{}	{*sym.Reloc}	*Symbol	470
1017	sym	AddUintXX	{*sys.Arch,uint64,int}	{int64}	*Symbol	470
1018	sym	Extname	{}	{string}	*Symbol	470
1019	sym	SetExtname	{string}	{}	*Symbol	470
1020	sym	Dynimplib	{}	{string}	*Symbol	470
1021	sym	Dynimpvers	{}	{string}	*Symbol	470
1022	sym	SetDynimplib	{string}	{}	*Symbol	470
1023	sym	SetDynimpvers	{string}	{}	*Symbol	470
1024	sym	ResetDyninfo	{}	{}	*Symbol	470
1025	sym	Localentry	{}	{uint8}	*Symbol	470
1026	sym	SetLocalentry	{uint8}	{}	*Symbol	470
1027	sym	Plt	{}	{int32}	*Symbol	470
1028	sym	SetPlt	{int32}	{}	*Symbol	470
1029	sym	Got	{}	{int32}	*Symbol	470
1030	sym	SetGot	{int32}	{}	*Symbol	470
1031	sym	ElfType	{}	{elf.SymType}	*Symbol	470
1032	sym	SetElfType	{elf.SymType}	{}	*Symbol	470
1033	sym	Newsym	{string,int}	{*sym.Symbol}	*Symbols	476
1034	sym	Lookup	{string,int}	{*sym.Symbol}	*Symbols	476
1035	sym	ROLookup	{string,int}	{*sym.Symbol}	*Symbols	476
1036	sym	IncVersion	{}	{int}	*Symbols	476
1037	sym	Rename	{string,string,int,map[*sym.Symbol]*sym.Symbol}	{}	*Symbols	476
1038	sym	String	{}	{string}	SymKind	477
1039	main	String	{}	{string}	*Entry	479
1040	main	URL	{}	{string}	Range	482
1041	binutils	String	{}	{string}	*Binutils	505
1042	binutils	SetFastSymbolization	{bool}	{}	*Binutils	505
1043	binutils	SetTools	{string}	{}	*Binutils	505
1044	binutils	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}	*Binutils	505
1045	binutils	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}	*Binutils	505
1046	driver	Bool	{string,bool,string}	{*bool}	*GoFlags	507
1047	driver	Int	{string,int,string}	{*int}	*GoFlags	507
1048	driver	Float64	{string,float64,string}	{*float64}	*GoFlags	507
1049	driver	String	{string,string,string}	{*string}	*GoFlags	507
1050	driver	BoolVar	{*bool,string,bool,string}	{}	*GoFlags	507
1051	driver	IntVar	{*int,string,int,string}	{}	*GoFlags	507
1052	driver	Float64Var	{*float64,string,float64,string}	{}	*GoFlags	507
1053	driver	StringVar	{*string,string,string,string}	{}	*GoFlags	507
1054	driver	StringList	{string,string,string}	{*[]*string}	*GoFlags	507
1055	driver	ExtraUsage	{}	{string}	*GoFlags	507
1056	driver	AddExtraUsage	{string}	{}	*GoFlags	507
1057	driver	Parse	{func()}	{[]string}	*GoFlags	507
1058	graph	TrimTree	{graph.NodePtrSet}	{}	*Graph	511
1059	graph	String	{}	{string}	*Graph	511
1060	graph	DiscardLowFrequencyNodes	{int64}	{graph.NodeSet}	*Graph	511
1061	graph	DiscardLowFrequencyNodePtrs	{int64}	{graph.NodePtrSet}	*Graph	511
1062	graph	TrimLowFrequencyTags	{int64}	{}	*Graph	511
1063	graph	TrimLowFrequencyEdges	{int64}	{int}	*Graph	511
1064	graph	SortNodes	{bool,bool}	{}	*Graph	511
1065	graph	SelectTopNodePtrs	{int,bool}	{graph.NodePtrSet}	*Graph	511
1066	graph	SelectTopNodes	{int,bool}	{graph.NodeSet}	*Graph	511
1067	graph	RemoveRedundantEdges	{}	{}	*Graph	511
1068	graph	Sum	{}	{int64,int64}	Nodes	513
1069	graph	Sort	{graph.NodeOrder}	{error}	Nodes	513
1070	graph	FlatValue	{}	{int64}	*Node	514
1071	graph	CumValue	{}	{int64}	*Node	514
1072	graph	AddToEdge	{*graph.Node,int64,bool,bool}	{}	*Node	514
1073	graph	AddToEdgeDiv	{*graph.Node,int64,int64,bool,bool}	{}	*Node	514
1074	graph	PrintableName	{}	{string}	*NodeInfo	515
1075	graph	NameComponents	{}	{[]string}	*NodeInfo	515
1076	graph	FindOrInsertNode	{graph.NodeInfo,graph.NodeSet}	{*graph.Node}	NodeMap	516
1077	graph	Sort	{}	{[]*graph.Edge}	EdgeMap	519
1078	graph	Sum	{}	{int64}	EdgeMap	519
1079	graph	WeightValue	{}	{int64}	*Edge	520
1080	graph	FlatValue	{}	{int64}	*Tag	521
1081	graph	CumValue	{}	{int64}	*Tag	521
1082	proftest	ReadLine	{string}	{string,error}	*TestUI	537
1083	proftest	Print	{"...interface{}"}	{}	*TestUI	537
1084	proftest	PrintErr	{"...interface{}"}	{}	*TestUI	537
1085	proftest	IsTerminal	{}	{bool}	*TestUI	537
1086	proftest	WantBrowser	{}	{bool}	*TestUI	537
1087	proftest	SetAutoComplete	{"func(string) string"}	{}	*TestUI	537
1088	report	Total	{}	{int64}	*Report	540
1089	symbolizer	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}	*Symbolizer	541
1090	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	543
1091	profile	ShowFrom	{*regexp.Regexp}	{bool}	*Profile	543
1092	profile	FilterTagsByName	{*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	543
1093	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	543
1094	profile	SampleIndexByName	{string}	{int,error}	*Profile	543
1095	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	543
1096	profile	ParseMemoryMapFromScanner	{*bufio.Scanner}	{error}	*Profile	543
1097	profile	Compact	{}	{*profile.Profile}	*Profile	543
1098	profile	Normalize	{*profile.Profile}	{error}	*Profile	543
1099	profile	Write	{io.Writer}	{error}	*Profile	543
1100	profile	WriteUncompressed	{io.Writer}	{error}	*Profile	543
1101	profile	CheckValid	{}	{error}	*Profile	543
1102	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	543
1103	profile	NumLabelUnits	{}	{map[string]string,map[string][]string}	*Profile	543
1104	profile	String	{}	{string}	*Profile	543
1105	profile	SetLabel	{string,[]string}	{}	*Profile	543
1106	profile	RemoveLabel	{string}	{}	*Profile	543
1107	profile	Scale	{float64}	{}	*Profile	543
1108	profile	ScaleN	{[]float64}	{error}	*Profile	543
1109	profile	HasFunctions	{}	{bool}	*Profile	543
1110	profile	HasFileLines	{}	{bool}	*Profile	543
1111	profile	Copy	{}	{*profile.Profile}	*Profile	543
1112	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	543
1113	profile	RemoveUninteresting	{}	{error}	*Profile	543
1114	profile	PruneFrom	{*regexp.Regexp}	{}	*Profile	543
1115	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	543
1116	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	543
1117	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	543
1118	profile	Write	{io.Writer}	{error}	*Profile	543
1119	profile	CheckValid	{}	{error}	*Profile	543
1120	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	543
1121	profile	String	{}	{string}	*Profile	543
1301	armasm	IsArg	{}	{}	Mem	618
1122	profile	Merge	{*profile.Profile,float64}	{error}	*Profile	543
1123	profile	Compatible	{*profile.Profile}	{error}	*Profile	543
1124	profile	HasFunctions	{}	{bool}	*Profile	543
1125	profile	HasFileLines	{}	{bool}	*Profile	543
1126	profile	Copy	{}	{*profile.Profile}	*Profile	543
1127	profile	Demangle	{profile.Demangler}	{error}	*Profile	543
1128	profile	Empty	{}	{bool}	*Profile	543
1129	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	543
1130	profile	RemoveUninteresting	{}	{error}	*Profile	543
1131	profile	HasLabel	{string,string}	{bool}	*Sample	545
1132	profile	DiffBaseSample	{}	{bool}	*Sample	545
1133	profile	Unsymbolizable	{}	{bool}	*Mapping	546
1134	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Name	551
1135	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Name	551
1136	demangle	GoString	{}	{string}	*Name	551
1137	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Typed	552
1138	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Typed	552
1139	demangle	GoString	{}	{string}	*Typed	552
1140	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Qualified	553
1141	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Qualified	553
1142	demangle	GoString	{}	{string}	*Qualified	553
1143	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Template	554
1144	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Template	554
1145	demangle	GoString	{}	{string}	*Template	554
1146	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TemplateParam	555
1147	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TemplateParam	555
1148	demangle	GoString	{}	{string}	*TemplateParam	555
1149	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TypeWithQualifiers	557
1150	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TypeWithQualifiers	557
1151	demangle	GoString	{}	{string}	*TypeWithQualifiers	557
1152	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*MethodWithQualifiers	558
1153	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*MethodWithQualifiers	558
1154	demangle	GoString	{}	{string}	*MethodWithQualifiers	558
1155	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*BuiltinType	559
1156	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*BuiltinType	559
1157	demangle	GoString	{}	{string}	*BuiltinType	559
1158	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PointerType	560
1159	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PointerType	560
1160	demangle	GoString	{}	{string}	*PointerType	560
1161	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ReferenceType	561
1162	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ReferenceType	561
1163	demangle	GoString	{}	{string}	*ReferenceType	561
1164	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*RvalueReferenceType	562
1165	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*RvalueReferenceType	562
1166	demangle	GoString	{}	{string}	*RvalueReferenceType	562
1167	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ComplexType	563
1168	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ComplexType	563
1169	demangle	GoString	{}	{string}	*ComplexType	563
1170	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ImaginaryType	564
1171	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ImaginaryType	564
1172	demangle	GoString	{}	{string}	*ImaginaryType	564
1173	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VendorQualifier	565
1174	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VendorQualifier	565
1175	demangle	GoString	{}	{string}	*VendorQualifier	565
1176	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArrayType	566
1177	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArrayType	566
1178	demangle	GoString	{}	{string}	*ArrayType	566
1179	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionType	567
1180	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionType	567
1181	demangle	GoString	{}	{string}	*FunctionType	567
1182	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionParam	568
1183	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionParam	568
1184	demangle	GoString	{}	{string}	*FunctionParam	568
1185	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PtrMem	569
1186	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PtrMem	569
1187	demangle	GoString	{}	{string}	*PtrMem	569
1188	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FixedType	570
1189	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FixedType	570
1190	demangle	GoString	{}	{string}	*FixedType	570
1191	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VectorType	571
1192	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VectorType	571
1193	demangle	GoString	{}	{string}	*VectorType	571
1194	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Decltype	572
1195	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Decltype	572
1196	demangle	GoString	{}	{string}	*Decltype	572
1197	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Operator	573
1198	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Operator	573
1199	demangle	GoString	{}	{string}	*Operator	573
1200	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Constructor	574
1201	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Constructor	574
1202	demangle	GoString	{}	{string}	*Constructor	574
1203	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Destructor	575
1204	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Destructor	575
1205	demangle	GoString	{}	{string}	*Destructor	575
1206	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*GlobalCDtor	576
1207	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*GlobalCDtor	576
1208	demangle	GoString	{}	{string}	*GlobalCDtor	576
1209	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TaggedName	577
1210	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TaggedName	577
1211	demangle	GoString	{}	{string}	*TaggedName	577
1212	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PackExpansion	578
1213	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PackExpansion	578
1214	demangle	GoString	{}	{string}	*PackExpansion	578
1215	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArgumentPack	579
1216	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArgumentPack	579
1217	demangle	GoString	{}	{string}	*ArgumentPack	579
1218	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofPack	580
1219	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofPack	580
1220	demangle	GoString	{}	{string}	*SizeofPack	580
1221	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofArgs	581
1222	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofArgs	581
1223	demangle	GoString	{}	{string}	*SizeofArgs	581
1224	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Cast	582
1225	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Cast	582
1226	demangle	GoString	{}	{string}	*Cast	582
1227	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Nullary	583
1228	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Nullary	583
1229	demangle	GoString	{}	{string}	*Nullary	583
1230	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Unary	584
1231	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Unary	584
1232	demangle	GoString	{}	{string}	*Unary	584
1233	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Binary	585
1234	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Binary	585
1235	demangle	GoString	{}	{string}	*Binary	585
1236	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Trinary	586
1237	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Trinary	586
1238	demangle	GoString	{}	{string}	*Trinary	586
1239	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Fold	587
1240	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Fold	587
1241	demangle	GoString	{}	{string}	*Fold	587
1242	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*New	588
1243	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*New	588
1244	demangle	GoString	{}	{string}	*New	588
1245	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Literal	589
1246	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Literal	589
1247	demangle	GoString	{}	{string}	*Literal	589
1248	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ExprList	590
1249	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ExprList	590
1250	demangle	GoString	{}	{string}	*ExprList	590
1251	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*InitializerList	591
1252	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*InitializerList	591
1253	demangle	GoString	{}	{string}	*InitializerList	591
1254	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*DefaultArg	592
1255	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*DefaultArg	592
1256	demangle	GoString	{}	{string}	*DefaultArg	592
1257	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Closure	593
1258	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Closure	593
1259	demangle	GoString	{}	{string}	*Closure	593
1260	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*UnnamedType	594
1261	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*UnnamedType	594
1262	demangle	GoString	{}	{string}	*UnnamedType	594
1263	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Clone	595
1264	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Clone	595
1265	demangle	GoString	{}	{string}	*Clone	595
1266	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special	596
1267	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special	596
1268	demangle	GoString	{}	{string}	*Special	596
1269	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special2	597
1270	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special2	597
1271	demangle	GoString	{}	{string}	*Special2	597
1272	armasm	String	{}	{string}	Mode	599
1273	armasm	String	{}	{string}	Op	600
1274	armasm	String	{}	{string}	Inst	601
1275	armasm	IsArg	{}	{}	Float32Imm	604
1276	armasm	String	{}	{string}	Float32Imm	604
1277	armasm	IsArg	{}	{}	Float64Imm	605
1278	armasm	String	{}	{string}	Float64Imm	605
1279	armasm	IsArg	{}	{}	Imm	606
1280	armasm	String	{}	{string}	Imm	606
1281	armasm	IsArg	{}	{}	ImmAlt	607
1282	armasm	Imm	{}	{armasm.Imm}	ImmAlt	607
1283	armasm	String	{}	{string}	ImmAlt	607
1284	armasm	IsArg	{}	{}	Label	608
1285	armasm	String	{}	{string}	Label	608
1286	armasm	IsArg	{}	{}	Reg	609
1287	armasm	String	{}	{string}	Reg	609
1288	armasm	IsArg	{}	{}	RegX	610
1289	armasm	String	{}	{string}	RegX	610
1290	armasm	IsArg	{}	{}	RegList	611
1291	armasm	String	{}	{string}	RegList	611
1292	armasm	IsArg	{}	{}	Endian	612
1293	armasm	String	{}	{string}	Endian	612
1294	armasm	String	{}	{string}	Shift	613
1295	armasm	IsArg	{}	{}	RegShift	614
1296	armasm	String	{}	{string}	RegShift	614
1297	armasm	IsArg	{}	{}	RegShiftReg	615
1298	armasm	String	{}	{string}	RegShiftReg	615
1299	armasm	IsArg	{}	{}	PCRel	616
1300	armasm	String	{}	{string}	PCRel	616
1302	armasm	String	{}	{string}	Mem	618
1303	arm64asm	String	{}	{string}	Op	620
1304	arm64asm	String	{}	{string}	Inst	621
1305	arm64asm	String	{}	{string}	Reg	624
1306	arm64asm	String	{}	{string}	RegSP	625
1307	arm64asm	String	{}	{string}	ImmShift	626
1308	arm64asm	String	{}	{string}	ExtShift	627
1309	arm64asm	String	{}	{string}	RegExtshiftAmount	628
1310	arm64asm	String	{}	{string}	PCRel	629
1311	arm64asm	String	{}	{string}	MemImmediate	631
1312	arm64asm	String	{}	{string}	MemExtend	632
1313	arm64asm	String	{}	{string}	Imm	633
1314	arm64asm	String	{}	{string}	Imm64	634
1315	arm64asm	String	{}	{string}	Imm_hint	635
1316	arm64asm	String	{}	{string}	Imm_clrex	636
1317	arm64asm	String	{}	{string}	Imm_dcps	637
1318	arm64asm	String	{}	{string}	Cond	638
1319	arm64asm	String	{}	{string}	Imm_c	639
1320	arm64asm	String	{}	{string}	Imm_option	640
1321	arm64asm	String	{}	{string}	Imm_prfop	641
1322	arm64asm	String	{}	{string}	Pstatefield	642
1323	arm64asm	String	{}	{string}	Systemreg	643
1324	arm64asm	String	{}	{string}	Imm_fp	644
1325	arm64asm	String	{}	{string}	Arrangement	645
1326	arm64asm	String	{}	{string}	RegisterWithArrangement	646
1327	arm64asm	String	{}	{string}	RegisterWithArrangementAndIndex	647
1328	ppc64asm	String	{}	{string}	ArgType	648
1329	ppc64asm	GoString	{}	{string}	ArgType	648
1330	ppc64asm	String	{}	{string}	BitField	649
1331	ppc64asm	Parse	{uint32}	{uint32}	BitField	649
1332	ppc64asm	ParseSigned	{uint32}	{int32}	BitField	649
1333	ppc64asm	String	{}	{string}	BitFields	650
1334	ppc64asm	Append	{ppc64asm.BitField}	{}	*BitFields	650
1335	ppc64asm	Parse	{uint32}	{uint32}	BitFields	650
1336	ppc64asm	ParseSigned	{uint32}	{int32}	BitFields	650
1337	ppc64asm	String	{}	{string}	Inst	651
1338	ppc64asm	String	{}	{string}	Op	652
1339	ppc64asm	IsArg	{}	{}	Reg	655
1340	ppc64asm	String	{}	{string}	Reg	655
1341	ppc64asm	IsArg	{}	{}	CondReg	656
1342	ppc64asm	String	{}	{string}	CondReg	656
1343	ppc64asm	IsArg	{}	{}	SpReg	657
1344	ppc64asm	String	{}	{string}	SpReg	657
1345	ppc64asm	IsArg	{}	{}	PCRel	658
1346	ppc64asm	String	{}	{string}	PCRel	658
1347	ppc64asm	IsArg	{}	{}	Label	659
1348	ppc64asm	String	{}	{string}	Label	659
1349	ppc64asm	IsArg	{}	{}	Imm	660
1350	ppc64asm	String	{}	{string}	Imm	660
1351	ppc64asm	IsArg	{}	{}	Offset	661
1352	ppc64asm	String	{}	{string}	Offset	661
1353	x86asm	String	{}	{string}	Inst	662
1354	x86asm	IsREX	{}	{bool}	Prefix	664
1355	x86asm	IsVEX	{}	{bool}	Prefix	664
1356	x86asm	String	{}	{string}	Prefix	664
1357	x86asm	String	{}	{string}	Op	665
1358	x86asm	String	{}	{string}	Reg	668
1359	x86asm	String	{}	{string}	Mem	669
1360	x86asm	String	{}	{string}	Rel	670
1361	x86asm	String	{}	{string}	Imm	671
1362	terminal	Write	{[]byte}	{int,error}	*Terminal	674
1363	terminal	ReadPassword	{string}	{string,error}	*Terminal	674
1364	terminal	ReadLine	{}	{string,error}	*Terminal	674
1365	terminal	SetPrompt	{string}	{}	*Terminal	674
1366	terminal	SetSize	{int,int}	{error}	*Terminal	674
1367	terminal	SetBracketedPasteMode	{bool}	{}	*Terminal	674
1368	unix	Zero	{}	{}	*CPUSet	679
1369	unix	Set	{int}	{}	*CPUSet	679
1370	unix	Clear	{int}	{}	*CPUSet	679
1371	unix	IsSet	{int}	{bool}	*CPUSet	679
1372	unix	Count	{}	{int}	*CPUSet	679
1373	unix	Stopped	{}	{bool}	WaitStatus	684
1374	unix	StopSignal	{}	{unix.Signal}	WaitStatus	684
1375	unix	Exited	{}	{bool}	WaitStatus	684
1376	unix	ExitStatus	{}	{int}	WaitStatus	684
1377	unix	Signaled	{}	{bool}	WaitStatus	684
1378	unix	Signal	{}	{unix.Signal}	WaitStatus	684
1379	unix	Continued	{}	{bool}	WaitStatus	684
1380	unix	CoreDump	{}	{bool}	WaitStatus	684
1381	unix	TrapCause	{}	{int}	WaitStatus	684
1382	unix	Exited	{}	{bool}	WaitStatus	684
1383	unix	ExitStatus	{}	{int}	WaitStatus	684
1384	unix	Signaled	{}	{bool}	WaitStatus	684
1385	unix	Signal	{}	{syscall.Signal}	WaitStatus	684
1386	unix	CoreDump	{}	{bool}	WaitStatus	684
1387	unix	Stopped	{}	{bool}	WaitStatus	684
1388	unix	Continued	{}	{bool}	WaitStatus	684
1389	unix	StopSignal	{}	{syscall.Signal}	WaitStatus	684
1390	unix	TrapCause	{}	{int}	WaitStatus	684
1391	unix	Exited	{}	{bool}	WaitStatus	684
1392	unix	Signaled	{}	{bool}	WaitStatus	684
1393	unix	Stopped	{}	{bool}	WaitStatus	684
1394	unix	Continued	{}	{bool}	WaitStatus	684
1395	unix	CoreDump	{}	{bool}	WaitStatus	684
1396	unix	ExitStatus	{}	{int}	WaitStatus	684
1397	unix	Signal	{}	{syscall.Signal}	WaitStatus	684
1398	unix	StopSignal	{}	{syscall.Signal}	WaitStatus	684
1399	unix	TrapCause	{}	{int}	WaitStatus	684
1400	unix	Exited	{}	{bool}	WaitStatus	684
1401	unix	ExitStatus	{}	{int}	WaitStatus	684
1402	unix	Signaled	{}	{bool}	WaitStatus	684
1403	unix	Signal	{}	{syscall.Signal}	WaitStatus	684
1404	unix	CoreDump	{}	{bool}	WaitStatus	684
1405	unix	Stopped	{}	{bool}	WaitStatus	684
1406	unix	Continued	{}	{bool}	WaitStatus	684
1407	unix	StopSignal	{}	{syscall.Signal}	WaitStatus	684
1408	unix	TrapCause	{}	{int}	WaitStatus	684
1409	unix	Unix	{}	{int64,int64}	*Timespec	717
1410	unix	Nano	{}	{int64}	*Timespec	717
1411	unix	Unix	{}	{int64,int64}	*Timeval	719
1412	unix	Nano	{}	{int64}	*Timeval	719
1413	unix	SetLen	{int}	{}	*Cmsghdr	738
1414	unix	SetLen	{int}	{}	*Cmsghdr	738
1415	unix	SetLen	{int}	{}	*Cmsghdr	738
1416	unix	SetLen	{int}	{}	*Cmsghdr	738
1417	unix	SetLen	{int}	{}	*Cmsghdr	738
1418	unix	SetLen	{int}	{}	*Cmsghdr	738
1419	unix	SetLen	{int}	{}	*Cmsghdr	738
1420	unix	SetLen	{int}	{}	*Cmsghdr	738
1421	unix	SetLen	{int}	{}	*Cmsghdr	738
1422	unix	SetLen	{int}	{}	*Cmsghdr	738
1423	unix	SetLen	{int}	{}	*Cmsghdr	738
1424	unix	SetLen	{int}	{}	*Cmsghdr	738
1425	unix	SetLen	{int}	{}	*Cmsghdr	738
1426	unix	SetLen	{int}	{}	*Cmsghdr	738
1427	unix	SetLen	{int}	{}	*Cmsghdr	738
1428	unix	SetLen	{int}	{}	*Cmsghdr	738
1429	unix	SetLen	{int}	{}	*Cmsghdr	738
1430	unix	SetLen	{int}	{}	*Cmsghdr	738
1431	unix	SetLen	{int}	{}	*Cmsghdr	738
1432	unix	SetLen	{int}	{}	*Cmsghdr	738
1433	unix	SetLen	{int}	{}	*Cmsghdr	738
1434	unix	SetLen	{int}	{}	*Cmsghdr	738
1435	unix	SetLen	{int}	{}	*Cmsghdr	738
1436	unix	SetLen	{int}	{}	*Cmsghdr	738
1437	unix	SetLen	{int}	{}	*Cmsghdr	738
1438	unix	SetLen	{int}	{}	*Cmsghdr	738
1439	unix	SetLen	{int}	{}	*Cmsghdr	738
1440	unix	SetLen	{int}	{}	*Cmsghdr	738
1441	unix	SetLen	{int}	{}	*Iovec	740
1442	unix	SetLen	{int}	{}	*Iovec	740
1443	unix	SetLen	{int}	{}	*Iovec	740
1444	unix	SetLen	{int}	{}	*Iovec	740
1445	unix	SetLen	{int}	{}	*Iovec	740
1446	unix	SetLen	{int}	{}	*Iovec	740
1447	unix	SetLen	{int}	{}	*Iovec	740
1448	unix	SetLen	{int}	{}	*Iovec	740
1449	unix	SetLen	{int}	{}	*Iovec	740
1450	unix	SetLen	{int}	{}	*Iovec	740
1451	unix	SetLen	{int}	{}	*Iovec	740
1452	unix	SetLen	{int}	{}	*Iovec	740
1453	unix	SetLen	{int}	{}	*Iovec	740
1454	unix	SetLen	{int}	{}	*Iovec	740
1455	unix	SetLen	{int}	{}	*Iovec	740
1456	unix	SetLen	{int}	{}	*Iovec	740
1457	unix	SetLen	{int}	{}	*Iovec	740
1458	unix	SetLen	{int}	{}	*Iovec	740
1459	unix	SetLen	{int}	{}	*Iovec	740
1460	unix	SetLen	{int}	{}	*Iovec	740
1461	unix	SetLen	{int}	{}	*Iovec	740
1462	unix	SetLen	{int}	{}	*Iovec	740
1463	unix	SetLen	{int}	{}	*Iovec	740
1464	unix	SetLen	{int}	{}	*Iovec	740
1465	unix	SetLen	{int}	{}	*Iovec	740
1466	unix	SetLen	{int}	{}	*Iovec	740
1467	unix	SetLen	{int}	{}	*Iovec	740
1468	unix	SetLen	{int}	{}	*Iovec	740
1469	unix	SetControllen	{int}	{}	*Msghdr	745
1470	unix	SetControllen	{int}	{}	*Msghdr	745
1471	unix	SetControllen	{int}	{}	*Msghdr	745
1472	unix	SetControllen	{int}	{}	*Msghdr	745
1473	unix	SetControllen	{int}	{}	*Msghdr	745
1474	unix	SetControllen	{int}	{}	*Msghdr	745
1475	unix	SetControllen	{int}	{}	*Msghdr	745
1476	unix	SetControllen	{int}	{}	*Msghdr	745
1477	unix	SetControllen	{int}	{}	*Msghdr	745
1478	unix	SetControllen	{int}	{}	*Msghdr	745
1479	unix	SetControllen	{int}	{}	*Msghdr	745
1480	unix	SetControllen	{int}	{}	*Msghdr	745
1481	unix	SetControllen	{int}	{}	*Msghdr	745
1482	unix	SetControllen	{int}	{}	*Msghdr	745
1483	unix	SetControllen	{int}	{}	*Msghdr	745
1484	unix	SetControllen	{int}	{}	*Msghdr	745
1485	unix	SetControllen	{int}	{}	*Msghdr	745
1486	unix	SetControllen	{int}	{}	*Msghdr	745
1487	unix	SetControllen	{int}	{}	*Msghdr	745
1488	unix	SetControllen	{int}	{}	*Msghdr	745
1489	unix	SetControllen	{int}	{}	*Msghdr	745
1490	unix	SetControllen	{int}	{}	*Msghdr	745
1491	unix	SetControllen	{int}	{}	*Msghdr	745
1492	unix	SetControllen	{int}	{}	*Msghdr	745
1493	unix	SetControllen	{int}	{}	*Msghdr	745
1494	unix	SetControllen	{int}	{}	*Msghdr	745
1495	unix	SetControllen	{int}	{}	*Msghdr	745
1496	unix	PC	{}	{uint64}	*PtraceRegs	1278
1497	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1498	unix	PC	{}	{uint64}	*PtraceRegs	1278
1499	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1500	unix	PC	{}	{uint64}	*PtraceRegs	1278
1501	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1502	unix	PC	{}	{uint64}	*PtraceRegs	1278
1503	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1504	unix	PC	{}	{uint64}	*PtraceRegs	1278
1505	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1506	unix	PC	{}	{uint64}	*PtraceRegs	1278
1507	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1508	unix	PC	{}	{uint64}	*PtraceRegs	1278
1509	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1510	unix	PC	{}	{uint64}	*PtraceRegs	1278
1511	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1512	unix	PC	{}	{uint64}	*PtraceRegs	1278
1513	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1514	unix	PC	{}	{uint64}	*PtraceRegs	1278
1515	unix	SetPC	{uint64}	{}	*PtraceRegs	1278
1516	windows	Error	{}	{string}	*DLLError	2842
1517	windows	FindProc	{string}	{*windows.Proc,error}	*DLL	2843
1518	windows	MustFindProc	{string}	{*windows.Proc}	*DLL	2843
1519	windows	Release	{}	{error}	*DLL	2843
1520	windows	Addr	{}	{uintptr}	*Proc	2844
1521	windows	Call	{...uintptr}	{uintptr,error}	*Proc	2844
1522	windows	Load	{}	{error}	*LazyDLL	2845
1523	windows	Handle	{}	{uintptr}	*LazyDLL	2845
1524	windows	NewProc	{string}	{*windows.LazyProc}	*LazyDLL	2845
1525	windows	Find	{}	{error}	*LazyProc	2846
1526	windows	Addr	{}	{uintptr}	*LazyProc	2846
1527	windows	Call	{...uintptr}	{uintptr,error}	*LazyProc	2846
1528	registry	Close	{}	{error}	Key	2847
1529	registry	ReadSubKeyNames	{int}	{[]string,error}	Key	2847
1530	registry	Stat	{}	{*registry.KeyInfo,error}	Key	2847
1531	registry	GetValue	{string,[]byte}	{int,uint32,error}	Key	2847
1532	registry	GetStringValue	{string}	{string,uint32,error}	Key	2847
1533	registry	GetMUIStringValue	{string}	{string,error}	Key	2847
1534	registry	GetStringsValue	{string}	{[]string,uint32,error}	Key	2847
1535	registry	GetIntegerValue	{string}	{uint64,uint32,error}	Key	2847
1536	registry	GetBinaryValue	{string}	{[]byte,uint32,error}	Key	2847
1537	registry	SetDWordValue	{string,uint32}	{error}	Key	2847
1538	registry	SetQWordValue	{string,uint64}	{error}	Key	2847
1539	registry	SetStringValue	{string,string}	{error}	Key	2847
1540	registry	SetExpandStringValue	{string,string}	{error}	Key	2847
1541	registry	SetStringsValue	{string,[]string}	{error}	Key	2847
1542	registry	SetBinaryValue	{string,[]byte}	{error}	Key	2847
1543	registry	DeleteValue	{string}	{error}	Key	2847
1544	registry	ReadValueNames	{int}	{[]string,error}	Key	2847
1545	registry	Close	{}	{error}	Key	2847
1546	registry	ReadSubKeyNames	{int}	{[]string,error}	Key	2847
1547	registry	Stat	{}	{*registry.KeyInfo,error}	Key	2847
1548	registry	GetValue	{string,[]byte}	{int,uint32,error}	Key	2847
1549	registry	GetStringValue	{string}	{string,uint32,error}	Key	2847
1550	registry	GetMUIStringValue	{string}	{string,error}	Key	2847
1551	registry	GetStringsValue	{string}	{[]string,uint32,error}	Key	2847
1552	registry	GetIntegerValue	{string}	{uint64,uint32,error}	Key	2847
1553	registry	GetBinaryValue	{string}	{[]byte,uint32,error}	Key	2847
1554	registry	SetDWordValue	{string,uint32}	{error}	Key	2847
1555	registry	SetQWordValue	{string,uint64}	{error}	Key	2847
1556	registry	SetStringValue	{string,string}	{error}	Key	2847
1557	registry	SetExpandStringValue	{string,string}	{error}	Key	2847
1558	registry	SetStringsValue	{string,[]string}	{error}	Key	2847
1559	registry	SetBinaryValue	{string,[]byte}	{error}	Key	2847
1560	registry	DeleteValue	{string}	{error}	Key	2847
1561	registry	ReadValueNames	{int}	{[]string,error}	Key	2847
1562	registry	ModTime	{}	{time.Time}	*KeyInfo	2848
1563	windows	String	{}	{string,error}	*SID	2851
1564	windows	Len	{}	{int}	*SID	2851
1565	windows	Copy	{}	{*windows.SID,error}	*SID	2851
1566	windows	LookupAccount	{string}	{string,uint32,error}	*SID	2851
1567	windows	Close	{}	{error}	Token	2856
1568	windows	GetTokenUser	{}	{*windows.Tokenuser,error}	Token	2856
1569	windows	GetTokenGroups	{}	{*windows.Tokengroups,error}	Token	2856
1570	windows	GetTokenPrimaryGroup	{}	{*windows.Tokenprimarygroup,error}	Token	2856
1571	windows	GetUserProfileDirectory	{}	{string,error}	Token	2856
1572	windows	IsMember	{*windows.SID}	{bool,error}	Token	2856
1573	debug	Close	{}	{error}	*ConsoleLog	2866
1574	debug	Info	{uint32,string}	{error}	*ConsoleLog	2866
1575	debug	Warning	{uint32,string}	{error}	*ConsoleLog	2866
1576	debug	Error	{uint32,string}	{error}	*ConsoleLog	2866
1577	eventlog	Close	{}	{error}	*Log	2867
1578	eventlog	Info	{uint32,string}	{error}	*Log	2867
1579	eventlog	Warning	{uint32,string}	{error}	*Log	2867
1580	eventlog	Error	{uint32,string}	{error}	*Log	2867
1581	mgr	Disconnect	{}	{error}	*Mgr	2869
1582	mgr	CreateService	{string,string,mgr.Config,...string}	{*mgr.Service,error}	*Mgr	2869
1583	mgr	OpenService	{string}	{*mgr.Service,error}	*Mgr	2869
1584	mgr	ListServices	{}	{[]string,error}	*Mgr	2869
1585	mgr	Config	{}	{mgr.Config,error}	*Service	2871
1586	mgr	UpdateConfig	{mgr.Config}	{error}	*Service	2871
1587	mgr	SetRecoveryActions	{[]mgr.RecoveryAction,uint32}	{error}	*Service	2871
1588	mgr	RecoveryActions	{}	{[]mgr.RecoveryAction,error}	*Service	2871
1589	mgr	ResetRecoveryActions	{}	{error}	*Service	2871
1590	mgr	ResetPeriod	{}	{uint32,error}	*Service	2871
1591	mgr	SetRebootMessage	{string}	{error}	*Service	2871
1592	mgr	RebootMessage	{}	{string,error}	*Service	2871
1593	mgr	SetRecoveryCommand	{string}	{error}	*Service	2871
1594	mgr	RecoveryCommand	{}	{string,error}	*Service	2871
1595	mgr	Delete	{}	{error}	*Service	2871
1596	mgr	Close	{}	{error}	*Service	2871
1597	mgr	Start	{...string}	{error}	*Service	2871
1598	mgr	Control	{svc.Cmd}	{svc.Status,error}	*Service	2871
1599	mgr	Query	{}	{svc.Status,error}	*Service	2871
1600	windows	Sockaddr	{}	{windows.Sockaddr,error}	*RawSockaddrAny	2882
1601	windows	Exited	{}	{bool}	WaitStatus	2889
1602	windows	ExitStatus	{}	{int}	WaitStatus	2889
1603	windows	Signal	{}	{windows.Signal}	WaitStatus	2889
1604	windows	CoreDump	{}	{bool}	WaitStatus	2889
1605	windows	Stopped	{}	{bool}	WaitStatus	2889
1606	windows	Continued	{}	{bool}	WaitStatus	2889
1607	windows	StopSignal	{}	{windows.Signal}	WaitStatus	2889
1608	windows	Signaled	{}	{bool}	WaitStatus	2889
1609	windows	TrapCause	{}	{int}	WaitStatus	2889
1610	windows	Unix	{}	{int64,int64}	*Timespec	2890
1611	windows	Nano	{}	{int64}	*Timespec	2890
1612	windows	Signal	{}	{}	Signal	2894
1613	windows	String	{}	{string}	Signal	2894
1614	windows	Unix	{}	{int64,int64}	*Timeval	2896
1615	windows	Nano	{}	{int64}	*Timeval	2896
1616	windows	Nanoseconds	{}	{int64}	*Timeval	2896
1617	windows	Nanoseconds	{}	{int64}	*Filetime	2900
1618	analysis	String	{}	{string}	*Analyzer	2962
1619	analysis	Reportf	{token.Pos,string,"...interface{}"}	{}	*Pass	2963
1620	analysis	String	{}	{string}	*Pass	2963
1621	analysisflags	Add	{*token.FileSet,string,string,[]analysis.Diagnostic,error}	{}	JSONTree	2966
1622	analysisflags	Print	{}	{}	JSONTree	2966
1623	facts	ImportObjectFact	{types.Object,analysis.Fact}	{bool}	*Set	2967
1624	facts	ExportObjectFact	{types.Object,analysis.Fact}	{}	*Set	2967
1625	facts	ImportPackageFact	{*types.Package,analysis.Fact}	{bool}	*Set	2967
1626	facts	ExportPackageFact	{analysis.Fact}	{}	*Set	2967
1627	facts	Encode	{}	{[]byte}	*Set	2967
1628	facts	String	{}	{string}	*Set	2967
1629	ctrlflow	FuncDecl	{*ast.FuncDecl}	{*cfg.CFG}	*CFGs	2968
1630	ctrlflow	FuncLit	{*ast.FuncLit}	{*cfg.CFG}	*CFGs	2968
1631	astutil	Node	{}	{ast.Node}	*Cursor	2971
1632	astutil	Parent	{}	{ast.Node}	*Cursor	2971
1633	astutil	Name	{}	{string}	*Cursor	2971
1634	astutil	Index	{}	{int}	*Cursor	2971
1635	astutil	Replace	{ast.Node}	{}	*Cursor	2971
1636	astutil	Delete	{}	{}	*Cursor	2971
1637	astutil	InsertAfter	{ast.Node}	{}	*Cursor	2971
1638	astutil	InsertBefore	{ast.Node}	{}	*Cursor	2971
1639	inspector	Preorder	{[]ast.Node,func(ast.Node)}	{}	*Inspector	2972
1640	inspector	Nodes	{[]ast.Node,"func(ast.Node, bool) bool"}	{}	*Inspector	2972
1641	inspector	WithStack	{[]ast.Node,"func(ast.Node, bool, []ast.Node) bool"}	{}	*Inspector	2972
1642	cfg	Format	{*token.FileSet}	{string}	*CFG	2973
1643	cfg	String	{}	{string}	*Block	2974
1644	cfg	Return	{}	{*ast.ReturnStmt}	*Block	2974
1645	typeutil	SetHasher	{typeutil.Hasher}	{}	*Map	2976
1646	typeutil	Delete	{types.Type}	{bool}	*Map	2976
1647	typeutil	At	{types.Type}	{"interface{}"}	*Map	2976
1648	typeutil	Set	{types.Type,"interface{}"}	{"interface{}"}	*Map	2976
1649	typeutil	Len	{}	{int}	*Map	2976
1650	typeutil	Iterate	{"func(types.Type, interface{})"}	{}	*Map	2976
1651	typeutil	Keys	{}	{[]types.Type}	*Map	2976
1652	typeutil	String	{}	{string}	*Map	2976
1653	typeutil	KeysString	{}	{string}	*Map	2976
1654	typeutil	Hash	{types.Type}	{uint32}	Hasher	2977
1655	typeutil	MethodSet	{types.Type}	{*types.MethodSet}	*MethodSetCache	2978
1656	assign	SetX	{int,"chan int\n"}	{}	*ST	2979
1657	method	Scan	{fmt.ScanState,byte}	{}	*MethodTest	2980
1658	print	Format	{fmt.State,rune}	{}	*BoolFormatter	2981
1659	print	Format	{fmt.State,rune}	{}	FormatterVal	2982
1660	bzip2	Error	{}	{string}	StructuralError	2993
1661	flate	Write	{[]byte}	{int,error}	*Writer	2994
1662	flate	Flush	{}	{error}	*Writer	2994
1663	flate	Close	{}	{error}	*Writer	2994
1664	flate	Reset	{io.Writer}	{}	*Writer	2994
1665	flate	Error	{}	{string}	CorruptInputError	2995
1666	flate	Error	{}	{string}	InternalError	2996
1667	flate	Error	{}	{string}	*ReadError	2997
1668	flate	Error	{}	{string}	*WriteError	2998
1669	gzip	Reset	{io.Reader}	{error}	*Reader	3002
1670	gzip	Multistream	{bool}	{}	*Reader	3002
1671	gzip	Read	{[]byte}	{int,error}	*Reader	3002
1672	gzip	Close	{}	{error}	*Reader	3002
1673	gzip	Reset	{io.Writer}	{}	*Writer	3003
1674	gzip	Write	{[]byte}	{int,error}	*Writer	3003
1675	gzip	Flush	{}	{error}	*Writer	3003
1676	gzip	Close	{}	{error}	*Writer	3003
1677	zlib	Reset	{io.Writer}	{}	*Writer	3006
1678	zlib	Write	{[]byte}	{int,error}	*Writer	3006
1679	zlib	Flush	{}	{error}	*Writer	3006
1680	zlib	Close	{}	{error}	*Writer	3006
1681	list	Next	{}	{*list.Element}	*Element	3008
1682	list	Prev	{}	{*list.Element}	*Element	3008
1683	list	Init	{}	{*list.List}	*List	3009
1684	list	Len	{}	{int}	*List	3009
1685	list	Front	{}	{*list.Element}	*List	3009
1686	list	Back	{}	{*list.Element}	*List	3009
1687	list	Remove	{*list.Element}	{"interface{}"}	*List	3009
1688	list	PushFront	{"interface{}"}	{*list.Element}	*List	3009
1689	list	PushBack	{"interface{}"}	{*list.Element}	*List	3009
1690	list	InsertBefore	{"interface{}",*list.Element}	{*list.Element}	*List	3009
1691	list	InsertAfter	{"interface{}",*list.Element}	{*list.Element}	*List	3009
1692	list	MoveToFront	{*list.Element}	{}	*List	3009
1693	list	MoveToBack	{*list.Element}	{}	*List	3009
1694	list	MoveBefore	{*list.Element,*list.Element}	{}	*List	3009
1695	list	MoveAfter	{*list.Element,*list.Element}	{}	*List	3009
1696	list	PushBackList	{*list.List}	{}	*List	3009
1697	list	PushFrontList	{*list.List}	{}	*List	3009
1698	ring	Next	{}	{*ring.Ring}	*Ring	3010
1699	ring	Prev	{}	{*ring.Ring}	*Ring	3010
1700	ring	Move	{int}	{*ring.Ring}	*Ring	3010
1701	ring	Link	{*ring.Ring}	{*ring.Ring}	*Ring	3010
1702	ring	Unlink	{int}	{*ring.Ring}	*Ring	3010
1703	ring	Len	{}	{int}	*Ring	3010
1704	ring	Do	{"func(interface{})"}	{}	*Ring	3010
1705	aes	Error	{}	{string}	KeySizeError	3013
1706	cipher	Read	{[]byte}	{int,error}	StreamReader	3018
1707	cipher	Write	{[]byte}	{int,error}	StreamWriter	3019
1708	cipher	Close	{}	{error}	StreamWriter	3019
1709	crypto	HashFunc	{}	{crypto.Hash}	Hash	3020
1710	crypto	Size	{}	{int}	Hash	3020
1711	crypto	New	{}	{hash.Hash}	Hash	3020
1712	crypto	Available	{}	{bool}	Hash	3020
1713	des	Error	{}	{string}	KeySizeError	3027
1714	ecdsa	Public	{}	{crypto.PublicKey}	*PrivateKey	3033
1715	ecdsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	3033
1716	elliptic	Params	{}	{*elliptic.CurveParams}	*CurveParams	3035
1717	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}	*CurveParams	3035
1718	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	3035
1719	elliptic	Double	{*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	3035
1720	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int,*big.Int}	*CurveParams	3035
1721	elliptic	ScalarBaseMult	{[]byte}	{*big.Int,*big.Int}	*CurveParams	3035
1722	rc4	Reset	{}	{}	*Cipher	3037
1723	rc4	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	3037
1724	rc4	Error	{}	{string}	KeySizeError	3038
1725	rsa	HashFunc	{}	{crypto.Hash}	*PSSOptions	3040
1726	rsa	Size	{}	{int}	*PublicKey	3041
1727	rsa	Public	{}	{crypto.PublicKey}	*PrivateKey	3043
1728	rsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	3043
1729	rsa	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}	*PrivateKey	3043
1730	rsa	Validate	{}	{error}	*PrivateKey	3043
1731	rsa	Precompute	{}	{}	*PrivateKey	3043
1732	tls	ExportKeyingMaterial	{string,[]byte,int}	{[]byte,error}	*ConnectionState	3047
1733	tls	Clone	{}	{*tls.Config}	*Config	3055
1734	tls	SetSessionTicketKeys	{[][]byte}	{}	*Config	3055
1735	tls	BuildNameToCertificate	{}	{}	*Config	3055
1736	tls	LocalAddr	{}	{net.Addr}	*Conn	3057
1737	tls	RemoteAddr	{}	{net.Addr}	*Conn	3057
1738	tls	SetDeadline	{time.Time}	{error}	*Conn	3057
1739	tls	SetReadDeadline	{time.Time}	{error}	*Conn	3057
1740	tls	SetWriteDeadline	{time.Time}	{error}	*Conn	3057
1741	tls	Write	{[]byte}	{int,error}	*Conn	3057
1742	tls	Read	{[]byte}	{int,error}	*Conn	3057
1743	tls	Close	{}	{error}	*Conn	3057
1744	tls	CloseWrite	{}	{error}	*Conn	3057
1745	tls	Handshake	{}	{error}	*Conn	3057
1746	tls	ConnectionState	{}	{tls.ConnectionState}	*Conn	3057
1747	tls	OCSPResponse	{}	{[]byte}	*Conn	3057
1748	tls	VerifyHostname	{string}	{error}	*Conn	3057
1749	tls	Error	{}	{string}	RecordHeaderError	3058
1750	x509	AddCert	{*x509.Certificate}	{}	*CertPool	3059
1751	x509	AppendCertsFromPEM	{[]byte}	{bool}	*CertPool	3059
1752	x509	Subjects	{}	{[][]byte}	*CertPool	3059
1753	pkix	String	{}	{string}	RDNSequence	3062
1754	pkix	FillFromRDNSequence	{*pkix.RDNSequence}	{}	*Name	3067
1755	pkix	ToRDNSequence	{}	{pkix.RDNSequence}	Name	3067
1756	pkix	String	{}	{string}	Name	3067
1757	pkix	HasExpired	{time.Time}	{bool}	*CertificateList	3068
1758	x509	Error	{}	{string}	CertificateInvalidError	3072
1759	x509	Error	{}	{string}	HostnameError	3073
1760	x509	Error	{}	{string}	UnknownAuthorityError	3074
1761	x509	Error	{}	{string}	SystemRootsError	3075
1762	x509	String	{}	{string}	SignatureAlgorithm	3077
1763	x509	String	{}	{string}	PublicKeyAlgorithm	3078
1764	x509	Verify	{x509.VerifyOptions}	{[][]*x509.Certificate,error}	*Certificate	3081
1765	x509	VerifyHostname	{string}	{error}	*Certificate	3081
1766	x509	Equal	{*x509.Certificate}	{bool}	*Certificate	3081
1767	x509	CheckSignatureFrom	{*x509.Certificate}	{error}	*Certificate	3081
1768	x509	CheckSignature	{x509.SignatureAlgorithm,[]byte,[]byte}	{error}	*Certificate	3081
1769	x509	CheckCRLSignature	{*pkix.CertificateList}	{error}	*Certificate	3081
1770	x509	CreateCRL	{io.Reader,"interface{}",[]pkix.RevokedCertificate,time.Time,time.Time}	{[]byte,error}	*Certificate	3081
1771	x509	Error	{}	{string}	InsecureAlgorithmError	3082
1772	x509	Error	{}	{string}	ConstraintViolationError	3083
1773	x509	Error	{}	{string}	UnhandledCriticalExtension	3084
1774	x509	CheckSignature	{}	{error}	*CertificateRequest	3085
1775	driver	LastInsertId	{}	{int64,error}	RowsAffected	3116
1776	driver	RowsAffected	{}	{int64,error}	RowsAffected	3116
1777	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	Null	3119
1778	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	NotNull	3120
1779	sql	String	{}	{string}	IsolationLevel	3122
1780	sql	Scan	{"interface{}"}	{error}	*NullString	3125
1781	sql	Value	{}	{driver.Value,error}	NullString	3125
1782	sql	Scan	{"interface{}"}	{error}	*NullInt64	3126
1783	sql	Value	{}	{driver.Value,error}	NullInt64	3126
1784	sql	Scan	{"interface{}"}	{error}	*NullFloat64	3127
1785	sql	Value	{}	{driver.Value,error}	NullFloat64	3127
1786	sql	Scan	{"interface{}"}	{error}	*NullBool	3128
1787	sql	Value	{}	{driver.Value,error}	NullBool	3128
1788	sql	PingContext	{context.Context}	{error}	*DB	3131
1789	sql	Ping	{}	{error}	*DB	3131
1790	sql	Close	{}	{error}	*DB	3131
1791	sql	SetMaxIdleConns	{int}	{}	*DB	3131
1792	sql	SetMaxOpenConns	{int}	{}	*DB	3131
1793	sql	SetConnMaxLifetime	{time.Duration}	{}	*DB	3131
1794	sql	Stats	{}	{sql.DBStats}	*DB	3131
1795	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*DB	3131
1796	sql	Prepare	{string}	{*sql.Stmt,error}	*DB	3131
1797	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*DB	3131
1798	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*DB	3131
1799	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*DB	3131
1800	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*DB	3131
1801	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*DB	3131
1802	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*DB	3131
1803	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*DB	3131
1804	sql	Begin	{}	{*sql.Tx,error}	*DB	3131
1805	sql	Driver	{}	{driver.Driver}	*DB	3131
1806	sql	Conn	{context.Context}	{*sql.Conn,error}	*DB	3131
1807	sql	PingContext	{context.Context}	{error}	*Conn	3133
1808	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Conn	3133
1809	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Conn	3133
1810	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Conn	3133
1811	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Conn	3133
1812	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*Conn	3133
1813	sql	Close	{}	{error}	*Conn	3133
1814	sql	Commit	{}	{error}	*Tx	3134
1815	sql	Rollback	{}	{error}	*Tx	3134
1816	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Tx	3134
1817	sql	Prepare	{string}	{*sql.Stmt,error}	*Tx	3134
1818	sql	StmtContext	{context.Context,*sql.Stmt}	{*sql.Stmt}	*Tx	3134
1819	sql	Stmt	{*sql.Stmt}	{*sql.Stmt}	*Tx	3134
1820	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Tx	3134
1821	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*Tx	3134
1822	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Tx	3134
1823	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*Tx	3134
1824	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Tx	3134
1825	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*Tx	3134
1826	sql	ExecContext	{context.Context,"...interface{}"}	{sql.Result,error}	*Stmt	3135
1827	sql	Exec	{"...interface{}"}	{sql.Result,error}	*Stmt	3135
1828	sql	QueryContext	{context.Context,"...interface{}"}	{*sql.Rows,error}	*Stmt	3135
1829	sql	Query	{"...interface{}"}	{*sql.Rows,error}	*Stmt	3135
1830	sql	QueryRowContext	{context.Context,"...interface{}"}	{*sql.Row}	*Stmt	3135
1831	sql	QueryRow	{"...interface{}"}	{*sql.Row}	*Stmt	3135
1832	sql	Close	{}	{error}	*Stmt	3135
1833	sql	Next	{}	{bool}	*Rows	3136
1834	sql	NextResultSet	{}	{bool}	*Rows	3136
1835	sql	Err	{}	{error}	*Rows	3136
1836	sql	Columns	{}	{[]string,error}	*Rows	3136
1837	sql	ColumnTypes	{}	{[]*sql.ColumnType,error}	*Rows	3136
1838	sql	Scan	{"...interface{}"}	{error}	*Rows	3136
1839	sql	Close	{}	{error}	*Rows	3136
1840	sql	Name	{}	{string}	*ColumnType	3137
1841	sql	Length	{}	{int64,bool}	*ColumnType	3137
1842	sql	DecimalSize	{}	{int64,bool}	*ColumnType	3137
1843	sql	ScanType	{}	{reflect.Type}	*ColumnType	3137
1844	sql	Nullable	{}	{bool}	*ColumnType	3137
1845	sql	DatabaseTypeName	{}	{string}	*ColumnType	3137
1846	sql	Scan	{"...interface{}"}	{error}	*Row	3138
1847	dwarf	Error	{}	{string}	DecodeError	3140
1848	dwarf	String	{}	{string}	Attr	3141
1849	dwarf	GoString	{}	{string}	Attr	3141
1850	dwarf	GoString	{}	{string}	Tag	3142
1851	dwarf	String	{}	{string}	Tag	3142
1852	dwarf	Val	{dwarf.Attr}	{"interface{}"}	*Entry	3143
1853	dwarf	AttrField	{dwarf.Attr}	{*dwarf.Field}	*Entry	3143
1854	dwarf	String	{}	{string}	Class	3145
1855	dwarf	GoString	{}	{string}	Class	3145
1856	dwarf	AddressSize	{}	{int}	*Reader	3147
1857	dwarf	Seek	{dwarf.Offset}	{}	*Reader	3147
1858	dwarf	Next	{}	{*dwarf.Entry,error}	*Reader	3147
1859	dwarf	SkipChildren	{}	{}	*Reader	3147
1860	dwarf	SeekPC	{uint64}	{*dwarf.Entry,error}	*Reader	3147
1861	dwarf	Next	{*dwarf.LineEntry}	{error}	*LineReader	3148
1862	dwarf	Tell	{}	{dwarf.LineReaderPos}	*LineReader	3148
1863	dwarf	Seek	{dwarf.LineReaderPos}	{}	*LineReader	3148
1864	dwarf	Reset	{}	{}	*LineReader	3148
1865	dwarf	SeekPC	{uint64,*dwarf.LineEntry}	{error}	*LineReader	3148
1866	dwarf	Reader	{}	{*dwarf.Reader}	*Data	3152
1867	dwarf	Ranges	{*dwarf.Entry}	{[][]uint64,error}	*Data	3152
1868	dwarf	LineReader	{*dwarf.Entry}	{*dwarf.LineReader,error}	*Data	3152
1869	dwarf	AddTypes	{string,[]byte}	{error}	*Data	3152
1870	dwarf	Type	{dwarf.Offset}	{dwarf.Type,error}	*Data	3152
1871	dwarf	Common	{}	{*dwarf.CommonType}	*CommonType	3154
1872	dwarf	Size	{}	{int64}	*CommonType	3154
1873	dwarf	Basic	{}	{*dwarf.BasicType}	*BasicType	3155
1874	dwarf	String	{}	{string}	*BasicType	3155
1875	dwarf	String	{}	{string}	*QualType	3165
1876	dwarf	Size	{}	{int64}	*QualType	3165
1877	dwarf	String	{}	{string}	*ArrayType	3166
1878	dwarf	Size	{}	{int64}	*ArrayType	3166
1879	dwarf	String	{}	{string}	*VoidType	3167
1880	dwarf	String	{}	{string}	*PtrType	3168
1881	dwarf	String	{}	{string}	*StructType	3169
1882	dwarf	Defn	{}	{string}	*StructType	3169
1883	dwarf	String	{}	{string}	*EnumType	3171
1884	dwarf	String	{}	{string}	*FuncType	3173
1885	dwarf	String	{}	{string}	*DotDotDotType	3174
1886	dwarf	String	{}	{string}	*TypedefType	3175
1887	dwarf	Size	{}	{int64}	*TypedefType	3175
1888	elf	String	{}	{string}	Version	3176
1889	elf	GoString	{}	{string}	Version	3176
1890	elf	String	{}	{string}	Class	3177
1891	elf	GoString	{}	{string}	Class	3177
1892	elf	String	{}	{string}	Data	3178
1893	elf	GoString	{}	{string}	Data	3178
1894	elf	String	{}	{string}	OSABI	3179
1895	elf	GoString	{}	{string}	OSABI	3179
1896	elf	String	{}	{string}	Type	3180
1897	elf	GoString	{}	{string}	Type	3180
1898	elf	String	{}	{string}	Machine	3181
1899	elf	GoString	{}	{string}	Machine	3181
1900	elf	String	{}	{string}	SectionIndex	3182
1901	elf	GoString	{}	{string}	SectionIndex	3182
1902	elf	String	{}	{string}	SectionType	3183
1903	elf	GoString	{}	{string}	SectionType	3183
1904	elf	String	{}	{string}	SectionFlag	3184
1905	elf	GoString	{}	{string}	SectionFlag	3184
1906	elf	String	{}	{string}	CompressionType	3185
1907	elf	GoString	{}	{string}	CompressionType	3185
1908	elf	String	{}	{string}	ProgType	3186
1909	elf	GoString	{}	{string}	ProgType	3186
1910	elf	String	{}	{string}	ProgFlag	3187
1911	elf	GoString	{}	{string}	ProgFlag	3187
1912	elf	String	{}	{string}	DynTag	3188
1913	elf	GoString	{}	{string}	DynTag	3188
1914	elf	String	{}	{string}	DynFlag	3189
1915	elf	GoString	{}	{string}	DynFlag	3189
1916	elf	String	{}	{string}	NType	3190
1917	elf	GoString	{}	{string}	NType	3190
1918	elf	String	{}	{string}	SymBind	3191
1919	elf	GoString	{}	{string}	SymBind	3191
1920	elf	String	{}	{string}	SymType	3192
1921	elf	GoString	{}	{string}	SymType	3192
1922	elf	String	{}	{string}	SymVis	3193
1923	elf	GoString	{}	{string}	SymVis	3193
1924	elf	String	{}	{string}	R_X86_64	3194
1925	elf	GoString	{}	{string}	R_X86_64	3194
1926	elf	String	{}	{string}	R_AARCH64	3195
1927	elf	GoString	{}	{string}	R_AARCH64	3195
1928	elf	String	{}	{string}	R_ALPHA	3196
1929	elf	GoString	{}	{string}	R_ALPHA	3196
1930	elf	String	{}	{string}	R_ARM	3197
1931	elf	GoString	{}	{string}	R_ARM	3197
1932	elf	String	{}	{string}	R_386	3198
1933	elf	GoString	{}	{string}	R_386	3198
1934	elf	String	{}	{string}	R_MIPS	3199
1935	elf	GoString	{}	{string}	R_MIPS	3199
1936	elf	String	{}	{string}	R_PPC	3200
1937	elf	GoString	{}	{string}	R_PPC	3200
1938	elf	String	{}	{string}	R_PPC64	3201
1939	elf	GoString	{}	{string}	R_PPC64	3201
1940	elf	String	{}	{string}	R_RISCV	3202
1941	elf	GoString	{}	{string}	R_RISCV	3202
1942	elf	String	{}	{string}	R_390	3203
1943	elf	GoString	{}	{string}	R_390	3203
1944	elf	String	{}	{string}	R_SPARC	3204
1945	elf	GoString	{}	{string}	R_SPARC	3204
1946	elf	Close	{}	{error}	*File	3222
1947	elf	SectionByType	{elf.SectionType}	{*elf.Section}	*File	3222
1948	elf	Section	{string}	{*elf.Section}	*File	3222
1949	elf	DWARF	{}	{*dwarf.Data,error}	*File	3222
1950	elf	Symbols	{}	{[]elf.Symbol,error}	*File	3222
1951	elf	DynamicSymbols	{}	{[]elf.Symbol,error}	*File	3222
1952	elf	ImportedSymbols	{}	{[]elf.ImportedSymbol,error}	*File	3222
1953	elf	ImportedLibraries	{}	{[]string,error}	*File	3222
1954	elf	DynString	{elf.DynTag}	{[]string,error}	*File	3222
1955	elf	Data	{}	{[]byte,error}	*Section	3224
1956	elf	Open	{}	{io.ReadSeeker}	*Section	3224
1957	elf	Open	{}	{io.ReadSeeker}	*Prog	3226
1958	elf	Error	{}	{string}	*FormatError	3228
1959	gosym	PCToLine	{uint64}	{int}	*LineTable	3230
1960	gosym	LineToPC	{int,uint64}	{uint64}	*LineTable	3230
1961	gosym	Static	{}	{bool}	*Sym	3231
1962	gosym	PackageName	{}	{string}	*Sym	3231
1963	gosym	ReceiverName	{}	{string}	*Sym	3231
1964	gosym	BaseName	{}	{string}	*Sym	3231
1965	gosym	PCToFunc	{uint64}	{*gosym.Func}	*Table	3234
1966	gosym	PCToLine	{uint64}	{string,int,*gosym.Func}	*Table	3234
1967	gosym	LineToPC	{string,int}	{uint64,*gosym.Func,error}	*Table	3234
1968	gosym	LookupSym	{string}	{*gosym.Sym}	*Table	3234
1969	gosym	LookupFunc	{string}	{*gosym.Func}	*Table	3234
1970	gosym	SymByAddr	{uint64}	{*gosym.Sym}	*Table	3234
1971	gosym	Error	{}	{string}	UnknownFileError	3235
1972	gosym	Error	{}	{string}	*UnknownLineError	3236
1973	gosym	Error	{}	{string}	*DecodingError	3237
1974	macho	Close	{}	{error}	*FatFile	3238
1975	macho	Close	{}	{error}	*File	3241
1976	macho	Segment	{string}	{*macho.Segment}	*File	3241
1977	macho	Section	{string}	{*macho.Section}	*File	3241
1978	macho	DWARF	{}	{*dwarf.Data,error}	*File	3241
1979	macho	ImportedSymbols	{}	{[]string,error}	*File	3241
1980	macho	ImportedLibraries	{}	{[]string,error}	*File	3241
1981	macho	Raw	{}	{[]byte}	LoadBytes	3243
1982	macho	Data	{}	{[]byte,error}	*Segment	3245
1983	macho	Open	{}	{io.ReadSeeker}	*Segment	3245
1984	macho	Data	{}	{[]byte,error}	*Section	3248
1985	macho	Open	{}	{io.ReadSeeker}	*Section	3248
1986	macho	Error	{}	{string}	*FormatError	3254
1987	macho	String	{}	{string}	Type	3256
1988	macho	GoString	{}	{string}	Type	3256
1989	macho	String	{}	{string}	Cpu	3257
1990	macho	GoString	{}	{string}	Cpu	3257
1991	macho	String	{}	{string}	LoadCmd	3258
1992	macho	GoString	{}	{string}	LoadCmd	3258
1993	macho	GoString	{}	{string}	RelocTypeGeneric	3272
1994	macho	String	{}	{string}	RelocTypeGeneric	3272
1995	macho	GoString	{}	{string}	RelocTypeX86_64	3273
1996	macho	String	{}	{string}	RelocTypeX86_64	3273
1997	macho	GoString	{}	{string}	RelocTypeARM	3274
1998	macho	String	{}	{string}	RelocTypeARM	3274
1999	macho	GoString	{}	{string}	RelocTypeARM64	3275
2000	macho	String	{}	{string}	RelocTypeARM64	3275
2001	pe	Close	{}	{error}	*File	3276
2002	pe	Section	{string}	{*pe.Section}	*File	3276
2003	pe	DWARF	{}	{*dwarf.Data,error}	*File	3276
2004	pe	ImportedSymbols	{}	{[]string,error}	*File	3276
2005	pe	ImportedLibraries	{}	{[]string,error}	*File	3276
2006	pe	Error	{}	{string}	*FormatError	3278
2007	pe	Data	{}	{[]byte,error}	*Section	3286
2008	pe	Open	{}	{io.ReadSeeker}	*Section	3286
2009	pe	String	{uint32}	{string,error}	StringTable	3287
2010	pe	FullName	{pe.StringTable}	{string,error}	*COFFSymbol	3288
2011	plan9obj	Close	{}	{error}	*File	3291
2012	plan9obj	Symbols	{}	{[]plan9obj.Sym,error}	*File	3291
2013	plan9obj	Section	{string}	{*plan9obj.Section}	*File	3291
2014	plan9obj	Data	{}	{[]byte,error}	*Section	3293
2015	plan9obj	Open	{}	{io.ReadSeeker}	*Section	3293
2016	ascii85	Error	{}	{string}	CorruptInputError	3295
2017	asn1	Error	{}	{string}	StructuralError	3296
2018	asn1	Error	{}	{string}	SyntaxError	3297
2019	asn1	At	{int}	{int}	BitString	3298
2020	asn1	RightAlign	{}	{[]byte}	BitString	3298
2021	asn1	Equal	{asn1.ObjectIdentifier}	{bool}	ObjectIdentifier	3299
2022	asn1	String	{}	{string}	ObjectIdentifier	3299
2023	base32	WithPadding	{rune}	{*base32.Encoding}	Encoding	3304
2024	base32	Encode	{[]byte,[]byte}	{}	*Encoding	3304
2025	base32	EncodeToString	{[]byte}	{string}	*Encoding	3304
2026	base32	EncodedLen	{int}	{int}	*Encoding	3304
2027	base32	Decode	{[]byte,[]byte}	{int,error}	*Encoding	3304
2028	base32	DecodeString	{string}	{[]byte,error}	*Encoding	3304
2029	base32	DecodedLen	{int}	{int}	*Encoding	3304
2030	base32	Error	{}	{string}	CorruptInputError	3305
2031	base64	WithPadding	{rune}	{*base64.Encoding}	Encoding	3306
2032	base64	Strict	{}	{*base64.Encoding}	Encoding	3306
2033	base64	Encode	{[]byte,[]byte}	{}	*Encoding	3306
2034	base64	EncodeToString	{[]byte}	{string}	*Encoding	3306
2035	base64	EncodedLen	{int}	{int}	*Encoding	3306
2036	base64	DecodeString	{string}	{[]byte,error}	*Encoding	3306
2037	base64	Decode	{[]byte,[]byte}	{int,error}	*Encoding	3306
2038	base64	DecodedLen	{int}	{int}	*Encoding	3306
2039	base64	Error	{}	{string}	CorruptInputError	3307
2040	csv	Error	{}	{string}	*ParseError	3309
2041	csv	Read	{}	{[]string,error}	*Reader	3310
2042	csv	ReadAll	{}	{[][]string,error}	*Reader	3310
2043	csv	Write	{[]string}	{error}	*Writer	3311
2044	csv	Flush	{}	{}	*Writer	3311
2045	csv	Error	{}	{error}	*Writer	3311
2046	csv	WriteAll	{[][]string}	{error}	*Writer	3311
2047	gob	Decode	{"interface{}"}	{error}	*Decoder	3317
2048	gob	DecodeValue	{reflect.Value}	{error}	*Decoder	3317
2049	gob	Encode	{"interface{}"}	{error}	*Encoder	3319
2050	gob	EncodeValue	{reflect.Value}	{error}	*Encoder	3319
2051	hex	Error	{}	{string}	InvalidByteError	3323
2052	json	Error	{}	{string}	*UnmarshalTypeError	3325
2053	json	Error	{}	{string}	*UnmarshalFieldError	3326
2054	json	Error	{}	{string}	*InvalidUnmarshalError	3327
2055	json	String	{}	{string}	Number	3328
2056	json	Float64	{}	{float64,error}	Number	3328
2057	json	Int64	{}	{int64,error}	Number	3328
2058	json	Error	{}	{string}	*UnsupportedTypeError	3330
2059	json	Error	{}	{string}	*UnsupportedValueError	3331
2060	json	Error	{}	{string}	*InvalidUTF8Error	3332
2061	json	Error	{}	{string}	*MarshalerError	3333
2062	json	Error	{}	{string}	*SyntaxError	3334
2063	json	UseNumber	{}	{}	*Decoder	3335
2064	json	DisallowUnknownFields	{}	{}	*Decoder	3335
2065	json	Decode	{"interface{}"}	{error}	*Decoder	3335
2066	json	Buffered	{}	{io.Reader}	*Decoder	3335
2067	json	Token	{}	{json.Token,error}	*Decoder	3335
2068	json	More	{}	{bool}	*Decoder	3335
2069	json	Encode	{"interface{}"}	{error}	*Encoder	3336
2070	json	SetIndent	{string,string}	{}	*Encoder	3336
2071	json	SetEscapeHTML	{bool}	{}	*Encoder	3336
2072	json	MarshalJSON	{}	{[]byte,error}	RawMessage	3337
2073	json	UnmarshalJSON	{[]byte}	{error}	*RawMessage	3337
2074	json	String	{}	{string}	Delim	3339
2075	xml	Indent	{string,string}	{}	*Encoder	3343
2076	xml	Encode	{"interface{}"}	{error}	*Encoder	3343
2077	xml	EncodeElement	{"interface{}",xml.StartElement}	{error}	*Encoder	3343
2078	xml	EncodeToken	{xml.Token}	{error}	*Encoder	3343
2079	xml	Flush	{}	{error}	*Encoder	3343
2080	xml	Error	{}	{string}	*UnsupportedTypeError	3344
2081	xml	Error	{}	{string}	UnmarshalError	3345
2082	xml	Error	{}	{string}	*TagPathError	3348
2083	xml	Error	{}	{string}	*SyntaxError	3349
2084	xml	Copy	{}	{xml.StartElement}	StartElement	3353
2085	xml	End	{}	{xml.EndElement}	StartElement	3353
2086	xml	Copy	{}	{xml.CharData}	CharData	3355
2087	xml	Copy	{}	{xml.Comment}	Comment	3356
2088	xml	Copy	{}	{xml.ProcInst}	ProcInst	3357
2089	xml	Copy	{}	{xml.Directive}	Directive	3358
2090	xml	Decode	{"interface{}"}	{error}	*Decoder	3360
2091	xml	DecodeElement	{"interface{}",*xml.StartElement}	{error}	*Decoder	3360
2092	xml	Skip	{}	{error}	*Decoder	3360
2093	xml	Token	{}	{xml.Token,error}	*Decoder	3360
2094	xml	RawToken	{}	{xml.Token,error}	*Decoder	3360
2095	xml	InputOffset	{}	{int64}	*Decoder	3360
2096	expvar	Value	{}	{int64}	*Int	3362
2097	expvar	String	{}	{string}	*Int	3362
2098	expvar	Add	{int64}	{}	*Int	3362
2099	expvar	Set	{int64}	{}	*Int	3362
2100	expvar	Value	{}	{float64}	*Float	3363
2101	expvar	String	{}	{string}	*Float	3363
2102	expvar	Add	{float64}	{}	*Float	3363
2103	expvar	Set	{float64}	{}	*Float	3363
2104	expvar	String	{}	{string}	*Map	3364
2105	expvar	Init	{}	{*expvar.Map}	*Map	3364
2106	expvar	Get	{string}	{expvar.Var}	*Map	3364
2107	expvar	Set	{string,expvar.Var}	{}	*Map	3364
2108	expvar	Add	{string,int64}	{}	*Map	3364
2109	expvar	AddFloat	{string,float64}	{}	*Map	3364
2110	expvar	Delete	{string}	{}	*Map	3364
2111	expvar	Do	{func(expvar.KeyValue)}	{}	*Map	3364
2112	expvar	Value	{}	{string}	*String	3366
2113	expvar	String	{}	{string}	*String	3366
2114	expvar	Set	{string}	{}	*String	3366
2115	expvar	Value	{}	{"interface{}"}	Func	3367
2116	expvar	String	{}	{string}	Func	3367
2117	flag	Output	{}	{io.Writer}	*FlagSet	3371
2118	flag	Name	{}	{string}	*FlagSet	3371
2119	flag	ErrorHandling	{}	{flag.ErrorHandling}	*FlagSet	3371
2120	flag	SetOutput	{io.Writer}	{}	*FlagSet	3371
2121	flag	VisitAll	{func(*flag.Flag)}	{}	*FlagSet	3371
2122	flag	Visit	{func(*flag.Flag)}	{}	*FlagSet	3371
2123	flag	Lookup	{string}	{*flag.Flag}	*FlagSet	3371
2124	flag	Set	{string,string}	{error}	*FlagSet	3371
2125	flag	PrintDefaults	{}	{}	*FlagSet	3371
2126	flag	NFlag	{}	{int}	*FlagSet	3371
2127	flag	Arg	{int}	{string}	*FlagSet	3371
2128	flag	NArg	{}	{int}	*FlagSet	3371
2129	flag	Args	{}	{[]string}	*FlagSet	3371
2130	flag	BoolVar	{*bool,string,bool,string}	{}	*FlagSet	3371
2131	flag	Bool	{string,bool,string}	{*bool}	*FlagSet	3371
2132	flag	IntVar	{*int,string,int,string}	{}	*FlagSet	3371
2133	flag	Int	{string,int,string}	{*int}	*FlagSet	3371
2134	flag	Int64Var	{*int64,string,int64,string}	{}	*FlagSet	3371
2135	flag	Int64	{string,int64,string}	{*int64}	*FlagSet	3371
2136	flag	UintVar	{*uint,string,uint,string}	{}	*FlagSet	3371
2137	flag	Uint	{string,uint,string}	{*uint}	*FlagSet	3371
2138	flag	Uint64Var	{*uint64,string,uint64,string}	{}	*FlagSet	3371
2139	flag	Uint64	{string,uint64,string}	{*uint64}	*FlagSet	3371
2140	flag	StringVar	{*string,string,string,string}	{}	*FlagSet	3371
2141	flag	String	{string,string,string}	{*string}	*FlagSet	3371
2142	flag	Float64Var	{*float64,string,float64,string}	{}	*FlagSet	3371
2143	flag	Float64	{string,float64,string}	{*float64}	*FlagSet	3371
2144	flag	DurationVar	{*time.Duration,string,time.Duration,string}	{}	*FlagSet	3371
2145	flag	Duration	{string,time.Duration,string}	{*time.Duration}	*FlagSet	3371
2146	flag	Var	{flag.Value,string,string}	{}	*FlagSet	3371
2147	flag	Parse	{[]string}	{error}	*FlagSet	3371
2148	flag	Parsed	{}	{bool}	*FlagSet	3371
2149	flag	Init	{string,flag.ErrorHandling}	{}	*FlagSet	3371
2150	ast	Pos	{}	{token.Pos}	*Comment	3383
2151	ast	End	{}	{token.Pos}	*Comment	3383
2152	ast	Pos	{}	{token.Pos}	*CommentGroup	3384
2153	ast	End	{}	{token.Pos}	*CommentGroup	3384
2154	ast	Text	{}	{string}	*CommentGroup	3384
2155	ast	Pos	{}	{token.Pos}	*Field	3385
2156	ast	End	{}	{token.Pos}	*Field	3385
2157	ast	Pos	{}	{token.Pos}	*FieldList	3386
2158	ast	End	{}	{token.Pos}	*FieldList	3386
2159	ast	NumFields	{}	{int}	*FieldList	3386
2160	ast	Pos	{}	{token.Pos}	*BadExpr	3387
2161	ast	End	{}	{token.Pos}	*BadExpr	3387
2162	ast	Pos	{}	{token.Pos}	*Ident	3388
2163	ast	End	{}	{token.Pos}	*Ident	3388
2164	ast	IsExported	{}	{bool}	*Ident	3388
2165	ast	String	{}	{string}	*Ident	3388
2166	ast	Pos	{}	{token.Pos}	*Ellipsis	3389
2167	ast	End	{}	{token.Pos}	*Ellipsis	3389
2168	ast	Pos	{}	{token.Pos}	*BasicLit	3390
2169	ast	End	{}	{token.Pos}	*BasicLit	3390
2170	ast	Pos	{}	{token.Pos}	*FuncLit	3391
2171	ast	End	{}	{token.Pos}	*FuncLit	3391
2172	ast	Pos	{}	{token.Pos}	*CompositeLit	3392
2173	ast	End	{}	{token.Pos}	*CompositeLit	3392
2174	ast	Pos	{}	{token.Pos}	*ParenExpr	3393
2175	ast	End	{}	{token.Pos}	*ParenExpr	3393
2176	ast	Pos	{}	{token.Pos}	*SelectorExpr	3394
2177	ast	End	{}	{token.Pos}	*SelectorExpr	3394
2178	ast	Pos	{}	{token.Pos}	*IndexExpr	3395
2179	ast	End	{}	{token.Pos}	*IndexExpr	3395
2180	ast	Pos	{}	{token.Pos}	*SliceExpr	3396
2181	ast	End	{}	{token.Pos}	*SliceExpr	3396
2182	ast	Pos	{}	{token.Pos}	*TypeAssertExpr	3397
2183	ast	End	{}	{token.Pos}	*TypeAssertExpr	3397
2184	ast	Pos	{}	{token.Pos}	*CallExpr	3398
2185	ast	End	{}	{token.Pos}	*CallExpr	3398
2186	ast	Pos	{}	{token.Pos}	*StarExpr	3399
2187	ast	End	{}	{token.Pos}	*StarExpr	3399
2188	ast	Pos	{}	{token.Pos}	*UnaryExpr	3400
2189	ast	End	{}	{token.Pos}	*UnaryExpr	3400
2190	ast	Pos	{}	{token.Pos}	*BinaryExpr	3401
2407	types	String	{}	{string}	*Nil	3626
2191	ast	End	{}	{token.Pos}	*BinaryExpr	3401
2192	ast	Pos	{}	{token.Pos}	*KeyValueExpr	3402
2193	ast	End	{}	{token.Pos}	*KeyValueExpr	3402
2194	ast	Pos	{}	{token.Pos}	*ArrayType	3404
2195	ast	End	{}	{token.Pos}	*ArrayType	3404
2196	ast	Pos	{}	{token.Pos}	*StructType	3405
2197	ast	End	{}	{token.Pos}	*StructType	3405
2198	ast	Pos	{}	{token.Pos}	*FuncType	3406
2199	ast	End	{}	{token.Pos}	*FuncType	3406
2200	ast	Pos	{}	{token.Pos}	*InterfaceType	3407
2201	ast	End	{}	{token.Pos}	*InterfaceType	3407
2202	ast	Pos	{}	{token.Pos}	*MapType	3408
2203	ast	End	{}	{token.Pos}	*MapType	3408
2204	ast	Pos	{}	{token.Pos}	*ChanType	3409
2205	ast	End	{}	{token.Pos}	*ChanType	3409
2206	ast	Pos	{}	{token.Pos}	*BadStmt	3410
2207	ast	End	{}	{token.Pos}	*BadStmt	3410
2208	ast	Pos	{}	{token.Pos}	*DeclStmt	3411
2209	ast	End	{}	{token.Pos}	*DeclStmt	3411
2210	ast	Pos	{}	{token.Pos}	*EmptyStmt	3412
2211	ast	End	{}	{token.Pos}	*EmptyStmt	3412
2212	ast	Pos	{}	{token.Pos}	*LabeledStmt	3413
2213	ast	End	{}	{token.Pos}	*LabeledStmt	3413
2214	ast	Pos	{}	{token.Pos}	*ExprStmt	3414
2215	ast	End	{}	{token.Pos}	*ExprStmt	3414
2216	ast	Pos	{}	{token.Pos}	*SendStmt	3415
2217	ast	End	{}	{token.Pos}	*SendStmt	3415
2218	ast	Pos	{}	{token.Pos}	*IncDecStmt	3416
2219	ast	End	{}	{token.Pos}	*IncDecStmt	3416
2220	ast	Pos	{}	{token.Pos}	*AssignStmt	3417
2221	ast	End	{}	{token.Pos}	*AssignStmt	3417
2222	ast	Pos	{}	{token.Pos}	*GoStmt	3418
2223	ast	End	{}	{token.Pos}	*GoStmt	3418
2224	ast	Pos	{}	{token.Pos}	*DeferStmt	3419
2225	ast	End	{}	{token.Pos}	*DeferStmt	3419
2226	ast	Pos	{}	{token.Pos}	*ReturnStmt	3420
2227	ast	End	{}	{token.Pos}	*ReturnStmt	3420
2228	ast	Pos	{}	{token.Pos}	*BranchStmt	3421
2229	ast	End	{}	{token.Pos}	*BranchStmt	3421
2230	ast	Pos	{}	{token.Pos}	*BlockStmt	3422
2231	ast	End	{}	{token.Pos}	*BlockStmt	3422
2232	ast	Pos	{}	{token.Pos}	*IfStmt	3423
2233	ast	End	{}	{token.Pos}	*IfStmt	3423
2234	ast	Pos	{}	{token.Pos}	*CaseClause	3424
2235	ast	End	{}	{token.Pos}	*CaseClause	3424
2236	ast	Pos	{}	{token.Pos}	*SwitchStmt	3425
2237	ast	End	{}	{token.Pos}	*SwitchStmt	3425
2238	ast	Pos	{}	{token.Pos}	*TypeSwitchStmt	3426
2239	ast	End	{}	{token.Pos}	*TypeSwitchStmt	3426
2240	ast	Pos	{}	{token.Pos}	*CommClause	3427
2241	ast	End	{}	{token.Pos}	*CommClause	3427
2242	ast	Pos	{}	{token.Pos}	*SelectStmt	3428
2243	ast	End	{}	{token.Pos}	*SelectStmt	3428
2244	ast	Pos	{}	{token.Pos}	*ForStmt	3429
2245	ast	End	{}	{token.Pos}	*ForStmt	3429
2246	ast	Pos	{}	{token.Pos}	*RangeStmt	3430
2247	ast	End	{}	{token.Pos}	*RangeStmt	3430
2248	ast	Pos	{}	{token.Pos}	*ImportSpec	3432
2249	ast	End	{}	{token.Pos}	*ImportSpec	3432
2250	ast	Pos	{}	{token.Pos}	*ValueSpec	3433
2251	ast	End	{}	{token.Pos}	*ValueSpec	3433
2252	ast	Pos	{}	{token.Pos}	*TypeSpec	3434
2253	ast	End	{}	{token.Pos}	*TypeSpec	3434
2254	ast	Pos	{}	{token.Pos}	*BadDecl	3435
2255	ast	End	{}	{token.Pos}	*BadDecl	3435
2256	ast	Pos	{}	{token.Pos}	*GenDecl	3436
2257	ast	End	{}	{token.Pos}	*GenDecl	3436
2258	ast	Pos	{}	{token.Pos}	*FuncDecl	3437
2259	ast	End	{}	{token.Pos}	*FuncDecl	3437
2260	ast	Pos	{}	{token.Pos}	*File	3438
2261	ast	End	{}	{token.Pos}	*File	3438
2262	ast	Pos	{}	{token.Pos}	*Package	3439
2263	ast	End	{}	{token.Pos}	*Package	3439
2264	ast	Update	{ast.Node,ast.Node}	{ast.Node}	CommentMap	3440
2670	poll	ReadUnlock	{}	{}	*FD	3721
2265	ast	Filter	{ast.Node}	{ast.CommentMap}	CommentMap	3440
2266	ast	Comments	{}	{[]*ast.CommentGroup}	CommentMap	3440
2267	ast	String	{}	{string}	CommentMap	3440
2268	ast	Lookup	{string}	{*ast.Object}	*Scope	3445
2269	ast	Insert	{*ast.Object}	{*ast.Object}	*Scope	3445
2270	ast	String	{}	{string}	*Scope	3445
2271	ast	Pos	{}	{token.Pos}	*Object	3446
2272	ast	String	{}	{string}	ObjKind	3447
2273	build	SrcDirs	{}	{[]string}	*Context	3449
2274	build	ImportDir	{string,build.ImportMode}	{*build.Package,error}	*Context	3449
2275	build	Import	{string,string,build.ImportMode}	{*build.Package,error}	*Context	3449
2276	build	MatchFile	{string,string}	{bool,error}	*Context	3449
2277	build	IsCommand	{}	{bool}	*Package	3451
2278	build	Error	{}	{string}	*NoGoError	3452
2279	build	Error	{}	{string}	*MultiplePackageError	3453
2280	doc	Filter	{doc.Filter}	{}	*Package	3456
2281	b	M	{}	{}	*T	3464
2282	testing	StartTimer	{}	{}	*B	3466
2283	testing	StopTimer	{}	{}	*B	3466
2284	testing	ResetTimer	{}	{}	*B	3466
2285	testing	SetBytes	{int64}	{}	*B	3466
2286	testing	StartTimer	{}	{}	*B	3466
2287	testing	StopTimer	{}	{}	*B	3466
2288	testing	ResetTimer	{}	{}	*B	3466
2289	testing	SetBytes	{int64}	{}	*B	3466
2290	testing	ReportAllocs	{}	{}	*B	3466
2291	testing	Run	{string,func(*testing.B)}	{bool}	*B	3466
2292	testing	RunParallel	{func(*testing.PB)}	{}	*B	3466
2293	testing	SetParallelism	{int}	{}	*B	3466
2294	testing	NsPerOp	{}	{int64}	BenchmarkResult	3467
2295	testing	String	{}	{string}	BenchmarkResult	3467
2296	testing	NsPerOp	{}	{int64}	BenchmarkResult	3467
2297	testing	AllocsPerOp	{}	{int64}	BenchmarkResult	3467
2298	testing	AllocedBytesPerOp	{}	{int64}	BenchmarkResult	3467
2299	testing	String	{}	{string}	BenchmarkResult	3467
2300	testing	MemString	{}	{string}	BenchmarkResult	3467
2301	c	M	{}	{}	*T1	3478
2302	e	M	{}	{}	T2	3487
2303	e	M	{}	{}	T3	3488
2304	e	M	{}	{}	*T4	3489
2305	e	M	{}	{}	*U1	3492
2306	e	M	{}	{}	*U2	3493
2307	e	N	{}	{}	*U3	3494
2308	e	M	{}	{}	*U4	3495
2309	e	M	{}	{}	*V4	3499
2310	e	M	{}	{}	*V6	3501
2311	testing	Parallel	{}	{}	*T	3512
2312	testing	Parallel	{}	{}	*T	3512
2313	testing	Run	{string,func(*testing.T)}	{bool}	*T	3512
2314	gccgoimporter	InitFromDriver	{string,...string}	{error}	*GccgoInstallation	3515
2315	gccgoimporter	SearchPaths	{}	{[]string}	*GccgoInstallation	3515
2316	gccgoimporter	GetImporter	{[]string,map[*types.Package]gccgoimporter.InitData}	{gccgoimporter.Importer}	*GccgoInstallation	3515
2317	escapeinfo	Read	{[]byte}	{}	*T	3545
2318	server	AMethod	{int}	{*server.Server}	*A	3549
2319	server	WriteEvents	{context.Context,int}	{error}	*FooServer	3550
2320	nointerface	Get	{}	{int}	*I	3552
2321	nointerface	Set	{int}	{}	*I	3552
2322	exports	M1	{}	{}	*T1	3556
2323	issue25301	M	{}	{}	S	3589
2324	srcimporter	Import	{string}	{*types.Package,error}	*Importer	3593
2325	srcimporter	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}	*Importer	3593
2326	printer	Fprint	{io.Writer,*token.FileSet,"interface{}"}	{error}	*Config	3596
2327	scanner	Error	{}	{string}	Error	3598
2328	scanner	Add	{token.Position,string}	{}	*ErrorList	3599
2329	scanner	Reset	{}	{}	*ErrorList	3599
2330	scanner	Len	{}	{int}	ErrorList	3599
2331	scanner	Swap	{int,int}	{}	ErrorList	3599
2332	scanner	Less	{int,int}	{bool}	ErrorList	3599
2333	scanner	Sort	{}	{}	ErrorList	3599
2334	scanner	RemoveMultiples	{}	{}	*ErrorList	3599
2335	scanner	Error	{}	{string}	ErrorList	3599
2336	scanner	Err	{}	{error}	ErrorList	3599
2406	types	String	{}	{string}	*Builtin	3625
2337	scanner	Init	{*token.File,[]byte,scanner.ErrorHandler,scanner.Mode}	{}	*Scanner	3601
2338	scanner	Scan	{}	{token.Pos,token.Token,string}	*Scanner	3601
2339	scanner	Init	{io.Reader}	{*scanner.Scanner}	*Scanner	3601
2340	scanner	Next	{}	{rune}	*Scanner	3601
2341	scanner	Peek	{}	{rune}	*Scanner	3601
2342	scanner	Scan	{}	{rune}	*Scanner	3601
2343	scanner	Pos	{}	{scanner.Position}	*Scanner	3601
2344	scanner	TokenText	{}	{string}	*Scanner	3601
2345	token	IsValid	{}	{bool}	*Position	3603
2346	token	String	{}	{string}	Position	3603
2347	token	IsValid	{}	{bool}	Pos	3604
2348	token	Name	{}	{string}	*File	3605
2349	token	Base	{}	{int}	*File	3605
2350	token	Size	{}	{int}	*File	3605
2351	token	LineCount	{}	{int}	*File	3605
2352	token	AddLine	{int}	{}	*File	3605
2353	token	MergeLine	{int}	{}	*File	3605
2354	token	SetLines	{[]int}	{bool}	*File	3605
2355	token	SetLinesForContent	{[]byte}	{}	*File	3605
2356	token	LineStart	{int}	{token.Pos}	*File	3605
2357	token	AddLineInfo	{int,string,int}	{}	*File	3605
2358	token	AddLineColumnInfo	{int,string,int,int}	{}	*File	3605
2359	token	Pos	{int}	{token.Pos}	*File	3605
2360	token	Offset	{token.Pos}	{int}	*File	3605
2361	token	Line	{token.Pos}	{int}	*File	3605
2362	token	PositionFor	{token.Pos,bool}	{token.Position}	*File	3605
2363	token	Position	{token.Pos}	{token.Position}	*File	3605
2364	token	Base	{}	{int}	*FileSet	3606
2365	token	AddFile	{string,int,int}	{*token.File}	*FileSet	3606
2366	token	Iterate	{"func(*token.File) bool"}	{}	*FileSet	3606
2367	token	File	{token.Pos}	{*token.File}	*FileSet	3606
2368	token	PositionFor	{token.Pos,bool}	{token.Position}	*FileSet	3606
2369	token	Position	{token.Pos}	{token.Position}	*FileSet	3606
2370	token	Read	{"func(interface{}) error"}	{error}	*FileSet	3606
2371	token	Write	{"func(interface{}) error"}	{error}	*FileSet	3606
2372	token	String	{}	{string}	Token	3607
2373	token	Precedence	{}	{int}	Token	3607
2374	token	IsLiteral	{}	{bool}	Token	3607
2375	token	IsOperator	{}	{bool}	Token	3607
2376	token	IsKeyword	{}	{bool}	Token	3607
2377	types	Error	{}	{string}	Error	3608
2378	types	Check	{string,*token.FileSet,[]*ast.File,*types.Info}	{*types.Package,error}	*Config	3612
2379	types	TypeOf	{ast.Expr}	{types.Type}	*Info	3613
2380	types	ObjectOf	{*ast.Ident}	{types.Object}	*Info	3613
2381	types	IsVoid	{}	{bool}	TypeAndValue	3614
2382	types	IsType	{}	{bool}	TypeAndValue	3614
2383	types	IsBuiltin	{}	{bool}	TypeAndValue	3614
2384	types	IsValue	{}	{bool}	TypeAndValue	3614
2385	types	IsNil	{}	{bool}	TypeAndValue	3614
2386	types	Addressable	{}	{bool}	TypeAndValue	3614
2387	types	Assignable	{}	{bool}	TypeAndValue	3614
2388	types	HasOk	{}	{bool}	TypeAndValue	3614
2389	types	String	{}	{string}	*Initializer	3615
2390	types	Files	{[]*ast.File}	{error}	*Checker	3616
2391	types	String	{}	{string}	*MethodSet	3617
2392	types	Len	{}	{int}	*MethodSet	3617
2393	types	At	{int}	{*types.Selection}	*MethodSet	3617
2394	types	Lookup	{*types.Package,string}	{*types.Selection}	*MethodSet	3617
2395	types	Imported	{}	{*types.Package}	*PkgName	3619
2396	types	String	{}	{string}	*PkgName	3619
2397	types	Val	{}	{constant.Value}	*Const	3620
2398	types	String	{}	{string}	*Const	3620
2399	types	IsAlias	{}	{bool}	*TypeName	3621
2400	types	String	{}	{string}	*TypeName	3621
2401	types	Anonymous	{}	{bool}	*Var	3622
2402	types	Embedded	{}	{bool}	*Var	3622
2403	types	IsField	{}	{bool}	*Var	3622
2404	types	String	{}	{string}	*Var	3622
2405	types	String	{}	{string}	*Label	3624
2408	types	Path	{}	{string}	*Package	3627
2409	types	Name	{}	{string}	*Package	3627
2410	types	SetName	{string}	{}	*Package	3627
2411	types	Scope	{}	{*types.Scope}	*Package	3627
2412	types	Complete	{}	{bool}	*Package	3627
2413	types	MarkComplete	{}	{}	*Package	3627
2414	types	Imports	{}	{[]*types.Package}	*Package	3627
2415	types	SetImports	{[]*types.Package}	{}	*Package	3627
2416	types	String	{}	{string}	*Package	3627
2417	types	Parent	{}	{*types.Scope}	*Scope	3628
2418	types	Len	{}	{int}	*Scope	3628
2419	types	Names	{}	{[]string}	*Scope	3628
2420	types	NumChildren	{}	{int}	*Scope	3628
2421	types	Child	{int}	{*types.Scope}	*Scope	3628
2422	types	Lookup	{string}	{types.Object}	*Scope	3628
2423	types	LookupParent	{string,token.Pos}	{*types.Scope,types.Object}	*Scope	3628
2424	types	Insert	{types.Object}	{types.Object}	*Scope	3628
2425	types	Pos	{}	{token.Pos}	*Scope	3628
2426	types	End	{}	{token.Pos}	*Scope	3628
2427	types	Contains	{token.Pos}	{bool}	*Scope	3628
2428	types	Innermost	{token.Pos}	{*types.Scope}	*Scope	3628
2429	types	WriteTo	{io.Writer,int,bool}	{}	*Scope	3628
2430	types	String	{}	{string}	*Scope	3628
2431	types	Kind	{}	{types.SelectionKind}	*Selection	3630
2432	types	Recv	{}	{types.Type}	*Selection	3630
2433	types	Obj	{}	{types.Object}	*Selection	3630
2434	types	Type	{}	{types.Type}	*Selection	3630
2435	types	Index	{}	{[]int}	*Selection	3630
2436	types	Indirect	{}	{bool}	*Selection	3630
2437	types	String	{}	{string}	*Selection	3630
2438	types	Alignof	{types.Type}	{int64}	*StdSizes	3632
2439	types	Offsetsof	{[]*types.Var}	{[]int64}	*StdSizes	3632
2440	types	Sizeof	{types.Type}	{int64}	*StdSizes	3632
2441	types	Kind	{}	{types.BasicKind}	*Basic	3636
2442	types	Info	{}	{types.BasicInfo}	*Basic	3636
2443	types	Name	{}	{string}	*Basic	3636
2444	types	Underlying	{}	{types.Type}	*Basic	3636
2445	types	String	{}	{string}	*Basic	3636
2446	types	Elem	{}	{types.Type}	*Pointer	3640
2447	types	Underlying	{}	{types.Type}	*Pointer	3640
2448	types	String	{}	{string}	*Pointer	3640
2449	types	Recv	{}	{*types.Var}	*Signature	3642
2450	types	Params	{}	{*types.Tuple}	*Signature	3642
2451	types	Results	{}	{*types.Tuple}	*Signature	3642
2452	types	Variadic	{}	{bool}	*Signature	3642
2453	types	Underlying	{}	{types.Type}	*Signature	3642
2454	types	String	{}	{string}	*Signature	3642
2455	types	Obj	{}	{*types.TypeName}	*Named	3647
2456	types	NumMethods	{}	{int}	*Named	3647
2457	types	Method	{int}	{*types.Func}	*Named	3647
2458	types	SetUnderlying	{types.Type}	{}	*Named	3647
2459	types	AddMethod	{*types.Func}	{}	*Named	3647
2460	types	Underlying	{}	{types.Type}	*Named	3647
2461	types	String	{}	{string}	*Named	3647
2462	template	Error	{}	{string}	*Error	3661
2463	template	Templates	{}	{[]*template.Template}	*Template	3663
2464	template	Option	{...string}	{*template.Template}	*Template	3663
2465	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	3663
2466	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	3663
2467	template	DefinedTemplates	{}	{string}	*Template	3663
2468	template	Parse	{string}	{*template.Template,error}	*Template	3663
2469	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	3663
2470	template	Clone	{}	{*template.Template,error}	*Template	3663
2471	template	New	{string}	{*template.Template}	*Template	3663
2472	template	Name	{}	{string}	*Template	3663
2473	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	3663
2474	template	Delims	{string,string}	{*template.Template}	*Template	3663
2475	template	Lookup	{string}	{*template.Template}	*Template	3663
2476	template	ParseFiles	{...string}	{*template.Template,error}	*Template	3663
2477	template	ParseGlob	{string}	{*template.Template,error}	*Template	3663
2478	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	3663
2479	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	3663
2480	template	DefinedTemplates	{}	{string}	*Template	3663
2481	template	ParseFiles	{...string}	{*template.Template,error}	*Template	3663
2482	template	ParseGlob	{string}	{*template.Template,error}	*Template	3663
2483	template	Option	{...string}	{*template.Template}	*Template	3663
2484	template	Name	{}	{string}	*Template	3663
2485	template	New	{string}	{*template.Template}	*Template	3663
2486	template	Clone	{}	{*template.Template,error}	*Template	3663
2487	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	3663
2488	template	Templates	{}	{[]*template.Template}	*Template	3663
2489	template	Delims	{string,string}	{*template.Template}	*Template	3663
2490	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	3663
2491	template	Lookup	{string}	{*template.Template}	*Template	3663
2492	template	Parse	{string}	{*template.Template,error}	*Template	3663
2493	color	RGBA	{}	{uint32}	RGBA	3666
2494	color	RGBA	{}	{uint32}	RGBA64	3667
2495	color	RGBA	{}	{uint32}	NRGBA	3668
2496	color	RGBA	{}	{uint32}	NRGBA64	3669
2497	color	RGBA	{}	{uint32}	Alpha	3670
2498	color	RGBA	{}	{uint32}	Alpha16	3671
2499	color	RGBA	{}	{uint32}	Gray	3672
2500	color	RGBA	{}	{uint32}	Gray16	3673
2501	color	Convert	{color.Color}	{color.Color}	Palette	3675
2502	color	Index	{color.Color}	{int}	Palette	3675
2503	color	RGBA	{}	{uint32,uint32,uint32,uint32}	YCbCr	3676
2504	color	RGBA	{}	{uint32,uint32,uint32,uint32}	NYCbCrA	3677
2505	color	RGBA	{}	{uint32,uint32,uint32,uint32}	CMYK	3678
2506	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}	Op	3681
2507	image	String	{}	{string}	Point	3683
2508	image	Add	{image.Point}	{image.Point}	Point	3683
2509	image	Sub	{image.Point}	{image.Point}	Point	3683
2510	image	Mul	{int}	{image.Point}	Point	3683
2511	image	Div	{int}	{image.Point}	Point	3683
2512	image	In	{image.Rectangle}	{bool}	Point	3683
2513	image	Mod	{image.Rectangle}	{image.Point}	Point	3683
2514	image	Eq	{image.Point}	{bool}	Point	3683
2515	image	String	{}	{string}	Rectangle	3684
2516	image	Dx	{}	{int}	Rectangle	3684
2517	image	Dy	{}	{int}	Rectangle	3684
2518	image	Size	{}	{image.Point}	Rectangle	3684
2519	image	Add	{image.Point}	{image.Rectangle}	Rectangle	3684
2520	image	Sub	{image.Point}	{image.Rectangle}	Rectangle	3684
2521	image	Inset	{int}	{image.Rectangle}	Rectangle	3684
2522	image	Intersect	{image.Rectangle}	{image.Rectangle}	Rectangle	3684
2523	image	Union	{image.Rectangle}	{image.Rectangle}	Rectangle	3684
2524	image	Empty	{}	{bool}	Rectangle	3684
2525	image	Eq	{image.Rectangle}	{bool}	Rectangle	3684
2526	image	Overlaps	{image.Rectangle}	{bool}	Rectangle	3684
2527	image	In	{image.Rectangle}	{bool}	Rectangle	3684
2528	image	Canon	{}	{image.Rectangle}	Rectangle	3684
2529	image	At	{int,int}	{color.Color}	Rectangle	3684
2530	image	Bounds	{}	{image.Rectangle}	Rectangle	3684
2531	image	ColorModel	{}	{color.Model}	Rectangle	3684
2532	image	ColorModel	{}	{color.Model}	*RGBA	3690
2533	image	Bounds	{}	{image.Rectangle}	*RGBA	3690
2534	image	At	{int,int}	{color.Color}	*RGBA	3690
2535	image	RGBAAt	{int,int}	{color.RGBA}	*RGBA	3690
2536	image	PixOffset	{int,int}	{int}	*RGBA	3690
2537	image	Set	{int,int,color.Color}	{}	*RGBA	3690
2538	image	SetRGBA	{int,int,color.RGBA}	{}	*RGBA	3690
2539	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA	3690
2540	image	Opaque	{}	{bool}	*RGBA	3690
2541	image	ColorModel	{}	{color.Model}	*RGBA64	3691
2542	image	Bounds	{}	{image.Rectangle}	*RGBA64	3691
2543	image	At	{int,int}	{color.Color}	*RGBA64	3691
2544	image	RGBA64At	{int,int}	{color.RGBA64}	*RGBA64	3691
2545	image	PixOffset	{int,int}	{int}	*RGBA64	3691
2546	image	Set	{int,int,color.Color}	{}	*RGBA64	3691
2547	image	SetRGBA64	{int,int,color.RGBA64}	{}	*RGBA64	3691
2548	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA64	3691
2549	image	Opaque	{}	{bool}	*RGBA64	3691
2550	image	ColorModel	{}	{color.Model}	*NRGBA	3692
2551	image	Bounds	{}	{image.Rectangle}	*NRGBA	3692
2552	image	At	{int,int}	{color.Color}	*NRGBA	3692
2553	image	NRGBAAt	{int,int}	{color.NRGBA}	*NRGBA	3692
2554	image	PixOffset	{int,int}	{int}	*NRGBA	3692
2555	image	Set	{int,int,color.Color}	{}	*NRGBA	3692
2556	image	SetNRGBA	{int,int,color.NRGBA}	{}	*NRGBA	3692
2557	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA	3692
2558	image	Opaque	{}	{bool}	*NRGBA	3692
2559	image	ColorModel	{}	{color.Model}	*NRGBA64	3693
2560	image	Bounds	{}	{image.Rectangle}	*NRGBA64	3693
2561	image	At	{int,int}	{color.Color}	*NRGBA64	3693
2562	image	NRGBA64At	{int,int}	{color.NRGBA64}	*NRGBA64	3693
2563	image	PixOffset	{int,int}	{int}	*NRGBA64	3693
2564	image	Set	{int,int,color.Color}	{}	*NRGBA64	3693
2565	image	SetNRGBA64	{int,int,color.NRGBA64}	{}	*NRGBA64	3693
2566	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA64	3693
2567	image	Opaque	{}	{bool}	*NRGBA64	3693
2568	image	ColorModel	{}	{color.Model}	*Alpha	3694
2569	image	Bounds	{}	{image.Rectangle}	*Alpha	3694
2570	image	At	{int,int}	{color.Color}	*Alpha	3694
2571	image	AlphaAt	{int,int}	{color.Alpha}	*Alpha	3694
2572	image	PixOffset	{int,int}	{int}	*Alpha	3694
2573	image	Set	{int,int,color.Color}	{}	*Alpha	3694
2574	image	SetAlpha	{int,int,color.Alpha}	{}	*Alpha	3694
2575	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha	3694
2576	image	Opaque	{}	{bool}	*Alpha	3694
2577	image	ColorModel	{}	{color.Model}	*Alpha16	3695
2578	image	Bounds	{}	{image.Rectangle}	*Alpha16	3695
2579	image	At	{int,int}	{color.Color}	*Alpha16	3695
2580	image	Alpha16At	{int,int}	{color.Alpha16}	*Alpha16	3695
2581	image	PixOffset	{int,int}	{int}	*Alpha16	3695
2582	image	Set	{int,int,color.Color}	{}	*Alpha16	3695
2583	image	SetAlpha16	{int,int,color.Alpha16}	{}	*Alpha16	3695
2584	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha16	3695
2585	image	Opaque	{}	{bool}	*Alpha16	3695
2586	image	ColorModel	{}	{color.Model}	*Gray	3696
2587	image	Bounds	{}	{image.Rectangle}	*Gray	3696
2588	image	At	{int,int}	{color.Color}	*Gray	3696
2589	image	GrayAt	{int,int}	{color.Gray}	*Gray	3696
2590	image	PixOffset	{int,int}	{int}	*Gray	3696
2591	image	Set	{int,int,color.Color}	{}	*Gray	3696
2592	image	SetGray	{int,int,color.Gray}	{}	*Gray	3696
2593	image	SubImage	{image.Rectangle}	{image.Image}	*Gray	3696
2594	image	Opaque	{}	{bool}	*Gray	3696
2595	image	ColorModel	{}	{color.Model}	*Gray16	3697
2596	image	Bounds	{}	{image.Rectangle}	*Gray16	3697
2597	image	At	{int,int}	{color.Color}	*Gray16	3697
2598	image	Gray16At	{int,int}	{color.Gray16}	*Gray16	3697
2599	image	PixOffset	{int,int}	{int}	*Gray16	3697
2600	image	Set	{int,int,color.Color}	{}	*Gray16	3697
2601	image	SetGray16	{int,int,color.Gray16}	{}	*Gray16	3697
2602	image	SubImage	{image.Rectangle}	{image.Image}	*Gray16	3697
2603	image	Opaque	{}	{bool}	*Gray16	3697
2604	image	ColorModel	{}	{color.Model}	*CMYK	3698
2605	image	Bounds	{}	{image.Rectangle}	*CMYK	3698
2606	image	At	{int,int}	{color.Color}	*CMYK	3698
2607	image	CMYKAt	{int,int}	{color.CMYK}	*CMYK	3698
2608	image	PixOffset	{int,int}	{int}	*CMYK	3698
2609	image	Set	{int,int,color.Color}	{}	*CMYK	3698
2610	image	SetCMYK	{int,int,color.CMYK}	{}	*CMYK	3698
2611	image	SubImage	{image.Rectangle}	{image.Image}	*CMYK	3698
2612	image	Opaque	{}	{bool}	*CMYK	3698
2613	image	ColorModel	{}	{color.Model}	*Paletted	3699
2614	image	Bounds	{}	{image.Rectangle}	*Paletted	3699
2615	image	At	{int,int}	{color.Color}	*Paletted	3699
2616	image	PixOffset	{int,int}	{int}	*Paletted	3699
2617	image	Set	{int,int,color.Color}	{}	*Paletted	3699
2618	image	ColorIndexAt	{int,int}	{uint8}	*Paletted	3699
2619	image	SetColorIndex	{int,int,uint8}	{}	*Paletted	3699
2620	image	SubImage	{image.Rectangle}	{image.Image}	*Paletted	3699
2621	image	Opaque	{}	{bool}	*Paletted	3699
2622	jpeg	Error	{}	{string}	FormatError	3700
2623	jpeg	Error	{}	{string}	UnsupportedError	3701
2624	image	RGBA	{}	{uint32}	*Uniform	3704
2625	image	ColorModel	{}	{color.Model}	*Uniform	3704
2626	image	Convert	{color.Color}	{color.Color}	*Uniform	3704
2627	image	Bounds	{}	{image.Rectangle}	*Uniform	3704
2628	image	At	{int,int}	{color.Color}	*Uniform	3704
2629	image	Opaque	{}	{bool}	*Uniform	3704
2630	png	Error	{}	{string}	FormatError	3705
2631	png	Error	{}	{string}	UnsupportedError	3706
2632	png	Encode	{io.Writer,image.Image}	{error}	*Encoder	3707
2633	image	String	{}	{string}	YCbCrSubsampleRatio	3711
2634	image	ColorModel	{}	{color.Model}	*YCbCr	3712
2635	image	Bounds	{}	{image.Rectangle}	*YCbCr	3712
2636	image	At	{int,int}	{color.Color}	*YCbCr	3712
2637	image	YCbCrAt	{int,int}	{color.YCbCr}	*YCbCr	3712
2638	image	YOffset	{int,int}	{int}	*YCbCr	3712
2639	image	COffset	{int,int}	{int}	*YCbCr	3712
2640	image	SubImage	{image.Rectangle}	{image.Image}	*YCbCr	3712
2641	image	Opaque	{}	{bool}	*YCbCr	3712
2642	image	ColorModel	{}	{color.Model}	*NYCbCrA	3713
2643	image	At	{int,int}	{color.Color}	*NYCbCrA	3713
2644	image	NYCbCrAAt	{int,int}	{color.NYCbCrA}	*NYCbCrA	3713
2645	image	AOffset	{int,int}	{int}	*NYCbCrA	3713
2646	image	SubImage	{image.Rectangle}	{image.Image}	*NYCbCrA	3713
2647	image	Opaque	{}	{bool}	*NYCbCrA	3713
2648	suffixarray	Read	{io.Reader}	{error}	*Index	3714
2649	suffixarray	Write	{io.Writer}	{error}	*Index	3714
2650	suffixarray	Bytes	{}	{[]byte}	*Index	3714
2651	suffixarray	Lookup	{[]byte,int}	{[]int}	*Index	3714
2652	suffixarray	FindAllIndex	{*regexp.Regexp,int}	{[][]int}	*Index	3714
2653	fmtsort	Len	{}	{int}	*SortedMap	3716
2654	fmtsort	Less	{int,int}	{bool}	*SortedMap	3716
2655	fmtsort	Swap	{int,int}	{}	*SortedMap	3716
2656	poll	Error	{}	{string}	*TimeoutError	3720
2657	poll	Timeout	{}	{bool}	*TimeoutError	3720
2658	poll	Temporary	{}	{bool}	*TimeoutError	3720
2659	poll	Fsync	{}	{error}	*FD	3721
2660	poll	Fsync	{}	{error}	*FD	3721
2661	poll	Fsync	{}	{error}	*FD	3721
2662	poll	OpenDir	{}	{uintptr,string,error}	*FD	3721
2663	poll	Close	{}	{error}	*FD	3721
2664	poll	Read	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	3721
2665	poll	Write	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	3721
2666	poll	SetDeadline	{time.Time}	{error}	*FD	3721
2667	poll	SetReadDeadline	{time.Time}	{error}	*FD	3721
2668	poll	SetWriteDeadline	{time.Time}	{error}	*FD	3721
2669	poll	ReadLock	{}	{error}	*FD	3721
2671	poll	RawControl	{func(uintptr)}	{error}	*FD	3721
2672	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	3721
2673	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	3721
2674	poll	SetDeadline	{time.Time}	{error}	*FD	3721
2675	poll	SetReadDeadline	{time.Time}	{error}	*FD	3721
2676	poll	SetWriteDeadline	{time.Time}	{error}	*FD	3721
2677	poll	SetDeadline	{time.Time}	{error}	*FD	3721
2678	poll	SetReadDeadline	{time.Time}	{error}	*FD	3721
2679	poll	SetWriteDeadline	{time.Time}	{error}	*FD	3721
2680	poll	Fchmod	{uint32}	{error}	*FD	3721
2681	poll	Fchown	{int,int}	{error}	*FD	3721
2682	poll	Ftruncate	{int64}	{error}	*FD	3721
2683	poll	Init	{string,bool}	{error}	*FD	3721
2684	poll	Close	{}	{error}	*FD	3721
2685	poll	Shutdown	{int}	{error}	*FD	3721
2686	poll	SetBlocking	{}	{error}	*FD	3721
2687	poll	Read	{[]byte}	{int,error}	*FD	3721
2688	poll	Pread	{[]byte,int64}	{int,error}	*FD	3721
2689	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	3721
2690	poll	ReadMsg	{[]byte,[]byte}	{int,int,int,syscall.Sockaddr,error}	*FD	3721
2691	poll	Write	{[]byte}	{int,error}	*FD	3721
2692	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	3721
2693	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	3721
2694	poll	WriteMsg	{[]byte,[]byte,syscall.Sockaddr}	{int,int,error}	*FD	3721
2695	poll	Accept	{}	{int,syscall.Sockaddr,string,error}	*FD	3721
2696	poll	Seek	{int64,int}	{int64,error}	*FD	3721
2697	poll	ReadDirent	{[]byte}	{int,error}	*FD	3721
2698	poll	Fchdir	{}	{error}	*FD	3721
2699	poll	Fstat	{*syscall.Stat_t}	{error}	*FD	3721
2700	poll	Dup	{}	{int,string,error}	*FD	3721
2701	poll	WaitWrite	{}	{error}	*FD	3721
2702	poll	WriteOnce	{[]byte}	{int,error}	*FD	3721
2703	poll	RawControl	{func(uintptr)}	{error}	*FD	3721
2704	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	3721
2705	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	3721
2706	poll	Init	{string,bool}	{string,error}	*FD	3721
2707	poll	Close	{}	{error}	*FD	3721
2708	poll	Shutdown	{int}	{error}	*FD	3721
2709	poll	Read	{[]byte}	{int,error}	*FD	3721
2710	poll	Pread	{[]byte,int64}	{int,error}	*FD	3721
2711	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	3721
2712	poll	Write	{[]byte}	{int,error}	*FD	3721
2713	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	3721
2714	poll	Writev	{*[][]byte}	{int64,error}	*FD	3721
2715	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	3721
2716	poll	ConnectEx	{syscall.Sockaddr}	{error}	*FD	3721
2717	poll	Accept	{"func() (syscall.Handle, error)"}	{syscall.Handle,[]syscall.RawSockaddrAny,uint32,string,error}	*FD	3721
2718	poll	Seek	{int64,int}	{int64,error}	*FD	3721
2719	poll	FindNextFile	{*syscall.Win32finddata}	{error}	*FD	3721
2720	poll	Fchdir	{}	{error}	*FD	3721
2721	poll	GetFileType	{}	{uint32,error}	*FD	3721
2722	poll	GetFileInformationByHandle	{*syscall.ByHandleFileInformation}	{error}	*FD	3721
2723	poll	RawControl	{func(uintptr)}	{error}	*FD	3721
2724	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	3721
2725	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	3721
2726	poll	ReadMsg	{[]byte,[]byte}	{int,int,int,syscall.Sockaddr,error}	*FD	3721
2727	poll	WriteMsg	{[]byte,[]byte,syscall.Sockaddr}	{int,int,error}	*FD	3721
2728	poll	SetsockoptInt	{int,int,int}	{error}	*FD	3721
2729	poll	SetsockoptInet4Addr	{int,int,[]byte}	{error}	*FD	3721
2730	poll	SetsockoptLinger	{int,int,*syscall.Linger}	{error}	*FD	3721
2731	poll	SetsockoptIPMreqn	{int,int,*syscall.IPMreqn}	{error}	*FD	3721
2732	poll	SetsockoptByte	{int,int,byte}	{error}	*FD	3721
2733	poll	Setsockopt	{int32,int32,*byte,int32}	{error}	*FD	3721
2734	poll	WSAIoctl	{uint32,*byte,uint32,*byte,uint32,*uint32,*syscall.Overlapped,uintptr}	{error}	*FD	3721
2735	poll	SetsockoptIPMreq	{int,int,*syscall.IPMreq}	{error}	*FD	3721
2736	poll	SetsockoptIPv6Mreq	{int,int,*syscall.IPv6Mreq}	{error}	*FD	3721
2737	poll	Writev	{*[][]byte}	{int64,error}	*FD	3721
2738	singleflight	Do	{string,"func() (interface{}, error)"}	{"interface{}",error,bool}	*Group	3724
2739	singleflight	DoChan	{string,"func() (interface{}, error)"}	{"chan singleflight.Result\n",bool}	*Group	3724
2740	singleflight	ForgetUnshared	{string}	{bool}	*Group	3724
2741	windows	Size	{}	{uint32}	*TOKEN_MANDATORY_LABEL	3738
2742	trace	MMU	{time.Duration}	{float64}	*MMUCurve	3755
2743	trace	Examples	{time.Duration,int}	{[]trace.UtilWindow}	*MMUCurve	3755
2744	trace	MUD	{time.Duration,[]float64}	{[]float64}	*MMUCurve	3755
2745	trace	String	{}	{string}	*Event	3760
2746	trace	Emit	{byte,...uint64}	{}	*Writer	3764
2747	asn1	Constructed	{}	{asn1.Tag}	Tag	3765
2748	asn1	ContextSpecific	{}	{asn1.Tag}	Tag	3765
2749	cryptobyte	AddASN1Int64	{int64}	{}	*Builder	3766
2750	cryptobyte	AddASN1Int64WithTag	{int64,asn1.Tag}	{}	*Builder	3766
2751	cryptobyte	AddASN1Enum	{int64}	{}	*Builder	3766
2752	cryptobyte	AddASN1Uint64	{uint64}	{}	*Builder	3766
2753	cryptobyte	AddASN1BigInt	{*big.Int}	{}	*Builder	3766
2754	cryptobyte	AddASN1OctetString	{[]byte}	{}	*Builder	3766
2755	cryptobyte	AddASN1GeneralizedTime	{time.Time}	{}	*Builder	3766
2756	cryptobyte	AddASN1BitString	{[]byte}	{}	*Builder	3766
2757	cryptobyte	AddASN1ObjectIdentifier	{encoding_asn1.ObjectIdentifier}	{}	*Builder	3766
2758	cryptobyte	AddASN1Boolean	{bool}	{}	*Builder	3766
2759	cryptobyte	AddASN1NULL	{}	{}	*Builder	3766
2760	cryptobyte	MarshalASN1	{"interface{}"}	{}	*Builder	3766
2761	cryptobyte	AddASN1	{asn1.Tag,cryptobyte.BuilderContinuation}	{}	*Builder	3766
2762	cryptobyte	Bytes	{}	{[]byte,error}	*Builder	3766
2763	cryptobyte	BytesOrPanic	{}	{[]byte}	*Builder	3766
2764	cryptobyte	AddUint8	{uint8}	{}	*Builder	3766
2765	cryptobyte	AddUint16	{uint16}	{}	*Builder	3766
2766	cryptobyte	AddUint24	{uint32}	{}	*Builder	3766
2767	cryptobyte	AddUint32	{uint32}	{}	*Builder	3766
2768	cryptobyte	AddBytes	{[]byte}	{}	*Builder	3766
2769	cryptobyte	AddUint8LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	3766
2770	cryptobyte	AddUint16LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	3766
2771	cryptobyte	AddUint24LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	3766
2772	cryptobyte	AddUint32LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	3766
2773	cryptobyte	AddValue	{cryptobyte.MarshalingValue}	{}	*Builder	3766
2774	cryptobyte	ReadASN1Boolean	{*bool}	{bool}	*String	3770
2775	cryptobyte	ReadASN1Integer	{"interface{}"}	{bool}	*String	3770
2776	cryptobyte	ReadASN1Int64WithTag	{*int64,asn1.Tag}	{bool}	*String	3770
2777	cryptobyte	ReadASN1Enum	{*int}	{bool}	*String	3770
2778	cryptobyte	ReadASN1ObjectIdentifier	{*encoding_asn1.ObjectIdentifier}	{bool}	*String	3770
2779	cryptobyte	ReadASN1GeneralizedTime	{*time.Time}	{bool}	*String	3770
2780	cryptobyte	ReadASN1BitString	{*encoding_asn1.BitString}	{bool}	*String	3770
2781	cryptobyte	ReadASN1BitStringAsBytes	{*[]byte}	{bool}	*String	3770
2782	cryptobyte	ReadASN1Bytes	{*[]byte,asn1.Tag}	{bool}	*String	3770
2783	cryptobyte	ReadASN1	{*cryptobyte.String,asn1.Tag}	{bool}	*String	3770
2784	cryptobyte	ReadASN1Element	{*cryptobyte.String,asn1.Tag}	{bool}	*String	3770
2785	cryptobyte	ReadAnyASN1	{*cryptobyte.String,*asn1.Tag}	{bool}	*String	3770
2786	cryptobyte	ReadAnyASN1Element	{*cryptobyte.String,*asn1.Tag}	{bool}	*String	3770
2787	cryptobyte	PeekASN1Tag	{asn1.Tag}	{bool}	String	3770
2788	cryptobyte	SkipASN1	{asn1.Tag}	{bool}	*String	3770
2789	cryptobyte	ReadOptionalASN1	{*cryptobyte.String,*bool,asn1.Tag}	{bool}	*String	3770
2790	cryptobyte	SkipOptionalASN1	{asn1.Tag}	{bool}	*String	3770
2791	cryptobyte	ReadOptionalASN1Integer	{"interface{}",asn1.Tag,"interface{}"}	{bool}	*String	3770
2792	cryptobyte	ReadOptionalASN1OctetString	{*[]byte,*bool,asn1.Tag}	{bool}	*String	3770
2793	cryptobyte	ReadOptionalASN1Boolean	{*bool,bool}	{bool}	*String	3770
2794	cryptobyte	Skip	{int}	{bool}	*String	3770
2795	cryptobyte	ReadUint8	{*uint8}	{bool}	*String	3770
2796	cryptobyte	ReadUint16	{*uint16}	{bool}	*String	3770
2797	cryptobyte	ReadUint24	{*uint32}	{bool}	*String	3770
2798	cryptobyte	ReadUint32	{*uint32}	{bool}	*String	3770
2799	cryptobyte	ReadUint8LengthPrefixed	{*cryptobyte.String}	{bool}	*String	3770
2800	cryptobyte	ReadUint16LengthPrefixed	{*cryptobyte.String}	{bool}	*String	3770
2801	cryptobyte	ReadUint24LengthPrefixed	{*cryptobyte.String}	{bool}	*String	3770
2802	cryptobyte	ReadBytes	{*[]byte,int}	{bool}	*String	3770
2803	cryptobyte	CopyBytes	{[]byte}	{bool}	*String	3770
2804	cryptobyte	Empty	{}	{bool}	String	3770
2805	chacha20	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	3771
2806	chacha20	Advance	{}	{}	*Cipher	3771
2807	dnsmessage	Unpack	{[]byte}	{error}	*Message	3777
2808	dnsmessage	Pack	{}	{[]byte,error}	*Message	3777
2809	dnsmessage	AppendPack	{[]byte}	{[]byte,error}	*Message	3777
2810	dnsmessage	Start	{[]byte}	{dnsmessage.Header,error}	*Parser	3780
2811	dnsmessage	Question	{}	{dnsmessage.Question,error}	*Parser	3780
2812	dnsmessage	AllQuestions	{}	{[]dnsmessage.Question,error}	*Parser	3780
2813	dnsmessage	SkipQuestion	{}	{error}	*Parser	3780
2814	dnsmessage	SkipAllQuestions	{}	{error}	*Parser	3780
2815	dnsmessage	AnswerHeader	{}	{dnsmessage.ResourceHeader,error}	*Parser	3780
2816	dnsmessage	Answer	{}	{dnsmessage.Resource,error}	*Parser	3780
2817	dnsmessage	AllAnswers	{}	{[]dnsmessage.Resource,error}	*Parser	3780
2818	dnsmessage	SkipAnswer	{}	{error}	*Parser	3780
2819	dnsmessage	SkipAllAnswers	{}	{error}	*Parser	3780
2820	dnsmessage	AuthorityHeader	{}	{dnsmessage.ResourceHeader,error}	*Parser	3780
2821	dnsmessage	Authority	{}	{dnsmessage.Resource,error}	*Parser	3780
2822	dnsmessage	AllAuthorities	{}	{[]dnsmessage.Resource,error}	*Parser	3780
2823	dnsmessage	SkipAuthority	{}	{error}	*Parser	3780
2824	dnsmessage	SkipAllAuthorities	{}	{error}	*Parser	3780
2825	dnsmessage	AdditionalHeader	{}	{dnsmessage.ResourceHeader,error}	*Parser	3780
2826	dnsmessage	Additional	{}	{dnsmessage.Resource,error}	*Parser	3780
2827	dnsmessage	AllAdditionals	{}	{[]dnsmessage.Resource,error}	*Parser	3780
2828	dnsmessage	SkipAdditional	{}	{error}	*Parser	3780
2829	dnsmessage	SkipAllAdditionals	{}	{error}	*Parser	3780
2830	dnsmessage	CNAMEResource	{}	{dnsmessage.CNAMEResource,error}	*Parser	3780
2831	dnsmessage	MXResource	{}	{dnsmessage.MXResource,error}	*Parser	3780
2832	dnsmessage	NSResource	{}	{dnsmessage.NSResource,error}	*Parser	3780
2833	dnsmessage	PTRResource	{}	{dnsmessage.PTRResource,error}	*Parser	3780
2834	dnsmessage	SOAResource	{}	{dnsmessage.SOAResource,error}	*Parser	3780
2835	dnsmessage	TXTResource	{}	{dnsmessage.TXTResource,error}	*Parser	3780
2836	dnsmessage	SRVResource	{}	{dnsmessage.SRVResource,error}	*Parser	3780
2837	dnsmessage	AResource	{}	{dnsmessage.AResource,error}	*Parser	3780
2838	dnsmessage	AAAAResource	{}	{dnsmessage.AAAAResource,error}	*Parser	3780
2839	dnsmessage	EnableCompression	{}	{}	*Builder	3781
2840	dnsmessage	StartQuestions	{}	{error}	*Builder	3781
2841	dnsmessage	StartAnswers	{}	{error}	*Builder	3781
2842	dnsmessage	StartAuthorities	{}	{error}	*Builder	3781
2843	dnsmessage	StartAdditionals	{}	{error}	*Builder	3781
2844	dnsmessage	Question	{dnsmessage.Question}	{error}	*Builder	3781
2845	dnsmessage	CNAMEResource	{dnsmessage.ResourceHeader,dnsmessage.CNAMEResource}	{error}	*Builder	3781
2846	dnsmessage	MXResource	{dnsmessage.ResourceHeader,dnsmessage.MXResource}	{error}	*Builder	3781
3916	syscall	SetLen	{int}	{}	*Iovec	4372
2847	dnsmessage	NSResource	{dnsmessage.ResourceHeader,dnsmessage.NSResource}	{error}	*Builder	3781
2848	dnsmessage	PTRResource	{dnsmessage.ResourceHeader,dnsmessage.PTRResource}	{error}	*Builder	3781
2849	dnsmessage	SOAResource	{dnsmessage.ResourceHeader,dnsmessage.SOAResource}	{error}	*Builder	3781
2850	dnsmessage	TXTResource	{dnsmessage.ResourceHeader,dnsmessage.TXTResource}	{error}	*Builder	3781
2851	dnsmessage	SRVResource	{dnsmessage.ResourceHeader,dnsmessage.SRVResource}	{error}	*Builder	3781
2852	dnsmessage	AResource	{dnsmessage.ResourceHeader,dnsmessage.AResource}	{error}	*Builder	3781
2853	dnsmessage	AAAAResource	{dnsmessage.ResourceHeader,dnsmessage.AAAAResource}	{error}	*Builder	3781
2854	dnsmessage	Finish	{}	{[]byte,error}	*Builder	3781
2855	dnsmessage	String	{}	{string}	Name	3783
2856	httpproxy	ProxyFunc	{}	{"func(*url.URL) (*url.URL, error)"}	*Config	3794
2857	hpack	WriteField	{hpack.HeaderField}	{error}	*Encoder	3795
2858	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Encoder	3795
2859	hpack	SetMaxDynamicTableSizeLimit	{uint32}	{}	*Encoder	3795
2860	hpack	Error	{}	{string}	DecodingError	3796
2861	hpack	Error	{}	{string}	InvalidIndexError	3797
2862	hpack	IsPseudo	{}	{bool}	HeaderField	3798
2863	hpack	String	{}	{string}	HeaderField	3798
2864	hpack	Size	{}	{uint32}	HeaderField	3798
2865	hpack	SetMaxStringLength	{int}	{}	*Decoder	3799
2866	hpack	SetEmitFunc	{func(hpack.HeaderField)}	{}	*Decoder	3799
2867	hpack	SetEmitEnabled	{bool}	{}	*Decoder	3799
2868	hpack	EmitEnabled	{}	{bool}	*Decoder	3799
2869	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Decoder	3799
2870	hpack	SetAllowedMaxDynamicTableSize	{uint32}	{}	*Decoder	3799
2871	hpack	DecodeFull	{[]byte}	{[]hpack.HeaderField,error}	*Decoder	3799
2872	hpack	Close	{}	{error}	*Decoder	3799
2873	hpack	Write	{[]byte}	{int,error}	*Decoder	3799
2874	idna	ToASCII	{string}	{string,error}	*Profile	3801
2875	idna	ToUnicode	{string}	{string,error}	*Profile	3801
2876	idna	String	{}	{string}	*Profile	3801
2877	lif	Family	{}	{int}	*Inet4Addr	3803
2878	lif	Family	{}	{int}	*Inet6Addr	3804
2879	route	Family	{}	{int}	*LinkAddr	3808
2880	route	Family	{}	{int}	*Inet4Addr	3809
2881	route	Family	{}	{int}	*Inet6Addr	3810
2882	route	Family	{}	{int}	*DefaultAddr	3811
2883	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3812
2884	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3812
2885	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3812
2886	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3812
2887	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3812
2888	route	Sys	{}	{[]route.Sys}	*InterfaceAddrMessage	3813
2889	route	Sys	{}	{[]route.Sys}	*InterfaceMulticastAddrMessage	3814
2890	route	Sys	{}	{[]route.Sys}	*InterfaceAnnounceMessage	3815
2891	route	Marshal	{}	{[]byte,error}	*RouteMessage	3819
2892	route	Sys	{}	{[]route.Sys}	*RouteMessage	3819
2893	route	Sys	{}	{[]route.Sys}	*RouteMessage	3819
2894	route	Sys	{}	{[]route.Sys}	*RouteMessage	3819
2895	route	Sys	{}	{[]route.Sys}	*RouteMessage	3819
2896	route	Sys	{}	{[]route.Sys}	*RouteMessage	3819
2897	route	SysType	{}	{route.SysType}	*RouteMetrics	3821
2898	route	SysType	{}	{route.SysType}	*RouteMetrics	3821
2899	route	SysType	{}	{route.SysType}	*RouteMetrics	3821
2900	route	SysType	{}	{route.SysType}	*RouteMetrics	3821
2901	route	SysType	{}	{route.SysType}	*RouteMetrics	3821
2902	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3822
2903	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3822
2904	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3822
2905	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3822
2906	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3822
2907	bidirule	Reset	{}	{}	*Transformer	3831
2908	bidirule	Transform	{[]byte,[]byte,bool}	{int,error}	*Transformer	3831
2909	bidirule	Span	{[]byte,bool}	{int,error}	*Transformer	3831
2910	transform	Reset	{}	{}	NopResetter	3834
2911	transform	Read	{[]byte}	{int,error}	*Reader	3835
2912	transform	Write	{[]byte}	{int,error}	*Writer	3836
2913	transform	Close	{}	{error}	*Writer	3836
2914	bidi	SetBytes	{[]byte,...bidi.Option}	{int,error}	*Paragraph	3839
2915	bidi	SetString	{string,...bidi.Option}	{int,error}	*Paragraph	3839
2916	bidi	IsLeftToRight	{}	{bool}	*Paragraph	3839
2917	bidi	Direction	{}	{bidi.Direction}	*Paragraph	3839
2918	bidi	RunAt	{int}	{bidi.Run}	*Paragraph	3839
2919	bidi	Order	{}	{bidi.Ordering,error}	*Paragraph	3839
2920	bidi	Line	{int,int}	{bidi.Ordering,error}	*Paragraph	3839
2921	bidi	Direction	{}	{bidi.Direction}	*Ordering	3840
2922	bidi	NumRuns	{}	{int}	*Ordering	3840
2923	bidi	Run	{int}	{bidi.Run}	*Ordering	3840
2924	bidi	String	{}	{string}	*Run	3841
2925	bidi	Bytes	{}	{[]byte}	*Run	3841
2926	bidi	Direction	{}	{bidi.Direction}	*Run	3841
2927	bidi	Pos	{}	{int}	*Run	3841
2928	bidi	Class	{}	{bidi.Class}	Properties	3842
2929	bidi	IsBracket	{}	{bool}	Properties	3842
2930	bidi	IsOpeningBracket	{}	{bool}	Properties	3842
2931	norm	BoundaryBefore	{}	{bool}	Properties	3844
2932	norm	BoundaryAfter	{}	{bool}	Properties	3844
2933	norm	Decomposition	{}	{[]byte}	Properties	3844
2934	norm	Size	{}	{int}	Properties	3844
2935	norm	CCC	{}	{uint8}	Properties	3844
2936	norm	LeadCCC	{}	{uint8}	Properties	3844
2937	norm	TrailCCC	{}	{uint8}	Properties	3844
2938	norm	Init	{norm.Form,[]byte}	{}	*Iter	3845
2939	norm	InitString	{norm.Form,string}	{}	*Iter	3845
2940	norm	Seek	{int64,int}	{int64,error}	*Iter	3845
2941	norm	Pos	{}	{int}	*Iter	3845
2942	norm	Done	{}	{bool}	*Iter	3845
2943	norm	Next	{}	{[]byte}	*Iter	3845
2944	norm	Properties	{[]byte}	{norm.Properties}	Form	3846
2945	norm	PropertiesString	{string}	{norm.Properties}	Form	3846
2946	norm	Bytes	{[]byte}	{[]byte}	Form	3846
2947	norm	String	{string}	{string}	Form	3846
2948	norm	IsNormal	{[]byte}	{bool}	Form	3846
2949	norm	IsNormalString	{string}	{bool}	Form	3846
2950	norm	Append	{[]byte,...byte}	{[]byte}	Form	3846
2951	norm	AppendString	{[]byte,string}	{[]byte}	Form	3846
2952	norm	QuickSpan	{[]byte}	{int}	Form	3846
2953	norm	Span	{[]byte,bool}	{int,error}	Form	3846
2954	norm	SpanString	{string,bool}	{int,error}	Form	3846
2955	norm	QuickSpanString	{string}	{int}	Form	3846
2956	norm	FirstBoundary	{[]byte}	{int}	Form	3846
2957	norm	FirstBoundaryInString	{string}	{int}	Form	3846
2958	norm	NextBoundary	{[]byte,bool}	{int}	Form	3846
2959	norm	NextBoundaryInString	{string,bool}	{int}	Form	3846
2960	norm	LastBoundary	{[]byte}	{int}	Form	3846
2961	norm	Writer	{io.Writer}	{io.WriteCloser}	Form	3846
2962	norm	Reader	{io.Reader}	{io.Reader}	Form	3846
2963	norm	Reset	{}	{}	Form	3846
2964	norm	Transform	{[]byte,[]byte,bool}	{int,error}	Form	3846
2965	xcoff	Close	{}	{error}	*Archive	3847
2966	xcoff	GetFile	{string}	{*xcoff.File,error}	*Archive	3847
2967	xcoff	Data	{}	{[]byte,error}	*Section	3852
2968	xcoff	Close	{}	{error}	*File	3859
2969	xcoff	Section	{string}	{*xcoff.Section}	*File	3859
2970	xcoff	SectionByType	{uint32}	{*xcoff.Section}	*File	3859
2971	xcoff	CSect	{string}	{[]byte}	*File	3859
2972	xcoff	DWARF	{}	{*dwarf.Data,error}	*File	3859
2973	xcoff	ImportedSymbols	{}	{[]xcoff.ImportedSymbol,error}	*File	3859
2974	xcoff	ImportedLibraries	{}	{[]string,error}	*File	3859
2975	io	Read	{[]byte}	{int,error}	*LimitedReader	3899
2976	io	Read	{[]byte}	{int,error}	*SectionReader	3900
2977	io	Seek	{int64,int}	{int64,error}	*SectionReader	3900
2978	io	ReadAt	{[]byte,int64}	{int,error}	*SectionReader	3900
2979	io	Size	{}	{int64}	*SectionReader	3900
2980	io	Read	{[]byte}	{int,error}	*PipeReader	3901
2981	io	Close	{}	{error}	*PipeReader	3901
2982	io	CloseWithError	{error}	{error}	*PipeReader	3901
2983	io	Write	{[]byte}	{int,error}	*PipeWriter	3902
2984	io	Close	{}	{error}	*PipeWriter	3902
2985	io	CloseWithError	{error}	{error}	*PipeWriter	3902
2986	log	SetOutput	{io.Writer}	{}	*Logger	3903
2987	log	Output	{int,string}	{error}	*Logger	3903
2988	log	Printf	{string,"...interface{}"}	{}	*Logger	3903
2989	log	Print	{"...interface{}"}	{}	*Logger	3903
2990	log	Println	{"...interface{}"}	{}	*Logger	3903
2991	log	Fatal	{"...interface{}"}	{}	*Logger	3903
2992	log	Fatalf	{string,"...interface{}"}	{}	*Logger	3903
2993	log	Fatalln	{"...interface{}"}	{}	*Logger	3903
2994	log	Panic	{"...interface{}"}	{}	*Logger	3903
2995	log	Panicf	{string,"...interface{}"}	{}	*Logger	3903
2996	log	Panicln	{"...interface{}"}	{}	*Logger	3903
2997	log	Flags	{}	{int}	*Logger	3903
2998	log	SetFlags	{int}	{}	*Logger	3903
2999	log	Prefix	{}	{string}	*Logger	3903
3000	log	SetPrefix	{string}	{}	*Logger	3903
3001	log	Writer	{}	{io.Writer}	*Logger	3903
3002	syslog	Write	{[]byte}	{int,error}	*Writer	3905
3003	syslog	Close	{}	{error}	*Writer	3905
3004	syslog	Emerg	{string}	{error}	*Writer	3905
3005	syslog	Alert	{string}	{error}	*Writer	3905
3006	syslog	Crit	{string}	{error}	*Writer	3905
3007	syslog	Err	{string}	{error}	*Writer	3905
3008	syslog	Warning	{string}	{error}	*Writer	3905
3009	syslog	Notice	{string}	{error}	*Writer	3905
3010	syslog	Info	{string}	{error}	*Writer	3905
3011	syslog	Debug	{string}	{error}	*Writer	3905
3012	big	SetPrec	{uint}	{*big.Float}	*Float	3907
3013	big	SetMode	{big.RoundingMode}	{*big.Float}	*Float	3907
3014	big	Prec	{}	{uint}	*Float	3907
3015	big	MinPrec	{}	{uint}	*Float	3907
3016	big	Mode	{}	{big.RoundingMode}	*Float	3907
3017	big	Acc	{}	{big.Accuracy}	*Float	3907
3018	big	Sign	{}	{int}	*Float	3907
3019	big	MantExp	{*big.Float}	{int}	*Float	3907
3020	big	SetMantExp	{*big.Float,int}	{*big.Float}	*Float	3907
3021	big	Signbit	{}	{bool}	*Float	3907
3022	big	IsInf	{}	{bool}	*Float	3907
3023	big	IsInt	{}	{bool}	*Float	3907
3024	big	SetUint64	{uint64}	{*big.Float}	*Float	3907
3025	big	SetInt64	{int64}	{*big.Float}	*Float	3907
3026	big	SetFloat64	{float64}	{*big.Float}	*Float	3907
3027	big	SetInt	{*big.Int}	{*big.Float}	*Float	3907
3028	big	SetRat	{*big.Rat}	{*big.Float}	*Float	3907
3029	big	SetInf	{bool}	{*big.Float}	*Float	3907
3030	big	Set	{*big.Float}	{*big.Float}	*Float	3907
3031	big	Copy	{*big.Float}	{*big.Float}	*Float	3907
3032	big	Uint64	{}	{uint64,big.Accuracy}	*Float	3907
3033	big	Int64	{}	{int64,big.Accuracy}	*Float	3907
3034	big	Float32	{}	{float32,big.Accuracy}	*Float	3907
3035	big	Float64	{}	{float64,big.Accuracy}	*Float	3907
3036	big	Int	{*big.Int}	{*big.Int,big.Accuracy}	*Float	3907
3037	big	Rat	{*big.Rat}	{*big.Rat,big.Accuracy}	*Float	3907
3038	big	Abs	{*big.Float}	{*big.Float}	*Float	3907
3039	big	Neg	{*big.Float}	{*big.Float}	*Float	3907
3040	big	Add	{*big.Float,*big.Float}	{*big.Float}	*Float	3907
3041	big	Sub	{*big.Float,*big.Float}	{*big.Float}	*Float	3907
3042	big	Mul	{*big.Float,*big.Float}	{*big.Float}	*Float	3907
3917	syscall	SetLen	{int}	{}	*Iovec	4372
3043	big	Quo	{*big.Float,*big.Float}	{*big.Float}	*Float	3907
3044	big	Cmp	{*big.Float}	{int}	*Float	3907
3045	big	SetString	{string}	{*big.Float,bool}	*Float	3907
3046	big	Parse	{string,int}	{*big.Float,int,error}	*Float	3907
3047	big	Scan	{fmt.ScanState,rune}	{error}	*Float	3907
3048	big	GobEncode	{}	{[]byte,error}	*Float	3907
3049	big	GobDecode	{[]byte}	{error}	*Float	3907
3050	big	MarshalText	{}	{[]byte,error}	*Float	3907
3051	big	UnmarshalText	{[]byte}	{error}	*Float	3907
3052	big	Text	{byte,int}	{string}	*Float	3907
3053	big	String	{}	{string}	*Float	3907
3054	big	Append	{[]byte,byte,int}	{[]byte}	*Float	3907
3055	big	Format	{fmt.State,rune}	{}	*Float	3907
3056	big	Sqrt	{*big.Float}	{*big.Float}	*Float	3907
3057	big	Error	{}	{string}	ErrNaN	3908
3058	big	String	{}	{string}	RoundingMode	3909
3059	big	String	{}	{string}	Accuracy	3910
3060	big	Sign	{}	{int}	*Int	3911
3061	big	SetInt64	{int64}	{*big.Int}	*Int	3911
3062	big	SetUint64	{uint64}	{*big.Int}	*Int	3911
3063	big	Set	{*big.Int}	{*big.Int}	*Int	3911
3064	big	Bits	{}	{[]big.Word}	*Int	3911
3065	big	SetBits	{[]big.Word}	{*big.Int}	*Int	3911
3066	big	Abs	{*big.Int}	{*big.Int}	*Int	3911
3067	big	Neg	{*big.Int}	{*big.Int}	*Int	3911
3068	big	Add	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3069	big	Sub	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3070	big	Mul	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3071	big	MulRange	{int64,int64}	{*big.Int}	*Int	3911
3072	big	Binomial	{int64,int64}	{*big.Int}	*Int	3911
3073	big	Quo	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3074	big	Rem	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3075	big	QuoRem	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	3911
3076	big	Div	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3077	big	Mod	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3078	big	DivMod	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	3911
3079	big	Cmp	{*big.Int}	{int}	*Int	3911
3080	big	CmpAbs	{*big.Int}	{int}	*Int	3911
3081	big	Int64	{}	{int64}	*Int	3911
3082	big	Uint64	{}	{uint64}	*Int	3911
3083	big	IsInt64	{}	{bool}	*Int	3911
3084	big	IsUint64	{}	{bool}	*Int	3911
3085	big	SetString	{string,int}	{*big.Int,bool}	*Int	3911
3086	big	SetBytes	{[]byte}	{*big.Int}	*Int	3911
3087	big	Bytes	{}	{[]byte}	*Int	3911
3088	big	BitLen	{}	{int}	*Int	3911
3089	big	Exp	{*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	3911
3090	big	GCD	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	3911
3091	big	Rand	{*rand.Rand,*big.Int}	{*big.Int}	*Int	3911
3092	big	ModInverse	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3093	big	ModSqrt	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3094	big	Lsh	{*big.Int,uint}	{*big.Int}	*Int	3911
3095	big	Rsh	{*big.Int,uint}	{*big.Int}	*Int	3911
3096	big	Bit	{int}	{uint}	*Int	3911
3097	big	SetBit	{*big.Int,int,uint}	{*big.Int}	*Int	3911
3098	big	And	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3099	big	AndNot	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3100	big	Or	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3101	big	Xor	{*big.Int,*big.Int}	{*big.Int}	*Int	3911
3102	big	Not	{*big.Int}	{*big.Int}	*Int	3911
3103	big	Sqrt	{*big.Int}	{*big.Int}	*Int	3911
3104	big	Text	{int}	{string}	*Int	3911
3105	big	Append	{[]byte,int}	{[]byte}	*Int	3911
3106	big	String	{}	{string}	*Int	3911
3107	big	Format	{fmt.State,rune}	{}	*Int	3911
3918	syscall	SetLen	{int}	{}	*Iovec	4372
3108	big	Scan	{fmt.ScanState,rune}	{error}	*Int	3911
3109	big	GobEncode	{}	{[]byte,error}	*Int	3911
3110	big	GobDecode	{[]byte}	{error}	*Int	3911
3111	big	MarshalText	{}	{[]byte,error}	*Int	3911
3112	big	UnmarshalText	{[]byte}	{error}	*Int	3911
3113	big	MarshalJSON	{}	{[]byte,error}	*Int	3911
3114	big	UnmarshalJSON	{[]byte}	{error}	*Int	3911
3115	big	ProbablyPrime	{int}	{bool}	*Int	3911
3116	big	SetFloat64	{float64}	{*big.Rat}	*Rat	3912
3117	big	Float32	{}	{float32,bool}	*Rat	3912
3118	big	Float64	{}	{float64,bool}	*Rat	3912
3119	big	SetFrac	{*big.Int,*big.Int}	{*big.Rat}	*Rat	3912
3120	big	SetFrac64	{int64,int64}	{*big.Rat}	*Rat	3912
3121	big	SetInt	{*big.Int}	{*big.Rat}	*Rat	3912
3122	big	SetInt64	{int64}	{*big.Rat}	*Rat	3912
3123	big	Set	{*big.Rat}	{*big.Rat}	*Rat	3912
3124	big	Abs	{*big.Rat}	{*big.Rat}	*Rat	3912
3125	big	Neg	{*big.Rat}	{*big.Rat}	*Rat	3912
3126	big	Inv	{*big.Rat}	{*big.Rat}	*Rat	3912
3127	big	Sign	{}	{int}	*Rat	3912
3128	big	IsInt	{}	{bool}	*Rat	3912
3129	big	Num	{}	{*big.Int}	*Rat	3912
3130	big	Denom	{}	{*big.Int}	*Rat	3912
3131	big	Cmp	{*big.Rat}	{int}	*Rat	3912
3132	big	Add	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	3912
3133	big	Sub	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	3912
3134	big	Mul	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	3912
3135	big	Quo	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	3912
3136	big	Scan	{fmt.ScanState,rune}	{error}	*Rat	3912
3137	big	SetString	{string}	{*big.Rat,bool}	*Rat	3912
3138	big	String	{}	{string}	*Rat	3912
3139	big	RatString	{}	{string}	*Rat	3912
3140	big	FloatString	{int}	{string}	*Rat	3912
3141	big	GobEncode	{}	{[]byte,error}	*Rat	3912
3142	big	GobDecode	{[]byte}	{error}	*Rat	3912
3143	big	MarshalText	{}	{[]byte,error}	*Rat	3912
3144	big	UnmarshalText	{[]byte}	{error}	*Rat	3912
3145	rand	ExpFloat64	{}	{float64}	*Rand	3915
3146	rand	NormFloat64	{}	{float64}	*Rand	3915
3147	rand	Seed	{int64}	{}	*Rand	3915
3148	rand	Int63	{}	{int64}	*Rand	3915
3149	rand	Uint32	{}	{uint32}	*Rand	3915
3150	rand	Uint64	{}	{uint64}	*Rand	3915
3151	rand	Int31	{}	{int32}	*Rand	3915
3152	rand	Int	{}	{int}	*Rand	3915
3153	rand	Int63n	{int64}	{int64}	*Rand	3915
3154	rand	Int31n	{int32}	{int32}	*Rand	3915
3155	rand	Intn	{int}	{int}	*Rand	3915
3156	rand	Float64	{}	{float64}	*Rand	3915
3157	rand	Float32	{}	{float32}	*Rand	3915
3158	rand	Perm	{int}	{[]int}	*Rand	3915
3159	rand	Shuffle	{int,func(int)}	{}	*Rand	3915
3160	rand	Read	{[]byte}	{int,error}	*Rand	3915
3161	rand	Uint64	{}	{uint64}	*Zipf	3916
3162	mime	Encode	{string,string}	{string}	WordEncoder	3917
3163	mime	Decode	{string}	{string,error}	*WordDecoder	3918
3164	mime	DecodeHeader	{string}	{string,error}	*WordDecoder	3918
3165	multipart	RemoveAll	{}	{error}	*Form	3919
3166	multipart	Open	{}	{multipart.File,error}	*FileHeader	3920
3167	multipart	FormName	{}	{string}	*Part	3922
3168	multipart	FileName	{}	{string}	*Part	3922
3169	multipart	Read	{[]byte}	{int,error}	*Part	3922
3170	multipart	Close	{}	{error}	*Part	3922
3171	multipart	ReadForm	{int64}	{*multipart.Form,error}	*Reader	3923
3172	multipart	NextPart	{}	{*multipart.Part,error}	*Reader	3923
3173	multipart	Boundary	{}	{string}	*Writer	3924
3174	multipart	SetBoundary	{string}	{error}	*Writer	3924
3175	multipart	FormDataContentType	{}	{string}	*Writer	3924
3176	multipart	CreatePart	{textproto.MIMEHeader}	{io.Writer,error}	*Writer	3924
3177	multipart	CreateFormFile	{string,string}	{io.Writer,error}	*Writer	3924
3178	multipart	CreateFormField	{string}	{io.Writer,error}	*Writer	3924
3179	multipart	WriteField	{string,string}	{error}	*Writer	3924
3180	multipart	Close	{}	{error}	*Writer	3924
3181	quotedprintable	Read	{[]byte}	{int,error}	*Reader	3925
3182	quotedprintable	Write	{[]byte}	{int,error}	*Writer	3926
3183	quotedprintable	Close	{}	{error}	*Writer	3926
3184	net	Dial	{string,string}	{net.Conn,error}	*Dialer	3927
3185	net	DialContext	{context.Context,string,string}	{net.Conn,error}	*Dialer	3927
3186	net	Listen	{context.Context,string,string}	{net.Listener,error}	*ListenConfig	3928
3187	net	ListenPacket	{context.Context,string,string}	{net.PacketConn,error}	*ListenConfig	3928
3188	cgi	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Handler	3932
3189	http	Get	{string}	{*http.Response,error}	*Client	3933
3190	http	Do	{*http.Request}	{*http.Response,error}	*Client	3933
3191	http	Post	{string,string,io.Reader}	{*http.Response,error}	*Client	3933
3192	http	PostForm	{string,url.Values}	{*http.Response,error}	*Client	3933
3193	http	Head	{string}	{*http.Response,error}	*Client	3933
3194	http	CloseIdleConnections	{}	{}	*Client	3933
3195	http	String	{}	{string}	*Cookie	3935
3196	cookiejar	Cookies	{*url.URL}	{[]*http.Cookie}	*Jar	3939
3197	cookiejar	SetCookies	{*url.URL,[]*http.Cookie}	{}	*Jar	3939
3198	http	Open	{string}	{http.File,error}	Dir	3940
3199	http	Add	{string,string}	{}	Header	3944
3200	http	Set	{string,string}	{}	Header	3944
3201	http	Get	{string}	{string}	Header	3944
3202	http	Del	{string}	{}	Header	3944
3203	http	Write	{io.Writer}	{error}	Header	3944
3204	http	WriteSubset	{io.Writer,map[string]bool}	{error}	Header	3944
3205	httptest	Header	{}	{http.Header}	*ResponseRecorder	3947
3206	httptest	Write	{[]byte}	{int,error}	*ResponseRecorder	3947
3207	httptest	WriteString	{string}	{int,error}	*ResponseRecorder	3947
3208	httptest	WriteHeader	{int}	{}	*ResponseRecorder	3947
3209	httptest	Flush	{}	{}	*ResponseRecorder	3947
3210	httptest	Result	{}	{*http.Response}	*ResponseRecorder	3947
3211	httptest	Start	{}	{}	*Server	3948
3212	httptest	StartTLS	{}	{}	*Server	3948
3213	httptest	Close	{}	{}	*Server	3948
3214	httptest	CloseClientConnections	{}	{}	*Server	3948
3215	httptest	Certificate	{}	{*x509.Certificate}	*Server	3948
3216	httptest	Client	{}	{*http.Client}	*Server	3948
3217	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ServerConn	3954
3218	httputil	Close	{}	{error}	*ServerConn	3954
3219	httputil	Read	{}	{*http.Request,error}	*ServerConn	3954
3220	httputil	Pending	{}	{int}	*ServerConn	3954
3221	httputil	Write	{*http.Request,*http.Response}	{error}	*ServerConn	3954
3222	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ClientConn	3955
3223	httputil	Close	{}	{error}	*ClientConn	3955
3224	httputil	Write	{*http.Request}	{error}	*ClientConn	3955
3225	httputil	Pending	{}	{int}	*ClientConn	3955
3226	httputil	Read	{*http.Request}	{*http.Response,error}	*ClientConn	3955
3227	httputil	Do	{*http.Request}	{*http.Response,error}	*ClientConn	3955
3228	httputil	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ReverseProxy	3956
3229	http	Error	{}	{string}	*ProtocolError	3960
3230	http	Context	{}	{context.Context}	*Request	3961
3231	http	WithContext	{context.Context}	{*http.Request}	*Request	3961
3232	http	ProtoAtLeast	{int,int}	{bool}	*Request	3961
3233	http	UserAgent	{}	{string}	*Request	3961
3234	http	Cookies	{}	{[]*http.Cookie}	*Request	3961
3235	http	Cookie	{string}	{*http.Cookie,error}	*Request	3961
3236	http	AddCookie	{*http.Cookie}	{}	*Request	3961
3919	syscall	SetLen	{int}	{}	*Iovec	4372
3237	http	Referer	{}	{string}	*Request	3961
3238	http	MultipartReader	{}	{*multipart.Reader,error}	*Request	3961
3239	http	Write	{io.Writer}	{error}	*Request	3961
3240	http	WriteProxy	{io.Writer}	{error}	*Request	3961
3241	http	BasicAuth	{}	{string,bool}	*Request	3961
3242	http	SetBasicAuth	{string,string}	{}	*Request	3961
3243	http	ParseForm	{}	{error}	*Request	3961
3244	http	ParseMultipartForm	{int64}	{error}	*Request	3961
3245	http	FormValue	{string}	{string}	*Request	3961
3246	http	PostFormValue	{string}	{string}	*Request	3961
3247	http	FormFile	{string}	{multipart.File,*multipart.FileHeader,error}	*Request	3961
3248	http	Cookies	{}	{[]*http.Cookie}	*Response	3962
3249	http	Location	{}	{*url.URL,error}	*Response	3962
3250	http	ProtoAtLeast	{int,int}	{bool}	*Response	3962
3251	http	Write	{io.Writer}	{error}	*Response	3962
3252	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	HandlerFunc	3968
3253	http	Handler	{*http.Request}	{http.Handler,string}	*ServeMux	3969
3254	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ServeMux	3969
3255	http	Handle	{string,http.Handler}	{}	*ServeMux	3969
3256	http	HandleFunc	{string,"func(http.ResponseWriter, *http.Request)"}	{}	*ServeMux	3969
3257	http	Close	{}	{error}	*Server	3970
3258	http	Shutdown	{context.Context}	{error}	*Server	3970
3259	http	RegisterOnShutdown	{func()}	{}	*Server	3970
3260	http	ListenAndServe	{}	{error}	*Server	3970
3261	http	Serve	{net.Listener}	{error}	*Server	3970
3262	http	ServeTLS	{net.Listener,string,string}	{error}	*Server	3970
3263	http	SetKeepAlivesEnabled	{bool}	{}	*Server	3970
3264	http	ListenAndServeTLS	{string,string}	{error}	*Server	3970
3265	http	String	{}	{string}	ConnState	3971
3266	http	RoundTrip	{*http.Request}	{*http.Response,error}	*Transport	3972
3267	http	RoundTrip	{*http.Request}	{*http.Response,error}	*Transport	3972
3268	http	RegisterProtocol	{string,http.RoundTripper}	{}	*Transport	3972
3269	http	CloseIdleConnections	{}	{}	*Transport	3972
3270	http	CancelRequest	{*http.Request}	{}	*Transport	3972
3271	main	String	{}	{string}	*Counter	3973
3272	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Counter	3973
3273	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	Chan	3974
3274	net	Addrs	{}	{[]net.Addr,error}	*Interface	3975
3275	net	MulticastAddrs	{}	{[]net.Addr,error}	*Interface	3975
3276	net	String	{}	{string}	Flags	3976
3277	socktest	Stats	{}	{[]socktest.Stat}	*Switch	3977
3278	socktest	Sockets	{}	{socktest.Sockets}	*Switch	3977
3279	socktest	Set	{socktest.FilterType,socktest.Filter}	{}	*Switch	3977
3280	socktest	Accept4	{int,int}	{int,syscall.Sockaddr,error}	*Switch	3977
3281	socktest	Socket	{int,int,int}	{int,error}	*Switch	3977
3282	socktest	Close	{int}	{error}	*Switch	3977
3283	socktest	Connect	{int,syscall.Sockaddr}	{error}	*Switch	3977
3284	socktest	Listen	{int,int}	{error}	*Switch	3977
3285	socktest	Accept	{int}	{int,syscall.Sockaddr,error}	*Switch	3977
3286	socktest	GetsockoptInt	{int,int,int}	{int,error}	*Switch	3977
3287	socktest	Socket	{int,int,int}	{syscall.Handle,error}	*Switch	3977
3288	socktest	WSASocket	{int32,int32,int32,*syscall.WSAProtocolInfo,uint32,uint32}	{syscall.Handle,error}	*Switch	3977
3289	socktest	Closesocket	{syscall.Handle}	{error}	*Switch	3977
3290	socktest	Connect	{syscall.Handle,syscall.Sockaddr}	{error}	*Switch	3977
3291	socktest	ConnectEx	{syscall.Handle,syscall.Sockaddr,*byte,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	3977
3292	socktest	Listen	{syscall.Handle,int}	{error}	*Switch	3977
3293	socktest	AcceptEx	{syscall.Handle,syscall.Handle,*byte,uint32,uint32,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	3977
3294	socktest	Family	{}	{int}	Cookie	3978
3295	socktest	Type	{}	{int}	Cookie	3978
3296	socktest	Protocol	{}	{int}	Cookie	3978
3297	socktest	String	{}	{string}	Status	3979
3298	socktest	String	{}	{string}	Stat	3980
3299	net	IsUnspecified	{}	{bool}	IP	3987
3300	net	IsLoopback	{}	{bool}	IP	3987
3301	net	IsMulticast	{}	{bool}	IP	3987
3302	net	IsInterfaceLocalMulticast	{}	{bool}	IP	3987
3303	net	IsLinkLocalMulticast	{}	{bool}	IP	3987
3304	net	IsLinkLocalUnicast	{}	{bool}	IP	3987
3305	net	IsGlobalUnicast	{}	{bool}	IP	3987
3306	net	To4	{}	{net.IP}	IP	3987
3307	net	To16	{}	{net.IP}	IP	3987
3308	net	DefaultMask	{}	{net.IPMask}	IP	3987
3309	net	Mask	{net.IPMask}	{net.IP}	IP	3987
3310	net	String	{}	{string}	IP	3987
3311	net	MarshalText	{}	{[]byte,error}	IP	3987
3312	net	UnmarshalText	{[]byte}	{error}	*IP	3987
3313	net	Equal	{net.IP}	{bool}	IP	3987
3314	net	Size	{}	{int}	IPMask	3988
3315	net	String	{}	{string}	IPMask	3988
3316	net	Contains	{net.IP}	{bool}	*IPNet	3989
3317	net	Network	{}	{string}	*IPNet	3989
3318	net	String	{}	{string}	*IPNet	3989
3319	net	Network	{}	{string}	*IPAddr	3990
3320	net	String	{}	{string}	*IPAddr	3990
3321	net	SyscallConn	{}	{syscall.RawConn,error}	*IPConn	3991
3322	net	ReadFromIP	{[]byte}	{int,*net.IPAddr,error}	*IPConn	3991
3323	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*IPConn	3991
3324	net	ReadMsgIP	{[]byte,[]byte}	{int,*net.IPAddr,error}	*IPConn	3991
3325	net	WriteToIP	{[]byte,*net.IPAddr}	{int,error}	*IPConn	3991
3326	net	WriteTo	{[]byte,net.Addr}	{int,error}	*IPConn	3991
3327	net	WriteMsgIP	{[]byte,[]byte,*net.IPAddr}	{int,error}	*IPConn	3991
3328	net	LookupHost	{context.Context,string}	{[]string,error}	*Resolver	3992
3329	net	LookupIPAddr	{context.Context,string}	{[]net.IPAddr,error}	*Resolver	3992
3330	net	LookupPort	{context.Context,string,string}	{int,error}	*Resolver	3992
3331	net	LookupCNAME	{context.Context,string}	{string,error}	*Resolver	3992
3332	net	LookupSRV	{context.Context,string,string,string}	{string,[]*net.SRV,error}	*Resolver	3992
3333	net	LookupMX	{context.Context,string}	{[]*net.MX,error}	*Resolver	3992
3334	net	LookupNS	{context.Context,string}	{[]*net.NS,error}	*Resolver	3992
3335	net	LookupTXT	{context.Context,string}	{[]string,error}	*Resolver	3992
3336	net	LookupAddr	{context.Context,string}	{[]string,error}	*Resolver	3992
3337	net	String	{}	{string}	HardwareAddr	3993
3338	mail	Get	{string}	{string}	Header	3995
3339	mail	Date	{}	{time.Time,error}	Header	3995
3340	mail	AddressList	{string}	{[]*mail.Address,error}	Header	3995
3341	mail	String	{}	{string}	*Address	3996
3342	mail	Parse	{string}	{*mail.Address,error}	*AddressParser	3997
3343	mail	ParseList	{string}	{[]*mail.Address,error}	*AddressParser	3997
3344	net	Error	{}	{string}	*OpError	4003
3345	net	Timeout	{}	{bool}	*OpError	4003
3346	net	Temporary	{}	{bool}	*OpError	4003
3347	net	Error	{}	{string}	*ParseError	4004
3348	net	Error	{}	{string}	*AddrError	4005
3349	net	Timeout	{}	{bool}	*AddrError	4005
3350	net	Temporary	{}	{bool}	*AddrError	4005
3351	net	Error	{}	{string}	UnknownNetworkError	4006
3352	net	Timeout	{}	{bool}	UnknownNetworkError	4006
3353	net	Temporary	{}	{bool}	UnknownNetworkError	4006
3354	net	Error	{}	{string}	InvalidAddrError	4007
3355	net	Timeout	{}	{bool}	InvalidAddrError	4007
3356	net	Temporary	{}	{bool}	InvalidAddrError	4007
3357	net	Error	{}	{string}	*DNSConfigError	4008
3358	net	Timeout	{}	{bool}	*DNSConfigError	4008
3359	net	Temporary	{}	{bool}	*DNSConfigError	4008
3360	net	Error	{}	{string}	*DNSError	4009
3361	net	Timeout	{}	{bool}	*DNSError	4009
3362	net	Temporary	{}	{bool}	*DNSError	4009
3363	net	WriteTo	{io.Writer}	{int64,error}	*Buffers	4010
3364	net	Read	{[]byte}	{int,error}	*Buffers	4010
3365	rpc	Error	{}	{string}	ServerError	4011
3366	rpc	Close	{}	{error}	*Client	4013
3367	rpc	Go	{string,"interface{}","interface{}","chan *rpc.Call\n"}	{*rpc.Call}	*Client	4013
3368	rpc	Call	{string,"interface{}","interface{}"}	{error}	*Client	4013
3369	rpc	Register	{"interface{}"}	{error}	*Server	4017
3370	rpc	RegisterName	{string,"interface{}"}	{error}	*Server	4017
3371	rpc	ServeConn	{io.ReadWriteCloser}	{}	*Server	4017
3372	rpc	ServeCodec	{rpc.ServerCodec}	{}	*Server	4017
3373	rpc	ServeRequest	{rpc.ServerCodec}	{error}	*Server	4017
3374	rpc	Accept	{net.Listener}	{}	*Server	4017
3375	rpc	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Server	4017
3376	rpc	HandleHTTP	{string,string}	{}	*Server	4017
3377	smtp	Close	{}	{error}	*Client	4021
3378	smtp	Hello	{string}	{error}	*Client	4021
3379	smtp	StartTLS	{*tls.Config}	{error}	*Client	4021
3380	smtp	TLSConnectionState	{}	{tls.ConnectionState,bool}	*Client	4021
3381	smtp	Verify	{string}	{error}	*Client	4021
3382	smtp	Auth	{smtp.Auth}	{error}	*Client	4021
3383	smtp	Mail	{string}	{error}	*Client	4021
3384	smtp	Rcpt	{string}	{error}	*Client	4021
3385	smtp	Data	{}	{io.WriteCloser,error}	*Client	4021
3386	smtp	Extension	{string}	{bool,string}	*Client	4021
3387	smtp	Reset	{}	{error}	*Client	4021
3388	smtp	Noop	{}	{error}	*Client	4021
3389	smtp	Quit	{}	{error}	*Client	4021
3390	net	Network	{}	{string}	*TCPAddr	4022
3391	net	String	{}	{string}	*TCPAddr	4022
3392	net	SyscallConn	{}	{syscall.RawConn,error}	*TCPConn	4023
3393	net	ReadFrom	{io.Reader}	{int64,error}	*TCPConn	4023
3394	net	CloseRead	{}	{error}	*TCPConn	4023
3395	net	CloseWrite	{}	{error}	*TCPConn	4023
3396	net	SetLinger	{int}	{error}	*TCPConn	4023
3397	net	SetKeepAlive	{bool}	{error}	*TCPConn	4023
3398	net	SetKeepAlivePeriod	{time.Duration}	{error}	*TCPConn	4023
3399	net	SetNoDelay	{bool}	{error}	*TCPConn	4023
3400	net	SyscallConn	{}	{syscall.RawConn,error}	*TCPListener	4024
3401	net	AcceptTCP	{}	{*net.TCPConn,error}	*TCPListener	4024
3402	net	Accept	{}	{net.Conn,error}	*TCPListener	4024
3403	net	Close	{}	{error}	*TCPListener	4024
3404	net	Addr	{}	{net.Addr}	*TCPListener	4024
3405	net	SetDeadline	{time.Time}	{error}	*TCPListener	4024
3406	net	File	{}	{*os.File,error}	*TCPListener	4024
3407	textproto	Add	{string,string}	{}	MIMEHeader	4025
3408	textproto	Set	{string,string}	{}	MIMEHeader	4025
3409	textproto	Get	{string}	{string}	MIMEHeader	4025
3410	textproto	Del	{string}	{}	MIMEHeader	4025
3411	textproto	Next	{}	{uint}	*Pipeline	4026
3412	textproto	StartRequest	{uint}	{}	*Pipeline	4026
3413	textproto	EndRequest	{uint}	{}	*Pipeline	4026
3414	textproto	StartResponse	{uint}	{}	*Pipeline	4026
3415	textproto	EndResponse	{uint}	{}	*Pipeline	4026
3416	textproto	ReadLine	{}	{string,error}	*Reader	4027
3417	textproto	ReadLineBytes	{}	{[]byte,error}	*Reader	4027
3418	textproto	ReadContinuedLine	{}	{string,error}	*Reader	4027
3419	textproto	ReadContinuedLineBytes	{}	{[]byte,error}	*Reader	4027
3420	textproto	ReadCodeLine	{int}	{int,string,error}	*Reader	4027
3421	textproto	ReadResponse	{int}	{int,string,error}	*Reader	4027
3422	textproto	DotReader	{}	{io.Reader}	*Reader	4027
3423	textproto	ReadDotBytes	{}	{[]byte,error}	*Reader	4027
3424	textproto	ReadDotLines	{}	{[]string,error}	*Reader	4027
3425	textproto	ReadMIMEHeader	{}	{textproto.MIMEHeader,error}	*Reader	4027
3426	textproto	Error	{}	{string}	*Error	4028
3427	textproto	Error	{}	{string}	ProtocolError	4029
3428	textproto	Close	{}	{error}	*Conn	4030
3429	textproto	Cmd	{string,"...interface{}"}	{uint,error}	*Conn	4030
3430	textproto	PrintfLine	{string,"...interface{}"}	{error}	*Writer	4031
3431	textproto	DotWriter	{}	{io.WriteCloser}	*Writer	4031
3432	net	Network	{}	{string}	*UDPAddr	4032
3433	net	String	{}	{string}	*UDPAddr	4032
3434	net	SyscallConn	{}	{syscall.RawConn,error}	*UDPConn	4033
3435	net	ReadFromUDP	{[]byte}	{int,*net.UDPAddr,error}	*UDPConn	4033
3436	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UDPConn	4033
3437	net	ReadMsgUDP	{[]byte,[]byte}	{int,*net.UDPAddr,error}	*UDPConn	4033
3438	net	WriteToUDP	{[]byte,*net.UDPAddr}	{int,error}	*UDPConn	4033
3439	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UDPConn	4033
3440	net	WriteMsgUDP	{[]byte,[]byte,*net.UDPAddr}	{int,error}	*UDPConn	4033
3441	net	Network	{}	{string}	*UnixAddr	4034
3442	net	String	{}	{string}	*UnixAddr	4034
3443	net	SyscallConn	{}	{syscall.RawConn,error}	*UnixConn	4035
3444	net	CloseRead	{}	{error}	*UnixConn	4035
3445	net	CloseWrite	{}	{error}	*UnixConn	4035
3446	net	ReadFromUnix	{[]byte}	{int,*net.UnixAddr,error}	*UnixConn	4035
3447	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UnixConn	4035
3448	net	ReadMsgUnix	{[]byte,[]byte}	{int,*net.UnixAddr,error}	*UnixConn	4035
3449	net	WriteToUnix	{[]byte,*net.UnixAddr}	{int,error}	*UnixConn	4035
3450	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UnixConn	4035
3451	net	WriteMsgUnix	{[]byte,[]byte,*net.UnixAddr}	{int,error}	*UnixConn	4035
3452	net	SyscallConn	{}	{syscall.RawConn,error}	*UnixListener	4036
3453	net	AcceptUnix	{}	{*net.UnixConn,error}	*UnixListener	4036
3454	net	Accept	{}	{net.Conn,error}	*UnixListener	4036
3455	net	Close	{}	{error}	*UnixListener	4036
3456	net	Addr	{}	{net.Addr}	*UnixListener	4036
3457	net	SetDeadline	{time.Time}	{error}	*UnixListener	4036
3458	net	File	{}	{*os.File,error}	*UnixListener	4036
3459	net	SetUnlinkOnClose	{bool}	{}	*UnixListener	4036
3460	url	Error	{}	{string}	*Error	4037
3461	url	Timeout	{}	{bool}	*Error	4037
3462	url	Temporary	{}	{bool}	*Error	4037
3463	url	Error	{}	{string}	EscapeError	4038
3464	url	Error	{}	{string}	InvalidHostError	4039
3465	url	EscapedPath	{}	{string}	*URL	4040
3466	url	String	{}	{string}	*URL	4040
3467	url	IsAbs	{}	{bool}	*URL	4040
3468	url	Parse	{string}	{*url.URL,error}	*URL	4040
3469	url	ResolveReference	{*url.URL}	{*url.URL}	*URL	4040
3470	url	Query	{}	{url.Values}	*URL	4040
3471	url	RequestURI	{}	{string}	*URL	4040
3472	url	Hostname	{}	{string}	*URL	4040
3473	url	Port	{}	{string}	*URL	4040
3474	url	MarshalBinary	{}	{[]byte,error}	*URL	4040
3475	url	UnmarshalBinary	{[]byte}	{error}	*URL	4040
3476	url	Username	{}	{string}	*Userinfo	4041
3477	url	Password	{}	{string,bool}	*Userinfo	4041
3478	url	String	{}	{string}	*Userinfo	4041
3479	url	Get	{string}	{string}	Values	4042
3480	url	Set	{string,string}	{}	Values	4042
3481	url	Add	{string,string}	{}	Values	4042
3482	url	Del	{string}	{}	Values	4042
3483	url	Encode	{}	{string}	Values	4042
3484	os	Error	{}	{string}	*PathError	4043
3485	os	Timeout	{}	{bool}	*PathError	4043
3486	os	Error	{}	{string}	*SyscallError	4044
3487	os	Timeout	{}	{bool}	*SyscallError	4044
3488	exec	Error	{}	{string}	*Error	4045
3489	exec	Run	{}	{error}	*Cmd	4046
3490	exec	Start	{}	{error}	*Cmd	4046
3491	exec	Wait	{}	{error}	*Cmd	4046
3492	exec	Output	{}	{[]byte,error}	*Cmd	4046
3920	syscall	SetLen	{int}	{}	*Iovec	4372
3493	exec	CombinedOutput	{}	{[]byte,error}	*Cmd	4046
3494	exec	StdinPipe	{}	{io.WriteCloser,error}	*Cmd	4046
3495	exec	StdoutPipe	{}	{io.ReadCloser,error}	*Cmd	4046
3496	exec	StderrPipe	{}	{io.ReadCloser,error}	*Cmd	4046
3497	exec	Error	{}	{string}	*ExitError	4048
3498	os	Release	{}	{error}	*Process	4049
3499	os	Kill	{}	{error}	*Process	4049
3500	os	Wait	{}	{*os.ProcessState,error}	*Process	4049
3501	os	Signal	{os.Signal}	{error}	*Process	4049
3502	os	UserTime	{}	{time.Duration}	*ProcessState	4052
3503	os	SystemTime	{}	{time.Duration}	*ProcessState	4052
3504	os	Exited	{}	{bool}	*ProcessState	4052
3505	os	Success	{}	{bool}	*ProcessState	4052
3506	os	Sys	{}	{"interface{}"}	*ProcessState	4052
3507	os	SysUsage	{}	{"interface{}"}	*ProcessState	4052
3508	os	Pid	{}	{int}	*ProcessState	4052
3509	os	String	{}	{string}	*ProcessState	4052
3510	os	ExitCode	{}	{int}	*ProcessState	4052
3511	os	Pid	{}	{int}	*ProcessState	4052
3512	os	String	{}	{string}	*ProcessState	4052
3513	os	ExitCode	{}	{int}	*ProcessState	4052
3514	os	Error	{}	{string}	*LinkError	4054
3515	pty	Error	{}	{string}	*PtyError	4055
3516	os	Readdir	{int}	{[]os.FileInfo,error}	*File	4056
3517	os	Readdirnames	{int}	{[]string,error}	*File	4056
3518	os	Name	{}	{string}	*File	4056
3519	os	Read	{[]byte}	{int,error}	*File	4056
3520	os	ReadAt	{[]byte,int64}	{int,error}	*File	4056
3521	os	Write	{[]byte}	{int,error}	*File	4056
3522	os	WriteAt	{[]byte,int64}	{int,error}	*File	4056
3523	os	Seek	{int64,int}	{int64,error}	*File	4056
3524	os	WriteString	{string}	{int,error}	*File	4056
3525	os	Chmod	{os.FileMode}	{error}	*File	4056
3526	os	SetDeadline	{time.Time}	{error}	*File	4056
3527	os	SetReadDeadline	{time.Time}	{error}	*File	4056
3528	os	SetWriteDeadline	{time.Time}	{error}	*File	4056
3529	os	SyscallConn	{}	{syscall.RawConn,error}	*File	4056
3530	os	Fd	{}	{uintptr}	*File	4056
3531	os	Close	{}	{error}	*File	4056
3532	os	Stat	{}	{os.FileInfo,error}	*File	4056
3533	os	Truncate	{int64}	{error}	*File	4056
3534	os	Sync	{}	{error}	*File	4056
3535	os	Chown	{int,int}	{error}	*File	4056
3536	os	Chdir	{}	{error}	*File	4056
3537	os	Chown	{int,int}	{error}	*File	4056
3538	os	Truncate	{int64}	{error}	*File	4056
3539	os	Sync	{}	{error}	*File	4056
3540	os	Chdir	{}	{error}	*File	4056
3541	os	Fd	{}	{uintptr}	*File	4056
3542	os	Close	{}	{error}	*File	4056
3543	os	Fd	{}	{uintptr}	*File	4056
3544	os	Close	{}	{error}	*File	4056
3545	os	Stat	{}	{os.FileInfo,error}	*File	4056
3546	os	Stat	{}	{os.FileInfo,error}	*File	4056
3547	os	String	{}	{string}	FileMode	4058
3548	os	IsDir	{}	{bool}	FileMode	4058
3549	os	IsRegular	{}	{bool}	FileMode	4058
3550	os	Perm	{}	{os.FileMode}	FileMode	4058
3551	user	GroupIds	{}	{[]string,error}	*User	4059
3552	user	Error	{}	{string}	UnknownUserIdError	4061
3553	user	Error	{}	{string}	UnknownUserError	4062
3554	user	Error	{}	{string}	UnknownGroupIdError	4063
3555	user	Error	{}	{string}	UnknownGroupError	4064
3556	plugin	Lookup	{string}	{plugin.Symbol,error}	*Plugin	4066
3557	reflect	String	{}	{string}	Kind	4069
3558	reflect	String	{}	{string}	ChanDir	4070
3559	reflect	Get	{string}	{string}	StructTag	4073
3560	reflect	Lookup	{string}	{string,bool}	StructTag	4073
3561	reflect	Addr	{}	{reflect.Value}	Value	4074
3562	reflect	Bool	{}	{bool}	Value	4074
3563	reflect	Bytes	{}	{[]byte}	Value	4074
3564	reflect	CanAddr	{}	{bool}	Value	4074
3565	reflect	CanSet	{}	{bool}	Value	4074
3566	reflect	Call	{[]reflect.Value}	{[]reflect.Value}	Value	4074
3567	reflect	CallSlice	{[]reflect.Value}	{[]reflect.Value}	Value	4074
3568	reflect	Cap	{}	{int}	Value	4074
3569	reflect	Close	{}	{}	Value	4074
3570	reflect	Complex	{}	{complex128}	Value	4074
3571	reflect	Elem	{}	{reflect.Value}	Value	4074
3572	reflect	Field	{int}	{reflect.Value}	Value	4074
3573	reflect	FieldByIndex	{[]int}	{reflect.Value}	Value	4074
3574	reflect	FieldByName	{string}	{reflect.Value}	Value	4074
3575	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.Value}	Value	4074
3576	reflect	Float	{}	{float64}	Value	4074
3577	reflect	Index	{int}	{reflect.Value}	Value	4074
3578	reflect	Int	{}	{int64}	Value	4074
3579	reflect	CanInterface	{}	{bool}	Value	4074
3580	reflect	Interface	{}	{"interface{}"}	Value	4074
3581	reflect	InterfaceData	{}	{[]uintptr}	Value	4074
3582	reflect	IsNil	{}	{bool}	Value	4074
3583	reflect	IsValid	{}	{bool}	Value	4074
3584	reflect	Kind	{}	{reflect.Kind}	Value	4074
3585	reflect	Len	{}	{int}	Value	4074
3586	reflect	MapIndex	{reflect.Value}	{reflect.Value}	Value	4074
3587	reflect	MapKeys	{}	{[]reflect.Value}	Value	4074
3588	reflect	MapRange	{}	{*reflect.MapIter}	Value	4074
3589	reflect	Method	{int}	{reflect.Value}	Value	4074
3590	reflect	NumMethod	{}	{int}	Value	4074
3591	reflect	MethodByName	{string}	{reflect.Value}	Value	4074
3592	reflect	NumField	{}	{int}	Value	4074
3593	reflect	OverflowComplex	{complex128}	{bool}	Value	4074
3594	reflect	OverflowFloat	{float64}	{bool}	Value	4074
3595	reflect	OverflowInt	{int64}	{bool}	Value	4074
3596	reflect	OverflowUint	{uint64}	{bool}	Value	4074
3597	reflect	Pointer	{}	{uintptr}	Value	4074
3598	reflect	Recv	{}	{reflect.Value,bool}	Value	4074
3599	reflect	Send	{reflect.Value}	{}	Value	4074
3600	reflect	Set	{reflect.Value}	{}	Value	4074
3601	reflect	SetBool	{bool}	{}	Value	4074
3602	reflect	SetBytes	{[]byte}	{}	Value	4074
3603	reflect	SetComplex	{complex128}	{}	Value	4074
3604	reflect	SetFloat	{float64}	{}	Value	4074
3605	reflect	SetInt	{int64}	{}	Value	4074
3606	reflect	SetLen	{int}	{}	Value	4074
3607	reflect	SetCap	{int}	{}	Value	4074
3608	reflect	SetMapIndex	{reflect.Value,reflect.Value}	{}	Value	4074
3609	reflect	SetUint	{uint64}	{}	Value	4074
3610	reflect	SetPointer	{unsafe.Pointer}	{}	Value	4074
3611	reflect	SetString	{string}	{}	Value	4074
3612	reflect	Slice	{int,int}	{reflect.Value}	Value	4074
3613	reflect	Slice3	{int,int,int}	{reflect.Value}	Value	4074
3614	reflect	String	{}	{string}	Value	4074
3615	reflect	TryRecv	{}	{reflect.Value,bool}	Value	4074
3616	reflect	TrySend	{reflect.Value}	{bool}	Value	4074
3617	reflect	Type	{}	{reflect.Type}	Value	4074
3618	reflect	Uint	{}	{uint64}	Value	4074
3619	reflect	UnsafeAddr	{}	{uintptr}	Value	4074
3620	reflect	Convert	{reflect.Type}	{reflect.Value}	Value	4074
3621	reflect	Error	{}	{string}	*ValueError	4075
3622	reflect	Key	{}	{reflect.Value}	*MapIter	4076
3623	reflect	Value	{}	{reflect.Value}	*MapIter	4076
3624	reflect	Next	{}	{bool}	*MapIter	4076
3625	regexp	String	{}	{string}	*Regexp	4081
3626	regexp	Copy	{}	{*regexp.Regexp}	*Regexp	4081
3627	regexp	Longest	{}	{}	*Regexp	4081
3628	regexp	NumSubexp	{}	{int}	*Regexp	4081
3629	regexp	SubexpNames	{}	{[]string}	*Regexp	4081
3630	regexp	LiteralPrefix	{}	{string,bool}	*Regexp	4081
3631	regexp	MatchReader	{io.RuneReader}	{bool}	*Regexp	4081
3632	regexp	MatchString	{string}	{bool}	*Regexp	4081
3633	regexp	Match	{[]byte}	{bool}	*Regexp	4081
3634	regexp	ReplaceAllString	{string,string}	{string}	*Regexp	4081
3635	regexp	ReplaceAllLiteralString	{string,string}	{string}	*Regexp	4081
3636	regexp	ReplaceAllStringFunc	{string,"func(string) string"}	{string}	*Regexp	4081
3637	regexp	ReplaceAll	{[]byte,[]byte}	{[]byte}	*Regexp	4081
3638	regexp	ReplaceAllLiteral	{[]byte,[]byte}	{[]byte}	*Regexp	4081
3639	regexp	ReplaceAllFunc	{[]byte,"func([]byte) []byte"}	{[]byte}	*Regexp	4081
3640	regexp	Find	{[]byte}	{[]byte}	*Regexp	4081
3641	regexp	FindIndex	{[]byte}	{[]int}	*Regexp	4081
3642	regexp	FindString	{string}	{string}	*Regexp	4081
3643	regexp	FindStringIndex	{string}	{[]int}	*Regexp	4081
3644	regexp	FindReaderIndex	{io.RuneReader}	{[]int}	*Regexp	4081
3645	regexp	FindSubmatch	{[]byte}	{[][]byte}	*Regexp	4081
3646	regexp	Expand	{[]byte,[]byte,[]byte,[]int}	{[]byte}	*Regexp	4081
3647	regexp	ExpandString	{[]byte,string,string,[]int}	{[]byte}	*Regexp	4081
3648	regexp	FindSubmatchIndex	{[]byte}	{[]int}	*Regexp	4081
3649	regexp	FindStringSubmatch	{string}	{[]string}	*Regexp	4081
3650	regexp	FindStringSubmatchIndex	{string}	{[]int}	*Regexp	4081
3651	regexp	FindReaderSubmatchIndex	{io.RuneReader}	{[]int}	*Regexp	4081
3652	regexp	FindAll	{[]byte,int}	{[][]byte}	*Regexp	4081
3653	regexp	FindAllIndex	{[]byte,int}	{[][]int}	*Regexp	4081
3654	regexp	FindAllString	{string,int}	{[]string}	*Regexp	4081
3655	regexp	FindAllStringIndex	{string,int}	{[][]int}	*Regexp	4081
3656	regexp	FindAllSubmatch	{[]byte,int}	{[][][]byte}	*Regexp	4081
3657	regexp	FindAllSubmatchIndex	{[]byte,int}	{[][]int}	*Regexp	4081
3658	regexp	FindAllStringSubmatch	{string,int}	{[][]string}	*Regexp	4081
3659	regexp	FindAllStringSubmatchIndex	{string,int}	{[][]int}	*Regexp	4081
3660	regexp	Split	{string,int}	{[]string}	*Regexp	4081
3661	syntax	String	{}	{string}	ErrorCode	4083
3662	syntax	String	{}	{string}	*Prog	4085
3663	syntax	Prefix	{}	{string,bool}	*Prog	4085
3664	syntax	StartCond	{}	{syntax.EmptyOp}	*Prog	4085
3665	syntax	String	{}	{string}	InstOp	4086
3666	syntax	MatchRune	{rune}	{bool}	*Inst	4088
3667	syntax	MatchRunePos	{rune}	{int}	*Inst	4088
3668	syntax	MatchEmptyWidth	{rune,rune}	{bool}	*Inst	4088
3669	syntax	String	{}	{string}	*Inst	4088
3670	syntax	Equal	{*syntax.Regexp}	{bool}	*Regexp	4089
3671	syntax	String	{}	{string}	*Regexp	4089
3672	syntax	MaxCap	{}	{int}	*Regexp	4089
3673	syntax	CapNames	{}	{[]string}	*Regexp	4089
3674	syntax	Simplify	{}	{*syntax.Regexp}	*Regexp	4089
3675	syntax	String	{}	{string}	Op	4090
3676	runtime	RuntimeError	{}	{}	*TypeAssertionError	4238
3677	runtime	Error	{}	{string}	*TypeAssertionError	4238
3678	runtime	Stack	{}	{[]uintptr}	*StackRecord	4253
3679	runtime	InUseBytes	{}	{int64}	*MemProfileRecord	4254
3680	runtime	InUseObjects	{}	{int64}	*MemProfileRecord	4254
3681	runtime	Stack	{}	{[]uintptr}	*MemProfileRecord	4254
3682	pprof	Name	{}	{string}	*Profile	4268
3683	pprof	Count	{}	{int}	*Profile	4268
3684	pprof	Add	{"interface{}",int}	{}	*Profile	4268
3685	pprof	Remove	{"interface{}"}	{}	*Profile	4268
3686	pprof	WriteTo	{io.Writer,int}	{error}	*Profile	4268
3687	runtime	Next	{}	{runtime.Frame,bool}	*Frames	4269
3688	runtime	Name	{}	{string}	*Func	4271
3689	runtime	Entry	{}	{uintptr}	*Func	4271
3690	runtime	FileLine	{uintptr}	{string,int}	*Func	4271
3691	main	String	{}	{string}	P	4272
3692	trace	End	{}	{}	*Task	4273
3693	trace	End	{}	{}	*Region	4274
3694	sort	Search	{int}	{int}	IntSlice	4276
3695	sort	Len	{}	{int}	IntSlice	4276
3696	sort	Less	{int,int}	{bool}	IntSlice	4276
3697	sort	Swap	{int,int}	{}	IntSlice	4276
3698	sort	Sort	{}	{}	IntSlice	4276
3699	sort	Search	{float64}	{int}	Float64Slice	4277
3700	sort	Len	{}	{int}	Float64Slice	4277
3701	sort	Less	{int,int}	{bool}	Float64Slice	4277
3702	sort	Swap	{int,int}	{}	Float64Slice	4277
3703	sort	Sort	{}	{}	Float64Slice	4277
3704	sort	Search	{string}	{int}	StringSlice	4278
3705	sort	Len	{}	{int}	StringSlice	4278
3706	sort	Less	{int,int}	{bool}	StringSlice	4278
3707	sort	Swap	{int,int}	{}	StringSlice	4278
3708	sort	Sort	{}	{}	StringSlice	4278
3709	strconv	Error	{}	{string}	*NumError	4279
3710	strings	String	{}	{string}	*Builder	4280
3711	strings	Len	{}	{int}	*Builder	4280
3712	strings	Cap	{}	{int}	*Builder	4280
3713	strings	Reset	{}	{}	*Builder	4280
3714	strings	Grow	{int}	{}	*Builder	4280
3715	strings	Write	{[]byte}	{int,error}	*Builder	4280
3716	strings	WriteByte	{byte}	{error}	*Builder	4280
3717	strings	WriteRune	{rune}	{int,error}	*Builder	4280
3718	strings	WriteString	{string}	{int,error}	*Builder	4280
3719	strings	Len	{}	{int}	*Reader	4281
3720	strings	Size	{}	{int64}	*Reader	4281
3721	strings	Read	{[]byte}	{int,error}	*Reader	4281
3722	strings	ReadAt	{[]byte,int64}	{int,error}	*Reader	4281
3723	strings	ReadByte	{}	{byte,error}	*Reader	4281
3724	strings	UnreadByte	{}	{error}	*Reader	4281
3725	strings	ReadRune	{}	{rune,int,error}	*Reader	4281
3726	strings	UnreadRune	{}	{error}	*Reader	4281
3727	strings	Seek	{int64,int}	{int64,error}	*Reader	4281
3728	strings	WriteTo	{io.Writer}	{int64,error}	*Reader	4281
3729	strings	Reset	{string}	{}	*Reader	4281
3730	strings	Replace	{string}	{string}	*Replacer	4282
3731	strings	WriteString	{io.Writer,string}	{int,error}	*Replacer	4282
3732	atomic	Load	{}	{"interface{}"}	*Value	4283
3733	atomic	Store	{"interface{}"}	{}	*Value	4283
3734	sync	Wait	{}	{}	*Cond	4284
3735	sync	Signal	{}	{}	*Cond	4284
3736	sync	Broadcast	{}	{}	*Cond	4284
3737	sync	Load	{"interface{}"}	{"interface{}",bool}	*Map	4285
3738	sync	Store	{"interface{}","interface{}"}	{}	*Map	4285
3739	sync	LoadOrStore	{"interface{}","interface{}"}	{"interface{}",bool}	*Map	4285
3740	sync	Delete	{"interface{}"}	{}	*Map	4285
3741	sync	Range	{"func(interface{}) bool"}	{}	*Map	4285
3742	sync	Lock	{}	{}	*Mutex	4286
3743	sync	Unlock	{}	{}	*Mutex	4286
3744	sync	Do	{func()}	{}	*Once	4288
3745	sync	Put	{"interface{}"}	{}	*Pool	4289
3746	sync	Get	{}	{"interface{}"}	*Pool	4289
3747	sync	RLock	{}	{}	*RWMutex	4290
3748	sync	RUnlock	{}	{}	*RWMutex	4290
3749	sync	Lock	{}	{}	*RWMutex	4290
3750	sync	Unlock	{}	{}	*RWMutex	4290
3751	sync	RLocker	{}	{sync.Locker}	*RWMutex	4290
3752	sync	Add	{int}	{}	*WaitGroup	4291
3753	sync	Done	{}	{}	*WaitGroup	4291
3754	sync	Wait	{}	{}	*WaitGroup	4291
3755	syscall	Null	{}	{}	*Dir	4293
3756	syscall	Marshal	{[]byte}	{int,error}	*Dir	4293
3757	syscall	Error	{}	{string}	*DLLError	4294
3758	syscall	FindProc	{string}	{*syscall.Proc,error}	*DLL	4295
3759	syscall	MustFindProc	{string}	{*syscall.Proc}	*DLL	4295
3760	syscall	Release	{}	{error}	*DLL	4295
3761	syscall	Addr	{}	{uintptr}	*Proc	4296
3762	syscall	Call	{...uintptr}	{uintptr,error}	*Proc	4296
3763	syscall	Load	{}	{error}	*LazyDLL	4297
3764	syscall	Handle	{}	{uintptr}	*LazyDLL	4297
3765	syscall	NewProc	{string}	{*syscall.LazyProc}	*LazyDLL	4297
3766	syscall	Find	{}	{error}	*LazyProc	4298
3767	syscall	Addr	{}	{uintptr}	*LazyProc	4298
3768	syscall	Call	{...uintptr}	{uintptr,error}	*LazyProc	4298
3769	js	Release	{}	{}	Func	4310
3770	js	JSValue	{}	{js.Value}	Value	4312
3771	js	Type	{}	{js.Type}	Value	4312
3772	js	Get	{string}	{js.Value}	Value	4312
3773	js	Set	{string,"interface{}"}	{}	Value	4312
3774	js	Index	{int}	{js.Value}	Value	4312
3775	js	SetIndex	{int,"interface{}"}	{}	Value	4312
3776	js	Length	{}	{int}	Value	4312
3777	js	Call	{string,"...interface{}"}	{js.Value}	Value	4312
3778	js	Invoke	{"...interface{}"}	{js.Value}	Value	4312
3779	js	New	{"...interface{}"}	{js.Value}	Value	4312
3780	js	Float	{}	{float64}	Value	4312
3781	js	Int	{}	{int}	Value	4312
3782	js	Bool	{}	{bool}	Value	4312
3783	js	Truthy	{}	{bool}	Value	4312
3784	js	String	{}	{string}	Value	4312
3785	js	InstanceOf	{js.Value}	{bool}	Value	4312
3786	js	Error	{}	{string}	Error	4313
3787	js	String	{}	{string}	Type	4314
3788	js	Error	{}	{string}	*ValueError	4315
3789	js	Release	{}	{}	TypedArray	4316
3790	main	BoolTmpVarCode	{}	{string}	*Param	4317
3791	main	SliceTmpVarCode	{}	{string}	*Param	4317
3792	main	StringTmpVarCode	{}	{string}	*Param	4317
3793	main	TmpVarCode	{}	{string}	*Param	4317
3794	main	TmpVarHelperCode	{}	{string}	*Param	4317
3795	main	SyscallArgList	{}	{[]string}	*Param	4317
3796	main	IsError	{}	{bool}	*Param	4317
3797	main	HelperType	{}	{string}	*Param	4317
3798	main	ErrorVarName	{}	{string}	*Rets	4318
3799	main	ToParams	{}	{[]*main.Param}	*Rets	4318
3800	main	List	{}	{string}	*Rets	4318
3801	main	PrintList	{}	{string}	*Rets	4318
3802	main	SetReturnValuesCode	{}	{string}	*Rets	4318
3803	main	SetErrorCode	{}	{string}	*Rets	4318
3804	main	DLLName	{}	{string}	*Fn	4319
3805	main	DLLFuncName	{}	{string}	*Fn	4319
3806	main	ParamList	{}	{string}	*Fn	4319
3807	main	HelperParamList	{}	{string}	*Fn	4319
3808	main	ParamPrintList	{}	{string}	*Fn	4319
3809	main	ParamCount	{}	{int}	*Fn	4319
3810	main	SyscallParamCount	{}	{int}	*Fn	4319
3811	main	Syscall	{}	{string}	*Fn	4319
3812	main	SyscallParamList	{}	{string}	*Fn	4319
3813	main	HelperCallParamList	{}	{string}	*Fn	4319
3814	main	IsUTF16	{}	{bool}	*Fn	4319
3815	main	StrconvFunc	{}	{string}	*Fn	4319
3816	main	StrconvType	{}	{string}	*Fn	4319
3817	main	HasStringParam	{}	{bool}	*Fn	4319
3818	main	HelperName	{}	{string}	*Fn	4319
3819	main	Import	{string}	{}	*Source	4320
3820	main	ExternalImport	{string}	{}	*Source	4320
3821	main	DLLs	{}	{[]string}	*Source	4320
3822	main	ParseFile	{string}	{error}	*Source	4320
3823	main	IsStdRepo	{}	{bool,error}	*Source	4320
3824	main	Generate	{io.Writer}	{error}	*Source	4320
3825	syscall	String	{}	{string,error}	*SID	4352
3826	syscall	Len	{}	{int}	*SID	4352
3827	syscall	Copy	{}	{*syscall.SID,error}	*SID	4352
3828	syscall	LookupAccount	{string}	{string,uint32,error}	*SID	4352
3829	syscall	Close	{}	{error}	Token	4356
3830	syscall	GetTokenUser	{}	{*syscall.Tokenuser,error}	Token	4356
3831	syscall	GetTokenPrimaryGroup	{}	{*syscall.Tokenprimarygroup,error}	Token	4356
3832	syscall	GetUserProfileDirectory	{}	{string,error}	Token	4356
3833	syscall	Stopped	{}	{bool}	WaitStatus	4359
3834	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4359
3835	syscall	Exited	{}	{bool}	WaitStatus	4359
3836	syscall	ExitStatus	{}	{int}	WaitStatus	4359
3837	syscall	Signaled	{}	{bool}	WaitStatus	4359
3838	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4359
3839	syscall	Continued	{}	{bool}	WaitStatus	4359
3840	syscall	CoreDump	{}	{bool}	WaitStatus	4359
3841	syscall	TrapCause	{}	{int}	WaitStatus	4359
3842	syscall	Exited	{}	{bool}	WaitStatus	4359
3843	syscall	ExitStatus	{}	{int}	WaitStatus	4359
3844	syscall	Signaled	{}	{bool}	WaitStatus	4359
3845	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4359
3846	syscall	CoreDump	{}	{bool}	WaitStatus	4359
3847	syscall	Stopped	{}	{bool}	WaitStatus	4359
3848	syscall	Continued	{}	{bool}	WaitStatus	4359
3849	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4359
3850	syscall	TrapCause	{}	{int}	WaitStatus	4359
3851	syscall	Exited	{}	{bool}	WaitStatus	4359
3852	syscall	ExitStatus	{}	{int}	WaitStatus	4359
3853	syscall	Signaled	{}	{bool}	WaitStatus	4359
3854	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4359
3855	syscall	CoreDump	{}	{bool}	WaitStatus	4359
3856	syscall	Stopped	{}	{bool}	WaitStatus	4359
3857	syscall	Continued	{}	{bool}	WaitStatus	4359
3858	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4359
3859	syscall	TrapCause	{}	{int}	WaitStatus	4359
3860	syscall	Exited	{}	{bool}	WaitStatus	4359
3861	syscall	Signaled	{}	{bool}	WaitStatus	4359
3862	syscall	Stopped	{}	{bool}	WaitStatus	4359
3863	syscall	Continued	{}	{bool}	WaitStatus	4359
3864	syscall	CoreDump	{}	{bool}	WaitStatus	4359
3865	syscall	ExitStatus	{}	{int}	WaitStatus	4359
3866	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4359
3867	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4359
3868	syscall	TrapCause	{}	{int}	WaitStatus	4359
3869	syscall	Exited	{}	{bool}	WaitStatus	4359
3870	syscall	ExitStatus	{}	{int}	WaitStatus	4359
3871	syscall	Signaled	{}	{bool}	WaitStatus	4359
3872	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4359
3873	syscall	CoreDump	{}	{bool}	WaitStatus	4359
3874	syscall	Stopped	{}	{bool}	WaitStatus	4359
3875	syscall	Continued	{}	{bool}	WaitStatus	4359
3876	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4359
3877	syscall	TrapCause	{}	{int}	WaitStatus	4359
3878	syscall	Exited	{}	{bool}	WaitStatus	4359
3879	syscall	ExitStatus	{}	{int}	WaitStatus	4359
3880	syscall	Signaled	{}	{bool}	WaitStatus	4359
3881	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4359
3882	syscall	CoreDump	{}	{bool}	WaitStatus	4359
3883	syscall	Stopped	{}	{bool}	WaitStatus	4359
3884	syscall	Continued	{}	{bool}	WaitStatus	4359
3885	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4359
3886	syscall	TrapCause	{}	{int}	WaitStatus	4359
3887	syscall	Exited	{}	{bool}	WaitStatus	4359
3888	syscall	ExitStatus	{}	{int}	WaitStatus	4359
3889	syscall	Signal	{}	{syscall.Signal}	WaitStatus	4359
3890	syscall	CoreDump	{}	{bool}	WaitStatus	4359
3891	syscall	Stopped	{}	{bool}	WaitStatus	4359
3892	syscall	Continued	{}	{bool}	WaitStatus	4359
3893	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	4359
3894	syscall	Signaled	{}	{bool}	WaitStatus	4359
3895	syscall	TrapCause	{}	{int}	WaitStatus	4359
3896	syscall	Error	{}	{string}	Errno	4365
3897	syscall	Temporary	{}	{bool}	Errno	4365
3898	syscall	Timeout	{}	{bool}	Errno	4365
3899	syscall	Error	{}	{string}	Errno	4365
3900	syscall	Temporary	{}	{bool}	Errno	4365
3901	syscall	Timeout	{}	{bool}	Errno	4365
3902	syscall	Error	{}	{string}	Errno	4365
3903	syscall	Temporary	{}	{bool}	Errno	4365
3904	syscall	Timeout	{}	{bool}	Errno	4365
3905	syscall	Error	{}	{string}	Errno	4365
3906	syscall	Temporary	{}	{bool}	Errno	4365
3907	syscall	Timeout	{}	{bool}	Errno	4365
3908	syscall	Signal	{}	{}	Signal	4366
3909	syscall	String	{}	{string}	Signal	4366
3910	syscall	Signal	{}	{}	Signal	4366
3911	syscall	String	{}	{string}	Signal	4366
3912	syscall	Signal	{}	{}	Signal	4366
3913	syscall	String	{}	{string}	Signal	4366
3914	syscall	Signal	{}	{}	Signal	4366
3915	syscall	String	{}	{string}	Signal	4366
3921	syscall	SetLen	{int}	{}	*Iovec	4372
3922	syscall	SetLen	{int}	{}	*Iovec	4372
3923	syscall	SetLen	{int}	{}	*Iovec	4372
3924	syscall	SetLen	{int}	{}	*Iovec	4372
3925	syscall	SetLen	{int}	{}	*Iovec	4372
3926	syscall	SetLen	{int}	{}	*Iovec	4372
3927	syscall	SetLen	{int}	{}	*Iovec	4372
3928	syscall	SetLen	{int}	{}	*Iovec	4372
3929	syscall	SetLen	{int}	{}	*Iovec	4372
3930	syscall	SetLen	{int}	{}	*Iovec	4372
3931	syscall	SetLen	{int}	{}	*Iovec	4372
3932	syscall	SetLen	{int}	{}	*Iovec	4372
3933	syscall	SetLen	{int}	{}	*Iovec	4372
3934	syscall	SetLen	{int}	{}	*Iovec	4372
3935	syscall	SetLen	{int}	{}	*Iovec	4372
3936	syscall	SetLen	{int}	{}	*Iovec	4372
3937	syscall	SetLen	{int}	{}	*Iovec	4372
3938	syscall	SetLen	{int}	{}	*Iovec	4372
3939	syscall	SetLen	{int}	{}	*Iovec	4372
3940	syscall	Unix	{}	{int64,int64}	*Timespec	4373
3941	syscall	Nano	{}	{int64}	*Timespec	4373
3942	syscall	Unix	{}	{int64,int64}	*Timeval	4374
3943	syscall	Nano	{}	{int64}	*Timeval	4374
3944	syscall	Nanoseconds	{}	{int64}	*Timeval	4374
3945	syscall	Error	{}	{string}	ErrorString	4395
3946	syscall	Temporary	{}	{bool}	ErrorString	4395
3947	syscall	Timeout	{}	{bool}	ErrorString	4395
3948	syscall	Signal	{}	{}	Note	4396
3949	syscall	String	{}	{string}	Note	4396
3950	syscall	Exited	{}	{bool}	Waitmsg	4397
3951	syscall	Signaled	{}	{bool}	Waitmsg	4397
3952	syscall	ExitStatus	{}	{int}	Waitmsg	4397
3953	syscall	Sockaddr	{}	{syscall.Sockaddr,error}	*RawSockaddrAny	4413
3954	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3955	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3956	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3957	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3958	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3959	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3960	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3961	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3962	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3963	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3964	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3965	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3966	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3967	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3968	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3969	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3970	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3971	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3972	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3973	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3974	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3975	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3976	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3977	syscall	SetLen	{int}	{}	*Cmsghdr	4444
3978	syscall	SetControllen	{int}	{}	*Msghdr	4450
3979	syscall	SetControllen	{int}	{}	*Msghdr	4450
3980	syscall	SetControllen	{int}	{}	*Msghdr	4450
3981	syscall	SetControllen	{int}	{}	*Msghdr	4450
3982	syscall	SetControllen	{int}	{}	*Msghdr	4450
3983	syscall	SetControllen	{int}	{}	*Msghdr	4450
3984	syscall	SetControllen	{int}	{}	*Msghdr	4450
3985	syscall	SetControllen	{int}	{}	*Msghdr	4450
3986	syscall	SetControllen	{int}	{}	*Msghdr	4450
3987	syscall	SetControllen	{int}	{}	*Msghdr	4450
3988	syscall	SetControllen	{int}	{}	*Msghdr	4450
3989	syscall	SetControllen	{int}	{}	*Msghdr	4450
3990	syscall	SetControllen	{int}	{}	*Msghdr	4450
3991	syscall	SetControllen	{int}	{}	*Msghdr	4450
3992	syscall	SetControllen	{int}	{}	*Msghdr	4450
3993	syscall	SetControllen	{int}	{}	*Msghdr	4450
3994	syscall	SetControllen	{int}	{}	*Msghdr	4450
3995	syscall	SetControllen	{int}	{}	*Msghdr	4450
3996	syscall	SetControllen	{int}	{}	*Msghdr	4450
3997	syscall	SetControllen	{int}	{}	*Msghdr	4450
3998	syscall	SetControllen	{int}	{}	*Msghdr	4450
3999	syscall	SetControllen	{int}	{}	*Msghdr	4450
4000	syscall	SetControllen	{int}	{}	*Msghdr	4450
4001	syscall	PC	{}	{uint64}	*PtraceRegs	4624
4002	syscall	SetPC	{uint64}	{}	*PtraceRegs	4624
4003	syscall	PC	{}	{uint64}	*PtraceRegs	4624
4004	syscall	SetPC	{uint64}	{}	*PtraceRegs	4624
4005	syscall	PC	{}	{uint64}	*PtraceRegs	4624
4006	syscall	SetPC	{uint64}	{}	*PtraceRegs	4624
4007	syscall	PC	{}	{uint64}	*PtraceRegs	4624
4008	syscall	SetPC	{uint64}	{}	*PtraceRegs	4624
4009	syscall	PC	{}	{uint64}	*PtraceRegs	4624
4010	syscall	SetPC	{uint64}	{}	*PtraceRegs	4624
4011	syscall	PC	{}	{uint64}	*PtraceRegs	4624
4012	syscall	SetPC	{uint64}	{}	*PtraceRegs	4624
4013	syscall	PC	{}	{uint64}	*PtraceRegs	4624
4014	syscall	SetPC	{uint64}	{}	*PtraceRegs	4624
4015	syscall	PC	{}	{uint64}	*PtraceRegs	4624
4016	syscall	SetPC	{uint64}	{}	*PtraceRegs	4624
4017	syscall	Nanoseconds	{}	{int64}	*Filetime	4753
4018	testing	Next	{}	{bool}	*PB	6033
4019	testdeps	MatchString	{string,string}	{bool,error}	TestDeps	6037
4020	testdeps	StartCPUProfile	{io.Writer}	{error}	TestDeps	6037
4021	testdeps	StopCPUProfile	{}	{}	TestDeps	6037
4022	testdeps	WriteProfileTo	{string,io.Writer,int}	{error}	TestDeps	6037
4023	testdeps	ImportPath	{}	{string}	TestDeps	6037
4024	testdeps	StartTestLog	{io.Writer}	{}	TestDeps	6037
4025	testdeps	StopTestLog	{}	{error}	TestDeps	6037
4026	quick	Error	{}	{string}	SetupError	6040
4027	quick	Error	{}	{string}	*CheckError	6041
4028	quick	Error	{}	{string}	*CheckEqualError	6042
4029	testing	Run	{}	{int}	*M	6046
4030	scanner	IsValid	{}	{bool}	*Position	6047
4031	scanner	String	{}	{string}	Position	6047
4032	tabwriter	Init	{io.Writer,int,int,int,byte,uint}	{*tabwriter.Writer}	*Writer	6049
4033	tabwriter	Flush	{}	{error}	*Writer	6049
4034	tabwriter	Write	{[]byte}	{int,error}	*Writer	6049
4035	template	Error	{}	{string}	ExecError	6050
4036	parse	Type	{}	{parse.NodeType}	NodeType	6053
4037	parse	Position	{}	{parse.Pos}	Pos	6054
4038	parse	String	{}	{string}	*ListNode	6055
4039	parse	CopyList	{}	{*parse.ListNode}	*ListNode	6055
4040	parse	Copy	{}	{parse.Node}	*ListNode	6055
4041	parse	String	{}	{string}	*TextNode	6056
4042	parse	Copy	{}	{parse.Node}	*TextNode	6056
4043	parse	String	{}	{string}	*PipeNode	6057
4044	parse	CopyPipe	{}	{*parse.PipeNode}	*PipeNode	6057
4045	parse	Copy	{}	{parse.Node}	*PipeNode	6057
4046	parse	String	{}	{string}	*ActionNode	6058
4047	parse	Copy	{}	{parse.Node}	*ActionNode	6058
4048	parse	String	{}	{string}	*CommandNode	6059
4049	parse	Copy	{}	{parse.Node}	*CommandNode	6059
4050	parse	SetPos	{parse.Pos}	{*parse.IdentifierNode}	*IdentifierNode	6060
4051	parse	SetTree	{*parse.Tree}	{*parse.IdentifierNode}	*IdentifierNode	6060
4052	parse	String	{}	{string}	*IdentifierNode	6060
4053	parse	Copy	{}	{parse.Node}	*IdentifierNode	6060
4054	parse	String	{}	{string}	*VariableNode	6061
4055	parse	Copy	{}	{parse.Node}	*VariableNode	6061
4056	parse	Type	{}	{parse.NodeType}	*DotNode	6062
4057	parse	String	{}	{string}	*DotNode	6062
4058	parse	Copy	{}	{parse.Node}	*DotNode	6062
4059	parse	Type	{}	{parse.NodeType}	*NilNode	6063
4060	parse	String	{}	{string}	*NilNode	6063
4061	parse	Copy	{}	{parse.Node}	*NilNode	6063
4062	parse	String	{}	{string}	*FieldNode	6064
4063	parse	Copy	{}	{parse.Node}	*FieldNode	6064
4064	parse	Add	{string}	{}	*ChainNode	6065
4065	parse	String	{}	{string}	*ChainNode	6065
4066	parse	Copy	{}	{parse.Node}	*ChainNode	6065
4067	parse	String	{}	{string}	*BoolNode	6066
4068	parse	Copy	{}	{parse.Node}	*BoolNode	6066
4069	parse	String	{}	{string}	*NumberNode	6067
4070	parse	Copy	{}	{parse.Node}	*NumberNode	6067
4071	parse	String	{}	{string}	*StringNode	6068
4072	parse	Copy	{}	{parse.Node}	*StringNode	6068
4073	parse	String	{}	{string}	*BranchNode	6069
4074	parse	Copy	{}	{parse.Node}	*BranchNode	6069
4075	parse	Copy	{}	{parse.Node}	*IfNode	6070
4076	parse	Copy	{}	{parse.Node}	*RangeNode	6071
4077	parse	Copy	{}	{parse.Node}	*WithNode	6072
4078	parse	String	{}	{string}	*TemplateNode	6073
4079	parse	Copy	{}	{parse.Node}	*TemplateNode	6073
4080	parse	Copy	{}	{*parse.Tree}	*Tree	6074
4081	parse	ErrorContext	{parse.Node}	{string}	*Tree	6074
4082	parse	Parse	{string,string,string,map[string]*parse.Tree,"...map[string]interface{}"}	{*parse.Tree,error}	*Tree	6074
4083	time	Error	{}	{string}	*ParseError	6076
4084	time	Stop	{}	{bool}	*Timer	6079
4085	time	Reset	{time.Duration}	{bool}	*Timer	6079
4086	time	Stop	{}	{}	*Ticker	6080
4087	time	String	{}	{string}	Time	6081
4088	time	Format	{string}	{string}	Time	6081
4089	time	AppendFormat	{[]byte,string}	{[]byte}	Time	6081
4090	time	After	{time.Time}	{bool}	Time	6081
4091	time	Before	{time.Time}	{bool}	Time	6081
4092	time	Equal	{time.Time}	{bool}	Time	6081
4093	time	IsZero	{}	{bool}	Time	6081
4094	time	Date	{}	{int,time.Month,int}	Time	6081
4095	time	Year	{}	{int}	Time	6081
4096	time	Month	{}	{time.Month}	Time	6081
4097	time	Day	{}	{int}	Time	6081
4098	time	Weekday	{}	{time.Weekday}	Time	6081
4099	time	ISOWeek	{}	{int}	Time	6081
4100	time	Clock	{}	{int}	Time	6081
4101	time	Hour	{}	{int}	Time	6081
4102	time	Minute	{}	{int}	Time	6081
4103	time	Second	{}	{int}	Time	6081
4104	time	Nanosecond	{}	{int}	Time	6081
4105	time	YearDay	{}	{int}	Time	6081
4106	time	Add	{time.Duration}	{time.Time}	Time	6081
4107	time	Sub	{time.Time}	{time.Duration}	Time	6081
4108	time	AddDate	{int,int,int}	{time.Time}	Time	6081
4109	time	UTC	{}	{time.Time}	Time	6081
4110	time	Local	{}	{time.Time}	Time	6081
4111	time	In	{*time.Location}	{time.Time}	Time	6081
4112	time	Location	{}	{*time.Location}	Time	6081
4113	time	Zone	{}	{string,int}	Time	6081
4114	time	Unix	{}	{int64}	Time	6081
4115	time	UnixNano	{}	{int64}	Time	6081
4116	time	MarshalBinary	{}	{[]byte,error}	Time	6081
4117	time	UnmarshalBinary	{[]byte}	{error}	*Time	6081
4118	time	GobEncode	{}	{[]byte,error}	Time	6081
4119	time	GobDecode	{[]byte}	{error}	*Time	6081
4120	time	MarshalJSON	{}	{[]byte,error}	Time	6081
4121	time	UnmarshalJSON	{[]byte}	{error}	*Time	6081
4122	time	MarshalText	{}	{[]byte,error}	Time	6081
4123	time	UnmarshalText	{[]byte}	{error}	*Time	6081
4124	time	Truncate	{time.Duration}	{time.Time}	Time	6081
4125	time	Round	{time.Duration}	{time.Time}	Time	6081
4126	time	String	{}	{string}	Month	6082
4127	time	String	{}	{string}	Weekday	6083
4128	time	String	{}	{string}	Duration	6084
4129	time	Nanoseconds	{}	{int64}	Duration	6084
4130	time	Seconds	{}	{float64}	Duration	6084
4131	time	Minutes	{}	{float64}	Duration	6084
4132	time	Hours	{}	{float64}	Duration	6084
4133	time	Truncate	{time.Duration}	{time.Duration}	Duration	6084
4134	time	Round	{time.Duration}	{time.Duration}	Duration	6084
4135	time	String	{}	{string}	*Location	6085
4136	unicode	ToUpper	{rune}	{rune}	SpecialCase	6090
4137	unicode	ToTitle	{rune}	{rune}	SpecialCase	6090
4138	unicode	ToLower	{rune}	{rune}	SpecialCase	6090
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
78	gc	FmtFlag	int
79	gc	Class	uint8
80	gc	Arch	struct
81	gc	Progs	struct
82	gc	BoolFlag	
83	gc	CountFlag	
84	gc	Mpflt	struct
85	gc	Mpcplx	struct
86	gc	Mpint	struct
87	gc	Order	struct
88	gc	BlockEffects	struct
89	gc	Liveness	struct
90	gc	LivenessMap	struct
91	gc	LivenessIndex	struct
92	gc	Sig	struct
93	gc	GCProg	struct
94	gc	InitEntry	struct
95	gc	InitPlan	struct
96	gc	Branch	struct
97	gc	SSAGenState	struct
98	gc	FloatingEQNEJump	struct
99	gc	Error	struct
100	gc	Dlist	struct
101	gc	Symlink	struct
102	gc	Node	struct
103	gc	Name	struct
104	gc	Param	struct
105	gc	Func	struct
106	gc	Inline	struct
107	gc	Mark	struct
108	gc	ScopeID	int32
109	gc	Op	uint8
110	gc	Nodes	struct
111	gc	Timings	struct
112	ssa	Block	struct
113	ssa	Edge	struct
114	ssa	BlockKind	int8
115	ssa	BranchPrediction	int8
116	ssa	Cache	struct
117	ssa	Config	struct
118	ssa	Types	struct
119	ssa	Logger	
120	ssa	Frontend	
121	ssa	GCNode	
122	ssa	StorageClass	uint8
123	ssa	SlotID	int32
124	ssa	VarID	int32
125	ssa	FuncDebug	struct
126	ssa	BlockDebug	struct
127	ssa	StackOffset	int32
128	ssa	VarLoc	struct
129	ssa	RegisterSet	uint64
130	ssa	Func	struct
131	main	ArchsByName	[]main.arch
132	main	Rule	struct
133	ssa	HTMLWriter	struct
134	ssa	FuncLines	struct
135	ssa	ByTopo	[]*ssa.FuncLines
136	ssa	ID	int32
137	ssa	Location	
138	ssa	Register	struct
139	ssa	LocalSlot	struct
140	ssa	LocPair	[]ssa.Location
141	ssa	Op	int32
142	ssa	SymEffect	int8
143	ssa	ValAndOff	int64
144	ssa	RBTint32	struct
145	ssa	ValHeap	struct
146	ssa	SparseTreeNode	struct
147	ssa	SparseTree	[]ssa.SparseTreeNode
148	ssa	SparseTreeMap	ssa.RBTint32
149	ssa	SparseTreeHelper	struct
150	ssa	Value	struct
151	syntax	Node	
152	syntax	File	struct
153	syntax	Decl	
154	syntax	ImportDecl	struct
155	syntax	ConstDecl	struct
156	syntax	TypeDecl	struct
157	syntax	VarDecl	struct
158	syntax	FuncDecl	struct
159	syntax	Group	struct
160	syntax	Expr	
161	syntax	BadExpr	struct
162	syntax	Name	struct
163	syntax	BasicLit	struct
164	syntax	CompositeLit	struct
165	syntax	KeyValueExpr	struct
166	syntax	FuncLit	struct
167	syntax	ParenExpr	struct
168	syntax	SelectorExpr	struct
169	syntax	IndexExpr	struct
170	syntax	SliceExpr	struct
171	syntax	AssertExpr	struct
172	syntax	TypeSwitchGuard	struct
173	syntax	Operation	struct
174	syntax	CallExpr	struct
175	syntax	ListExpr	struct
176	syntax	ArrayType	struct
177	syntax	SliceType	struct
178	syntax	DotsType	struct
179	syntax	StructType	struct
180	syntax	Field	struct
181	syntax	InterfaceType	struct
182	syntax	FuncType	struct
183	syntax	MapType	struct
184	syntax	ChanType	struct
185	syntax	ChanDir	uint
186	syntax	Stmt	
187	syntax	SimpleStmt	
188	syntax	EmptyStmt	struct
189	syntax	LabeledStmt	struct
190	syntax	BlockStmt	struct
191	syntax	ExprStmt	struct
192	syntax	SendStmt	struct
193	syntax	DeclStmt	struct
194	syntax	AssignStmt	struct
195	syntax	BranchStmt	struct
196	syntax	CallStmt	struct
197	syntax	ReturnStmt	struct
198	syntax	IfStmt	struct
199	syntax	ForStmt	struct
200	syntax	SwitchStmt	struct
201	syntax	SelectStmt	struct
202	syntax	RangeClause	struct
203	syntax	CaseClause	struct
204	syntax	CommClause	struct
205	syntax	CommentKind	uint
206	syntax	Comment	struct
207	syntax	Pos	struct
208	syntax	PosBase	struct
209	syntax	Mode	uint
210	syntax	Error	struct
211	syntax	ErrorHandler	func(error)
212	syntax	Pragma	uint16
213	syntax	PragmaHandler	func(syntax.Pos, string) syntax.Pragma
214	syntax	LitKind	uint
215	syntax	Operator	uint
216	types	Pkg	struct
217	types	Sym	struct
218	types	Node	struct
219	types	EType	uint8
220	types	ChanDir	uint8
221	types	Type	struct
222	types	Map	struct
223	types	Forward	struct
224	types	Func	struct
225	types	Struct	struct
226	types	Funarg	uint8
227	types	Interface	struct
228	types	Ptr	struct
229	types	DDDField	struct
230	types	ChanArgs	struct
231	types	FuncArgs	struct
232	types	Chan	struct
233	types	Tuple	struct
234	types	Array	struct
235	types	Slice	struct
236	types	Field	struct
237	types	Fields	struct
238	types	Cmp	int8
239	main	Block	struct
240	main	File	struct
241	main	FuncExtent	struct
242	main	FuncVisitor	struct
243	main	Pkg	struct
244	main	Profile	struct
245	main	ProfileBlock	struct
246	main	Boundary	struct
247	main	Dir	struct
248	main	Dirs	struct
249	main	Package	struct
250	main	PackageError	string
251	nested	Foo	struct
252	pkg	ExportedType	struct
253	pkg	ExportedStructOneField	struct
254	pkg	ExportedInterface	
255	pkg	T2	int
256	pkg	T1	pkg.T2
257	main	TypeConfig	struct
258	main	Type	struct
259	base	Command	struct
260	base	StringsFlag	[]string
261	cache	ActionID	[]byte
262	cache	OutputID	[]byte
263	cache	Cache	struct
264	cache	Entry	struct
265	cache	Hash	struct
266	cfg	EnvVar	struct
267	cmdflag	Defn	struct
268	dirhash	Hash	func([]string, func(string) (io.ReadCloser, error)) (string, error)
269	generate	Generator	struct
270	get	RepoRoot	struct
271	get	ModuleMode	int
272	get	ImportMismatchError	struct
273	list	Context	struct
274	list	TrackingWriter	struct
275	load	PerPackageFlag	struct
276	load	Package	struct
277	load	PackagePublic	struct
278	load	PackageInternal	struct
279	load	NoGoError	struct
280	load	CoverVar	struct
281	load	PackageError	struct
282	load	ImportStack	[]string
283	load	TargetDir	int
284	load	TestCover	struct
285	filelock	File	
286	lockedfile	File	struct
287	lockedfile	Mutex	struct
288	codehost	Repo	
289	codehost	RevInfo	struct
290	codehost	FileRev	struct
291	codehost	RunError	struct
292	codehost	VCSError	struct
293	modfetch	Repo	
294	modfetch	RevInfo	struct
295	modfile	Position	struct
296	modfile	Expr	
297	modfile	Comment	struct
298	modfile	Comments	struct
299	modfile	FileSyntax	struct
300	modfile	CommentBlock	struct
301	modfile	Line	struct
302	modfile	LineBlock	struct
303	modfile	LParen	struct
304	modfile	RParen	struct
305	modfile	File	struct
306	modfile	Module	struct
307	modfile	Go	struct
308	modfile	Require	struct
309	modfile	Exclude	struct
310	modfile	Replace	struct
311	modfile	VersionFixer	func(string) (string, error)
312	modinfo	ModulePublic	struct
313	modinfo	ModuleError	struct
314	modload	ImportMissingError	struct
315	module	Version	struct
316	mvs	Reqs	
317	mvs	MissingModuleError	struct
318	par	Work	struct
319	par	Cache	struct
320	search	Match	struct
321	txtar	Archive	struct
322	txtar	File	struct
323	web	HTTPError	struct
324	web	HTTPError	struct
325	web	SecurityMode	int
326	web2	Option	
327	work	Builder	struct
328	work	Action	struct
329	work	BuildMode	int
330	p	A1	
331	p	B1	
332	p	C1	
333	p	D1	
334	bio	Reader	struct
335	bio	Writer	struct
336	dwarf	Sym	
337	dwarf	Var	struct
338	dwarf	Scope	struct
339	dwarf	Range	struct
340	dwarf	FnState	struct
341	dwarf	InlCalls	struct
342	dwarf	InlCall	struct
343	dwarf	Context	
344	dwarf	DWAttr	struct
345	dwarf	DWDie	struct
346	dwarf	VarsByOffset	[]*dwarf.Var
347	edit	Buffer	struct
348	gcprog	Writer	struct
349	goobj	Sym	struct
350	goobj	SymID	struct
351	goobj	Data	struct
352	goobj	Reloc	struct
353	goobj	Var	struct
354	goobj	Func	struct
355	goobj	FuncData	struct
356	goobj	InlinedCall	struct
357	goobj	Package	struct
358	goobj	NativeReader	struct
359	arm	Optab	struct
360	arm	Opcross	[][][]uint8
361	arm64	Optab	struct
362	obj	InlTree	struct
363	obj	InlinedCall	struct
364	obj	Addr	struct
365	obj	AddrName	int8
366	obj	AddrType	uint8
367	obj	Prog	struct
368	obj	As	int16
369	obj	LSym	struct
370	obj	FuncInfo	struct
371	obj	InlMark	struct
372	obj	ABI	uint8
373	obj	Attribute	uint16
374	obj	Pcln	struct
375	obj	Reloc	struct
376	obj	Auto	struct
377	obj	Pcdata	struct
378	obj	Link	struct
379	obj	LinkArch	struct
380	mips	Optab	struct
381	mips	Dep	struct
382	mips	Sch	struct
383	obj	DwarfFixupTable	struct
384	obj	Plist	struct
385	obj	ProgAlloc	func() *obj.Prog
386	ppc64	Optab	struct
387	s390x	Optab	struct
388	x86	Optab	struct
389	x86	Movtab	struct
390	x86	AsmBuf	struct
391	objabi	FuncID	uint8
392	objabi	HeadType	uint8
393	objabi	RelocType	int32
394	objabi	SymKind	uint8
395	objfile	Disasm	struct
396	objfile	CachedFile	struct
397	objfile	FileCache	struct
398	objfile	Liner	
399	objfile	File	struct
400	objfile	Entry	struct
401	objfile	Sym	struct
402	objfile	Reloc	struct
403	objfile	RelocStringer	
404	src	Pos	struct
405	src	PosBase	struct
406	src	PosXlogue	uint
407	src	XPos	struct
408	src	PosTable	struct
409	sys	ArchFamily	byte
410	sys	Arch	struct
411	test2json	Mode	int
412	ld	ArHdr	struct
413	ld	BuildMode	uint8
414	ld	LinkMode	uint8
415	ld	GCProg	struct
416	ld	ElfEhdr	struct
417	ld	ElfShdr	struct
418	ld	ElfPhdr	struct
419	ld	Elfstring	struct
420	ld	Elfaux	struct
421	ld	Elflib	struct
422	ld	Pkg	struct
423	ld	Arch	struct
424	ld	Hostobj	struct
425	ld	SymbolType	int8
426	ld	Shlib	struct
427	ld	Link	struct
428	ld	Pciter	struct
429	ld	MachoHdr	struct
430	ld	MachoSect	struct
431	ld	MachoSeg	struct
432	ld	MachoLoad	struct
433	ld	Rpath	struct
434	ld	OutBuf	struct
435	ld	IMAGE_IMPORT_DESCRIPTOR	struct
436	ld	IMAGE_EXPORT_DIRECTORY	struct
437	ld	Imp	struct
438	ld	Dll	struct
439	a	FuncReturningInt	func() int
440	ld	XcoffFileHdr64	struct
441	ld	XcoffAoutHdr64	struct
442	ld	XcoffScnHdr64	struct
443	ld	XcoffSymEnt64	struct
444	ld	XcoffAuxFile64	struct
445	ld	XcoffAuxFcn64	struct
446	ld	XcoffAuxCSect64	struct
447	ld	XcoffLdHdr64	struct
448	ld	XcoffLdSym64	struct
449	ld	XcoffLdImportFile64	struct
450	ld	XcoffLdRel64	struct
451	ld	XcoffLdStr64	struct
452	loadelf	ElfHdrBytes	struct
453	loadelf	ElfSectBytes	struct
454	loadelf	ElfProgBytes	struct
455	loadelf	ElfSymBytes	struct
456	loadelf	ElfHdrBytes64	struct
457	loadelf	ElfSectBytes64	struct
458	loadelf	ElfProgBytes64	struct
459	loadelf	ElfSymBytes64	struct
460	loadelf	ElfSect	struct
461	loadelf	ElfObj	struct
462	loadelf	ElfSym	struct
463	sym	Attribute	int32
464	sym	Library	struct
465	sym	Reloc	struct
466	sym	RelocVariant	uint8
467	sym	RelocByOff	[]sym.Reloc
468	sym	Segment	struct
469	sym	Section	struct
470	sym	Symbol	struct
471	sym	AuxSymbol	struct
472	sym	FuncInfo	struct
473	sym	InlinedCall	struct
474	sym	Pcdata	struct
475	sym	Auto	struct
476	sym	Symbols	struct
477	sym	SymKind	uint8
478	main	Archive	struct
479	main	Entry	struct
480	main	FileLike	
481	main	Record	struct
482	main	Range	struct
483	main	ViewerData	struct
484	main	ViewerEvent	struct
485	main	ViewerFrame	struct
486	main	NameArg	struct
487	main	TaskArg	struct
488	main	RegionArg	struct
489	main	SortIndexArg	struct
490	main	Arg	struct
491	main	Arg	struct
492	driver	HTTPServerArgs	plugin.HTTPServerArgs
493	driver	Options	struct
494	driver	Writer	
495	driver	FlagSet	
496	driver	Fetcher	
497	driver	Symbolizer	
498	driver	MappingSources	map[string][]
499	driver	ObjTool	
500	driver	Inst	struct
501	driver	ObjFile	
502	driver	Frame	struct
503	driver	Sym	struct
504	driver	UI	
505	binutils	Binutils	struct
506	driver	PostProcessor	func(io.Reader, io.Writer, plugin.UI) error
507	driver	GoFlags	struct
508	graph	DotAttributes	struct
509	graph	DotNodeAttributes	struct
510	graph	DotConfig	struct
511	graph	Graph	struct
512	graph	Options	struct
513	graph	Nodes	[]*graph.Node
514	graph	Node	struct
515	graph	NodeInfo	struct
516	graph	NodeMap	map[graph.NodeInfo]*graph.Node
517	graph	NodeSet	map[graph.NodeInfo]bool
518	graph	NodePtrSet	map[*graph.Node]bool
519	graph	EdgeMap	map[*graph.Node]*graph.Edge
520	graph	Edge	struct
521	graph	Tag	struct
522	graph	TagMap	map[string]*graph.Tag
523	graph	NodeOrder	int
524	plugin	Options	struct
525	plugin	Writer	
526	plugin	FlagSet	
527	plugin	Fetcher	
528	plugin	Symbolizer	
529	plugin	MappingSources	map[string][]
530	plugin	ObjTool	
531	plugin	Inst	struct
532	plugin	ObjFile	
533	plugin	Frame	struct
534	plugin	Sym	struct
535	plugin	UI	
536	plugin	HTTPServerArgs	struct
537	proftest	TestUI	struct
538	report	Options	struct
539	report	TextItem	struct
540	report	Report	struct
541	symbolizer	Symbolizer	struct
542	profile	TagMatch	func(*profile.Sample) bool
543	profile	Profile	struct
544	profile	ValueType	struct
545	profile	Sample	struct
546	profile	Mapping	struct
547	profile	Location	struct
548	profile	Line	struct
549	profile	Function	struct
550	demangle	AST	
551	demangle	Name	struct
552	demangle	Typed	struct
553	demangle	Qualified	struct
554	demangle	Template	struct
555	demangle	TemplateParam	struct
556	demangle	Qualifiers	[]string
557	demangle	TypeWithQualifiers	struct
558	demangle	MethodWithQualifiers	struct
559	demangle	BuiltinType	struct
560	demangle	PointerType	struct
561	demangle	ReferenceType	struct
562	demangle	RvalueReferenceType	struct
563	demangle	ComplexType	struct
564	demangle	ImaginaryType	struct
565	demangle	VendorQualifier	struct
566	demangle	ArrayType	struct
567	demangle	FunctionType	struct
568	demangle	FunctionParam	struct
569	demangle	PtrMem	struct
570	demangle	FixedType	struct
571	demangle	VectorType	struct
572	demangle	Decltype	struct
573	demangle	Operator	struct
574	demangle	Constructor	struct
575	demangle	Destructor	struct
576	demangle	GlobalCDtor	struct
577	demangle	TaggedName	struct
578	demangle	PackExpansion	struct
579	demangle	ArgumentPack	struct
580	demangle	SizeofPack	struct
581	demangle	SizeofArgs	struct
582	demangle	Cast	struct
583	demangle	Nullary	struct
584	demangle	Unary	struct
585	demangle	Binary	struct
586	demangle	Trinary	struct
587	demangle	Fold	struct
588	demangle	New	struct
589	demangle	Literal	struct
590	demangle	ExprList	struct
591	demangle	InitializerList	struct
592	demangle	DefaultArg	struct
593	demangle	Closure	struct
594	demangle	UnnamedType	struct
595	demangle	Clone	struct
596	demangle	Special	struct
597	demangle	Special2	struct
598	demangle	Option	int
599	armasm	Mode	int
600	armasm	Op	uint16
601	armasm	Inst	struct
602	armasm	Args	[]armasm.Arg
603	armasm	Arg	
604	armasm	Float32Imm	float32
605	armasm	Float64Imm	float32
606	armasm	Imm	uint32
607	armasm	ImmAlt	struct
608	armasm	Label	uint32
609	armasm	Reg	uint8
610	armasm	RegX	struct
611	armasm	RegList	uint16
612	armasm	Endian	uint8
613	armasm	Shift	uint8
614	armasm	RegShift	struct
615	armasm	RegShiftReg	struct
616	armasm	PCRel	int32
617	armasm	AddrMode	uint8
618	armasm	Mem	struct
619	arm64asm	Sys	uint8
620	arm64asm	Op	uint16
621	arm64asm	Inst	struct
622	arm64asm	Args	[]arm64asm.Arg
623	arm64asm	Arg	
624	arm64asm	Reg	uint16
625	arm64asm	RegSP	arm64asm.Reg
626	arm64asm	ImmShift	struct
627	arm64asm	ExtShift	uint8
628	arm64asm	RegExtshiftAmount	struct
629	arm64asm	PCRel	int64
630	arm64asm	AddrMode	uint8
631	arm64asm	MemImmediate	struct
632	arm64asm	MemExtend	struct
633	arm64asm	Imm	struct
634	arm64asm	Imm64	struct
635	arm64asm	Imm_hint	uint8
636	arm64asm	Imm_clrex	uint8
637	arm64asm	Imm_dcps	uint16
638	arm64asm	Cond	struct
639	arm64asm	Imm_c	uint8
640	arm64asm	Imm_option	uint8
641	arm64asm	Imm_prfop	uint8
642	arm64asm	Pstatefield	uint8
643	arm64asm	Systemreg	struct
644	arm64asm	Imm_fp	struct
645	arm64asm	Arrangement	uint8
646	arm64asm	RegisterWithArrangement	struct
647	arm64asm	RegisterWithArrangementAndIndex	struct
648	ppc64asm	ArgType	int8
649	ppc64asm	BitField	struct
650	ppc64asm	BitFields	[]ppc64asm.BitField
651	ppc64asm	Inst	struct
652	ppc64asm	Op	uint16
653	ppc64asm	Arg	
654	ppc64asm	Args	[]ppc64asm.Arg
655	ppc64asm	Reg	uint16
656	ppc64asm	CondReg	int8
657	ppc64asm	SpReg	uint16
658	ppc64asm	PCRel	int32
659	ppc64asm	Label	uint32
660	ppc64asm	Imm	int32
661	ppc64asm	Offset	int32
662	x86asm	Inst	struct
663	x86asm	Prefixes	[]x86asm.Prefix
664	x86asm	Prefix	uint16
665	x86asm	Op	uint32
666	x86asm	Args	[]x86asm.Arg
667	x86asm	Arg	
668	x86asm	Reg	uint8
669	x86asm	Mem	struct
670	x86asm	Rel	int32
671	x86asm	Imm	int64
672	x86asm	SymLookup	func(uint64) (string, uint64)
673	terminal	EscapeCodes	struct
674	terminal	Terminal	struct
675	terminal	State	struct
676	terminal	State	struct
677	terminal	State	struct
678	terminal	State	struct
679	unix	CPUSet	[]unix.cpuMask
680	unix	Signal	syscall.Signal
681	unix	Errno	syscall.Errno
682	unix	SysProcAttr	syscall.SysProcAttr
683	unix	SocketControlMessage	struct
684	unix	WaitStatus	uint32
685	unix	WaitStatus	uint32
686	unix	SockaddrDatalink	struct
687	unix	SockaddrDatalink	struct
688	unix	SockaddrDatalink	struct
689	unix	WaitStatus	uint32
690	unix	SockaddrLinklayer	struct
691	unix	SockaddrNetlink	struct
692	unix	SockaddrHCI	struct
693	unix	SockaddrL2	struct
694	unix	SockaddrRFCOMM	struct
695	unix	SockaddrCAN	struct
696	unix	SockaddrALG	struct
697	unix	SockaddrVM	struct
698	unix	SockaddrXDP	struct
699	unix	SockaddrPPPoE	struct
700	unix	SockaddrDatalink	struct
701	unix	SockaddrDatalink	struct
702	unix	SockaddrDatalink	struct
703	unix	WaitStatus	uint32
704	unix	Sockaddr	
705	unix	SockaddrInet4	struct
706	unix	SockaddrInet6	struct
707	unix	SockaddrUnix	struct
708	unix	PtraceRegs386	struct
709	unix	PtraceRegsAmd64	struct
710	unix	PtraceRegsArm	struct
711	unix	PtraceRegsArm64	struct
712	unix	PtraceRegsMips	struct
713	unix	PtraceRegsMips64	struct
714	unix	PtraceRegsMipsle	struct
715	unix	PtraceRegsMips64le	struct
716	unix	Mode_t	uint32
717	unix	Timespec	struct
718	unix	StTimespec	struct
719	unix	Timeval	struct
720	unix	Timeval32	struct
721	unix	Timex	struct
722	unix	Time_t	int32
723	unix	Tms	struct
724	unix	Utimbuf	struct
725	unix	Timezone	struct
726	unix	Rusage	struct
727	unix	Rlimit	struct
728	unix	Pid_t	int32
729	unix	Stat_t	struct
730	unix	StatxTimestamp	struct
731	unix	Statx_t	struct
732	unix	Dirent	struct
733	unix	RawSockaddrInet4	struct
734	unix	RawSockaddrInet6	struct
735	unix	RawSockaddrUnix	struct
736	unix	RawSockaddr	struct
737	unix	RawSockaddrAny	struct
738	unix	Cmsghdr	struct
739	unix	ICMPv6Filter	struct
740	unix	Iovec	struct
741	unix	IPMreq	struct
742	unix	IPv6Mreq	struct
743	unix	IPv6MTUInfo	struct
744	unix	Linger	struct
745	unix	Msghdr	struct
746	unix	IfMsgHdr	struct
747	unix	FdSet	struct
748	unix	Utsname	struct
749	unix	Ustat_t	struct
750	unix	Sigset_t	struct
751	unix	Termios	struct
752	unix	Termio	struct
753	unix	Winsize	struct
754	unix	PollFd	struct
755	unix	Flock_t	struct
756	unix	Fsid_t	struct
757	unix	Fsid64_t	struct
758	unix	Statfs_t	struct
759	unix	Mode_t	uint32
760	unix	Timespec	struct
761	unix	StTimespec	struct
762	unix	Timeval	struct
763	unix	Timeval32	struct
764	unix	Timex	struct
765	unix	Time_t	int64
766	unix	Tms	struct
767	unix	Utimbuf	struct
768	unix	Timezone	struct
769	unix	Rusage	struct
770	unix	Rlimit	struct
771	unix	Pid_t	int32
772	unix	Stat_t	struct
773	unix	StatxTimestamp	struct
774	unix	Statx_t	struct
775	unix	Dirent	struct
776	unix	RawSockaddrInet4	struct
777	unix	RawSockaddrInet6	struct
778	unix	RawSockaddrUnix	struct
779	unix	RawSockaddr	struct
780	unix	RawSockaddrAny	struct
781	unix	Cmsghdr	struct
782	unix	ICMPv6Filter	struct
783	unix	Iovec	struct
784	unix	IPMreq	struct
785	unix	IPv6Mreq	struct
786	unix	IPv6MTUInfo	struct
787	unix	Linger	struct
788	unix	Msghdr	struct
789	unix	IfMsgHdr	struct
790	unix	FdSet	struct
791	unix	Utsname	struct
792	unix	Ustat_t	struct
793	unix	Sigset_t	struct
794	unix	Termios	struct
795	unix	Termio	struct
796	unix	Winsize	struct
797	unix	PollFd	struct
798	unix	Flock_t	struct
799	unix	Fsid_t	struct
800	unix	Fsid64_t	struct
801	unix	Statfs_t	struct
802	unix	Timespec	struct
803	unix	Timeval	struct
804	unix	Timeval32	struct
805	unix	Rusage	struct
806	unix	Rlimit	struct
807	unix	Stat_t	struct
808	unix	Statfs_t	struct
809	unix	Flock_t	struct
810	unix	Fstore_t	struct
811	unix	Radvisory_t	struct
812	unix	Fbootstraptransfer_t	struct
813	unix	Log2phys_t	struct
814	unix	Fsid	struct
815	unix	Dirent	struct
816	unix	RawSockaddrInet4	struct
817	unix	RawSockaddrInet6	struct
818	unix	RawSockaddrUnix	struct
819	unix	RawSockaddrDatalink	struct
820	unix	RawSockaddr	struct
821	unix	RawSockaddrAny	struct
822	unix	Linger	struct
823	unix	Iovec	struct
824	unix	IPMreq	struct
825	unix	IPv6Mreq	struct
826	unix	Msghdr	struct
827	unix	Cmsghdr	struct
828	unix	Inet4Pktinfo	struct
829	unix	Inet6Pktinfo	struct
830	unix	IPv6MTUInfo	struct
831	unix	ICMPv6Filter	struct
832	unix	Kevent_t	struct
833	unix	FdSet	struct
834	unix	IfMsghdr	struct
835	unix	IfData	struct
836	unix	IfaMsghdr	struct
837	unix	IfmaMsghdr	struct
838	unix	IfmaMsghdr2	struct
839	unix	RtMsghdr	struct
840	unix	RtMetrics	struct
841	unix	BpfVersion	struct
842	unix	BpfStat	struct
843	unix	BpfProgram	struct
844	unix	BpfInsn	struct
845	unix	BpfHdr	struct
846	unix	Termios	struct
847	unix	Winsize	struct
848	unix	PollFd	struct
849	unix	Utsname	struct
850	unix	Timespec	struct
851	unix	Timeval	struct
852	unix	Timeval32	struct
853	unix	Rusage	struct
854	unix	Rlimit	struct
855	unix	Stat_t	struct
856	unix	Statfs_t	struct
857	unix	Flock_t	struct
858	unix	Fstore_t	struct
859	unix	Radvisory_t	struct
860	unix	Fbootstraptransfer_t	struct
861	unix	Log2phys_t	struct
862	unix	Fsid	struct
863	unix	Dirent	struct
864	unix	RawSockaddrInet4	struct
865	unix	RawSockaddrInet6	struct
866	unix	RawSockaddrUnix	struct
867	unix	RawSockaddrDatalink	struct
868	unix	RawSockaddr	struct
869	unix	RawSockaddrAny	struct
870	unix	Linger	struct
871	unix	Iovec	struct
872	unix	IPMreq	struct
873	unix	IPv6Mreq	struct
874	unix	Msghdr	struct
875	unix	Cmsghdr	struct
876	unix	Inet4Pktinfo	struct
877	unix	Inet6Pktinfo	struct
878	unix	IPv6MTUInfo	struct
879	unix	ICMPv6Filter	struct
880	unix	Kevent_t	struct
881	unix	FdSet	struct
882	unix	IfMsghdr	struct
883	unix	IfData	struct
884	unix	IfaMsghdr	struct
885	unix	IfmaMsghdr	struct
886	unix	IfmaMsghdr2	struct
887	unix	RtMsghdr	struct
888	unix	RtMetrics	struct
889	unix	BpfVersion	struct
890	unix	BpfStat	struct
891	unix	BpfProgram	struct
892	unix	BpfInsn	struct
893	unix	BpfHdr	struct
894	unix	Termios	struct
895	unix	Winsize	struct
896	unix	PollFd	struct
897	unix	Utsname	struct
898	unix	Timespec	struct
899	unix	Timeval	struct
900	unix	Timeval32	[]byte
901	unix	Rusage	struct
902	unix	Rlimit	struct
903	unix	Stat_t	struct
904	unix	Statfs_t	struct
905	unix	Flock_t	struct
906	unix	Fstore_t	struct
907	unix	Radvisory_t	struct
908	unix	Fbootstraptransfer_t	struct
909	unix	Log2phys_t	struct
910	unix	Fsid	struct
911	unix	Dirent	struct
912	unix	RawSockaddrInet4	struct
913	unix	RawSockaddrInet6	struct
914	unix	RawSockaddrUnix	struct
915	unix	RawSockaddrDatalink	struct
916	unix	RawSockaddr	struct
917	unix	RawSockaddrAny	struct
918	unix	Linger	struct
919	unix	Iovec	struct
920	unix	IPMreq	struct
921	unix	IPv6Mreq	struct
922	unix	Msghdr	struct
923	unix	Cmsghdr	struct
924	unix	Inet4Pktinfo	struct
925	unix	Inet6Pktinfo	struct
926	unix	IPv6MTUInfo	struct
927	unix	ICMPv6Filter	struct
928	unix	Kevent_t	struct
929	unix	FdSet	struct
930	unix	IfMsghdr	struct
931	unix	IfData	struct
932	unix	IfaMsghdr	struct
933	unix	IfmaMsghdr	struct
934	unix	IfmaMsghdr2	struct
935	unix	RtMsghdr	struct
936	unix	RtMetrics	struct
937	unix	BpfVersion	struct
938	unix	BpfStat	struct
939	unix	BpfProgram	struct
940	unix	BpfInsn	struct
941	unix	BpfHdr	struct
942	unix	Termios	struct
943	unix	Winsize	struct
944	unix	PollFd	struct
945	unix	Utsname	struct
946	unix	Timespec	struct
947	unix	Timeval	struct
948	unix	Timeval32	struct
949	unix	Rusage	struct
950	unix	Rlimit	struct
951	unix	Stat_t	struct
952	unix	Statfs_t	struct
953	unix	Flock_t	struct
954	unix	Fstore_t	struct
955	unix	Radvisory_t	struct
956	unix	Fbootstraptransfer_t	struct
957	unix	Log2phys_t	struct
958	unix	Fsid	struct
959	unix	Dirent	struct
960	unix	RawSockaddrInet4	struct
961	unix	RawSockaddrInet6	struct
962	unix	RawSockaddrUnix	struct
963	unix	RawSockaddrDatalink	struct
964	unix	RawSockaddr	struct
965	unix	RawSockaddrAny	struct
966	unix	Linger	struct
967	unix	Iovec	struct
968	unix	IPMreq	struct
969	unix	IPv6Mreq	struct
970	unix	Msghdr	struct
971	unix	Cmsghdr	struct
972	unix	Inet4Pktinfo	struct
973	unix	Inet6Pktinfo	struct
974	unix	IPv6MTUInfo	struct
975	unix	ICMPv6Filter	struct
976	unix	Kevent_t	struct
977	unix	FdSet	struct
978	unix	IfMsghdr	struct
979	unix	IfData	struct
980	unix	IfaMsghdr	struct
981	unix	IfmaMsghdr	struct
982	unix	IfmaMsghdr2	struct
983	unix	RtMsghdr	struct
984	unix	RtMetrics	struct
985	unix	BpfVersion	struct
986	unix	BpfStat	struct
987	unix	BpfProgram	struct
988	unix	BpfInsn	struct
989	unix	BpfHdr	struct
990	unix	Termios	struct
991	unix	Winsize	struct
992	unix	PollFd	struct
993	unix	Utsname	struct
994	unix	Timespec	struct
995	unix	Timeval	struct
996	unix	Rusage	struct
997	unix	Rlimit	struct
998	unix	Stat_t	struct
999	unix	Statfs_t	struct
1000	unix	Flock_t	struct
1001	unix	Dirent	struct
1002	unix	Fsid	struct
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
1015	unix	Inet6Pktinfo	struct
1016	unix	IPv6MTUInfo	struct
1017	unix	ICMPv6Filter	struct
1018	unix	Kevent_t	struct
1019	unix	FdSet	struct
1020	unix	IfMsghdr	struct
1021	unix	IfData	struct
1022	unix	IfaMsghdr	struct
1023	unix	IfmaMsghdr	struct
1024	unix	IfAnnounceMsghdr	struct
1025	unix	RtMsghdr	struct
1026	unix	RtMetrics	struct
1027	unix	BpfVersion	struct
1028	unix	BpfStat	struct
1029	unix	BpfProgram	struct
1030	unix	BpfInsn	struct
1031	unix	BpfHdr	struct
1032	unix	Termios	struct
1033	unix	Winsize	struct
1034	unix	PollFd	struct
1035	unix	Utsname	struct
1036	unix	Timespec	struct
1037	unix	Timeval	struct
1038	unix	Rusage	struct
1039	unix	Rlimit	struct
1040	unix	Stat_t	struct
1041	unix	Statfs_t	struct
1042	unix	Flock_t	struct
1043	unix	Dirent	struct
1044	unix	Fsid	struct
1045	unix	RawSockaddrInet4	struct
1046	unix	RawSockaddrInet6	struct
1047	unix	RawSockaddrUnix	struct
1048	unix	RawSockaddrDatalink	struct
1049	unix	RawSockaddr	struct
1050	unix	RawSockaddrAny	struct
1051	unix	Linger	struct
1052	unix	Iovec	struct
1053	unix	IPMreq	struct
1054	unix	IPMreqn	struct
1055	unix	IPv6Mreq	struct
1056	unix	Msghdr	struct
1057	unix	Cmsghdr	struct
1058	unix	Inet6Pktinfo	struct
1059	unix	IPv6MTUInfo	struct
1060	unix	ICMPv6Filter	struct
1061	unix	Kevent_t	struct
1062	unix	FdSet	struct
1063	unix	IfMsghdr	struct
1064	unix	IfData	struct
1065	unix	IfaMsghdr	struct
1066	unix	IfmaMsghdr	struct
1067	unix	IfAnnounceMsghdr	struct
1068	unix	RtMsghdr	struct
1069	unix	RtMetrics	struct
1070	unix	BpfVersion	struct
1071	unix	BpfStat	struct
1072	unix	BpfZbuf	struct
1073	unix	BpfProgram	struct
1074	unix	BpfInsn	struct
1075	unix	BpfHdr	struct
1076	unix	BpfZbufHeader	struct
1077	unix	Termios	struct
1078	unix	Winsize	struct
1079	unix	PollFd	struct
1080	unix	CapRights	struct
1081	unix	Utsname	struct
1082	unix	Timespec	struct
1083	unix	Timeval	struct
1084	unix	Rusage	struct
1085	unix	Rlimit	struct
1086	unix	Stat_t	struct
1087	unix	Statfs_t	struct
1088	unix	Flock_t	struct
1089	unix	Dirent	struct
1090	unix	Fsid	struct
1091	unix	RawSockaddrInet4	struct
1092	unix	RawSockaddrInet6	struct
1093	unix	RawSockaddrUnix	struct
1094	unix	RawSockaddrDatalink	struct
1095	unix	RawSockaddr	struct
1096	unix	RawSockaddrAny	struct
1097	unix	Linger	struct
1098	unix	Iovec	struct
1099	unix	IPMreq	struct
1100	unix	IPMreqn	struct
1101	unix	IPv6Mreq	struct
1102	unix	Msghdr	struct
1103	unix	Cmsghdr	struct
1104	unix	Inet6Pktinfo	struct
1105	unix	IPv6MTUInfo	struct
1106	unix	ICMPv6Filter	struct
1107	unix	Kevent_t	struct
1108	unix	FdSet	struct
1109	unix	IfMsghdr	struct
1110	unix	IfData	struct
1111	unix	IfaMsghdr	struct
1112	unix	IfmaMsghdr	struct
1113	unix	IfAnnounceMsghdr	struct
1114	unix	RtMsghdr	struct
1115	unix	RtMetrics	struct
1116	unix	BpfVersion	struct
1117	unix	BpfStat	struct
1118	unix	BpfZbuf	struct
1119	unix	BpfProgram	struct
1120	unix	BpfInsn	struct
1121	unix	BpfHdr	struct
1122	unix	BpfZbufHeader	struct
1123	unix	Termios	struct
1124	unix	Winsize	struct
1125	unix	PollFd	struct
1126	unix	CapRights	struct
1127	unix	Utsname	struct
1128	unix	Timespec	struct
1129	unix	Timeval	struct
1130	unix	Rusage	struct
1131	unix	Rlimit	struct
1132	unix	Stat_t	struct
1133	unix	Statfs_t	struct
1134	unix	Flock_t	struct
1135	unix	Dirent	struct
1136	unix	Fsid	struct
1137	unix	RawSockaddrInet4	struct
1138	unix	RawSockaddrInet6	struct
1139	unix	RawSockaddrUnix	struct
1140	unix	RawSockaddrDatalink	struct
1141	unix	RawSockaddr	struct
1142	unix	RawSockaddrAny	struct
1143	unix	Linger	struct
1144	unix	Iovec	struct
1145	unix	IPMreq	struct
1146	unix	IPMreqn	struct
1147	unix	IPv6Mreq	struct
1148	unix	Msghdr	struct
1149	unix	Cmsghdr	struct
1150	unix	Inet6Pktinfo	struct
1151	unix	IPv6MTUInfo	struct
1152	unix	ICMPv6Filter	struct
1153	unix	Kevent_t	struct
1154	unix	FdSet	struct
1155	unix	IfMsghdr	struct
1156	unix	IfData	struct
1157	unix	IfaMsghdr	struct
1158	unix	IfmaMsghdr	struct
1159	unix	IfAnnounceMsghdr	struct
1160	unix	RtMsghdr	struct
1161	unix	RtMetrics	struct
1162	unix	BpfVersion	struct
1163	unix	BpfStat	struct
1164	unix	BpfZbuf	struct
1165	unix	BpfProgram	struct
1166	unix	BpfInsn	struct
1167	unix	BpfHdr	struct
1168	unix	BpfZbufHeader	struct
1169	unix	Termios	struct
1170	unix	Winsize	struct
1171	unix	PollFd	struct
1172	unix	CapRights	struct
1173	unix	Utsname	struct
1174	unix	Timespec	struct
1175	unix	Timeval	struct
1176	unix	Rusage	struct
1177	unix	Rlimit	struct
1178	unix	Stat_t	struct
1179	unix	Statfs_t	struct
1180	unix	Flock_t	struct
1181	unix	Dirent	struct
1182	unix	Fsid	struct
1183	unix	RawSockaddrInet4	struct
1184	unix	RawSockaddrInet6	struct
1185	unix	RawSockaddrUnix	struct
1186	unix	RawSockaddrDatalink	struct
1187	unix	RawSockaddr	struct
1188	unix	RawSockaddrAny	struct
1189	unix	Linger	struct
1190	unix	Iovec	struct
1191	unix	IPMreq	struct
1192	unix	IPMreqn	struct
1193	unix	IPv6Mreq	struct
1194	unix	Msghdr	struct
1195	unix	Cmsghdr	struct
1196	unix	Inet6Pktinfo	struct
1197	unix	IPv6MTUInfo	struct
1198	unix	ICMPv6Filter	struct
1199	unix	Kevent_t	struct
1200	unix	FdSet	struct
1201	unix	IfMsghdr	struct
1202	unix	IfData	struct
1203	unix	IfaMsghdr	struct
1204	unix	IfmaMsghdr	struct
1205	unix	IfAnnounceMsghdr	struct
1206	unix	RtMsghdr	struct
1207	unix	RtMetrics	struct
1208	unix	BpfVersion	struct
1209	unix	BpfStat	struct
1210	unix	BpfZbuf	struct
1211	unix	BpfProgram	struct
1212	unix	BpfInsn	struct
1213	unix	BpfHdr	struct
1214	unix	BpfZbufHeader	struct
1215	unix	Termios	struct
1216	unix	Winsize	struct
1217	unix	PollFd	struct
1218	unix	CapRights	struct
1219	unix	Utsname	struct
1220	unix	Timespec	struct
1221	unix	Timeval	struct
1222	unix	Timex	struct
1223	unix	Time_t	int32
1224	unix	Tms	struct
1225	unix	Utimbuf	struct
1226	unix	Rusage	struct
1227	unix	Rlimit	struct
1228	unix	Stat_t	struct
1229	unix	StatxTimestamp	struct
1230	unix	Statx_t	struct
1231	unix	Dirent	struct
1232	unix	Fsid	struct
1233	unix	Flock_t	struct
1234	unix	FscryptPolicy	struct
1235	unix	FscryptKey	struct
1236	unix	KeyctlDHParams	struct
1237	unix	RawSockaddrInet4	struct
1238	unix	RawSockaddrInet6	struct
1239	unix	RawSockaddrUnix	struct
1240	unix	RawSockaddrLinklayer	struct
1241	unix	RawSockaddrNetlink	struct
1242	unix	RawSockaddrHCI	struct
1243	unix	RawSockaddrL2	struct
1244	unix	RawSockaddrRFCOMM	struct
1245	unix	RawSockaddrCAN	struct
1246	unix	RawSockaddrALG	struct
1247	unix	RawSockaddrVM	struct
1248	unix	RawSockaddrXDP	struct
1249	unix	RawSockaddrPPPoX	[]byte
1250	unix	RawSockaddr	struct
1251	unix	RawSockaddrAny	struct
1252	unix	Linger	struct
1253	unix	Iovec	struct
1254	unix	IPMreq	struct
1255	unix	IPMreqn	struct
1256	unix	IPv6Mreq	struct
1257	unix	PacketMreq	struct
1258	unix	Msghdr	struct
1259	unix	Cmsghdr	struct
1260	unix	Inet4Pktinfo	struct
1261	unix	Inet6Pktinfo	struct
1262	unix	IPv6MTUInfo	struct
1263	unix	ICMPv6Filter	struct
1264	unix	Ucred	struct
1265	unix	TCPInfo	struct
1266	unix	NlMsghdr	struct
1267	unix	NlMsgerr	struct
1268	unix	RtGenmsg	struct
1269	unix	NlAttr	struct
1270	unix	RtAttr	struct
1271	unix	IfInfomsg	struct
1272	unix	IfAddrmsg	struct
1273	unix	RtMsg	struct
1274	unix	RtNexthop	struct
1275	unix	SockFilter	struct
1276	unix	SockFprog	struct
1277	unix	InotifyEvent	struct
1278	unix	PtraceRegs	struct
1279	unix	FdSet	struct
1280	unix	Sysinfo_t	struct
1281	unix	Utsname	struct
1282	unix	Ustat_t	struct
1283	unix	EpollEvent	struct
1284	unix	PollFd	struct
1285	unix	Sigset_t	struct
1286	unix	Termios	struct
1287	unix	Winsize	struct
1288	unix	Taskstats	struct
1289	unix	CGroupStats	struct
1290	unix	Genlmsghdr	struct
1291	unix	PerfEventAttr	struct
1292	unix	PerfEventMmapPage	struct
1293	unix	SockaddrStorage	struct
1294	unix	TCPMD5Sig	struct
1295	unix	HDDriveCmdHdr	struct
1296	unix	HDGeometry	struct
1297	unix	HDDriveID	struct
1298	unix	Statfs_t	struct
1299	unix	TpacketHdr	struct
1300	unix	Tpacket2Hdr	struct
1301	unix	Tpacket3Hdr	struct
1302	unix	TpacketHdrVariant1	struct
1303	unix	TpacketBlockDesc	struct
1304	unix	TpacketReq	struct
1305	unix	TpacketReq3	struct
1306	unix	TpacketStats	struct
1307	unix	TpacketStatsV3	struct
1308	unix	TpacketAuxdata	struct
1309	unix	Nfgenmsg	struct
1310	unix	RTCTime	struct
1311	unix	RTCWkAlrm	struct
1312	unix	RTCPLLInfo	struct
1313	unix	BlkpgIoctlArg	struct
1314	unix	BlkpgPartition	struct
1315	unix	XDPRingOffset	struct
1316	unix	XDPMmapOffsets	struct
1317	unix	XDPUmemReg	struct
1318	unix	XDPStatistics	struct
1319	unix	XDPDesc	struct
1320	unix	Timespec	struct
1321	unix	Timeval	struct
1322	unix	Timex	struct
1323	unix	Time_t	int64
1324	unix	Tms	struct
1325	unix	Utimbuf	struct
1326	unix	Rusage	struct
1327	unix	Rlimit	struct
1328	unix	Stat_t	struct
1329	unix	StatxTimestamp	struct
1330	unix	Statx_t	struct
1331	unix	Dirent	struct
1332	unix	Fsid	struct
1333	unix	Flock_t	struct
1334	unix	FscryptPolicy	struct
1335	unix	FscryptKey	struct
1336	unix	KeyctlDHParams	struct
1337	unix	RawSockaddrInet4	struct
1338	unix	RawSockaddrInet6	struct
1339	unix	RawSockaddrUnix	struct
1340	unix	RawSockaddrLinklayer	struct
1341	unix	RawSockaddrNetlink	struct
1342	unix	RawSockaddrHCI	struct
1343	unix	RawSockaddrL2	struct
1344	unix	RawSockaddrRFCOMM	struct
1345	unix	RawSockaddrCAN	struct
1346	unix	RawSockaddrALG	struct
1347	unix	RawSockaddrVM	struct
1348	unix	RawSockaddrXDP	struct
1349	unix	RawSockaddrPPPoX	[]byte
1350	unix	RawSockaddr	struct
1351	unix	RawSockaddrAny	struct
1352	unix	Linger	struct
1353	unix	Iovec	struct
1354	unix	IPMreq	struct
1355	unix	IPMreqn	struct
1356	unix	IPv6Mreq	struct
1357	unix	PacketMreq	struct
1358	unix	Msghdr	struct
1359	unix	Cmsghdr	struct
1360	unix	Inet4Pktinfo	struct
1361	unix	Inet6Pktinfo	struct
1362	unix	IPv6MTUInfo	struct
1363	unix	ICMPv6Filter	struct
1364	unix	Ucred	struct
1365	unix	TCPInfo	struct
1366	unix	NlMsghdr	struct
1367	unix	NlMsgerr	struct
1368	unix	RtGenmsg	struct
1369	unix	NlAttr	struct
1370	unix	RtAttr	struct
1371	unix	IfInfomsg	struct
1372	unix	IfAddrmsg	struct
1373	unix	RtMsg	struct
1374	unix	RtNexthop	struct
1375	unix	SockFilter	struct
1376	unix	SockFprog	struct
1377	unix	InotifyEvent	struct
1378	unix	PtraceRegs	struct
1379	unix	FdSet	struct
1380	unix	Sysinfo_t	struct
1381	unix	Utsname	struct
1382	unix	Ustat_t	struct
1383	unix	EpollEvent	struct
1384	unix	PollFd	struct
1385	unix	Sigset_t	struct
1386	unix	Termios	struct
1387	unix	Winsize	struct
1388	unix	Taskstats	struct
1389	unix	CGroupStats	struct
1390	unix	Genlmsghdr	struct
1391	unix	PerfEventAttr	struct
1392	unix	PerfEventMmapPage	struct
1393	unix	SockaddrStorage	struct
1394	unix	TCPMD5Sig	struct
1395	unix	HDDriveCmdHdr	struct
1396	unix	HDGeometry	struct
1397	unix	HDDriveID	struct
1398	unix	Statfs_t	struct
1399	unix	TpacketHdr	struct
1400	unix	Tpacket2Hdr	struct
1401	unix	Tpacket3Hdr	struct
1402	unix	TpacketHdrVariant1	struct
1403	unix	TpacketBlockDesc	struct
1404	unix	TpacketReq	struct
1405	unix	TpacketReq3	struct
1406	unix	TpacketStats	struct
1407	unix	TpacketStatsV3	struct
1408	unix	TpacketAuxdata	struct
1409	unix	Nfgenmsg	struct
1410	unix	RTCTime	struct
1411	unix	RTCWkAlrm	struct
1412	unix	RTCPLLInfo	struct
1413	unix	BlkpgIoctlArg	struct
1414	unix	BlkpgPartition	struct
1415	unix	XDPRingOffset	struct
1416	unix	XDPMmapOffsets	struct
1417	unix	XDPUmemReg	struct
1418	unix	XDPStatistics	struct
1419	unix	XDPDesc	struct
1420	unix	Timespec	struct
1421	unix	Timeval	struct
1422	unix	Timex	struct
1423	unix	Time_t	int32
1424	unix	Tms	struct
1425	unix	Utimbuf	struct
1426	unix	Rusage	struct
1427	unix	Rlimit	struct
1428	unix	Stat_t	struct
1429	unix	StatxTimestamp	struct
1430	unix	Statx_t	struct
1431	unix	Dirent	struct
1432	unix	Fsid	struct
1433	unix	Flock_t	struct
1434	unix	FscryptPolicy	struct
1435	unix	FscryptKey	struct
1436	unix	KeyctlDHParams	struct
1437	unix	RawSockaddrInet4	struct
1438	unix	RawSockaddrInet6	struct
1439	unix	RawSockaddrUnix	struct
1440	unix	RawSockaddrLinklayer	struct
1441	unix	RawSockaddrNetlink	struct
1442	unix	RawSockaddrHCI	struct
1443	unix	RawSockaddrL2	struct
1444	unix	RawSockaddrRFCOMM	struct
1445	unix	RawSockaddrCAN	struct
1446	unix	RawSockaddrALG	struct
1447	unix	RawSockaddrVM	struct
1448	unix	RawSockaddrXDP	struct
1449	unix	RawSockaddrPPPoX	[]byte
1450	unix	RawSockaddr	struct
1451	unix	RawSockaddrAny	struct
1452	unix	Linger	struct
1453	unix	Iovec	struct
1454	unix	IPMreq	struct
1455	unix	IPMreqn	struct
1456	unix	IPv6Mreq	struct
1457	unix	PacketMreq	struct
1458	unix	Msghdr	struct
1459	unix	Cmsghdr	struct
1460	unix	Inet4Pktinfo	struct
1461	unix	Inet6Pktinfo	struct
1462	unix	IPv6MTUInfo	struct
1463	unix	ICMPv6Filter	struct
1464	unix	Ucred	struct
1465	unix	TCPInfo	struct
1466	unix	NlMsghdr	struct
1467	unix	NlMsgerr	struct
1468	unix	RtGenmsg	struct
1469	unix	NlAttr	struct
1470	unix	RtAttr	struct
1471	unix	IfInfomsg	struct
1472	unix	IfAddrmsg	struct
1473	unix	RtMsg	struct
1474	unix	RtNexthop	struct
1475	unix	SockFilter	struct
1476	unix	SockFprog	struct
1477	unix	InotifyEvent	struct
1478	unix	PtraceRegs	struct
1479	unix	FdSet	struct
1480	unix	Sysinfo_t	struct
1481	unix	Utsname	struct
1482	unix	Ustat_t	struct
1483	unix	EpollEvent	struct
1484	unix	PollFd	struct
1485	unix	Sigset_t	struct
1486	unix	Termios	struct
1487	unix	Winsize	struct
1488	unix	Taskstats	struct
1489	unix	CGroupStats	struct
1490	unix	Genlmsghdr	struct
1491	unix	PerfEventAttr	struct
1492	unix	PerfEventMmapPage	struct
1493	unix	SockaddrStorage	struct
1494	unix	TCPMD5Sig	struct
1495	unix	HDDriveCmdHdr	struct
1496	unix	HDGeometry	struct
1497	unix	HDDriveID	struct
1498	unix	Statfs_t	struct
1499	unix	TpacketHdr	struct
1500	unix	Tpacket2Hdr	struct
1501	unix	Tpacket3Hdr	struct
1502	unix	TpacketHdrVariant1	struct
1503	unix	TpacketBlockDesc	struct
1504	unix	TpacketReq	struct
1505	unix	TpacketReq3	struct
1506	unix	TpacketStats	struct
1507	unix	TpacketStatsV3	struct
1508	unix	TpacketAuxdata	struct
1509	unix	Nfgenmsg	struct
1510	unix	RTCTime	struct
1511	unix	RTCWkAlrm	struct
1512	unix	RTCPLLInfo	struct
1513	unix	BlkpgIoctlArg	struct
1514	unix	BlkpgPartition	struct
1515	unix	XDPRingOffset	struct
1516	unix	XDPMmapOffsets	struct
1517	unix	XDPUmemReg	struct
1518	unix	XDPStatistics	struct
1519	unix	XDPDesc	struct
1520	unix	Timespec	struct
1521	unix	Timeval	struct
1522	unix	Timex	struct
1523	unix	Time_t	int64
1524	unix	Tms	struct
1525	unix	Utimbuf	struct
1526	unix	Rusage	struct
1527	unix	Rlimit	struct
1528	unix	Stat_t	struct
1529	unix	StatxTimestamp	struct
1530	unix	Statx_t	struct
1531	unix	Dirent	struct
1532	unix	Fsid	struct
1533	unix	Flock_t	struct
1534	unix	FscryptPolicy	struct
1535	unix	FscryptKey	struct
1536	unix	KeyctlDHParams	struct
1537	unix	RawSockaddrInet4	struct
1538	unix	RawSockaddrInet6	struct
1539	unix	RawSockaddrUnix	struct
1540	unix	RawSockaddrLinklayer	struct
1541	unix	RawSockaddrNetlink	struct
1542	unix	RawSockaddrHCI	struct
1543	unix	RawSockaddrL2	struct
1544	unix	RawSockaddrRFCOMM	struct
1545	unix	RawSockaddrCAN	struct
1546	unix	RawSockaddrALG	struct
1547	unix	RawSockaddrVM	struct
1548	unix	RawSockaddrXDP	struct
1549	unix	RawSockaddrPPPoX	[]byte
1550	unix	RawSockaddr	struct
1551	unix	RawSockaddrAny	struct
1552	unix	Linger	struct
1553	unix	Iovec	struct
1554	unix	IPMreq	struct
1555	unix	IPMreqn	struct
1556	unix	IPv6Mreq	struct
1557	unix	PacketMreq	struct
1558	unix	Msghdr	struct
1559	unix	Cmsghdr	struct
1560	unix	Inet4Pktinfo	struct
1561	unix	Inet6Pktinfo	struct
1562	unix	IPv6MTUInfo	struct
1563	unix	ICMPv6Filter	struct
1564	unix	Ucred	struct
1565	unix	TCPInfo	struct
1566	unix	NlMsghdr	struct
1567	unix	NlMsgerr	struct
1568	unix	RtGenmsg	struct
1569	unix	NlAttr	struct
1570	unix	RtAttr	struct
1571	unix	IfInfomsg	struct
1572	unix	IfAddrmsg	struct
1573	unix	RtMsg	struct
1574	unix	RtNexthop	struct
1575	unix	SockFilter	struct
1576	unix	SockFprog	struct
1577	unix	InotifyEvent	struct
1578	unix	PtraceRegs	struct
1579	unix	FdSet	struct
1580	unix	Sysinfo_t	struct
1581	unix	Utsname	struct
1582	unix	Ustat_t	struct
1583	unix	EpollEvent	struct
1584	unix	PollFd	struct
1585	unix	Sigset_t	struct
1586	unix	Termios	struct
1587	unix	Winsize	struct
1588	unix	Taskstats	struct
1589	unix	CGroupStats	struct
1590	unix	Genlmsghdr	struct
1591	unix	PerfEventAttr	struct
1592	unix	PerfEventMmapPage	struct
1593	unix	SockaddrStorage	struct
1594	unix	TCPMD5Sig	struct
1595	unix	HDDriveCmdHdr	struct
1596	unix	HDGeometry	struct
1597	unix	HDDriveID	struct
1598	unix	Statfs_t	struct
1599	unix	TpacketHdr	struct
1600	unix	Tpacket2Hdr	struct
1601	unix	Tpacket3Hdr	struct
1602	unix	TpacketHdrVariant1	struct
1603	unix	TpacketBlockDesc	struct
1604	unix	TpacketReq	struct
1605	unix	TpacketReq3	struct
1606	unix	TpacketStats	struct
1607	unix	TpacketStatsV3	struct
1608	unix	TpacketAuxdata	struct
1609	unix	Nfgenmsg	struct
1610	unix	RTCTime	struct
1611	unix	RTCWkAlrm	struct
1612	unix	RTCPLLInfo	struct
1613	unix	BlkpgIoctlArg	struct
1614	unix	BlkpgPartition	struct
1615	unix	XDPRingOffset	struct
1616	unix	XDPMmapOffsets	struct
1617	unix	XDPUmemReg	struct
1618	unix	XDPStatistics	struct
1619	unix	XDPDesc	struct
1620	unix	Timespec	struct
1621	unix	Timeval	struct
1622	unix	Timex	struct
1623	unix	Time_t	int32
1624	unix	Tms	struct
1625	unix	Utimbuf	struct
1626	unix	Rusage	struct
1627	unix	Rlimit	struct
1628	unix	Stat_t	struct
1629	unix	StatxTimestamp	struct
1630	unix	Statx_t	struct
1631	unix	Dirent	struct
1632	unix	Fsid	struct
1633	unix	Flock_t	struct
1634	unix	FscryptPolicy	struct
1635	unix	FscryptKey	struct
1636	unix	KeyctlDHParams	struct
1637	unix	RawSockaddrInet4	struct
1638	unix	RawSockaddrInet6	struct
1639	unix	RawSockaddrUnix	struct
1640	unix	RawSockaddrLinklayer	struct
1641	unix	RawSockaddrNetlink	struct
1642	unix	RawSockaddrHCI	struct
1643	unix	RawSockaddrL2	struct
1644	unix	RawSockaddrRFCOMM	struct
1645	unix	RawSockaddrCAN	struct
1646	unix	RawSockaddrALG	struct
1647	unix	RawSockaddrVM	struct
1648	unix	RawSockaddrXDP	struct
1649	unix	RawSockaddrPPPoX	[]byte
1650	unix	RawSockaddr	struct
1651	unix	RawSockaddrAny	struct
1652	unix	Linger	struct
1653	unix	Iovec	struct
1654	unix	IPMreq	struct
1655	unix	IPMreqn	struct
1656	unix	IPv6Mreq	struct
1657	unix	PacketMreq	struct
1658	unix	Msghdr	struct
1659	unix	Cmsghdr	struct
1660	unix	Inet4Pktinfo	struct
1661	unix	Inet6Pktinfo	struct
1662	unix	IPv6MTUInfo	struct
1663	unix	ICMPv6Filter	struct
1664	unix	Ucred	struct
1665	unix	TCPInfo	struct
1666	unix	NlMsghdr	struct
1667	unix	NlMsgerr	struct
1668	unix	RtGenmsg	struct
1669	unix	NlAttr	struct
1670	unix	RtAttr	struct
1671	unix	IfInfomsg	struct
1672	unix	IfAddrmsg	struct
1673	unix	RtMsg	struct
1674	unix	RtNexthop	struct
1675	unix	SockFilter	struct
1676	unix	SockFprog	struct
1677	unix	InotifyEvent	struct
1678	unix	PtraceRegs	struct
1679	unix	FdSet	struct
1680	unix	Sysinfo_t	struct
1681	unix	Utsname	struct
1682	unix	Ustat_t	struct
1683	unix	EpollEvent	struct
1684	unix	PollFd	struct
1685	unix	Sigset_t	struct
1686	unix	Termios	struct
1687	unix	Winsize	struct
1688	unix	Taskstats	struct
1689	unix	CGroupStats	struct
1690	unix	Genlmsghdr	struct
1691	unix	PerfEventAttr	struct
1692	unix	PerfEventMmapPage	struct
1693	unix	SockaddrStorage	struct
1694	unix	TCPMD5Sig	struct
1695	unix	HDDriveCmdHdr	struct
1696	unix	HDGeometry	struct
1697	unix	HDDriveID	struct
1698	unix	Statfs_t	struct
1699	unix	TpacketHdr	struct
1700	unix	Tpacket2Hdr	struct
1701	unix	Tpacket3Hdr	struct
1702	unix	TpacketHdrVariant1	struct
1703	unix	TpacketBlockDesc	struct
1704	unix	TpacketReq	struct
1705	unix	TpacketReq3	struct
1706	unix	TpacketStats	struct
1707	unix	TpacketStatsV3	struct
1708	unix	TpacketAuxdata	struct
1709	unix	Nfgenmsg	struct
1710	unix	RTCTime	struct
1711	unix	RTCWkAlrm	struct
1712	unix	RTCPLLInfo	struct
1713	unix	BlkpgIoctlArg	struct
1714	unix	BlkpgPartition	struct
1715	unix	XDPRingOffset	struct
1716	unix	XDPMmapOffsets	struct
1717	unix	XDPUmemReg	struct
1718	unix	XDPStatistics	struct
1719	unix	XDPDesc	struct
1720	unix	Timespec	struct
1721	unix	Timeval	struct
1722	unix	Timex	struct
1723	unix	Time_t	int64
1724	unix	Tms	struct
1725	unix	Utimbuf	struct
1726	unix	Rusage	struct
1727	unix	Rlimit	struct
1728	unix	Stat_t	struct
1729	unix	StatxTimestamp	struct
1730	unix	Statx_t	struct
1731	unix	Dirent	struct
1732	unix	Fsid	struct
1733	unix	Flock_t	struct
1734	unix	FscryptPolicy	struct
1735	unix	FscryptKey	struct
1736	unix	KeyctlDHParams	struct
1737	unix	RawSockaddrInet4	struct
1738	unix	RawSockaddrInet6	struct
1739	unix	RawSockaddrUnix	struct
1740	unix	RawSockaddrLinklayer	struct
1741	unix	RawSockaddrNetlink	struct
1742	unix	RawSockaddrHCI	struct
1743	unix	RawSockaddrL2	struct
1744	unix	RawSockaddrRFCOMM	struct
1745	unix	RawSockaddrCAN	struct
1746	unix	RawSockaddrALG	struct
1747	unix	RawSockaddrVM	struct
1748	unix	RawSockaddrXDP	struct
1749	unix	RawSockaddrPPPoX	[]byte
1750	unix	RawSockaddr	struct
1751	unix	RawSockaddrAny	struct
1752	unix	Linger	struct
1753	unix	Iovec	struct
1754	unix	IPMreq	struct
1755	unix	IPMreqn	struct
1756	unix	IPv6Mreq	struct
1757	unix	PacketMreq	struct
1758	unix	Msghdr	struct
1759	unix	Cmsghdr	struct
1760	unix	Inet4Pktinfo	struct
1761	unix	Inet6Pktinfo	struct
1762	unix	IPv6MTUInfo	struct
1763	unix	ICMPv6Filter	struct
1764	unix	Ucred	struct
1765	unix	TCPInfo	struct
1766	unix	NlMsghdr	struct
1767	unix	NlMsgerr	struct
1768	unix	RtGenmsg	struct
1769	unix	NlAttr	struct
1770	unix	RtAttr	struct
1771	unix	IfInfomsg	struct
1772	unix	IfAddrmsg	struct
1773	unix	RtMsg	struct
1774	unix	RtNexthop	struct
1775	unix	SockFilter	struct
1776	unix	SockFprog	struct
1777	unix	InotifyEvent	struct
1778	unix	PtraceRegs	struct
1779	unix	FdSet	struct
1780	unix	Sysinfo_t	struct
1781	unix	Utsname	struct
1782	unix	Ustat_t	struct
1783	unix	EpollEvent	struct
1784	unix	PollFd	struct
1785	unix	Sigset_t	struct
1786	unix	Termios	struct
1787	unix	Winsize	struct
1788	unix	Taskstats	struct
1789	unix	CGroupStats	struct
1790	unix	Genlmsghdr	struct
1791	unix	PerfEventAttr	struct
1792	unix	PerfEventMmapPage	struct
1793	unix	SockaddrStorage	struct
1794	unix	TCPMD5Sig	struct
1795	unix	HDDriveCmdHdr	struct
1796	unix	HDGeometry	struct
1797	unix	HDDriveID	struct
1798	unix	Statfs_t	struct
1799	unix	TpacketHdr	struct
1800	unix	Tpacket2Hdr	struct
1801	unix	Tpacket3Hdr	struct
1802	unix	TpacketHdrVariant1	struct
1803	unix	TpacketBlockDesc	struct
1804	unix	TpacketReq	struct
1805	unix	TpacketReq3	struct
1806	unix	TpacketStats	struct
1807	unix	TpacketStatsV3	struct
1808	unix	TpacketAuxdata	struct
1809	unix	Nfgenmsg	struct
1810	unix	RTCTime	struct
1811	unix	RTCWkAlrm	struct
1812	unix	RTCPLLInfo	struct
1813	unix	BlkpgIoctlArg	struct
1814	unix	BlkpgPartition	struct
1815	unix	XDPRingOffset	struct
1816	unix	XDPMmapOffsets	struct
1817	unix	XDPUmemReg	struct
1818	unix	XDPStatistics	struct
1819	unix	XDPDesc	struct
1820	unix	Timespec	struct
1821	unix	Timeval	struct
1822	unix	Timex	struct
1823	unix	Time_t	int64
1824	unix	Tms	struct
1825	unix	Utimbuf	struct
1826	unix	Rusage	struct
1827	unix	Rlimit	struct
1828	unix	Stat_t	struct
1829	unix	StatxTimestamp	struct
1830	unix	Statx_t	struct
1831	unix	Dirent	struct
1832	unix	Fsid	struct
1833	unix	Flock_t	struct
1834	unix	FscryptPolicy	struct
1835	unix	FscryptKey	struct
1836	unix	KeyctlDHParams	struct
1837	unix	RawSockaddrInet4	struct
1838	unix	RawSockaddrInet6	struct
1839	unix	RawSockaddrUnix	struct
1840	unix	RawSockaddrLinklayer	struct
1841	unix	RawSockaddrNetlink	struct
1842	unix	RawSockaddrHCI	struct
1843	unix	RawSockaddrL2	struct
1844	unix	RawSockaddrRFCOMM	struct
1845	unix	RawSockaddrCAN	struct
1846	unix	RawSockaddrALG	struct
1847	unix	RawSockaddrVM	struct
1848	unix	RawSockaddrXDP	struct
1849	unix	RawSockaddrPPPoX	[]byte
1850	unix	RawSockaddr	struct
1851	unix	RawSockaddrAny	struct
1852	unix	Linger	struct
1853	unix	Iovec	struct
1854	unix	IPMreq	struct
1855	unix	IPMreqn	struct
1856	unix	IPv6Mreq	struct
1857	unix	PacketMreq	struct
1858	unix	Msghdr	struct
1859	unix	Cmsghdr	struct
1860	unix	Inet4Pktinfo	struct
1861	unix	Inet6Pktinfo	struct
1862	unix	IPv6MTUInfo	struct
1863	unix	ICMPv6Filter	struct
1864	unix	Ucred	struct
1865	unix	TCPInfo	struct
1866	unix	NlMsghdr	struct
1867	unix	NlMsgerr	struct
1868	unix	RtGenmsg	struct
1869	unix	NlAttr	struct
1870	unix	RtAttr	struct
1871	unix	IfInfomsg	struct
1872	unix	IfAddrmsg	struct
1873	unix	RtMsg	struct
1874	unix	RtNexthop	struct
1875	unix	SockFilter	struct
1876	unix	SockFprog	struct
1877	unix	InotifyEvent	struct
1878	unix	PtraceRegs	struct
1879	unix	FdSet	struct
1880	unix	Sysinfo_t	struct
1881	unix	Utsname	struct
1882	unix	Ustat_t	struct
1883	unix	EpollEvent	struct
1884	unix	PollFd	struct
1885	unix	Sigset_t	struct
1886	unix	Termios	struct
1887	unix	Winsize	struct
1888	unix	Taskstats	struct
1889	unix	CGroupStats	struct
1890	unix	Genlmsghdr	struct
1891	unix	PerfEventAttr	struct
1892	unix	PerfEventMmapPage	struct
1893	unix	SockaddrStorage	struct
1894	unix	TCPMD5Sig	struct
1895	unix	HDDriveCmdHdr	struct
1896	unix	HDGeometry	struct
1897	unix	HDDriveID	struct
1898	unix	Statfs_t	struct
1899	unix	TpacketHdr	struct
1900	unix	Tpacket2Hdr	struct
1901	unix	Tpacket3Hdr	struct
1902	unix	TpacketHdrVariant1	struct
1903	unix	TpacketBlockDesc	struct
1904	unix	TpacketReq	struct
1905	unix	TpacketReq3	struct
1906	unix	TpacketStats	struct
1907	unix	TpacketStatsV3	struct
1908	unix	TpacketAuxdata	struct
1909	unix	Nfgenmsg	struct
1910	unix	RTCTime	struct
1911	unix	RTCWkAlrm	struct
1912	unix	RTCPLLInfo	struct
1913	unix	BlkpgIoctlArg	struct
1914	unix	BlkpgPartition	struct
1915	unix	XDPRingOffset	struct
1916	unix	XDPMmapOffsets	struct
1917	unix	XDPUmemReg	struct
1918	unix	XDPStatistics	struct
1919	unix	XDPDesc	struct
1920	unix	Timespec	struct
1921	unix	Timeval	struct
1922	unix	Timex	struct
1923	unix	Time_t	int32
1924	unix	Tms	struct
1925	unix	Utimbuf	struct
1926	unix	Rusage	struct
1927	unix	Rlimit	struct
1928	unix	Stat_t	struct
1929	unix	StatxTimestamp	struct
1930	unix	Statx_t	struct
1931	unix	Dirent	struct
1932	unix	Fsid	struct
1933	unix	Flock_t	struct
1934	unix	FscryptPolicy	struct
1935	unix	FscryptKey	struct
1936	unix	KeyctlDHParams	struct
1937	unix	RawSockaddrInet4	struct
1938	unix	RawSockaddrInet6	struct
1939	unix	RawSockaddrUnix	struct
1940	unix	RawSockaddrLinklayer	struct
1941	unix	RawSockaddrNetlink	struct
1942	unix	RawSockaddrHCI	struct
1943	unix	RawSockaddrL2	struct
1944	unix	RawSockaddrRFCOMM	struct
1945	unix	RawSockaddrCAN	struct
1946	unix	RawSockaddrALG	struct
1947	unix	RawSockaddrVM	struct
1948	unix	RawSockaddrXDP	struct
1949	unix	RawSockaddrPPPoX	[]byte
1950	unix	RawSockaddr	struct
1951	unix	RawSockaddrAny	struct
1952	unix	Linger	struct
1953	unix	Iovec	struct
1954	unix	IPMreq	struct
1955	unix	IPMreqn	struct
1956	unix	IPv6Mreq	struct
1957	unix	PacketMreq	struct
1958	unix	Msghdr	struct
1959	unix	Cmsghdr	struct
1960	unix	Inet4Pktinfo	struct
1961	unix	Inet6Pktinfo	struct
1962	unix	IPv6MTUInfo	struct
1963	unix	ICMPv6Filter	struct
1964	unix	Ucred	struct
1965	unix	TCPInfo	struct
1966	unix	NlMsghdr	struct
1967	unix	NlMsgerr	struct
1968	unix	RtGenmsg	struct
1969	unix	NlAttr	struct
1970	unix	RtAttr	struct
1971	unix	IfInfomsg	struct
1972	unix	IfAddrmsg	struct
1973	unix	RtMsg	struct
1974	unix	RtNexthop	struct
1975	unix	SockFilter	struct
1976	unix	SockFprog	struct
1977	unix	InotifyEvent	struct
1978	unix	PtraceRegs	struct
1979	unix	FdSet	struct
1980	unix	Sysinfo_t	struct
1981	unix	Utsname	struct
1982	unix	Ustat_t	struct
1983	unix	EpollEvent	struct
1984	unix	PollFd	struct
1985	unix	Sigset_t	struct
1986	unix	Termios	struct
1987	unix	Winsize	struct
1988	unix	Taskstats	struct
1989	unix	CGroupStats	struct
1990	unix	Genlmsghdr	struct
1991	unix	PerfEventAttr	struct
1992	unix	PerfEventMmapPage	struct
1993	unix	SockaddrStorage	struct
1994	unix	TCPMD5Sig	struct
1995	unix	HDDriveCmdHdr	struct
1996	unix	HDGeometry	struct
1997	unix	HDDriveID	struct
1998	unix	Statfs_t	struct
1999	unix	TpacketHdr	struct
2000	unix	Tpacket2Hdr	struct
2001	unix	Tpacket3Hdr	struct
2002	unix	TpacketHdrVariant1	struct
2003	unix	TpacketBlockDesc	struct
2004	unix	TpacketReq	struct
2005	unix	TpacketReq3	struct
2006	unix	TpacketStats	struct
2007	unix	TpacketStatsV3	struct
2008	unix	TpacketAuxdata	struct
2009	unix	Nfgenmsg	struct
2010	unix	RTCTime	struct
2011	unix	RTCWkAlrm	struct
2012	unix	RTCPLLInfo	struct
2013	unix	BlkpgIoctlArg	struct
2014	unix	BlkpgPartition	struct
2015	unix	XDPRingOffset	struct
2016	unix	XDPMmapOffsets	struct
2017	unix	XDPUmemReg	struct
2018	unix	XDPStatistics	struct
2019	unix	XDPDesc	struct
2020	unix	Timespec	struct
2021	unix	Timeval	struct
2022	unix	Timex	struct
2023	unix	Time_t	int64
2024	unix	Tms	struct
2025	unix	Utimbuf	struct
2026	unix	Rusage	struct
2027	unix	Rlimit	struct
2028	unix	Stat_t	struct
2029	unix	StatxTimestamp	struct
2030	unix	Statx_t	struct
2031	unix	Dirent	struct
2032	unix	Fsid	struct
2033	unix	Flock_t	struct
2034	unix	FscryptPolicy	struct
2035	unix	FscryptKey	struct
2036	unix	KeyctlDHParams	struct
2037	unix	RawSockaddrInet4	struct
2038	unix	RawSockaddrInet6	struct
2039	unix	RawSockaddrUnix	struct
2040	unix	RawSockaddrLinklayer	struct
2041	unix	RawSockaddrNetlink	struct
2042	unix	RawSockaddrHCI	struct
2043	unix	RawSockaddrL2	struct
2044	unix	RawSockaddrRFCOMM	struct
2045	unix	RawSockaddrCAN	struct
2046	unix	RawSockaddrALG	struct
2047	unix	RawSockaddrVM	struct
2048	unix	RawSockaddrXDP	struct
2049	unix	RawSockaddrPPPoX	[]byte
2050	unix	RawSockaddr	struct
2051	unix	RawSockaddrAny	struct
2052	unix	Linger	struct
2053	unix	Iovec	struct
2054	unix	IPMreq	struct
2055	unix	IPMreqn	struct
2056	unix	IPv6Mreq	struct
2057	unix	PacketMreq	struct
2058	unix	Msghdr	struct
2059	unix	Cmsghdr	struct
2060	unix	Inet4Pktinfo	struct
2061	unix	Inet6Pktinfo	struct
2062	unix	IPv6MTUInfo	struct
2063	unix	ICMPv6Filter	struct
2064	unix	Ucred	struct
2065	unix	TCPInfo	struct
2066	unix	NlMsghdr	struct
2067	unix	NlMsgerr	struct
2068	unix	RtGenmsg	struct
2069	unix	NlAttr	struct
2070	unix	RtAttr	struct
2071	unix	IfInfomsg	struct
2072	unix	IfAddrmsg	struct
2073	unix	RtMsg	struct
2074	unix	RtNexthop	struct
2075	unix	SockFilter	struct
2076	unix	SockFprog	struct
2077	unix	InotifyEvent	struct
2078	unix	PtraceRegs	struct
2079	unix	FdSet	struct
2080	unix	Sysinfo_t	struct
2081	unix	Utsname	struct
2082	unix	Ustat_t	struct
2083	unix	EpollEvent	struct
2084	unix	PollFd	struct
2085	unix	Sigset_t	struct
2086	unix	Termios	struct
2087	unix	Winsize	struct
2088	unix	Taskstats	struct
2089	unix	CGroupStats	struct
2090	unix	Genlmsghdr	struct
2091	unix	PerfEventAttr	struct
2092	unix	PerfEventMmapPage	struct
2093	unix	SockaddrStorage	struct
2094	unix	TCPMD5Sig	struct
2095	unix	HDDriveCmdHdr	struct
2096	unix	HDGeometry	struct
2097	unix	HDDriveID	struct
2098	unix	Statfs_t	struct
2099	unix	TpacketHdr	struct
2100	unix	Tpacket2Hdr	struct
2101	unix	Tpacket3Hdr	struct
2102	unix	TpacketHdrVariant1	struct
2103	unix	TpacketBlockDesc	struct
2104	unix	TpacketReq	struct
2105	unix	TpacketReq3	struct
2106	unix	TpacketStats	struct
2107	unix	TpacketStatsV3	struct
2108	unix	TpacketAuxdata	struct
2109	unix	Nfgenmsg	struct
2110	unix	RTCTime	struct
2111	unix	RTCWkAlrm	struct
2112	unix	RTCPLLInfo	struct
2113	unix	BlkpgIoctlArg	struct
2114	unix	BlkpgPartition	struct
2115	unix	XDPRingOffset	struct
2116	unix	XDPMmapOffsets	struct
2117	unix	XDPUmemReg	struct
2118	unix	XDPStatistics	struct
2119	unix	XDPDesc	struct
2120	unix	Timespec	struct
2121	unix	Timeval	struct
2122	unix	Timex	struct
2123	unix	Time_t	int64
2124	unix	Tms	struct
2125	unix	Utimbuf	struct
2126	unix	Rusage	struct
2127	unix	Rlimit	struct
2128	unix	Stat_t	struct
2129	unix	StatxTimestamp	struct
2130	unix	Statx_t	struct
2131	unix	Dirent	struct
2132	unix	Fsid	struct
2133	unix	Flock_t	struct
2134	unix	FscryptPolicy	struct
2135	unix	FscryptKey	struct
2136	unix	KeyctlDHParams	struct
2137	unix	RawSockaddrInet4	struct
2138	unix	RawSockaddrInet6	struct
2139	unix	RawSockaddrUnix	struct
2140	unix	RawSockaddrLinklayer	struct
2141	unix	RawSockaddrNetlink	struct
2142	unix	RawSockaddrHCI	struct
2143	unix	RawSockaddrL2	struct
2144	unix	RawSockaddrRFCOMM	struct
2145	unix	RawSockaddrCAN	struct
2146	unix	RawSockaddrALG	struct
2147	unix	RawSockaddrVM	struct
2148	unix	RawSockaddrXDP	struct
2149	unix	RawSockaddrPPPoX	[]byte
2150	unix	RawSockaddr	struct
2151	unix	RawSockaddrAny	struct
2152	unix	Linger	struct
2153	unix	Iovec	struct
2154	unix	IPMreq	struct
2155	unix	IPMreqn	struct
2156	unix	IPv6Mreq	struct
2157	unix	PacketMreq	struct
2158	unix	Msghdr	struct
2159	unix	Cmsghdr	struct
2160	unix	Inet4Pktinfo	struct
2161	unix	Inet6Pktinfo	struct
2162	unix	IPv6MTUInfo	struct
2163	unix	ICMPv6Filter	struct
2164	unix	Ucred	struct
2165	unix	TCPInfo	struct
2166	unix	NlMsghdr	struct
2167	unix	NlMsgerr	struct
2168	unix	RtGenmsg	struct
2169	unix	NlAttr	struct
2170	unix	RtAttr	struct
2171	unix	IfInfomsg	struct
2172	unix	IfAddrmsg	struct
2173	unix	RtMsg	struct
2174	unix	RtNexthop	struct
2175	unix	SockFilter	struct
2176	unix	SockFprog	struct
2177	unix	InotifyEvent	struct
2178	unix	PtraceRegs	struct
2179	unix	FdSet	struct
2180	unix	Sysinfo_t	struct
2181	unix	Utsname	struct
2182	unix	Ustat_t	struct
2183	unix	EpollEvent	struct
2184	unix	PollFd	struct
2185	unix	Sigset_t	struct
2186	unix	Termios	struct
2187	unix	Winsize	struct
2188	unix	Taskstats	struct
2189	unix	CGroupStats	struct
2190	unix	Genlmsghdr	struct
2191	unix	PerfEventAttr	struct
2192	unix	PerfEventMmapPage	struct
2193	unix	SockaddrStorage	struct
2194	unix	TCPMD5Sig	struct
2195	unix	HDDriveCmdHdr	struct
2196	unix	HDGeometry	struct
2197	unix	HDDriveID	struct
2198	unix	Statfs_t	struct
2199	unix	TpacketHdr	struct
2200	unix	Tpacket2Hdr	struct
2201	unix	Tpacket3Hdr	struct
2202	unix	TpacketHdrVariant1	struct
2203	unix	TpacketBlockDesc	struct
2204	unix	TpacketReq	struct
2205	unix	TpacketReq3	struct
2206	unix	TpacketStats	struct
2207	unix	TpacketStatsV3	struct
2208	unix	TpacketAuxdata	struct
2209	unix	Nfgenmsg	struct
2210	unix	RTCTime	struct
2211	unix	RTCWkAlrm	struct
2212	unix	RTCPLLInfo	struct
2213	unix	BlkpgIoctlArg	struct
2214	unix	BlkpgPartition	struct
2215	unix	XDPRingOffset	struct
2216	unix	XDPMmapOffsets	struct
2217	unix	XDPUmemReg	struct
2218	unix	XDPStatistics	struct
2219	unix	XDPDesc	struct
2220	unix	Timespec	struct
2221	unix	Timeval	struct
2222	unix	Timex	struct
2223	unix	Time_t	int64
2224	unix	Tms	struct
2225	unix	Utimbuf	struct
2226	unix	Rusage	struct
2227	unix	Rlimit	struct
2228	unix	Stat_t	struct
2229	unix	StatxTimestamp	struct
2230	unix	Statx_t	struct
2231	unix	Dirent	struct
2232	unix	Fsid	struct
2233	unix	Flock_t	struct
2234	unix	FscryptPolicy	struct
2235	unix	FscryptKey	struct
2236	unix	KeyctlDHParams	struct
2237	unix	RawSockaddrInet4	struct
2238	unix	RawSockaddrInet6	struct
2239	unix	RawSockaddrUnix	struct
2240	unix	RawSockaddrLinklayer	struct
2241	unix	RawSockaddrNetlink	struct
2242	unix	RawSockaddrHCI	struct
2243	unix	RawSockaddrL2	struct
2244	unix	RawSockaddrRFCOMM	struct
2245	unix	RawSockaddrCAN	struct
2246	unix	RawSockaddrALG	struct
2247	unix	RawSockaddrVM	struct
2248	unix	RawSockaddrXDP	struct
2249	unix	RawSockaddrPPPoX	[]byte
2250	unix	RawSockaddr	struct
2251	unix	RawSockaddrAny	struct
2252	unix	Linger	struct
2253	unix	Iovec	struct
2254	unix	IPMreq	struct
2255	unix	IPMreqn	struct
2256	unix	IPv6Mreq	struct
2257	unix	PacketMreq	struct
2258	unix	Msghdr	struct
2259	unix	Cmsghdr	struct
2260	unix	Inet4Pktinfo	struct
2261	unix	Inet6Pktinfo	struct
2262	unix	IPv6MTUInfo	struct
2263	unix	ICMPv6Filter	struct
2264	unix	Ucred	struct
2265	unix	TCPInfo	struct
2266	unix	NlMsghdr	struct
2267	unix	NlMsgerr	struct
2268	unix	RtGenmsg	struct
2269	unix	NlAttr	struct
2270	unix	RtAttr	struct
2271	unix	IfInfomsg	struct
2272	unix	IfAddrmsg	struct
2273	unix	RtMsg	struct
2274	unix	RtNexthop	struct
2275	unix	SockFilter	struct
2276	unix	SockFprog	struct
2277	unix	InotifyEvent	struct
2278	unix	PtraceRegs	struct
2279	unix	FdSet	struct
2280	unix	Sysinfo_t	struct
2281	unix	Utsname	struct
2282	unix	Ustat_t	struct
2283	unix	EpollEvent	struct
2284	unix	PollFd	struct
2285	unix	Sigset_t	struct
2286	unix	Termios	struct
2287	unix	Winsize	struct
2288	unix	Taskstats	struct
2289	unix	CGroupStats	struct
2290	unix	Genlmsghdr	struct
2291	unix	PerfEventAttr	struct
2292	unix	PerfEventMmapPage	struct
2293	unix	SockaddrStorage	struct
2294	unix	TCPMD5Sig	struct
2295	unix	HDDriveCmdHdr	struct
2296	unix	HDGeometry	struct
2297	unix	HDDriveID	struct
2298	unix	Statfs_t	struct
2299	unix	TpacketHdr	struct
2300	unix	Tpacket2Hdr	struct
2301	unix	Tpacket3Hdr	struct
2302	unix	TpacketHdrVariant1	struct
2303	unix	TpacketBlockDesc	struct
2304	unix	TpacketReq	struct
2305	unix	TpacketReq3	struct
2306	unix	TpacketStats	struct
2307	unix	TpacketStatsV3	struct
2308	unix	TpacketAuxdata	struct
2309	unix	Nfgenmsg	struct
2310	unix	RTCTime	struct
2311	unix	RTCWkAlrm	struct
2312	unix	RTCPLLInfo	struct
2313	unix	BlkpgIoctlArg	struct
2314	unix	BlkpgPartition	struct
2315	unix	XDPRingOffset	struct
2316	unix	XDPMmapOffsets	struct
2317	unix	XDPUmemReg	struct
2318	unix	XDPStatistics	struct
2319	unix	XDPDesc	struct
2320	unix	Timespec	struct
2321	unix	Timeval	struct
2322	unix	Timex	struct
2323	unix	Time_t	int64
2324	unix	Tms	struct
2325	unix	Utimbuf	struct
2326	unix	Rusage	struct
2327	unix	Rlimit	struct
2328	unix	Stat_t	struct
2329	unix	StatxTimestamp	struct
2330	unix	Statx_t	struct
2331	unix	Dirent	struct
2332	unix	Fsid	struct
2333	unix	Flock_t	struct
2334	unix	FscryptPolicy	struct
2335	unix	FscryptKey	struct
2336	unix	KeyctlDHParams	struct
2337	unix	RawSockaddrInet4	struct
2338	unix	RawSockaddrInet6	struct
2339	unix	RawSockaddrUnix	struct
2340	unix	RawSockaddrLinklayer	struct
2341	unix	RawSockaddrNetlink	struct
2342	unix	RawSockaddrHCI	struct
2343	unix	RawSockaddrL2	struct
2344	unix	RawSockaddrRFCOMM	struct
2345	unix	RawSockaddrCAN	struct
2346	unix	RawSockaddrALG	struct
2347	unix	RawSockaddrVM	struct
2348	unix	RawSockaddrXDP	struct
2349	unix	RawSockaddrPPPoX	[]byte
2350	unix	RawSockaddr	struct
2351	unix	RawSockaddrAny	struct
2352	unix	Linger	struct
2353	unix	Iovec	struct
2354	unix	IPMreq	struct
2355	unix	IPMreqn	struct
2356	unix	IPv6Mreq	struct
2357	unix	PacketMreq	struct
2358	unix	Msghdr	struct
2359	unix	Cmsghdr	struct
2360	unix	Inet4Pktinfo	struct
2361	unix	Inet6Pktinfo	struct
2362	unix	IPv6MTUInfo	struct
2363	unix	ICMPv6Filter	struct
2364	unix	Ucred	struct
2365	unix	TCPInfo	struct
2366	unix	NlMsghdr	struct
2367	unix	NlMsgerr	struct
2368	unix	RtGenmsg	struct
2369	unix	NlAttr	struct
2370	unix	RtAttr	struct
2371	unix	IfInfomsg	struct
2372	unix	IfAddrmsg	struct
2373	unix	RtMsg	struct
2374	unix	RtNexthop	struct
2375	unix	SockFilter	struct
2376	unix	SockFprog	struct
2377	unix	InotifyEvent	struct
2378	unix	PtraceRegs	struct
2379	unix	PtracePsw	struct
2380	unix	PtraceFpregs	struct
2381	unix	PtracePer	struct
2382	unix	FdSet	struct
2383	unix	Sysinfo_t	struct
2384	unix	Utsname	struct
2385	unix	Ustat_t	struct
2386	unix	EpollEvent	struct
2387	unix	PollFd	struct
2388	unix	Sigset_t	struct
2389	unix	Termios	struct
2390	unix	Winsize	struct
2391	unix	Taskstats	struct
2392	unix	CGroupStats	struct
2393	unix	Genlmsghdr	struct
2394	unix	PerfEventAttr	struct
2395	unix	PerfEventMmapPage	struct
2396	unix	SockaddrStorage	struct
2397	unix	TCPMD5Sig	struct
2398	unix	HDDriveCmdHdr	struct
2399	unix	HDGeometry	struct
2400	unix	HDDriveID	struct
2401	unix	Statfs_t	struct
2402	unix	TpacketHdr	struct
2403	unix	Tpacket2Hdr	struct
2404	unix	Tpacket3Hdr	struct
2405	unix	TpacketHdrVariant1	struct
2406	unix	TpacketBlockDesc	struct
2407	unix	TpacketReq	struct
2408	unix	TpacketReq3	struct
2409	unix	TpacketStats	struct
2410	unix	TpacketStatsV3	struct
2411	unix	TpacketAuxdata	struct
2412	unix	Nfgenmsg	struct
2413	unix	RTCTime	struct
2414	unix	RTCWkAlrm	struct
2415	unix	RTCPLLInfo	struct
2416	unix	BlkpgIoctlArg	struct
2417	unix	BlkpgPartition	struct
2418	unix	XDPRingOffset	struct
2419	unix	XDPMmapOffsets	struct
2420	unix	XDPUmemReg	struct
2421	unix	XDPStatistics	struct
2422	unix	XDPDesc	struct
2423	unix	Timespec	struct
2424	unix	Timeval	struct
2425	unix	Timex	struct
2426	unix	Time_t	int64
2427	unix	Tms	struct
2428	unix	Utimbuf	struct
2429	unix	Rusage	struct
2430	unix	Rlimit	struct
2431	unix	Stat_t	struct
2432	unix	StatxTimestamp	struct
2433	unix	Statx_t	struct
2434	unix	Dirent	struct
2435	unix	Fsid	struct
2436	unix	Flock_t	struct
2437	unix	FscryptPolicy	struct
2438	unix	FscryptKey	struct
2439	unix	KeyctlDHParams	struct
2440	unix	RawSockaddrInet4	struct
2441	unix	RawSockaddrInet6	struct
2442	unix	RawSockaddrUnix	struct
2443	unix	RawSockaddrLinklayer	struct
2444	unix	RawSockaddrNetlink	struct
2445	unix	RawSockaddrHCI	struct
2446	unix	RawSockaddrL2	struct
2447	unix	RawSockaddrRFCOMM	struct
2448	unix	RawSockaddrCAN	struct
2449	unix	RawSockaddrALG	struct
2450	unix	RawSockaddrVM	struct
2451	unix	RawSockaddrXDP	struct
2452	unix	RawSockaddrPPPoX	[]byte
2453	unix	RawSockaddr	struct
2454	unix	RawSockaddrAny	struct
2455	unix	Linger	struct
2456	unix	Iovec	struct
2457	unix	IPMreq	struct
2458	unix	IPMreqn	struct
2459	unix	IPv6Mreq	struct
2460	unix	PacketMreq	struct
2461	unix	Msghdr	struct
2462	unix	Cmsghdr	struct
2463	unix	Inet4Pktinfo	struct
2464	unix	Inet6Pktinfo	struct
2465	unix	IPv6MTUInfo	struct
2466	unix	ICMPv6Filter	struct
2467	unix	Ucred	struct
2468	unix	TCPInfo	struct
2469	unix	NlMsghdr	struct
2470	unix	NlMsgerr	struct
2471	unix	RtGenmsg	struct
2472	unix	NlAttr	struct
2473	unix	RtAttr	struct
2474	unix	IfInfomsg	struct
2475	unix	IfAddrmsg	struct
2476	unix	RtMsg	struct
2477	unix	RtNexthop	struct
2478	unix	SockFilter	struct
2479	unix	SockFprog	struct
2480	unix	InotifyEvent	struct
2481	unix	PtraceRegs	struct
2482	unix	FdSet	struct
2483	unix	Sysinfo_t	struct
2484	unix	Utsname	struct
2485	unix	Ustat_t	struct
2486	unix	EpollEvent	struct
2487	unix	PollFd	struct
2488	unix	Sigset_t	struct
2489	unix	Termios	struct
2490	unix	Winsize	struct
2491	unix	Taskstats	struct
2492	unix	CGroupStats	struct
2493	unix	Genlmsghdr	struct
2494	unix	PerfEventAttr	struct
2495	unix	PerfEventMmapPage	struct
2496	unix	SockaddrStorage	struct
2497	unix	TCPMD5Sig	struct
2498	unix	HDDriveCmdHdr	struct
2499	unix	HDGeometry	struct
2500	unix	HDDriveID	struct
2501	unix	Statfs_t	struct
2502	unix	TpacketHdr	struct
2503	unix	Tpacket2Hdr	struct
2504	unix	Tpacket3Hdr	struct
2505	unix	TpacketHdrVariant1	struct
2506	unix	TpacketBlockDesc	struct
2507	unix	TpacketReq	struct
2508	unix	TpacketReq3	struct
2509	unix	TpacketStats	struct
2510	unix	TpacketStatsV3	struct
2511	unix	TpacketAuxdata	struct
2512	unix	Nfgenmsg	struct
2513	unix	RTCTime	struct
2514	unix	RTCWkAlrm	struct
2515	unix	RTCPLLInfo	struct
2516	unix	BlkpgIoctlArg	struct
2517	unix	BlkpgPartition	struct
2518	unix	XDPRingOffset	struct
2519	unix	XDPMmapOffsets	struct
2520	unix	XDPUmemReg	struct
2521	unix	XDPStatistics	struct
2522	unix	XDPDesc	struct
2523	unix	Timespec	struct
2524	unix	Timeval	struct
2525	unix	Rusage	struct
2526	unix	Rlimit	struct
2527	unix	Stat_t	struct
2528	unix	Statfs_t	[]byte
2529	unix	Flock_t	struct
2530	unix	Dirent	struct
2531	unix	Fsid	struct
2532	unix	RawSockaddrInet4	struct
2533	unix	RawSockaddrInet6	struct
2534	unix	RawSockaddrUnix	struct
2535	unix	RawSockaddrDatalink	struct
2536	unix	RawSockaddr	struct
2537	unix	RawSockaddrAny	struct
2538	unix	Linger	struct
2539	unix	Iovec	struct
2540	unix	IPMreq	struct
2541	unix	IPv6Mreq	struct
2542	unix	Msghdr	struct
2543	unix	Cmsghdr	struct
2544	unix	Inet6Pktinfo	struct
2545	unix	IPv6MTUInfo	struct
2546	unix	ICMPv6Filter	struct
2547	unix	Kevent_t	struct
2548	unix	FdSet	struct
2549	unix	IfMsghdr	struct
2550	unix	IfData	struct
2551	unix	IfaMsghdr	struct
2552	unix	IfAnnounceMsghdr	struct
2553	unix	RtMsghdr	struct
2554	unix	RtMetrics	struct
2555	unix	Mclpool	[]byte
2556	unix	BpfVersion	struct
2557	unix	BpfStat	struct
2558	unix	BpfProgram	struct
2559	unix	BpfInsn	struct
2560	unix	BpfHdr	struct
2561	unix	BpfTimeval	struct
2562	unix	Termios	struct
2563	unix	Winsize	struct
2564	unix	Ptmget	struct
2565	unix	PollFd	struct
2566	unix	Sysctlnode	struct
2567	unix	Utsname	struct
2568	unix	Clockinfo	struct
2569	unix	Timespec	struct
2570	unix	Timeval	struct
2571	unix	Rusage	struct
2572	unix	Rlimit	struct
2573	unix	Stat_t	struct
2574	unix	Statfs_t	[]byte
2575	unix	Flock_t	struct
2576	unix	Dirent	struct
2577	unix	Fsid	struct
2578	unix	RawSockaddrInet4	struct
2579	unix	RawSockaddrInet6	struct
2580	unix	RawSockaddrUnix	struct
2581	unix	RawSockaddrDatalink	struct
2582	unix	RawSockaddr	struct
2583	unix	RawSockaddrAny	struct
2584	unix	Linger	struct
2585	unix	Iovec	struct
2586	unix	IPMreq	struct
2587	unix	IPv6Mreq	struct
2588	unix	Msghdr	struct
2589	unix	Cmsghdr	struct
2590	unix	Inet6Pktinfo	struct
2591	unix	IPv6MTUInfo	struct
2592	unix	ICMPv6Filter	struct
2593	unix	Kevent_t	struct
2594	unix	FdSet	struct
2595	unix	IfMsghdr	struct
2596	unix	IfData	struct
2597	unix	IfaMsghdr	struct
2598	unix	IfAnnounceMsghdr	struct
2599	unix	RtMsghdr	struct
2600	unix	RtMetrics	struct
2601	unix	Mclpool	[]byte
2602	unix	BpfVersion	struct
2603	unix	BpfStat	struct
2604	unix	BpfProgram	struct
2605	unix	BpfInsn	struct
2606	unix	BpfHdr	struct
2607	unix	BpfTimeval	struct
2608	unix	Termios	struct
2609	unix	Winsize	struct
2610	unix	Ptmget	struct
2611	unix	PollFd	struct
2612	unix	Sysctlnode	struct
2613	unix	Utsname	struct
2614	unix	Clockinfo	struct
2615	unix	Timespec	struct
2616	unix	Timeval	struct
2617	unix	Rusage	struct
2618	unix	Rlimit	struct
2619	unix	Stat_t	struct
2620	unix	Statfs_t	[]byte
2621	unix	Flock_t	struct
2622	unix	Dirent	struct
2623	unix	Fsid	struct
2624	unix	RawSockaddrInet4	struct
2625	unix	RawSockaddrInet6	struct
2626	unix	RawSockaddrUnix	struct
2627	unix	RawSockaddrDatalink	struct
2628	unix	RawSockaddr	struct
2629	unix	RawSockaddrAny	struct
2630	unix	Linger	struct
2631	unix	Iovec	struct
2632	unix	IPMreq	struct
2633	unix	IPv6Mreq	struct
2634	unix	Msghdr	struct
2635	unix	Cmsghdr	struct
2636	unix	Inet6Pktinfo	struct
2637	unix	IPv6MTUInfo	struct
2638	unix	ICMPv6Filter	struct
2639	unix	Kevent_t	struct
2640	unix	FdSet	struct
2641	unix	IfMsghdr	struct
2642	unix	IfData	struct
2643	unix	IfaMsghdr	struct
2644	unix	IfAnnounceMsghdr	struct
2645	unix	RtMsghdr	struct
2646	unix	RtMetrics	struct
2647	unix	Mclpool	[]byte
2648	unix	BpfVersion	struct
2649	unix	BpfStat	struct
2650	unix	BpfProgram	struct
2651	unix	BpfInsn	struct
2652	unix	BpfHdr	struct
2653	unix	BpfTimeval	struct
2654	unix	Termios	struct
2655	unix	Winsize	struct
2656	unix	Ptmget	struct
2657	unix	PollFd	struct
2658	unix	Sysctlnode	struct
2659	unix	Utsname	struct
2660	unix	Clockinfo	struct
2661	unix	Timespec	struct
2662	unix	Timeval	struct
2663	unix	Rusage	struct
2664	unix	Rlimit	struct
2665	unix	Stat_t	struct
2666	unix	Statfs_t	struct
2667	unix	Flock_t	struct
2668	unix	Dirent	struct
2669	unix	Fsid	struct
2670	unix	RawSockaddrInet4	struct
2671	unix	RawSockaddrInet6	struct
2672	unix	RawSockaddrUnix	struct
2673	unix	RawSockaddrDatalink	struct
2674	unix	RawSockaddr	struct
2675	unix	RawSockaddrAny	struct
2676	unix	Linger	struct
2677	unix	Iovec	struct
2678	unix	IPMreq	struct
2679	unix	IPv6Mreq	struct
2680	unix	Msghdr	struct
2681	unix	Cmsghdr	struct
2682	unix	Inet6Pktinfo	struct
2683	unix	IPv6MTUInfo	struct
2684	unix	ICMPv6Filter	struct
2685	unix	Kevent_t	struct
2686	unix	FdSet	struct
2687	unix	IfMsghdr	struct
2688	unix	IfData	struct
2689	unix	IfaMsghdr	struct
2690	unix	IfAnnounceMsghdr	struct
2691	unix	RtMsghdr	struct
2692	unix	RtMetrics	struct
2693	unix	Mclpool	struct
2694	unix	BpfVersion	struct
2695	unix	BpfStat	struct
2696	unix	BpfProgram	struct
2697	unix	BpfInsn	struct
2698	unix	BpfHdr	struct
2699	unix	BpfTimeval	struct
2700	unix	Termios	struct
2701	unix	Winsize	struct
2702	unix	PollFd	struct
2703	unix	Sigset_t	uint32
2704	unix	Utsname	struct
2705	unix	Uvmexp	struct
2706	unix	Timespec	struct
2707	unix	Timeval	struct
2708	unix	Rusage	struct
2709	unix	Rlimit	struct
2710	unix	Stat_t	struct
2711	unix	Statfs_t	struct
2712	unix	Flock_t	struct
2713	unix	Dirent	struct
2714	unix	Fsid	struct
2715	unix	RawSockaddrInet4	struct
2716	unix	RawSockaddrInet6	struct
2717	unix	RawSockaddrUnix	struct
2718	unix	RawSockaddrDatalink	struct
2719	unix	RawSockaddr	struct
2720	unix	RawSockaddrAny	struct
2721	unix	Linger	struct
2722	unix	Iovec	struct
2723	unix	IPMreq	struct
2724	unix	IPv6Mreq	struct
2725	unix	Msghdr	struct
2726	unix	Cmsghdr	struct
2727	unix	Inet6Pktinfo	struct
2728	unix	IPv6MTUInfo	struct
2729	unix	ICMPv6Filter	struct
2730	unix	Kevent_t	struct
2731	unix	FdSet	struct
2732	unix	IfMsghdr	struct
2733	unix	IfData	struct
2734	unix	IfaMsghdr	struct
2735	unix	IfAnnounceMsghdr	struct
2736	unix	RtMsghdr	struct
2737	unix	RtMetrics	struct
2738	unix	Mclpool	struct
2739	unix	BpfVersion	struct
2740	unix	BpfStat	struct
2741	unix	BpfProgram	struct
2742	unix	BpfInsn	struct
2743	unix	BpfHdr	struct
2744	unix	BpfTimeval	struct
2745	unix	Termios	struct
2746	unix	Winsize	struct
2747	unix	PollFd	struct
2748	unix	Sigset_t	uint32
2749	unix	Utsname	struct
2750	unix	Uvmexp	struct
2751	unix	Timespec	struct
2752	unix	Timeval	struct
2753	unix	Rusage	struct
2754	unix	Rlimit	struct
2755	unix	Stat_t	struct
2756	unix	Statfs_t	struct
2757	unix	Flock_t	struct
2758	unix	Dirent	struct
2759	unix	Fsid	struct
2760	unix	RawSockaddrInet4	struct
2761	unix	RawSockaddrInet6	struct
2762	unix	RawSockaddrUnix	struct
2763	unix	RawSockaddrDatalink	struct
2764	unix	RawSockaddr	struct
2765	unix	RawSockaddrAny	struct
2766	unix	Linger	struct
2767	unix	Iovec	struct
2768	unix	IPMreq	struct
2769	unix	IPv6Mreq	struct
2770	unix	Msghdr	struct
2771	unix	Cmsghdr	struct
2772	unix	Inet6Pktinfo	struct
2773	unix	IPv6MTUInfo	struct
2774	unix	ICMPv6Filter	struct
2775	unix	Kevent_t	struct
2776	unix	FdSet	struct
2777	unix	IfMsghdr	struct
2778	unix	IfData	struct
2779	unix	IfaMsghdr	struct
2780	unix	IfAnnounceMsghdr	struct
2781	unix	RtMsghdr	struct
2782	unix	RtMetrics	struct
2783	unix	Mclpool	struct
2784	unix	BpfVersion	struct
2785	unix	BpfStat	struct
2786	unix	BpfProgram	struct
2787	unix	BpfInsn	struct
2788	unix	BpfHdr	struct
2789	unix	BpfTimeval	struct
2790	unix	Termios	struct
2791	unix	Winsize	struct
2792	unix	PollFd	struct
2793	unix	Sigset_t	uint32
2794	unix	Utsname	struct
2795	unix	Uvmexp	struct
2796	unix	Timespec	struct
2797	unix	Timeval	struct
2798	unix	Timeval32	struct
2799	unix	Tms	struct
2800	unix	Utimbuf	struct
2801	unix	Rusage	struct
2802	unix	Rlimit	struct
2803	unix	Stat_t	struct
2804	unix	Flock_t	struct
2805	unix	Dirent	struct
2806	unix	Statvfs_t	struct
2807	unix	RawSockaddrInet4	struct
2808	unix	RawSockaddrInet6	struct
2809	unix	RawSockaddrUnix	struct
2810	unix	RawSockaddrDatalink	struct
2811	unix	RawSockaddr	struct
2812	unix	RawSockaddrAny	struct
2813	unix	Linger	struct
2814	unix	Iovec	struct
2815	unix	IPMreq	struct
2816	unix	IPv6Mreq	struct
2817	unix	Msghdr	struct
2818	unix	Cmsghdr	struct
2819	unix	Inet6Pktinfo	struct
2820	unix	IPv6MTUInfo	struct
2821	unix	ICMPv6Filter	struct
2822	unix	FdSet	struct
2823	unix	Utsname	struct
2824	unix	Ustat_t	struct
2825	unix	IfMsghdr	struct
2826	unix	IfData	struct
2827	unix	IfaMsghdr	struct
2828	unix	RtMsghdr	struct
2829	unix	RtMetrics	struct
2830	unix	BpfVersion	struct
2831	unix	BpfStat	struct
2832	unix	BpfProgram	struct
2833	unix	BpfInsn	struct
2834	unix	BpfTimeval	struct
2835	unix	BpfHdr	struct
2836	unix	Termios	struct
2837	unix	Termio	struct
2838	unix	Winsize	struct
2839	unix	PollFd	struct
2840	windows	Errno	syscall.Errno
2841	windows	SysProcAttr	syscall.SysProcAttr
2842	windows	DLLError	struct
2843	windows	DLL	struct
2844	windows	Proc	struct
2845	windows	LazyDLL	struct
2846	windows	LazyProc	struct
2847	registry	Key	syscall.Handle
2848	registry	KeyInfo	struct
2849	windows	UserInfo10	struct
2850	windows	SidIdentifierAuthority	struct
2851	windows	SID	struct
2852	windows	SIDAndAttributes	struct
2853	windows	Tokenuser	struct
2854	windows	Tokenprimarygroup	struct
2855	windows	Tokengroups	struct
2856	windows	Token	windows.Handle
2857	windows	SERVICE_STATUS	struct
2858	windows	SERVICE_TABLE_ENTRY	struct
2859	windows	QUERY_SERVICE_CONFIG	struct
2860	windows	SERVICE_DESCRIPTION	struct
2861	windows	SERVICE_STATUS_PROCESS	struct
2862	windows	ENUM_SERVICE_STATUS_PROCESS	struct
2863	windows	SERVICE_FAILURE_ACTIONS	struct
2864	windows	SC_ACTION	struct
2865	debug	Log	
2866	debug	ConsoleLog	struct
2867	eventlog	Log	struct
2868	mgr	Config	struct
2869	mgr	Mgr	struct
2870	mgr	RecoveryAction	struct
2871	mgr	Service	struct
2872	svc	State	uint32
2873	svc	Cmd	uint32
2874	svc	Accepted	uint32
2875	svc	Status	struct
2876	svc	ChangeRequest	struct
2877	svc	Handler	
2878	windows	Handle	uintptr
2879	windows	RawSockaddrInet4	struct
2880	windows	RawSockaddrInet6	struct
2881	windows	RawSockaddr	struct
2882	windows	RawSockaddrAny	struct
2883	windows	Sockaddr	
2884	windows	SockaddrInet4	struct
2885	windows	SockaddrInet6	struct
2886	windows	RawSockaddrUnix	struct
2887	windows	SockaddrUnix	struct
2888	windows	Rusage	struct
2889	windows	WaitStatus	struct
2890	windows	Timespec	struct
2891	windows	Linger	struct
2892	windows	IPMreq	struct
2893	windows	IPv6Mreq	struct
2894	windows	Signal	int
2895	windows	Pointer	*struct{}
2896	windows	Timeval	struct
2897	windows	SecurityAttributes	struct
2898	windows	Overlapped	struct
2899	windows	FileNotifyInformation	struct
2900	windows	Filetime	struct
2901	windows	Win32finddata	struct
2902	windows	ByHandleFileInformation	struct
2903	windows	Win32FileAttributeData	struct
2904	windows	StartupInfo	struct
2905	windows	ProcessInformation	struct
2906	windows	ProcessEntry32	struct
2907	windows	Systemtime	struct
2908	windows	Timezoneinformation	struct
2909	windows	WSABuf	struct
2910	windows	WSAMsg	struct
2911	windows	Hostent	struct
2912	windows	Protoent	struct
2913	windows	DNSSRVData	struct
2914	windows	DNSPTRData	struct
2915	windows	DNSMXData	struct
2916	windows	DNSTXTData	struct
2917	windows	DNSRecord	struct
2918	windows	TransmitFileBuffers	struct
2919	windows	SockaddrGen	[]byte
2920	windows	InterfaceInfo	struct
2921	windows	IpAddressString	struct
2922	windows	IpMaskString	windows.IpAddressString
2923	windows	IpAddrString	struct
2924	windows	IpAdapterInfo	struct
2925	windows	MibIfRow	struct
2926	windows	CertInfo	struct
2927	windows	CertContext	struct
2928	windows	CertChainContext	struct
2929	windows	CertTrustListInfo	struct
2930	windows	CertSimpleChain	struct
2931	windows	CertChainElement	struct
2932	windows	CertRevocationCrlInfo	struct
2933	windows	CertRevocationInfo	struct
2934	windows	CertTrustStatus	struct
2935	windows	CertUsageMatch	struct
2936	windows	CertEnhKeyUsage	struct
2937	windows	CertChainPara	struct
2938	windows	CertChainPolicyPara	struct
2939	windows	SSLExtraCertChainPolicyPara	struct
2940	windows	CertChainPolicyStatus	struct
2941	windows	AddrinfoW	struct
2942	windows	GUID	struct
2943	windows	WSAProtocolInfo	struct
2944	windows	WSAProtocolChain	struct
2945	windows	TCPKeepalive	struct
2946	windows	SocketAddress	struct
2947	windows	IpAdapterUnicastAddress	struct
2948	windows	IpAdapterAnycastAddress	struct
2949	windows	IpAdapterMulticastAddress	struct
2950	windows	IpAdapterDnsServerAdapter	struct
2951	windows	IpAdapterPrefix	struct
2952	windows	IpAdapterAddresses	struct
2953	windows	Coord	struct
2954	windows	SmallRect	struct
2955	windows	ConsoleScreenBufferInfo	struct
2956	windows	WSAData	struct
2957	windows	Servent	struct
2958	windows	WSAData	struct
2959	windows	Servent	struct
2960	windows	WSAData	struct
2961	windows	Servent	struct
2962	analysis	Analyzer	struct
2963	analysis	Pass	struct
2964	analysis	Fact	
2965	analysis	Diagnostic	struct
2966	analysisflags	JSONTree	map[string]map[string]interface{}
2967	facts	Set	struct
2968	ctrlflow	CFGs	struct
2969	unitchecker	Config	struct
2970	astutil	ApplyFunc	func(*astutil.Cursor) bool
2971	astutil	Cursor	struct
2972	inspector	Inspector	struct
2973	cfg	CFG	struct
2974	cfg	Block	struct
2975	objectpath	Path	string
2976	typeutil	Map	struct
2977	typeutil	Hasher	struct
2978	typeutil	MethodSetCache	struct
2979	assign	ST	struct
2980	method	MethodTest	int
2981	print	BoolFormatter	bool
2982	print	FormatterVal	bool
2983	print	RecursiveSlice	[]print.RecursiveSlice
2984	print	RecursiveMap	map[int]print.RecursiveMap
2985	print	RecursiveStruct	struct
2986	print	RecursiveStruct1	struct
2987	print	RecursiveStruct2	struct
2988	print	T2	struct
2989	print	T1	struct
2990	structtag	StructTagTest	struct
2991	structtag	T1	struct
2992	structtag	T2	struct
2993	bzip2	StructuralError	string
2994	flate	Writer	struct
2995	flate	CorruptInputError	int64
2996	flate	InternalError	string
2997	flate	ReadError	struct
2998	flate	WriteError	struct
2999	flate	Resetter	
3000	flate	Reader	
3001	gzip	Header	struct
3002	gzip	Reader	struct
3003	gzip	Writer	struct
3004	lzw	Order	int
3005	zlib	Resetter	
3006	zlib	Writer	struct
3007	heap	Interface	
3008	list	Element	struct
3009	list	List	struct
3010	ring	Ring	struct
3011	context	Context	
3012	context	CancelFunc	func()
3013	aes	KeySizeError	int
3014	cipher	Block	
3015	cipher	Stream	
3016	cipher	BlockMode	
3017	cipher	AEAD	
3018	cipher	StreamReader	struct
3019	cipher	StreamWriter	struct
3020	crypto	Hash	uint
3021	crypto	PublicKey	interface{}
3022	crypto	PrivateKey	interface{}
3023	crypto	Signer	
3024	crypto	SignerOpts	
3025	crypto	Decrypter	
3026	crypto	DecrypterOpts	interface{}
3027	des	KeySizeError	int
3028	dsa	Parameters	struct
3029	dsa	PublicKey	struct
3030	dsa	PrivateKey	struct
3031	dsa	ParameterSizes	int
3032	ecdsa	PublicKey	struct
3033	ecdsa	PrivateKey	struct
3034	elliptic	Curve	
3035	elliptic	CurveParams	struct
3036	main	Data	struct
3037	rc4	Cipher	struct
3038	rc4	KeySizeError	int
3039	rsa	PKCS1v15DecryptOptions	struct
3040	rsa	PSSOptions	struct
3041	rsa	PublicKey	struct
3042	rsa	OAEPOptions	struct
3043	rsa	PrivateKey	struct
3044	rsa	PrecomputedValues	struct
3045	rsa	CRTValue	struct
3046	tls	CurveID	uint16
3047	tls	ConnectionState	struct
3048	tls	ClientAuthType	int
3049	tls	ClientSessionState	struct
3050	tls	ClientSessionCache	
3051	tls	SignatureScheme	uint16
3052	tls	ClientHelloInfo	struct
3053	tls	CertificateRequestInfo	struct
3054	tls	RenegotiationSupport	int
3055	tls	Config	struct
3056	tls	Certificate	struct
3057	tls	Conn	struct
3058	tls	RecordHeaderError	struct
3059	x509	CertPool	struct
3060	x509	PEMCipher	int
3061	pkix	AlgorithmIdentifier	struct
3062	pkix	RDNSequence	[]pkix.RelativeDistinguishedNameSET
3063	pkix	RelativeDistinguishedNameSET	[]pkix.AttributeTypeAndValue
3064	pkix	AttributeTypeAndValue	struct
3065	pkix	AttributeTypeAndValueSET	struct
3066	pkix	Extension	struct
3067	pkix	Name	struct
3068	pkix	CertificateList	struct
3069	pkix	TBSCertificateList	struct
3070	pkix	RevokedCertificate	struct
3071	x509	InvalidReason	int
3072	x509	CertificateInvalidError	struct
3073	x509	HostnameError	struct
3074	x509	UnknownAuthorityError	struct
3075	x509	SystemRootsError	struct
3076	x509	VerifyOptions	struct
3077	x509	SignatureAlgorithm	int
3078	x509	PublicKeyAlgorithm	int
3079	x509	KeyUsage	int
3080	x509	ExtKeyUsage	int
3081	x509	Certificate	struct
3082	x509	InsecureAlgorithmError	x509.SignatureAlgorithm
3083	x509	ConstraintViolationError	struct
3084	x509	UnhandledCriticalExtension	struct
3085	x509	CertificateRequest	struct
3086	driver	Value	interface{}
3087	driver	NamedValue	struct
3088	driver	Driver	
3089	driver	DriverContext	
3090	driver	Connector	
3091	driver	Pinger	
3092	driver	Execer	
3093	driver	ExecerContext	
3094	driver	Queryer	
3095	driver	QueryerContext	
3096	driver	Conn	
3097	driver	ConnPrepareContext	
3098	driver	IsolationLevel	int
3099	driver	TxOptions	struct
3100	driver	ConnBeginTx	
3101	driver	SessionResetter	
3102	driver	Result	
3103	driver	Stmt	
3104	driver	StmtExecContext	
3105	driver	StmtQueryContext	
3106	driver	NamedValueChecker	
3107	driver	ColumnConverter	
3108	driver	Rows	
3109	driver	RowsNextResultSet	
3110	driver	RowsColumnTypeScanType	
3111	driver	RowsColumnTypeDatabaseTypeName	
3112	driver	RowsColumnTypeLength	
3113	driver	RowsColumnTypeNullable	
3114	driver	RowsColumnTypePrecisionScale	
3115	driver	Tx	
3116	driver	RowsAffected	int64
3117	driver	ValueConverter	
3118	driver	Valuer	
3119	driver	Null	struct
3120	driver	NotNull	struct
3121	sql	NamedArg	struct
3122	sql	IsolationLevel	int
3123	sql	TxOptions	struct
3124	sql	RawBytes	[]byte
3125	sql	NullString	struct
3126	sql	NullInt64	struct
3127	sql	NullFloat64	struct
3128	sql	NullBool	struct
3129	sql	Scanner	
3130	sql	Out	struct
3131	sql	DB	struct
3132	sql	DBStats	struct
3133	sql	Conn	struct
3134	sql	Tx	struct
3135	sql	Stmt	struct
3136	sql	Rows	struct
3137	sql	ColumnType	struct
3138	sql	Row	struct
3139	sql	Result	
3140	dwarf	DecodeError	struct
3141	dwarf	Attr	uint32
3142	dwarf	Tag	uint32
3143	dwarf	Entry	struct
3144	dwarf	Field	struct
3145	dwarf	Class	int
3146	dwarf	Offset	uint32
3147	dwarf	Reader	struct
3148	dwarf	LineReader	struct
3149	dwarf	LineEntry	struct
3150	dwarf	LineFile	struct
3151	dwarf	LineReaderPos	struct
3152	dwarf	Data	struct
3153	dwarf	Type	
3154	dwarf	CommonType	struct
3155	dwarf	BasicType	struct
3156	dwarf	CharType	struct
3157	dwarf	UcharType	struct
3158	dwarf	IntType	struct
3159	dwarf	UintType	struct
3160	dwarf	FloatType	struct
3161	dwarf	ComplexType	struct
3162	dwarf	BoolType	struct
3163	dwarf	AddrType	struct
3164	dwarf	UnspecifiedType	struct
3165	dwarf	QualType	struct
3166	dwarf	ArrayType	struct
3167	dwarf	VoidType	struct
3168	dwarf	PtrType	struct
3169	dwarf	StructType	struct
3170	dwarf	StructField	struct
3171	dwarf	EnumType	struct
3172	dwarf	EnumValue	struct
3173	dwarf	FuncType	struct
3174	dwarf	DotDotDotType	struct
3175	dwarf	TypedefType	struct
3176	elf	Version	byte
3177	elf	Class	byte
3178	elf	Data	byte
3179	elf	OSABI	byte
3180	elf	Type	uint16
3181	elf	Machine	uint16
3182	elf	SectionIndex	int
3183	elf	SectionType	uint32
3184	elf	SectionFlag	uint32
3185	elf	CompressionType	int
3186	elf	ProgType	int
3187	elf	ProgFlag	uint32
3188	elf	DynTag	int
3189	elf	DynFlag	int
3190	elf	NType	int
3191	elf	SymBind	int
3192	elf	SymType	int
3193	elf	SymVis	int
3194	elf	R_X86_64	int
3195	elf	R_AARCH64	int
3196	elf	R_ALPHA	int
3197	elf	R_ARM	int
3198	elf	R_386	int
3199	elf	R_MIPS	int
3200	elf	R_PPC	int
3201	elf	R_PPC64	int
3202	elf	R_RISCV	int
3203	elf	R_390	int
3204	elf	R_SPARC	int
3205	elf	Header32	struct
3206	elf	Section32	struct
3207	elf	Prog32	struct
3208	elf	Dyn32	struct
3209	elf	Chdr32	struct
3210	elf	Rel32	struct
3211	elf	Rela32	struct
3212	elf	Sym32	struct
3213	elf	Header64	struct
3214	elf	Section64	struct
3215	elf	Prog64	struct
3216	elf	Dyn64	struct
3217	elf	Chdr64	struct
3218	elf	Rel64	struct
3219	elf	Rela64	struct
3220	elf	Sym64	struct
3221	elf	FileHeader	struct
3222	elf	File	struct
3223	elf	SectionHeader	struct
3224	elf	Section	struct
3225	elf	ProgHeader	struct
3226	elf	Prog	struct
3227	elf	Symbol	struct
3228	elf	FormatError	struct
3229	elf	ImportedSymbol	struct
3230	gosym	LineTable	struct
3231	gosym	Sym	struct
3232	gosym	Func	struct
3233	gosym	Obj	struct
3234	gosym	Table	struct
3235	gosym	UnknownFileError	string
3236	gosym	UnknownLineError	struct
3237	gosym	DecodingError	struct
3238	macho	FatFile	struct
3239	macho	FatArchHeader	struct
3240	macho	FatArch	struct
3241	macho	File	struct
3242	macho	Load	
3243	macho	LoadBytes	[]byte
3244	macho	SegmentHeader	struct
3245	macho	Segment	struct
3246	macho	SectionHeader	struct
3247	macho	Reloc	struct
3248	macho	Section	struct
3249	macho	Dylib	struct
3250	macho	Symtab	struct
3251	macho	Dysymtab	struct
3252	macho	Rpath	struct
3253	macho	Symbol	struct
3254	macho	FormatError	struct
3255	macho	FileHeader	struct
3256	macho	Type	uint32
3257	macho	Cpu	uint32
3258	macho	LoadCmd	uint32
3259	macho	Segment32	struct
3260	macho	Segment64	struct
3261	macho	SymtabCmd	struct
3262	macho	DysymtabCmd	struct
3263	macho	DylibCmd	struct
3264	macho	RpathCmd	struct
3265	macho	Thread	struct
3266	macho	Section32	struct
3267	macho	Section64	struct
3268	macho	Nlist32	struct
3269	macho	Nlist64	struct
3270	macho	Regs386	struct
3271	macho	RegsAMD64	struct
3272	macho	RelocTypeGeneric	int
3273	macho	RelocTypeX86_64	int
3274	macho	RelocTypeARM	int
3275	macho	RelocTypeARM64	int
3276	pe	File	struct
3277	pe	ImportDirectory	struct
3278	pe	FormatError	struct
3279	pe	FileHeader	struct
3280	pe	DataDirectory	struct
3281	pe	OptionalHeader32	struct
3282	pe	OptionalHeader64	struct
3283	pe	SectionHeader32	struct
3284	pe	Reloc	struct
3285	pe	SectionHeader	struct
3286	pe	Section	struct
3287	pe	StringTable	[]byte
3288	pe	COFFSymbol	struct
3289	pe	Symbol	struct
3290	plan9obj	FileHeader	struct
3291	plan9obj	File	struct
3292	plan9obj	SectionHeader	struct
3293	plan9obj	Section	struct
3294	plan9obj	Sym	struct
3295	ascii85	CorruptInputError	int64
3296	asn1	StructuralError	struct
3297	asn1	SyntaxError	struct
3298	asn1	BitString	struct
3299	asn1	ObjectIdentifier	[]int
3300	asn1	Enumerated	int
3301	asn1	Flag	bool
3302	asn1	RawValue	struct
3303	asn1	RawContent	[]byte
3304	base32	Encoding	struct
3305	base32	CorruptInputError	int64
3306	base64	Encoding	struct
3307	base64	CorruptInputError	int64
3308	binary	ByteOrder	
3309	csv	ParseError	struct
3310	csv	Reader	struct
3311	csv	Writer	struct
3312	encoding	BinaryMarshaler	
3313	encoding	BinaryUnmarshaler	
3314	encoding	TextMarshaler	
3315	encoding	TextUnmarshaler	
3316	main	Type	struct
3317	gob	Decoder	struct
3318	main	Type	struct
3319	gob	Encoder	struct
3320	gob	CommonType	struct
3321	gob	GobEncoder	
3322	gob	GobDecoder	
3323	hex	InvalidByteError	byte
3324	json	Unmarshaler	
3325	json	UnmarshalTypeError	struct
3326	json	UnmarshalFieldError	struct
3327	json	InvalidUnmarshalError	struct
3328	json	Number	string
3329	json	Marshaler	
3330	json	UnsupportedTypeError	struct
3331	json	UnsupportedValueError	struct
3332	json	InvalidUTF8Error	struct
3333	json	MarshalerError	struct
3334	json	SyntaxError	struct
3335	json	Decoder	struct
3336	json	Encoder	struct
3337	json	RawMessage	[]byte
3338	json	Token	interface{}
3339	json	Delim	rune
3340	pem	Block	struct
3341	xml	Marshaler	
3342	xml	MarshalerAttr	
3343	xml	Encoder	struct
3344	xml	UnsupportedTypeError	struct
3345	xml	UnmarshalError	string
3346	xml	Unmarshaler	
3347	xml	UnmarshalerAttr	
3348	xml	TagPathError	struct
3349	xml	SyntaxError	struct
3350	xml	Name	struct
3351	xml	Attr	struct
3352	xml	Token	interface{}
3353	xml	StartElement	struct
3354	xml	EndElement	struct
3355	xml	CharData	[]byte
3356	xml	Comment	[]byte
3357	xml	ProcInst	struct
3358	xml	Directive	[]byte
3359	xml	TokenReader	
3360	xml	Decoder	struct
3361	expvar	Var	
3362	expvar	Int	struct
3363	expvar	Float	struct
3364	expvar	Map	struct
3365	expvar	KeyValue	struct
3366	expvar	String	struct
3367	expvar	Func	func() interface{}
3368	flag	Value	
3369	flag	Getter	
3370	flag	ErrorHandling	int
3371	flag	FlagSet	struct
3372	flag	Flag	struct
3373	fmt	State	
3374	fmt	Formatter	
3375	fmt	Stringer	
3376	fmt	GoStringer	
3377	fmt	ScanState	
3378	fmt	Scanner	
3379	ast	Node	
3380	ast	Expr	
3381	ast	Stmt	
3382	ast	Decl	
3383	ast	Comment	struct
3384	ast	CommentGroup	struct
3385	ast	Field	struct
3386	ast	FieldList	struct
3387	ast	BadExpr	struct
3388	ast	Ident	struct
3389	ast	Ellipsis	struct
3390	ast	BasicLit	struct
3391	ast	FuncLit	struct
3392	ast	CompositeLit	struct
3393	ast	ParenExpr	struct
3394	ast	SelectorExpr	struct
3395	ast	IndexExpr	struct
3396	ast	SliceExpr	struct
3397	ast	TypeAssertExpr	struct
3398	ast	CallExpr	struct
3399	ast	StarExpr	struct
3400	ast	UnaryExpr	struct
3401	ast	BinaryExpr	struct
3402	ast	KeyValueExpr	struct
3403	ast	ChanDir	int
3404	ast	ArrayType	struct
3405	ast	StructType	struct
3406	ast	FuncType	struct
3407	ast	InterfaceType	struct
3408	ast	MapType	struct
3409	ast	ChanType	struct
3410	ast	BadStmt	struct
3411	ast	DeclStmt	struct
3412	ast	EmptyStmt	struct
3413	ast	LabeledStmt	struct
3414	ast	ExprStmt	struct
3415	ast	SendStmt	struct
3416	ast	IncDecStmt	struct
3417	ast	AssignStmt	struct
3418	ast	GoStmt	struct
3419	ast	DeferStmt	struct
3420	ast	ReturnStmt	struct
3421	ast	BranchStmt	struct
3422	ast	BlockStmt	struct
3423	ast	IfStmt	struct
3424	ast	CaseClause	struct
3425	ast	SwitchStmt	struct
3426	ast	TypeSwitchStmt	struct
3427	ast	CommClause	struct
3428	ast	SelectStmt	struct
3429	ast	ForStmt	struct
3430	ast	RangeStmt	struct
3431	ast	Spec	
3432	ast	ImportSpec	struct
3433	ast	ValueSpec	struct
3434	ast	TypeSpec	struct
3435	ast	BadDecl	struct
3436	ast	GenDecl	struct
3437	ast	FuncDecl	struct
3438	ast	File	struct
3439	ast	Package	struct
3440	ast	CommentMap	map[ast.Node][]*ast.CommentGroup
3441	ast	Filter	func(string) bool
3442	ast	MergeMode	uint
3443	ast	FieldFilter	func(string, reflect.Value) bool
3444	ast	Importer	func(map[string]*ast.Object, string) (*ast.Object, error)
3445	ast	Scope	struct
3446	ast	Object	struct
3447	ast	ObjKind	int
3448	ast	Visitor	
3449	build	Context	struct
3450	build	ImportMode	uint
3451	build	Package	struct
3452	build	NoGoError	struct
3453	build	MultiplePackageError	struct
3454	constant	Kind	int
3455	constant	Value	
3456	doc	Package	struct
3457	doc	Value	struct
3458	doc	Type	struct
3459	doc	Func	struct
3460	doc	Note	struct
3461	doc	Mode	int
3462	doc	Example	struct
3463	doc	Filter	func(string) bool
3464	b	T	struct
3465	testing	InternalBenchmark	struct
3466	testing	B	struct
3467	testing	BenchmarkResult	struct
3468	blank	T	int
3469	blank	S	struct
3470	c	A	struct
3471	c	B	struct
3472	c	C	struct
3473	c	D	struct
3474	c	E1	struct
3475	c	E2	struct
3476	c	E3	struct
3477	c	E4	struct
3478	c	T1	struct
3479	c	T2	struct
3480	d	T2	struct
3481	d	TG2	struct
3482	d	TG1	struct
3483	d	TG0	struct
3484	d	T1	struct
3485	d	T0	struct
3486	e	T1	struct
3487	e	T2	struct
3488	e	T3	struct
3489	e	T4	struct
3490	e	T4	struct
3491	e	T5	struct
3492	e	U1	struct
3493	e	U2	struct
3494	e	U3	struct
3495	e	U4	struct
3496	e	V1	struct
3497	e	V2	struct
3498	e	V3	struct
3499	e	V4	struct
3500	e	V5	struct
3501	e	V6	struct
3502	error1	I0	
3503	error1	T0	struct
3504	error1	S0	struct
3505	error2	I0	
3506	error2	T0	struct
3507	error2	S0	struct
3508	testing	InternalExample	struct
3509	issue12839	T1	struct
3510	issue12839	T2	struct
3511	issue22856	T	struct
3512	testing	T	struct
3513	testing	InternalTest	struct
3514	importer	Lookup	func(string) (io.ReadCloser, error)
3515	gccgoimporter	GccgoInstallation	struct
3516	gccgoimporter	PackageInit	struct
3517	gccgoimporter	InitData	struct
3518	gccgoimporter	Importer	func(map[string]*types.Package, string, func(string) (io.ReadCloser, error)) (*types.Package, error)
3519	aliases	T0	[]int
3520	aliases	T1	[]byte
3521	aliases	T2	struct
3522	aliases	T3	
3523	aliases	T4	func(int, aliases.T0) chan aliases.T2
3524	aliases	Ai	int
3525	aliases	A0	aliases.T0
3526	aliases	A1	aliases.T1
3527	aliases	A2	aliases.T2
3528	aliases	A3	aliases.T3
3529	aliases	A4	aliases.T4
3530	aliases	A10	[]int
3531	aliases	A11	[]byte
3532	aliases	A12	struct
3533	aliases	A13	
3534	aliases	A14	func(int, aliases.A0) chan aliases.A2
3535	aliases	V0	aliases.V1
3536	aliases	V1	(aliases.V2)
3537	aliases	V2	(aliases.V3)
3538	aliases	V3	aliases.T0
3539	aliases	C0	struct
3540	aliases	C1	*aliases.C0
3541	aliases	C2	aliases.C1
3542	aliases	C5	struct
3543	aliases	C6	aliases.C5
3544	conversions	Units	string
3545	escapeinfo	T	struct
3546	lib	M	struct
3547	lib	F	struct
3548	lib	E	lib.F
3549	server	A	struct
3550	server	FooServer	server.Server
3551	server	Server	struct
3552	nointerface	I	int
3553	pointer	Int8Ptr	*int8
3554	a	A	struct
3555	b	A	a.A
3556	exports	T1	int
3557	exports	T2	[]int
3558	exports	T3	[]int
3559	exports	T4	*int
3560	exports	T5	chan int\n
3561	exports	T6a	chan int\n
3562	exports	T6b	chan (chan int\n)\n
3563	exports	T6c	chan (chan int\n)\n
3564	exports	T7	chan *ast.File\n
3565	exports	T8	struct
3566	exports	T9	struct
3567	exports	T10	struct
3568	exports	T11	map[int]string
3569	exports	T12	interface{}
3570	exports	T13	
3571	exports	T14	
3572	exports	T15	func()
3573	exports	T16	func(int)
3574	exports	T17	func(int)
3575	exports	T18	func() float32
3576	exports	T19	func() float32
3577	exports	T20	func(...interface{})
3578	exports	T21	struct
3579	exports	T22	struct
3580	exports	T23	struct
3581	exports	T24	*exports.T24
3582	exports	T25	*exports.T26
3583	exports	T26	*exports.T27
3584	exports	T27	*exports.T25
3585	exports	T28	func(exports.T28) exports.T28
3586	p	Error	error
3587	issue25301	A	
3588	issue25301	T	
3589	issue25301	S	struct
3590	issue25596	E	
3591	issue25596	T	
3592	test	BlankField	struct
3593	srcimporter	Importer	struct
3594	parser	Mode	uint
3595	printer	Mode	uint
3596	printer	Config	struct
3597	printer	CommentedNode	struct
3598	scanner	Error	struct
3599	scanner	ErrorList	[]*scanner.Error
3600	scanner	ErrorHandler	func(token.Position, string)
3601	scanner	Scanner	struct
3602	scanner	Mode	uint
3603	token	Position	struct
3604	token	Pos	int
3605	token	File	struct
3606	token	FileSet	struct
3607	token	Token	int
3608	types	Error	struct
3609	types	Importer	
3610	types	ImportMode	int
3611	types	ImporterFrom	
3612	types	Config	struct
3613	types	Info	struct
3614	types	TypeAndValue	struct
3615	types	Initializer	struct
3616	types	Checker	struct
3617	types	MethodSet	struct
3618	types	Object	
3619	types	PkgName	struct
3620	types	Const	struct
3621	types	TypeName	struct
3622	types	Var	struct
3623	types	Func	struct
3624	types	Label	struct
3625	types	Builtin	struct
3626	types	Nil	struct
3627	types	Package	struct
3628	types	Scope	struct
3629	types	SelectionKind	int
3630	types	Selection	struct
3631	types	Sizes	
3632	types	StdSizes	struct
3633	types	Type	
3634	types	BasicKind	int
3635	types	BasicInfo	int
3636	types	Basic	struct
3637	types	Array	struct
3638	types	Slice	struct
3639	types	Struct	struct
3640	types	Pointer	struct
3641	types	Tuple	struct
3642	types	Signature	struct
3643	types	Interface	struct
3644	types	Map	struct
3645	types	Chan	struct
3646	types	ChanDir	int
3647	types	Named	struct
3648	types	Qualifier	func(*types.Package) string
3649	crc32	Table	[]uint32
3650	crc64	Table	[]uint64
3651	hash	Hash	
3652	hash	Hash32	
3653	hash	Hash64	
3654	template	CSS	string
3655	template	HTML	string
3656	template	HTMLAttr	string
3657	template	JS	string
3658	template	JSStr	string
3659	template	URL	string
3660	template	Srcset	string
3661	template	Error	struct
3662	template	ErrorCode	int
3663	template	Template	struct
3664	template	FuncMap	map[string]interface{}
3665	color	Color	
3666	color	RGBA	struct
3667	color	RGBA64	struct
3668	color	NRGBA	struct
3669	color	NRGBA64	struct
3670	color	Alpha	struct
3671	color	Alpha16	struct
3672	color	Gray	struct
3673	color	Gray16	struct
3674	color	Model	
3675	color	Palette	[]color.Color
3676	color	YCbCr	struct
3677	color	NYCbCrA	struct
3678	color	CMYK	struct
3679	draw	Image	
3680	draw	Quantizer	
3681	draw	Op	int
3682	draw	Drawer	
3683	image	Point	struct
3684	image	Rectangle	struct
3685	gif	GIF	struct
3686	gif	Options	struct
3687	image	Config	struct
3688	image	Image	
3689	image	PalettedImage	
3690	image	RGBA	struct
3691	image	RGBA64	struct
3692	image	NRGBA	struct
3693	image	NRGBA64	struct
3694	image	Alpha	struct
3695	image	Alpha16	struct
3696	image	Gray	struct
3697	image	Gray16	struct
3698	image	CMYK	struct
3699	image	Paletted	struct
3700	jpeg	FormatError	string
3701	jpeg	UnsupportedError	string
3702	jpeg	Reader	
3703	jpeg	Options	struct
3704	image	Uniform	struct
3705	png	FormatError	string
3706	png	UnsupportedError	string
3707	png	Encoder	struct
3708	png	EncoderBufferPool	
3709	png	EncoderBuffer	png.encoder
3710	png	CompressionLevel	int
3711	image	YCbCrSubsampleRatio	int
3712	image	YCbCr	struct
3713	image	NYCbCrA	struct
3714	suffixarray	Index	struct
3715	cpu	CacheLinePad	struct
3716	fmtsort	SortedMap	struct
3717	nettrace	TraceKey	struct
3718	nettrace	LookupIPAltResolverKey	struct
3719	nettrace	Trace	struct
3720	poll	TimeoutError	struct
3721	poll	FD	struct
3722	poll	FD	struct
3723	poll	FD	struct
3724	singleflight	Group	struct
3725	singleflight	Result	struct
3726	unix	GetRandomFlag	uintptr
3727	unix	GetRandomFlag	uintptr
3728	windows	PROCESS_MEMORY_COUNTERS	struct
3729	registry	Key	syscall.Handle
3730	registry	KeyInfo	struct
3731	windows	REPARSE_DATA_BUFFER_HEADER	struct
3732	windows	SymbolicLinkReparseBuffer	struct
3733	windows	MountPointReparseBuffer	struct
3734	windows	LUID	struct
3735	windows	LUID_AND_ATTRIBUTES	struct
3736	windows	TOKEN_PRIVILEGES	struct
3737	windows	SID_AND_ATTRIBUTES	struct
3738	windows	TOKEN_MANDATORY_LABEL	struct
3739	windows	TokenType	uint32
3740	windows	LocalGroupUserInfo0	struct
3741	windows	UserInfo4	struct
3742	windows	FILE_ATTRIBUTE_TAG_INFO	struct
3743	windows	SocketAddress	struct
3744	windows	IpAdapterUnicastAddress	struct
3745	windows	IpAdapterAnycastAddress	struct
3746	windows	IpAdapterMulticastAddress	struct
3747	windows	IpAdapterDnsServerAdapter	struct
3748	windows	IpAdapterPrefix	struct
3749	windows	IpAdapterAddresses	struct
3750	windows	WSAMsg	struct
3751	windows	SHARE_INFO_2	struct
3752	testlog	Interface	
3753	trace	MutatorUtil	struct
3754	trace	UtilFlags	int
3755	trace	MMUCurve	struct
3756	trace	UtilWindow	struct
3757	trace	GDesc	struct
3758	trace	UserRegionDesc	struct
3759	trace	GExecutionStat	struct
3760	trace	Event	struct
3761	trace	Frame	struct
3762	trace	ParseResult	struct
3763	trace	G	struct
3764	trace	Writer	struct
3765	asn1	Tag	uint8
3766	cryptobyte	Builder	struct
3767	cryptobyte	BuilderContinuation	func(*cryptobyte.Builder)
3768	cryptobyte	BuildError	struct
3769	cryptobyte	MarshalingValue	
3770	cryptobyte	String	[]byte
3771	chacha20	Cipher	struct
3772	dnsmessage	Type	uint16
3773	dnsmessage	Class	uint16
3774	dnsmessage	OpCode	uint16
3775	dnsmessage	RCode	uint16
3776	dnsmessage	Header	struct
3777	dnsmessage	Message	struct
3778	dnsmessage	Resource	struct
3779	dnsmessage	ResourceBody	
3780	dnsmessage	Parser	struct
3781	dnsmessage	Builder	struct
3782	dnsmessage	ResourceHeader	struct
3783	dnsmessage	Name	struct
3784	dnsmessage	Question	struct
3785	dnsmessage	CNAMEResource	struct
3786	dnsmessage	MXResource	struct
3787	dnsmessage	NSResource	struct
3788	dnsmessage	PTRResource	struct
3789	dnsmessage	SOAResource	struct
3790	dnsmessage	TXTResource	struct
3791	dnsmessage	SRVResource	struct
3792	dnsmessage	AResource	struct
3793	dnsmessage	AAAAResource	struct
3794	httpproxy	Config	struct
3795	hpack	Encoder	struct
3796	hpack	DecodingError	struct
3797	hpack	InvalidIndexError	int
3798	hpack	HeaderField	struct
3799	hpack	Decoder	struct
3800	idna	Option	func(*idna.options)
3801	idna	Profile	struct
3802	lif	Addr	
3803	lif	Inet4Addr	struct
3804	lif	Inet6Addr	struct
3805	lif	Link	struct
3806	nettest	MakePipe	func() (net.Conn, func(), error)
3807	route	Addr	
3808	route	LinkAddr	struct
3809	route	Inet4Addr	struct
3810	route	Inet6Addr	struct
3811	route	DefaultAddr	struct
3812	route	InterfaceMessage	struct
3813	route	InterfaceAddrMessage	struct
3814	route	InterfaceMulticastAddrMessage	struct
3815	route	InterfaceAnnounceMessage	struct
3816	route	Message	
3817	route	Sys	
3818	route	SysType	int
3819	route	RouteMessage	struct
3820	route	RIBType	int
3821	route	RouteMetrics	struct
3822	route	InterfaceMetrics	struct
3823	route	RouteMetrics	struct
3824	route	InterfaceMetrics	struct
3825	route	RouteMetrics	struct
3826	route	InterfaceMetrics	struct
3827	route	RouteMetrics	struct
3828	route	InterfaceMetrics	struct
3829	route	RouteMetrics	struct
3830	route	InterfaceMetrics	struct
3831	bidirule	Transformer	struct
3832	transform	Transformer	
3833	transform	SpanningTransformer	
3834	transform	NopResetter	struct
3835	transform	Reader	struct
3836	transform	Writer	struct
3837	bidi	Direction	int
3838	bidi	Option	func(*bidi.options)
3839	bidi	Paragraph	struct
3840	bidi	Ordering	struct
3841	bidi	Run	struct
3842	bidi	Properties	struct
3843	bidi	Class	uint
3844	norm	Properties	struct
3845	norm	Iter	struct
3846	norm	Form	int
3847	xcoff	Archive	struct
3848	xcoff	ArchiveHeader	struct
3849	xcoff	Member	struct
3850	xcoff	MemberHeader	struct
3851	xcoff	SectionHeader	struct
3852	xcoff	Section	struct
3853	xcoff	AuxiliaryCSect	struct
3854	xcoff	AuxiliaryFcn	struct
3855	xcoff	Symbol	struct
3856	xcoff	Reloc	struct
3857	xcoff	ImportedSymbol	struct
3858	xcoff	FileHeader	struct
3859	xcoff	File	struct
3860	xcoff	FileHeader32	struct
3861	xcoff	FileHeader64	struct
3862	xcoff	SectionHeader32	struct
3863	xcoff	SectionHeader64	struct
3864	xcoff	SymEnt32	struct
3865	xcoff	SymEnt64	struct
3866	xcoff	AuxFile64	struct
3867	xcoff	AuxFcn32	struct
3868	xcoff	AuxFcn64	struct
3869	xcoff	AuxSect64	struct
3870	xcoff	AuxCSect32	struct
3871	xcoff	AuxCSect64	struct
3872	xcoff	LoaderHeader32	struct
3873	xcoff	LoaderHeader64	struct
3874	xcoff	LoaderSymbol32	struct
3875	xcoff	LoaderSymbol64	struct
3876	xcoff	Reloc32	struct
3877	xcoff	Reloc64	struct
3878	io	Reader	
3879	io	Writer	
3880	io	Closer	
3881	io	Seeker	
3882	io	ReadWriter	
3883	io	ReadCloser	
3884	io	WriteCloser	
3885	io	ReadWriteCloser	
3886	io	ReadSeeker	
3887	io	WriteSeeker	
3888	io	ReadWriteSeeker	
3889	io	ReaderFrom	
3890	io	WriterTo	
3891	io	ReaderAt	
3892	io	WriterAt	
3893	io	ByteReader	
3894	io	ByteScanner	
3895	io	ByteWriter	
3896	io	RuneReader	
3897	io	RuneScanner	
3898	io	StringWriter	
3899	io	LimitedReader	struct
3900	io	SectionReader	struct
3901	io	PipeReader	struct
3902	io	PipeWriter	struct
3903	log	Logger	struct
3904	syslog	Priority	int
3905	syslog	Writer	struct
3906	big	Word	uint
3907	big	Float	struct
3908	big	ErrNaN	struct
3909	big	RoundingMode	byte
3910	big	Accuracy	int8
3911	big	Int	struct
3912	big	Rat	struct
3913	rand	Source	
3914	rand	Source64	
3915	rand	Rand	struct
3916	rand	Zipf	struct
3917	mime	WordEncoder	byte
3918	mime	WordDecoder	struct
3919	multipart	Form	struct
3920	multipart	FileHeader	struct
3921	multipart	File	
3922	multipart	Part	struct
3923	multipart	Reader	struct
3924	multipart	Writer	struct
3925	quotedprintable	Reader	struct
3926	quotedprintable	Writer	struct
3927	net	Dialer	struct
3928	net	ListenConfig	struct
3929	net	SRV	struct
3930	net	MX	struct
3931	net	NS	struct
3932	cgi	Handler	struct
3933	http	Client	struct
3934	http	RoundTripper	
3935	http	Cookie	struct
3936	http	SameSite	int
3937	cookiejar	PublicSuffixList	
3938	cookiejar	Options	struct
3939	cookiejar	Jar	struct
3940	http	Dir	string
3941	http	FileSystem	
3942	http	File	
3943	http	I	
3944	http	Header	map[string][]string
3945	http	PushOptions	struct
3946	http	Pusher	
3947	httptest	ResponseRecorder	struct
3948	httptest	Server	struct
3949	httptrace	ClientTrace	struct
3950	httptrace	WroteRequestInfo	struct
3951	httptrace	DNSStartInfo	struct
3952	httptrace	DNSDoneInfo	struct
3953	httptrace	GotConnInfo	struct
3954	httputil	ServerConn	struct
3955	httputil	ClientConn	struct
3956	httputil	ReverseProxy	struct
3957	httputil	BufferPool	
3958	internal	FlushAfterChunkWriter	struct
3959	http	CookieJar	
3960	http	ProtocolError	struct
3961	http	Request	struct
3962	http	Response	struct
3963	http	Handler	
3964	http	ResponseWriter	
3965	http	Flusher	
3966	http	Hijacker	
3967	http	CloseNotifier	
3968	http	HandlerFunc	func(http.ResponseWriter, *http.Request)
3969	http	ServeMux	struct
3970	http	Server	struct
3971	http	ConnState	int
3972	http	Transport	struct
3973	main	Counter	struct
3974	main	Chan	chan int\n
3975	net	Interface	struct
3976	net	Flags	uint
3977	socktest	Switch	struct
3978	socktest	Cookie	uint64
3979	socktest	Status	struct
3980	socktest	Stat	struct
3981	socktest	FilterType	int
3982	socktest	Filter	func(*socktest.Status) (socktest.AfterFilter, error)
3983	socktest	AfterFilter	func(*socktest.Status) error
3984	socktest	Sockets	map[int]socktest.Status
3985	socktest	Sockets	map[int]socktest.Status
3986	socktest	Sockets	map[syscall.Handle]socktest.Status
3987	net	IP	[]byte
3988	net	IPMask	[]byte
3989	net	IPNet	struct
3990	net	IPAddr	struct
3991	net	IPConn	struct
3992	net	Resolver	struct
3993	net	HardwareAddr	[]byte
3994	mail	Message	struct
3995	mail	Header	map[string][]string
3996	mail	Address	struct
3997	mail	AddressParser	struct
3998	net	Addr	
3999	net	Conn	
4000	net	PacketConn	
4001	net	Listener	
4002	net	Error	
4003	net	OpError	struct
4004	net	ParseError	struct
4005	net	AddrError	struct
4006	net	UnknownNetworkError	string
4007	net	InvalidAddrError	string
4008	net	DNSConfigError	struct
4009	net	DNSError	struct
4010	net	Buffers	[][]byte
4011	rpc	ServerError	string
4012	rpc	Call	struct
4013	rpc	Client	struct
4014	rpc	ClientCodec	
4015	rpc	Request	struct
4016	rpc	Response	struct
4017	rpc	Server	struct
4018	rpc	ServerCodec	
4019	smtp	Auth	
4020	smtp	ServerInfo	struct
4021	smtp	Client	struct
4022	net	TCPAddr	struct
4023	net	TCPConn	struct
4024	net	TCPListener	struct
4025	textproto	MIMEHeader	map[string][]string
4026	textproto	Pipeline	struct
4027	textproto	Reader	struct
4028	textproto	Error	struct
4029	textproto	ProtocolError	string
4030	textproto	Conn	struct
4031	textproto	Writer	struct
4032	net	UDPAddr	struct
4033	net	UDPConn	struct
4034	net	UnixAddr	struct
4035	net	UnixConn	struct
4036	net	UnixListener	struct
4037	url	Error	struct
4038	url	EscapeError	string
4039	url	InvalidHostError	string
4040	url	URL	struct
4041	url	Userinfo	struct
4042	url	Values	map[string][]string
4043	os	PathError	struct
4044	os	SyscallError	struct
4045	exec	Error	struct
4046	exec	Cmd	struct
4047	exec	F	func(*exec.Cmd) (*os.File, error)
4048	exec	ExitError	struct
4049	os	Process	struct
4050	os	ProcAttr	struct
4051	os	Signal	
4052	os	ProcessState	struct
4053	os	ProcessState	struct
4054	os	LinkError	struct
4055	pty	PtyError	struct
4056	os	File	struct
4057	os	FileInfo	
4058	os	FileMode	uint32
4059	user	User	struct
4060	user	Group	struct
4061	user	UnknownUserIdError	int
4062	user	UnknownUserError	string
4063	user	UnknownGroupIdError	string
4064	user	UnknownGroupError	string
4065	filepath	WalkFunc	func(string, os.FileInfo, error) error
4066	plugin	Plugin	struct
4067	plugin	Symbol	interface{}
4068	reflect	Type	
4069	reflect	Kind	uint
4070	reflect	ChanDir	int
4071	reflect	Method	struct
4072	reflect	StructField	struct
4073	reflect	StructTag	string
4074	reflect	Value	struct
4075	reflect	ValueError	struct
4076	reflect	MapIter	struct
4077	reflect	StringHeader	struct
4078	reflect	SliceHeader	struct
4079	reflect	SelectDir	int
4080	reflect	SelectCase	struct
4081	regexp	Regexp	struct
4082	syntax	Error	struct
4083	syntax	ErrorCode	string
4084	syntax	Flags	uint16
4085	syntax	Prog	struct
4086	syntax	InstOp	uint8
4087	syntax	EmptyOp	uint8
4088	syntax	Inst	struct
4089	syntax	Regexp	struct
4090	syntax	Op	uint8
4091	debug	GCStats	struct
4092	debug	BuildInfo	struct
4093	debug	Module	struct
4094	runtime	Usigset	C.__sigset_t
4095	runtime	Fpxreg	C.struct__libc_fpxreg
4096	runtime	Xmmreg	C.struct__libc_xmmreg
4097	runtime	Fpstate	C.struct__libc_fpstate
4098	runtime	Fpxreg1	C.struct__fpxreg
4099	runtime	Xmmreg1	C.struct__xmmreg
4100	runtime	Fpstate1	C.struct__fpstate
4101	runtime	Fpreg1	C.struct__fpreg
4102	runtime	StackT	C.stack_t
4103	runtime	Mcontext	C.mcontext_t
4104	runtime	Ucontext	C.ucontext_t
4105	runtime	Sigcontext	C.struct_sigcontext
4106	runtime	Fpreg	C.struct__fpreg
4107	runtime	Fpxreg	C.struct__fpxreg
4108	runtime	Xmmreg	C.struct__xmmreg
4109	runtime	Fpstate	C.struct__fpstate
4110	runtime	Timespec	C.struct_timespec
4111	runtime	Timeval	C.struct_timeval
4112	runtime	Sigaction	C.struct_kernel_sigaction
4113	runtime	Siginfo	C.siginfo_t
4114	runtime	StackT	C.stack_t
4115	runtime	Sigcontext	C.struct_sigcontext
4116	runtime	Ucontext	C.struct_ucontext
4117	runtime	Itimerval	C.struct_itimerval
4118	runtime	EpollEvent	C.struct_epoll_event
4119	runtime	Usigset	C.__sigset_t
4120	runtime	Ptregs	C.struct_pt_regs
4121	runtime	Gregset	C.elf_gregset_t
4122	runtime	FPregset	C.elf_fpregset_t
4123	runtime	Vreg	C.elf_vrreg_t
4124	runtime	StackT	C.stack_t
4125	runtime	Sigcontext	C.struct_sigcontext
4126	runtime	Ucontext	C.struct_ucontext
4127	runtime	Timespec	C.struct_timespec
4128	runtime	StackT	C.stack_t
4129	runtime	Sigcontext	C.struct_sigcontext
4130	runtime	Ucontext	C.struct_ucontext
4131	runtime	Timeval	C.struct_timeval
4132	runtime	Itimerval	C.struct_itimerval
4133	runtime	Siginfo	C.struct_xsiginfo
4134	runtime	Sigaction	C.struct_xsigaction
4135	runtime	StackT	C.struct_sigaltstack
4136	runtime	Sighandler	C.union___sigaction_u
4137	runtime	Sigaction	C.struct___sigaction
4138	runtime	Usigaction	C.struct_sigaction
4139	runtime	Sigset	C.sigset_t
4140	runtime	Sigval	C.union_sigval
4141	runtime	Siginfo	C.siginfo_t
4142	runtime	Timeval	C.struct_timeval
4143	runtime	Itimerval	C.struct_itimerval
4144	runtime	Timespec	C.struct_timespec
4145	runtime	FPControl	C.struct_fp_control
4146	runtime	FPStatus	C.struct_fp_status
4147	runtime	RegMMST	C.struct_mmst_reg
4148	runtime	RegXMM	C.struct_xmm_reg
4149	runtime	Regs64	C.struct_x86_thread_state64
4150	runtime	FloatState64	C.struct_x86_float_state64
4151	runtime	ExceptionState64	C.struct_x86_exception_state64
4152	runtime	Mcontext64	C.struct_mcontext64
4153	runtime	Regs32	C.struct_i386_thread_state
4154	runtime	FloatState32	C.struct_i386_float_state
4155	runtime	ExceptionState32	C.struct_i386_exception_state
4156	runtime	Mcontext32	C.struct_mcontext32
4157	runtime	Ucontext	C.struct_ucontext
4158	runtime	Kevent	C.struct_kevent
4159	runtime	Pthread	C.pthread_t
4160	runtime	PthreadAttr	C.pthread_attr_t
4161	runtime	PthreadMutex	C.pthread_mutex_t
4162	runtime	PthreadMutexAttr	C.pthread_mutexattr_t
4163	runtime	PthreadCond	C.pthread_cond_t
4164	runtime	PthreadCondAttr	C.pthread_condattr_t
4165	runtime	MachTimebaseInfo	C.mach_timebase_info_data_t
4166	runtime	Rtprio	C.struct_rtprio
4167	runtime	Lwpparams	C.struct_lwp_params
4168	runtime	Sigset	C.struct___sigset
4169	runtime	StackT	C.stack_t
4170	runtime	Siginfo	C.siginfo_t
4171	runtime	Mcontext	C.mcontext_t
4172	runtime	Ucontext	C.ucontext_t
4173	runtime	Timespec	C.struct_timespec
4174	runtime	Timeval	C.struct_timeval
4175	runtime	Itimerval	C.struct_itimerval
4176	runtime	Kevent	C.struct_kevent
4177	runtime	Rtprio	C.struct_rtprio
4178	runtime	ThrParam	C.struct_thr_param
4179	runtime	Sigset	C.struct___sigset
4180	runtime	StackT	C.stack_t
4181	runtime	Siginfo	C.siginfo_t
4182	runtime	Mcontext	C.mcontext_t
4183	runtime	Ucontext	C.ucontext_t
4184	runtime	Timespec	C.struct_timespec
4185	runtime	Timeval	C.struct_timeval
4186	runtime	Itimerval	C.struct_itimerval
4187	runtime	Umtx_time	C.struct__umtx_time
4188	runtime	Kevent	C.struct_kevent_freebsd11
4189	runtime	Sigset	C.sigset_t
4190	runtime	Timespec	C.struct_timespec
4191	runtime	Timeval	C.struct_timeval
4192	runtime	Sigaction	C.struct_sigaction
4193	runtime	Siginfo	C.siginfo_t
4194	runtime	Itimerval	C.struct_itimerval
4195	runtime	EpollEvent	C.struct_epoll_event
4196	runtime	Sigset	C.sigset_t
4197	runtime	Siginfo	C.struct__ksiginfo
4198	runtime	StackT	C.stack_t
4199	runtime	Timespec	C.struct_timespec
4200	runtime	Timeval	C.struct_timeval
4201	runtime	Itimerval	C.struct_itimerval
4202	runtime	McontextT	C.mcontext_t
4203	runtime	UcontextT	C.ucontext_t
4204	runtime	Kevent	C.struct_kevent
4205	runtime	TforkT	C.struct___tfork
4206	runtime	Sigcontext	C.struct_sigcontext
4207	runtime	Siginfo	C.siginfo_t
4208	runtime	Sigset	C.sigset_t
4209	runtime	Sigval	C.union_sigval
4210	runtime	StackT	C.stack_t
4211	runtime	Timespec	C.struct_timespec
4212	runtime	Timeval	C.struct_timeval
4213	runtime	Itimerval	C.struct_itimerval
4214	runtime	KeventT	C.struct_kevent
4215	runtime	SemT	C.sem_t
4216	runtime	Sigset	C.sigset_t
4217	runtime	StackT	C.stack_t
4218	runtime	Siginfo	C.siginfo_t
4219	runtime	Sigaction	C.struct_sigaction
4220	runtime	Fpregset	C.fpregset_t
4221	runtime	Mcontext	C.mcontext_t
4222	runtime	Ucontext	C.ucontext_t
4223	runtime	Timespec	C.struct_timespec
4224	runtime	Timeval	C.struct_timeval
4225	runtime	Itimerval	C.struct_itimerval
4226	runtime	PortEvent	C.port_event_t
4227	runtime	Pthread	C.pthread_t
4228	runtime	PthreadAttr	C.pthread_attr_t
4229	runtime	Stat	C.struct_stat
4230	runtime	SystemInfo	C.SYSTEM_INFO
4231	runtime	ExceptionRecord	C.EXCEPTION_RECORD
4232	runtime	FloatingSaveArea	C.FLOATING_SAVE_AREA
4233	runtime	M128a	C.M128A
4234	runtime	Context	C.CONTEXT
4235	runtime	Overlapped	C.OVERLAPPED
4236	runtime	MemoryBasicInformation	C.MEMORY_BASIC_INFORMATION
4237	runtime	Error	
4238	runtime	TypeAssertionError	struct
4239	sys	ArchFamilyType	int
4240	sys	Uintreg	uint32
4241	sys	Uintreg	uint64
4242	sys	Uintreg	uint64
4243	sys	Uintreg	uint32
4244	sys	Uintreg	uint64
4245	sys	Uintreg	uint32
4246	sys	Uintreg	uint64
4247	sys	Uintreg	uint64
4248	sys	Uintreg	uint32
4249	sys	Uintreg	uint64
4250	sys	Uintreg	uint64
4251	sys	Uintreg	uint64
4252	sys	Uintreg	uint64
4253	runtime	StackRecord	struct
4254	runtime	MemProfileRecord	struct
4255	runtime	BlockProfileRecord	struct
4256	runtime	MemStats	struct
4257	profile	TagMatch	func(string, int64) bool
4258	profile	Profile	struct
4259	profile	ValueType	struct
4260	profile	Sample	struct
4261	profile	Label	struct
4262	profile	Mapping	struct
4263	profile	Location	struct
4264	profile	Line	struct
4265	profile	Function	struct
4266	profile	Demangler	func([]string) (map[string]string, error)
4267	pprof	LabelSet	struct
4268	pprof	Profile	struct
4269	runtime	Frames	struct
4270	runtime	Frame	struct
4271	runtime	Func	struct
4272	main	P	string
4273	trace	Task	struct
4274	trace	Region	struct
4275	sort	Interface	
4276	sort	IntSlice	[]int
4277	sort	Float64Slice	[]float64
4278	sort	StringSlice	[]string
4279	strconv	NumError	struct
4280	strings	Builder	struct
4281	strings	Reader	struct
4282	strings	Replacer	struct
4283	atomic	Value	struct
4284	sync	Cond	struct
4285	sync	Map	struct
4286	sync	Mutex	struct
4287	sync	Locker	
4288	sync	Once	struct
4289	sync	Pool	struct
4290	sync	RWMutex	struct
4291	sync	WaitGroup	struct
4292	syscall	Qid	struct
4293	syscall	Dir	struct
4294	syscall	DLLError	struct
4295	syscall	DLL	struct
4296	syscall	Proc	struct
4297	syscall	LazyDLL	struct
4298	syscall	LazyProc	struct
4299	syscall	SysProcAttr	struct
4300	syscall	SysProcAttr	struct
4301	syscall	SysProcAttr	struct
4302	syscall	SysProcIDMap	struct
4303	syscall	SysProcAttr	struct
4304	syscall	ProcAttr	struct
4305	syscall	SysProcAttr	struct
4306	syscall	Credential	struct
4307	syscall	ProcAttr	struct
4308	syscall	ProcAttr	struct
4309	syscall	SysProcAttr	struct
4310	js	Func	struct
4311	js	Wrapper	
4312	js	Value	struct
4313	js	Error	struct
4314	js	Type	int
4315	js	ValueError	struct
4316	js	TypedArray	struct
4317	main	Param	struct
4318	main	Rets	struct
4319	main	Fn	struct
4320	main	Source	struct
4321	syscall	RawConn	
4322	syscall	Conn	
4323	syscall	Sockaddr	interface{}
4324	syscall	SockaddrInet4	struct
4325	syscall	SockaddrInet6	struct
4326	syscall	SockaddrUnix	struct
4327	syscall	Sockaddr	
4328	syscall	SockaddrInet4	struct
4329	syscall	SockaddrInet6	struct
4330	syscall	SockaddrUnix	struct
4331	syscall	SockaddrDatalink	struct
4332	syscall	RoutingMessage	
4333	syscall	IPMreq	struct
4334	syscall	IPv6Mreq	struct
4335	syscall	Linger	struct
4336	syscall	ICMPv6Filter	struct
4337	syscall	NetlinkRouteRequest	struct
4338	syscall	NetlinkMessage	struct
4339	syscall	NetlinkRouteAttr	struct
4340	syscall	RoutingMessage	
4341	syscall	RouteMessage	struct
4342	syscall	InterfaceMessage	struct
4343	syscall	InterfaceAddrMessage	struct
4344	syscall	InterfaceMulticastAddrMessage	struct
4345	syscall	InterfaceAnnounceMessage	struct
4346	syscall	InterfaceMulticastAddrMessage	struct
4347	syscall	InterfaceAnnounceMessage	struct
4348	syscall	InterfaceMulticastAddrMessage	struct
4349	syscall	InterfaceAnnounceMessage	struct
4350	syscall	InterfaceAnnounceMessage	struct
4351	syscall	UserInfo10	struct
4352	syscall	SID	struct
4353	syscall	SIDAndAttributes	struct
4354	syscall	Tokenuser	struct
4355	syscall	Tokenprimarygroup	struct
4356	syscall	Token	syscall.Handle
4357	syscall	SocketControlMessage	struct
4358	syscall	SockaddrDatalink	struct
4359	syscall	WaitStatus	uint32
4360	syscall	WaitStatus	uint32
4361	syscall	SockaddrDatalink	struct
4362	syscall	SockaddrDatalink	struct
4363	syscall	SockaddrDatalink	struct
4364	syscall	Dirent	struct
4365	syscall	Errno	uintptr
4366	syscall	Signal	int
4367	syscall	Stat_t	struct
4368	syscall	WaitStatus	uint32
4369	syscall	Rusage	struct
4370	syscall	ProcAttr	struct
4371	syscall	SysProcAttr	struct
4372	syscall	Iovec	struct
4373	syscall	Timespec	struct
4374	syscall	Timeval	struct
4375	syscall	WaitStatus	uint32
4376	syscall	SockaddrLinklayer	struct
4377	syscall	SockaddrNetlink	struct
4378	syscall	Dirent	struct
4379	syscall	Errno	uintptr
4380	syscall	Signal	int
4381	syscall	Stat_t	struct
4382	syscall	WaitStatus	uint32
4383	syscall	Rusage	struct
4384	syscall	ProcAttr	struct
4385	syscall	SysProcAttr	struct
4386	syscall	Iovec	struct
4387	syscall	Timespec	struct
4388	syscall	Timeval	struct
4389	syscall	Timespec	struct
4390	syscall	Timeval	struct
4391	syscall	Timespec	struct
4392	syscall	Timeval	struct
4393	syscall	SockaddrDatalink	struct
4394	syscall	SockaddrDatalink	struct
4395	syscall	ErrorString	string
4396	syscall	Note	string
4397	syscall	Waitmsg	struct
4398	syscall	Timespec	struct
4399	syscall	Timeval	struct
4400	syscall	SockaddrDatalink	struct
4401	syscall	WaitStatus	uint32
4402	syscall	Errno	uintptr
4403	syscall	Signal	int
4404	syscall	Sockaddr	
4405	syscall	SockaddrInet4	struct
4406	syscall	SockaddrInet6	struct
4407	syscall	SockaddrUnix	struct
4408	syscall	Handle	uintptr
4409	syscall	Errno	uintptr
4410	syscall	RawSockaddrInet4	struct
4411	syscall	RawSockaddrInet6	struct
4412	syscall	RawSockaddr	struct
4413	syscall	RawSockaddrAny	struct
4414	syscall	Sockaddr	
4415	syscall	SockaddrInet4	struct
4416	syscall	SockaddrInet6	struct
4417	syscall	RawSockaddrUnix	struct
4418	syscall	SockaddrUnix	struct
4419	syscall	Rusage	struct
4420	syscall	WaitStatus	struct
4421	syscall	Timespec	struct
4422	syscall	Linger	struct
4423	syscall	IPMreq	struct
4424	syscall	IPv6Mreq	struct
4425	syscall	Signal	int
4426	syscall	Timespec	C.struct_timespec
4427	syscall	Timeval	C.struct_timeval
4428	syscall	Timeval32	C.struct_timeval32
4429	syscall	Timezone	C.struct_timezone
4430	syscall	Rusage	C.struct_rusage
4431	syscall	Rlimit	C.struct_rlimit
4432	syscall	Flock_t	C.struct_flock
4433	syscall	Stat_t	C.struct_stat
4434	syscall	Statfs_t	C.struct_statfs
4435	syscall	Fsid64_t	C.fsid64_t
4436	syscall	StTimespec_t	C.st_timespec_t
4437	syscall	Dirent	C.struct_dirent
4438	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4439	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4440	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4441	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4442	syscall	RawSockaddr	C.struct_sockaddr
4443	syscall	RawSockaddrAny	C.struct_sockaddr_any
4444	syscall	Cmsghdr	C.struct_cmsghdr
4445	syscall	ICMPv6Filter	C.struct_icmp6_filter
4446	syscall	Iovec	C.struct_iovec
4447	syscall	IPMreq	C.struct_ip_mreq
4448	syscall	IPv6Mreq	C.struct_ipv6_mreq
4449	syscall	Linger	C.struct_linger
4450	syscall	Msghdr	C.struct_msghdr
4451	syscall	IfMsgHdr	C.struct_if_msghdr
4452	syscall	Utsname	C.struct_utsname
4453	syscall	Timespec	C.struct_timespec
4454	syscall	Timeval	C.struct_timeval
4455	syscall	Timeval32	C.struct_timeval32
4456	syscall	Rusage	C.struct_rusage
4457	syscall	Rlimit	C.struct_rlimit
4458	syscall	Stat_t	C.struct_stat64
4459	syscall	Statfs_t	C.struct_statfs64
4460	syscall	Flock_t	C.struct_flock
4461	syscall	Fstore_t	C.struct_fstore
4462	syscall	Radvisory_t	C.struct_radvisory
4463	syscall	Fbootstraptransfer_t	C.struct_fbootstraptransfer
4464	syscall	Log2phys_t	C.struct_log2phys
4465	syscall	Fsid	C.struct_fsid
4466	syscall	Dirent	C.struct_dirent
4467	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4468	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4469	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4470	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4471	syscall	RawSockaddr	C.struct_sockaddr
4472	syscall	RawSockaddrAny	C.struct_sockaddr_any
4473	syscall	Linger	C.struct_linger
4474	syscall	Iovec	C.struct_iovec
4475	syscall	IPMreq	C.struct_ip_mreq
4476	syscall	IPv6Mreq	C.struct_ipv6_mreq
4477	syscall	Msghdr	C.struct_msghdr
4478	syscall	Cmsghdr	C.struct_cmsghdr
4479	syscall	Inet4Pktinfo	C.struct_in_pktinfo
4480	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4481	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4482	syscall	ICMPv6Filter	C.struct_icmp6_filter
4483	syscall	Kevent_t	C.struct_kevent
4484	syscall	FdSet	C.fd_set
4485	syscall	IfMsghdr	C.struct_if_msghdr
4486	syscall	IfData	C.struct_if_data
4487	syscall	IfaMsghdr	C.struct_ifa_msghdr
4488	syscall	IfmaMsghdr	C.struct_ifma_msghdr
4489	syscall	IfmaMsghdr2	C.struct_ifma_msghdr2
4490	syscall	RtMsghdr	C.struct_rt_msghdr
4491	syscall	RtMetrics	C.struct_rt_metrics
4492	syscall	BpfVersion	C.struct_bpf_version
4493	syscall	BpfStat	C.struct_bpf_stat
4494	syscall	BpfProgram	C.struct_bpf_program
4495	syscall	BpfInsn	C.struct_bpf_insn
4496	syscall	BpfHdr	C.struct_bpf_hdr
4497	syscall	Termios	C.struct_termios
4498	syscall	Timespec	C.struct_timespec
4499	syscall	Timeval	C.struct_timeval
4500	syscall	Rusage	C.struct_rusage
4501	syscall	Rlimit	C.struct_rlimit
4502	syscall	Stat_t	C.struct_stat
4503	syscall	Statfs_t	C.struct_statfs
4504	syscall	Flock_t	C.struct_flock
4505	syscall	Dirent	C.struct_dirent
4506	syscall	Fsid	C.struct_fsid
4507	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4508	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4509	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4510	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4511	syscall	RawSockaddr	C.struct_sockaddr
4512	syscall	RawSockaddrAny	C.struct_sockaddr_any
4513	syscall	Linger	C.struct_linger
4514	syscall	Iovec	C.struct_iovec
4515	syscall	IPMreq	C.struct_ip_mreq
4516	syscall	IPv6Mreq	C.struct_ipv6_mreq
4517	syscall	Msghdr	C.struct_msghdr
4518	syscall	Cmsghdr	C.struct_cmsghdr
4519	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4520	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4521	syscall	ICMPv6Filter	C.struct_icmp6_filter
4522	syscall	Kevent_t	C.struct_kevent
4523	syscall	FdSet	C.fd_set
4524	syscall	IfMsghdr	C.struct_if_msghdr
4525	syscall	IfData	C.struct_if_data
4526	syscall	IfaMsghdr	C.struct_ifa_msghdr
4527	syscall	IfmaMsghdr	C.struct_ifma_msghdr
4528	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
4529	syscall	RtMsghdr	C.struct_rt_msghdr
4530	syscall	RtMetrics	C.struct_rt_metrics
4531	syscall	BpfVersion	C.struct_bpf_version
4532	syscall	BpfStat	C.struct_bpf_stat
4533	syscall	BpfProgram	C.struct_bpf_program
4534	syscall	BpfInsn	C.struct_bpf_insn
4535	syscall	BpfHdr	C.struct_bpf_hdr
4536	syscall	Termios	C.struct_termios
4537	syscall	Timespec	C.struct_timespec
4538	syscall	Timeval	C.struct_timeval
4539	syscall	Rusage	C.struct_rusage
4540	syscall	Rlimit	C.struct_rlimit
4541	syscall	Stat_t	C.struct_stat
4542	syscall	Statfs_t	C.struct_statfs
4543	syscall	Flock_t	C.struct_flock
4544	syscall	Dirent	C.struct_dirent
4545	syscall	Fsid	C.struct_fsid
4546	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4547	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4548	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4549	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4550	syscall	RawSockaddr	C.struct_sockaddr
4551	syscall	RawSockaddrAny	C.struct_sockaddr_any
4552	syscall	Linger	C.struct_linger
4553	syscall	Iovec	C.struct_iovec
4554	syscall	IPMreq	C.struct_ip_mreq
4555	syscall	IPMreqn	C.struct_ip_mreqn
4556	syscall	IPv6Mreq	C.struct_ipv6_mreq
4557	syscall	Msghdr	C.struct_msghdr
4558	syscall	Cmsghdr	C.struct_cmsghdr
4559	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4560	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4561	syscall	ICMPv6Filter	C.struct_icmp6_filter
4562	syscall	Kevent_t	C.struct_kevent_freebsd11
4563	syscall	FdSet	C.fd_set
4564	syscall	IfMsghdr	C.struct_if_msghdr8
4565	syscall	IfData	C.struct_if_data8
4566	syscall	IfaMsghdr	C.struct_ifa_msghdr
4567	syscall	IfmaMsghdr	C.struct_ifma_msghdr
4568	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
4569	syscall	RtMsghdr	C.struct_rt_msghdr
4570	syscall	RtMetrics	C.struct_rt_metrics
4571	syscall	BpfVersion	C.struct_bpf_version
4572	syscall	BpfStat	C.struct_bpf_stat
4573	syscall	BpfZbuf	C.struct_bpf_zbuf
4574	syscall	BpfProgram	C.struct_bpf_program
4575	syscall	BpfInsn	C.struct_bpf_insn
4576	syscall	BpfHdr	C.struct_bpf_hdr
4691	syscall	Msghdr	C.struct_msghdr
4577	syscall	BpfZbufHeader	C.struct_bpf_zbuf_header
4578	syscall	Termios	C.struct_termios
4579	syscall	Timespec	C.struct_timespec
4580	syscall	Timeval	C.struct_timeval
4581	syscall	Timex	C.struct_timex
4582	syscall	Time_t	C.time_t
4583	syscall	Tms	C.struct_tms
4584	syscall	Utimbuf	C.struct_utimbuf
4585	syscall	Rusage	C.struct_rusage
4586	syscall	Rlimit	C.struct_rlimit
4587	syscall	Stat_t	C.struct_stat
4588	syscall	Statfs_t	C.struct_statfs
4589	syscall	Dirent	C.struct_dirent
4590	syscall	Fsid	C.fsid_t
4591	syscall	Flock_t	C.struct_flock
4592	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4593	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4594	syscall	RawSockaddrUnix	C.struct_my_sockaddr_un
4595	syscall	RawSockaddrLinklayer	C.struct_sockaddr_ll
4596	syscall	RawSockaddrNetlink	C.struct_sockaddr_nl
4597	syscall	RawSockaddr	C.struct_sockaddr
4598	syscall	RawSockaddrAny	C.struct_sockaddr_any
4599	syscall	Linger	C.struct_linger
4600	syscall	Iovec	C.struct_iovec
4601	syscall	IPMreq	C.struct_ip_mreq
4602	syscall	IPMreqn	C.struct_ip_mreqn
4603	syscall	IPv6Mreq	C.struct_ipv6_mreq
4604	syscall	Msghdr	C.struct_msghdr
4605	syscall	Cmsghdr	C.struct_cmsghdr
4606	syscall	Inet4Pktinfo	C.struct_in_pktinfo
4607	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4608	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4609	syscall	ICMPv6Filter	C.struct_icmp6_filter
4610	syscall	Ucred	C.struct_ucred
4611	syscall	TCPInfo	C.struct_tcp_info
4612	syscall	NlMsghdr	C.struct_nlmsghdr
4613	syscall	NlMsgerr	C.struct_nlmsgerr
4614	syscall	RtGenmsg	C.struct_rtgenmsg
4615	syscall	NlAttr	C.struct_nlattr
4616	syscall	RtAttr	C.struct_rtattr
4617	syscall	IfInfomsg	C.struct_ifinfomsg
4618	syscall	IfAddrmsg	C.struct_ifaddrmsg
4619	syscall	RtMsg	C.struct_rtmsg
4620	syscall	RtNexthop	C.struct_rtnexthop
4621	syscall	SockFilter	C.struct_sock_filter
4622	syscall	SockFprog	C.struct_sock_fprog
4623	syscall	InotifyEvent	C.struct_inotify_event
4624	syscall	PtraceRegs	C.PtraceRegs
4625	syscall	FdSet	C.fd_set
4626	syscall	Sysinfo_t	C.struct_sysinfo
4627	syscall	Utsname	C.struct_utsname
4628	syscall	Ustat_t	C.struct_ustat
4629	syscall	EpollEvent	C.struct_my_epoll_event
4630	syscall	Termios	C.struct_termios
4631	syscall	Timespec	C.struct_timespec
4632	syscall	Timeval	C.struct_timeval
4633	syscall	Rusage	C.struct_rusage
4634	syscall	Rlimit	C.struct_rlimit
4635	syscall	Stat_t	C.struct_stat
4636	syscall	Statfs_t	C.struct_statfs
4637	syscall	Flock_t	C.struct_flock
4638	syscall	Dirent	C.struct_dirent
4639	syscall	Fsid	C.fsid_t
4640	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4641	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4642	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4643	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4644	syscall	RawSockaddr	C.struct_sockaddr
4645	syscall	RawSockaddrAny	C.struct_sockaddr_any
4646	syscall	Linger	C.struct_linger
4647	syscall	Iovec	C.struct_iovec
4648	syscall	IPMreq	C.struct_ip_mreq
4649	syscall	IPv6Mreq	C.struct_ipv6_mreq
4650	syscall	Msghdr	C.struct_msghdr
4651	syscall	Cmsghdr	C.struct_cmsghdr
4652	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4653	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4654	syscall	ICMPv6Filter	C.struct_icmp6_filter
4655	syscall	Kevent_t	C.struct_kevent
4656	syscall	FdSet	C.fd_set
4657	syscall	IfMsghdr	C.struct_if_msghdr
4658	syscall	IfData	C.struct_if_data
4659	syscall	IfaMsghdr	C.struct_ifa_msghdr
4660	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
4661	syscall	RtMsghdr	C.struct_rt_msghdr
4662	syscall	RtMetrics	C.struct_rt_metrics
4663	syscall	Mclpool	C.struct_mclpool
4664	syscall	BpfVersion	C.struct_bpf_version
4665	syscall	BpfStat	C.struct_bpf_stat
4666	syscall	BpfProgram	C.struct_bpf_program
4667	syscall	BpfInsn	C.struct_bpf_insn
4668	syscall	BpfHdr	C.struct_bpf_hdr
4669	syscall	BpfTimeval	C.struct_bpf_timeval
4670	syscall	Termios	C.struct_termios
4671	syscall	Sysctlnode	C.struct_sysctlnode
4672	syscall	Timespec	C.struct_timespec
4673	syscall	Timeval	C.struct_timeval
4674	syscall	Rusage	C.struct_rusage
4675	syscall	Rlimit	C.struct_rlimit
4676	syscall	Stat_t	C.struct_stat
4677	syscall	Statfs_t	C.struct_statfs
4678	syscall	Flock_t	C.struct_flock
4679	syscall	Dirent	C.struct_dirent
4680	syscall	Fsid	C.fsid_t
4681	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4682	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4683	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4684	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4685	syscall	RawSockaddr	C.struct_sockaddr
4686	syscall	RawSockaddrAny	C.struct_sockaddr_any
4687	syscall	Linger	C.struct_linger
4688	syscall	Iovec	C.struct_iovec
4689	syscall	IPMreq	C.struct_ip_mreq
4690	syscall	IPv6Mreq	C.struct_ipv6_mreq
4692	syscall	Cmsghdr	C.struct_cmsghdr
4693	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4694	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4695	syscall	ICMPv6Filter	C.struct_icmp6_filter
4696	syscall	Kevent_t	C.struct_kevent
4697	syscall	FdSet	C.fd_set
4698	syscall	IfMsghdr	C.struct_if_msghdr
4699	syscall	IfData	C.struct_if_data
4700	syscall	IfaMsghdr	C.struct_ifa_msghdr
4701	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
4702	syscall	RtMsghdr	C.struct_rt_msghdr
4703	syscall	RtMetrics	C.struct_rt_metrics
4704	syscall	Mclpool	C.struct_mclpool
4705	syscall	BpfVersion	C.struct_bpf_version
4706	syscall	BpfStat	C.struct_bpf_stat
4707	syscall	BpfProgram	C.struct_bpf_program
4708	syscall	BpfInsn	C.struct_bpf_insn
4709	syscall	BpfHdr	C.struct_bpf_hdr
4710	syscall	BpfTimeval	C.struct_bpf_timeval
4711	syscall	Termios	C.struct_termios
4712	syscall	Timespec	C.struct_timespec
4713	syscall	Timeval	C.struct_timeval
4714	syscall	Timeval32	C.struct_timeval32
4715	syscall	Rusage	C.struct_rusage
4716	syscall	Rlimit	C.struct_rlimit
4717	syscall	Stat_t	C.struct_stat
4718	syscall	Flock_t	C.struct_flock
4719	syscall	Dirent	C.struct_dirent
4720	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4721	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4722	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4723	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4724	syscall	RawSockaddr	C.struct_sockaddr
4725	syscall	RawSockaddrAny	C.struct_sockaddr_any
4726	syscall	Linger	C.struct_linger
4727	syscall	Iovec	C.struct_iovec
4728	syscall	IPMreq	C.struct_ip_mreq
4729	syscall	IPv6Mreq	C.struct_ipv6_mreq
4730	syscall	Msghdr	C.struct_msghdr
4731	syscall	Cmsghdr	C.struct_cmsghdr
4732	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4733	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4734	syscall	ICMPv6Filter	C.struct_icmp6_filter
4735	syscall	FdSet	C.fd_set
4736	syscall	IfMsghdr	C.struct_if_msghdr
4737	syscall	IfData	C.struct_if_data
4738	syscall	IfaMsghdr	C.struct_ifa_msghdr
4739	syscall	RtMsghdr	C.struct_rt_msghdr
4740	syscall	RtMetrics	C.struct_rt_metrics
4741	syscall	BpfVersion	C.struct_bpf_version
4742	syscall	BpfStat	C.struct_bpf_stat
4743	syscall	BpfProgram	C.struct_bpf_program
4744	syscall	BpfInsn	C.struct_bpf_insn
4745	syscall	BpfTimeval	C.struct_bpf_timeval
4746	syscall	BpfHdr	C.struct_bpf_hdr
4747	syscall	Termios	C.struct_termios
4748	syscall	Pointer	*struct{}
4749	syscall	Timeval	struct
4750	syscall	SecurityAttributes	struct
4751	syscall	Overlapped	struct
4752	syscall	FileNotifyInformation	struct
4753	syscall	Filetime	struct
4754	syscall	Win32finddata	struct
4755	syscall	ByHandleFileInformation	struct
4756	syscall	Win32FileAttributeData	struct
4757	syscall	StartupInfo	struct
4758	syscall	ProcessInformation	struct
4759	syscall	ProcessEntry32	struct
4760	syscall	Systemtime	struct
4761	syscall	Timezoneinformation	struct
4762	syscall	WSABuf	struct
4763	syscall	Hostent	struct
4764	syscall	Protoent	struct
4765	syscall	DNSSRVData	struct
4766	syscall	DNSPTRData	struct
4767	syscall	DNSMXData	struct
4768	syscall	DNSTXTData	struct
4769	syscall	DNSRecord	struct
4770	syscall	TransmitFileBuffers	struct
4771	syscall	SockaddrGen	[]byte
4772	syscall	InterfaceInfo	struct
4773	syscall	IpAddressString	struct
4774	syscall	IpMaskString	syscall.IpAddressString
4775	syscall	IpAddrString	struct
4776	syscall	IpAdapterInfo	struct
4777	syscall	MibIfRow	struct
4778	syscall	CertInfo	struct
4779	syscall	CertContext	struct
4780	syscall	CertChainContext	struct
4781	syscall	CertTrustListInfo	struct
4782	syscall	CertSimpleChain	struct
4783	syscall	CertChainElement	struct
4784	syscall	CertRevocationCrlInfo	struct
4785	syscall	CertRevocationInfo	struct
4786	syscall	CertTrustStatus	struct
4787	syscall	CertUsageMatch	struct
4788	syscall	CertEnhKeyUsage	struct
4789	syscall	CertChainPara	struct
4790	syscall	CertChainPolicyPara	struct
4791	syscall	SSLExtraCertChainPolicyPara	struct
4792	syscall	CertChainPolicyStatus	struct
4793	syscall	AddrinfoW	struct
4794	syscall	GUID	struct
4795	syscall	WSAProtocolInfo	struct
4796	syscall	WSAProtocolChain	struct
4797	syscall	TCPKeepalive	struct
4798	syscall	WSAData	struct
4799	syscall	Servent	struct
4800	syscall	WSAData	struct
4801	syscall	Servent	struct
4802	syscall	WSAData	struct
4803	syscall	Servent	struct
4804	syscall	Timespec	struct
4805	syscall	Timeval	struct
4806	syscall	Timeval32	struct
4807	syscall	Timezone	struct
4808	syscall	Rusage	struct
4809	syscall	Rlimit	struct
4810	syscall	Flock_t	struct
4811	syscall	Stat_t	struct
4812	syscall	Statfs_t	struct
4813	syscall	Fsid64_t	struct
4814	syscall	StTimespec_t	struct
4815	syscall	Dirent	struct
4816	syscall	RawSockaddrInet4	struct
4817	syscall	RawSockaddrInet6	struct
4818	syscall	RawSockaddrUnix	struct
4819	syscall	RawSockaddrDatalink	struct
4820	syscall	RawSockaddr	struct
4821	syscall	RawSockaddrAny	struct
4822	syscall	Cmsghdr	struct
4823	syscall	ICMPv6Filter	struct
4824	syscall	Iovec	struct
4825	syscall	IPMreq	struct
4826	syscall	IPv6Mreq	struct
4827	syscall	Linger	struct
4828	syscall	Msghdr	struct
4829	syscall	IfMsgHdr	struct
4830	syscall	Utsname	struct
4831	syscall	Timespec	struct
4832	syscall	Timeval	struct
4833	syscall	Timeval32	[]byte
4834	syscall	Rusage	struct
4835	syscall	Rlimit	struct
4836	syscall	Stat_t	struct
4837	syscall	Statfs_t	struct
4838	syscall	Flock_t	struct
4839	syscall	Fstore_t	struct
4840	syscall	Radvisory_t	struct
4841	syscall	Fbootstraptransfer_t	struct
4842	syscall	Log2phys_t	struct
4843	syscall	Fsid	struct
4844	syscall	Dirent	struct
4845	syscall	RawSockaddrInet4	struct
4846	syscall	RawSockaddrInet6	struct
4847	syscall	RawSockaddrUnix	struct
4848	syscall	RawSockaddrDatalink	struct
4849	syscall	RawSockaddr	struct
4850	syscall	RawSockaddrAny	struct
4851	syscall	Linger	struct
4852	syscall	Iovec	struct
4853	syscall	IPMreq	struct
4854	syscall	IPv6Mreq	struct
4855	syscall	Msghdr	struct
4856	syscall	Cmsghdr	struct
4857	syscall	Inet4Pktinfo	struct
4858	syscall	Inet6Pktinfo	struct
4859	syscall	IPv6MTUInfo	struct
4860	syscall	ICMPv6Filter	struct
4861	syscall	Kevent_t	struct
4862	syscall	FdSet	struct
4863	syscall	IfMsghdr	struct
4864	syscall	IfData	struct
4865	syscall	IfaMsghdr	struct
4866	syscall	IfmaMsghdr	struct
4867	syscall	IfmaMsghdr2	struct
4868	syscall	RtMsghdr	struct
4869	syscall	RtMetrics	struct
4870	syscall	BpfVersion	struct
4871	syscall	BpfStat	struct
4872	syscall	BpfProgram	struct
4873	syscall	BpfInsn	struct
4874	syscall	BpfHdr	struct
4875	syscall	Termios	struct
4876	syscall	Timespec	struct
4877	syscall	Timeval	struct
4878	syscall	Timeval32	struct
4879	syscall	Rusage	struct
4880	syscall	Rlimit	struct
4881	syscall	Stat_t	struct
4882	syscall	Statfs_t	struct
4883	syscall	Flock_t	struct
4884	syscall	Fstore_t	struct
4885	syscall	Radvisory_t	struct
4886	syscall	Fbootstraptransfer_t	struct
4887	syscall	Log2phys_t	struct
4888	syscall	Fsid	struct
4889	syscall	Dirent	struct
4890	syscall	RawSockaddrInet4	struct
4891	syscall	RawSockaddrInet6	struct
4892	syscall	RawSockaddrUnix	struct
4893	syscall	RawSockaddrDatalink	struct
4894	syscall	RawSockaddr	struct
4895	syscall	RawSockaddrAny	struct
4896	syscall	Linger	struct
4897	syscall	Iovec	struct
4898	syscall	IPMreq	struct
4899	syscall	IPv6Mreq	struct
4900	syscall	Msghdr	struct
4901	syscall	Cmsghdr	struct
4902	syscall	Inet4Pktinfo	struct
4903	syscall	Inet6Pktinfo	struct
4904	syscall	IPv6MTUInfo	struct
4905	syscall	ICMPv6Filter	struct
4906	syscall	Kevent_t	struct
4907	syscall	FdSet	struct
4908	syscall	IfMsghdr	struct
4909	syscall	IfData	struct
4910	syscall	IfaMsghdr	struct
4911	syscall	IfmaMsghdr	struct
4912	syscall	IfmaMsghdr2	struct
4913	syscall	RtMsghdr	struct
4914	syscall	RtMetrics	struct
4915	syscall	BpfVersion	struct
4916	syscall	BpfStat	struct
4917	syscall	BpfProgram	struct
4918	syscall	BpfInsn	struct
4919	syscall	BpfHdr	struct
4920	syscall	Termios	struct
4921	syscall	Timespec	struct
4922	syscall	Timeval	struct
4923	syscall	Timeval32	[]byte
4924	syscall	Rusage	struct
4925	syscall	Rlimit	struct
4926	syscall	Stat_t	struct
4927	syscall	Statfs_t	struct
4928	syscall	Flock_t	struct
4929	syscall	Fstore_t	struct
4930	syscall	Radvisory_t	struct
4931	syscall	Fbootstraptransfer_t	struct
4932	syscall	Log2phys_t	struct
4933	syscall	Fsid	struct
4934	syscall	Dirent	struct
4935	syscall	RawSockaddrInet4	struct
4936	syscall	RawSockaddrInet6	struct
4937	syscall	RawSockaddrUnix	struct
4938	syscall	RawSockaddrDatalink	struct
4939	syscall	RawSockaddr	struct
4940	syscall	RawSockaddrAny	struct
4941	syscall	Linger	struct
4942	syscall	Iovec	struct
4943	syscall	IPMreq	struct
4944	syscall	IPv6Mreq	struct
4945	syscall	Msghdr	struct
4946	syscall	Cmsghdr	struct
4947	syscall	Inet4Pktinfo	struct
4948	syscall	Inet6Pktinfo	struct
4949	syscall	IPv6MTUInfo	struct
4950	syscall	ICMPv6Filter	struct
4951	syscall	Kevent_t	struct
4952	syscall	FdSet	struct
4953	syscall	IfMsghdr	struct
4954	syscall	IfData	struct
4955	syscall	IfaMsghdr	struct
4956	syscall	IfmaMsghdr	struct
4957	syscall	IfmaMsghdr2	struct
4958	syscall	RtMsghdr	struct
4959	syscall	RtMetrics	struct
4960	syscall	BpfVersion	struct
4961	syscall	BpfStat	struct
4962	syscall	BpfProgram	struct
4963	syscall	BpfInsn	struct
4964	syscall	BpfHdr	struct
4965	syscall	Termios	struct
4966	syscall	Timespec	struct
4967	syscall	Timeval	struct
4968	syscall	Timeval32	struct
4969	syscall	Rusage	struct
4970	syscall	Rlimit	struct
4971	syscall	Stat_t	struct
4972	syscall	Statfs_t	struct
4973	syscall	Flock_t	struct
4974	syscall	Fstore_t	struct
4975	syscall	Radvisory_t	struct
4976	syscall	Fbootstraptransfer_t	struct
4977	syscall	Log2phys_t	struct
4978	syscall	Fsid	struct
4979	syscall	Dirent	struct
4980	syscall	RawSockaddrInet4	struct
4981	syscall	RawSockaddrInet6	struct
4982	syscall	RawSockaddrUnix	struct
4983	syscall	RawSockaddrDatalink	struct
4984	syscall	RawSockaddr	struct
4985	syscall	RawSockaddrAny	struct
4986	syscall	Linger	struct
4987	syscall	Iovec	struct
4988	syscall	IPMreq	struct
4989	syscall	IPv6Mreq	struct
4990	syscall	Msghdr	struct
4991	syscall	Cmsghdr	struct
4992	syscall	Inet4Pktinfo	struct
4993	syscall	Inet6Pktinfo	struct
4994	syscall	IPv6MTUInfo	struct
4995	syscall	ICMPv6Filter	struct
4996	syscall	Kevent_t	struct
4997	syscall	FdSet	struct
4998	syscall	IfMsghdr	struct
4999	syscall	IfData	struct
5000	syscall	IfaMsghdr	struct
5001	syscall	IfmaMsghdr	struct
5002	syscall	IfmaMsghdr2	struct
5003	syscall	RtMsghdr	struct
5004	syscall	RtMetrics	struct
5005	syscall	BpfVersion	struct
5006	syscall	BpfStat	struct
5007	syscall	BpfProgram	struct
5008	syscall	BpfInsn	struct
5009	syscall	BpfHdr	struct
5010	syscall	Termios	struct
5011	syscall	Timespec	struct
5012	syscall	Timeval	struct
5013	syscall	Rusage	struct
5014	syscall	Rlimit	struct
5015	syscall	Stat_t	struct
5016	syscall	Statfs_t	struct
5017	syscall	Flock_t	struct
5018	syscall	Dirent	struct
5019	syscall	Fsid	struct
5020	syscall	RawSockaddrInet4	struct
5021	syscall	RawSockaddrInet6	struct
5022	syscall	RawSockaddrUnix	struct
5023	syscall	RawSockaddrDatalink	struct
5024	syscall	RawSockaddr	struct
5025	syscall	RawSockaddrAny	struct
5026	syscall	Linger	struct
5027	syscall	Iovec	struct
5028	syscall	IPMreq	struct
5029	syscall	IPv6Mreq	struct
5030	syscall	Msghdr	struct
5031	syscall	Cmsghdr	struct
5032	syscall	Inet6Pktinfo	struct
5033	syscall	IPv6MTUInfo	struct
5034	syscall	ICMPv6Filter	struct
5035	syscall	Kevent_t	struct
5036	syscall	FdSet	struct
5037	syscall	IfMsghdr	struct
5038	syscall	IfData	struct
5039	syscall	IfaMsghdr	struct
5040	syscall	IfmaMsghdr	struct
5041	syscall	IfAnnounceMsghdr	struct
5042	syscall	RtMsghdr	struct
5043	syscall	RtMetrics	struct
5044	syscall	BpfVersion	struct
5045	syscall	BpfStat	struct
5046	syscall	BpfProgram	struct
5047	syscall	BpfInsn	struct
5048	syscall	BpfHdr	struct
5049	syscall	Termios	struct
5050	syscall	Timespec	struct
5051	syscall	Timeval	struct
5052	syscall	Rusage	struct
5053	syscall	Rlimit	struct
5054	syscall	Stat_t	struct
5055	syscall	Statfs_t	struct
5056	syscall	Flock_t	struct
5057	syscall	Dirent	struct
5058	syscall	Fsid	struct
5059	syscall	RawSockaddrInet4	struct
5060	syscall	RawSockaddrInet6	struct
5061	syscall	RawSockaddrUnix	struct
5062	syscall	RawSockaddrDatalink	struct
5063	syscall	RawSockaddr	struct
5064	syscall	RawSockaddrAny	struct
5065	syscall	Linger	struct
5066	syscall	Iovec	struct
5067	syscall	IPMreq	struct
5068	syscall	IPMreqn	struct
5069	syscall	IPv6Mreq	struct
5070	syscall	Msghdr	struct
5071	syscall	Cmsghdr	struct
5072	syscall	Inet6Pktinfo	struct
5073	syscall	IPv6MTUInfo	struct
5074	syscall	ICMPv6Filter	struct
5075	syscall	Kevent_t	struct
5076	syscall	FdSet	struct
5077	syscall	IfMsghdr	struct
5078	syscall	IfData	struct
5079	syscall	IfaMsghdr	struct
5080	syscall	IfmaMsghdr	struct
5081	syscall	IfAnnounceMsghdr	struct
5082	syscall	RtMsghdr	struct
5083	syscall	RtMetrics	struct
5084	syscall	BpfVersion	struct
5085	syscall	BpfStat	struct
5086	syscall	BpfZbuf	struct
5087	syscall	BpfProgram	struct
5088	syscall	BpfInsn	struct
5089	syscall	BpfHdr	struct
5090	syscall	BpfZbufHeader	struct
5091	syscall	Termios	struct
5092	syscall	Timespec	struct
5093	syscall	Timeval	struct
5094	syscall	Rusage	struct
5095	syscall	Rlimit	struct
5096	syscall	Stat_t	struct
5097	syscall	Statfs_t	struct
5098	syscall	Flock_t	struct
5099	syscall	Dirent	struct
5100	syscall	Fsid	struct
5101	syscall	RawSockaddrInet4	struct
5102	syscall	RawSockaddrInet6	struct
5103	syscall	RawSockaddrUnix	struct
5104	syscall	RawSockaddrDatalink	struct
5105	syscall	RawSockaddr	struct
5106	syscall	RawSockaddrAny	struct
5107	syscall	Linger	struct
5108	syscall	Iovec	struct
5109	syscall	IPMreq	struct
5110	syscall	IPMreqn	struct
5111	syscall	IPv6Mreq	struct
5112	syscall	Msghdr	struct
5113	syscall	Cmsghdr	struct
5114	syscall	Inet6Pktinfo	struct
5115	syscall	IPv6MTUInfo	struct
5116	syscall	ICMPv6Filter	struct
5117	syscall	Kevent_t	struct
5118	syscall	FdSet	struct
5119	syscall	IfMsghdr	struct
5120	syscall	IfData	struct
5121	syscall	IfaMsghdr	struct
5122	syscall	IfmaMsghdr	struct
5123	syscall	IfAnnounceMsghdr	struct
5124	syscall	RtMsghdr	struct
5125	syscall	RtMetrics	struct
5126	syscall	BpfVersion	struct
5127	syscall	BpfStat	struct
5128	syscall	BpfZbuf	struct
5129	syscall	BpfProgram	struct
5130	syscall	BpfInsn	struct
5131	syscall	BpfHdr	struct
5132	syscall	BpfZbufHeader	struct
5133	syscall	Termios	struct
5134	syscall	Timespec	struct
5135	syscall	Timeval	struct
5136	syscall	Rusage	struct
5137	syscall	Rlimit	struct
5138	syscall	Stat_t	struct
5139	syscall	Statfs_t	struct
5140	syscall	Flock_t	struct
5141	syscall	Dirent	struct
5142	syscall	Fsid	struct
5143	syscall	RawSockaddrInet4	struct
5144	syscall	RawSockaddrInet6	struct
5145	syscall	RawSockaddrUnix	struct
5146	syscall	RawSockaddrDatalink	struct
5147	syscall	RawSockaddr	struct
5148	syscall	RawSockaddrAny	struct
5149	syscall	Linger	struct
5150	syscall	Iovec	struct
5151	syscall	IPMreq	struct
5152	syscall	IPMreqn	struct
5153	syscall	IPv6Mreq	struct
5154	syscall	Msghdr	struct
5155	syscall	Cmsghdr	struct
5156	syscall	Inet6Pktinfo	struct
5157	syscall	IPv6MTUInfo	struct
5158	syscall	ICMPv6Filter	struct
5159	syscall	Kevent_t	struct
5160	syscall	FdSet	struct
5161	syscall	IfMsghdr	struct
5162	syscall	IfData	struct
5163	syscall	IfaMsghdr	struct
5164	syscall	IfmaMsghdr	struct
5165	syscall	IfAnnounceMsghdr	struct
5166	syscall	RtMsghdr	struct
5167	syscall	RtMetrics	struct
5168	syscall	BpfVersion	struct
5169	syscall	BpfStat	struct
5170	syscall	BpfZbuf	struct
5171	syscall	BpfProgram	struct
5172	syscall	BpfInsn	struct
5173	syscall	BpfHdr	struct
5174	syscall	BpfZbufHeader	struct
5175	syscall	Termios	struct
5176	syscall	Timespec	struct
5177	syscall	Timeval	struct
5178	syscall	Timex	struct
5179	syscall	Time_t	int32
5180	syscall	Tms	struct
5181	syscall	Utimbuf	struct
5182	syscall	Rusage	struct
5183	syscall	Rlimit	struct
5184	syscall	Stat_t	struct
5185	syscall	Statfs_t	struct
5186	syscall	Dirent	struct
5187	syscall	Fsid	struct
5188	syscall	Flock_t	struct
5189	syscall	RawSockaddrInet4	struct
5190	syscall	RawSockaddrInet6	struct
5191	syscall	RawSockaddrUnix	struct
5192	syscall	RawSockaddrLinklayer	struct
5193	syscall	RawSockaddrNetlink	struct
5194	syscall	RawSockaddr	struct
5195	syscall	RawSockaddrAny	struct
5196	syscall	Linger	struct
5197	syscall	Iovec	struct
5198	syscall	IPMreq	struct
5199	syscall	IPMreqn	struct
5200	syscall	IPv6Mreq	struct
5201	syscall	Msghdr	struct
5202	syscall	Cmsghdr	struct
5203	syscall	Inet4Pktinfo	struct
5204	syscall	Inet6Pktinfo	struct
5205	syscall	IPv6MTUInfo	struct
5206	syscall	ICMPv6Filter	struct
5207	syscall	Ucred	struct
5208	syscall	TCPInfo	struct
5209	syscall	NlMsghdr	struct
5210	syscall	NlMsgerr	struct
5211	syscall	RtGenmsg	struct
5212	syscall	NlAttr	struct
5213	syscall	RtAttr	struct
5214	syscall	IfInfomsg	struct
5215	syscall	IfAddrmsg	struct
5216	syscall	RtMsg	struct
5217	syscall	RtNexthop	struct
5218	syscall	SockFilter	struct
5219	syscall	SockFprog	struct
5220	syscall	InotifyEvent	struct
5221	syscall	PtraceRegs	struct
5222	syscall	FdSet	struct
5223	syscall	Sysinfo_t	struct
5224	syscall	Utsname	struct
5225	syscall	Ustat_t	struct
5226	syscall	EpollEvent	struct
5227	syscall	Termios	struct
5228	syscall	Timespec	struct
5229	syscall	Timeval	struct
5230	syscall	Timex	struct
5231	syscall	Time_t	int64
5232	syscall	Tms	struct
5233	syscall	Utimbuf	struct
5234	syscall	Rusage	struct
5235	syscall	Rlimit	struct
5236	syscall	Stat_t	struct
5237	syscall	Statfs_t	struct
5238	syscall	Dirent	struct
5239	syscall	Fsid	struct
5240	syscall	Flock_t	struct
5241	syscall	RawSockaddrInet4	struct
5242	syscall	RawSockaddrInet6	struct
5243	syscall	RawSockaddrUnix	struct
5244	syscall	RawSockaddrLinklayer	struct
5245	syscall	RawSockaddrNetlink	struct
5246	syscall	RawSockaddr	struct
5247	syscall	RawSockaddrAny	struct
5248	syscall	Linger	struct
5249	syscall	Iovec	struct
5250	syscall	IPMreq	struct
5251	syscall	IPMreqn	struct
5252	syscall	IPv6Mreq	struct
5253	syscall	Msghdr	struct
5254	syscall	Cmsghdr	struct
5255	syscall	Inet4Pktinfo	struct
5256	syscall	Inet6Pktinfo	struct
5257	syscall	IPv6MTUInfo	struct
5258	syscall	ICMPv6Filter	struct
5259	syscall	Ucred	struct
5260	syscall	TCPInfo	struct
5261	syscall	NlMsghdr	struct
5262	syscall	NlMsgerr	struct
5263	syscall	RtGenmsg	struct
5264	syscall	NlAttr	struct
5265	syscall	RtAttr	struct
5266	syscall	IfInfomsg	struct
5267	syscall	IfAddrmsg	struct
5268	syscall	RtMsg	struct
5269	syscall	RtNexthop	struct
5270	syscall	SockFilter	struct
5271	syscall	SockFprog	struct
5272	syscall	InotifyEvent	struct
5273	syscall	PtraceRegs	struct
5274	syscall	FdSet	struct
5275	syscall	Sysinfo_t	struct
5276	syscall	Utsname	struct
5277	syscall	Ustat_t	struct
5278	syscall	EpollEvent	struct
5279	syscall	Termios	struct
5280	syscall	Timespec	struct
5281	syscall	Timeval	struct
5282	syscall	Timex	struct
5283	syscall	Time_t	int32
5284	syscall	Tms	struct
5285	syscall	Utimbuf	struct
5286	syscall	Rusage	struct
5287	syscall	Rlimit	struct
5288	syscall	Stat_t	struct
5289	syscall	Statfs_t	struct
5290	syscall	Dirent	struct
5291	syscall	Fsid	struct
5292	syscall	Flock_t	struct
5293	syscall	RawSockaddrInet4	struct
5294	syscall	RawSockaddrInet6	struct
5295	syscall	RawSockaddrUnix	struct
5296	syscall	RawSockaddrLinklayer	struct
5297	syscall	RawSockaddrNetlink	struct
5298	syscall	RawSockaddr	struct
5299	syscall	RawSockaddrAny	struct
5300	syscall	Linger	struct
5301	syscall	Iovec	struct
5302	syscall	IPMreq	struct
5303	syscall	IPMreqn	struct
5304	syscall	IPv6Mreq	struct
5305	syscall	Msghdr	struct
5306	syscall	Cmsghdr	struct
5307	syscall	Inet4Pktinfo	struct
5308	syscall	Inet6Pktinfo	struct
5309	syscall	IPv6MTUInfo	struct
5310	syscall	ICMPv6Filter	struct
5311	syscall	Ucred	struct
5312	syscall	TCPInfo	struct
5313	syscall	NlMsghdr	struct
5314	syscall	NlMsgerr	struct
5315	syscall	RtGenmsg	struct
5316	syscall	NlAttr	struct
5317	syscall	RtAttr	struct
5318	syscall	IfInfomsg	struct
5319	syscall	IfAddrmsg	struct
5320	syscall	RtMsg	struct
5321	syscall	RtNexthop	struct
5322	syscall	SockFilter	struct
5323	syscall	SockFprog	struct
5324	syscall	InotifyEvent	struct
5325	syscall	PtraceRegs	struct
5326	syscall	FdSet	struct
5327	syscall	Sysinfo_t	struct
5328	syscall	Utsname	struct
5329	syscall	Ustat_t	struct
5330	syscall	EpollEvent	struct
5331	syscall	Termios	struct
5332	syscall	Timespec	struct
5333	syscall	Timeval	struct
5334	syscall	Timex	struct
5335	syscall	Time_t	int64
5336	syscall	Tms	struct
5337	syscall	Utimbuf	struct
5338	syscall	Rusage	struct
5339	syscall	Rlimit	struct
5340	syscall	Stat_t	struct
5341	syscall	Statfs_t	struct
5342	syscall	Dirent	struct
5343	syscall	Fsid	struct
5344	syscall	Flock_t	struct
5345	syscall	RawSockaddrInet4	struct
5346	syscall	RawSockaddrInet6	struct
5347	syscall	RawSockaddrUnix	struct
5348	syscall	RawSockaddrLinklayer	struct
5349	syscall	RawSockaddrNetlink	struct
5350	syscall	RawSockaddr	struct
5351	syscall	RawSockaddrAny	struct
5352	syscall	Linger	struct
5353	syscall	Iovec	struct
5354	syscall	IPMreq	struct
5355	syscall	IPMreqn	struct
5356	syscall	IPv6Mreq	struct
5357	syscall	Msghdr	struct
5358	syscall	Cmsghdr	struct
5359	syscall	Inet4Pktinfo	struct
5360	syscall	Inet6Pktinfo	struct
5361	syscall	IPv6MTUInfo	struct
5362	syscall	ICMPv6Filter	struct
5363	syscall	Ucred	struct
5364	syscall	TCPInfo	struct
5365	syscall	NlMsghdr	struct
5366	syscall	NlMsgerr	struct
5367	syscall	RtGenmsg	struct
5368	syscall	NlAttr	struct
5369	syscall	RtAttr	struct
5370	syscall	IfInfomsg	struct
5371	syscall	IfAddrmsg	struct
5372	syscall	RtMsg	struct
5373	syscall	RtNexthop	struct
5374	syscall	SockFilter	struct
5375	syscall	SockFprog	struct
5376	syscall	InotifyEvent	struct
5377	syscall	PtraceRegs	struct
5378	syscall	FdSet	struct
5379	syscall	Sysinfo_t	struct
5380	syscall	Utsname	struct
5381	syscall	Ustat_t	struct
5382	syscall	EpollEvent	struct
5383	syscall	Termios	struct
5384	syscall	Timespec	struct
5385	syscall	Timeval	struct
5386	syscall	Timex	struct
5387	syscall	Time_t	int32
5388	syscall	Tms	struct
5389	syscall	Utimbuf	struct
5390	syscall	Rusage	struct
5391	syscall	Rlimit	struct
5392	syscall	Stat_t	struct
5393	syscall	Statfs_t	struct
5394	syscall	Dirent	struct
5395	syscall	Fsid	struct
5396	syscall	Flock_t	struct
5397	syscall	RawSockaddrInet4	struct
5398	syscall	RawSockaddrInet6	struct
5399	syscall	RawSockaddrUnix	struct
5400	syscall	RawSockaddrLinklayer	struct
5401	syscall	RawSockaddrNetlink	struct
5402	syscall	RawSockaddr	struct
5403	syscall	RawSockaddrAny	struct
5404	syscall	Linger	struct
5405	syscall	Iovec	struct
5406	syscall	IPMreq	struct
5407	syscall	IPMreqn	struct
5408	syscall	IPv6Mreq	struct
5409	syscall	Msghdr	struct
5410	syscall	Cmsghdr	struct
5411	syscall	Inet4Pktinfo	struct
5412	syscall	Inet6Pktinfo	struct
5413	syscall	IPv6MTUInfo	struct
5414	syscall	ICMPv6Filter	struct
5415	syscall	Ucred	struct
5416	syscall	TCPInfo	struct
5417	syscall	NlMsghdr	struct
5418	syscall	NlMsgerr	struct
5419	syscall	RtGenmsg	struct
5420	syscall	NlAttr	struct
5421	syscall	RtAttr	struct
5422	syscall	IfInfomsg	struct
5423	syscall	IfAddrmsg	struct
5424	syscall	RtMsg	struct
5425	syscall	RtNexthop	struct
5426	syscall	SockFilter	struct
5427	syscall	SockFprog	struct
5428	syscall	InotifyEvent	struct
5429	syscall	PtraceRegs	struct
5430	syscall	FdSet	struct
5431	syscall	Sysinfo_t	struct
5432	syscall	Utsname	struct
5433	syscall	Ustat_t	struct
5434	syscall	EpollEvent	struct
5435	syscall	Termios	struct
5436	syscall	Timespec	struct
5437	syscall	Timeval	struct
5438	syscall	Timex	struct
5439	syscall	Time_t	int64
5440	syscall	Tms	struct
5441	syscall	Utimbuf	struct
5442	syscall	Rusage	struct
5443	syscall	Rlimit	struct
5444	syscall	Stat_t	struct
5445	syscall	Statfs_t	struct
5446	syscall	Dirent	struct
5447	syscall	Fsid	struct
5448	syscall	Flock_t	struct
5449	syscall	RawSockaddrInet4	struct
5450	syscall	RawSockaddrInet6	struct
5451	syscall	RawSockaddrUnix	struct
5452	syscall	RawSockaddrLinklayer	struct
5453	syscall	RawSockaddrNetlink	struct
5454	syscall	RawSockaddr	struct
5455	syscall	RawSockaddrAny	struct
5456	syscall	Linger	struct
5457	syscall	Iovec	struct
5458	syscall	IPMreq	struct
5459	syscall	IPMreqn	struct
5460	syscall	IPv6Mreq	struct
5461	syscall	Msghdr	struct
5462	syscall	Cmsghdr	struct
5463	syscall	Inet4Pktinfo	struct
5464	syscall	Inet6Pktinfo	struct
5465	syscall	IPv6MTUInfo	struct
5466	syscall	ICMPv6Filter	struct
5467	syscall	Ucred	struct
5468	syscall	TCPInfo	struct
5469	syscall	NlMsghdr	struct
5470	syscall	NlMsgerr	struct
5471	syscall	RtGenmsg	struct
5472	syscall	NlAttr	struct
5473	syscall	RtAttr	struct
5474	syscall	IfInfomsg	struct
5475	syscall	IfAddrmsg	struct
5476	syscall	RtMsg	struct
5477	syscall	RtNexthop	struct
5478	syscall	SockFilter	struct
5479	syscall	SockFprog	struct
5480	syscall	InotifyEvent	struct
5481	syscall	PtraceRegs	struct
5482	syscall	FdSet	struct
5483	syscall	Sysinfo_t	struct
5484	syscall	Utsname	struct
5485	syscall	Ustat_t	struct
5486	syscall	EpollEvent	struct
5487	syscall	Termios	struct
5488	syscall	Timespec	struct
5489	syscall	Timeval	struct
5490	syscall	Timex	struct
5491	syscall	Time_t	int64
5492	syscall	Tms	struct
5493	syscall	Utimbuf	struct
5494	syscall	Rusage	struct
5495	syscall	Rlimit	struct
5496	syscall	Stat_t	struct
5497	syscall	Statfs_t	struct
5498	syscall	Dirent	struct
5499	syscall	Fsid	struct
5500	syscall	Flock_t	struct
5501	syscall	RawSockaddrInet4	struct
5502	syscall	RawSockaddrInet6	struct
5503	syscall	RawSockaddrUnix	struct
5504	syscall	RawSockaddrLinklayer	struct
5505	syscall	RawSockaddrNetlink	struct
5506	syscall	RawSockaddr	struct
5507	syscall	RawSockaddrAny	struct
5508	syscall	Linger	struct
5509	syscall	Iovec	struct
5510	syscall	IPMreq	struct
5511	syscall	IPMreqn	struct
5512	syscall	IPv6Mreq	struct
5513	syscall	Msghdr	struct
5514	syscall	Cmsghdr	struct
5515	syscall	Inet4Pktinfo	struct
5516	syscall	Inet6Pktinfo	struct
5517	syscall	IPv6MTUInfo	struct
5518	syscall	ICMPv6Filter	struct
5519	syscall	Ucred	struct
5520	syscall	TCPInfo	struct
5521	syscall	NlMsghdr	struct
5522	syscall	NlMsgerr	struct
5523	syscall	RtGenmsg	struct
5524	syscall	NlAttr	struct
5525	syscall	RtAttr	struct
5526	syscall	IfInfomsg	struct
5527	syscall	IfAddrmsg	struct
5528	syscall	RtMsg	struct
5529	syscall	RtNexthop	struct
5530	syscall	SockFilter	struct
5531	syscall	SockFprog	struct
5532	syscall	InotifyEvent	struct
5533	syscall	PtraceRegs	struct
5534	syscall	FdSet	struct
5535	syscall	Sysinfo_t	struct
5536	syscall	Utsname	struct
5537	syscall	Ustat_t	struct
5538	syscall	EpollEvent	struct
5539	syscall	Termios	struct
5540	syscall	Timespec	struct
5541	syscall	Timeval	struct
5542	syscall	Timex	struct
5543	syscall	Time_t	int32
5544	syscall	Tms	struct
5545	syscall	Utimbuf	struct
5546	syscall	Rusage	struct
5547	syscall	Rlimit	struct
5548	syscall	Stat_t	struct
5549	syscall	Statfs_t	struct
5550	syscall	Dirent	struct
5551	syscall	Fsid	struct
5552	syscall	Flock_t	struct
5553	syscall	RawSockaddrInet4	struct
5554	syscall	RawSockaddrInet6	struct
5555	syscall	RawSockaddrUnix	struct
5556	syscall	RawSockaddrLinklayer	struct
5557	syscall	RawSockaddrNetlink	struct
5558	syscall	RawSockaddr	struct
5559	syscall	RawSockaddrAny	struct
5560	syscall	Linger	struct
5561	syscall	Iovec	struct
5562	syscall	IPMreq	struct
5563	syscall	IPMreqn	struct
5564	syscall	IPv6Mreq	struct
5565	syscall	Msghdr	struct
5566	syscall	Cmsghdr	struct
5567	syscall	Inet4Pktinfo	struct
5568	syscall	Inet6Pktinfo	struct
5569	syscall	IPv6MTUInfo	struct
5570	syscall	ICMPv6Filter	struct
5571	syscall	Ucred	struct
5572	syscall	TCPInfo	struct
5573	syscall	NlMsghdr	struct
5574	syscall	NlMsgerr	struct
5575	syscall	RtGenmsg	struct
5576	syscall	NlAttr	struct
5577	syscall	RtAttr	struct
5578	syscall	IfInfomsg	struct
5579	syscall	IfAddrmsg	struct
5580	syscall	RtMsg	struct
5581	syscall	RtNexthop	struct
5582	syscall	SockFilter	struct
5583	syscall	SockFprog	struct
5584	syscall	InotifyEvent	struct
5585	syscall	PtraceRegs	struct
5586	syscall	FdSet	struct
5587	syscall	Sysinfo_t	struct
5588	syscall	Utsname	struct
5589	syscall	Ustat_t	struct
5590	syscall	EpollEvent	struct
5591	syscall	Termios	struct
5592	syscall	Timespec	struct
5593	syscall	Timeval	struct
5594	syscall	Timex	struct
5595	syscall	Time_t	int64
5596	syscall	Tms	struct
5597	syscall	Utimbuf	struct
5598	syscall	Rusage	struct
5599	syscall	Rlimit	struct
5600	syscall	Stat_t	struct
5601	syscall	Statfs_t	struct
5602	syscall	Dirent	struct
5603	syscall	Fsid	struct
5604	syscall	Flock_t	struct
5605	syscall	RawSockaddrInet4	struct
5606	syscall	RawSockaddrInet6	struct
5607	syscall	RawSockaddrUnix	struct
5608	syscall	RawSockaddrLinklayer	struct
5609	syscall	RawSockaddrNetlink	struct
5610	syscall	RawSockaddr	struct
5611	syscall	RawSockaddrAny	struct
5612	syscall	Linger	struct
5613	syscall	Iovec	struct
5614	syscall	IPMreq	struct
5615	syscall	IPMreqn	struct
5616	syscall	IPv6Mreq	struct
5617	syscall	Msghdr	struct
5618	syscall	Cmsghdr	struct
5619	syscall	Inet4Pktinfo	struct
5620	syscall	Inet6Pktinfo	struct
5621	syscall	IPv6MTUInfo	struct
5622	syscall	ICMPv6Filter	struct
5623	syscall	Ucred	struct
5624	syscall	TCPInfo	struct
5625	syscall	NlMsghdr	struct
5626	syscall	NlMsgerr	struct
5627	syscall	RtGenmsg	struct
5628	syscall	NlAttr	struct
5629	syscall	RtAttr	struct
5630	syscall	IfInfomsg	struct
5631	syscall	IfAddrmsg	struct
5632	syscall	RtMsg	struct
5633	syscall	RtNexthop	struct
5634	syscall	SockFilter	struct
5635	syscall	SockFprog	struct
5636	syscall	InotifyEvent	struct
5637	syscall	PtraceRegs	struct
5638	syscall	FdSet	struct
5639	syscall	Sysinfo_t	struct
5640	syscall	Utsname	struct
5641	syscall	Ustat_t	struct
5642	syscall	EpollEvent	struct
5643	syscall	Termios	struct
5644	syscall	Timespec	struct
5645	syscall	Timeval	struct
5646	syscall	Timex	struct
5647	syscall	Time_t	int64
5648	syscall	Tms	struct
5649	syscall	Utimbuf	struct
5650	syscall	Rusage	struct
5651	syscall	Rlimit	struct
5652	syscall	Stat_t	struct
5653	syscall	Statfs_t	struct
5654	syscall	Dirent	struct
5655	syscall	Fsid	struct
5656	syscall	Flock_t	struct
5657	syscall	RawSockaddrInet4	struct
5658	syscall	RawSockaddrInet6	struct
5659	syscall	RawSockaddrUnix	struct
5660	syscall	RawSockaddrLinklayer	struct
5661	syscall	RawSockaddrNetlink	struct
5662	syscall	RawSockaddr	struct
5663	syscall	RawSockaddrAny	struct
5664	syscall	Linger	struct
5665	syscall	Iovec	struct
5666	syscall	IPMreq	struct
5667	syscall	IPMreqn	struct
5668	syscall	IPv6Mreq	struct
5669	syscall	Msghdr	struct
5670	syscall	Cmsghdr	struct
5671	syscall	Inet4Pktinfo	struct
5672	syscall	Inet6Pktinfo	struct
5673	syscall	IPv6MTUInfo	struct
5674	syscall	ICMPv6Filter	struct
5675	syscall	Ucred	struct
5676	syscall	TCPInfo	struct
5677	syscall	NlMsghdr	struct
5678	syscall	NlMsgerr	struct
5679	syscall	RtGenmsg	struct
5680	syscall	NlAttr	struct
5681	syscall	RtAttr	struct
5682	syscall	IfInfomsg	struct
5683	syscall	IfAddrmsg	struct
5684	syscall	RtMsg	struct
5685	syscall	RtNexthop	struct
5686	syscall	SockFilter	struct
5687	syscall	SockFprog	struct
5688	syscall	InotifyEvent	struct
5689	syscall	PtraceRegs	struct
5690	syscall	FdSet	struct
5691	syscall	Sysinfo_t	struct
5692	syscall	Utsname	struct
5693	syscall	Ustat_t	struct
5694	syscall	EpollEvent	struct
5695	syscall	Termios	struct
5696	syscall	Timespec	struct
5697	syscall	Timeval	struct
5698	syscall	Timex	struct
5699	syscall	Time_t	int64
5700	syscall	Tms	struct
5701	syscall	Utimbuf	struct
5702	syscall	Rusage	struct
5703	syscall	Rlimit	struct
5704	syscall	Stat_t	struct
5705	syscall	Statfs_t	struct
5706	syscall	Dirent	struct
5707	syscall	Fsid	struct
5708	syscall	Flock_t	struct
5709	syscall	RawSockaddrInet4	struct
5710	syscall	RawSockaddrInet6	struct
5711	syscall	RawSockaddrUnix	struct
5712	syscall	RawSockaddrLinklayer	struct
5713	syscall	RawSockaddrNetlink	struct
5714	syscall	RawSockaddr	struct
5715	syscall	RawSockaddrAny	struct
5716	syscall	Linger	struct
5717	syscall	Iovec	struct
5718	syscall	IPMreq	struct
5719	syscall	IPMreqn	struct
5720	syscall	IPv6Mreq	struct
5721	syscall	Msghdr	struct
5722	syscall	Cmsghdr	struct
5723	syscall	Inet4Pktinfo	struct
5724	syscall	Inet6Pktinfo	struct
5725	syscall	IPv6MTUInfo	struct
5726	syscall	ICMPv6Filter	struct
5727	syscall	Ucred	struct
5728	syscall	TCPInfo	struct
5729	syscall	NlMsghdr	struct
5730	syscall	NlMsgerr	struct
5731	syscall	RtGenmsg	struct
5732	syscall	NlAttr	struct
5733	syscall	RtAttr	struct
5734	syscall	IfInfomsg	struct
5735	syscall	IfAddrmsg	struct
5736	syscall	RtMsg	struct
5737	syscall	RtNexthop	struct
5738	syscall	SockFilter	struct
5739	syscall	SockFprog	struct
5740	syscall	InotifyEvent	struct
5741	syscall	PtraceRegs	struct
5742	syscall	PtracePsw	struct
5743	syscall	PtraceFpregs	struct
5744	syscall	PtracePer	struct
5745	syscall	FdSet	struct
5746	syscall	Sysinfo_t	struct
5747	syscall	Utsname	struct
5748	syscall	Ustat_t	struct
5749	syscall	EpollEvent	struct
5750	syscall	Termios	struct
5751	syscall	Timespec	struct
5752	syscall	Timeval	struct
5753	syscall	Rusage	struct
5754	syscall	Rlimit	struct
5755	syscall	Stat_t	struct
5756	syscall	Statfs_t	[]byte
5757	syscall	Flock_t	struct
5758	syscall	Dirent	struct
5759	syscall	Fsid	struct
5760	syscall	RawSockaddrInet4	struct
5761	syscall	RawSockaddrInet6	struct
5762	syscall	RawSockaddrUnix	struct
5763	syscall	RawSockaddrDatalink	struct
5764	syscall	RawSockaddr	struct
5765	syscall	RawSockaddrAny	struct
5766	syscall	Linger	struct
5767	syscall	Iovec	struct
5768	syscall	IPMreq	struct
5769	syscall	IPv6Mreq	struct
5770	syscall	Msghdr	struct
5771	syscall	Cmsghdr	struct
5772	syscall	Inet6Pktinfo	struct
5773	syscall	IPv6MTUInfo	struct
5774	syscall	ICMPv6Filter	struct
5775	syscall	Kevent_t	struct
5776	syscall	FdSet	struct
5777	syscall	IfMsghdr	struct
5778	syscall	IfData	struct
5779	syscall	IfaMsghdr	struct
5780	syscall	IfAnnounceMsghdr	struct
5781	syscall	RtMsghdr	struct
5782	syscall	RtMetrics	struct
5783	syscall	Mclpool	[]byte
5784	syscall	BpfVersion	struct
5785	syscall	BpfStat	struct
5786	syscall	BpfProgram	struct
5787	syscall	BpfInsn	struct
5788	syscall	BpfHdr	struct
5789	syscall	BpfTimeval	struct
5790	syscall	Termios	struct
5791	syscall	Sysctlnode	struct
5792	syscall	Timespec	struct
5793	syscall	Timeval	struct
5794	syscall	Rusage	struct
5795	syscall	Rlimit	struct
5796	syscall	Stat_t	struct
5797	syscall	Statfs_t	[]byte
5798	syscall	Flock_t	struct
5799	syscall	Dirent	struct
5800	syscall	Fsid	struct
5801	syscall	RawSockaddrInet4	struct
5802	syscall	RawSockaddrInet6	struct
5803	syscall	RawSockaddrUnix	struct
5804	syscall	RawSockaddrDatalink	struct
5805	syscall	RawSockaddr	struct
5806	syscall	RawSockaddrAny	struct
5807	syscall	Linger	struct
5808	syscall	Iovec	struct
5809	syscall	IPMreq	struct
5810	syscall	IPv6Mreq	struct
5811	syscall	Msghdr	struct
5812	syscall	Cmsghdr	struct
5813	syscall	Inet6Pktinfo	struct
5814	syscall	IPv6MTUInfo	struct
5815	syscall	ICMPv6Filter	struct
5816	syscall	Kevent_t	struct
5817	syscall	FdSet	struct
5818	syscall	IfMsghdr	struct
5819	syscall	IfData	struct
5820	syscall	IfaMsghdr	struct
5821	syscall	IfAnnounceMsghdr	struct
5822	syscall	RtMsghdr	struct
5823	syscall	RtMetrics	struct
5824	syscall	Mclpool	[]byte
5825	syscall	BpfVersion	struct
5826	syscall	BpfStat	struct
5827	syscall	BpfProgram	struct
5828	syscall	BpfInsn	struct
5829	syscall	BpfHdr	struct
5830	syscall	BpfTimeval	struct
5831	syscall	Termios	struct
5832	syscall	Sysctlnode	struct
5833	syscall	Timespec	struct
5834	syscall	Timeval	struct
5835	syscall	Rusage	struct
5836	syscall	Rlimit	struct
5837	syscall	Stat_t	struct
5838	syscall	Statfs_t	[]byte
5839	syscall	Flock_t	struct
5840	syscall	Dirent	struct
5841	syscall	Fsid	struct
5842	syscall	RawSockaddrInet4	struct
5843	syscall	RawSockaddrInet6	struct
5844	syscall	RawSockaddrUnix	struct
5845	syscall	RawSockaddrDatalink	struct
5846	syscall	RawSockaddr	struct
5847	syscall	RawSockaddrAny	struct
5848	syscall	Linger	struct
5849	syscall	Iovec	struct
5850	syscall	IPMreq	struct
5851	syscall	IPv6Mreq	struct
5852	syscall	Msghdr	struct
5853	syscall	Cmsghdr	struct
5854	syscall	Inet6Pktinfo	struct
5855	syscall	IPv6MTUInfo	struct
5856	syscall	ICMPv6Filter	struct
5857	syscall	Kevent_t	struct
5858	syscall	FdSet	struct
5859	syscall	IfMsghdr	struct
5860	syscall	IfData	struct
5861	syscall	IfaMsghdr	struct
5862	syscall	IfAnnounceMsghdr	struct
5863	syscall	RtMsghdr	struct
5864	syscall	RtMetrics	struct
5865	syscall	Mclpool	[]byte
5866	syscall	BpfVersion	struct
5867	syscall	BpfStat	struct
5868	syscall	BpfProgram	struct
5869	syscall	BpfInsn	struct
5870	syscall	BpfHdr	struct
5871	syscall	BpfTimeval	struct
5872	syscall	Termios	struct
5873	syscall	Sysctlnode	struct
5874	syscall	Timespec	struct
5875	syscall	Timeval	struct
5876	syscall	Rusage	struct
5877	syscall	Rlimit	struct
5878	syscall	Stat_t	struct
5879	syscall	Statfs_t	struct
5880	syscall	Flock_t	struct
5881	syscall	Dirent	struct
5882	syscall	Fsid	struct
5883	syscall	RawSockaddrInet4	struct
5884	syscall	RawSockaddrInet6	struct
5885	syscall	RawSockaddrUnix	struct
5886	syscall	RawSockaddrDatalink	struct
5887	syscall	RawSockaddr	struct
5888	syscall	RawSockaddrAny	struct
5889	syscall	Linger	struct
5890	syscall	Iovec	struct
5891	syscall	IPMreq	struct
5892	syscall	IPv6Mreq	struct
5893	syscall	Msghdr	struct
5894	syscall	Cmsghdr	struct
5895	syscall	Inet6Pktinfo	struct
5896	syscall	IPv6MTUInfo	struct
5897	syscall	ICMPv6Filter	struct
5898	syscall	Kevent_t	struct
5899	syscall	FdSet	struct
5900	syscall	IfMsghdr	struct
5901	syscall	IfData	struct
5902	syscall	IfaMsghdr	struct
5903	syscall	IfAnnounceMsghdr	struct
5904	syscall	RtMsghdr	struct
5905	syscall	RtMetrics	struct
5906	syscall	Mclpool	struct
5907	syscall	BpfVersion	struct
5908	syscall	BpfStat	struct
5909	syscall	BpfProgram	struct
5910	syscall	BpfInsn	struct
5911	syscall	BpfHdr	struct
5912	syscall	BpfTimeval	struct
5913	syscall	Termios	struct
5914	syscall	Timespec	struct
5915	syscall	Timeval	struct
5916	syscall	Rusage	struct
5917	syscall	Rlimit	struct
5918	syscall	Stat_t	struct
5919	syscall	Statfs_t	struct
5920	syscall	Flock_t	struct
5921	syscall	Dirent	struct
5922	syscall	Fsid	struct
5923	syscall	RawSockaddrInet4	struct
5924	syscall	RawSockaddrInet6	struct
5925	syscall	RawSockaddrUnix	struct
5926	syscall	RawSockaddrDatalink	struct
5927	syscall	RawSockaddr	struct
5928	syscall	RawSockaddrAny	struct
5929	syscall	Linger	struct
5930	syscall	Iovec	struct
5931	syscall	IPMreq	struct
5932	syscall	IPv6Mreq	struct
5933	syscall	Msghdr	struct
5934	syscall	Cmsghdr	struct
5935	syscall	Inet6Pktinfo	struct
5936	syscall	IPv6MTUInfo	struct
5937	syscall	ICMPv6Filter	struct
5938	syscall	Kevent_t	struct
5939	syscall	FdSet	struct
5940	syscall	IfMsghdr	struct
5941	syscall	IfData	struct
5942	syscall	IfaMsghdr	struct
5943	syscall	IfAnnounceMsghdr	struct
5944	syscall	RtMsghdr	struct
5945	syscall	RtMetrics	struct
5946	syscall	Mclpool	struct
5947	syscall	BpfVersion	struct
5948	syscall	BpfStat	struct
5949	syscall	BpfProgram	struct
5950	syscall	BpfInsn	struct
5951	syscall	BpfHdr	struct
5952	syscall	BpfTimeval	struct
5953	syscall	Termios	struct
5954	syscall	Timespec	struct
5955	syscall	Timeval	struct
5956	syscall	Rusage	struct
5957	syscall	Rlimit	struct
5958	syscall	Stat_t	struct
5959	syscall	Statfs_t	struct
5960	syscall	Flock_t	struct
5961	syscall	Dirent	struct
5962	syscall	Fsid	struct
5963	syscall	RawSockaddrInet4	struct
5964	syscall	RawSockaddrInet6	struct
5965	syscall	RawSockaddrUnix	struct
5966	syscall	RawSockaddrDatalink	struct
5967	syscall	RawSockaddr	struct
5968	syscall	RawSockaddrAny	struct
5969	syscall	Linger	struct
5970	syscall	Iovec	struct
5971	syscall	IPMreq	struct
5972	syscall	IPv6Mreq	struct
5973	syscall	Msghdr	struct
5974	syscall	Cmsghdr	struct
5975	syscall	Inet6Pktinfo	struct
5976	syscall	IPv6MTUInfo	struct
5977	syscall	ICMPv6Filter	struct
5978	syscall	Kevent_t	struct
5979	syscall	FdSet	struct
5980	syscall	IfMsghdr	struct
5981	syscall	IfData	struct
5982	syscall	IfaMsghdr	struct
5983	syscall	IfAnnounceMsghdr	struct
5984	syscall	RtMsghdr	struct
5985	syscall	RtMetrics	struct
5986	syscall	Mclpool	struct
5987	syscall	BpfVersion	struct
5988	syscall	BpfStat	struct
5989	syscall	BpfProgram	struct
5990	syscall	BpfInsn	struct
5991	syscall	BpfHdr	struct
5992	syscall	BpfTimeval	struct
5993	syscall	Termios	struct
5994	syscall	Timespec	struct
5995	syscall	Timeval	struct
5996	syscall	Timeval32	struct
5997	syscall	Rusage	struct
5998	syscall	Rlimit	struct
5999	syscall	Stat_t	struct
6000	syscall	Flock_t	struct
6001	syscall	Dirent	struct
6002	syscall	RawSockaddrInet4	struct
6003	syscall	RawSockaddrInet6	struct
6004	syscall	RawSockaddrUnix	struct
6005	syscall	RawSockaddrDatalink	struct
6006	syscall	RawSockaddr	struct
6007	syscall	RawSockaddrAny	struct
6008	syscall	Linger	struct
6009	syscall	Iovec	struct
6010	syscall	IPMreq	struct
6011	syscall	IPv6Mreq	struct
6012	syscall	Msghdr	struct
6013	syscall	Cmsghdr	struct
6014	syscall	Inet6Pktinfo	struct
6015	syscall	IPv6MTUInfo	struct
6016	syscall	ICMPv6Filter	struct
6017	syscall	FdSet	struct
6018	syscall	IfMsghdr	struct
6019	syscall	IfData	struct
6020	syscall	IfaMsghdr	struct
6021	syscall	RtMsghdr	struct
6022	syscall	RtMetrics	struct
6023	syscall	BpfVersion	struct
6024	syscall	BpfStat	struct
6025	syscall	BpfProgram	struct
6026	syscall	BpfInsn	struct
6027	syscall	BpfTimeval	struct
6028	syscall	BpfHdr	struct
6029	syscall	Termios	struct
6030	testing	InternalBenchmark	struct
6031	testing	B	struct
6032	testing	BenchmarkResult	struct
6033	testing	PB	struct
6034	testing	CoverBlock	struct
6035	testing	Cover	struct
6036	testing	InternalExample	struct
6037	testdeps	TestDeps	struct
6038	quick	Generator	
6039	quick	Config	struct
6040	quick	SetupError	string
6041	quick	CheckError	struct
6042	quick	CheckEqualError	struct
6043	testing	TB	
6044	testing	T	struct
6045	testing	InternalTest	struct
6046	testing	M	struct
6047	scanner	Position	struct
6048	scanner	Scanner	struct
6049	tabwriter	Writer	struct
6050	template	ExecError	struct
6051	template	FuncMap	map[string]interface{}
6052	parse	Node	
6053	parse	NodeType	int
6054	parse	Pos	int
6055	parse	ListNode	struct
6056	parse	TextNode	struct
6057	parse	PipeNode	struct
6058	parse	ActionNode	struct
6059	parse	CommandNode	struct
6060	parse	IdentifierNode	struct
6061	parse	VariableNode	struct
6062	parse	DotNode	struct
6063	parse	NilNode	struct
6064	parse	FieldNode	struct
6065	parse	ChainNode	struct
6066	parse	BoolNode	struct
6067	parse	NumberNode	struct
6068	parse	StringNode	struct
6069	parse	BranchNode	struct
6070	parse	IfNode	struct
6071	parse	RangeNode	struct
6072	parse	WithNode	struct
6073	parse	TemplateNode	struct
6074	parse	Tree	struct
6075	template	Template	struct
6076	time	ParseError	struct
6077	main	MapZone	struct
6078	main	SupplementalData	struct
6079	time	Timer	struct
6080	time	Ticker	struct
6081	time	Time	struct
6082	time	Month	int
6083	time	Weekday	int
6084	time	Duration	int64
6085	time	Location	struct
6086	unicode	RangeTable	struct
6087	unicode	Range16	struct
6088	unicode	Range32	struct
6089	unicode	CaseRange	struct
6090	unicode	SpecialCase	[]unicode.CaseRange
6091	main	Char	struct
6092	main	Script	struct
6093	main	State	int
6094	main	Op	func(rune) bool
6095	unsafe	ArbitraryType	int
6096	unsafe	Pointer	*unsafe.ArbitraryType
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
67	codehost	RecentTag	{string,string}	{string,error}		28
68	modfetch	ModulePath	{}	{string}		29
69	modfetch	Versions	{string}	{[]string,error}		29
70	modfetch	Stat	{string}	{*modfetch.RevInfo,error}		29
71	modfetch	Latest	{}	{*modfetch.RevInfo,error}		29
72	modfetch	GoMod	{string}	{[]byte,error}		29
73	modfetch	Zip	{io.Writer,string}	{error}		29
74	modfile	Span	{}	{modfile.Position}		30
75	modfile	Comment	{}	{*modfile.Comments}		30
76	mvs	Required	{module.Version}	{[]module.Version,error}		31
77	mvs	Max	{string,string}	{string}		31
78	mvs	Upgrade	{module.Version}	{module.Version,error}		31
79	mvs	Previous	{module.Version}	{module.Version,error}		31
80	p	p.A1	{}	{}		34
81	p	p.B1	{}	{}		35
82	p	p.C1	{}	{}		36
83	dwarf	Len	{}	{int64}		37
84	dwarf	PtrSize	{}	{int}		38
85	dwarf	AddInt	{dwarf.Sym,int,int64}	{}		38
86	dwarf	AddBytes	{dwarf.Sym,[]byte}	{}		38
87	dwarf	AddAddress	{dwarf.Sym,"interface{}",int64}	{}		38
88	dwarf	AddSectionOffset	{dwarf.Sym,int,"interface{}",int64}	{}		38
89	dwarf	AddDWARFAddrSectionOffset	{dwarf.Sym,"interface{}",int64}	{}		38
90	dwarf	CurrentOffset	{dwarf.Sym}	{int64}		38
91	dwarf	RecordDclReference	{dwarf.Sym,dwarf.Sym,int,int}	{}		38
92	dwarf	RecordChildDieOffsets	{dwarf.Sym,[]*dwarf.Var,[]int32}	{}		38
93	dwarf	AddString	{dwarf.Sym,string}	{}		38
94	dwarf	AddFileRef	{dwarf.Sym,"interface{}"}	{}		38
95	dwarf	Logf	{string,"...interface{}"}	{}		38
96	objfile	PCToLine	{uint64}	{string,int,*gosym.Func}		42
97	objfile	String	{uint64}	{string}		43
98	main	Name	{}	{string}		45
99	main	Stat	{}	{os.FileInfo,error}		45
100	main	Read	{[]byte}	{int,error}		45
101	main	Close	{}	{error}		45
102	driver	Open	{string}	{io.WriteCloser,error}		47
103	driver	Bool	{string,bool,string}	{*bool}		48
104	driver	Int	{string,int,string}	{*int}		48
105	driver	Float64	{string,float64,string}	{*float64}		48
106	driver	String	{string,string,string}	{*string}		48
107	driver	BoolVar	{*bool,string,bool,string}	{}		48
108	driver	IntVar	{*int,string,int,string}	{}		48
109	driver	Float64Var	{*float64,string,float64,string}	{}		48
110	driver	StringVar	{*string,string,string,string}	{}		48
111	driver	StringList	{string,string,string}	{*[]*string}		48
112	driver	ExtraUsage	{}	{string}		48
113	driver	AddExtraUsage	{string}	{}		48
114	driver	Parse	{func()}	{[]string}		48
115	driver	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		49
116	driver	Symbolize	{string,driver.MappingSources,*profile.Profile}	{error}		50
117	driver	Open	{string,uint64,uint64,uint64}	{driver.ObjFile,error}		51
118	driver	Disasm	{string,uint64,uint64}	{[]driver.Inst,error}		51
119	driver	Name	{}	{string}		52
120	driver	Base	{}	{uint64}		52
121	driver	BuildID	{}	{string}		52
122	driver	SourceLine	{uint64}	{[]driver.Frame,error}		52
123	driver	Symbols	{*regexp.Regexp,uint64}	{[]*driver.Sym,error}		52
124	driver	Close	{}	{error}		52
125	driver	ReadLine	{string}	{string,error}		53
126	driver	Print	{"...interface{}"}	{}		53
127	driver	PrintErr	{"...interface{}"}	{}		53
128	driver	IsTerminal	{}	{bool}		53
129	driver	WantBrowser	{}	{bool}		53
130	driver	SetAutoComplete	{"func(string) string"}	{}		53
131	plugin	Open	{string}	{io.WriteCloser,error}		54
132	plugin	Bool	{string,bool,string}	{*bool}		55
133	plugin	Int	{string,int,string}	{*int}		55
134	plugin	Float64	{string,float64,string}	{*float64}		55
135	plugin	String	{string,string,string}	{*string}		55
268	binary	String	{}	{string}		133
136	plugin	BoolVar	{*bool,string,bool,string}	{}		55
137	plugin	IntVar	{*int,string,int,string}	{}		55
138	plugin	Float64Var	{*float64,string,float64,string}	{}		55
139	plugin	StringVar	{*string,string,string,string}	{}		55
140	plugin	StringList	{string,string,string}	{*[]*string}		55
141	plugin	ExtraUsage	{}	{string}		55
142	plugin	AddExtraUsage	{string}	{}		55
143	plugin	Parse	{func()}	{[]string}		55
144	plugin	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		56
145	plugin	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}		57
146	plugin	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}		58
147	plugin	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}		58
148	plugin	Name	{}	{string}		59
149	plugin	Base	{}	{uint64}		59
150	plugin	BuildID	{}	{string}		59
151	plugin	SourceLine	{uint64}	{[]plugin.Frame,error}		59
152	plugin	Symbols	{*regexp.Regexp,uint64}	{[]*plugin.Sym,error}		59
153	plugin	Close	{}	{error}		59
154	plugin	ReadLine	{string}	{string,error}		60
155	plugin	Print	{"...interface{}"}	{}		60
156	plugin	PrintErr	{"...interface{}"}	{}		60
157	plugin	IsTerminal	{}	{bool}		60
158	plugin	WantBrowser	{}	{bool}		60
159	plugin	SetAutoComplete	{"func(string) string"}	{}		60
160	demangle	Traverse	{"func(demangle.AST) bool"}	{}		61
161	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}		61
162	demangle	GoString	{}	{string}		61
163	armasm	IsArg	{}	{}		62
164	armasm	String	{}	{string}		62
165	arm64asm	String	{}	{string}		63
166	ppc64asm	IsArg	{}	{}		64
167	ppc64asm	String	{}	{string}		64
168	x86asm	String	{}	{string}		65
169	debug	Close	{}	{error}		67
170	debug	Info	{uint32,string}	{error}		67
171	debug	Warning	{uint32,string}	{error}		67
172	debug	Error	{uint32,string}	{error}		67
173	svc	Execute	{[]string,"chan svc.ChangeRequest\n","chan svc.Status\n"}	{bool,uint32}		68
174	analysis	AFact	{}	{}		71
175	analysisflags	IsBoolFlag	{}	{bool}		72
176	flate	Reset	{io.Reader,[]byte}	{error}		74
177	flate	io.Reader	{}	{}		75
178	flate	io.ByteReader	{}	{}		75
179	zlib	Reset	{io.Reader,[]byte}	{error}		76
180	heap	sort.Interface	{}	{}		77
181	heap	Push	{"interface{}"}	{}		77
182	heap	Pop	{}	{"interface{}"}		77
183	context	Deadline	{}	{time.Time,bool}		80
184	context	Done	{}	{"chan struct{}\n"}		80
185	context	Err	{}	{error}		80
186	context	Value	{"interface{}"}	{"interface{}"}		80
187	cipher	BlockSize	{}	{int}		81
188	cipher	Encrypt	{[]byte,[]byte}	{}		81
189	cipher	Decrypt	{[]byte,[]byte}	{}		81
190	cipher	XORKeyStream	{[]byte,[]byte}	{}		82
191	cipher	BlockSize	{}	{int}		83
192	cipher	CryptBlocks	{[]byte,[]byte}	{}		83
193	cipher	NonceSize	{}	{int}		84
194	cipher	Overhead	{}	{int}		84
195	cipher	Seal	{[]byte,[]byte,[]byte,[]byte}	{[]byte}		84
196	cipher	Open	{[]byte,[]byte,[]byte,[]byte}	{[]byte,error}		84
197	crypto	Public	{}	{crypto.PublicKey}		87
198	crypto	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}		87
199	crypto	HashFunc	{}	{crypto.Hash}		88
200	crypto	Public	{}	{crypto.PublicKey}		89
201	crypto	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}		89
202	elliptic	Params	{}	{*elliptic.CurveParams}		91
203	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}		91
204	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}		91
205	elliptic	Double	{*big.Int,*big.Int}	{*big.Int}		91
206	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int}		91
207	elliptic	ScalarBaseMult	{[]byte}	{*big.Int}		91
208	tls	Get	{string}	{*tls.ClientSessionState,bool}		92
209	tls	Put	{string,*tls.ClientSessionState}	{}		92
210	driver	Open	{string}	{driver.Conn,error}		97
211	driver	OpenConnector	{string}	{driver.Connector,error}		98
212	driver	Connect	{context.Context}	{driver.Conn,error}		99
213	driver	Driver	{}	{driver.Driver}		99
214	driver	Ping	{context.Context}	{error}		100
215	driver	Exec	{string,[]driver.Value}	{driver.Result,error}		101
216	driver	ExecContext	{context.Context,string,[]driver.NamedValue}	{driver.Result,error}		102
217	driver	Query	{string,[]driver.Value}	{driver.Rows,error}		103
218	driver	QueryContext	{context.Context,string,[]driver.NamedValue}	{driver.Rows,error}		104
219	driver	Prepare	{string}	{driver.Stmt,error}		105
220	driver	Close	{}	{error}		105
221	driver	Begin	{}	{driver.Tx,error}		105
222	driver	PrepareContext	{context.Context,string}	{driver.Stmt,error}		106
223	driver	BeginTx	{context.Context,driver.TxOptions}	{driver.Tx,error}		107
224	driver	ResetSession	{context.Context}	{error}		108
225	driver	LastInsertId	{}	{int64,error}		109
226	driver	RowsAffected	{}	{int64,error}		109
227	driver	Close	{}	{error}		110
228	driver	NumInput	{}	{int}		110
229	driver	Exec	{[]driver.Value}	{driver.Result,error}		110
230	driver	Query	{[]driver.Value}	{driver.Rows,error}		110
231	driver	ExecContext	{context.Context,[]driver.NamedValue}	{driver.Result,error}		111
232	driver	QueryContext	{context.Context,[]driver.NamedValue}	{driver.Rows,error}		112
233	driver	CheckNamedValue	{*driver.NamedValue}	{error}		113
234	driver	ColumnConverter	{int}	{driver.ValueConverter}		114
235	driver	Columns	{}	{[]string}		115
236	driver	Close	{}	{error}		115
237	driver	Next	{[]driver.Value}	{error}		115
238	driver	driver.Rows	{}	{}		116
239	driver	HasNextResultSet	{}	{bool}		116
240	driver	NextResultSet	{}	{error}		116
241	driver	driver.Rows	{}	{}		117
242	driver	ColumnTypeScanType	{int}	{reflect.Type}		117
243	driver	driver.Rows	{}	{}		118
244	driver	ColumnTypeDatabaseTypeName	{int}	{string}		118
245	driver	driver.Rows	{}	{}		119
246	driver	ColumnTypeLength	{int}	{int64,bool}		119
247	driver	driver.Rows	{}	{}		120
248	driver	ColumnTypeNullable	{int}	{bool}		120
249	driver	driver.Rows	{}	{}		121
250	driver	ColumnTypePrecisionScale	{int}	{int64,bool}		121
251	driver	Commit	{}	{error}		122
252	driver	Rollback	{}	{error}		122
253	driver	ConvertValue	{"interface{}"}	{driver.Value,error}		123
254	driver	Value	{}	{driver.Value,error}		124
255	sql	Scan	{"interface{}"}	{error}		126
256	sql	LastInsertId	{}	{int64,error}		128
257	sql	RowsAffected	{}	{int64,error}		128
258	dwarf	Common	{}	{*dwarf.CommonType}		130
259	dwarf	String	{}	{string}		130
260	dwarf	Size	{}	{int64}		130
261	macho	Raw	{}	{[]byte}		131
262	binary	Uint16	{[]byte}	{uint16}		133
263	binary	Uint32	{[]byte}	{uint32}		133
264	binary	Uint64	{[]byte}	{uint64}		133
265	binary	PutUint16	{[]byte,uint16}	{}		133
266	binary	PutUint32	{[]byte,uint32}	{}		133
267	binary	PutUint64	{[]byte,uint64}	{}		133
269	encoding	MarshalBinary	{}	{[]byte,error}		134
270	encoding	UnmarshalBinary	{[]byte}	{error}		135
271	encoding	MarshalText	{}	{[]byte,error}		136
272	encoding	UnmarshalText	{[]byte}	{error}		137
273	gob	GobEncode	{}	{[]byte,error}		138
274	gob	GobDecode	{[]byte}	{error}		139
275	json	UnmarshalJSON	{[]byte}	{error}		140
276	json	MarshalJSON	{}	{[]byte,error}		141
277	xml	MarshalXML	{*xml.Encoder,xml.StartElement}	{error}		143
278	xml	MarshalXMLAttr	{xml.Name}	{xml.Attr,error}		144
279	xml	UnmarshalXML	{*xml.Decoder,xml.StartElement}	{error}		145
280	xml	UnmarshalXMLAttr	{xml.Attr}	{error}		146
281	xml	Token	{}	{xml.Token,error}		148
282	expvar	String	{}	{string}		149
283	flag	String	{}	{string}		150
284	flag	Set	{string}	{error}		150
285	flag	flag.Value	{}	{}		151
286	flag	Get	{}	{"interface{}"}		151
287	fmt	Write	{[]byte}	{int,error}		152
288	fmt	Width	{}	{int,bool}		152
289	fmt	Precision	{}	{int,bool}		152
290	fmt	Flag	{int}	{bool}		152
291	fmt	Format	{fmt.State,rune}	{}		153
292	fmt	String	{}	{string}		154
293	fmt	GoString	{}	{string}		155
294	fmt	ReadRune	{}	{rune,int,error}		156
295	fmt	UnreadRune	{}	{error}		156
296	fmt	SkipSpace	{}	{}		156
297	fmt	Token	{bool,"func(rune) bool"}	{[]byte,error}		156
298	fmt	Width	{}	{int,bool}		156
299	fmt	Read	{[]byte}	{int,error}		156
300	fmt	Scan	{fmt.ScanState,rune}	{error}		157
301	ast	Pos	{}	{token.Pos}		158
302	ast	End	{}	{token.Pos}		158
303	ast	ast.Node	{}	{}		159
304	ast	ast.Node	{}	{}		160
305	ast	ast.Node	{}	{}		161
306	ast	ast.Node	{}	{}		162
307	ast	Visit	{ast.Node}	{ast.Visitor}		166
308	constant	Kind	{}	{constant.Kind}		167
309	constant	String	{}	{string}		167
310	constant	ExactString	{}	{string}		167
311	exports	exports.T12	{}	{}		176
312	exports	exports.T13	{}	{}		176
313	p	M	{}	{}		177
314	issue25301	M	{}	{}		178
315	issue25301	issue25301.A	{}	{}		179
316	issue25596	M	{}	{issue25596.T}		180
317	issue25596	issue25596.E	{}	{}		181
318	types	Import	{string}	{*types.Package,error}		183
319	types	types.Importer	{}	{}		184
320	types	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}		184
321	types	Parent	{}	{*types.Scope}		185
322	types	Pos	{}	{token.Pos}		185
323	types	Pkg	{}	{*types.Package}		185
324	types	Name	{}	{string}		185
325	types	Type	{}	{types.Type}		185
326	types	Exported	{}	{bool}		185
327	types	Id	{}	{string}		185
328	types	String	{}	{string}		185
329	types	Alignof	{types.Type}	{int64}		186
330	types	Offsetsof	{[]*types.Var}	{[]int64}		186
331	types	Sizeof	{types.Type}	{int64}		186
332	types	Underlying	{}	{types.Type}		187
333	types	String	{}	{string}		187
334	hash	io.Writer	{}	{}		188
335	hash	Sum	{[]byte}	{[]byte}		188
336	hash	Reset	{}	{}		188
337	hash	Size	{}	{int}		188
338	hash	BlockSize	{}	{int}		188
339	hash	hash.Hash	{}	{}		189
340	hash	Sum32	{}	{uint32}		189
341	hash	hash.Hash	{}	{}		190
342	hash	Sum64	{}	{uint64}		190
343	color	RGBA	{}	{uint32}		191
344	color	Convert	{color.Color}	{color.Color}		192
345	draw	image.Image	{}	{}		193
346	draw	Set	{int,int,color.Color}	{}		193
347	draw	Quantize	{color.Palette,image.Image}	{color.Palette}		194
348	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}		195
349	image	ColorModel	{}	{color.Model}		196
350	image	Bounds	{}	{image.Rectangle}		196
351	image	At	{int,int}	{color.Color}		196
352	image	ColorIndexAt	{int,int}	{uint8}		197
353	image	image.Image	{}	{}		197
354	jpeg	io.ByteReader	{}	{}		198
355	jpeg	io.Reader	{}	{}		198
356	png	Get	{}	{*png.EncoderBuffer}		199
357	png	Put	{*png.EncoderBuffer}	{}		199
358	testlog	Getenv	{string}	{}		201
359	testlog	Stat	{string}	{}		201
360	testlog	Open	{string}	{}		201
361	testlog	Chdir	{string}	{}		201
362	cryptobyte	Marshal	{*cryptobyte.Builder}	{error}		202
363	lif	Family	{}	{int}		204
364	route	Family	{}	{int}		205
365	route	Sys	{}	{[]route.Sys}		206
366	route	SysType	{}	{route.SysType}		207
367	transform	Transform	{[]byte,[]byte,bool}	{int,error}		208
368	transform	Reset	{}	{}		208
369	transform	transform.Transformer	{}	{}		209
370	transform	Span	{[]byte,bool}	{int,error}		209
371	io	Read	{[]byte}	{int,error}		210
372	io	Write	{[]byte}	{int,error}		211
373	io	Close	{}	{error}		212
374	io	Seek	{int64,int}	{int64,error}		213
375	io	io.Reader	{}	{}		214
376	io	io.Writer	{}	{}		214
377	io	io.Reader	{}	{}		215
378	io	io.Closer	{}	{}		215
379	io	io.Writer	{}	{}		216
380	io	io.Closer	{}	{}		216
381	io	io.Reader	{}	{}		217
382	io	io.Writer	{}	{}		217
383	io	io.Closer	{}	{}		217
384	io	io.Reader	{}	{}		218
385	io	io.Seeker	{}	{}		218
386	io	io.Writer	{}	{}		219
387	io	io.Seeker	{}	{}		219
388	io	io.Reader	{}	{}		220
389	io	io.Writer	{}	{}		220
390	io	io.Seeker	{}	{}		220
391	io	ReadFrom	{io.Reader}	{int64,error}		221
392	io	WriteTo	{io.Writer}	{int64,error}		222
393	io	ReadAt	{[]byte,int64}	{int,error}		223
394	io	WriteAt	{[]byte,int64}	{int,error}		224
395	io	ReadByte	{}	{byte,error}		225
396	io	io.ByteReader	{}	{}		226
397	io	UnreadByte	{}	{error}		226
398	io	WriteByte	{byte}	{error}		227
399	io	ReadRune	{}	{rune,int,error}		228
400	io	io.RuneReader	{}	{}		229
401	io	UnreadRune	{}	{error}		229
402	io	WriteString	{string}	{int,error}		230
403	rand	Int63	{}	{int64}		231
404	rand	Seed	{int64}	{}		231
405	rand	rand.Source	{}	{}		232
406	rand	Uint64	{}	{uint64}		232
407	multipart	io.Reader	{}	{}		233
408	multipart	io.ReaderAt	{}	{}		233
409	multipart	io.Seeker	{}	{}		233
410	multipart	io.Closer	{}	{}		233
411	http	RoundTrip	{*http.Request}	{*http.Response,error}		234
412	cookiejar	PublicSuffix	{string}	{string}		235
413	cookiejar	String	{}	{string}		235
414	http	Open	{string}	{http.File,error}		236
415	http	io.Closer	{}	{}		237
416	http	io.Reader	{}	{}		237
417	http	io.Seeker	{}	{}		237
418	http	Readdir	{int}	{[]os.FileInfo,error}		237
419	http	Stat	{}	{os.FileInfo,error}		237
420	http	Push	{string,*http.PushOptions}	{error}		239
421	httputil	Get	{}	{[]byte}		240
422	httputil	Put	{[]byte}	{}		240
423	http	SetCookies	{*url.URL,[]*http.Cookie}	{}		241
424	http	Cookies	{*url.URL}	{[]*http.Cookie}		241
425	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}		242
426	http	Header	{}	{http.Header}		243
427	http	Write	{[]byte}	{int,error}		243
428	http	WriteHeader	{int}	{}		243
429	http	Flush	{}	{}		244
430	http	Hijack	{}	{net.Conn,*bufio.ReadWriter,error}		245
431	http	CloseNotify	{}	{"chan bool\n"}		246
432	net	Network	{}	{string}		247
433	net	String	{}	{string}		247
434	net	Read	{[]byte}	{int,error}		248
435	net	Write	{[]byte}	{int,error}		248
436	net	Close	{}	{error}		248
437	net	LocalAddr	{}	{net.Addr}		248
438	net	RemoteAddr	{}	{net.Addr}		248
439	net	SetDeadline	{time.Time}	{error}		248
440	net	SetReadDeadline	{time.Time}	{error}		248
441	net	SetWriteDeadline	{time.Time}	{error}		248
442	net	ReadFrom	{[]byte}	{int,net.Addr,error}		249
443	net	WriteTo	{[]byte,net.Addr}	{int,error}		249
444	net	Close	{}	{error}		249
445	net	LocalAddr	{}	{net.Addr}		249
446	net	SetDeadline	{time.Time}	{error}		249
447	net	SetReadDeadline	{time.Time}	{error}		249
448	net	SetWriteDeadline	{time.Time}	{error}		249
449	net	Accept	{}	{net.Conn,error}		250
450	net	Close	{}	{error}		250
451	net	Addr	{}	{net.Addr}		250
452	net	Timeout	{}	{bool}		251
453	net	Temporary	{}	{bool}		251
454	rpc	WriteRequest	{*rpc.Request,"interface{}"}	{error}		254
455	rpc	ReadResponseHeader	{*rpc.Response}	{error}		254
456	rpc	ReadResponseBody	{"interface{}"}	{error}		254
457	rpc	Close	{}	{error}		254
458	rpc	ReadRequestHeader	{*rpc.Request}	{error}		258
459	rpc	ReadRequestBody	{"interface{}"}	{error}		258
460	rpc	WriteResponse	{*rpc.Response,"interface{}"}	{error}		258
461	rpc	Close	{}	{error}		258
462	smtp	Start	{*smtp.ServerInfo}	{string,[]byte,error}		259
463	smtp	Next	{[]byte,bool}	{[]byte,error}		259
464	os	String	{}	{string}		260
465	os	Signal	{}	{}		260
466	os	Name	{}	{string}		261
467	os	Size	{}	{int64}		261
468	os	Mode	{}	{os.FileMode}		261
469	os	ModTime	{}	{time.Time}		261
470	os	IsDir	{}	{bool}		261
471	os	Sys	{}	{"interface{}"}		261
472	reflect	Align	{}	{int}		263
473	reflect	FieldAlign	{}	{int}		263
474	reflect	Method	{int}	{reflect.Method}		263
475	reflect	MethodByName	{string}	{reflect.Method,bool}		263
476	reflect	NumMethod	{}	{int}		263
477	reflect	Name	{}	{string}		263
478	reflect	PkgPath	{}	{string}		263
479	reflect	Size	{}	{uintptr}		263
480	reflect	String	{}	{string}		263
481	reflect	Kind	{}	{reflect.Kind}		263
482	reflect	Implements	{reflect.Type}	{bool}		263
483	reflect	AssignableTo	{reflect.Type}	{bool}		263
484	reflect	ConvertibleTo	{reflect.Type}	{bool}		263
485	reflect	Comparable	{}	{bool}		263
486	reflect	Bits	{}	{int}		263
487	reflect	ChanDir	{}	{reflect.ChanDir}		263
488	reflect	IsVariadic	{}	{bool}		263
489	reflect	Elem	{}	{reflect.Type}		263
490	reflect	Field	{int}	{reflect.StructField}		263
491	reflect	FieldByIndex	{[]int}	{reflect.StructField}		263
492	reflect	FieldByName	{string}	{reflect.StructField,bool}		263
493	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.StructField,bool}		263
494	reflect	In	{int}	{reflect.Type}		263
495	reflect	Key	{}	{reflect.Type}		263
496	reflect	Len	{}	{int}		263
497	reflect	NumField	{}	{int}		263
498	reflect	NumIn	{}	{int}		263
499	reflect	NumOut	{}	{int}		263
500	reflect	Out	{int}	{reflect.Type}		263
501	runtime	RuntimeError	{}	{}		264
502	sort	Len	{}	{int}		265
503	sort	Less	{int,int}	{bool}		265
504	sort	Swap	{int,int}	{}		265
505	sync	Lock	{}	{}		266
506	sync	Unlock	{}	{}		266
507	js	JSValue	{}	{js.Value}		267
508	syscall	Control	{func(uintptr)}	{error}		269
509	syscall	Read	{"func(uintptr) bool"}	{error}		269
510	syscall	Write	{"func(uintptr) bool"}	{error}		269
511	syscall	SyscallConn	{}	{syscall.RawConn,error}		270
512	quick	Generate	{*rand.Rand,int}	{reflect.Value}		277
513	testing	Error	{"...interface{}"}	{}		278
514	testing	Errorf	{string,"...interface{}"}	{}		278
515	testing	Fail	{}	{}		278
516	testing	FailNow	{}	{}		278
517	testing	Failed	{}	{bool}		278
518	testing	Fatal	{"...interface{}"}	{}		278
519	testing	Fatalf	{string,"...interface{}"}	{}		278
520	testing	Log	{"...interface{}"}	{}		278
521	testing	Logf	{string,"...interface{}"}	{}		278
522	testing	Name	{}	{string}		278
523	testing	Skip	{"...interface{}"}	{}		278
524	testing	SkipNow	{}	{}		278
525	testing	Skipf	{string,"...interface{}"}	{}		278
526	testing	Skipped	{}	{bool}		278
527	testing	Helper	{}	{}		278
528	parse	Type	{}	{parse.NodeType}		279
529	parse	String	{}	{string}		279
530	parse	Copy	{}	{parse.Node}		279
531	parse	Position	{}	{parse.Pos}		279
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
32	web2	Option	f
33	p	A1	f
34	p	B1	t
35	p	C1	t
36	p	D1	t
37	dwarf	Sym	t
38	dwarf	Context	t
39	dwarf	Data	t
40	obj	Val	t
41	obj	Curfn	t
42	objfile	Liner	t
43	objfile	RelocStringer	t
44	sym	Elfsect	t
45	main	FileLike	t
46	main	Arg	t
47	driver	Writer	t
48	driver	FlagSet	t
49	driver	Fetcher	t
50	driver	Symbolizer	t
51	driver	ObjTool	t
52	driver	ObjFile	t
53	driver	UI	t
54	plugin	Writer	t
55	plugin	FlagSet	t
56	plugin	Fetcher	t
57	plugin	Symbolizer	t
58	plugin	ObjTool	t
59	plugin	ObjFile	t
60	plugin	UI	t
61	demangle	AST	f
62	armasm	Arg	t
63	arm64asm	Arg	f
64	ppc64asm	Arg	t
65	x86asm	Arg	f
66	unix	Sockaddr	f
67	debug	Log	t
68	svc	Handler	t
69	windows	Sockaddr	f
70	analysis	Analyzer	t
71	analysis	Fact	t
72	analysisflags	Value	t
73	unitchecker	Analyzer	t
74	flate	Resetter	t
75	flate	Reader	t
76	zlib	Resetter	t
77	heap	Interface	t
78	list	Value	t
79	ring	Value	t
80	context	Context	t
81	cipher	Block	t
82	cipher	Stream	t
83	cipher	BlockMode	t
84	cipher	AEAD	t
85	crypto	PublicKey	t
86	crypto	PrivateKey	t
87	crypto	Signer	t
88	crypto	SignerOpts	t
89	crypto	Decrypter	t
90	crypto	DecrypterOpts	t
91	elliptic	Curve	t
92	tls	ClientSessionCache	t
93	pkix	Value	t
94	x509	PublicKey	t
95	x509	PublicKey	t
96	driver	Value	t
97	driver	Driver	t
98	driver	DriverContext	t
99	driver	Connector	t
100	driver	Pinger	t
101	driver	Execer	t
102	driver	ExecerContext	t
103	driver	Queryer	t
104	driver	QueryerContext	t
105	driver	Conn	t
106	driver	ConnPrepareContext	t
107	driver	ConnBeginTx	t
108	driver	SessionResetter	t
109	driver	Result	t
110	driver	Stmt	t
111	driver	StmtExecContext	t
112	driver	StmtQueryContext	t
113	driver	NamedValueChecker	t
114	driver	ColumnConverter	t
115	driver	Rows	t
116	driver	RowsNextResultSet	t
117	driver	RowsColumnTypeScanType	t
118	driver	RowsColumnTypeDatabaseTypeName	t
119	driver	RowsColumnTypeLength	t
120	driver	RowsColumnTypeNullable	t
121	driver	RowsColumnTypePrecisionScale	t
122	driver	Tx	t
123	driver	ValueConverter	t
124	driver	Valuer	t
125	sql	Value	t
126	sql	Scanner	t
127	sql	Dest	t
128	sql	Result	t
129	dwarf	Val	t
130	dwarf	Type	t
131	macho	Load	t
132	pe	OptionalHeader	t
133	binary	ByteOrder	t
134	encoding	BinaryMarshaler	t
135	encoding	BinaryUnmarshaler	t
136	encoding	TextMarshaler	t
137	encoding	TextUnmarshaler	t
138	gob	GobEncoder	t
139	gob	GobDecoder	t
140	json	Unmarshaler	t
141	json	Marshaler	t
142	json	Token	t
143	xml	Marshaler	t
144	xml	MarshalerAttr	t
145	xml	Unmarshaler	t
146	xml	UnmarshalerAttr	t
147	xml	Token	t
148	xml	TokenReader	t
149	expvar	Var	t
150	flag	Value	t
151	flag	Getter	t
152	fmt	State	t
153	fmt	Formatter	t
154	fmt	Stringer	t
155	fmt	GoStringer	t
156	fmt	ScanState	t
157	fmt	Scanner	t
158	ast	Node	t
159	ast	Expr	f
160	ast	Stmt	f
161	ast	Decl	f
162	ast	Spec	f
163	ast	Decl	t
164	ast	Data	t
165	ast	Type	t
166	ast	Visitor	t
167	constant	Value	f
168	error1	I0	f
169	error1	ExportedField	f
170	error2	I0	f
171	error2	ExportedField	f
172	aliases	T3	f
173	aliases	A13	f
174	exports	T12	t
175	exports	T13	f
176	exports	T14	f
177	p	V	t
178	issue25301	A	t
179	issue25301	T	t
180	issue25596	E	t
181	issue25596	T	t
182	printer	Node	t
183	types	Importer	t
184	types	ImporterFrom	t
185	types	Object	f
186	types	Sizes	t
187	types	Type	t
188	hash	Hash	t
189	hash	Hash32	t
190	hash	Hash64	t
191	color	Color	t
192	color	Model	t
193	draw	Image	t
194	draw	Quantizer	t
195	draw	Drawer	t
196	image	Image	t
197	image	PalettedImage	t
198	jpeg	Reader	t
199	png	EncoderBufferPool	t
200	singleflight	Val	t
201	testlog	Interface	t
202	cryptobyte	MarshalingValue	t
203	dnsmessage	ResourceBody	f
204	lif	Addr	t
205	route	Addr	t
206	route	Message	t
207	route	Sys	t
208	transform	Transformer	t
209	transform	SpanningTransformer	t
210	io	Reader	t
211	io	Writer	t
212	io	Closer	t
213	io	Seeker	t
214	io	ReadWriter	t
215	io	ReadCloser	t
216	io	WriteCloser	t
217	io	ReadWriteCloser	t
218	io	ReadSeeker	t
219	io	WriteSeeker	t
220	io	ReadWriteSeeker	t
221	io	ReaderFrom	t
222	io	WriterTo	t
223	io	ReaderAt	t
224	io	WriterAt	t
225	io	ByteReader	t
226	io	ByteScanner	t
227	io	ByteWriter	t
228	io	RuneReader	t
229	io	RuneScanner	t
230	io	StringWriter	t
231	rand	Source	t
232	rand	Source64	t
233	multipart	File	t
234	http	RoundTripper	t
235	cookiejar	PublicSuffixList	t
236	http	FileSystem	t
237	http	File	t
238	http	I	f
239	http	Pusher	t
240	httputil	BufferPool	t
241	http	CookieJar	t
242	http	Handler	t
243	http	ResponseWriter	t
244	http	Flusher	t
245	http	Hijacker	t
246	http	CloseNotifier	t
247	net	Addr	t
248	net	Conn	t
249	net	PacketConn	t
250	net	Listener	t
251	net	Error	f
252	rpc	Args	t
253	rpc	Reply	t
254	rpc	ClientCodec	t
255	jsonrpc	Error	t
256	jsonrpc	Result	t
257	jsonrpc	Error	t
258	rpc	ServerCodec	t
259	smtp	Auth	t
260	os	Signal	t
261	os	FileInfo	t
262	plugin	Symbol	t
263	reflect	Type	f
264	runtime	Error	f
265	sort	Interface	t
266	sync	Locker	t
267	js	Wrapper	t
268	js	TypedArray	t
269	syscall	RawConn	t
270	syscall	Conn	t
271	syscall	Sockaddr	t
272	syscall	Sockaddr	f
273	syscall	RoutingMessage	f
274	syscall	RoutingMessage	f
275	syscall	Sockaddr	f
276	syscall	Sockaddr	f
277	quick	Generator	t
278	testing	TB	f
279	parse	Node	f
\.


--
-- Name: concrete_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_methods_id_seq', 4138, true);


--
-- Name: concrete_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_types_id_seq', 6096, true);


--
-- Name: interface_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interface_methods_id_seq', 531, true);


--
-- Name: interfaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interfaces_id_seq', 279, true);


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

