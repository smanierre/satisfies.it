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
175	gc	Mul	{*gc.Mpcplx}	{}	*Mpcplx	84
176	gc	Div	{*gc.Mpcplx}	{bool}	*Mpcplx	84
177	gc	SetOverflow	{}	{}	*Mpint	85
178	gc	Set	{*gc.Mpint}	{}	*Mpint	85
179	gc	SetFloat	{*gc.Mpflt}	{bool}	*Mpint	85
180	gc	Add	{*gc.Mpint}	{}	*Mpint	85
181	gc	Sub	{*gc.Mpint}	{}	*Mpint	85
182	gc	Mul	{*gc.Mpint}	{}	*Mpint	85
183	gc	Quo	{*gc.Mpint}	{}	*Mpint	85
184	gc	Rem	{*gc.Mpint}	{}	*Mpint	85
185	gc	Or	{*gc.Mpint}	{}	*Mpint	85
186	gc	And	{*gc.Mpint}	{}	*Mpint	85
187	gc	AndNot	{*gc.Mpint}	{}	*Mpint	85
188	gc	Xor	{*gc.Mpint}	{}	*Mpint	85
189	gc	Lsh	{*gc.Mpint}	{}	*Mpint	85
190	gc	Rsh	{*gc.Mpint}	{}	*Mpint	85
191	gc	Cmp	{*gc.Mpint}	{int}	*Mpint	85
192	gc	CmpInt64	{int64}	{int}	*Mpint	85
193	gc	Neg	{}	{}	*Mpint	85
194	gc	Int64	{}	{int64}	*Mpint	85
195	gc	SetInt64	{int64}	{}	*Mpint	85
196	gc	SetString	{string}	{}	*Mpint	85
197	gc	String	{}	{string}	*Mpint	85
198	gc	Get	{*ssa.Value}	{gc.LivenessIndex}	LivenessMap	89
199	gc	Valid	{}	{bool}	LivenessIndex	90
200	gc	Prog	{obj.As}	{*obj.Prog}	*SSAGenState	96
201	gc	Pc	{}	{*obj.Prog}	*SSAGenState	96
202	gc	SetPos	{src.XPos}	{}	*SSAGenState	96
203	gc	Br	{obj.As,*ssa.Block}	{*obj.Prog}	*SSAGenState	96
204	gc	DebugFriendlySetPosFrom	{*ssa.Value}	{}	*SSAGenState	96
205	gc	FPJump	{*ssa.Block,*ssa.Block,*[][]gc.FloatingEQNEJump}	{}	*SSAGenState	96
206	gc	AddrScratch	{*obj.Addr}	{}	*SSAGenState	96
207	gc	Call	{*ssa.Value}	{*obj.Prog}	*SSAGenState	96
208	gc	PrepareCall	{*ssa.Value}	{}	*SSAGenState	96
209	gc	Int64	{}	{int64}	*Node	101
210	gc	CanInt64	{}	{bool}	*Node	101
211	gc	Bool	{}	{bool}	*Node	101
212	gc	Format	{fmt.State,rune}	{}	*Node	101
213	gc	String	{}	{string}	*Node	101
214	gc	Typ	{}	{*types.Type}	*Node	101
215	gc	StorageClass	{}	{ssa.StorageClass}	*Node	101
216	gc	IsMethod	{}	{bool}	*Node	101
217	gc	SliceBounds	{}	{*gc.Node}	*Node	101
218	gc	SetSliceBounds	{*gc.Node,*gc.Node,*gc.Node}	{}	*Node	101
219	gc	ResetAux	{}	{}	*Node	101
220	gc	SubOp	{}	{gc.Op}	*Node	101
221	gc	SetSubOp	{gc.Op}	{}	*Node	101
222	gc	IndexMapLValue	{}	{bool}	*Node	101
223	gc	SetIndexMapLValue	{bool}	{}	*Node	101
224	gc	TChanDir	{}	{types.ChanDir}	*Node	101
225	gc	SetTChanDir	{types.ChanDir}	{}	*Node	101
226	gc	IsSynthetic	{}	{bool}	*Node	101
227	gc	IsAutoTmp	{}	{bool}	*Node	101
228	gc	Class	{}	{gc.Class}	*Node	101
229	gc	Walkdef	{}	{uint8}	*Node	101
230	gc	Typecheck	{}	{uint8}	*Node	101
231	gc	Initorder	{}	{uint8}	*Node	101
232	gc	HasBreak	{}	{bool}	*Node	101
233	gc	IsClosureVar	{}	{bool}	*Node	101
234	gc	NoInline	{}	{bool}	*Node	101
235	gc	IsOutputParamHeapAddr	{}	{bool}	*Node	101
236	gc	Assigned	{}	{bool}	*Node	101
237	gc	Addrtaken	{}	{bool}	*Node	101
238	gc	Implicit	{}	{bool}	*Node	101
239	gc	Isddd	{}	{bool}	*Node	101
240	gc	Diag	{}	{bool}	*Node	101
241	gc	Colas	{}	{bool}	*Node	101
242	gc	NonNil	{}	{bool}	*Node	101
243	gc	Noescape	{}	{bool}	*Node	101
244	gc	Bounded	{}	{bool}	*Node	101
245	gc	Addable	{}	{bool}	*Node	101
246	gc	HasCall	{}	{bool}	*Node	101
247	gc	Likely	{}	{bool}	*Node	101
248	gc	HasVal	{}	{bool}	*Node	101
249	gc	HasOpt	{}	{bool}	*Node	101
250	gc	Embedded	{}	{bool}	*Node	101
251	gc	InlFormal	{}	{bool}	*Node	101
252	gc	InlLocal	{}	{bool}	*Node	101
253	gc	SetClass	{gc.Class}	{}	*Node	101
254	gc	SetWalkdef	{uint8}	{}	*Node	101
255	gc	SetTypecheck	{uint8}	{}	*Node	101
256	gc	SetInitorder	{uint8}	{}	*Node	101
257	gc	SetHasBreak	{bool}	{}	*Node	101
258	gc	SetIsClosureVar	{bool}	{}	*Node	101
259	gc	SetNoInline	{bool}	{}	*Node	101
260	gc	SetIsOutputParamHeapAddr	{bool}	{}	*Node	101
261	gc	SetAssigned	{bool}	{}	*Node	101
262	gc	SetAddrtaken	{bool}	{}	*Node	101
263	gc	SetImplicit	{bool}	{}	*Node	101
264	gc	SetIsddd	{bool}	{}	*Node	101
265	gc	SetDiag	{bool}	{}	*Node	101
266	gc	SetColas	{bool}	{}	*Node	101
267	gc	SetNonNil	{bool}	{}	*Node	101
268	gc	SetNoescape	{bool}	{}	*Node	101
269	gc	SetBounded	{bool}	{}	*Node	101
270	gc	SetAddable	{bool}	{}	*Node	101
271	gc	SetHasCall	{bool}	{}	*Node	101
272	gc	SetLikely	{bool}	{}	*Node	101
273	gc	SetHasVal	{bool}	{}	*Node	101
274	gc	SetHasOpt	{bool}	{}	*Node	101
275	gc	SetEmbedded	{bool}	{}	*Node	101
276	gc	SetInlFormal	{bool}	{}	*Node	101
277	gc	SetInlLocal	{bool}	{}	*Node	101
278	gc	Val	{}	{gc.Val}	*Node	101
279	gc	SetVal	{gc.Val}	{}	*Node	101
280	gc	Opt	{}	{"interface{}"}	*Node	101
281	gc	SetOpt	{"interface{}"}	{}	*Node	101
282	gc	Iota	{}	{int64}	*Node	101
283	gc	SetIota	{int64}	{}	*Node	101
284	gc	Line	{}	{string}	*Node	101
285	gc	Captured	{}	{bool}	*Name	102
286	gc	Readonly	{}	{bool}	*Name	102
287	gc	Byval	{}	{bool}	*Name	102
288	gc	Needzero	{}	{bool}	*Name	102
289	gc	Keepalive	{}	{bool}	*Name	102
290	gc	AutoTemp	{}	{bool}	*Name	102
291	gc	Used	{}	{bool}	*Name	102
292	gc	SetCaptured	{bool}	{}	*Name	102
293	gc	SetReadonly	{bool}	{}	*Name	102
294	gc	SetByval	{bool}	{}	*Name	102
295	gc	SetNeedzero	{bool}	{}	*Name	102
296	gc	SetKeepalive	{bool}	{}	*Name	102
297	gc	SetAutoTemp	{bool}	{}	*Name	102
298	gc	SetUsed	{bool}	{}	*Name	102
299	gc	Dupok	{}	{bool}	*Func	104
300	gc	Wrapper	{}	{bool}	*Func	104
301	gc	Needctxt	{}	{bool}	*Func	104
302	gc	ReflectMethod	{}	{bool}	*Func	104
303	gc	IsHiddenClosure	{}	{bool}	*Func	104
304	gc	HasDefer	{}	{bool}	*Func	104
305	gc	NilCheckDisabled	{}	{bool}	*Func	104
306	gc	InlinabilityChecked	{}	{bool}	*Func	104
307	gc	ExportInline	{}	{bool}	*Func	104
308	gc	InstrumentBody	{}	{bool}	*Func	104
309	gc	SetDupok	{bool}	{}	*Func	104
310	gc	SetWrapper	{bool}	{}	*Func	104
311	gc	SetNeedctxt	{bool}	{}	*Func	104
312	gc	SetReflectMethod	{bool}	{}	*Func	104
313	gc	SetIsHiddenClosure	{bool}	{}	*Func	104
314	gc	SetHasDefer	{bool}	{}	*Func	104
315	gc	SetNilCheckDisabled	{bool}	{}	*Func	104
316	gc	SetInlinabilityChecked	{bool}	{}	*Func	104
317	gc	SetExportInline	{bool}	{}	*Func	104
318	gc	SetInstrumentBody	{bool}	{}	*Func	104
319	gc	GoString	{}	{string}	Op	108
320	gc	Format	{fmt.State,rune}	{}	Op	108
321	gc	String	{}	{string}	Op	108
322	gc	IsSlice3	{}	{bool}	Op	108
323	gc	Format	{fmt.State,rune}	{}	Nodes	109
324	gc	String	{}	{string}	Nodes	109
325	gc	Slice	{}	{[]*gc.Node}	Nodes	109
326	gc	Len	{}	{int}	Nodes	109
327	gc	Index	{int}	{*gc.Node}	Nodes	109
328	gc	First	{}	{*gc.Node}	Nodes	109
329	gc	Second	{}	{*gc.Node}	Nodes	109
330	gc	Set	{[]*gc.Node}	{}	*Nodes	109
331	gc	Set1	{*gc.Node}	{}	*Nodes	109
332	gc	Set2	{*gc.Node,*gc.Node}	{}	*Nodes	109
333	gc	Set3	{*gc.Node,*gc.Node,*gc.Node}	{}	*Nodes	109
334	gc	MoveNodes	{*gc.Nodes}	{}	*Nodes	109
335	gc	SetIndex	{int,*gc.Node}	{}	Nodes	109
336	gc	SetFirst	{*gc.Node}	{}	Nodes	109
337	gc	SetSecond	{*gc.Node}	{}	Nodes	109
338	gc	Addr	{int}	{**gc.Node}	Nodes	109
339	gc	Append	{...*gc.Node}	{}	*Nodes	109
340	gc	Prepend	{...*gc.Node}	{}	*Nodes	109
341	gc	AppendNodes	{*gc.Nodes}	{}	*Nodes	109
342	main	F	{}	{}	*S	111
343	main	F	{}	{}	*T	112
344	gc	Start	{...string}	{}	*Timings	188
345	gc	Stop	{...string}	{}	*Timings	188
346	gc	AddEvent	{int64,string}	{}	*Timings	188
347	gc	Write	{io.Writer,string}	{}	*Timings	188
348	ssa	String	{}	{string}	*Block	189
349	ssa	LongString	{}	{string}	*Block	189
350	ssa	SetControl	{*ssa.Value}	{}	*Block	189
351	ssa	AddEdgeTo	{*ssa.Block}	{}	*Block	189
352	ssa	LackingPos	{}	{bool}	*Block	189
353	ssa	Logf	{string,"...interface{}"}	{}	*Block	189
354	ssa	Log	{}	{bool}	*Block	189
355	ssa	Fatalf	{string,"...interface{}"}	{}	*Block	189
356	ssa	NewValue0	{src.XPos,ssa.Op,*types.Type}	{*ssa.Value}	*Block	189
357	ssa	NewValue0I	{src.XPos,ssa.Op,*types.Type,int64}	{*ssa.Value}	*Block	189
358	ssa	NewValue0A	{src.XPos,ssa.Op,*types.Type,"interface{}"}	{*ssa.Value}	*Block	189
359	ssa	NewValue0IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}"}	{*ssa.Value}	*Block	189
360	ssa	NewValue1	{src.XPos,ssa.Op,*types.Type,*ssa.Value}	{*ssa.Value}	*Block	189
361	ssa	NewValue1I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Block	189
362	ssa	NewValue1A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	189
363	ssa	NewValue1IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	189
364	ssa	NewValue2	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	189
365	ssa	NewValue2A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	189
366	ssa	NewValue2I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	189
367	ssa	NewValue2IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}",*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	189
368	ssa	NewValue3	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	189
369	ssa	NewValue3I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	189
370	ssa	NewValue3A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	189
371	ssa	NewValue4	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	189
372	ssa	HTML	{}	{string}	*Block	189
373	ssa	LongHTML	{}	{string}	*Block	189
374	ssa	Block	{}	{*ssa.Block}	Edge	190
375	ssa	Index	{}	{int}	Edge	190
376	ssa	String	{}	{string}	BlockKind	191
377	ssa	Reset	{}	{}	*Cache	193
378	ssa	Set387	{bool}	{}	*Config	194
379	ssa	Ctxt	{}	{*obj.Link}	*Config	194
380	ssa	SetTypPtrs	{}	{}	*Types	195
381	ssa	PutLocationList	{[]byte,*obj.Link,*obj.LSym,*obj.LSym}	{}	*FuncDebug	202
382	ssa	NumBlocks	{}	{int}	*Func	207
383	ssa	NumValues	{}	{int}	*Func	207
384	ssa	LogStat	{string,"...interface{}"}	{}	*Func	207
385	ssa	NewBlock	{ssa.BlockKind}	{*ssa.Block}	*Func	207
386	ssa	ConstBool	{*types.Type,bool}	{*ssa.Value}	*Func	207
387	ssa	ConstInt8	{*types.Type,int8}	{*ssa.Value}	*Func	207
388	ssa	ConstInt16	{*types.Type,int16}	{*ssa.Value}	*Func	207
389	ssa	ConstInt32	{*types.Type,int32}	{*ssa.Value}	*Func	207
390	ssa	ConstInt64	{*types.Type,int64}	{*ssa.Value}	*Func	207
391	ssa	ConstFloat32	{*types.Type,float64}	{*ssa.Value}	*Func	207
392	ssa	ConstFloat64	{*types.Type,float64}	{*ssa.Value}	*Func	207
393	ssa	ConstSlice	{*types.Type}	{*ssa.Value}	*Func	207
394	ssa	ConstInterface	{*types.Type}	{*ssa.Value}	*Func	207
395	ssa	ConstNil	{*types.Type}	{*ssa.Value}	*Func	207
396	ssa	ConstEmptyString	{*types.Type}	{*ssa.Value}	*Func	207
397	ssa	ConstOffPtrSP	{*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Func	207
398	ssa	Frontend	{}	{ssa.Frontend}	*Func	207
399	ssa	Warnl	{src.XPos,string,"...interface{}"}	{}	*Func	207
400	ssa	Logf	{string,"...interface{}"}	{}	*Func	207
401	ssa	Log	{}	{bool}	*Func	207
402	ssa	Fatalf	{string,"...interface{}"}	{}	*Func	207
403	ssa	Postorder	{}	{[]*ssa.Block}	*Func	207
404	ssa	Idom	{}	{[]*ssa.Block}	*Func	207
405	ssa	DebugHashMatch	{string,string}	{bool}	*Func	207
406	ssa	HTML	{}	{string}	*Func	207
407	ssa	String	{}	{string}	*Func	207
408	main	Len	{}	{int}	ArchsByName	208
409	main	Swap	{int,int}	{}	ArchsByName	208
410	main	Less	{int,int}	{bool}	ArchsByName	208
411	main	String	{}	{string}	Rule	209
412	ssa	Close	{}	{}	*HTMLWriter	210
413	ssa	WriteFunc	{string,string,*ssa.Func}	{}	*HTMLWriter	210
414	ssa	WriteColumn	{string,string,string,string}	{}	*HTMLWriter	210
415	ssa	Printf	{string,"...interface{}"}	{}	*HTMLWriter	210
416	ssa	WriteString	{string}	{}	*HTMLWriter	210
417	ssa	String	{}	{string}	*Register	213
418	ssa	ObjNum	{}	{int16}	*Register	213
419	ssa	GCNum	{}	{int16}	*Register	213
420	ssa	String	{}	{string}	LocalSlot	214
421	ssa	String	{}	{string}	LocPair	215
422	ssa	Asm	{}	{obj.As}	Op	216
423	ssa	String	{}	{string}	Op	216
424	ssa	UsesScratch	{}	{bool}	Op	216
425	ssa	SymEffect	{}	{ssa.SymEffect}	Op	216
426	ssa	IsCall	{}	{bool}	Op	216
427	ssa	Val	{}	{int64}	ValAndOff	218
428	ssa	Off	{}	{int64}	ValAndOff	218
429	ssa	Int64	{}	{int64}	ValAndOff	218
430	ssa	String	{}	{string}	ValAndOff	218
431	ssa	String	{}	{string}	*RBTint32	219
432	ssa	IsEmpty	{}	{bool}	*RBTint32	219
433	ssa	IsSingle	{}	{bool}	*RBTint32	219
434	ssa	VisitInOrder	{"func(int32, interface{})"}	{}	*RBTint32	219
435	ssa	Find	{int32}	{"interface{}"}	*RBTint32	219
436	ssa	Insert	{int32,"interface{}"}	{"interface{}"}	*RBTint32	219
437	ssa	Min	{}	{int32,"interface{}"}	*RBTint32	219
438	ssa	Max	{}	{int32,"interface{}"}	*RBTint32	219
439	ssa	Glb	{int32}	{int32,"interface{}"}	*RBTint32	219
440	ssa	GlbEq	{int32}	{int32,"interface{}"}	*RBTint32	219
441	ssa	Lub	{int32}	{int32,"interface{}"}	*RBTint32	219
442	ssa	LubEq	{int32}	{int32,"interface{}"}	*RBTint32	219
443	ssa	Len	{}	{int}	ValHeap	220
444	ssa	Swap	{int,int}	{}	ValHeap	220
445	ssa	Push	{"interface{}"}	{}	*ValHeap	220
446	ssa	Pop	{}	{"interface{}"}	*ValHeap	220
447	ssa	Less	{int,int}	{bool}	ValHeap	220
448	ssa	String	{}	{string}	*SparseTreeNode	221
449	ssa	Entry	{}	{int32}	*SparseTreeNode	221
450	ssa	Exit	{}	{int32}	*SparseTreeNode	221
451	ssa	Sibling	{*ssa.Block}	{*ssa.Block}	SparseTree	222
452	ssa	Child	{*ssa.Block}	{*ssa.Block}	SparseTree	222
453	ssa	Insert	{*ssa.Block,int32,"interface{}",*ssa.SparseTreeHelper}	{}	*SparseTreeMap	223
454	ssa	Find	{*ssa.Block,int32,*ssa.SparseTreeHelper}	{"interface{}"}	*SparseTreeMap	223
455	ssa	String	{}	{string}	*SparseTreeMap	223
456	ssa	NewTree	{}	{*ssa.SparseTreeMap}	*SparseTreeHelper	224
457	ssa	HTML	{}	{string}	*Value	225
458	ssa	LongHTML	{}	{string}	*Value	225
459	ssa	String	{}	{string}	*Value	225
460	ssa	AuxInt8	{}	{int8}	*Value	225
461	ssa	AuxInt16	{}	{int16}	*Value	225
462	ssa	AuxInt32	{}	{int32}	*Value	225
463	ssa	AuxUnsigned	{}	{uint64}	*Value	225
464	ssa	AuxFloat	{}	{float64}	*Value	225
465	ssa	AuxValAndOff	{}	{ssa.ValAndOff}	*Value	225
466	ssa	LongString	{}	{string}	*Value	225
467	ssa	AddArg	{*ssa.Value}	{}	*Value	225
468	ssa	AddArgs	{...*ssa.Value}	{}	*Value	225
469	ssa	SetArg	{int,*ssa.Value}	{}	*Value	225
470	ssa	RemoveArg	{int}	{}	*Value	225
471	ssa	SetArgs1	{*ssa.Value}	{}	*Value	225
472	ssa	SetArgs2	{*ssa.Value,*ssa.Value}	{}	*Value	225
473	ssa	Logf	{string,"...interface{}"}	{}	*Value	225
474	ssa	Log	{}	{bool}	*Value	225
475	ssa	Fatalf	{string,"...interface{}"}	{}	*Value	225
476	ssa	Reg	{}	{int16}	*Value	225
477	ssa	Reg0	{}	{int16}	*Value	225
478	ssa	Reg1	{}	{int16}	*Value	225
479	ssa	RegName	{}	{string}	*Value	225
480	ssa	MemoryArg	{}	{*ssa.Value}	*Value	225
481	ssa	LackingPos	{}	{bool}	*Value	225
482	syntax	IsKnown	{}	{bool}	Pos	282
483	syntax	Base	{}	{*syntax.PosBase}	Pos	282
484	syntax	Line	{}	{uint}	Pos	282
485	syntax	Col	{}	{uint}	Pos	282
486	syntax	RelFilename	{}	{string}	Pos	282
487	syntax	RelLine	{}	{uint}	Pos	282
488	syntax	RelCol	{}	{uint}	Pos	282
489	syntax	String	{}	{string}	Pos	282
490	syntax	IsFileBase	{}	{bool}	*PosBase	283
491	syntax	Pos	{}	{syntax.Pos}	*PosBase	283
492	syntax	Filename	{}	{string}	*PosBase	283
493	syntax	Line	{}	{uint}	*PosBase	283
494	syntax	Col	{}	{uint}	*PosBase	283
495	syntax	Error	{}	{string}	Error	285
496	syntax	Error	{}	{string}	*Error	285
497	syntax	String	{}	{string}	Operator	290
498	types	Lookup	{string}	{*types.Sym}	*Pkg	291
499	types	LookupOK	{string}	{*types.Sym,bool}	*Pkg	291
500	types	LookupBytes	{[]byte}	{*types.Sym}	*Pkg	291
501	types	PkgDef	{}	{*types.Node}	*Sym	292
502	types	SetPkgDef	{*types.Node}	{}	*Sym	292
503	types	OnExportList	{}	{bool}	*Sym	292
504	types	Uniq	{}	{bool}	*Sym	292
505	types	Siggen	{}	{bool}	*Sym	292
506	types	Asm	{}	{bool}	*Sym	292
507	types	AlgGen	{}	{bool}	*Sym	292
508	types	SetOnExportList	{bool}	{}	*Sym	292
509	types	SetUniq	{bool}	{}	*Sym	292
510	types	SetSiggen	{bool}	{}	*Sym	292
511	types	SetAsm	{bool}	{}	*Sym	292
512	types	SetAlgGen	{bool}	{}	*Sym	292
513	types	IsBlank	{}	{bool}	*Sym	292
514	types	LinksymName	{}	{string}	*Sym	292
515	types	Linksym	{}	{*obj.LSym}	*Sym	292
516	types	Less	{*types.Sym}	{bool}	*Sym	292
517	types	String	{}	{string}	*Sym	292
518	types	Format	{fmt.State,rune}	{}	*Sym	292
519	types	String	{}	{string}	EType	294
520	types	CanRecv	{}	{bool}	ChanDir	295
521	types	CanSend	{}	{bool}	ChanDir	295
522	types	NotInHeap	{}	{bool}	*Type	296
523	types	Broke	{}	{bool}	*Type	296
524	types	Noalg	{}	{bool}	*Type	296
525	types	Deferwidth	{}	{bool}	*Type	296
526	types	Recur	{}	{bool}	*Type	296
527	types	SetNotInHeap	{bool}	{}	*Type	296
528	types	SetBroke	{bool}	{}	*Type	296
529	types	SetNoalg	{bool}	{}	*Type	296
530	types	SetDeferwidth	{bool}	{}	*Type	296
531	types	SetRecur	{bool}	{}	*Type	296
532	types	Pkg	{}	{*types.Pkg}	*Type	296
533	types	SetPkg	{*types.Pkg}	{}	*Type	296
534	types	MapType	{}	{*types.Map}	*Type	296
535	types	ForwardType	{}	{*types.Forward}	*Type	296
536	types	FuncType	{}	{*types.Func}	*Type	296
537	types	StructType	{}	{*types.Struct}	*Type	296
538	types	ChanType	{}	{*types.Chan}	*Type	296
539	types	Recvs	{}	{*types.Type}	*Type	296
540	types	Params	{}	{*types.Type}	*Type	296
541	types	Results	{}	{*types.Type}	*Type	296
542	types	NumRecvs	{}	{int}	*Type	296
543	types	NumParams	{}	{int}	*Type	296
544	types	NumResults	{}	{int}	*Type	296
545	types	IsVariadic	{}	{bool}	*Type	296
546	types	Recv	{}	{*types.Field}	*Type	296
547	types	Key	{}	{*types.Type}	*Type	296
548	types	Elem	{}	{*types.Type}	*Type	296
549	types	DDDField	{}	{*types.Type}	*Type	296
550	types	ChanArgs	{}	{*types.Type}	*Type	296
551	types	FuncArgs	{}	{*types.Type}	*Type	296
552	types	Nname	{}	{*types.Node}	*Type	296
553	types	SetNname	{*types.Node}	{}	*Type	296
554	types	IsFuncArgStruct	{}	{bool}	*Type	296
555	types	Methods	{}	{*types.Fields}	*Type	296
556	types	AllMethods	{}	{*types.Fields}	*Type	296
557	types	Fields	{}	{*types.Fields}	*Type	296
558	types	Field	{int}	{*types.Field}	*Type	296
559	types	FieldSlice	{}	{[]*types.Field}	*Type	296
560	types	SetFields	{[]*types.Field}	{}	*Type	296
561	types	SetInterface	{[]*types.Field}	{}	*Type	296
562	types	IsDDDArray	{}	{bool}	*Type	296
563	types	WidthCalculated	{}	{bool}	*Type	296
564	types	ArgWidth	{}	{int64}	*Type	296
565	types	Size	{}	{int64}	*Type	296
566	types	Alignment	{}	{int64}	*Type	296
567	types	SimpleString	{}	{string}	*Type	296
568	types	Compare	{*types.Type}	{types.Cmp}	*Type	296
569	types	IsKind	{types.EType}	{bool}	*Type	296
570	types	IsBoolean	{}	{bool}	*Type	296
571	types	ToUnsigned	{}	{*types.Type}	*Type	296
572	types	IsInteger	{}	{bool}	*Type	296
573	types	IsSigned	{}	{bool}	*Type	296
574	types	IsFloat	{}	{bool}	*Type	296
575	types	IsComplex	{}	{bool}	*Type	296
576	types	IsPtr	{}	{bool}	*Type	296
577	types	IsUnsafePtr	{}	{bool}	*Type	296
578	types	IsPtrShaped	{}	{bool}	*Type	296
579	types	IsString	{}	{bool}	*Type	296
580	types	IsMap	{}	{bool}	*Type	296
581	types	IsChan	{}	{bool}	*Type	296
582	types	IsSlice	{}	{bool}	*Type	296
583	types	IsArray	{}	{bool}	*Type	296
584	types	IsStruct	{}	{bool}	*Type	296
585	types	IsInterface	{}	{bool}	*Type	296
586	types	IsEmptyInterface	{}	{bool}	*Type	296
587	types	PtrTo	{}	{*types.Type}	*Type	296
588	types	NumFields	{}	{int}	*Type	296
589	types	FieldType	{int}	{*types.Type}	*Type	296
590	types	FieldOff	{int}	{int64}	*Type	296
591	types	FieldName	{int}	{string}	*Type	296
592	types	NumElem	{}	{int64}	*Type	296
593	types	SetNumElem	{int64}	{}	*Type	296
594	types	NumComponents	{types.componentsIncludeBlankFields}	{int64}	*Type	296
595	types	ChanDir	{}	{types.ChanDir}	*Type	296
596	types	IsMemory	{}	{bool}	*Type	296
597	types	IsFlags	{}	{bool}	*Type	296
598	types	IsVoid	{}	{bool}	*Type	296
599	types	IsTuple	{}	{bool}	*Type	296
600	types	IsUntyped	{}	{bool}	*Type	296
601	types	HasHeapPointer	{}	{bool}	*Type	296
602	types	Symbol	{}	{*obj.LSym}	*Type	296
603	types	Tie	{}	{byte}	*Type	296
604	types	String	{}	{string}	*Type	296
605	types	ShortString	{}	{string}	*Type	296
606	types	LongString	{}	{string}	*Type	296
607	types	Format	{fmt.State,rune}	{}	*Type	296
608	types	Key	{}	{types.Type}	*Map	297
609	types	Elem	{}	{types.Type}	*Map	297
610	types	Underlying	{}	{types.Type}	*Map	297
611	types	String	{}	{string}	*Map	297
612	types	FullName	{}	{string}	*Func	299
613	types	Scope	{}	{*types.Scope}	*Func	299
614	types	String	{}	{string}	*Func	299
615	types	NumFields	{}	{int}	*Struct	300
616	types	Field	{int}	{*types.Var}	*Struct	300
617	types	Tag	{int}	{string}	*Struct	300
618	types	Underlying	{}	{types.Type}	*Struct	300
619	types	String	{}	{string}	*Struct	300
620	types	NumExplicitMethods	{}	{int}	*Interface	302
621	types	ExplicitMethod	{int}	{*types.Func}	*Interface	302
622	types	NumEmbeddeds	{}	{int}	*Interface	302
623	types	Embedded	{int}	{*types.Named}	*Interface	302
624	types	EmbeddedType	{int}	{types.Type}	*Interface	302
625	types	NumMethods	{}	{int}	*Interface	302
626	types	Method	{int}	{*types.Func}	*Interface	302
627	types	Empty	{}	{bool}	*Interface	302
628	types	Complete	{}	{*types.Interface}	*Interface	302
629	types	Underlying	{}	{types.Type}	*Interface	302
630	types	String	{}	{string}	*Interface	302
631	types	Dir	{}	{types.ChanDir}	*Chan	307
632	types	Elem	{}	{types.Type}	*Chan	307
633	types	Underlying	{}	{types.Type}	*Chan	307
634	types	String	{}	{string}	*Chan	307
635	types	Len	{}	{int}	*Tuple	308
636	types	At	{int}	{*types.Var}	*Tuple	308
637	types	Underlying	{}	{types.Type}	*Tuple	308
638	types	String	{}	{string}	*Tuple	308
639	types	Len	{}	{int64}	*Array	309
640	types	Elem	{}	{types.Type}	*Array	309
641	types	Underlying	{}	{types.Type}	*Array	309
642	types	String	{}	{string}	*Array	309
643	types	Elem	{}	{types.Type}	*Slice	310
644	types	Underlying	{}	{types.Type}	*Slice	310
645	types	String	{}	{string}	*Slice	310
646	types	Isddd	{}	{bool}	*Field	311
647	types	Broke	{}	{bool}	*Field	311
648	types	Nointerface	{}	{bool}	*Field	311
649	types	SetIsddd	{bool}	{}	*Field	311
650	types	SetBroke	{bool}	{}	*Field	311
651	types	SetNointerface	{bool}	{}	*Field	311
652	types	End	{}	{int64}	*Field	311
653	types	Copy	{}	{*types.Field}	*Field	311
654	types	Len	{}	{int}	*Fields	312
655	types	Slice	{}	{[]*types.Field}	*Fields	312
656	types	Index	{int}	{*types.Field}	*Fields	312
657	types	Set	{[]*types.Field}	{}	*Fields	312
658	types	Append	{...*types.Field}	{}	*Fields	312
659	main	Visit	{ast.Node}	{ast.Visitor}	*FuncVisitor	317
660	main	Boundaries	{[]byte}	{[]main.Boundary}	*Profile	319
661	main	Reset	{}	{}	*Dirs	323
662	main	Next	{}	{main.Dir,bool}	*Dirs	323
663	main	Error	{}	{string}	PackageError	325
664	pkg	ExportedMethod	{int}	{bool}	ExportedType	327
665	base	LongName	{}	{string}	*Command	334
666	base	Name	{}	{string}	*Command	334
667	base	Usage	{}	{}	*Command	334
668	base	Runnable	{}	{bool}	*Command	334
669	base	Set	{string}	{error}	*StringsFlag	335
670	base	String	{}	{string}	*StringsFlag	335
671	cache	Get	{cache.ActionID}	{cache.Entry,error}	*Cache	338
672	cache	GetFile	{cache.ActionID}	{string,cache.Entry,error}	*Cache	338
673	cache	GetBytes	{cache.ActionID}	{[]byte,cache.Entry,error}	*Cache	338
674	cache	OutputFile	{cache.OutputID}	{string}	*Cache	338
675	cache	Trim	{}	{}	*Cache	338
676	cache	Put	{cache.ActionID,io.ReadSeeker}	{cache.OutputID,int64,error}	*Cache	338
677	cache	PutNoVerify	{cache.ActionID,io.ReadSeeker}	{cache.OutputID,int64,error}	*Cache	338
678	cache	PutBytes	{cache.ActionID,[]byte}	{error}	*Cache	338
679	cache	Write	{[]byte}	{int,error}	*Hash	340
680	cache	Sum	{}	{[]byte}	*Hash	340
681	get	Error	{}	{string}	ImportMismatchError	347
682	list	Write	{[]byte}	{int,error}	*TrackingWriter	349
683	list	Flush	{}	{}	*TrackingWriter	349
684	list	NeedNL	{}	{bool}	*TrackingWriter	349
685	load	Set	{string}	{error}	*PerPackageFlag	350
686	load	String	{}	{string}	*PerPackageFlag	350
687	load	Present	{}	{bool}	*PerPackageFlag	350
688	load	For	{*load.Package}	{[]string}	*PerPackageFlag	350
689	load	AllFiles	{}	{[]string}	*Package	351
690	load	Desc	{}	{string}	*Package	351
691	load	Resolve	{[]string}	{[]string}	*Package	351
692	load	InternalGoFiles	{}	{[]string}	*Package	351
693	load	InternalXGoFiles	{}	{[]string}	*Package	351
694	load	InternalAllGoFiles	{}	{[]string}	*Package	351
695	load	UsesSwig	{}	{bool}	*Package	351
696	load	UsesCgo	{}	{bool}	*Package	351
697	load	Error	{}	{string}	*NoGoError	354
698	load	Error	{}	{string}	*PackageError	356
699	load	Push	{string}	{}	*ImportStack	357
700	load	Pop	{}	{}	*ImportStack	357
701	load	Copy	{}	{[]string}	*ImportStack	357
702	codehost	Error	{}	{string}	*RunError	363
703	codehost	Error	{}	{string}	*VCSError	364
704	modfile	Comment	{}	{*modfile.Comments}	*Comments	370
705	modfile	Span	{}	{modfile.Position}	*FileSyntax	371
706	modfile	Cleanup	{}	{}	*FileSyntax	371
707	modfile	Span	{}	{modfile.Position}	*CommentBlock	372
708	modfile	Span	{}	{modfile.Position}	*Line	373
709	modfile	Span	{}	{modfile.Position}	*LineBlock	374
710	modfile	Span	{}	{modfile.Position}	*LParen	375
711	modfile	Span	{}	{modfile.Position}	*RParen	376
712	modfile	AddModuleStmt	{string}	{error}	*File	377
713	modfile	AddComment	{string}	{}	*File	377
714	modfile	Format	{}	{[]byte,error}	*File	377
715	modfile	Cleanup	{}	{}	*File	377
716	modfile	AddRequire	{string,string}	{error}	*File	377
717	modfile	AddNewRequire	{string,string,bool}	{}	*File	377
718	modfile	SetRequire	{[]*modfile.Require}	{}	*File	377
719	modfile	DropRequire	{string}	{error}	*File	377
720	modfile	AddExclude	{string,string}	{error}	*File	377
721	modfile	DropExclude	{string,string}	{error}	*File	377
722	modfile	AddReplace	{string,string,string,string}	{error}	*File	377
723	modfile	DropReplace	{string,string}	{error}	*File	377
724	modfile	SortBlocks	{}	{}	*File	377
725	modinfo	String	{}	{string}	*ModulePublic	384
726	modload	Error	{}	{string}	*ImportMissingError	386
727	mvs	Error	{}	{string}	*MissingModuleError	389
728	par	Add	{"interface{}"}	{}	*Work	390
729	par	Do	{int,"func(interface{})"}	{}	*Work	390
730	par	Do	{"interface{}","func() interface{}"}	{"interface{}"}	*Cache	391
731	par	Get	{"interface{}"}	{"interface{}"}	*Cache	391
732	web	Error	{}	{string}	*HTTPError	395
733	web	Error	{}	{string}	*HTTPError	395
734	work	Init	{}	{}	*Builder	399
735	work	NewObjdir	{}	{string}	*Builder	399
736	work	AutoAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	399
737	work	CompileAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	399
738	work	VetAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	399
739	work	LinkAction	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	399
740	work	Do	{*work.Action}	{}	*Builder	399
741	work	PkgconfigCmd	{}	{string}	*Builder	399
742	work	Showcmd	{string,string,"...interface{}"}	{}	*Builder	399
743	work	Mkdir	{string}	{error}	*Builder	399
744	work	Symlink	{string,string}	{error}	*Builder	399
745	work	GccCmd	{string,string}	{[]string}	*Builder	399
746	work	GxxCmd	{string,string}	{[]string}	*Builder	399
747	work	CFlags	{*load.Package}	{[]string,error}	*Builder	399
748	work	BuildActionID	{}	{string}	*Action	400
749	work	BuildContentID	{}	{string}	*Action	400
750	work	BuildID	{}	{string}	*Action	400
751	work	BuiltTarget	{}	{string}	*Action	400
752	bio	Seek	{int64,int}	{int64}	*Reader	406
753	bio	Offset	{}	{int64}	*Reader	406
754	bio	Close	{}	{error}	*Reader	406
755	bio	File	{}	{*os.File}	*Reader	406
756	bio	Seek	{int64,int}	{int64}	*Writer	407
757	bio	Offset	{}	{int64}	*Writer	407
758	bio	Close	{}	{error}	*Writer	407
759	bio	File	{}	{*os.File}	*Writer	407
760	dwarf	UnifyRanges	{*dwarf.Scope}	{}	*Scope	410
761	dwarf	Len	{}	{int}	VarsByOffset	418
762	dwarf	Less	{int,int}	{bool}	VarsByOffset	418
763	dwarf	Swap	{int,int}	{}	VarsByOffset	418
764	edit	Insert	{int,string}	{}	*Buffer	419
765	edit	Delete	{int,int}	{}	*Buffer	419
766	edit	Replace	{int,int,string}	{}	*Buffer	419
767	edit	Bytes	{}	{[]byte}	*Buffer	419
768	edit	String	{}	{string}	*Buffer	419
769	gcprog	Init	{func(byte)}	{}	*Writer	420
770	gcprog	Debug	{io.Writer}	{}	*Writer	420
771	gcprog	BitIndex	{}	{int64}	*Writer	420
772	gcprog	End	{}	{}	*Writer	420
773	gcprog	Ptr	{int64}	{}	*Writer	420
774	gcprog	ShouldRepeat	{int64,int64}	{bool}	*Writer	420
775	gcprog	Repeat	{int64,int64}	{}	*Writer	420
776	gcprog	ZeroUntil	{int64}	{}	*Writer	420
777	gcprog	Append	{[]byte,int64}	{}	*Writer	420
778	goobj	String	{}	{string}	SymID	422
779	goobj	String	{uint64}	{string}	*Reloc	424
780	obj	Add	{int,src.XPos,*obj.LSym}	{int}	*InlTree	434
781	obj	Parent	{int}	{int}	*InlTree	434
782	obj	InlinedFunction	{int}	{*obj.LSym}	*InlTree	434
783	obj	CallPos	{int}	{src.XPos}	*InlTree	434
784	obj	String	{}	{string}	AddrType	438
785	obj	From3Type	{}	{obj.AddrType}	*Prog	439
786	obj	GetFrom3	{}	{*obj.Addr}	*Prog	439
787	obj	SetFrom3	{obj.Addr}	{}	*Prog	439
788	obj	Line	{}	{string}	*Prog	439
789	obj	InnermostLineNumber	{}	{string}	*Prog	439
790	obj	InnermostLineNumberHTML	{}	{string}	*Prog	439
791	obj	InnermostFilename	{}	{string}	*Prog	439
792	obj	String	{}	{string}	*Prog	439
793	obj	InstructionString	{}	{string}	*Prog	439
794	obj	String	{}	{string}	As	440
795	obj	Grow	{int64}	{}	*LSym	441
796	obj	GrowCap	{int64}	{}	*LSym	441
797	obj	WriteFloat32	{*obj.Link,int64,float32}	{}	*LSym	441
798	obj	WriteFloat64	{*obj.Link,int64,float64}	{}	*LSym	441
799	obj	WriteInt	{*obj.Link,int64,int,int64}	{}	*LSym	441
800	obj	WriteAddr	{*obj.Link,int64,int,*obj.LSym,int64}	{}	*LSym	441
801	obj	WriteOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	441
802	obj	WriteWeakOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	441
803	obj	WriteString	{*obj.Link,int64,int,string}	{}	*LSym	441
804	obj	WriteBytes	{*obj.Link,int64,[]byte}	{int64}	*LSym	441
805	obj	String	{}	{string}	*LSym	441
806	obj	Len	{}	{int64}	*LSym	441
807	obj	DuplicateOK	{}	{bool}	Attribute	443
808	obj	MakeTypelink	{}	{bool}	Attribute	443
809	obj	CFunc	{}	{bool}	Attribute	443
810	obj	NoSplit	{}	{bool}	Attribute	443
811	obj	Leaf	{}	{bool}	Attribute	443
812	obj	SeenGlobl	{}	{bool}	Attribute	443
813	obj	OnList	{}	{bool}	Attribute	443
814	obj	ReflectMethod	{}	{bool}	Attribute	443
815	obj	Local	{}	{bool}	Attribute	443
816	obj	Wrapper	{}	{bool}	Attribute	443
817	obj	NeedCtxt	{}	{bool}	Attribute	443
818	obj	NoFrame	{}	{bool}	Attribute	443
819	obj	Static	{}	{bool}	Attribute	443
820	obj	WasInlined	{}	{bool}	Attribute	443
821	obj	Set	{obj.Attribute,bool}	{}	*Attribute	443
822	obj	TextAttrString	{}	{string}	Attribute	443
823	obj	OutermostPos	{src.XPos}	{src.Pos}	*Link	448
824	obj	InnermostPos	{src.XPos}	{src.Pos}	*Link	448
825	obj	AddImport	{string}	{}	*Link	448
826	obj	Diag	{string,"...interface{}"}	{}	*Link	448
827	obj	Logf	{string,"...interface{}"}	{}	*Link	448
828	obj	FixedFrameSize	{}	{int64}	*Link	448
829	obj	DwarfIntConst	{string,string,string,int64}	{}	*Link	448
830	obj	DwarfAbstractFunc	{"interface{}",*obj.LSym,string}	{}	*Link	448
831	obj	InitTextSym	{*obj.LSym,int}	{}	*Link	448
832	obj	Globl	{*obj.LSym,int64,int}	{}	*Link	448
833	obj	EmitEntryLiveness	{*obj.LSym,*obj.Prog,obj.ProgAlloc}	{*obj.Prog}	*Link	448
834	obj	LookupDerived	{*obj.LSym,string}	{*obj.LSym}	*Link	448
835	obj	LookupStatic	{string}	{*obj.LSym}	*Link	448
836	obj	Lookup	{string}	{*obj.LSym}	*Link	448
837	obj	LookupInit	{string,func(*obj.LSym)}	{*obj.LSym}	*Link	448
838	obj	Float32Sym	{float32}	{*obj.LSym}	*Link	448
839	obj	Float64Sym	{float64}	{*obj.LSym}	*Link	448
840	obj	Int64Sym	{int64}	{*obj.LSym}	*Link	448
841	obj	NewProg	{}	{*obj.Prog}	*Link	448
842	obj	CanReuseProgs	{}	{bool}	*Link	448
843	obj	GetPrecursorFunc	{*obj.LSym}	{"interface{}"}	*DwarfFixupTable	453
844	obj	SetPrecursorFunc	{*obj.LSym,"interface{}"}	{}	*DwarfFixupTable	453
845	obj	ReferenceChildDIE	{*obj.LSym,int,*obj.LSym,int,int}	{}	*DwarfFixupTable	453
846	obj	RegisterChildDIEOffsets	{*obj.LSym,[]*dwarf.Var,[]int32}	{}	*DwarfFixupTable	453
847	obj	AbsFuncDwarfSym	{*obj.LSym}	{*obj.LSym}	*DwarfFixupTable	453
848	obj	Finalize	{string,bool}	{}	*DwarfFixupTable	453
849	x86	Put1	{byte}	{}	*AsmBuf	460
850	x86	Put2	{byte,byte}	{}	*AsmBuf	460
851	x86	Put3	{byte,byte,byte}	{}	*AsmBuf	460
852	x86	Put4	{byte,byte,byte,byte}	{}	*AsmBuf	460
853	x86	PutInt16	{int16}	{}	*AsmBuf	460
854	x86	PutInt32	{int32}	{}	*AsmBuf	460
855	x86	PutInt64	{int64}	{}	*AsmBuf	460
856	x86	Put	{[]byte}	{}	*AsmBuf	460
857	x86	PutOpBytesLit	{int,*x86.opBytes}	{}	*AsmBuf	460
858	x86	Insert	{int,byte}	{}	*AsmBuf	460
859	x86	Last	{}	{byte}	*AsmBuf	460
860	x86	Len	{}	{int}	*AsmBuf	460
861	x86	Bytes	{}	{[]byte}	*AsmBuf	460
862	x86	Reset	{}	{}	*AsmBuf	460
863	x86	At	{int}	{byte}	*AsmBuf	460
864	objabi	Set	{string}	{error}	*HeadType	462
865	objabi	String	{}	{string}	*HeadType	462
866	objabi	IsDirectJump	{}	{bool}	RelocType	463
867	objabi	String	{}	{string}	RelocType	463
868	objabi	String	{}	{string}	SymKind	464
869	objfile	Print	{io.Writer,*regexp.Regexp,uint64,uint64,bool}	{}	*Disasm	465
870	objfile	Decode	{uint64,uint64,[]objfile.Reloc,"func(uint64, string, int, string)"}	{}	*Disasm	465
871	objfile	Line	{string,int}	{[]byte,error}	*FileCache	467
872	objfile	Close	{}	{error}	*File	469
873	objfile	Entries	{}	{[]*objfile.Entry}	*File	469
874	objfile	Symbols	{}	{[]objfile.Sym,error}	*File	469
875	objfile	PCLineTable	{}	{objfile.Liner,error}	*File	469
876	objfile	Text	{}	{uint64,[]byte,error}	*File	469
877	objfile	GOARCH	{}	{string}	*File	469
878	objfile	LoadAddress	{}	{uint64,error}	*File	469
879	objfile	DWARF	{}	{*dwarf.Data,error}	*File	469
880	objfile	Disasm	{}	{*objfile.Disasm,error}	*File	469
881	objfile	Disasm	{}	{*objfile.Disasm,error}	*Entry	470
882	objfile	Name	{}	{string}	*Entry	470
883	objfile	Symbols	{}	{[]objfile.Sym,error}	*Entry	470
884	objfile	PCLineTable	{}	{objfile.Liner,error}	*Entry	470
885	objfile	Text	{}	{uint64,[]byte,error}	*Entry	470
886	objfile	GOARCH	{}	{string}	*Entry	470
887	objfile	LoadAddress	{}	{uint64,error}	*Entry	470
888	objfile	DWARF	{}	{*dwarf.Data,error}	*Entry	470
889	src	IsKnown	{}	{bool}	Pos	474
890	src	Before	{src.Pos}	{bool}	Pos	474
891	src	After	{src.Pos}	{bool}	Pos	474
892	src	LineNumber	{}	{string}	Pos	474
893	src	LineNumberHTML	{}	{string}	Pos	474
894	src	Filename	{}	{string}	Pos	474
895	src	Base	{}	{*src.PosBase}	Pos	474
896	src	SetBase	{*src.PosBase}	{}	*Pos	474
897	src	RelFilename	{}	{string}	Pos	474
898	src	RelLine	{}	{uint}	Pos	474
899	src	RelCol	{}	{uint}	Pos	474
900	src	AbsFilename	{}	{string}	Pos	474
901	src	SymFilename	{}	{string}	Pos	474
902	src	String	{}	{string}	Pos	474
903	src	Format	{bool,bool}	{string}	Pos	474
904	src	Pos	{}	{*src.Pos}	*PosBase	475
905	src	Filename	{}	{string}	*PosBase	475
906	src	AbsFilename	{}	{string}	*PosBase	475
907	src	SymFilename	{}	{string}	*PosBase	475
908	src	Line	{}	{uint}	*PosBase	475
909	src	Col	{}	{uint}	*PosBase	475
910	src	InliningIndex	{}	{int}	*PosBase	475
911	src	IsKnown	{}	{bool}	XPos	477
912	src	Before	{src.XPos}	{bool}	XPos	477
913	src	SameFile	{src.XPos}	{bool}	XPos	477
914	src	After	{src.XPos}	{bool}	XPos	477
915	src	WithNotStmt	{}	{src.XPos}	XPos	477
916	src	WithDefaultStmt	{}	{src.XPos}	XPos	477
917	src	WithIsStmt	{}	{src.XPos}	XPos	477
918	src	WithXlogue	{src.PosXlogue}	{src.XPos}	XPos	477
919	src	LineNumber	{}	{string}	XPos	477
920	src	LineNumberHTML	{}	{string}	XPos	477
921	src	XPos	{src.Pos}	{src.XPos}	*PosTable	478
922	src	Pos	{src.XPos}	{src.Pos}	*PosTable	478
923	sys	InFamily	{...sys.ArchFamily}	{bool}	*Arch	480
924	ld	Set	{string}	{error}	*BuildMode	483
925	ld	String	{}	{string}	*BuildMode	483
926	ld	Set	{string}	{error}	*LinkMode	484
927	ld	String	{}	{string}	*LinkMode	484
928	ld	Init	{*ld.Link,string}	{}	*GCProg	485
929	ld	End	{int64}	{}	*GCProg	485
930	ld	AddSym	{*sym.Symbol}	{}	*GCProg	485
931	ld	AddTramp	{*sym.Symbol}	{}	*Link	497
932	ld	DynlinkingGo	{}	{bool}	*Link	497
933	ld	CanUsePlugins	{}	{bool}	*Link	497
934	ld	UseRelro	{}	{bool}	*Link	497
935	ld	ErrorUnresolved	{*sym.Symbol,*sym.Reloc}	{}	*Link	497
936	ld	FixedFrameSize	{}	{int64}	*Link	497
937	ld	Logf	{string,"...interface{}"}	{}	*Link	497
938	ld	Set	{string}	{error}	*Rpath	503
939	ld	String	{}	{string}	*Rpath	503
940	ld	SeekSet	{int64}	{}	*OutBuf	504
941	ld	Offset	{}	{int64}	*OutBuf	504
942	ld	Write	{[]byte}	{int,error}	*OutBuf	504
943	ld	Write8	{uint8}	{}	*OutBuf	504
944	ld	WriteByte	{byte}	{error}	*OutBuf	504
945	ld	Write16	{uint16}	{}	*OutBuf	504
946	ld	Write32	{uint32}	{}	*OutBuf	504
947	ld	Write32b	{uint32}	{}	*OutBuf	504
948	ld	Write64	{uint64}	{}	*OutBuf	504
949	ld	Write64b	{uint64}	{}	*OutBuf	504
950	ld	WriteString	{string}	{}	*OutBuf	504
951	ld	WriteStringN	{string,int}	{}	*OutBuf	504
952	ld	WriteStringPad	{string,int,[]byte}	{}	*OutBuf	504
953	ld	Flush	{}	{}	*OutBuf	504
954	sym	DuplicateOK	{}	{bool}	Attribute	521
955	sym	External	{}	{bool}	Attribute	521
956	sym	NoSplit	{}	{bool}	Attribute	521
957	sym	Reachable	{}	{bool}	Attribute	521
958	sym	CgoExportDynamic	{}	{bool}	Attribute	521
959	sym	CgoExportStatic	{}	{bool}	Attribute	521
960	sym	Special	{}	{bool}	Attribute	521
961	sym	StackCheck	{}	{bool}	Attribute	521
962	sym	NotInSymbolTable	{}	{bool}	Attribute	521
963	sym	OnList	{}	{bool}	Attribute	521
964	sym	Local	{}	{bool}	Attribute	521
965	sym	ReflectMethod	{}	{bool}	Attribute	521
966	sym	MakeTypelink	{}	{bool}	Attribute	521
967	sym	Shared	{}	{bool}	Attribute	521
968	sym	VisibilityHidden	{}	{bool}	Attribute	521
969	sym	SubSymbol	{}	{bool}	Attribute	521
970	sym	Container	{}	{bool}	Attribute	521
971	sym	CgoExport	{}	{bool}	Attribute	521
972	sym	Set	{sym.Attribute,bool}	{}	*Attribute	521
973	sym	String	{}	{string}	Library	522
974	sym	Len	{}	{int}	RelocByOff	525
975	sym	Swap	{int,int}	{}	RelocByOff	525
976	sym	Less	{int,int}	{bool}	RelocByOff	525
977	sym	String	{}	{string}	*Symbol	528
978	sym	ElfsymForReloc	{}	{int32}	*Symbol	528
979	sym	Len	{}	{int64}	*Symbol	528
980	sym	Grow	{int64}	{}	*Symbol	528
981	sym	AddBytes	{[]byte}	{int64}	*Symbol	528
982	sym	AddUint8	{uint8}	{int64}	*Symbol	528
983	sym	AddUint16	{*sys.Arch,uint16}	{int64}	*Symbol	528
984	sym	AddUint32	{*sys.Arch,uint32}	{int64}	*Symbol	528
985	sym	AddUint64	{*sys.Arch,uint64}	{int64}	*Symbol	528
986	sym	AddUint	{*sys.Arch,uint64}	{int64}	*Symbol	528
987	sym	SetUint8	{*sys.Arch,int64,uint8}	{int64}	*Symbol	528
988	sym	SetUint32	{*sys.Arch,int64,uint32}	{int64}	*Symbol	528
989	sym	SetUint	{*sys.Arch,int64,uint64}	{int64}	*Symbol	528
990	sym	AddAddrPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	528
991	sym	AddPCRelPlus	{*sys.Arch,*sym.Symbol,int64}	{int64}	*Symbol	528
992	sym	AddAddr	{*sys.Arch,*sym.Symbol}	{int64}	*Symbol	528
993	sym	SetAddrPlus	{*sys.Arch,int64,*sym.Symbol,int64}	{int64}	*Symbol	528
994	sym	SetAddr	{*sys.Arch,int64,*sym.Symbol}	{int64}	*Symbol	528
995	sym	AddSize	{*sys.Arch,*sym.Symbol}	{int64}	*Symbol	528
996	sym	AddAddrPlus4	{*sym.Symbol,int64}	{int64}	*Symbol	528
997	sym	AddRel	{}	{*sym.Reloc}	*Symbol	528
998	sym	AddUintXX	{*sys.Arch,uint64,int}	{int64}	*Symbol	528
999	sym	Dynimplib	{}	{string}	*Symbol	528
1000	sym	Dynimpvers	{}	{string}	*Symbol	528
1001	sym	SetDynimplib	{string}	{}	*Symbol	528
1002	sym	SetDynimpvers	{string}	{}	*Symbol	528
1003	sym	ResetDyninfo	{}	{}	*Symbol	528
1004	sym	Newsym	{string,int}	{*sym.Symbol}	*Symbols	533
1005	sym	Lookup	{string,int}	{*sym.Symbol}	*Symbols	533
1006	sym	ROLookup	{string,int}	{*sym.Symbol}	*Symbols	533
1007	sym	IncVersion	{}	{int}	*Symbols	533
1008	sym	Rename	{string,string,int}	{}	*Symbols	533
1009	sym	String	{}	{string}	SymKind	534
1010	main	String	{}	{string}	*Entry	536
1011	binutils	String	{}	{string}	*Binutils	562
1012	binutils	SetFastSymbolization	{bool}	{}	*Binutils	562
1013	binutils	SetTools	{string}	{}	*Binutils	562
1014	binutils	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}	*Binutils	562
1015	binutils	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}	*Binutils	562
1016	graph	TrimTree	{graph.NodePtrSet}	{}	*Graph	567
1017	graph	String	{}	{string}	*Graph	567
1018	graph	DiscardLowFrequencyNodes	{int64}	{graph.NodeSet}	*Graph	567
1019	graph	DiscardLowFrequencyNodePtrs	{int64}	{graph.NodePtrSet}	*Graph	567
1020	graph	TrimLowFrequencyTags	{int64}	{}	*Graph	567
1021	graph	TrimLowFrequencyEdges	{int64}	{int}	*Graph	567
1022	graph	SortNodes	{bool,bool}	{}	*Graph	567
1023	graph	SelectTopNodePtrs	{int,bool}	{graph.NodePtrSet}	*Graph	567
1024	graph	SelectTopNodes	{int,bool}	{graph.NodeSet}	*Graph	567
1025	graph	RemoveRedundantEdges	{}	{}	*Graph	567
1026	graph	Sum	{}	{int64,int64}	Nodes	569
1027	graph	Sort	{graph.NodeOrder}	{error}	Nodes	569
1028	graph	FlatValue	{}	{int64}	*Node	570
1029	graph	CumValue	{}	{int64}	*Node	570
1030	graph	AddToEdge	{*graph.Node,int64,bool,bool}	{}	*Node	570
1031	graph	AddToEdgeDiv	{*graph.Node,int64,int64,bool,bool}	{}	*Node	570
1032	graph	PrintableName	{}	{string}	*NodeInfo	571
1033	graph	NameComponents	{}	{[]string}	*NodeInfo	571
1034	graph	FindOrInsertNode	{graph.NodeInfo,graph.NodeSet}	{*graph.Node}	NodeMap	572
1035	graph	Sort	{}	{[]*graph.Edge}	EdgeMap	575
1036	graph	Sum	{}	{int64}	EdgeMap	575
1037	graph	WeightValue	{}	{int64}	*Edge	576
1038	graph	FlatValue	{}	{int64}	*Tag	577
1039	graph	CumValue	{}	{int64}	*Tag	577
1040	proftest	ReadLine	{string}	{string,error}	*TestUI	593
1041	proftest	Print	{"...interface{}"}	{}	*TestUI	593
1042	proftest	PrintErr	{"...interface{}"}	{}	*TestUI	593
1043	proftest	IsTerminal	{}	{bool}	*TestUI	593
1044	proftest	WantBrowser	{}	{bool}	*TestUI	593
1045	proftest	SetAutoComplete	{"func(string) string"}	{}	*TestUI	593
1046	report	Total	{}	{int64}	*Report	596
1047	symbolizer	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}	*Symbolizer	597
1048	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	599
1049	profile	ShowFrom	{*regexp.Regexp}	{bool}	*Profile	599
1050	profile	FilterTagsByName	{*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	599
1051	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	599
1052	profile	SampleIndexByName	{string}	{int,error}	*Profile	599
1053	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	599
1054	profile	ParseMemoryMapFromScanner	{*bufio.Scanner}	{error}	*Profile	599
1055	profile	Compact	{}	{*profile.Profile}	*Profile	599
1304	ppc64asm	IsArg	{}	{}	Label	715
1056	profile	Normalize	{*profile.Profile}	{error}	*Profile	599
1057	profile	Write	{io.Writer}	{error}	*Profile	599
1058	profile	WriteUncompressed	{io.Writer}	{error}	*Profile	599
1059	profile	CheckValid	{}	{error}	*Profile	599
1060	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	599
1061	profile	NumLabelUnits	{}	{map[string]string,map[string][]string}	*Profile	599
1062	profile	String	{}	{string}	*Profile	599
1063	profile	SetLabel	{string,[]string}	{}	*Profile	599
1064	profile	RemoveLabel	{string}	{}	*Profile	599
1065	profile	Scale	{float64}	{}	*Profile	599
1066	profile	ScaleN	{[]float64}	{error}	*Profile	599
1067	profile	HasFunctions	{}	{bool}	*Profile	599
1068	profile	HasFileLines	{}	{bool}	*Profile	599
1069	profile	Copy	{}	{*profile.Profile}	*Profile	599
1070	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	599
1071	profile	RemoveUninteresting	{}	{error}	*Profile	599
1072	profile	PruneFrom	{*regexp.Regexp}	{}	*Profile	599
1073	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	599
1074	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	599
1075	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	599
1076	profile	Write	{io.Writer}	{error}	*Profile	599
1077	profile	CheckValid	{}	{error}	*Profile	599
1078	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	599
1079	profile	String	{}	{string}	*Profile	599
1080	profile	Merge	{*profile.Profile,float64}	{error}	*Profile	599
1081	profile	Compatible	{*profile.Profile}	{error}	*Profile	599
1082	profile	HasFunctions	{}	{bool}	*Profile	599
1083	profile	HasFileLines	{}	{bool}	*Profile	599
1084	profile	Copy	{}	{*profile.Profile}	*Profile	599
1085	profile	Demangle	{profile.Demangler}	{error}	*Profile	599
1086	profile	Empty	{}	{bool}	*Profile	599
1087	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	599
1088	profile	RemoveUninteresting	{}	{error}	*Profile	599
1089	profile	HasLabel	{string,string}	{bool}	*Sample	601
1090	profile	Unsymbolizable	{}	{bool}	*Mapping	602
1091	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Name	607
1092	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Name	607
1093	demangle	GoString	{}	{string}	*Name	607
1094	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Typed	608
1095	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Typed	608
1096	demangle	GoString	{}	{string}	*Typed	608
1097	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Qualified	609
1098	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Qualified	609
1099	demangle	GoString	{}	{string}	*Qualified	609
1100	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Template	610
1101	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Template	610
1102	demangle	GoString	{}	{string}	*Template	610
1103	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TemplateParam	611
1104	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TemplateParam	611
1105	demangle	GoString	{}	{string}	*TemplateParam	611
1106	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TypeWithQualifiers	613
1107	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TypeWithQualifiers	613
1108	demangle	GoString	{}	{string}	*TypeWithQualifiers	613
1109	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*MethodWithQualifiers	614
1110	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*MethodWithQualifiers	614
1111	demangle	GoString	{}	{string}	*MethodWithQualifiers	614
1112	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*BuiltinType	615
1113	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*BuiltinType	615
1114	demangle	GoString	{}	{string}	*BuiltinType	615
1381	unix	SetLen	{int}	{}	*Iovec	786
1115	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PointerType	616
1116	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PointerType	616
1117	demangle	GoString	{}	{string}	*PointerType	616
1118	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ReferenceType	617
1119	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ReferenceType	617
1120	demangle	GoString	{}	{string}	*ReferenceType	617
1121	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*RvalueReferenceType	618
1122	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*RvalueReferenceType	618
1123	demangle	GoString	{}	{string}	*RvalueReferenceType	618
1124	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ComplexType	619
1125	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ComplexType	619
1126	demangle	GoString	{}	{string}	*ComplexType	619
1127	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ImaginaryType	620
1128	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ImaginaryType	620
1129	demangle	GoString	{}	{string}	*ImaginaryType	620
1130	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VendorQualifier	621
1131	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VendorQualifier	621
1132	demangle	GoString	{}	{string}	*VendorQualifier	621
1133	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArrayType	622
1134	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArrayType	622
1135	demangle	GoString	{}	{string}	*ArrayType	622
1136	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionType	623
1137	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionType	623
1138	demangle	GoString	{}	{string}	*FunctionType	623
1139	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionParam	624
1140	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionParam	624
1141	demangle	GoString	{}	{string}	*FunctionParam	624
1142	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PtrMem	625
1143	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PtrMem	625
1144	demangle	GoString	{}	{string}	*PtrMem	625
1145	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FixedType	626
1146	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FixedType	626
1147	demangle	GoString	{}	{string}	*FixedType	626
1148	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VectorType	627
1149	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VectorType	627
1150	demangle	GoString	{}	{string}	*VectorType	627
1151	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Decltype	628
1152	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Decltype	628
1153	demangle	GoString	{}	{string}	*Decltype	628
1154	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Operator	629
1155	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Operator	629
1156	demangle	GoString	{}	{string}	*Operator	629
1157	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Constructor	630
1158	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Constructor	630
1159	demangle	GoString	{}	{string}	*Constructor	630
1160	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Destructor	631
1161	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Destructor	631
1162	demangle	GoString	{}	{string}	*Destructor	631
1163	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*GlobalCDtor	632
1164	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*GlobalCDtor	632
1165	demangle	GoString	{}	{string}	*GlobalCDtor	632
1166	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TaggedName	633
1167	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TaggedName	633
1168	demangle	GoString	{}	{string}	*TaggedName	633
1169	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PackExpansion	634
1303	ppc64asm	String	{}	{string}	PCRel	714
1170	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PackExpansion	634
1171	demangle	GoString	{}	{string}	*PackExpansion	634
1172	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArgumentPack	635
1173	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArgumentPack	635
1174	demangle	GoString	{}	{string}	*ArgumentPack	635
1175	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofPack	636
1176	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofPack	636
1177	demangle	GoString	{}	{string}	*SizeofPack	636
1178	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofArgs	637
1179	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofArgs	637
1180	demangle	GoString	{}	{string}	*SizeofArgs	637
1181	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Cast	638
1182	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Cast	638
1183	demangle	GoString	{}	{string}	*Cast	638
1184	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Nullary	639
1185	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Nullary	639
1186	demangle	GoString	{}	{string}	*Nullary	639
1187	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Unary	640
1188	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Unary	640
1189	demangle	GoString	{}	{string}	*Unary	640
1190	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Binary	641
1191	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Binary	641
1192	demangle	GoString	{}	{string}	*Binary	641
1193	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Trinary	642
1194	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Trinary	642
1195	demangle	GoString	{}	{string}	*Trinary	642
1196	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Fold	643
1197	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Fold	643
1198	demangle	GoString	{}	{string}	*Fold	643
1199	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*New	644
1200	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*New	644
1201	demangle	GoString	{}	{string}	*New	644
1202	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Literal	645
1203	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Literal	645
1204	demangle	GoString	{}	{string}	*Literal	645
1205	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ExprList	646
1206	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ExprList	646
1207	demangle	GoString	{}	{string}	*ExprList	646
1208	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*InitializerList	647
1209	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*InitializerList	647
1210	demangle	GoString	{}	{string}	*InitializerList	647
1211	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*DefaultArg	648
1212	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*DefaultArg	648
1213	demangle	GoString	{}	{string}	*DefaultArg	648
1214	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Closure	649
1215	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Closure	649
1216	demangle	GoString	{}	{string}	*Closure	649
1217	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*UnnamedType	650
1218	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*UnnamedType	650
1219	demangle	GoString	{}	{string}	*UnnamedType	650
1220	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Clone	651
1221	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Clone	651
1222	demangle	GoString	{}	{string}	*Clone	651
1223	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special	652
1224	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special	652
1225	demangle	GoString	{}	{string}	*Special	652
1226	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special2	653
1227	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special2	653
1228	demangle	GoString	{}	{string}	*Special2	653
1229	armasm	String	{}	{string}	Mode	655
1230	armasm	String	{}	{string}	Op	656
1231	armasm	String	{}	{string}	Inst	657
1232	armasm	IsArg	{}	{}	Float32Imm	660
1233	armasm	String	{}	{string}	Float32Imm	660
1234	armasm	IsArg	{}	{}	Float64Imm	661
1235	armasm	String	{}	{string}	Float64Imm	661
1236	armasm	IsArg	{}	{}	Imm	662
1237	armasm	String	{}	{string}	Imm	662
1238	armasm	IsArg	{}	{}	ImmAlt	663
1239	armasm	Imm	{}	{armasm.Imm}	ImmAlt	663
1240	armasm	String	{}	{string}	ImmAlt	663
1241	armasm	IsArg	{}	{}	Label	664
1242	armasm	String	{}	{string}	Label	664
1243	armasm	IsArg	{}	{}	Reg	665
1244	armasm	String	{}	{string}	Reg	665
1245	armasm	IsArg	{}	{}	RegX	666
1246	armasm	String	{}	{string}	RegX	666
1247	armasm	IsArg	{}	{}	RegList	667
1248	armasm	String	{}	{string}	RegList	667
1249	armasm	IsArg	{}	{}	Endian	668
1250	armasm	String	{}	{string}	Endian	668
1251	armasm	String	{}	{string}	Shift	669
1252	armasm	IsArg	{}	{}	RegShift	670
1253	armasm	String	{}	{string}	RegShift	670
1254	armasm	IsArg	{}	{}	RegShiftReg	671
1255	armasm	String	{}	{string}	RegShiftReg	671
1256	armasm	IsArg	{}	{}	PCRel	672
1257	armasm	String	{}	{string}	PCRel	672
1258	armasm	IsArg	{}	{}	Mem	674
1259	armasm	String	{}	{string}	Mem	674
1260	arm64asm	String	{}	{string}	Op	676
1261	arm64asm	String	{}	{string}	Inst	677
1262	arm64asm	String	{}	{string}	Reg	680
1263	arm64asm	String	{}	{string}	RegSP	681
1264	arm64asm	String	{}	{string}	ImmShift	682
1265	arm64asm	String	{}	{string}	ExtShift	683
1266	arm64asm	String	{}	{string}	RegExtshiftAmount	684
1267	arm64asm	String	{}	{string}	PCRel	685
1268	arm64asm	String	{}	{string}	MemImmediate	687
1269	arm64asm	String	{}	{string}	MemExtend	688
1270	arm64asm	String	{}	{string}	Imm	689
1271	arm64asm	String	{}	{string}	Imm64	690
1272	arm64asm	String	{}	{string}	Imm_hint	691
1273	arm64asm	String	{}	{string}	Imm_clrex	692
1274	arm64asm	String	{}	{string}	Imm_dcps	693
1275	arm64asm	String	{}	{string}	Cond	694
1276	arm64asm	String	{}	{string}	Imm_c	695
1277	arm64asm	String	{}	{string}	Imm_option	696
1278	arm64asm	String	{}	{string}	Imm_prfop	697
1279	arm64asm	String	{}	{string}	Pstatefield	698
1280	arm64asm	String	{}	{string}	Systemreg	699
1281	arm64asm	String	{}	{string}	Imm_fp	700
1282	arm64asm	String	{}	{string}	Arrangement	701
1283	arm64asm	String	{}	{string}	RegisterWithArrangement	702
1284	arm64asm	String	{}	{string}	RegisterWithArrangementAndIndex	703
1285	ppc64asm	String	{}	{string}	ArgType	704
1286	ppc64asm	GoString	{}	{string}	ArgType	704
1287	ppc64asm	String	{}	{string}	BitField	705
1288	ppc64asm	Parse	{uint32}	{uint32}	BitField	705
1289	ppc64asm	ParseSigned	{uint32}	{int32}	BitField	705
1290	ppc64asm	String	{}	{string}	BitFields	706
1291	ppc64asm	Append	{ppc64asm.BitField}	{}	*BitFields	706
1292	ppc64asm	Parse	{uint32}	{uint32}	BitFields	706
1293	ppc64asm	ParseSigned	{uint32}	{int32}	BitFields	706
1294	ppc64asm	String	{}	{string}	Inst	707
1295	ppc64asm	String	{}	{string}	Op	708
1296	ppc64asm	IsArg	{}	{}	Reg	711
1297	ppc64asm	String	{}	{string}	Reg	711
1298	ppc64asm	IsArg	{}	{}	CondReg	712
1299	ppc64asm	String	{}	{string}	CondReg	712
1300	ppc64asm	IsArg	{}	{}	SpReg	713
1301	ppc64asm	String	{}	{string}	SpReg	713
1302	ppc64asm	IsArg	{}	{}	PCRel	714
1305	ppc64asm	String	{}	{string}	Label	715
1306	ppc64asm	IsArg	{}	{}	Imm	716
1307	ppc64asm	String	{}	{string}	Imm	716
1308	ppc64asm	IsArg	{}	{}	Offset	717
1309	ppc64asm	String	{}	{string}	Offset	717
1310	x86asm	String	{}	{string}	Inst	718
1311	x86asm	IsREX	{}	{bool}	Prefix	720
1312	x86asm	IsVEX	{}	{bool}	Prefix	720
1313	x86asm	String	{}	{string}	Prefix	720
1314	x86asm	String	{}	{string}	Op	721
1315	x86asm	String	{}	{string}	Reg	724
1316	x86asm	String	{}	{string}	Mem	725
1317	x86asm	String	{}	{string}	Rel	726
1318	x86asm	String	{}	{string}	Imm	727
1319	terminal	Write	{[]byte}	{int,error}	*Terminal	730
1320	terminal	ReadPassword	{string}	{string,error}	*Terminal	730
1321	terminal	ReadLine	{}	{string,error}	*Terminal	730
1322	terminal	SetPrompt	{string}	{}	*Terminal	730
1323	terminal	SetSize	{int,int}	{error}	*Terminal	730
1324	terminal	SetBracketedPasteMode	{bool}	{}	*Terminal	730
1325	unix	Zero	{}	{}	*CPUSet	735
1326	unix	Set	{int}	{}	*CPUSet	735
1327	unix	Clear	{int}	{}	*CPUSet	735
1328	unix	IsSet	{int}	{bool}	*CPUSet	735
1329	unix	Count	{}	{int}	*CPUSet	735
1330	unix	Exited	{}	{bool}	WaitStatus	737
1331	unix	ExitStatus	{}	{int}	WaitStatus	737
1332	unix	Signaled	{}	{bool}	WaitStatus	737
1333	unix	Signal	{}	{syscall.Signal}	WaitStatus	737
1334	unix	CoreDump	{}	{bool}	WaitStatus	737
1335	unix	Stopped	{}	{bool}	WaitStatus	737
1336	unix	Continued	{}	{bool}	WaitStatus	737
1337	unix	StopSignal	{}	{syscall.Signal}	WaitStatus	737
1338	unix	TrapCause	{}	{int}	WaitStatus	737
1339	unix	Exited	{}	{bool}	WaitStatus	737
1340	unix	Signaled	{}	{bool}	WaitStatus	737
1341	unix	Stopped	{}	{bool}	WaitStatus	737
1342	unix	Continued	{}	{bool}	WaitStatus	737
1343	unix	CoreDump	{}	{bool}	WaitStatus	737
1344	unix	ExitStatus	{}	{int}	WaitStatus	737
1345	unix	Signal	{}	{syscall.Signal}	WaitStatus	737
1346	unix	StopSignal	{}	{syscall.Signal}	WaitStatus	737
1347	unix	TrapCause	{}	{int}	WaitStatus	737
1348	unix	Exited	{}	{bool}	WaitStatus	737
1349	unix	ExitStatus	{}	{int}	WaitStatus	737
1350	unix	Signaled	{}	{bool}	WaitStatus	737
1351	unix	Signal	{}	{syscall.Signal}	WaitStatus	737
1352	unix	CoreDump	{}	{bool}	WaitStatus	737
1353	unix	Stopped	{}	{bool}	WaitStatus	737
1354	unix	Continued	{}	{bool}	WaitStatus	737
1355	unix	StopSignal	{}	{syscall.Signal}	WaitStatus	737
1356	unix	TrapCause	{}	{int}	WaitStatus	737
1357	unix	Unix	{}	{int64,int64}	*Timespec	765
1358	unix	Nano	{}	{int64}	*Timespec	765
1359	unix	Unix	{}	{int64,int64}	*Timeval	766
1360	unix	Nano	{}	{int64}	*Timeval	766
1361	unix	SetLen	{int}	{}	*Iovec	786
1362	unix	SetLen	{int}	{}	*Iovec	786
1363	unix	SetLen	{int}	{}	*Iovec	786
1364	unix	SetLen	{int}	{}	*Iovec	786
1365	unix	SetLen	{int}	{}	*Iovec	786
1366	unix	SetLen	{int}	{}	*Iovec	786
1367	unix	SetLen	{int}	{}	*Iovec	786
1368	unix	SetLen	{int}	{}	*Iovec	786
1369	unix	SetLen	{int}	{}	*Iovec	786
1370	unix	SetLen	{int}	{}	*Iovec	786
1371	unix	SetLen	{int}	{}	*Iovec	786
1372	unix	SetLen	{int}	{}	*Iovec	786
1373	unix	SetLen	{int}	{}	*Iovec	786
1374	unix	SetLen	{int}	{}	*Iovec	786
1375	unix	SetLen	{int}	{}	*Iovec	786
1376	unix	SetLen	{int}	{}	*Iovec	786
1377	unix	SetLen	{int}	{}	*Iovec	786
1378	unix	SetLen	{int}	{}	*Iovec	786
1379	unix	SetLen	{int}	{}	*Iovec	786
1380	unix	SetLen	{int}	{}	*Iovec	786
1382	unix	SetLen	{int}	{}	*Iovec	786
1383	unix	SetLen	{int}	{}	*Iovec	786
1384	unix	SetLen	{int}	{}	*Iovec	786
1385	unix	SetControllen	{int}	{}	*Msghdr	789
1386	unix	SetControllen	{int}	{}	*Msghdr	789
1387	unix	SetControllen	{int}	{}	*Msghdr	789
1388	unix	SetControllen	{int}	{}	*Msghdr	789
1389	unix	SetControllen	{int}	{}	*Msghdr	789
1390	unix	SetControllen	{int}	{}	*Msghdr	789
1391	unix	SetControllen	{int}	{}	*Msghdr	789
1392	unix	SetControllen	{int}	{}	*Msghdr	789
1393	unix	SetControllen	{int}	{}	*Msghdr	789
1394	unix	SetControllen	{int}	{}	*Msghdr	789
1395	unix	SetControllen	{int}	{}	*Msghdr	789
1396	unix	SetControllen	{int}	{}	*Msghdr	789
1397	unix	SetControllen	{int}	{}	*Msghdr	789
1398	unix	SetControllen	{int}	{}	*Msghdr	789
1399	unix	SetControllen	{int}	{}	*Msghdr	789
1400	unix	SetControllen	{int}	{}	*Msghdr	789
1401	unix	SetControllen	{int}	{}	*Msghdr	789
1402	unix	SetControllen	{int}	{}	*Msghdr	789
1403	unix	SetControllen	{int}	{}	*Msghdr	789
1404	unix	SetControllen	{int}	{}	*Msghdr	789
1405	unix	SetControllen	{int}	{}	*Msghdr	789
1406	unix	SetControllen	{int}	{}	*Msghdr	789
1407	unix	SetControllen	{int}	{}	*Msghdr	789
1408	unix	SetLen	{int}	{}	*Cmsghdr	790
1409	unix	SetLen	{int}	{}	*Cmsghdr	790
1410	unix	SetLen	{int}	{}	*Cmsghdr	790
1411	unix	SetLen	{int}	{}	*Cmsghdr	790
1412	unix	SetLen	{int}	{}	*Cmsghdr	790
1413	unix	SetLen	{int}	{}	*Cmsghdr	790
1414	unix	SetLen	{int}	{}	*Cmsghdr	790
1415	unix	SetLen	{int}	{}	*Cmsghdr	790
1416	unix	SetLen	{int}	{}	*Cmsghdr	790
1417	unix	SetLen	{int}	{}	*Cmsghdr	790
1418	unix	SetLen	{int}	{}	*Cmsghdr	790
1419	unix	SetLen	{int}	{}	*Cmsghdr	790
1420	unix	SetLen	{int}	{}	*Cmsghdr	790
1421	unix	SetLen	{int}	{}	*Cmsghdr	790
1422	unix	SetLen	{int}	{}	*Cmsghdr	790
1423	unix	SetLen	{int}	{}	*Cmsghdr	790
1424	unix	SetLen	{int}	{}	*Cmsghdr	790
1425	unix	SetLen	{int}	{}	*Cmsghdr	790
1426	unix	SetLen	{int}	{}	*Cmsghdr	790
1427	unix	SetLen	{int}	{}	*Cmsghdr	790
1428	unix	SetLen	{int}	{}	*Cmsghdr	790
1429	unix	SetLen	{int}	{}	*Cmsghdr	790
1430	unix	SetLen	{int}	{}	*Cmsghdr	790
1431	unix	SetLen	{int}	{}	*Cmsghdr	790
1432	unix	PC	{}	{uint64}	*PtraceRegs	1192
1433	unix	SetPC	{uint64}	{}	*PtraceRegs	1192
1434	unix	PC	{}	{uint64}	*PtraceRegs	1192
1435	unix	SetPC	{uint64}	{}	*PtraceRegs	1192
1436	unix	PC	{}	{uint64}	*PtraceRegs	1192
1437	unix	SetPC	{uint64}	{}	*PtraceRegs	1192
1438	unix	PC	{}	{uint64}	*PtraceRegs	1192
1439	unix	SetPC	{uint64}	{}	*PtraceRegs	1192
1440	unix	PC	{}	{uint64}	*PtraceRegs	1192
1441	unix	SetPC	{uint64}	{}	*PtraceRegs	1192
1442	unix	PC	{}	{uint64}	*PtraceRegs	1192
1443	unix	SetPC	{uint64}	{}	*PtraceRegs	1192
1444	unix	PC	{}	{uint64}	*PtraceRegs	1192
1445	unix	SetPC	{uint64}	{}	*PtraceRegs	1192
1446	unix	PC	{}	{uint64}	*PtraceRegs	1192
1447	unix	SetPC	{uint64}	{}	*PtraceRegs	1192
1448	unix	PC	{}	{uint64}	*PtraceRegs	1192
1449	unix	SetPC	{uint64}	{}	*PtraceRegs	1192
1450	windows	Error	{}	{string}	*DLLError	2493
1451	windows	FindProc	{string}	{*windows.Proc,error}	*DLL	2494
1452	windows	MustFindProc	{string}	{*windows.Proc}	*DLL	2494
1453	windows	Release	{}	{error}	*DLL	2494
1454	windows	Addr	{}	{uintptr}	*Proc	2495
1455	windows	Call	{...uintptr}	{uintptr,error}	*Proc	2495
1456	windows	Load	{}	{error}	*LazyDLL	2496
1457	windows	Handle	{}	{uintptr}	*LazyDLL	2496
1458	windows	NewProc	{string}	{*windows.LazyProc}	*LazyDLL	2496
1459	windows	Find	{}	{error}	*LazyProc	2497
1460	windows	Addr	{}	{uintptr}	*LazyProc	2497
1461	windows	Call	{...uintptr}	{uintptr,error}	*LazyProc	2497
1462	registry	Close	{}	{error}	Key	2498
1463	registry	ReadSubKeyNames	{int}	{[]string,error}	Key	2498
1464	registry	Stat	{}	{*registry.KeyInfo,error}	Key	2498
1465	registry	GetValue	{string,[]byte}	{int,uint32,error}	Key	2498
1466	registry	GetStringValue	{string}	{string,uint32,error}	Key	2498
1467	registry	GetMUIStringValue	{string}	{string,error}	Key	2498
1468	registry	GetStringsValue	{string}	{[]string,uint32,error}	Key	2498
1469	registry	GetIntegerValue	{string}	{uint64,uint32,error}	Key	2498
1470	registry	GetBinaryValue	{string}	{[]byte,uint32,error}	Key	2498
1471	registry	SetDWordValue	{string,uint32}	{error}	Key	2498
1472	registry	SetQWordValue	{string,uint64}	{error}	Key	2498
1473	registry	SetStringValue	{string,string}	{error}	Key	2498
1474	registry	SetExpandStringValue	{string,string}	{error}	Key	2498
1475	registry	SetStringsValue	{string,[]string}	{error}	Key	2498
1476	registry	SetBinaryValue	{string,[]byte}	{error}	Key	2498
1477	registry	DeleteValue	{string}	{error}	Key	2498
1478	registry	ReadValueNames	{int}	{[]string,error}	Key	2498
1479	registry	Close	{}	{error}	Key	2498
1480	registry	ReadSubKeyNames	{int}	{[]string,error}	Key	2498
1481	registry	Stat	{}	{*registry.KeyInfo,error}	Key	2498
1482	registry	GetValue	{string,[]byte}	{int,uint32,error}	Key	2498
1483	registry	GetStringValue	{string}	{string,uint32,error}	Key	2498
1484	registry	GetMUIStringValue	{string}	{string,error}	Key	2498
1485	registry	GetStringsValue	{string}	{[]string,uint32,error}	Key	2498
1486	registry	GetIntegerValue	{string}	{uint64,uint32,error}	Key	2498
1487	registry	GetBinaryValue	{string}	{[]byte,uint32,error}	Key	2498
1488	registry	SetDWordValue	{string,uint32}	{error}	Key	2498
1489	registry	SetQWordValue	{string,uint64}	{error}	Key	2498
1490	registry	SetStringValue	{string,string}	{error}	Key	2498
1491	registry	SetExpandStringValue	{string,string}	{error}	Key	2498
1492	registry	SetStringsValue	{string,[]string}	{error}	Key	2498
1493	registry	SetBinaryValue	{string,[]byte}	{error}	Key	2498
1494	registry	DeleteValue	{string}	{error}	Key	2498
1495	registry	ReadValueNames	{int}	{[]string,error}	Key	2498
1496	registry	ModTime	{}	{time.Time}	*KeyInfo	2499
1497	windows	String	{}	{string,error}	*SID	2502
1498	windows	Len	{}	{int}	*SID	2502
1499	windows	Copy	{}	{*windows.SID,error}	*SID	2502
1500	windows	LookupAccount	{string}	{string,uint32,error}	*SID	2502
1501	windows	Close	{}	{error}	Token	2507
1502	windows	GetTokenUser	{}	{*windows.Tokenuser,error}	Token	2507
1503	windows	GetTokenGroups	{}	{*windows.Tokengroups,error}	Token	2507
1504	windows	GetTokenPrimaryGroup	{}	{*windows.Tokenprimarygroup,error}	Token	2507
1505	windows	GetUserProfileDirectory	{}	{string,error}	Token	2507
1506	windows	IsMember	{*windows.SID}	{bool,error}	Token	2507
1507	debug	Close	{}	{error}	*ConsoleLog	2515
1508	debug	Info	{uint32,string}	{error}	*ConsoleLog	2515
1509	debug	Warning	{uint32,string}	{error}	*ConsoleLog	2515
1510	debug	Error	{uint32,string}	{error}	*ConsoleLog	2515
1511	eventlog	Close	{}	{error}	*Log	2516
1512	eventlog	Info	{uint32,string}	{error}	*Log	2516
1513	eventlog	Warning	{uint32,string}	{error}	*Log	2516
1514	eventlog	Error	{uint32,string}	{error}	*Log	2516
1515	mgr	Disconnect	{}	{error}	*Mgr	2518
1589	zlib	Write	{[]byte}	{int,error}	*Writer	2663
1516	mgr	CreateService	{string,string,mgr.Config,...string}	{*mgr.Service,error}	*Mgr	2518
1517	mgr	OpenService	{string}	{*mgr.Service,error}	*Mgr	2518
1518	mgr	ListServices	{}	{[]string,error}	*Mgr	2518
1519	mgr	Config	{}	{mgr.Config,error}	*Service	2519
1520	mgr	UpdateConfig	{mgr.Config}	{error}	*Service	2519
1521	mgr	Delete	{}	{error}	*Service	2519
1522	mgr	Close	{}	{error}	*Service	2519
1523	mgr	Start	{...string}	{error}	*Service	2519
1524	mgr	Control	{svc.Cmd}	{svc.Status,error}	*Service	2519
1525	mgr	Query	{}	{svc.Status,error}	*Service	2519
1526	windows	Sockaddr	{}	{windows.Sockaddr,error}	*RawSockaddrAny	2530
1527	windows	Exited	{}	{bool}	WaitStatus	2536
1528	windows	ExitStatus	{}	{int}	WaitStatus	2536
1529	windows	Signal	{}	{windows.Signal}	WaitStatus	2536
1530	windows	CoreDump	{}	{bool}	WaitStatus	2536
1531	windows	Stopped	{}	{bool}	WaitStatus	2536
1532	windows	Continued	{}	{bool}	WaitStatus	2536
1533	windows	StopSignal	{}	{windows.Signal}	WaitStatus	2536
1534	windows	Signaled	{}	{bool}	WaitStatus	2536
1535	windows	TrapCause	{}	{int}	WaitStatus	2536
1536	windows	Unix	{}	{int64,int64}	*Timespec	2537
1537	windows	Nano	{}	{int64}	*Timespec	2537
1538	windows	Signal	{}	{}	Signal	2541
1539	windows	String	{}	{string}	Signal	2541
1540	windows	Unix	{}	{int64,int64}	*Timeval	2542
1541	windows	Nano	{}	{int64}	*Timeval	2542
1542	windows	Nanoseconds	{}	{int64}	*Timeval	2542
1543	windows	Nanoseconds	{}	{int64}	*Filetime	2546
1544	cfg	Format	{*token.FileSet}	{string}	*CFG	2603
1545	cfg	String	{}	{string}	*Block	2604
1546	cfg	Return	{}	{*ast.ReturnStmt}	*Block	2604
1547	testdata	SetX	{int,"chan int\n"}	{}	*ST	2610
1548	testdata	AddUint64	{*uint64,uint64}	{uint64}	T	2612
1549	testdata	Foo	{}	{int}	T	2612
1550	testdata	M	{}	{}	T	2612
1551	testdata	OkMeth	{}	{}	*EmbeddedRWMutex	2617
1552	testdata	BadMeth	{}	{}	EmbeddedRWMutex	2617
1553	testdata	OkMeth	{}	{}	*FieldMutex	2618
1554	testdata	BadMeth	{}	{}	FieldMutex	2618
1555	testdata	Ok	{}	{}	*L0	2619
1556	testdata	Bad	{}	{}	L0	2619
1557	testdata	Ok	{}	{}	*EmbeddedMutexPointer	2622
1558	testdata	AlsoOk	{}	{}	EmbeddedMutexPointer	2622
1559	testdata	Ok	{}	{}	*EmbeddedLocker	2623
1560	testdata	AlsoOk	{}	{}	EmbeddedLocker	2623
1561	testdata	Lock	{}	{}	*CustomLock	2624
1562	testdata	Unlock	{}	{}	*CustomLock	2624
1563	testdata	Bad	{}	{}	LocalOnce	2625
1564	testdata	Bad	{}	{}	LocalMutex	2626
1565	buf	Append	{[]byte}	{}	*Buf	2628
1566	buf	Reset	{}	{}	Buf	2628
1567	buf	Len	{}	{int}	Buf	2628
1568	testdata	Scan	{fmt.ScanState,byte}	{}	*MethodTest	2629
1569	testdata	Format	{fmt.State,rune}	{}	*BoolFormatter	2632
1570	testdata	Format	{fmt.State,rune}	{}	FormatterVal	2633
1571	bzip2	Error	{}	{string}	StructuralError	2650
1572	flate	Write	{[]byte}	{int,error}	*Writer	2651
1573	flate	Flush	{}	{error}	*Writer	2651
1574	flate	Close	{}	{error}	*Writer	2651
1575	flate	Reset	{io.Writer}	{}	*Writer	2651
1576	flate	Error	{}	{string}	CorruptInputError	2652
1577	flate	Error	{}	{string}	InternalError	2653
1578	flate	Error	{}	{string}	*ReadError	2654
1579	flate	Error	{}	{string}	*WriteError	2655
1580	gzip	Reset	{io.Reader}	{error}	*Reader	2659
1581	gzip	Multistream	{bool}	{}	*Reader	2659
1582	gzip	Read	{[]byte}	{int,error}	*Reader	2659
1583	gzip	Close	{}	{error}	*Reader	2659
1584	gzip	Reset	{io.Writer}	{}	*Writer	2660
1585	gzip	Write	{[]byte}	{int,error}	*Writer	2660
1586	gzip	Flush	{}	{error}	*Writer	2660
1587	gzip	Close	{}	{error}	*Writer	2660
1588	zlib	Reset	{io.Writer}	{}	*Writer	2663
1590	zlib	Flush	{}	{error}	*Writer	2663
1591	zlib	Close	{}	{error}	*Writer	2663
1592	list	Next	{}	{*list.Element}	*Element	2665
1593	list	Prev	{}	{*list.Element}	*Element	2665
1594	list	Init	{}	{*list.List}	*List	2666
1595	list	Len	{}	{int}	*List	2666
1596	list	Front	{}	{*list.Element}	*List	2666
1597	list	Back	{}	{*list.Element}	*List	2666
1598	list	Remove	{*list.Element}	{"interface{}"}	*List	2666
1599	list	PushFront	{"interface{}"}	{*list.Element}	*List	2666
1600	list	PushBack	{"interface{}"}	{*list.Element}	*List	2666
1601	list	InsertBefore	{"interface{}",*list.Element}	{*list.Element}	*List	2666
1602	list	InsertAfter	{"interface{}",*list.Element}	{*list.Element}	*List	2666
1603	list	MoveToFront	{*list.Element}	{}	*List	2666
1604	list	MoveToBack	{*list.Element}	{}	*List	2666
1605	list	MoveBefore	{*list.Element,*list.Element}	{}	*List	2666
1606	list	MoveAfter	{*list.Element,*list.Element}	{}	*List	2666
1607	list	PushBackList	{*list.List}	{}	*List	2666
1608	list	PushFrontList	{*list.List}	{}	*List	2666
1609	ring	Next	{}	{*ring.Ring}	*Ring	2667
1610	ring	Prev	{}	{*ring.Ring}	*Ring	2667
1611	ring	Move	{int}	{*ring.Ring}	*Ring	2667
1612	ring	Link	{*ring.Ring}	{*ring.Ring}	*Ring	2667
1613	ring	Unlink	{int}	{*ring.Ring}	*Ring	2667
1614	ring	Len	{}	{int}	*Ring	2667
1615	ring	Do	{"func(interface{})"}	{}	*Ring	2667
1616	aes	Error	{}	{string}	KeySizeError	2670
1617	cipher	Read	{[]byte}	{int,error}	StreamReader	2675
1618	cipher	Write	{[]byte}	{int,error}	StreamWriter	2676
1619	cipher	Close	{}	{error}	StreamWriter	2676
1620	crypto	HashFunc	{}	{crypto.Hash}	Hash	2677
1621	crypto	Size	{}	{int}	Hash	2677
1622	crypto	New	{}	{hash.Hash}	Hash	2677
1623	crypto	Available	{}	{bool}	Hash	2677
1624	des	Error	{}	{string}	KeySizeError	2684
1625	ecdsa	Public	{}	{crypto.PublicKey}	*PrivateKey	2690
1626	ecdsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	2690
1627	elliptic	Params	{}	{*elliptic.CurveParams}	*CurveParams	2692
1628	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}	*CurveParams	2692
1629	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	2692
1630	elliptic	Double	{*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	2692
1631	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int,*big.Int}	*CurveParams	2692
1632	elliptic	ScalarBaseMult	{[]byte}	{*big.Int,*big.Int}	*CurveParams	2692
1633	rc4	Reset	{}	{}	*Cipher	2694
1634	rc4	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	2694
1635	rc4	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	2694
1636	rc4	Error	{}	{string}	KeySizeError	2695
1637	rsa	HashFunc	{}	{crypto.Hash}	*PSSOptions	2697
1638	rsa	Size	{}	{int}	*PublicKey	2698
1639	rsa	Public	{}	{crypto.PublicKey}	*PrivateKey	2700
1640	rsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	2700
1641	rsa	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}	*PrivateKey	2700
1642	rsa	Validate	{}	{error}	*PrivateKey	2700
1643	rsa	Precompute	{}	{}	*PrivateKey	2700
1644	tls	ExportKeyingMaterial	{string,[]byte,int}	{[]byte,error}	*ConnectionState	2704
1645	tls	Clone	{}	{*tls.Config}	*Config	2712
1646	tls	SetSessionTicketKeys	{[][]byte}	{}	*Config	2712
1647	tls	BuildNameToCertificate	{}	{}	*Config	2712
1648	tls	LocalAddr	{}	{net.Addr}	*Conn	2714
1649	tls	RemoteAddr	{}	{net.Addr}	*Conn	2714
1650	tls	SetDeadline	{time.Time}	{error}	*Conn	2714
1651	tls	SetReadDeadline	{time.Time}	{error}	*Conn	2714
1652	tls	SetWriteDeadline	{time.Time}	{error}	*Conn	2714
1653	tls	Write	{[]byte}	{int,error}	*Conn	2714
1654	tls	Read	{[]byte}	{int,error}	*Conn	2714
1655	tls	Close	{}	{error}	*Conn	2714
1656	tls	CloseWrite	{}	{error}	*Conn	2714
1657	tls	Handshake	{}	{error}	*Conn	2714
1658	tls	ConnectionState	{}	{tls.ConnectionState}	*Conn	2714
1659	tls	OCSPResponse	{}	{[]byte}	*Conn	2714
1660	tls	VerifyHostname	{string}	{error}	*Conn	2714
1661	tls	Error	{}	{string}	RecordHeaderError	2715
1662	x509	AddCert	{*x509.Certificate}	{}	*CertPool	2716
1663	x509	AppendCertsFromPEM	{[]byte}	{bool}	*CertPool	2716
1664	x509	Subjects	{}	{[][]byte}	*CertPool	2716
1665	pkix	String	{}	{string}	RDNSequence	2719
1666	pkix	FillFromRDNSequence	{*pkix.RDNSequence}	{}	*Name	2724
1667	pkix	ToRDNSequence	{}	{pkix.RDNSequence}	Name	2724
1668	pkix	String	{}	{string}	Name	2724
1669	pkix	HasExpired	{time.Time}	{bool}	*CertificateList	2725
1670	x509	Error	{}	{string}	CertificateInvalidError	2729
1671	x509	Error	{}	{string}	HostnameError	2730
1672	x509	Error	{}	{string}	UnknownAuthorityError	2731
1673	x509	Error	{}	{string}	SystemRootsError	2732
1674	x509	String	{}	{string}	SignatureAlgorithm	2734
1675	x509	String	{}	{string}	PublicKeyAlgorithm	2735
1676	x509	Verify	{x509.VerifyOptions}	{[][]*x509.Certificate,error}	*Certificate	2738
1677	x509	VerifyHostname	{string}	{error}	*Certificate	2738
1678	x509	Equal	{*x509.Certificate}	{bool}	*Certificate	2738
1679	x509	CheckSignatureFrom	{*x509.Certificate}	{error}	*Certificate	2738
1680	x509	CheckSignature	{x509.SignatureAlgorithm,[]byte,[]byte}	{error}	*Certificate	2738
1681	x509	CheckCRLSignature	{*pkix.CertificateList}	{error}	*Certificate	2738
1682	x509	CreateCRL	{io.Reader,"interface{}",[]pkix.RevokedCertificate,time.Time,time.Time}	{[]byte,error}	*Certificate	2738
1683	x509	Error	{}	{string}	InsecureAlgorithmError	2739
1684	x509	Error	{}	{string}	ConstraintViolationError	2740
1685	x509	Error	{}	{string}	UnhandledCriticalExtension	2741
1686	x509	CheckSignature	{}	{error}	*CertificateRequest	2742
1687	driver	LastInsertId	{}	{int64,error}	RowsAffected	2773
1688	driver	RowsAffected	{}	{int64,error}	RowsAffected	2773
1689	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	Null	2776
1690	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	NotNull	2777
1691	sql	String	{}	{string}	IsolationLevel	2779
1692	sql	Scan	{"interface{}"}	{error}	*NullString	2782
1693	sql	Value	{}	{driver.Value,error}	NullString	2782
1694	sql	Scan	{"interface{}"}	{error}	*NullInt64	2783
1695	sql	Value	{}	{driver.Value,error}	NullInt64	2783
1696	sql	Scan	{"interface{}"}	{error}	*NullFloat64	2784
1697	sql	Value	{}	{driver.Value,error}	NullFloat64	2784
1698	sql	Scan	{"interface{}"}	{error}	*NullBool	2785
1699	sql	Value	{}	{driver.Value,error}	NullBool	2785
1700	sql	PingContext	{context.Context}	{error}	*DB	2788
1701	sql	Ping	{}	{error}	*DB	2788
1702	sql	Close	{}	{error}	*DB	2788
1703	sql	SetMaxIdleConns	{int}	{}	*DB	2788
1704	sql	SetMaxOpenConns	{int}	{}	*DB	2788
1705	sql	SetConnMaxLifetime	{time.Duration}	{}	*DB	2788
1706	sql	Stats	{}	{sql.DBStats}	*DB	2788
1707	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*DB	2788
1708	sql	Prepare	{string}	{*sql.Stmt,error}	*DB	2788
1709	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*DB	2788
1710	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*DB	2788
1711	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*DB	2788
1712	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*DB	2788
1713	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*DB	2788
1714	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*DB	2788
1715	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*DB	2788
1716	sql	Begin	{}	{*sql.Tx,error}	*DB	2788
1717	sql	Driver	{}	{driver.Driver}	*DB	2788
1718	sql	Conn	{context.Context}	{*sql.Conn,error}	*DB	2788
1719	sql	PingContext	{context.Context}	{error}	*Conn	2790
1720	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Conn	2790
1721	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Conn	2790
1722	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Conn	2790
1723	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Conn	2790
1724	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*Conn	2790
1725	sql	Close	{}	{error}	*Conn	2790
1726	sql	Commit	{}	{error}	*Tx	2791
1727	sql	Rollback	{}	{error}	*Tx	2791
1728	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Tx	2791
1729	sql	Prepare	{string}	{*sql.Stmt,error}	*Tx	2791
1730	sql	StmtContext	{context.Context,*sql.Stmt}	{*sql.Stmt}	*Tx	2791
1731	sql	Stmt	{*sql.Stmt}	{*sql.Stmt}	*Tx	2791
1732	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Tx	2791
1733	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*Tx	2791
1734	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Tx	2791
1735	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*Tx	2791
1736	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Tx	2791
1737	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*Tx	2791
1738	sql	ExecContext	{context.Context,"...interface{}"}	{sql.Result,error}	*Stmt	2792
1739	sql	Exec	{"...interface{}"}	{sql.Result,error}	*Stmt	2792
1740	sql	QueryContext	{context.Context,"...interface{}"}	{*sql.Rows,error}	*Stmt	2792
1741	sql	Query	{"...interface{}"}	{*sql.Rows,error}	*Stmt	2792
1742	sql	QueryRowContext	{context.Context,"...interface{}"}	{*sql.Row}	*Stmt	2792
1743	sql	QueryRow	{"...interface{}"}	{*sql.Row}	*Stmt	2792
1744	sql	Close	{}	{error}	*Stmt	2792
1745	sql	Next	{}	{bool}	*Rows	2793
1746	sql	NextResultSet	{}	{bool}	*Rows	2793
1747	sql	Err	{}	{error}	*Rows	2793
1748	sql	Columns	{}	{[]string,error}	*Rows	2793
1749	sql	ColumnTypes	{}	{[]*sql.ColumnType,error}	*Rows	2793
1750	sql	Scan	{"...interface{}"}	{error}	*Rows	2793
1751	sql	Close	{}	{error}	*Rows	2793
1752	sql	Name	{}	{string}	*ColumnType	2794
1753	sql	Length	{}	{int64,bool}	*ColumnType	2794
1754	sql	DecimalSize	{}	{int64,bool}	*ColumnType	2794
1755	sql	ScanType	{}	{reflect.Type}	*ColumnType	2794
1756	sql	Nullable	{}	{bool}	*ColumnType	2794
1757	sql	DatabaseTypeName	{}	{string}	*ColumnType	2794
1758	sql	Scan	{"...interface{}"}	{error}	*Row	2795
1759	dwarf	Error	{}	{string}	DecodeError	2797
1760	dwarf	String	{}	{string}	Attr	2798
1761	dwarf	GoString	{}	{string}	Attr	2798
1762	dwarf	GoString	{}	{string}	Tag	2799
1763	dwarf	String	{}	{string}	Tag	2799
1764	dwarf	Val	{dwarf.Attr}	{"interface{}"}	*Entry	2800
1765	dwarf	AttrField	{dwarf.Attr}	{*dwarf.Field}	*Entry	2800
1766	dwarf	String	{}	{string}	Class	2802
1767	dwarf	GoString	{}	{string}	Class	2802
1768	dwarf	AddressSize	{}	{int}	*Reader	2804
1769	dwarf	Seek	{dwarf.Offset}	{}	*Reader	2804
1770	dwarf	Next	{}	{*dwarf.Entry,error}	*Reader	2804
1771	dwarf	SkipChildren	{}	{}	*Reader	2804
1772	dwarf	SeekPC	{uint64}	{*dwarf.Entry,error}	*Reader	2804
1773	dwarf	Next	{*dwarf.LineEntry}	{error}	*LineReader	2805
1774	dwarf	Tell	{}	{dwarf.LineReaderPos}	*LineReader	2805
1775	dwarf	Seek	{dwarf.LineReaderPos}	{}	*LineReader	2805
1776	dwarf	Reset	{}	{}	*LineReader	2805
1777	dwarf	SeekPC	{uint64,*dwarf.LineEntry}	{error}	*LineReader	2805
1778	dwarf	Reader	{}	{*dwarf.Reader}	*Data	2809
1779	dwarf	Ranges	{*dwarf.Entry}	{[][]uint64,error}	*Data	2809
1780	dwarf	LineReader	{*dwarf.Entry}	{*dwarf.LineReader,error}	*Data	2809
1781	dwarf	AddTypes	{string,[]byte}	{error}	*Data	2809
1782	dwarf	Type	{dwarf.Offset}	{dwarf.Type,error}	*Data	2809
1783	dwarf	Common	{}	{*dwarf.CommonType}	*CommonType	2811
1784	dwarf	Size	{}	{int64}	*CommonType	2811
1785	dwarf	Basic	{}	{*dwarf.BasicType}	*BasicType	2812
1786	dwarf	String	{}	{string}	*BasicType	2812
1787	dwarf	String	{}	{string}	*QualType	2822
1788	dwarf	Size	{}	{int64}	*QualType	2822
1789	dwarf	String	{}	{string}	*ArrayType	2823
1790	dwarf	Size	{}	{int64}	*ArrayType	2823
1791	dwarf	String	{}	{string}	*VoidType	2824
1792	dwarf	String	{}	{string}	*PtrType	2825
1793	dwarf	String	{}	{string}	*StructType	2826
1794	dwarf	Defn	{}	{string}	*StructType	2826
1795	dwarf	String	{}	{string}	*EnumType	2828
1796	dwarf	String	{}	{string}	*FuncType	2830
1797	dwarf	String	{}	{string}	*DotDotDotType	2831
1798	dwarf	String	{}	{string}	*TypedefType	2832
1799	dwarf	Size	{}	{int64}	*TypedefType	2832
1800	elf	String	{}	{string}	Version	2833
1801	elf	GoString	{}	{string}	Version	2833
1802	elf	String	{}	{string}	Class	2834
1803	elf	GoString	{}	{string}	Class	2834
1804	elf	String	{}	{string}	Data	2835
1805	elf	GoString	{}	{string}	Data	2835
1806	elf	String	{}	{string}	OSABI	2836
1807	elf	GoString	{}	{string}	OSABI	2836
1808	elf	String	{}	{string}	Type	2837
1809	elf	GoString	{}	{string}	Type	2837
1810	elf	String	{}	{string}	Machine	2838
1811	elf	GoString	{}	{string}	Machine	2838
1812	elf	String	{}	{string}	SectionIndex	2839
1813	elf	GoString	{}	{string}	SectionIndex	2839
1814	elf	String	{}	{string}	SectionType	2840
1815	elf	GoString	{}	{string}	SectionType	2840
1816	elf	String	{}	{string}	SectionFlag	2841
1817	elf	GoString	{}	{string}	SectionFlag	2841
1818	elf	String	{}	{string}	CompressionType	2842
1819	elf	GoString	{}	{string}	CompressionType	2842
1820	elf	String	{}	{string}	ProgType	2843
1821	elf	GoString	{}	{string}	ProgType	2843
1822	elf	String	{}	{string}	ProgFlag	2844
1823	elf	GoString	{}	{string}	ProgFlag	2844
1824	elf	String	{}	{string}	DynTag	2845
1825	elf	GoString	{}	{string}	DynTag	2845
1826	elf	String	{}	{string}	DynFlag	2846
1827	elf	GoString	{}	{string}	DynFlag	2846
1828	elf	String	{}	{string}	NType	2847
1829	elf	GoString	{}	{string}	NType	2847
1830	elf	String	{}	{string}	SymBind	2848
1831	elf	GoString	{}	{string}	SymBind	2848
1832	elf	String	{}	{string}	SymType	2849
1833	elf	GoString	{}	{string}	SymType	2849
1834	elf	String	{}	{string}	SymVis	2850
1835	elf	GoString	{}	{string}	SymVis	2850
1836	elf	String	{}	{string}	R_X86_64	2851
1837	elf	GoString	{}	{string}	R_X86_64	2851
1838	elf	String	{}	{string}	R_AARCH64	2852
1839	elf	GoString	{}	{string}	R_AARCH64	2852
1840	elf	String	{}	{string}	R_ALPHA	2853
1841	elf	GoString	{}	{string}	R_ALPHA	2853
1842	elf	String	{}	{string}	R_ARM	2854
1843	elf	GoString	{}	{string}	R_ARM	2854
1844	elf	String	{}	{string}	R_386	2855
1845	elf	GoString	{}	{string}	R_386	2855
1846	elf	String	{}	{string}	R_MIPS	2856
1847	elf	GoString	{}	{string}	R_MIPS	2856
1848	elf	String	{}	{string}	R_PPC	2857
1849	elf	GoString	{}	{string}	R_PPC	2857
1850	elf	String	{}	{string}	R_PPC64	2858
1851	elf	GoString	{}	{string}	R_PPC64	2858
1852	elf	String	{}	{string}	R_RISCV	2859
1853	elf	GoString	{}	{string}	R_RISCV	2859
1854	elf	String	{}	{string}	R_390	2860
1855	elf	GoString	{}	{string}	R_390	2860
1856	elf	String	{}	{string}	R_SPARC	2861
1857	elf	GoString	{}	{string}	R_SPARC	2861
1858	elf	Close	{}	{error}	*File	2879
1859	elf	SectionByType	{elf.SectionType}	{*elf.Section}	*File	2879
1860	elf	Section	{string}	{*elf.Section}	*File	2879
1861	elf	DWARF	{}	{*dwarf.Data,error}	*File	2879
1862	elf	Symbols	{}	{[]elf.Symbol,error}	*File	2879
1863	elf	DynamicSymbols	{}	{[]elf.Symbol,error}	*File	2879
1864	elf	ImportedSymbols	{}	{[]elf.ImportedSymbol,error}	*File	2879
1865	elf	ImportedLibraries	{}	{[]string,error}	*File	2879
1866	elf	DynString	{elf.DynTag}	{[]string,error}	*File	2879
1867	elf	Data	{}	{[]byte,error}	*Section	2881
1868	elf	Open	{}	{io.ReadSeeker}	*Section	2881
1869	elf	Open	{}	{io.ReadSeeker}	*Prog	2883
1870	elf	Error	{}	{string}	*FormatError	2885
1871	gosym	PCToLine	{uint64}	{int}	*LineTable	2887
1872	gosym	LineToPC	{int,uint64}	{uint64}	*LineTable	2887
1873	gosym	Static	{}	{bool}	*Sym	2888
1874	gosym	PackageName	{}	{string}	*Sym	2888
1875	gosym	ReceiverName	{}	{string}	*Sym	2888
1876	gosym	BaseName	{}	{string}	*Sym	2888
1877	gosym	PCToFunc	{uint64}	{*gosym.Func}	*Table	2891
1878	gosym	PCToLine	{uint64}	{string,int,*gosym.Func}	*Table	2891
1879	gosym	LineToPC	{string,int}	{uint64,*gosym.Func,error}	*Table	2891
1880	gosym	LookupSym	{string}	{*gosym.Sym}	*Table	2891
1881	gosym	LookupFunc	{string}	{*gosym.Func}	*Table	2891
1882	gosym	SymByAddr	{uint64}	{*gosym.Sym}	*Table	2891
1883	gosym	Error	{}	{string}	UnknownFileError	2892
1884	gosym	Error	{}	{string}	*UnknownLineError	2893
1885	gosym	Error	{}	{string}	*DecodingError	2894
1886	macho	Close	{}	{error}	*FatFile	2895
1887	macho	Close	{}	{error}	*File	2898
1888	macho	Segment	{string}	{*macho.Segment}	*File	2898
1889	macho	Section	{string}	{*macho.Section}	*File	2898
1890	macho	DWARF	{}	{*dwarf.Data,error}	*File	2898
1891	macho	ImportedSymbols	{}	{[]string,error}	*File	2898
1892	macho	ImportedLibraries	{}	{[]string,error}	*File	2898
1893	macho	Raw	{}	{[]byte}	LoadBytes	2900
1894	macho	Data	{}	{[]byte,error}	*Segment	2902
1895	macho	Open	{}	{io.ReadSeeker}	*Segment	2902
1896	macho	Data	{}	{[]byte,error}	*Section	2905
1897	macho	Open	{}	{io.ReadSeeker}	*Section	2905
1898	macho	Error	{}	{string}	*FormatError	2911
1899	macho	String	{}	{string}	Type	2913
1900	macho	GoString	{}	{string}	Type	2913
1901	macho	String	{}	{string}	Cpu	2914
1902	macho	GoString	{}	{string}	Cpu	2914
1903	macho	String	{}	{string}	LoadCmd	2915
1904	macho	GoString	{}	{string}	LoadCmd	2915
1905	macho	GoString	{}	{string}	RelocTypeGeneric	2929
1906	macho	String	{}	{string}	RelocTypeGeneric	2929
1907	macho	GoString	{}	{string}	RelocTypeX86_64	2930
1908	macho	String	{}	{string}	RelocTypeX86_64	2930
1909	macho	GoString	{}	{string}	RelocTypeARM	2931
1910	macho	String	{}	{string}	RelocTypeARM	2931
1911	macho	GoString	{}	{string}	RelocTypeARM64	2932
1912	macho	String	{}	{string}	RelocTypeARM64	2932
1913	pe	Close	{}	{error}	*File	2933
1914	pe	Section	{string}	{*pe.Section}	*File	2933
1915	pe	DWARF	{}	{*dwarf.Data,error}	*File	2933
1916	pe	ImportedSymbols	{}	{[]string,error}	*File	2933
1917	pe	ImportedLibraries	{}	{[]string,error}	*File	2933
1918	pe	Error	{}	{string}	*FormatError	2935
1919	pe	Data	{}	{[]byte,error}	*Section	2943
1920	pe	Open	{}	{io.ReadSeeker}	*Section	2943
1921	pe	String	{uint32}	{string,error}	StringTable	2944
1922	pe	FullName	{pe.StringTable}	{string,error}	*COFFSymbol	2945
1923	plan9obj	Close	{}	{error}	*File	2948
1924	plan9obj	Symbols	{}	{[]plan9obj.Sym,error}	*File	2948
1925	plan9obj	Section	{string}	{*plan9obj.Section}	*File	2948
1926	plan9obj	Data	{}	{[]byte,error}	*Section	2950
1927	plan9obj	Open	{}	{io.ReadSeeker}	*Section	2950
1928	ascii85	Error	{}	{string}	CorruptInputError	2952
1929	asn1	Error	{}	{string}	StructuralError	2953
1930	asn1	Error	{}	{string}	SyntaxError	2954
1931	asn1	At	{int}	{int}	BitString	2955
1932	asn1	RightAlign	{}	{[]byte}	BitString	2955
1933	asn1	Equal	{asn1.ObjectIdentifier}	{bool}	ObjectIdentifier	2956
1934	asn1	String	{}	{string}	ObjectIdentifier	2956
1935	base32	WithPadding	{rune}	{*base32.Encoding}	Encoding	2961
1936	base32	Encode	{[]byte,[]byte}	{}	*Encoding	2961
1937	base32	EncodeToString	{[]byte}	{string}	*Encoding	2961
1938	base32	EncodedLen	{int}	{int}	*Encoding	2961
1939	base32	Decode	{[]byte,[]byte}	{int,error}	*Encoding	2961
1940	base32	DecodeString	{string}	{[]byte,error}	*Encoding	2961
1941	base32	DecodedLen	{int}	{int}	*Encoding	2961
1942	base32	Error	{}	{string}	CorruptInputError	2962
1943	base64	WithPadding	{rune}	{*base64.Encoding}	Encoding	2963
1944	base64	Strict	{}	{*base64.Encoding}	Encoding	2963
1945	base64	Encode	{[]byte,[]byte}	{}	*Encoding	2963
1946	base64	EncodeToString	{[]byte}	{string}	*Encoding	2963
1947	base64	EncodedLen	{int}	{int}	*Encoding	2963
1948	base64	DecodeString	{string}	{[]byte,error}	*Encoding	2963
1949	base64	Decode	{[]byte,[]byte}	{int,error}	*Encoding	2963
1950	base64	DecodedLen	{int}	{int}	*Encoding	2963
1951	base64	Error	{}	{string}	CorruptInputError	2964
1952	csv	Error	{}	{string}	*ParseError	2966
1953	csv	Read	{}	{[]string,error}	*Reader	2967
1954	csv	ReadAll	{}	{[][]string,error}	*Reader	2967
1955	csv	Write	{[]string}	{error}	*Writer	2968
1956	csv	Flush	{}	{}	*Writer	2968
1957	csv	Error	{}	{error}	*Writer	2968
1958	csv	WriteAll	{[][]string}	{error}	*Writer	2968
1959	gob	Decode	{"interface{}"}	{error}	*Decoder	2974
1960	gob	DecodeValue	{reflect.Value}	{error}	*Decoder	2974
1961	gob	Encode	{"interface{}"}	{error}	*Encoder	2976
1962	gob	EncodeValue	{reflect.Value}	{error}	*Encoder	2976
1963	hex	Error	{}	{string}	InvalidByteError	2980
1964	json	Error	{}	{string}	*UnmarshalTypeError	2982
1965	json	Error	{}	{string}	*UnmarshalFieldError	2983
1966	json	Error	{}	{string}	*InvalidUnmarshalError	2984
1967	json	String	{}	{string}	Number	2985
1968	json	Float64	{}	{float64,error}	Number	2985
1969	json	Int64	{}	{int64,error}	Number	2985
1970	json	Error	{}	{string}	*UnsupportedTypeError	2987
1971	json	Error	{}	{string}	*UnsupportedValueError	2988
1972	json	Error	{}	{string}	*InvalidUTF8Error	2989
1973	json	Error	{}	{string}	*MarshalerError	2990
1974	json	Error	{}	{string}	*SyntaxError	2991
1975	json	UseNumber	{}	{}	*Decoder	2992
1976	json	DisallowUnknownFields	{}	{}	*Decoder	2992
1977	json	Decode	{"interface{}"}	{error}	*Decoder	2992
1978	json	Buffered	{}	{io.Reader}	*Decoder	2992
1979	json	Token	{}	{json.Token,error}	*Decoder	2992
1980	json	More	{}	{bool}	*Decoder	2992
1981	json	Encode	{"interface{}"}	{error}	*Encoder	2993
1982	json	SetIndent	{string,string}	{}	*Encoder	2993
1983	json	SetEscapeHTML	{bool}	{}	*Encoder	2993
1984	json	MarshalJSON	{}	{[]byte,error}	RawMessage	2994
1985	json	UnmarshalJSON	{[]byte}	{error}	*RawMessage	2994
1986	json	String	{}	{string}	Delim	2996
1987	xml	Indent	{string,string}	{}	*Encoder	3000
2406	color	RGBA	{}	{uint32}	Gray16	3298
1988	xml	Encode	{"interface{}"}	{error}	*Encoder	3000
1989	xml	EncodeElement	{"interface{}",xml.StartElement}	{error}	*Encoder	3000
1990	xml	EncodeToken	{xml.Token}	{error}	*Encoder	3000
1991	xml	Flush	{}	{error}	*Encoder	3000
1992	xml	Error	{}	{string}	*UnsupportedTypeError	3001
1993	xml	Error	{}	{string}	UnmarshalError	3002
1994	xml	Error	{}	{string}	*TagPathError	3005
1995	xml	Error	{}	{string}	*SyntaxError	3006
1996	xml	Copy	{}	{xml.StartElement}	StartElement	3010
1997	xml	End	{}	{xml.EndElement}	StartElement	3010
1998	xml	Copy	{}	{xml.CharData}	CharData	3012
1999	xml	Copy	{}	{xml.Comment}	Comment	3013
2000	xml	Copy	{}	{xml.ProcInst}	ProcInst	3014
2001	xml	Copy	{}	{xml.Directive}	Directive	3015
2002	xml	Decode	{"interface{}"}	{error}	*Decoder	3017
2003	xml	DecodeElement	{"interface{}",*xml.StartElement}	{error}	*Decoder	3017
2004	xml	Skip	{}	{error}	*Decoder	3017
2005	xml	Token	{}	{xml.Token,error}	*Decoder	3017
2006	xml	RawToken	{}	{xml.Token,error}	*Decoder	3017
2007	xml	InputOffset	{}	{int64}	*Decoder	3017
2008	expvar	Value	{}	{int64}	*Int	3019
2009	expvar	String	{}	{string}	*Int	3019
2010	expvar	Add	{int64}	{}	*Int	3019
2011	expvar	Set	{int64}	{}	*Int	3019
2012	expvar	Value	{}	{float64}	*Float	3020
2013	expvar	String	{}	{string}	*Float	3020
2014	expvar	Add	{float64}	{}	*Float	3020
2015	expvar	Set	{float64}	{}	*Float	3020
2016	expvar	String	{}	{string}	*Map	3021
2017	expvar	Init	{}	{*expvar.Map}	*Map	3021
2018	expvar	Get	{string}	{expvar.Var}	*Map	3021
2019	expvar	Set	{string,expvar.Var}	{}	*Map	3021
2020	expvar	Add	{string,int64}	{}	*Map	3021
2021	expvar	AddFloat	{string,float64}	{}	*Map	3021
2022	expvar	Do	{func(expvar.KeyValue)}	{}	*Map	3021
2023	expvar	Value	{}	{string}	*String	3023
2024	expvar	String	{}	{string}	*String	3023
2025	expvar	Set	{string}	{}	*String	3023
2026	expvar	Value	{}	{"interface{}"}	Func	3024
2027	expvar	String	{}	{string}	Func	3024
2028	flag	Output	{}	{io.Writer}	*FlagSet	3028
2029	flag	Name	{}	{string}	*FlagSet	3028
2030	flag	ErrorHandling	{}	{flag.ErrorHandling}	*FlagSet	3028
2031	flag	SetOutput	{io.Writer}	{}	*FlagSet	3028
2032	flag	VisitAll	{func(*flag.Flag)}	{}	*FlagSet	3028
2033	flag	Visit	{func(*flag.Flag)}	{}	*FlagSet	3028
2034	flag	Lookup	{string}	{*flag.Flag}	*FlagSet	3028
2035	flag	Set	{string,string}	{error}	*FlagSet	3028
2036	flag	PrintDefaults	{}	{}	*FlagSet	3028
2037	flag	NFlag	{}	{int}	*FlagSet	3028
2038	flag	Arg	{int}	{string}	*FlagSet	3028
2039	flag	NArg	{}	{int}	*FlagSet	3028
2040	flag	Args	{}	{[]string}	*FlagSet	3028
2041	flag	BoolVar	{*bool,string,bool,string}	{}	*FlagSet	3028
2042	flag	Bool	{string,bool,string}	{*bool}	*FlagSet	3028
2043	flag	IntVar	{*int,string,int,string}	{}	*FlagSet	3028
2044	flag	Int	{string,int,string}	{*int}	*FlagSet	3028
2045	flag	Int64Var	{*int64,string,int64,string}	{}	*FlagSet	3028
2046	flag	Int64	{string,int64,string}	{*int64}	*FlagSet	3028
2047	flag	UintVar	{*uint,string,uint,string}	{}	*FlagSet	3028
2048	flag	Uint	{string,uint,string}	{*uint}	*FlagSet	3028
2049	flag	Uint64Var	{*uint64,string,uint64,string}	{}	*FlagSet	3028
2050	flag	Uint64	{string,uint64,string}	{*uint64}	*FlagSet	3028
2051	flag	StringVar	{*string,string,string,string}	{}	*FlagSet	3028
2052	flag	String	{string,string,string}	{*string}	*FlagSet	3028
2053	flag	Float64Var	{*float64,string,float64,string}	{}	*FlagSet	3028
2054	flag	Float64	{string,float64,string}	{*float64}	*FlagSet	3028
2725	big	Error	{}	{string}	ErrNaN	3411
2055	flag	DurationVar	{*time.Duration,string,time.Duration,string}	{}	*FlagSet	3028
2056	flag	Duration	{string,time.Duration,string}	{*time.Duration}	*FlagSet	3028
2057	flag	Var	{flag.Value,string,string}	{}	*FlagSet	3028
2058	flag	Parse	{[]string}	{error}	*FlagSet	3028
2059	flag	Parsed	{}	{bool}	*FlagSet	3028
2060	flag	Init	{string,flag.ErrorHandling}	{}	*FlagSet	3028
2061	ast	Pos	{}	{token.Pos}	*Comment	3040
2062	ast	End	{}	{token.Pos}	*Comment	3040
2063	ast	Pos	{}	{token.Pos}	*CommentGroup	3041
2064	ast	End	{}	{token.Pos}	*CommentGroup	3041
2065	ast	Text	{}	{string}	*CommentGroup	3041
2066	ast	Pos	{}	{token.Pos}	*Field	3042
2067	ast	End	{}	{token.Pos}	*Field	3042
2068	ast	Pos	{}	{token.Pos}	*FieldList	3043
2069	ast	End	{}	{token.Pos}	*FieldList	3043
2070	ast	NumFields	{}	{int}	*FieldList	3043
2071	ast	Pos	{}	{token.Pos}	*BadExpr	3044
2072	ast	End	{}	{token.Pos}	*BadExpr	3044
2073	ast	Pos	{}	{token.Pos}	*Ident	3045
2074	ast	End	{}	{token.Pos}	*Ident	3045
2075	ast	IsExported	{}	{bool}	*Ident	3045
2076	ast	String	{}	{string}	*Ident	3045
2077	ast	Pos	{}	{token.Pos}	*Ellipsis	3046
2078	ast	End	{}	{token.Pos}	*Ellipsis	3046
2079	ast	Pos	{}	{token.Pos}	*BasicLit	3047
2080	ast	End	{}	{token.Pos}	*BasicLit	3047
2081	ast	Pos	{}	{token.Pos}	*FuncLit	3048
2082	ast	End	{}	{token.Pos}	*FuncLit	3048
2083	ast	Pos	{}	{token.Pos}	*CompositeLit	3049
2084	ast	End	{}	{token.Pos}	*CompositeLit	3049
2085	ast	Pos	{}	{token.Pos}	*ParenExpr	3050
2086	ast	End	{}	{token.Pos}	*ParenExpr	3050
2087	ast	Pos	{}	{token.Pos}	*SelectorExpr	3051
2088	ast	End	{}	{token.Pos}	*SelectorExpr	3051
2089	ast	Pos	{}	{token.Pos}	*IndexExpr	3052
2090	ast	End	{}	{token.Pos}	*IndexExpr	3052
2091	ast	Pos	{}	{token.Pos}	*SliceExpr	3053
2092	ast	End	{}	{token.Pos}	*SliceExpr	3053
2093	ast	Pos	{}	{token.Pos}	*TypeAssertExpr	3054
2094	ast	End	{}	{token.Pos}	*TypeAssertExpr	3054
2095	ast	Pos	{}	{token.Pos}	*CallExpr	3055
2096	ast	End	{}	{token.Pos}	*CallExpr	3055
2097	ast	Pos	{}	{token.Pos}	*StarExpr	3056
2098	ast	End	{}	{token.Pos}	*StarExpr	3056
2099	ast	Pos	{}	{token.Pos}	*UnaryExpr	3057
2100	ast	End	{}	{token.Pos}	*UnaryExpr	3057
2101	ast	Pos	{}	{token.Pos}	*BinaryExpr	3058
2102	ast	End	{}	{token.Pos}	*BinaryExpr	3058
2103	ast	Pos	{}	{token.Pos}	*KeyValueExpr	3059
2104	ast	End	{}	{token.Pos}	*KeyValueExpr	3059
2105	ast	Pos	{}	{token.Pos}	*ArrayType	3061
2106	ast	End	{}	{token.Pos}	*ArrayType	3061
2107	ast	Pos	{}	{token.Pos}	*StructType	3062
2108	ast	End	{}	{token.Pos}	*StructType	3062
2109	ast	Pos	{}	{token.Pos}	*FuncType	3063
2110	ast	End	{}	{token.Pos}	*FuncType	3063
2111	ast	Pos	{}	{token.Pos}	*InterfaceType	3064
2112	ast	End	{}	{token.Pos}	*InterfaceType	3064
2113	ast	Pos	{}	{token.Pos}	*MapType	3065
2114	ast	End	{}	{token.Pos}	*MapType	3065
2115	ast	Pos	{}	{token.Pos}	*ChanType	3066
2116	ast	End	{}	{token.Pos}	*ChanType	3066
2117	ast	Pos	{}	{token.Pos}	*BadStmt	3067
2118	ast	End	{}	{token.Pos}	*BadStmt	3067
2119	ast	Pos	{}	{token.Pos}	*DeclStmt	3068
2120	ast	End	{}	{token.Pos}	*DeclStmt	3068
2121	ast	Pos	{}	{token.Pos}	*EmptyStmt	3069
2122	ast	End	{}	{token.Pos}	*EmptyStmt	3069
2123	ast	Pos	{}	{token.Pos}	*LabeledStmt	3070
2124	ast	End	{}	{token.Pos}	*LabeledStmt	3070
2125	ast	Pos	{}	{token.Pos}	*ExprStmt	3071
2126	ast	End	{}	{token.Pos}	*ExprStmt	3071
2127	ast	Pos	{}	{token.Pos}	*SendStmt	3072
2128	ast	End	{}	{token.Pos}	*SendStmt	3072
2129	ast	Pos	{}	{token.Pos}	*IncDecStmt	3073
2130	ast	End	{}	{token.Pos}	*IncDecStmt	3073
2131	ast	Pos	{}	{token.Pos}	*AssignStmt	3074
2132	ast	End	{}	{token.Pos}	*AssignStmt	3074
2133	ast	Pos	{}	{token.Pos}	*GoStmt	3075
2134	ast	End	{}	{token.Pos}	*GoStmt	3075
2135	ast	Pos	{}	{token.Pos}	*DeferStmt	3076
2136	ast	End	{}	{token.Pos}	*DeferStmt	3076
2137	ast	Pos	{}	{token.Pos}	*ReturnStmt	3077
2138	ast	End	{}	{token.Pos}	*ReturnStmt	3077
2139	ast	Pos	{}	{token.Pos}	*BranchStmt	3078
2140	ast	End	{}	{token.Pos}	*BranchStmt	3078
2141	ast	Pos	{}	{token.Pos}	*BlockStmt	3079
2142	ast	End	{}	{token.Pos}	*BlockStmt	3079
2143	ast	Pos	{}	{token.Pos}	*IfStmt	3080
2144	ast	End	{}	{token.Pos}	*IfStmt	3080
2145	ast	Pos	{}	{token.Pos}	*CaseClause	3081
2146	ast	End	{}	{token.Pos}	*CaseClause	3081
2147	ast	Pos	{}	{token.Pos}	*SwitchStmt	3082
2148	ast	End	{}	{token.Pos}	*SwitchStmt	3082
2149	ast	Pos	{}	{token.Pos}	*TypeSwitchStmt	3083
2150	ast	End	{}	{token.Pos}	*TypeSwitchStmt	3083
2151	ast	Pos	{}	{token.Pos}	*CommClause	3084
2152	ast	End	{}	{token.Pos}	*CommClause	3084
2153	ast	Pos	{}	{token.Pos}	*SelectStmt	3085
2154	ast	End	{}	{token.Pos}	*SelectStmt	3085
2155	ast	Pos	{}	{token.Pos}	*ForStmt	3086
2156	ast	End	{}	{token.Pos}	*ForStmt	3086
2157	ast	Pos	{}	{token.Pos}	*RangeStmt	3087
2158	ast	End	{}	{token.Pos}	*RangeStmt	3087
2159	ast	Pos	{}	{token.Pos}	*ImportSpec	3089
2160	ast	End	{}	{token.Pos}	*ImportSpec	3089
2161	ast	Pos	{}	{token.Pos}	*ValueSpec	3090
2162	ast	End	{}	{token.Pos}	*ValueSpec	3090
2163	ast	Pos	{}	{token.Pos}	*TypeSpec	3091
2164	ast	End	{}	{token.Pos}	*TypeSpec	3091
2165	ast	Pos	{}	{token.Pos}	*BadDecl	3092
2166	ast	End	{}	{token.Pos}	*BadDecl	3092
2167	ast	Pos	{}	{token.Pos}	*GenDecl	3093
2168	ast	End	{}	{token.Pos}	*GenDecl	3093
2169	ast	Pos	{}	{token.Pos}	*FuncDecl	3094
2170	ast	End	{}	{token.Pos}	*FuncDecl	3094
2171	ast	Pos	{}	{token.Pos}	*File	3095
2172	ast	End	{}	{token.Pos}	*File	3095
2173	ast	Pos	{}	{token.Pos}	*Package	3096
2174	ast	End	{}	{token.Pos}	*Package	3096
2175	ast	Update	{ast.Node,ast.Node}	{ast.Node}	CommentMap	3097
2176	ast	Filter	{ast.Node}	{ast.CommentMap}	CommentMap	3097
2177	ast	Comments	{}	{[]*ast.CommentGroup}	CommentMap	3097
2178	ast	String	{}	{string}	CommentMap	3097
2179	ast	Lookup	{string}	{*ast.Object}	*Scope	3102
2180	ast	Insert	{*ast.Object}	{*ast.Object}	*Scope	3102
2181	ast	String	{}	{string}	*Scope	3102
2182	ast	Pos	{}	{token.Pos}	*Object	3103
2183	ast	String	{}	{string}	ObjKind	3104
2184	build	SrcDirs	{}	{[]string}	*Context	3106
2185	build	ImportDir	{string,build.ImportMode}	{*build.Package,error}	*Context	3106
2186	build	Import	{string,string,build.ImportMode}	{*build.Package,error}	*Context	3106
2187	build	MatchFile	{string,string}	{bool,error}	*Context	3106
2188	build	IsCommand	{}	{bool}	*Package	3108
2189	build	Error	{}	{string}	*NoGoError	3109
2190	build	Error	{}	{string}	*MultiplePackageError	3110
2191	doc	Filter	{doc.Filter}	{}	*Package	3113
2192	b	M	{}	{}	*T	3121
2193	testing	StartTimer	{}	{}	*B	3123
2194	testing	StopTimer	{}	{}	*B	3123
2195	testing	ResetTimer	{}	{}	*B	3123
2196	testing	SetBytes	{int64}	{}	*B	3123
2197	testing	StartTimer	{}	{}	*B	3123
2198	testing	StopTimer	{}	{}	*B	3123
2199	testing	ResetTimer	{}	{}	*B	3123
2200	testing	SetBytes	{int64}	{}	*B	3123
2201	testing	ReportAllocs	{}	{}	*B	3123
2202	testing	Run	{string,func(*testing.B)}	{bool}	*B	3123
2203	testing	RunParallel	{func(*testing.PB)}	{}	*B	3123
2204	testing	SetParallelism	{int}	{}	*B	3123
2205	testing	NsPerOp	{}	{int64}	BenchmarkResult	3124
2206	testing	String	{}	{string}	BenchmarkResult	3124
2207	testing	NsPerOp	{}	{int64}	BenchmarkResult	3124
2208	testing	AllocsPerOp	{}	{int64}	BenchmarkResult	3124
2209	testing	AllocedBytesPerOp	{}	{int64}	BenchmarkResult	3124
2210	testing	String	{}	{string}	BenchmarkResult	3124
2211	testing	MemString	{}	{string}	BenchmarkResult	3124
2212	c	M	{}	{}	*T1	3135
2213	e	M	{}	{}	T2	3144
2214	e	M	{}	{}	T3	3145
2215	e	M	{}	{}	*T4	3146
2216	e	M	{}	{}	*U1	3149
2217	e	M	{}	{}	*U2	3150
2218	e	N	{}	{}	*U3	3151
2219	e	M	{}	{}	*U4	3152
2220	e	M	{}	{}	*V4	3156
2221	e	M	{}	{}	*V6	3158
2222	testing	Parallel	{}	{}	*T	3169
2223	testing	Parallel	{}	{}	*T	3169
2224	testing	Run	{string,func(*testing.T)}	{bool}	*T	3169
2225	gccgoimporter	InitFromDriver	{string}	{error}	*GccgoInstallation	3172
2226	gccgoimporter	SearchPaths	{}	{[]string}	*GccgoInstallation	3172
2227	gccgoimporter	GetImporter	{[]string,map[*types.Package]gccgoimporter.InitData}	{gccgoimporter.Importer}	*GccgoInstallation	3172
2228	escapeinfo	Read	{[]byte}	{}	*T	3177
2229	exports	M1	{}	{}	*T1	3181
2230	issue25301	M	{}	{}	S	3214
2231	srcimporter	Import	{string}	{*types.Package,error}	*Importer	3218
2232	srcimporter	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}	*Importer	3218
2233	printer	Fprint	{io.Writer,*token.FileSet,"interface{}"}	{error}	*Config	3221
2234	scanner	Error	{}	{string}	Error	3223
2235	scanner	Add	{token.Position,string}	{}	*ErrorList	3224
2236	scanner	Reset	{}	{}	*ErrorList	3224
2237	scanner	Len	{}	{int}	ErrorList	3224
2238	scanner	Swap	{int,int}	{}	ErrorList	3224
2239	scanner	Less	{int,int}	{bool}	ErrorList	3224
2240	scanner	Sort	{}	{}	ErrorList	3224
2241	scanner	RemoveMultiples	{}	{}	*ErrorList	3224
2242	scanner	Error	{}	{string}	ErrorList	3224
2243	scanner	Err	{}	{error}	ErrorList	3224
2244	scanner	Init	{*token.File,[]byte,scanner.ErrorHandler,scanner.Mode}	{}	*Scanner	3226
2245	scanner	Scan	{}	{token.Pos,token.Token,string}	*Scanner	3226
2246	scanner	Init	{io.Reader}	{*scanner.Scanner}	*Scanner	3226
2247	scanner	Next	{}	{rune}	*Scanner	3226
2248	scanner	Peek	{}	{rune}	*Scanner	3226
2249	scanner	Scan	{}	{rune}	*Scanner	3226
2250	scanner	Pos	{}	{scanner.Position}	*Scanner	3226
2251	scanner	TokenText	{}	{string}	*Scanner	3226
2252	token	IsValid	{}	{bool}	*Position	3228
2253	token	String	{}	{string}	Position	3228
2254	token	IsValid	{}	{bool}	Pos	3229
2255	token	Name	{}	{string}	*File	3230
2256	token	Base	{}	{int}	*File	3230
2257	token	Size	{}	{int}	*File	3230
2258	token	LineCount	{}	{int}	*File	3230
2259	token	AddLine	{int}	{}	*File	3230
2260	token	MergeLine	{int}	{}	*File	3230
2261	token	SetLines	{[]int}	{bool}	*File	3230
2262	token	SetLinesForContent	{[]byte}	{}	*File	3230
2263	token	AddLineInfo	{int,string,int}	{}	*File	3230
2264	token	AddLineColumnInfo	{int,string,int,int}	{}	*File	3230
2265	token	Pos	{int}	{token.Pos}	*File	3230
2266	token	Offset	{token.Pos}	{int}	*File	3230
2267	token	Line	{token.Pos}	{int}	*File	3230
2268	token	PositionFor	{token.Pos,bool}	{token.Position}	*File	3230
2269	token	Position	{token.Pos}	{token.Position}	*File	3230
2270	token	Base	{}	{int}	*FileSet	3231
2271	token	AddFile	{string,int,int}	{*token.File}	*FileSet	3231
2272	token	Iterate	{"func(*token.File) bool"}	{}	*FileSet	3231
2273	token	File	{token.Pos}	{*token.File}	*FileSet	3231
2274	token	PositionFor	{token.Pos,bool}	{token.Position}	*FileSet	3231
2275	token	Position	{token.Pos}	{token.Position}	*FileSet	3231
2276	token	Read	{"func(interface{}) error"}	{error}	*FileSet	3231
2277	token	Write	{"func(interface{}) error"}	{error}	*FileSet	3231
2278	token	String	{}	{string}	Token	3232
2279	token	Precedence	{}	{int}	Token	3232
2280	token	IsLiteral	{}	{bool}	Token	3232
2281	token	IsOperator	{}	{bool}	Token	3232
2282	token	IsKeyword	{}	{bool}	Token	3232
2283	types	Error	{}	{string}	Error	3233
2284	types	Check	{string,*token.FileSet,[]*ast.File,*types.Info}	{*types.Package,error}	*Config	3237
2285	types	TypeOf	{ast.Expr}	{types.Type}	*Info	3238
2286	types	ObjectOf	{*ast.Ident}	{types.Object}	*Info	3238
2287	types	IsVoid	{}	{bool}	TypeAndValue	3239
2288	types	IsType	{}	{bool}	TypeAndValue	3239
2289	types	IsBuiltin	{}	{bool}	TypeAndValue	3239
2290	types	IsValue	{}	{bool}	TypeAndValue	3239
2291	types	IsNil	{}	{bool}	TypeAndValue	3239
2292	types	Addressable	{}	{bool}	TypeAndValue	3239
2293	types	Assignable	{}	{bool}	TypeAndValue	3239
2294	types	HasOk	{}	{bool}	TypeAndValue	3239
2295	types	String	{}	{string}	*Initializer	3240
2296	types	Files	{[]*ast.File}	{error}	*Checker	3241
2297	types	String	{}	{string}	*MethodSet	3242
2298	types	Len	{}	{int}	*MethodSet	3242
2299	types	At	{int}	{*types.Selection}	*MethodSet	3242
2300	types	Lookup	{*types.Package,string}	{*types.Selection}	*MethodSet	3242
2301	types	Imported	{}	{*types.Package}	*PkgName	3244
2302	types	String	{}	{string}	*PkgName	3244
2303	types	Val	{}	{constant.Value}	*Const	3245
2304	types	String	{}	{string}	*Const	3245
2305	types	IsAlias	{}	{bool}	*TypeName	3246
2306	types	String	{}	{string}	*TypeName	3246
2307	types	Anonymous	{}	{bool}	*Var	3247
2308	types	Embedded	{}	{bool}	*Var	3247
2309	types	IsField	{}	{bool}	*Var	3247
2310	types	String	{}	{string}	*Var	3247
2311	types	String	{}	{string}	*Label	3249
2312	types	String	{}	{string}	*Builtin	3250
2313	types	String	{}	{string}	*Nil	3251
2314	types	Path	{}	{string}	*Package	3252
2315	types	Name	{}	{string}	*Package	3252
2316	types	SetName	{string}	{}	*Package	3252
2317	types	Scope	{}	{*types.Scope}	*Package	3252
2318	types	Complete	{}	{bool}	*Package	3252
2319	types	MarkComplete	{}	{}	*Package	3252
2320	types	Imports	{}	{[]*types.Package}	*Package	3252
2321	types	SetImports	{[]*types.Package}	{}	*Package	3252
2322	types	String	{}	{string}	*Package	3252
2323	types	Parent	{}	{*types.Scope}	*Scope	3253
2324	types	Len	{}	{int}	*Scope	3253
2325	types	Names	{}	{[]string}	*Scope	3253
2326	types	NumChildren	{}	{int}	*Scope	3253
2327	types	Child	{int}	{*types.Scope}	*Scope	3253
2328	types	Lookup	{string}	{types.Object}	*Scope	3253
2329	types	LookupParent	{string,token.Pos}	{*types.Scope,types.Object}	*Scope	3253
2330	types	Insert	{types.Object}	{types.Object}	*Scope	3253
2331	types	Pos	{}	{token.Pos}	*Scope	3253
2332	types	End	{}	{token.Pos}	*Scope	3253
2333	types	Contains	{token.Pos}	{bool}	*Scope	3253
2334	types	Innermost	{token.Pos}	{*types.Scope}	*Scope	3253
2335	types	WriteTo	{io.Writer,int,bool}	{}	*Scope	3253
2336	types	String	{}	{string}	*Scope	3253
2337	types	Kind	{}	{types.SelectionKind}	*Selection	3255
2338	types	Recv	{}	{types.Type}	*Selection	3255
2339	types	Obj	{}	{types.Object}	*Selection	3255
2340	types	Type	{}	{types.Type}	*Selection	3255
2341	types	Index	{}	{[]int}	*Selection	3255
2342	types	Indirect	{}	{bool}	*Selection	3255
2343	types	String	{}	{string}	*Selection	3255
2344	types	Alignof	{types.Type}	{int64}	*StdSizes	3257
2345	types	Offsetsof	{[]*types.Var}	{[]int64}	*StdSizes	3257
2346	types	Sizeof	{types.Type}	{int64}	*StdSizes	3257
2347	types	Kind	{}	{types.BasicKind}	*Basic	3261
2348	types	Info	{}	{types.BasicInfo}	*Basic	3261
2349	types	Name	{}	{string}	*Basic	3261
2350	types	Underlying	{}	{types.Type}	*Basic	3261
2351	types	String	{}	{string}	*Basic	3261
2352	types	Elem	{}	{types.Type}	*Pointer	3265
2353	types	Underlying	{}	{types.Type}	*Pointer	3265
2354	types	String	{}	{string}	*Pointer	3265
2355	types	Recv	{}	{*types.Var}	*Signature	3267
2356	types	Params	{}	{*types.Tuple}	*Signature	3267
2357	types	Results	{}	{*types.Tuple}	*Signature	3267
2358	types	Variadic	{}	{bool}	*Signature	3267
2359	types	Underlying	{}	{types.Type}	*Signature	3267
2360	types	String	{}	{string}	*Signature	3267
2361	types	Obj	{}	{*types.TypeName}	*Named	3272
2362	types	NumMethods	{}	{int}	*Named	3272
2363	types	Method	{int}	{*types.Func}	*Named	3272
2364	types	SetUnderlying	{types.Type}	{}	*Named	3272
2365	types	AddMethod	{*types.Func}	{}	*Named	3272
2366	types	Underlying	{}	{types.Type}	*Named	3272
2367	types	String	{}	{string}	*Named	3272
2368	template	Error	{}	{string}	*Error	3286
2369	template	Templates	{}	{[]*template.Template}	*Template	3288
2370	template	Option	{...string}	{*template.Template}	*Template	3288
2371	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	3288
2372	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	3288
2373	template	DefinedTemplates	{}	{string}	*Template	3288
2374	template	Parse	{string}	{*template.Template,error}	*Template	3288
2375	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	3288
2376	template	Clone	{}	{*template.Template,error}	*Template	3288
2377	template	New	{string}	{*template.Template}	*Template	3288
2378	template	Name	{}	{string}	*Template	3288
2379	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	3288
2380	template	Delims	{string,string}	{*template.Template}	*Template	3288
2381	template	Lookup	{string}	{*template.Template}	*Template	3288
2382	template	ParseFiles	{...string}	{*template.Template,error}	*Template	3288
2383	template	ParseGlob	{string}	{*template.Template,error}	*Template	3288
2384	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	3288
2385	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	3288
2386	template	DefinedTemplates	{}	{string}	*Template	3288
2387	template	ParseFiles	{...string}	{*template.Template,error}	*Template	3288
2388	template	ParseGlob	{string}	{*template.Template,error}	*Template	3288
2389	template	Option	{...string}	{*template.Template}	*Template	3288
2390	template	Name	{}	{string}	*Template	3288
2391	template	New	{string}	{*template.Template}	*Template	3288
2392	template	Clone	{}	{*template.Template,error}	*Template	3288
2393	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	3288
2394	template	Templates	{}	{[]*template.Template}	*Template	3288
2395	template	Delims	{string,string}	{*template.Template}	*Template	3288
2396	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	3288
2397	template	Lookup	{string}	{*template.Template}	*Template	3288
2398	template	Parse	{string}	{*template.Template,error}	*Template	3288
2399	color	RGBA	{}	{uint32}	RGBA	3291
2400	color	RGBA	{}	{uint32}	RGBA64	3292
2401	color	RGBA	{}	{uint32}	NRGBA	3293
2402	color	RGBA	{}	{uint32}	NRGBA64	3294
2403	color	RGBA	{}	{uint32}	Alpha	3295
2404	color	RGBA	{}	{uint32}	Alpha16	3296
2405	color	RGBA	{}	{uint32}	Gray	3297
2407	color	Convert	{color.Color}	{color.Color}	Palette	3300
2408	color	Index	{color.Color}	{int}	Palette	3300
2409	color	RGBA	{}	{uint32,uint32,uint32,uint32}	YCbCr	3301
2410	color	RGBA	{}	{uint32,uint32,uint32,uint32}	NYCbCrA	3302
2411	color	RGBA	{}	{uint32,uint32,uint32,uint32}	CMYK	3303
2412	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}	Op	3306
2413	image	String	{}	{string}	Point	3308
2414	image	Add	{image.Point}	{image.Point}	Point	3308
2415	image	Sub	{image.Point}	{image.Point}	Point	3308
2416	image	Mul	{int}	{image.Point}	Point	3308
2417	image	Div	{int}	{image.Point}	Point	3308
2418	image	In	{image.Rectangle}	{bool}	Point	3308
2419	image	Mod	{image.Rectangle}	{image.Point}	Point	3308
2420	image	Eq	{image.Point}	{bool}	Point	3308
2421	image	String	{}	{string}	Rectangle	3309
2422	image	Dx	{}	{int}	Rectangle	3309
2423	image	Dy	{}	{int}	Rectangle	3309
2424	image	Size	{}	{image.Point}	Rectangle	3309
2425	image	Add	{image.Point}	{image.Rectangle}	Rectangle	3309
2426	image	Sub	{image.Point}	{image.Rectangle}	Rectangle	3309
2427	image	Inset	{int}	{image.Rectangle}	Rectangle	3309
2428	image	Intersect	{image.Rectangle}	{image.Rectangle}	Rectangle	3309
2429	image	Union	{image.Rectangle}	{image.Rectangle}	Rectangle	3309
2430	image	Empty	{}	{bool}	Rectangle	3309
2431	image	Eq	{image.Rectangle}	{bool}	Rectangle	3309
2432	image	Overlaps	{image.Rectangle}	{bool}	Rectangle	3309
2433	image	In	{image.Rectangle}	{bool}	Rectangle	3309
2434	image	Canon	{}	{image.Rectangle}	Rectangle	3309
2435	image	At	{int,int}	{color.Color}	Rectangle	3309
2436	image	Bounds	{}	{image.Rectangle}	Rectangle	3309
2437	image	ColorModel	{}	{color.Model}	Rectangle	3309
2438	image	ColorModel	{}	{color.Model}	*RGBA	3315
2439	image	Bounds	{}	{image.Rectangle}	*RGBA	3315
2440	image	At	{int,int}	{color.Color}	*RGBA	3315
2441	image	RGBAAt	{int,int}	{color.RGBA}	*RGBA	3315
2442	image	PixOffset	{int,int}	{int}	*RGBA	3315
2443	image	Set	{int,int,color.Color}	{}	*RGBA	3315
2444	image	SetRGBA	{int,int,color.RGBA}	{}	*RGBA	3315
2445	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA	3315
2446	image	Opaque	{}	{bool}	*RGBA	3315
2447	image	ColorModel	{}	{color.Model}	*RGBA64	3316
2448	image	Bounds	{}	{image.Rectangle}	*RGBA64	3316
2449	image	At	{int,int}	{color.Color}	*RGBA64	3316
2450	image	RGBA64At	{int,int}	{color.RGBA64}	*RGBA64	3316
2451	image	PixOffset	{int,int}	{int}	*RGBA64	3316
2452	image	Set	{int,int,color.Color}	{}	*RGBA64	3316
2453	image	SetRGBA64	{int,int,color.RGBA64}	{}	*RGBA64	3316
2454	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA64	3316
2455	image	Opaque	{}	{bool}	*RGBA64	3316
2456	image	ColorModel	{}	{color.Model}	*NRGBA	3317
2457	image	Bounds	{}	{image.Rectangle}	*NRGBA	3317
2458	image	At	{int,int}	{color.Color}	*NRGBA	3317
2459	image	NRGBAAt	{int,int}	{color.NRGBA}	*NRGBA	3317
2460	image	PixOffset	{int,int}	{int}	*NRGBA	3317
2461	image	Set	{int,int,color.Color}	{}	*NRGBA	3317
2462	image	SetNRGBA	{int,int,color.NRGBA}	{}	*NRGBA	3317
2463	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA	3317
2464	image	Opaque	{}	{bool}	*NRGBA	3317
2465	image	ColorModel	{}	{color.Model}	*NRGBA64	3318
2466	image	Bounds	{}	{image.Rectangle}	*NRGBA64	3318
2467	image	At	{int,int}	{color.Color}	*NRGBA64	3318
2468	image	NRGBA64At	{int,int}	{color.NRGBA64}	*NRGBA64	3318
2469	image	PixOffset	{int,int}	{int}	*NRGBA64	3318
2470	image	Set	{int,int,color.Color}	{}	*NRGBA64	3318
2982	net	String	{}	{string}	IPMask	3491
2471	image	SetNRGBA64	{int,int,color.NRGBA64}	{}	*NRGBA64	3318
2472	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA64	3318
2473	image	Opaque	{}	{bool}	*NRGBA64	3318
2474	image	ColorModel	{}	{color.Model}	*Alpha	3319
2475	image	Bounds	{}	{image.Rectangle}	*Alpha	3319
2476	image	At	{int,int}	{color.Color}	*Alpha	3319
2477	image	AlphaAt	{int,int}	{color.Alpha}	*Alpha	3319
2478	image	PixOffset	{int,int}	{int}	*Alpha	3319
2479	image	Set	{int,int,color.Color}	{}	*Alpha	3319
2480	image	SetAlpha	{int,int,color.Alpha}	{}	*Alpha	3319
2481	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha	3319
2482	image	Opaque	{}	{bool}	*Alpha	3319
2483	image	ColorModel	{}	{color.Model}	*Alpha16	3320
2484	image	Bounds	{}	{image.Rectangle}	*Alpha16	3320
2485	image	At	{int,int}	{color.Color}	*Alpha16	3320
2486	image	Alpha16At	{int,int}	{color.Alpha16}	*Alpha16	3320
2487	image	PixOffset	{int,int}	{int}	*Alpha16	3320
2488	image	Set	{int,int,color.Color}	{}	*Alpha16	3320
2489	image	SetAlpha16	{int,int,color.Alpha16}	{}	*Alpha16	3320
2490	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha16	3320
2491	image	Opaque	{}	{bool}	*Alpha16	3320
2492	image	ColorModel	{}	{color.Model}	*Gray	3321
2493	image	Bounds	{}	{image.Rectangle}	*Gray	3321
2494	image	At	{int,int}	{color.Color}	*Gray	3321
2495	image	GrayAt	{int,int}	{color.Gray}	*Gray	3321
2496	image	PixOffset	{int,int}	{int}	*Gray	3321
2497	image	Set	{int,int,color.Color}	{}	*Gray	3321
2498	image	SetGray	{int,int,color.Gray}	{}	*Gray	3321
2499	image	SubImage	{image.Rectangle}	{image.Image}	*Gray	3321
2500	image	Opaque	{}	{bool}	*Gray	3321
2501	image	ColorModel	{}	{color.Model}	*Gray16	3322
2502	image	Bounds	{}	{image.Rectangle}	*Gray16	3322
2503	image	At	{int,int}	{color.Color}	*Gray16	3322
2504	image	Gray16At	{int,int}	{color.Gray16}	*Gray16	3322
2505	image	PixOffset	{int,int}	{int}	*Gray16	3322
2506	image	Set	{int,int,color.Color}	{}	*Gray16	3322
2507	image	SetGray16	{int,int,color.Gray16}	{}	*Gray16	3322
2508	image	SubImage	{image.Rectangle}	{image.Image}	*Gray16	3322
2509	image	Opaque	{}	{bool}	*Gray16	3322
2510	image	ColorModel	{}	{color.Model}	*CMYK	3323
2511	image	Bounds	{}	{image.Rectangle}	*CMYK	3323
2512	image	At	{int,int}	{color.Color}	*CMYK	3323
2513	image	CMYKAt	{int,int}	{color.CMYK}	*CMYK	3323
2514	image	PixOffset	{int,int}	{int}	*CMYK	3323
2515	image	Set	{int,int,color.Color}	{}	*CMYK	3323
2516	image	SetCMYK	{int,int,color.CMYK}	{}	*CMYK	3323
2517	image	SubImage	{image.Rectangle}	{image.Image}	*CMYK	3323
2518	image	Opaque	{}	{bool}	*CMYK	3323
2519	image	ColorModel	{}	{color.Model}	*Paletted	3324
2520	image	Bounds	{}	{image.Rectangle}	*Paletted	3324
2521	image	At	{int,int}	{color.Color}	*Paletted	3324
2522	image	PixOffset	{int,int}	{int}	*Paletted	3324
2523	image	Set	{int,int,color.Color}	{}	*Paletted	3324
2524	image	ColorIndexAt	{int,int}	{uint8}	*Paletted	3324
2525	image	SetColorIndex	{int,int,uint8}	{}	*Paletted	3324
2526	image	SubImage	{image.Rectangle}	{image.Image}	*Paletted	3324
2527	image	Opaque	{}	{bool}	*Paletted	3324
2528	jpeg	Error	{}	{string}	FormatError	3325
2529	jpeg	Error	{}	{string}	UnsupportedError	3326
2530	image	RGBA	{}	{uint32}	*Uniform	3329
2531	image	ColorModel	{}	{color.Model}	*Uniform	3329
2532	image	Convert	{color.Color}	{color.Color}	*Uniform	3329
2533	image	Bounds	{}	{image.Rectangle}	*Uniform	3329
2534	image	At	{int,int}	{color.Color}	*Uniform	3329
2535	image	Opaque	{}	{bool}	*Uniform	3329
2536	png	Error	{}	{string}	FormatError	3330
2537	png	Error	{}	{string}	UnsupportedError	3331
2538	png	Encode	{io.Writer,image.Image}	{error}	*Encoder	3332
2539	image	String	{}	{string}	YCbCrSubsampleRatio	3336
2540	image	ColorModel	{}	{color.Model}	*YCbCr	3337
2541	image	Bounds	{}	{image.Rectangle}	*YCbCr	3337
2542	image	At	{int,int}	{color.Color}	*YCbCr	3337
2543	image	YCbCrAt	{int,int}	{color.YCbCr}	*YCbCr	3337
2544	image	YOffset	{int,int}	{int}	*YCbCr	3337
2545	image	COffset	{int,int}	{int}	*YCbCr	3337
2546	image	SubImage	{image.Rectangle}	{image.Image}	*YCbCr	3337
2547	image	Opaque	{}	{bool}	*YCbCr	3337
2548	image	ColorModel	{}	{color.Model}	*NYCbCrA	3338
2549	image	At	{int,int}	{color.Color}	*NYCbCrA	3338
2550	image	NYCbCrAAt	{int,int}	{color.NYCbCrA}	*NYCbCrA	3338
2551	image	AOffset	{int,int}	{int}	*NYCbCrA	3338
2552	image	SubImage	{image.Rectangle}	{image.Image}	*NYCbCrA	3338
2553	image	Opaque	{}	{bool}	*NYCbCrA	3338
2554	suffixarray	Read	{io.Reader}	{error}	*Index	3339
2555	suffixarray	Write	{io.Writer}	{error}	*Index	3339
2556	suffixarray	Bytes	{}	{[]byte}	*Index	3339
2557	suffixarray	Lookup	{[]byte,int}	{[]int}	*Index	3339
2558	suffixarray	FindAllIndex	{*regexp.Regexp,int}	{[][]int}	*Index	3339
2559	poll	Error	{}	{string}	*TimeoutError	3343
2560	poll	Timeout	{}	{bool}	*TimeoutError	3343
2561	poll	Temporary	{}	{bool}	*TimeoutError	3343
2562	poll	Close	{}	{error}	*FD	3344
2563	poll	Read	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	3344
2564	poll	Write	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	3344
2565	poll	SetDeadline	{time.Time}	{error}	*FD	3344
2566	poll	SetReadDeadline	{time.Time}	{error}	*FD	3344
2567	poll	SetWriteDeadline	{time.Time}	{error}	*FD	3344
2568	poll	ReadLock	{}	{error}	*FD	3344
2569	poll	ReadUnlock	{}	{}	*FD	3344
2570	poll	RawControl	{func(uintptr)}	{error}	*FD	3344
2571	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	3344
2572	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	3344
2573	poll	SetDeadline	{time.Time}	{error}	*FD	3344
2574	poll	SetReadDeadline	{time.Time}	{error}	*FD	3344
2575	poll	SetWriteDeadline	{time.Time}	{error}	*FD	3344
2576	poll	SetDeadline	{time.Time}	{error}	*FD	3344
2577	poll	SetReadDeadline	{time.Time}	{error}	*FD	3344
2578	poll	SetWriteDeadline	{time.Time}	{error}	*FD	3344
2579	poll	Fchmod	{uint32}	{error}	*FD	3344
2580	poll	Fchown	{int,int}	{error}	*FD	3344
2581	poll	Ftruncate	{int64}	{error}	*FD	3344
2582	poll	Fsync	{}	{error}	*FD	3344
2583	poll	Init	{string,bool}	{error}	*FD	3344
2584	poll	Close	{}	{error}	*FD	3344
2585	poll	Shutdown	{int}	{error}	*FD	3344
2586	poll	SetBlocking	{}	{error}	*FD	3344
2587	poll	Read	{[]byte}	{int,error}	*FD	3344
2588	poll	Pread	{[]byte,int64}	{int,error}	*FD	3344
2589	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	3344
2590	poll	ReadMsg	{[]byte,[]byte}	{int,int,int,syscall.Sockaddr,error}	*FD	3344
2591	poll	Write	{[]byte}	{int,error}	*FD	3344
2592	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	3344
2593	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	3344
2594	poll	WriteMsg	{[]byte,[]byte,syscall.Sockaddr}	{int,int,error}	*FD	3344
2595	poll	Accept	{}	{int,syscall.Sockaddr,string,error}	*FD	3344
2596	poll	Seek	{int64,int}	{int64,error}	*FD	3344
2597	poll	ReadDirent	{[]byte}	{int,error}	*FD	3344
2598	poll	Fchdir	{}	{error}	*FD	3344
2599	poll	Fstat	{*syscall.Stat_t}	{error}	*FD	3344
2600	poll	Dup	{}	{int,string,error}	*FD	3344
2601	poll	WaitWrite	{}	{error}	*FD	3344
2602	poll	WriteOnce	{[]byte}	{int,error}	*FD	3344
2603	poll	RawControl	{func(uintptr)}	{error}	*FD	3344
2604	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	3344
2605	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	3344
2606	poll	Init	{string,bool}	{string,error}	*FD	3344
2607	poll	Close	{}	{error}	*FD	3344
2608	poll	Shutdown	{int}	{error}	*FD	3344
2609	poll	Read	{[]byte}	{int,error}	*FD	3344
2610	poll	Pread	{[]byte,int64}	{int,error}	*FD	3344
2611	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	3344
2612	poll	Write	{[]byte}	{int,error}	*FD	3344
2613	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	3344
2614	poll	Writev	{*[][]byte}	{int64,error}	*FD	3344
2615	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	3344
2616	poll	ConnectEx	{syscall.Sockaddr}	{error}	*FD	3344
2617	poll	Accept	{"func() (syscall.Handle, error)"}	{syscall.Handle,[]syscall.RawSockaddrAny,uint32,string,error}	*FD	3344
2618	poll	Seek	{int64,int}	{int64,error}	*FD	3344
2619	poll	FindNextFile	{*syscall.Win32finddata}	{error}	*FD	3344
2620	poll	Fchdir	{}	{error}	*FD	3344
2621	poll	GetFileType	{}	{uint32,error}	*FD	3344
2622	poll	GetFileInformationByHandle	{*syscall.ByHandleFileInformation}	{error}	*FD	3344
2623	poll	RawControl	{func(uintptr)}	{error}	*FD	3344
2624	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	3344
2625	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	3344
2626	poll	ReadMsg	{[]byte,[]byte}	{int,int,int,syscall.Sockaddr,error}	*FD	3344
2627	poll	WriteMsg	{[]byte,[]byte,syscall.Sockaddr}	{int,int,error}	*FD	3344
2628	poll	SetsockoptInt	{int,int,int}	{error}	*FD	3344
2629	poll	SetsockoptInet4Addr	{int,int,[]byte}	{error}	*FD	3344
2630	poll	SetsockoptLinger	{int,int,*syscall.Linger}	{error}	*FD	3344
2631	poll	SetsockoptIPMreqn	{int,int,*syscall.IPMreqn}	{error}	*FD	3344
2632	poll	SetsockoptByte	{int,int,byte}	{error}	*FD	3344
2633	poll	Setsockopt	{int32,int32,*byte,int32}	{error}	*FD	3344
2634	poll	WSAIoctl	{uint32,*byte,uint32,*byte,uint32,*uint32,*syscall.Overlapped,uintptr}	{error}	*FD	3344
2635	poll	SetsockoptIPMreq	{int,int,*syscall.IPMreq}	{error}	*FD	3344
2636	poll	SetsockoptIPv6Mreq	{int,int,*syscall.IPv6Mreq}	{error}	*FD	3344
2637	poll	Writev	{*[][]byte}	{int64,error}	*FD	3344
2638	singleflight	Do	{string,"func() (interface{}, error)"}	{"interface{}",error,bool}	*Group	3347
2639	singleflight	DoChan	{string,"func() (interface{}, error)"}	{"chan singleflight.Result\n",bool}	*Group	3347
2640	singleflight	ForgetUnshared	{string}	{bool}	*Group	3347
2641	windows	Size	{}	{uint32}	*TOKEN_MANDATORY_LABEL	3360
2642	trace	String	{}	{string}	*Event	3377
2643	trace	Emit	{byte,...uint64}	{}	*Writer	3381
2644	io	Read	{[]byte}	{int,error}	*LimitedReader	3402
2645	io	Read	{[]byte}	{int,error}	*SectionReader	3403
2646	io	Seek	{int64,int}	{int64,error}	*SectionReader	3403
2647	io	ReadAt	{[]byte,int64}	{int,error}	*SectionReader	3403
2648	io	Size	{}	{int64}	*SectionReader	3403
2649	io	Read	{[]byte}	{int,error}	*PipeReader	3404
2650	io	Close	{}	{error}	*PipeReader	3404
2651	io	CloseWithError	{error}	{error}	*PipeReader	3404
2652	io	Write	{[]byte}	{int,error}	*PipeWriter	3405
2653	io	Close	{}	{error}	*PipeWriter	3405
2654	io	CloseWithError	{error}	{error}	*PipeWriter	3405
2655	log	SetOutput	{io.Writer}	{}	*Logger	3406
2656	log	Output	{int,string}	{error}	*Logger	3406
2657	log	Printf	{string,"...interface{}"}	{}	*Logger	3406
2658	log	Print	{"...interface{}"}	{}	*Logger	3406
2659	log	Println	{"...interface{}"}	{}	*Logger	3406
2660	log	Fatal	{"...interface{}"}	{}	*Logger	3406
2661	log	Fatalf	{string,"...interface{}"}	{}	*Logger	3406
2662	log	Fatalln	{"...interface{}"}	{}	*Logger	3406
2663	log	Panic	{"...interface{}"}	{}	*Logger	3406
2664	log	Panicf	{string,"...interface{}"}	{}	*Logger	3406
2665	log	Panicln	{"...interface{}"}	{}	*Logger	3406
2666	log	Flags	{}	{int}	*Logger	3406
2667	log	SetFlags	{int}	{}	*Logger	3406
2668	log	Prefix	{}	{string}	*Logger	3406
2669	log	SetPrefix	{string}	{}	*Logger	3406
2670	syslog	Write	{[]byte}	{int,error}	*Writer	3408
2671	syslog	Close	{}	{error}	*Writer	3408
2672	syslog	Emerg	{string}	{error}	*Writer	3408
2673	syslog	Alert	{string}	{error}	*Writer	3408
2674	syslog	Crit	{string}	{error}	*Writer	3408
2675	syslog	Err	{string}	{error}	*Writer	3408
2676	syslog	Warning	{string}	{error}	*Writer	3408
2677	syslog	Notice	{string}	{error}	*Writer	3408
2678	syslog	Info	{string}	{error}	*Writer	3408
2679	syslog	Debug	{string}	{error}	*Writer	3408
2680	big	SetPrec	{uint}	{*big.Float}	*Float	3410
2681	big	SetMode	{big.RoundingMode}	{*big.Float}	*Float	3410
2682	big	Prec	{}	{uint}	*Float	3410
2683	big	MinPrec	{}	{uint}	*Float	3410
2684	big	Mode	{}	{big.RoundingMode}	*Float	3410
2685	big	Acc	{}	{big.Accuracy}	*Float	3410
2686	big	Sign	{}	{int}	*Float	3410
2687	big	MantExp	{*big.Float}	{int}	*Float	3410
2688	big	SetMantExp	{*big.Float,int}	{*big.Float}	*Float	3410
2689	big	Signbit	{}	{bool}	*Float	3410
2690	big	IsInf	{}	{bool}	*Float	3410
2691	big	IsInt	{}	{bool}	*Float	3410
2692	big	SetUint64	{uint64}	{*big.Float}	*Float	3410
2693	big	SetInt64	{int64}	{*big.Float}	*Float	3410
2694	big	SetFloat64	{float64}	{*big.Float}	*Float	3410
2695	big	SetInt	{*big.Int}	{*big.Float}	*Float	3410
2696	big	SetRat	{*big.Rat}	{*big.Float}	*Float	3410
2697	big	SetInf	{bool}	{*big.Float}	*Float	3410
2698	big	Set	{*big.Float}	{*big.Float}	*Float	3410
2699	big	Copy	{*big.Float}	{*big.Float}	*Float	3410
2700	big	Uint64	{}	{uint64,big.Accuracy}	*Float	3410
2701	big	Int64	{}	{int64,big.Accuracy}	*Float	3410
2702	big	Float32	{}	{float32,big.Accuracy}	*Float	3410
2703	big	Float64	{}	{float64,big.Accuracy}	*Float	3410
2704	big	Int	{*big.Int}	{*big.Int,big.Accuracy}	*Float	3410
2705	big	Rat	{*big.Rat}	{*big.Rat,big.Accuracy}	*Float	3410
2706	big	Abs	{*big.Float}	{*big.Float}	*Float	3410
2707	big	Neg	{*big.Float}	{*big.Float}	*Float	3410
2708	big	Add	{*big.Float,*big.Float}	{*big.Float}	*Float	3410
2709	big	Sub	{*big.Float,*big.Float}	{*big.Float}	*Float	3410
2710	big	Mul	{*big.Float,*big.Float}	{*big.Float}	*Float	3410
2711	big	Quo	{*big.Float,*big.Float}	{*big.Float}	*Float	3410
2712	big	Cmp	{*big.Float}	{int}	*Float	3410
2713	big	SetString	{string}	{*big.Float,bool}	*Float	3410
2714	big	Parse	{string,int}	{*big.Float,int,error}	*Float	3410
2715	big	Scan	{fmt.ScanState,rune}	{error}	*Float	3410
2716	big	GobEncode	{}	{[]byte,error}	*Float	3410
2717	big	GobDecode	{[]byte}	{error}	*Float	3410
2718	big	MarshalText	{}	{[]byte,error}	*Float	3410
2719	big	UnmarshalText	{[]byte}	{error}	*Float	3410
2720	big	Text	{byte,int}	{string}	*Float	3410
2721	big	String	{}	{string}	*Float	3410
2722	big	Append	{[]byte,byte,int}	{[]byte}	*Float	3410
2723	big	Format	{fmt.State,rune}	{}	*Float	3410
2724	big	Sqrt	{*big.Float}	{*big.Float}	*Float	3410
2726	big	String	{}	{string}	RoundingMode	3412
2727	big	String	{}	{string}	Accuracy	3413
2728	big	Sign	{}	{int}	*Int	3414
2729	big	SetInt64	{int64}	{*big.Int}	*Int	3414
2730	big	SetUint64	{uint64}	{*big.Int}	*Int	3414
2731	big	Set	{*big.Int}	{*big.Int}	*Int	3414
2732	big	Bits	{}	{[]big.Word}	*Int	3414
2733	big	SetBits	{[]big.Word}	{*big.Int}	*Int	3414
2734	big	Abs	{*big.Int}	{*big.Int}	*Int	3414
2735	big	Neg	{*big.Int}	{*big.Int}	*Int	3414
2736	big	Add	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2737	big	Sub	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2738	big	Mul	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2739	big	MulRange	{int64,int64}	{*big.Int}	*Int	3414
2740	big	Binomial	{int64,int64}	{*big.Int}	*Int	3414
2741	big	Quo	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2742	big	Rem	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2743	big	QuoRem	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	3414
2744	big	Div	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2745	big	Mod	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2746	big	DivMod	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	3414
2747	big	Cmp	{*big.Int}	{int}	*Int	3414
2748	big	CmpAbs	{*big.Int}	{int}	*Int	3414
2749	big	Int64	{}	{int64}	*Int	3414
2750	big	Uint64	{}	{uint64}	*Int	3414
2751	big	IsInt64	{}	{bool}	*Int	3414
2752	big	IsUint64	{}	{bool}	*Int	3414
2753	big	SetString	{string,int}	{*big.Int,bool}	*Int	3414
2754	big	SetBytes	{[]byte}	{*big.Int}	*Int	3414
2755	big	Bytes	{}	{[]byte}	*Int	3414
2756	big	BitLen	{}	{int}	*Int	3414
2757	big	Exp	{*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	3414
2758	big	GCD	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	3414
2759	big	Rand	{*rand.Rand,*big.Int}	{*big.Int}	*Int	3414
2760	big	ModInverse	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2761	big	ModSqrt	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2762	big	Lsh	{*big.Int,uint}	{*big.Int}	*Int	3414
2763	big	Rsh	{*big.Int,uint}	{*big.Int}	*Int	3414
2764	big	Bit	{int}	{uint}	*Int	3414
2765	big	SetBit	{*big.Int,int,uint}	{*big.Int}	*Int	3414
2766	big	And	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2767	big	AndNot	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2768	big	Or	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2769	big	Xor	{*big.Int,*big.Int}	{*big.Int}	*Int	3414
2770	big	Not	{*big.Int}	{*big.Int}	*Int	3414
2771	big	Sqrt	{*big.Int}	{*big.Int}	*Int	3414
2772	big	Text	{int}	{string}	*Int	3414
2773	big	Append	{[]byte,int}	{[]byte}	*Int	3414
2774	big	String	{}	{string}	*Int	3414
2775	big	Format	{fmt.State,rune}	{}	*Int	3414
2776	big	Scan	{fmt.ScanState,rune}	{error}	*Int	3414
2777	big	GobEncode	{}	{[]byte,error}	*Int	3414
2778	big	GobDecode	{[]byte}	{error}	*Int	3414
2779	big	MarshalText	{}	{[]byte,error}	*Int	3414
2780	big	UnmarshalText	{[]byte}	{error}	*Int	3414
2781	big	MarshalJSON	{}	{[]byte,error}	*Int	3414
2782	big	UnmarshalJSON	{[]byte}	{error}	*Int	3414
2783	big	ProbablyPrime	{int}	{bool}	*Int	3414
2784	big	SetFloat64	{float64}	{*big.Rat}	*Rat	3415
2785	big	Float32	{}	{float32,bool}	*Rat	3415
2786	big	Float64	{}	{float64,bool}	*Rat	3415
2787	big	SetFrac	{*big.Int,*big.Int}	{*big.Rat}	*Rat	3415
2788	big	SetFrac64	{int64,int64}	{*big.Rat}	*Rat	3415
2789	big	SetInt	{*big.Int}	{*big.Rat}	*Rat	3415
2790	big	SetInt64	{int64}	{*big.Rat}	*Rat	3415
2791	big	Set	{*big.Rat}	{*big.Rat}	*Rat	3415
2792	big	Abs	{*big.Rat}	{*big.Rat}	*Rat	3415
2793	big	Neg	{*big.Rat}	{*big.Rat}	*Rat	3415
2794	big	Inv	{*big.Rat}	{*big.Rat}	*Rat	3415
2795	big	Sign	{}	{int}	*Rat	3415
2796	big	IsInt	{}	{bool}	*Rat	3415
2797	big	Num	{}	{*big.Int}	*Rat	3415
2798	big	Denom	{}	{*big.Int}	*Rat	3415
2799	big	Cmp	{*big.Rat}	{int}	*Rat	3415
2800	big	Add	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	3415
2801	big	Sub	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	3415
2802	big	Mul	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	3415
2803	big	Quo	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	3415
2804	big	Scan	{fmt.ScanState,rune}	{error}	*Rat	3415
2805	big	SetString	{string}	{*big.Rat,bool}	*Rat	3415
2806	big	String	{}	{string}	*Rat	3415
2807	big	RatString	{}	{string}	*Rat	3415
2808	big	FloatString	{int}	{string}	*Rat	3415
2809	big	GobEncode	{}	{[]byte,error}	*Rat	3415
2810	big	GobDecode	{[]byte}	{error}	*Rat	3415
2811	big	MarshalText	{}	{[]byte,error}	*Rat	3415
2812	big	UnmarshalText	{[]byte}	{error}	*Rat	3415
2813	rand	ExpFloat64	{}	{float64}	*Rand	3418
2814	rand	NormFloat64	{}	{float64}	*Rand	3418
2815	rand	Seed	{int64}	{}	*Rand	3418
2816	rand	Int63	{}	{int64}	*Rand	3418
2817	rand	Uint32	{}	{uint32}	*Rand	3418
2818	rand	Uint64	{}	{uint64}	*Rand	3418
2819	rand	Int31	{}	{int32}	*Rand	3418
2820	rand	Int	{}	{int}	*Rand	3418
2821	rand	Int63n	{int64}	{int64}	*Rand	3418
2822	rand	Int31n	{int32}	{int32}	*Rand	3418
2823	rand	Intn	{int}	{int}	*Rand	3418
2824	rand	Float64	{}	{float64}	*Rand	3418
2825	rand	Float32	{}	{float32}	*Rand	3418
2826	rand	Perm	{int}	{[]int}	*Rand	3418
2827	rand	Shuffle	{int,func(int)}	{}	*Rand	3418
2828	rand	Read	{[]byte}	{int,error}	*Rand	3418
2829	rand	Uint64	{}	{uint64}	*Zipf	3419
2830	mime	Encode	{string,string}	{string}	WordEncoder	3420
2831	mime	Decode	{string}	{string,error}	*WordDecoder	3421
2832	mime	DecodeHeader	{string}	{string,error}	*WordDecoder	3421
2833	multipart	RemoveAll	{}	{error}	*Form	3422
2834	multipart	Open	{}	{multipart.File,error}	*FileHeader	3423
2835	multipart	FormName	{}	{string}	*Part	3425
2836	multipart	FileName	{}	{string}	*Part	3425
2837	multipart	Read	{[]byte}	{int,error}	*Part	3425
2838	multipart	Close	{}	{error}	*Part	3425
2839	multipart	ReadForm	{int64}	{*multipart.Form,error}	*Reader	3426
2840	multipart	NextPart	{}	{*multipart.Part,error}	*Reader	3426
2841	multipart	Boundary	{}	{string}	*Writer	3427
2842	multipart	SetBoundary	{string}	{error}	*Writer	3427
2843	multipart	FormDataContentType	{}	{string}	*Writer	3427
2844	multipart	CreatePart	{textproto.MIMEHeader}	{io.Writer,error}	*Writer	3427
2845	multipart	CreateFormFile	{string,string}	{io.Writer,error}	*Writer	3427
2846	multipart	CreateFormField	{string}	{io.Writer,error}	*Writer	3427
2847	multipart	WriteField	{string,string}	{error}	*Writer	3427
2848	multipart	Close	{}	{error}	*Writer	3427
2849	quotedprintable	Read	{[]byte}	{int,error}	*Reader	3428
2850	quotedprintable	Write	{[]byte}	{int,error}	*Writer	3429
2851	quotedprintable	Close	{}	{error}	*Writer	3429
2852	net	Dial	{string,string}	{net.Conn,error}	*Dialer	3430
2853	net	DialContext	{context.Context,string,string}	{net.Conn,error}	*Dialer	3430
2854	net	Listen	{context.Context,string,string}	{net.Listener,error}	*ListenConfig	3431
2855	net	ListenPacket	{context.Context,string,string}	{net.PacketConn,error}	*ListenConfig	3431
2856	cgi	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Handler	3435
2857	http	Get	{string}	{*http.Response,error}	*Client	3436
2858	http	Do	{*http.Request}	{*http.Response,error}	*Client	3436
2859	http	Post	{string,string,io.Reader}	{*http.Response,error}	*Client	3436
2860	http	PostForm	{string,url.Values}	{*http.Response,error}	*Client	3436
2861	http	Head	{string}	{*http.Response,error}	*Client	3436
2862	http	String	{}	{string}	*Cookie	3438
2863	cookiejar	Cookies	{*url.URL}	{[]*http.Cookie}	*Jar	3442
2864	cookiejar	SetCookies	{*url.URL,[]*http.Cookie}	{}	*Jar	3442
2865	http	Open	{string}	{http.File,error}	Dir	3443
2866	http	Add	{string,string}	{}	Header	3447
2867	http	Set	{string,string}	{}	Header	3447
2868	http	Get	{string}	{string}	Header	3447
2869	http	Del	{string}	{}	Header	3447
2870	http	Write	{io.Writer}	{error}	Header	3447
2871	http	WriteSubset	{io.Writer,map[string]bool}	{error}	Header	3447
2872	httptest	Header	{}	{http.Header}	*ResponseRecorder	3450
2873	httptest	Write	{[]byte}	{int,error}	*ResponseRecorder	3450
2874	httptest	WriteString	{string}	{int,error}	*ResponseRecorder	3450
2875	httptest	WriteHeader	{int}	{}	*ResponseRecorder	3450
2876	httptest	Flush	{}	{}	*ResponseRecorder	3450
2877	httptest	Result	{}	{*http.Response}	*ResponseRecorder	3450
2878	httptest	Start	{}	{}	*Server	3451
2879	httptest	StartTLS	{}	{}	*Server	3451
2880	httptest	Close	{}	{}	*Server	3451
2881	httptest	CloseClientConnections	{}	{}	*Server	3451
2882	httptest	Certificate	{}	{*x509.Certificate}	*Server	3451
2883	httptest	Client	{}	{*http.Client}	*Server	3451
2884	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ServerConn	3457
2885	httputil	Close	{}	{error}	*ServerConn	3457
2886	httputil	Read	{}	{*http.Request,error}	*ServerConn	3457
2887	httputil	Pending	{}	{int}	*ServerConn	3457
2888	httputil	Write	{*http.Request,*http.Response}	{error}	*ServerConn	3457
2889	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ClientConn	3458
2890	httputil	Close	{}	{error}	*ClientConn	3458
2891	httputil	Write	{*http.Request}	{error}	*ClientConn	3458
2892	httputil	Pending	{}	{int}	*ClientConn	3458
2893	httputil	Read	{*http.Request}	{*http.Response,error}	*ClientConn	3458
2894	httputil	Do	{*http.Request}	{*http.Response,error}	*ClientConn	3458
2895	httputil	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ReverseProxy	3459
2896	http	Error	{}	{string}	*ProtocolError	3463
2897	http	Context	{}	{context.Context}	*Request	3464
2898	http	WithContext	{context.Context}	{*http.Request}	*Request	3464
2899	http	ProtoAtLeast	{int,int}	{bool}	*Request	3464
2900	http	UserAgent	{}	{string}	*Request	3464
2901	http	Cookies	{}	{[]*http.Cookie}	*Request	3464
2902	http	Cookie	{string}	{*http.Cookie,error}	*Request	3464
2903	http	AddCookie	{*http.Cookie}	{}	*Request	3464
2904	http	Referer	{}	{string}	*Request	3464
2905	http	MultipartReader	{}	{*multipart.Reader,error}	*Request	3464
2906	http	Write	{io.Writer}	{error}	*Request	3464
2907	http	WriteProxy	{io.Writer}	{error}	*Request	3464
2908	http	BasicAuth	{}	{string,bool}	*Request	3464
2909	http	SetBasicAuth	{string,string}	{}	*Request	3464
2910	http	ParseForm	{}	{error}	*Request	3464
2911	http	ParseMultipartForm	{int64}	{error}	*Request	3464
2912	http	FormValue	{string}	{string}	*Request	3464
2913	http	PostFormValue	{string}	{string}	*Request	3464
2914	http	FormFile	{string}	{multipart.File,*multipart.FileHeader,error}	*Request	3464
2915	http	Cookies	{}	{[]*http.Cookie}	*Response	3465
2916	http	Location	{}	{*url.URL,error}	*Response	3465
2917	http	ProtoAtLeast	{int,int}	{bool}	*Response	3465
2918	http	Write	{io.Writer}	{error}	*Response	3465
2919	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	HandlerFunc	3471
2920	http	Handler	{*http.Request}	{http.Handler,string}	*ServeMux	3472
2921	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ServeMux	3472
2922	http	Handle	{string,http.Handler}	{}	*ServeMux	3472
2923	http	HandleFunc	{string,"func(http.ResponseWriter, *http.Request)"}	{}	*ServeMux	3472
2924	http	Close	{}	{error}	*Server	3473
2925	http	Shutdown	{context.Context}	{error}	*Server	3473
2926	http	RegisterOnShutdown	{func()}	{}	*Server	3473
2927	http	ListenAndServe	{}	{error}	*Server	3473
2928	http	Serve	{net.Listener}	{error}	*Server	3473
2929	http	ServeTLS	{net.Listener,string,string}	{error}	*Server	3473
2930	http	SetKeepAlivesEnabled	{bool}	{}	*Server	3473
2931	http	ListenAndServeTLS	{string,string}	{error}	*Server	3473
2932	http	String	{}	{string}	ConnState	3474
2933	http	RoundTrip	{*http.Request}	{*http.Response,error}	*Transport	3475
2934	http	RoundTrip	{*http.Request}	{*http.Response,error}	*Transport	3475
2935	http	RegisterProtocol	{string,http.RoundTripper}	{}	*Transport	3475
2936	http	CloseIdleConnections	{}	{}	*Transport	3475
2937	http	CancelRequest	{*http.Request}	{}	*Transport	3475
2938	main	String	{}	{string}	*Counter	3476
2939	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Counter	3476
2940	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	Chan	3477
2941	net	Addrs	{}	{[]net.Addr,error}	*Interface	3478
2942	net	MulticastAddrs	{}	{[]net.Addr,error}	*Interface	3478
2943	net	String	{}	{string}	Flags	3479
2944	socktest	Stats	{}	{[]socktest.Stat}	*Switch	3480
2945	socktest	Sockets	{}	{socktest.Sockets}	*Switch	3480
2946	socktest	Set	{socktest.FilterType,socktest.Filter}	{}	*Switch	3480
2947	socktest	Accept4	{int,int}	{int,syscall.Sockaddr,error}	*Switch	3480
2948	socktest	Socket	{int,int,int}	{int,error}	*Switch	3480
2949	socktest	Close	{int}	{error}	*Switch	3480
2950	socktest	Connect	{int,syscall.Sockaddr}	{error}	*Switch	3480
2951	socktest	Listen	{int,int}	{error}	*Switch	3480
2952	socktest	Accept	{int}	{int,syscall.Sockaddr,error}	*Switch	3480
2953	socktest	GetsockoptInt	{int,int,int}	{int,error}	*Switch	3480
2954	socktest	Socket	{int,int,int}	{syscall.Handle,error}	*Switch	3480
2955	socktest	WSASocket	{int32,int32,int32,*syscall.WSAProtocolInfo,uint32,uint32}	{syscall.Handle,error}	*Switch	3480
2956	socktest	Closesocket	{syscall.Handle}	{error}	*Switch	3480
2957	socktest	Connect	{syscall.Handle,syscall.Sockaddr}	{error}	*Switch	3480
2958	socktest	ConnectEx	{syscall.Handle,syscall.Sockaddr,*byte,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	3480
2959	socktest	Listen	{syscall.Handle,int}	{error}	*Switch	3480
2960	socktest	AcceptEx	{syscall.Handle,syscall.Handle,*byte,uint32,uint32,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	3480
2961	socktest	Family	{}	{int}	Cookie	3481
2962	socktest	Type	{}	{int}	Cookie	3481
2963	socktest	Protocol	{}	{int}	Cookie	3481
2964	socktest	String	{}	{string}	Status	3482
2965	socktest	String	{}	{string}	Stat	3483
2966	net	IsUnspecified	{}	{bool}	IP	3490
2967	net	IsLoopback	{}	{bool}	IP	3490
2968	net	IsMulticast	{}	{bool}	IP	3490
2969	net	IsInterfaceLocalMulticast	{}	{bool}	IP	3490
2970	net	IsLinkLocalMulticast	{}	{bool}	IP	3490
2971	net	IsLinkLocalUnicast	{}	{bool}	IP	3490
2972	net	IsGlobalUnicast	{}	{bool}	IP	3490
2973	net	To4	{}	{net.IP}	IP	3490
2974	net	To16	{}	{net.IP}	IP	3490
2975	net	DefaultMask	{}	{net.IPMask}	IP	3490
2976	net	Mask	{net.IPMask}	{net.IP}	IP	3490
2977	net	String	{}	{string}	IP	3490
2978	net	MarshalText	{}	{[]byte,error}	IP	3490
2979	net	UnmarshalText	{[]byte}	{error}	*IP	3490
2980	net	Equal	{net.IP}	{bool}	IP	3490
2981	net	Size	{}	{int}	IPMask	3491
2983	net	Contains	{net.IP}	{bool}	*IPNet	3492
2984	net	Network	{}	{string}	*IPNet	3492
2985	net	String	{}	{string}	*IPNet	3492
2986	net	Network	{}	{string}	*IPAddr	3493
2987	net	String	{}	{string}	*IPAddr	3493
2988	net	SyscallConn	{}	{syscall.RawConn,error}	*IPConn	3494
2989	net	ReadFromIP	{[]byte}	{int,*net.IPAddr,error}	*IPConn	3494
2990	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*IPConn	3494
2991	net	ReadMsgIP	{[]byte,[]byte}	{int,*net.IPAddr,error}	*IPConn	3494
2992	net	WriteToIP	{[]byte,*net.IPAddr}	{int,error}	*IPConn	3494
2993	net	WriteTo	{[]byte,net.Addr}	{int,error}	*IPConn	3494
2994	net	WriteMsgIP	{[]byte,[]byte,*net.IPAddr}	{int,error}	*IPConn	3494
2995	net	LookupHost	{context.Context,string}	{[]string,error}	*Resolver	3495
2996	net	LookupIPAddr	{context.Context,string}	{[]net.IPAddr,error}	*Resolver	3495
2997	net	LookupPort	{context.Context,string,string}	{int,error}	*Resolver	3495
2998	net	LookupCNAME	{context.Context,string}	{string,error}	*Resolver	3495
2999	net	LookupSRV	{context.Context,string,string,string}	{string,[]*net.SRV,error}	*Resolver	3495
3000	net	LookupMX	{context.Context,string}	{[]*net.MX,error}	*Resolver	3495
3001	net	LookupNS	{context.Context,string}	{[]*net.NS,error}	*Resolver	3495
3002	net	LookupTXT	{context.Context,string}	{[]string,error}	*Resolver	3495
3003	net	LookupAddr	{context.Context,string}	{[]string,error}	*Resolver	3495
3004	net	String	{}	{string}	HardwareAddr	3496
3005	mail	Get	{string}	{string}	Header	3498
3006	mail	Date	{}	{time.Time,error}	Header	3498
3007	mail	AddressList	{string}	{[]*mail.Address,error}	Header	3498
3008	mail	String	{}	{string}	*Address	3499
3009	mail	Parse	{string}	{*mail.Address,error}	*AddressParser	3500
3010	mail	ParseList	{string}	{[]*mail.Address,error}	*AddressParser	3500
3011	net	Error	{}	{string}	*OpError	3506
3012	net	Timeout	{}	{bool}	*OpError	3506
3013	net	Temporary	{}	{bool}	*OpError	3506
3014	net	Error	{}	{string}	*ParseError	3507
3015	net	Error	{}	{string}	*AddrError	3508
3016	net	Timeout	{}	{bool}	*AddrError	3508
3017	net	Temporary	{}	{bool}	*AddrError	3508
3018	net	Error	{}	{string}	UnknownNetworkError	3509
3019	net	Timeout	{}	{bool}	UnknownNetworkError	3509
3020	net	Temporary	{}	{bool}	UnknownNetworkError	3509
3021	net	Error	{}	{string}	InvalidAddrError	3510
3022	net	Timeout	{}	{bool}	InvalidAddrError	3510
3023	net	Temporary	{}	{bool}	InvalidAddrError	3510
3024	net	Error	{}	{string}	*DNSConfigError	3511
3025	net	Timeout	{}	{bool}	*DNSConfigError	3511
3026	net	Temporary	{}	{bool}	*DNSConfigError	3511
3027	net	Error	{}	{string}	*DNSError	3512
3028	net	Timeout	{}	{bool}	*DNSError	3512
3029	net	Temporary	{}	{bool}	*DNSError	3512
3030	net	WriteTo	{io.Writer}	{int64,error}	*Buffers	3513
3031	net	Read	{[]byte}	{int,error}	*Buffers	3513
3032	rpc	Error	{}	{string}	ServerError	3514
3033	rpc	Close	{}	{error}	*Client	3516
3034	rpc	Go	{string,"interface{}","interface{}","chan *rpc.Call\n"}	{*rpc.Call}	*Client	3516
3035	rpc	Call	{string,"interface{}","interface{}"}	{error}	*Client	3516
3036	rpc	Register	{"interface{}"}	{error}	*Server	3520
3037	rpc	RegisterName	{string,"interface{}"}	{error}	*Server	3520
3038	rpc	ServeConn	{io.ReadWriteCloser}	{}	*Server	3520
3039	rpc	ServeCodec	{rpc.ServerCodec}	{}	*Server	3520
3040	rpc	ServeRequest	{rpc.ServerCodec}	{error}	*Server	3520
3041	rpc	Accept	{net.Listener}	{}	*Server	3520
3042	rpc	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Server	3520
3043	rpc	HandleHTTP	{string,string}	{}	*Server	3520
3044	smtp	Close	{}	{error}	*Client	3524
3045	smtp	Hello	{string}	{error}	*Client	3524
3046	smtp	StartTLS	{*tls.Config}	{error}	*Client	3524
3047	smtp	TLSConnectionState	{}	{tls.ConnectionState,bool}	*Client	3524
3048	smtp	Verify	{string}	{error}	*Client	3524
3049	smtp	Auth	{smtp.Auth}	{error}	*Client	3524
3050	smtp	Mail	{string}	{error}	*Client	3524
3051	smtp	Rcpt	{string}	{error}	*Client	3524
3052	smtp	Data	{}	{io.WriteCloser,error}	*Client	3524
3053	smtp	Extension	{string}	{bool,string}	*Client	3524
3054	smtp	Reset	{}	{error}	*Client	3524
3055	smtp	Noop	{}	{error}	*Client	3524
3056	smtp	Quit	{}	{error}	*Client	3524
3057	net	Network	{}	{string}	*TCPAddr	3525
3058	net	String	{}	{string}	*TCPAddr	3525
3059	net	SyscallConn	{}	{syscall.RawConn,error}	*TCPConn	3526
3060	net	ReadFrom	{io.Reader}	{int64,error}	*TCPConn	3526
3061	net	CloseRead	{}	{error}	*TCPConn	3526
3062	net	CloseWrite	{}	{error}	*TCPConn	3526
3063	net	SetLinger	{int}	{error}	*TCPConn	3526
3064	net	SetKeepAlive	{bool}	{error}	*TCPConn	3526
3065	net	SetKeepAlivePeriod	{time.Duration}	{error}	*TCPConn	3526
3066	net	SetNoDelay	{bool}	{error}	*TCPConn	3526
3067	net	SyscallConn	{}	{syscall.RawConn,error}	*TCPListener	3527
3068	net	AcceptTCP	{}	{*net.TCPConn,error}	*TCPListener	3527
3069	net	Accept	{}	{net.Conn,error}	*TCPListener	3527
3070	net	Close	{}	{error}	*TCPListener	3527
3071	net	Addr	{}	{net.Addr}	*TCPListener	3527
3072	net	SetDeadline	{time.Time}	{error}	*TCPListener	3527
3073	net	File	{}	{*os.File,error}	*TCPListener	3527
3074	textproto	Add	{string,string}	{}	MIMEHeader	3528
3075	textproto	Set	{string,string}	{}	MIMEHeader	3528
3076	textproto	Get	{string}	{string}	MIMEHeader	3528
3077	textproto	Del	{string}	{}	MIMEHeader	3528
3078	textproto	Next	{}	{uint}	*Pipeline	3529
3079	textproto	StartRequest	{uint}	{}	*Pipeline	3529
3080	textproto	EndRequest	{uint}	{}	*Pipeline	3529
3081	textproto	StartResponse	{uint}	{}	*Pipeline	3529
3082	textproto	EndResponse	{uint}	{}	*Pipeline	3529
3083	textproto	ReadLine	{}	{string,error}	*Reader	3530
3084	textproto	ReadLineBytes	{}	{[]byte,error}	*Reader	3530
3085	textproto	ReadContinuedLine	{}	{string,error}	*Reader	3530
3086	textproto	ReadContinuedLineBytes	{}	{[]byte,error}	*Reader	3530
3087	textproto	ReadCodeLine	{int}	{int,string,error}	*Reader	3530
3088	textproto	ReadResponse	{int}	{int,string,error}	*Reader	3530
3089	textproto	DotReader	{}	{io.Reader}	*Reader	3530
3090	textproto	ReadDotBytes	{}	{[]byte,error}	*Reader	3530
3091	textproto	ReadDotLines	{}	{[]string,error}	*Reader	3530
3092	textproto	ReadMIMEHeader	{}	{textproto.MIMEHeader,error}	*Reader	3530
3093	textproto	Error	{}	{string}	*Error	3531
3094	textproto	Error	{}	{string}	ProtocolError	3532
3095	textproto	Close	{}	{error}	*Conn	3533
3096	textproto	Cmd	{string,"...interface{}"}	{uint,error}	*Conn	3533
3097	textproto	PrintfLine	{string,"...interface{}"}	{error}	*Writer	3534
3098	textproto	DotWriter	{}	{io.WriteCloser}	*Writer	3534
3099	net	Network	{}	{string}	*UDPAddr	3535
3100	net	String	{}	{string}	*UDPAddr	3535
3101	net	SyscallConn	{}	{syscall.RawConn,error}	*UDPConn	3536
3102	net	ReadFromUDP	{[]byte}	{int,*net.UDPAddr,error}	*UDPConn	3536
3103	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UDPConn	3536
3104	net	ReadMsgUDP	{[]byte,[]byte}	{int,*net.UDPAddr,error}	*UDPConn	3536
3105	net	WriteToUDP	{[]byte,*net.UDPAddr}	{int,error}	*UDPConn	3536
3106	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UDPConn	3536
3107	net	WriteMsgUDP	{[]byte,[]byte,*net.UDPAddr}	{int,error}	*UDPConn	3536
3108	net	Network	{}	{string}	*UnixAddr	3537
3109	net	String	{}	{string}	*UnixAddr	3537
3110	net	SyscallConn	{}	{syscall.RawConn,error}	*UnixConn	3538
3111	net	CloseRead	{}	{error}	*UnixConn	3538
3112	net	CloseWrite	{}	{error}	*UnixConn	3538
3113	net	ReadFromUnix	{[]byte}	{int,*net.UnixAddr,error}	*UnixConn	3538
3114	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UnixConn	3538
3115	net	ReadMsgUnix	{[]byte,[]byte}	{int,*net.UnixAddr,error}	*UnixConn	3538
3116	net	WriteToUnix	{[]byte,*net.UnixAddr}	{int,error}	*UnixConn	3538
3117	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UnixConn	3538
3118	net	WriteMsgUnix	{[]byte,[]byte,*net.UnixAddr}	{int,error}	*UnixConn	3538
3119	net	SyscallConn	{}	{syscall.RawConn,error}	*UnixListener	3539
3120	net	AcceptUnix	{}	{*net.UnixConn,error}	*UnixListener	3539
3121	net	Accept	{}	{net.Conn,error}	*UnixListener	3539
3122	net	Close	{}	{error}	*UnixListener	3539
3123	net	Addr	{}	{net.Addr}	*UnixListener	3539
3124	net	SetDeadline	{time.Time}	{error}	*UnixListener	3539
3125	net	File	{}	{*os.File,error}	*UnixListener	3539
3126	net	SetUnlinkOnClose	{bool}	{}	*UnixListener	3539
3127	url	Error	{}	{string}	*Error	3540
3128	url	Timeout	{}	{bool}	*Error	3540
3129	url	Temporary	{}	{bool}	*Error	3540
3130	url	Error	{}	{string}	EscapeError	3541
3131	url	Error	{}	{string}	InvalidHostError	3542
3132	url	EscapedPath	{}	{string}	*URL	3543
3133	url	String	{}	{string}	*URL	3543
3134	url	IsAbs	{}	{bool}	*URL	3543
3135	url	Parse	{string}	{*url.URL,error}	*URL	3543
3136	url	ResolveReference	{*url.URL}	{*url.URL}	*URL	3543
3137	url	Query	{}	{url.Values}	*URL	3543
3138	url	RequestURI	{}	{string}	*URL	3543
3139	url	Hostname	{}	{string}	*URL	3543
3140	url	Port	{}	{string}	*URL	3543
3141	url	MarshalBinary	{}	{[]byte,error}	*URL	3543
3142	url	UnmarshalBinary	{[]byte}	{error}	*URL	3543
3143	url	Username	{}	{string}	*Userinfo	3544
3144	url	Password	{}	{string,bool}	*Userinfo	3544
3145	url	String	{}	{string}	*Userinfo	3544
3146	url	Get	{string}	{string}	Values	3545
3147	url	Set	{string,string}	{}	Values	3545
3148	url	Add	{string,string}	{}	Values	3545
3149	url	Del	{string}	{}	Values	3545
3150	url	Encode	{}	{string}	Values	3545
3151	os	Error	{}	{string}	*PathError	3546
3152	os	Timeout	{}	{bool}	*PathError	3546
3153	os	Error	{}	{string}	*SyscallError	3547
3154	os	Timeout	{}	{bool}	*SyscallError	3547
3155	exec	Error	{}	{string}	*Error	3548
3156	exec	Run	{}	{error}	*Cmd	3549
3157	exec	Start	{}	{error}	*Cmd	3549
3158	exec	Wait	{}	{error}	*Cmd	3549
3159	exec	Output	{}	{[]byte,error}	*Cmd	3549
3160	exec	CombinedOutput	{}	{[]byte,error}	*Cmd	3549
3161	exec	StdinPipe	{}	{io.WriteCloser,error}	*Cmd	3549
3162	exec	StdoutPipe	{}	{io.ReadCloser,error}	*Cmd	3549
3163	exec	StderrPipe	{}	{io.ReadCloser,error}	*Cmd	3549
3164	exec	Error	{}	{string}	*ExitError	3551
3165	os	Release	{}	{error}	*Process	3552
3166	os	Kill	{}	{error}	*Process	3552
3167	os	Wait	{}	{*os.ProcessState,error}	*Process	3552
3168	os	Signal	{os.Signal}	{error}	*Process	3552
3169	os	UserTime	{}	{time.Duration}	*ProcessState	3555
3170	os	SystemTime	{}	{time.Duration}	*ProcessState	3555
3171	os	Exited	{}	{bool}	*ProcessState	3555
3172	os	Success	{}	{bool}	*ProcessState	3555
3173	os	Sys	{}	{"interface{}"}	*ProcessState	3555
3174	os	SysUsage	{}	{"interface{}"}	*ProcessState	3555
3175	os	Pid	{}	{int}	*ProcessState	3555
3176	os	String	{}	{string}	*ProcessState	3555
3177	os	Pid	{}	{int}	*ProcessState	3555
3178	os	String	{}	{string}	*ProcessState	3555
3179	os	Error	{}	{string}	*LinkError	3557
3180	pty	Error	{}	{string}	*PtyError	3558
3181	os	Readdir	{int}	{[]os.FileInfo,error}	*File	3559
3182	os	Readdirnames	{int}	{[]string,error}	*File	3559
3183	os	Name	{}	{string}	*File	3559
3184	os	Read	{[]byte}	{int,error}	*File	3559
3185	os	ReadAt	{[]byte,int64}	{int,error}	*File	3559
3186	os	Write	{[]byte}	{int,error}	*File	3559
3187	os	WriteAt	{[]byte,int64}	{int,error}	*File	3559
3188	os	Seek	{int64,int}	{int64,error}	*File	3559
3189	os	WriteString	{string}	{int,error}	*File	3559
3190	os	Chmod	{os.FileMode}	{error}	*File	3559
3191	os	SetDeadline	{time.Time}	{error}	*File	3559
3192	os	SetReadDeadline	{time.Time}	{error}	*File	3559
3193	os	SetWriteDeadline	{time.Time}	{error}	*File	3559
3194	os	Fd	{}	{uintptr}	*File	3559
3195	os	Close	{}	{error}	*File	3559
3196	os	Stat	{}	{os.FileInfo,error}	*File	3559
3197	os	Truncate	{int64}	{error}	*File	3559
3198	os	Sync	{}	{error}	*File	3559
3199	os	Chown	{int,int}	{error}	*File	3559
3200	os	Chdir	{}	{error}	*File	3559
3201	os	Chown	{int,int}	{error}	*File	3559
3202	os	Truncate	{int64}	{error}	*File	3559
3203	os	Sync	{}	{error}	*File	3559
3204	os	Chdir	{}	{error}	*File	3559
3205	os	Fd	{}	{uintptr}	*File	3559
3206	os	Close	{}	{error}	*File	3559
3207	os	Fd	{}	{uintptr}	*File	3559
3208	os	Close	{}	{error}	*File	3559
3209	os	Stat	{}	{os.FileInfo,error}	*File	3559
3210	os	Stat	{}	{os.FileInfo,error}	*File	3559
3211	os	String	{}	{string}	FileMode	3561
3212	os	IsDir	{}	{bool}	FileMode	3561
3213	os	IsRegular	{}	{bool}	FileMode	3561
3214	os	Perm	{}	{os.FileMode}	FileMode	3561
3215	user	GroupIds	{}	{[]string,error}	*User	3562
3216	user	Error	{}	{string}	UnknownUserIdError	3564
3217	user	Error	{}	{string}	UnknownUserError	3565
3218	user	Error	{}	{string}	UnknownGroupIdError	3566
3219	user	Error	{}	{string}	UnknownGroupError	3567
3220	plugin	Lookup	{string}	{plugin.Symbol,error}	*Plugin	3569
3221	reflect	String	{}	{string}	Kind	3572
3222	reflect	String	{}	{string}	ChanDir	3573
3223	reflect	Get	{string}	{string}	StructTag	3576
3224	reflect	Lookup	{string}	{string,bool}	StructTag	3576
3225	reflect	Addr	{}	{reflect.Value}	Value	3577
3226	reflect	Bool	{}	{bool}	Value	3577
3227	reflect	Bytes	{}	{[]byte}	Value	3577
3228	reflect	CanAddr	{}	{bool}	Value	3577
3229	reflect	CanSet	{}	{bool}	Value	3577
3230	reflect	Call	{[]reflect.Value}	{[]reflect.Value}	Value	3577
3231	reflect	CallSlice	{[]reflect.Value}	{[]reflect.Value}	Value	3577
3232	reflect	Cap	{}	{int}	Value	3577
3233	reflect	Close	{}	{}	Value	3577
3234	reflect	Complex	{}	{complex128}	Value	3577
3235	reflect	Elem	{}	{reflect.Value}	Value	3577
3236	reflect	Field	{int}	{reflect.Value}	Value	3577
3237	reflect	FieldByIndex	{[]int}	{reflect.Value}	Value	3577
3238	reflect	FieldByName	{string}	{reflect.Value}	Value	3577
3239	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.Value}	Value	3577
3240	reflect	Float	{}	{float64}	Value	3577
3241	reflect	Index	{int}	{reflect.Value}	Value	3577
3242	reflect	Int	{}	{int64}	Value	3577
3243	reflect	CanInterface	{}	{bool}	Value	3577
3244	reflect	Interface	{}	{"interface{}"}	Value	3577
3245	reflect	InterfaceData	{}	{[]uintptr}	Value	3577
3246	reflect	IsNil	{}	{bool}	Value	3577
3247	reflect	IsValid	{}	{bool}	Value	3577
3248	reflect	Kind	{}	{reflect.Kind}	Value	3577
3249	reflect	Len	{}	{int}	Value	3577
3250	reflect	MapIndex	{reflect.Value}	{reflect.Value}	Value	3577
3251	reflect	MapKeys	{}	{[]reflect.Value}	Value	3577
3252	reflect	Method	{int}	{reflect.Value}	Value	3577
3253	reflect	NumMethod	{}	{int}	Value	3577
3254	reflect	MethodByName	{string}	{reflect.Value}	Value	3577
3255	reflect	NumField	{}	{int}	Value	3577
3256	reflect	OverflowComplex	{complex128}	{bool}	Value	3577
3257	reflect	OverflowFloat	{float64}	{bool}	Value	3577
3258	reflect	OverflowInt	{int64}	{bool}	Value	3577
3259	reflect	OverflowUint	{uint64}	{bool}	Value	3577
3260	reflect	Pointer	{}	{uintptr}	Value	3577
3261	reflect	Recv	{}	{reflect.Value,bool}	Value	3577
3262	reflect	Send	{reflect.Value}	{}	Value	3577
3263	reflect	Set	{reflect.Value}	{}	Value	3577
3264	reflect	SetBool	{bool}	{}	Value	3577
3265	reflect	SetBytes	{[]byte}	{}	Value	3577
3266	reflect	SetComplex	{complex128}	{}	Value	3577
3267	reflect	SetFloat	{float64}	{}	Value	3577
3268	reflect	SetInt	{int64}	{}	Value	3577
3269	reflect	SetLen	{int}	{}	Value	3577
3270	reflect	SetCap	{int}	{}	Value	3577
3271	reflect	SetMapIndex	{reflect.Value,reflect.Value}	{}	Value	3577
3272	reflect	SetUint	{uint64}	{}	Value	3577
3273	reflect	SetPointer	{unsafe.Pointer}	{}	Value	3577
3274	reflect	SetString	{string}	{}	Value	3577
3275	reflect	Slice	{int,int}	{reflect.Value}	Value	3577
3276	reflect	Slice3	{int,int,int}	{reflect.Value}	Value	3577
3277	reflect	String	{}	{string}	Value	3577
3278	reflect	TryRecv	{}	{reflect.Value,bool}	Value	3577
3279	reflect	TrySend	{reflect.Value}	{bool}	Value	3577
3280	reflect	Type	{}	{reflect.Type}	Value	3577
3281	reflect	Uint	{}	{uint64}	Value	3577
3282	reflect	UnsafeAddr	{}	{uintptr}	Value	3577
3283	reflect	Convert	{reflect.Type}	{reflect.Value}	Value	3577
3284	reflect	Error	{}	{string}	*ValueError	3578
3285	regexp	String	{}	{string}	*Regexp	3583
3286	regexp	Copy	{}	{*regexp.Regexp}	*Regexp	3583
3287	regexp	Longest	{}	{}	*Regexp	3583
3288	regexp	NumSubexp	{}	{int}	*Regexp	3583
3289	regexp	SubexpNames	{}	{[]string}	*Regexp	3583
3290	regexp	LiteralPrefix	{}	{string,bool}	*Regexp	3583
3291	regexp	MatchReader	{io.RuneReader}	{bool}	*Regexp	3583
3292	regexp	MatchString	{string}	{bool}	*Regexp	3583
3293	regexp	Match	{[]byte}	{bool}	*Regexp	3583
3294	regexp	ReplaceAllString	{string,string}	{string}	*Regexp	3583
3295	regexp	ReplaceAllLiteralString	{string,string}	{string}	*Regexp	3583
3296	regexp	ReplaceAllStringFunc	{string,"func(string) string"}	{string}	*Regexp	3583
3297	regexp	ReplaceAll	{[]byte,[]byte}	{[]byte}	*Regexp	3583
3298	regexp	ReplaceAllLiteral	{[]byte,[]byte}	{[]byte}	*Regexp	3583
3299	regexp	ReplaceAllFunc	{[]byte,"func([]byte) []byte"}	{[]byte}	*Regexp	3583
3300	regexp	Find	{[]byte}	{[]byte}	*Regexp	3583
3301	regexp	FindIndex	{[]byte}	{[]int}	*Regexp	3583
3302	regexp	FindString	{string}	{string}	*Regexp	3583
3303	regexp	FindStringIndex	{string}	{[]int}	*Regexp	3583
3304	regexp	FindReaderIndex	{io.RuneReader}	{[]int}	*Regexp	3583
3305	regexp	FindSubmatch	{[]byte}	{[][]byte}	*Regexp	3583
3306	regexp	Expand	{[]byte,[]byte,[]byte,[]int}	{[]byte}	*Regexp	3583
3307	regexp	ExpandString	{[]byte,string,string,[]int}	{[]byte}	*Regexp	3583
3308	regexp	FindSubmatchIndex	{[]byte}	{[]int}	*Regexp	3583
3309	regexp	FindStringSubmatch	{string}	{[]string}	*Regexp	3583
3310	regexp	FindStringSubmatchIndex	{string}	{[]int}	*Regexp	3583
3311	regexp	FindReaderSubmatchIndex	{io.RuneReader}	{[]int}	*Regexp	3583
3312	regexp	FindAll	{[]byte,int}	{[][]byte}	*Regexp	3583
3313	regexp	FindAllIndex	{[]byte,int}	{[][]int}	*Regexp	3583
3314	regexp	FindAllString	{string,int}	{[]string}	*Regexp	3583
3315	regexp	FindAllStringIndex	{string,int}	{[][]int}	*Regexp	3583
3316	regexp	FindAllSubmatch	{[]byte,int}	{[][][]byte}	*Regexp	3583
3317	regexp	FindAllSubmatchIndex	{[]byte,int}	{[][]int}	*Regexp	3583
3318	regexp	FindAllStringSubmatch	{string,int}	{[][]string}	*Regexp	3583
3319	regexp	FindAllStringSubmatchIndex	{string,int}	{[][]int}	*Regexp	3583
3320	regexp	Split	{string,int}	{[]string}	*Regexp	3583
3321	syntax	String	{}	{string}	ErrorCode	3585
3322	syntax	String	{}	{string}	*Prog	3587
3323	syntax	Prefix	{}	{string,bool}	*Prog	3587
3324	syntax	StartCond	{}	{syntax.EmptyOp}	*Prog	3587
3325	syntax	String	{}	{string}	InstOp	3588
3326	syntax	MatchRune	{rune}	{bool}	*Inst	3590
3327	syntax	MatchRunePos	{rune}	{int}	*Inst	3590
3328	syntax	MatchEmptyWidth	{rune,rune}	{bool}	*Inst	3590
3329	syntax	String	{}	{string}	*Inst	3590
3330	syntax	Equal	{*syntax.Regexp}	{bool}	*Regexp	3591
3331	syntax	String	{}	{string}	*Regexp	3591
3332	syntax	MaxCap	{}	{int}	*Regexp	3591
3333	syntax	CapNames	{}	{[]string}	*Regexp	3591
3334	syntax	Simplify	{}	{*syntax.Regexp}	*Regexp	3591
3335	syntax	String	{}	{string}	Op	3592
3336	runtime	RuntimeError	{}	{}	*TypeAssertionError	3738
3337	runtime	Error	{}	{string}	*TypeAssertionError	3738
3338	runtime	Stack	{}	{[]uintptr}	*StackRecord	3753
3339	runtime	InUseBytes	{}	{int64}	*MemProfileRecord	3754
3340	runtime	InUseObjects	{}	{int64}	*MemProfileRecord	3754
3341	runtime	Stack	{}	{[]uintptr}	*MemProfileRecord	3754
3342	pprof	Name	{}	{string}	*Profile	3768
3343	pprof	Count	{}	{int}	*Profile	3768
3344	pprof	Add	{"interface{}",int}	{}	*Profile	3768
3345	pprof	Remove	{"interface{}"}	{}	*Profile	3768
3346	pprof	WriteTo	{io.Writer,int}	{error}	*Profile	3768
3347	runtime	Next	{}	{runtime.Frame,bool}	*Frames	3769
3348	runtime	Name	{}	{string}	*Func	3771
3349	runtime	Entry	{}	{uintptr}	*Func	3771
3350	runtime	FileLine	{uintptr}	{string,int}	*Func	3771
3351	trace	End	{}	{}	*Task	3772
3352	trace	End	{}	{}	*Region	3773
3353	sort	Search	{int}	{int}	IntSlice	3775
3354	sort	Len	{}	{int}	IntSlice	3775
3355	sort	Less	{int,int}	{bool}	IntSlice	3775
3356	sort	Swap	{int,int}	{}	IntSlice	3775
3357	sort	Sort	{}	{}	IntSlice	3775
3358	sort	Search	{float64}	{int}	Float64Slice	3776
3359	sort	Len	{}	{int}	Float64Slice	3776
3360	sort	Less	{int,int}	{bool}	Float64Slice	3776
3361	sort	Swap	{int,int}	{}	Float64Slice	3776
3362	sort	Sort	{}	{}	Float64Slice	3776
3363	sort	Search	{string}	{int}	StringSlice	3777
3364	sort	Len	{}	{int}	StringSlice	3777
3365	sort	Less	{int,int}	{bool}	StringSlice	3777
3366	sort	Swap	{int,int}	{}	StringSlice	3777
3367	sort	Sort	{}	{}	StringSlice	3777
3368	strconv	Error	{}	{string}	*NumError	3778
3369	strings	String	{}	{string}	*Builder	3779
3370	strings	Len	{}	{int}	*Builder	3779
3371	strings	Reset	{}	{}	*Builder	3779
3372	strings	Grow	{int}	{}	*Builder	3779
3373	strings	Write	{[]byte}	{int,error}	*Builder	3779
3374	strings	WriteByte	{byte}	{error}	*Builder	3779
3375	strings	WriteRune	{rune}	{int,error}	*Builder	3779
3376	strings	WriteString	{string}	{int,error}	*Builder	3779
3377	strings	Len	{}	{int}	*Reader	3780
3378	strings	Size	{}	{int64}	*Reader	3780
3379	strings	Read	{[]byte}	{int,error}	*Reader	3780
3380	strings	ReadAt	{[]byte,int64}	{int,error}	*Reader	3780
3381	strings	ReadByte	{}	{byte,error}	*Reader	3780
3382	strings	UnreadByte	{}	{error}	*Reader	3780
3383	strings	ReadRune	{}	{rune,int,error}	*Reader	3780
3384	strings	UnreadRune	{}	{error}	*Reader	3780
3385	strings	Seek	{int64,int}	{int64,error}	*Reader	3780
3386	strings	WriteTo	{io.Writer}	{int64,error}	*Reader	3780
3387	strings	Reset	{string}	{}	*Reader	3780
3388	strings	Replace	{string}	{string}	*Replacer	3781
3389	strings	WriteString	{io.Writer,string}	{int,error}	*Replacer	3781
3390	atomic	Load	{}	{"interface{}"}	*Value	3782
3391	atomic	Store	{"interface{}"}	{}	*Value	3782
3392	sync	Wait	{}	{}	*Cond	3783
3393	sync	Signal	{}	{}	*Cond	3783
3394	sync	Broadcast	{}	{}	*Cond	3783
3395	sync	Load	{"interface{}"}	{"interface{}",bool}	*Map	3784
3396	sync	Store	{"interface{}","interface{}"}	{}	*Map	3784
3397	sync	LoadOrStore	{"interface{}","interface{}"}	{"interface{}",bool}	*Map	3784
3398	sync	Delete	{"interface{}"}	{}	*Map	3784
3399	sync	Range	{"func(interface{}) bool"}	{}	*Map	3784
3400	sync	Lock	{}	{}	*Mutex	3785
3401	sync	Unlock	{}	{}	*Mutex	3785
3402	sync	Do	{func()}	{}	*Once	3787
3403	sync	Put	{"interface{}"}	{}	*Pool	3788
3404	sync	Get	{}	{"interface{}"}	*Pool	3788
3405	sync	RLock	{}	{}	*RWMutex	3789
3406	sync	RUnlock	{}	{}	*RWMutex	3789
3407	sync	Lock	{}	{}	*RWMutex	3789
3408	sync	Unlock	{}	{}	*RWMutex	3789
3409	sync	RLocker	{}	{sync.Locker}	*RWMutex	3789
3410	sync	Add	{int}	{}	*WaitGroup	3790
3411	sync	Done	{}	{}	*WaitGroup	3790
3412	sync	Wait	{}	{}	*WaitGroup	3790
3413	syscall	Null	{}	{}	*Dir	3792
3414	syscall	Marshal	{[]byte}	{int,error}	*Dir	3792
3415	syscall	Error	{}	{string}	*DLLError	3793
3416	syscall	FindProc	{string}	{*syscall.Proc,error}	*DLL	3794
3417	syscall	MustFindProc	{string}	{*syscall.Proc}	*DLL	3794
3418	syscall	Release	{}	{error}	*DLL	3794
3419	syscall	Addr	{}	{uintptr}	*Proc	3795
3420	syscall	Call	{...uintptr}	{uintptr,error}	*Proc	3795
3421	syscall	Load	{}	{error}	*LazyDLL	3796
3422	syscall	Handle	{}	{uintptr}	*LazyDLL	3796
3423	syscall	NewProc	{string}	{*syscall.LazyProc}	*LazyDLL	3796
3424	syscall	Find	{}	{error}	*LazyProc	3797
3425	syscall	Addr	{}	{uintptr}	*LazyProc	3797
3426	syscall	Call	{...uintptr}	{uintptr,error}	*LazyProc	3797
3427	js	Release	{}	{}	Callback	3808
3428	js	Type	{}	{js.Type}	Value	3810
3429	js	Get	{string}	{js.Value}	Value	3810
3430	js	Set	{string,"interface{}"}	{}	Value	3810
3431	js	Index	{int}	{js.Value}	Value	3810
3432	js	SetIndex	{int,"interface{}"}	{}	Value	3810
3433	js	Length	{}	{int}	Value	3810
3434	js	Call	{string,"...interface{}"}	{js.Value}	Value	3810
3435	js	Invoke	{"...interface{}"}	{js.Value}	Value	3810
3436	js	New	{"...interface{}"}	{js.Value}	Value	3810
3437	js	Float	{}	{float64}	Value	3810
3438	js	Int	{}	{int}	Value	3810
3439	js	Bool	{}	{bool}	Value	3810
3440	js	String	{}	{string}	Value	3810
3441	js	InstanceOf	{js.Value}	{bool}	Value	3810
3442	js	Error	{}	{string}	Error	3811
3443	js	String	{}	{string}	Type	3812
3444	js	Error	{}	{string}	*ValueError	3813
3445	js	Release	{}	{}	TypedArray	3814
3446	main	BoolTmpVarCode	{}	{string}	*Param	3815
3447	main	SliceTmpVarCode	{}	{string}	*Param	3815
3448	main	StringTmpVarCode	{}	{string}	*Param	3815
3449	main	TmpVarCode	{}	{string}	*Param	3815
3450	main	TmpVarHelperCode	{}	{string}	*Param	3815
3451	main	SyscallArgList	{}	{[]string}	*Param	3815
3452	main	IsError	{}	{bool}	*Param	3815
3453	main	HelperType	{}	{string}	*Param	3815
3454	main	ErrorVarName	{}	{string}	*Rets	3816
3455	main	ToParams	{}	{[]*main.Param}	*Rets	3816
3456	main	List	{}	{string}	*Rets	3816
3457	main	PrintList	{}	{string}	*Rets	3816
3458	main	SetReturnValuesCode	{}	{string}	*Rets	3816
3459	main	SetErrorCode	{}	{string}	*Rets	3816
3460	main	DLLName	{}	{string}	*Fn	3817
3461	main	DLLFuncName	{}	{string}	*Fn	3817
3462	main	ParamList	{}	{string}	*Fn	3817
3463	main	HelperParamList	{}	{string}	*Fn	3817
3464	main	ParamPrintList	{}	{string}	*Fn	3817
3465	main	ParamCount	{}	{int}	*Fn	3817
3466	main	SyscallParamCount	{}	{int}	*Fn	3817
3467	main	Syscall	{}	{string}	*Fn	3817
3468	main	SyscallParamList	{}	{string}	*Fn	3817
3469	main	HelperCallParamList	{}	{string}	*Fn	3817
3470	main	IsUTF16	{}	{bool}	*Fn	3817
3471	main	StrconvFunc	{}	{string}	*Fn	3817
3472	main	StrconvType	{}	{string}	*Fn	3817
3473	main	HasStringParam	{}	{bool}	*Fn	3817
3474	main	HelperName	{}	{string}	*Fn	3817
3475	main	Import	{string}	{}	*Source	3818
3476	main	ExternalImport	{string}	{}	*Source	3818
3477	main	DLLs	{}	{[]string}	*Source	3818
3478	main	ParseFile	{string}	{error}	*Source	3818
3479	main	IsStdRepo	{}	{bool,error}	*Source	3818
3480	main	Generate	{io.Writer}	{error}	*Source	3818
3481	syscall	String	{}	{string,error}	*SID	3850
3482	syscall	Len	{}	{int}	*SID	3850
3483	syscall	Copy	{}	{*syscall.SID,error}	*SID	3850
3484	syscall	LookupAccount	{string}	{string,uint32,error}	*SID	3850
3485	syscall	Close	{}	{error}	Token	3854
3486	syscall	GetTokenUser	{}	{*syscall.Tokenuser,error}	Token	3854
3487	syscall	GetTokenPrimaryGroup	{}	{*syscall.Tokenprimarygroup,error}	Token	3854
3488	syscall	GetUserProfileDirectory	{}	{string,error}	Token	3854
3489	syscall	Exited	{}	{bool}	WaitStatus	3856
3490	syscall	ExitStatus	{}	{int}	WaitStatus	3856
3491	syscall	Signaled	{}	{bool}	WaitStatus	3856
3492	syscall	Signal	{}	{syscall.Signal}	WaitStatus	3856
3493	syscall	CoreDump	{}	{bool}	WaitStatus	3856
3494	syscall	Stopped	{}	{bool}	WaitStatus	3856
3495	syscall	Continued	{}	{bool}	WaitStatus	3856
3496	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	3856
3497	syscall	TrapCause	{}	{int}	WaitStatus	3856
3498	syscall	Exited	{}	{bool}	WaitStatus	3856
3499	syscall	ExitStatus	{}	{int}	WaitStatus	3856
3500	syscall	Signaled	{}	{bool}	WaitStatus	3856
3501	syscall	Signal	{}	{syscall.Signal}	WaitStatus	3856
3502	syscall	CoreDump	{}	{bool}	WaitStatus	3856
3503	syscall	Stopped	{}	{bool}	WaitStatus	3856
3504	syscall	Continued	{}	{bool}	WaitStatus	3856
3505	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	3856
3506	syscall	TrapCause	{}	{int}	WaitStatus	3856
3507	syscall	Exited	{}	{bool}	WaitStatus	3856
3508	syscall	Signaled	{}	{bool}	WaitStatus	3856
3509	syscall	Stopped	{}	{bool}	WaitStatus	3856
3510	syscall	Continued	{}	{bool}	WaitStatus	3856
3511	syscall	CoreDump	{}	{bool}	WaitStatus	3856
3512	syscall	ExitStatus	{}	{int}	WaitStatus	3856
3513	syscall	Signal	{}	{syscall.Signal}	WaitStatus	3856
3514	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	3856
3515	syscall	TrapCause	{}	{int}	WaitStatus	3856
3516	syscall	Exited	{}	{bool}	WaitStatus	3856
3517	syscall	ExitStatus	{}	{int}	WaitStatus	3856
3518	syscall	Signaled	{}	{bool}	WaitStatus	3856
3519	syscall	Signal	{}	{syscall.Signal}	WaitStatus	3856
3520	syscall	CoreDump	{}	{bool}	WaitStatus	3856
3521	syscall	Stopped	{}	{bool}	WaitStatus	3856
3522	syscall	Continued	{}	{bool}	WaitStatus	3856
3523	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	3856
3524	syscall	TrapCause	{}	{int}	WaitStatus	3856
3525	syscall	Exited	{}	{bool}	WaitStatus	3856
3526	syscall	ExitStatus	{}	{int}	WaitStatus	3856
3527	syscall	Signaled	{}	{bool}	WaitStatus	3856
3528	syscall	Signal	{}	{syscall.Signal}	WaitStatus	3856
3529	syscall	CoreDump	{}	{bool}	WaitStatus	3856
3530	syscall	Stopped	{}	{bool}	WaitStatus	3856
3531	syscall	Continued	{}	{bool}	WaitStatus	3856
3532	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	3856
3533	syscall	TrapCause	{}	{int}	WaitStatus	3856
3534	syscall	Exited	{}	{bool}	WaitStatus	3856
3535	syscall	ExitStatus	{}	{int}	WaitStatus	3856
3536	syscall	Signal	{}	{syscall.Signal}	WaitStatus	3856
3537	syscall	CoreDump	{}	{bool}	WaitStatus	3856
3538	syscall	Stopped	{}	{bool}	WaitStatus	3856
3539	syscall	Continued	{}	{bool}	WaitStatus	3856
3540	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	3856
3541	syscall	Signaled	{}	{bool}	WaitStatus	3856
3542	syscall	TrapCause	{}	{int}	WaitStatus	3856
3543	syscall	Error	{}	{string}	Errno	3861
3544	syscall	Temporary	{}	{bool}	Errno	3861
3545	syscall	Timeout	{}	{bool}	Errno	3861
3546	syscall	Error	{}	{string}	Errno	3861
3547	syscall	Temporary	{}	{bool}	Errno	3861
3548	syscall	Timeout	{}	{bool}	Errno	3861
3549	syscall	Error	{}	{string}	Errno	3861
3550	syscall	Temporary	{}	{bool}	Errno	3861
3551	syscall	Timeout	{}	{bool}	Errno	3861
3552	syscall	Error	{}	{string}	Errno	3861
3553	syscall	Temporary	{}	{bool}	Errno	3861
3554	syscall	Timeout	{}	{bool}	Errno	3861
3555	syscall	Signal	{}	{}	Signal	3862
3556	syscall	String	{}	{string}	Signal	3862
3557	syscall	Signal	{}	{}	Signal	3862
3558	syscall	String	{}	{string}	Signal	3862
3559	syscall	Signal	{}	{}	Signal	3862
3560	syscall	String	{}	{string}	Signal	3862
3561	syscall	Signal	{}	{}	Signal	3862
3562	syscall	String	{}	{string}	Signal	3862
3563	syscall	SetLen	{int}	{}	*Iovec	3868
3564	syscall	SetLen	{int}	{}	*Iovec	3868
3565	syscall	SetLen	{int}	{}	*Iovec	3868
3566	syscall	SetLen	{int}	{}	*Iovec	3868
3567	syscall	SetLen	{int}	{}	*Iovec	3868
3568	syscall	SetLen	{int}	{}	*Iovec	3868
3569	syscall	SetLen	{int}	{}	*Iovec	3868
3570	syscall	SetLen	{int}	{}	*Iovec	3868
3571	syscall	SetLen	{int}	{}	*Iovec	3868
3572	syscall	SetLen	{int}	{}	*Iovec	3868
3573	syscall	SetLen	{int}	{}	*Iovec	3868
3574	syscall	SetLen	{int}	{}	*Iovec	3868
3575	syscall	SetLen	{int}	{}	*Iovec	3868
3576	syscall	SetLen	{int}	{}	*Iovec	3868
3577	syscall	SetLen	{int}	{}	*Iovec	3868
3578	syscall	SetLen	{int}	{}	*Iovec	3868
3579	syscall	SetLen	{int}	{}	*Iovec	3868
3580	syscall	SetLen	{int}	{}	*Iovec	3868
3581	syscall	SetLen	{int}	{}	*Iovec	3868
3582	syscall	SetLen	{int}	{}	*Iovec	3868
3583	syscall	SetLen	{int}	{}	*Iovec	3868
3584	syscall	SetLen	{int}	{}	*Iovec	3868
3585	syscall	SetLen	{int}	{}	*Iovec	3868
3586	syscall	Unix	{}	{int64,int64}	*Timespec	3869
3587	syscall	Nano	{}	{int64}	*Timespec	3869
3588	syscall	Unix	{}	{int64,int64}	*Timeval	3870
3589	syscall	Nano	{}	{int64}	*Timeval	3870
3590	syscall	Nanoseconds	{}	{int64}	*Timeval	3870
3591	syscall	Error	{}	{string}	ErrorString	3891
3592	syscall	Temporary	{}	{bool}	ErrorString	3891
3593	syscall	Timeout	{}	{bool}	ErrorString	3891
3594	syscall	Signal	{}	{}	Note	3892
3595	syscall	String	{}	{string}	Note	3892
3596	syscall	Exited	{}	{bool}	Waitmsg	3893
3597	syscall	Signaled	{}	{bool}	Waitmsg	3893
3598	syscall	ExitStatus	{}	{int}	Waitmsg	3893
3599	syscall	Sockaddr	{}	{syscall.Sockaddr,error}	*RawSockaddrAny	3909
3600	syscall	SetControllen	{int}	{}	*Msghdr	3945
3601	syscall	SetControllen	{int}	{}	*Msghdr	3945
3602	syscall	SetControllen	{int}	{}	*Msghdr	3945
3603	syscall	SetControllen	{int}	{}	*Msghdr	3945
3604	syscall	SetControllen	{int}	{}	*Msghdr	3945
3605	syscall	SetControllen	{int}	{}	*Msghdr	3945
3606	syscall	SetControllen	{int}	{}	*Msghdr	3945
3607	syscall	SetControllen	{int}	{}	*Msghdr	3945
3608	syscall	SetControllen	{int}	{}	*Msghdr	3945
3609	syscall	SetControllen	{int}	{}	*Msghdr	3945
3610	syscall	SetControllen	{int}	{}	*Msghdr	3945
3611	syscall	SetControllen	{int}	{}	*Msghdr	3945
3612	syscall	SetControllen	{int}	{}	*Msghdr	3945
3613	syscall	SetControllen	{int}	{}	*Msghdr	3945
3614	syscall	SetControllen	{int}	{}	*Msghdr	3945
3615	syscall	SetControllen	{int}	{}	*Msghdr	3945
3616	syscall	SetControllen	{int}	{}	*Msghdr	3945
3617	syscall	SetControllen	{int}	{}	*Msghdr	3945
3618	syscall	SetControllen	{int}	{}	*Msghdr	3945
3619	syscall	SetControllen	{int}	{}	*Msghdr	3945
3620	syscall	SetControllen	{int}	{}	*Msghdr	3945
3621	syscall	SetControllen	{int}	{}	*Msghdr	3945
3622	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3623	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3624	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3625	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3626	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3627	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3628	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3629	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3630	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3631	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3632	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3633	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3634	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3635	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3636	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3637	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3638	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3639	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3640	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3641	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3642	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3643	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3644	syscall	SetLen	{int}	{}	*Cmsghdr	3946
3645	syscall	PC	{}	{uint64}	*PtraceRegs	4092
3646	syscall	SetPC	{uint64}	{}	*PtraceRegs	4092
3647	syscall	PC	{}	{uint64}	*PtraceRegs	4092
3648	syscall	SetPC	{uint64}	{}	*PtraceRegs	4092
3649	syscall	PC	{}	{uint64}	*PtraceRegs	4092
3650	syscall	SetPC	{uint64}	{}	*PtraceRegs	4092
3651	syscall	PC	{}	{uint64}	*PtraceRegs	4092
3652	syscall	SetPC	{uint64}	{}	*PtraceRegs	4092
3653	syscall	PC	{}	{uint64}	*PtraceRegs	4092
3654	syscall	SetPC	{uint64}	{}	*PtraceRegs	4092
3655	syscall	PC	{}	{uint64}	*PtraceRegs	4092
3656	syscall	SetPC	{uint64}	{}	*PtraceRegs	4092
3657	syscall	PC	{}	{uint64}	*PtraceRegs	4092
3658	syscall	SetPC	{uint64}	{}	*PtraceRegs	4092
3659	syscall	PC	{}	{uint64}	*PtraceRegs	4092
3660	syscall	SetPC	{uint64}	{}	*PtraceRegs	4092
3661	syscall	Nanoseconds	{}	{int64}	*Filetime	4221
3662	testing	Next	{}	{bool}	*PB	5472
3663	testdeps	MatchString	{string,string}	{bool,error}	TestDeps	5476
3664	testdeps	StartCPUProfile	{io.Writer}	{error}	TestDeps	5476
3665	testdeps	StopCPUProfile	{}	{}	TestDeps	5476
3666	testdeps	WriteProfileTo	{string,io.Writer,int}	{error}	TestDeps	5476
3667	testdeps	ImportPath	{}	{string}	TestDeps	5476
3668	testdeps	StartTestLog	{io.Writer}	{}	TestDeps	5476
3669	testdeps	StopTestLog	{}	{error}	TestDeps	5476
3670	quick	Error	{}	{string}	SetupError	5479
3671	quick	Error	{}	{string}	*CheckError	5480
3672	quick	Error	{}	{string}	*CheckEqualError	5481
3673	testing	Run	{}	{int}	*M	5485
3674	scanner	IsValid	{}	{bool}	*Position	5486
3675	scanner	String	{}	{string}	Position	5486
3676	tabwriter	Init	{io.Writer,int,int,int,byte,uint}	{*tabwriter.Writer}	*Writer	5488
3677	tabwriter	Flush	{}	{error}	*Writer	5488
3678	tabwriter	Write	{[]byte}	{int,error}	*Writer	5488
3679	template	Error	{}	{string}	ExecError	5489
3680	parse	Type	{}	{parse.NodeType}	NodeType	5492
3681	parse	Position	{}	{parse.Pos}	Pos	5493
3682	parse	String	{}	{string}	*ListNode	5494
3683	parse	CopyList	{}	{*parse.ListNode}	*ListNode	5494
3684	parse	Copy	{}	{parse.Node}	*ListNode	5494
3685	parse	String	{}	{string}	*TextNode	5495
3686	parse	Copy	{}	{parse.Node}	*TextNode	5495
3687	parse	String	{}	{string}	*PipeNode	5496
3688	parse	CopyPipe	{}	{*parse.PipeNode}	*PipeNode	5496
3689	parse	Copy	{}	{parse.Node}	*PipeNode	5496
3690	parse	String	{}	{string}	*ActionNode	5497
3691	parse	Copy	{}	{parse.Node}	*ActionNode	5497
3692	parse	String	{}	{string}	*CommandNode	5498
3693	parse	Copy	{}	{parse.Node}	*CommandNode	5498
3694	parse	SetPos	{parse.Pos}	{*parse.IdentifierNode}	*IdentifierNode	5499
3695	parse	SetTree	{*parse.Tree}	{*parse.IdentifierNode}	*IdentifierNode	5499
3696	parse	String	{}	{string}	*IdentifierNode	5499
3697	parse	Copy	{}	{parse.Node}	*IdentifierNode	5499
3698	parse	String	{}	{string}	*VariableNode	5500
3699	parse	Copy	{}	{parse.Node}	*VariableNode	5500
3700	parse	Type	{}	{parse.NodeType}	*DotNode	5501
3701	parse	String	{}	{string}	*DotNode	5501
3702	parse	Copy	{}	{parse.Node}	*DotNode	5501
3703	parse	Type	{}	{parse.NodeType}	*NilNode	5502
3704	parse	String	{}	{string}	*NilNode	5502
3705	parse	Copy	{}	{parse.Node}	*NilNode	5502
3706	parse	String	{}	{string}	*FieldNode	5503
3707	parse	Copy	{}	{parse.Node}	*FieldNode	5503
3708	parse	Add	{string}	{}	*ChainNode	5504
3709	parse	String	{}	{string}	*ChainNode	5504
3710	parse	Copy	{}	{parse.Node}	*ChainNode	5504
3711	parse	String	{}	{string}	*BoolNode	5505
3712	parse	Copy	{}	{parse.Node}	*BoolNode	5505
3713	parse	String	{}	{string}	*NumberNode	5506
3714	parse	Copy	{}	{parse.Node}	*NumberNode	5506
3715	parse	String	{}	{string}	*StringNode	5507
3716	parse	Copy	{}	{parse.Node}	*StringNode	5507
3717	parse	String	{}	{string}	*BranchNode	5508
3718	parse	Copy	{}	{parse.Node}	*BranchNode	5508
3719	parse	Copy	{}	{parse.Node}	*IfNode	5509
3720	parse	Copy	{}	{parse.Node}	*RangeNode	5510
3721	parse	Copy	{}	{parse.Node}	*WithNode	5511
3722	parse	String	{}	{string}	*TemplateNode	5512
3723	parse	Copy	{}	{parse.Node}	*TemplateNode	5512
3724	parse	Copy	{}	{*parse.Tree}	*Tree	5513
3725	parse	ErrorContext	{parse.Node}	{string}	*Tree	5513
3726	parse	Parse	{string,string,string,map[string]*parse.Tree,"...map[string]interface{}"}	{*parse.Tree,error}	*Tree	5513
3727	time	Error	{}	{string}	*ParseError	5515
3728	time	Stop	{}	{bool}	*Timer	5518
3729	time	Reset	{time.Duration}	{bool}	*Timer	5518
3730	time	Stop	{}	{}	*Ticker	5519
3731	time	String	{}	{string}	Time	5520
3732	time	Format	{string}	{string}	Time	5520
3733	time	AppendFormat	{[]byte,string}	{[]byte}	Time	5520
3734	time	After	{time.Time}	{bool}	Time	5520
3735	time	Before	{time.Time}	{bool}	Time	5520
3736	time	Equal	{time.Time}	{bool}	Time	5520
3737	time	IsZero	{}	{bool}	Time	5520
3738	time	Date	{}	{int,time.Month,int}	Time	5520
3739	time	Year	{}	{int}	Time	5520
3740	time	Month	{}	{time.Month}	Time	5520
3741	time	Day	{}	{int}	Time	5520
3742	time	Weekday	{}	{time.Weekday}	Time	5520
3743	time	ISOWeek	{}	{int}	Time	5520
3744	time	Clock	{}	{int}	Time	5520
3745	time	Hour	{}	{int}	Time	5520
3746	time	Minute	{}	{int}	Time	5520
3747	time	Second	{}	{int}	Time	5520
3748	time	Nanosecond	{}	{int}	Time	5520
3749	time	YearDay	{}	{int}	Time	5520
3750	time	Add	{time.Duration}	{time.Time}	Time	5520
3751	time	Sub	{time.Time}	{time.Duration}	Time	5520
3752	time	AddDate	{int,int,int}	{time.Time}	Time	5520
3753	time	UTC	{}	{time.Time}	Time	5520
3754	time	Local	{}	{time.Time}	Time	5520
3755	time	In	{*time.Location}	{time.Time}	Time	5520
3756	time	Location	{}	{*time.Location}	Time	5520
3757	time	Zone	{}	{string,int}	Time	5520
3758	time	Unix	{}	{int64}	Time	5520
3759	time	UnixNano	{}	{int64}	Time	5520
3760	time	MarshalBinary	{}	{[]byte,error}	Time	5520
3761	time	UnmarshalBinary	{[]byte}	{error}	*Time	5520
3762	time	GobEncode	{}	{[]byte,error}	Time	5520
3763	time	GobDecode	{[]byte}	{error}	*Time	5520
3764	time	MarshalJSON	{}	{[]byte,error}	Time	5520
3765	time	UnmarshalJSON	{[]byte}	{error}	*Time	5520
3766	time	MarshalText	{}	{[]byte,error}	Time	5520
3767	time	UnmarshalText	{[]byte}	{error}	*Time	5520
3768	time	Truncate	{time.Duration}	{time.Time}	Time	5520
3769	time	Round	{time.Duration}	{time.Time}	Time	5520
3770	time	String	{}	{string}	Month	5521
3771	time	String	{}	{string}	Weekday	5522
3772	time	String	{}	{string}	Duration	5523
3773	time	Nanoseconds	{}	{int64}	Duration	5523
3774	time	Seconds	{}	{float64}	Duration	5523
3775	time	Minutes	{}	{float64}	Duration	5523
3776	time	Hours	{}	{float64}	Duration	5523
3777	time	Truncate	{time.Duration}	{time.Duration}	Duration	5523
3778	time	Round	{time.Duration}	{time.Duration}	Duration	5523
3779	time	String	{}	{string}	*Location	5524
3780	unicode	ToUpper	{rune}	{rune}	SpecialCase	5529
3781	unicode	ToTitle	{rune}	{rune}	SpecialCase	5529
3782	unicode	ToLower	{rune}	{rune}	SpecialCase	5529
3783	asn1	Constructed	{}	{asn1.Tag}	Tag	5536
3784	asn1	ContextSpecific	{}	{asn1.Tag}	Tag	5536
3785	cryptobyte	AddASN1Int64	{int64}	{}	*Builder	5537
3786	cryptobyte	AddASN1Int64WithTag	{int64,asn1.Tag}	{}	*Builder	5537
3787	cryptobyte	AddASN1Enum	{int64}	{}	*Builder	5537
3788	cryptobyte	AddASN1Uint64	{uint64}	{}	*Builder	5537
3789	cryptobyte	AddASN1BigInt	{*big.Int}	{}	*Builder	5537
3790	cryptobyte	AddASN1OctetString	{[]byte}	{}	*Builder	5537
3791	cryptobyte	AddASN1GeneralizedTime	{time.Time}	{}	*Builder	5537
3792	cryptobyte	AddASN1BitString	{[]byte}	{}	*Builder	5537
3793	cryptobyte	AddASN1ObjectIdentifier	{encoding_asn1.ObjectIdentifier}	{}	*Builder	5537
3794	cryptobyte	AddASN1Boolean	{bool}	{}	*Builder	5537
3795	cryptobyte	AddASN1NULL	{}	{}	*Builder	5537
3796	cryptobyte	MarshalASN1	{"interface{}"}	{}	*Builder	5537
3797	cryptobyte	AddASN1	{asn1.Tag,cryptobyte.BuilderContinuation}	{}	*Builder	5537
3798	cryptobyte	Bytes	{}	{[]byte,error}	*Builder	5537
3799	cryptobyte	BytesOrPanic	{}	{[]byte}	*Builder	5537
3800	cryptobyte	AddUint8	{uint8}	{}	*Builder	5537
3801	cryptobyte	AddUint16	{uint16}	{}	*Builder	5537
3802	cryptobyte	AddUint24	{uint32}	{}	*Builder	5537
3803	cryptobyte	AddUint32	{uint32}	{}	*Builder	5537
3804	cryptobyte	AddBytes	{[]byte}	{}	*Builder	5537
3805	cryptobyte	AddUint8LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	5537
3806	cryptobyte	AddUint16LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	5537
3807	cryptobyte	AddUint24LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	5537
3808	cryptobyte	AddUint32LengthPrefixed	{cryptobyte.BuilderContinuation}	{}	*Builder	5537
3809	cryptobyte	AddValue	{cryptobyte.MarshalingValue}	{}	*Builder	5537
3810	cryptobyte	ReadASN1Boolean	{*bool}	{bool}	*String	5541
3811	cryptobyte	ReadASN1Integer	{"interface{}"}	{bool}	*String	5541
3812	cryptobyte	ReadASN1Int64WithTag	{*int64,asn1.Tag}	{bool}	*String	5541
3813	cryptobyte	ReadASN1Enum	{*int}	{bool}	*String	5541
3814	cryptobyte	ReadASN1ObjectIdentifier	{*encoding_asn1.ObjectIdentifier}	{bool}	*String	5541
3815	cryptobyte	ReadASN1GeneralizedTime	{*time.Time}	{bool}	*String	5541
3816	cryptobyte	ReadASN1BitString	{*encoding_asn1.BitString}	{bool}	*String	5541
3817	cryptobyte	ReadASN1BitStringAsBytes	{*[]byte}	{bool}	*String	5541
3818	cryptobyte	ReadASN1Bytes	{*[]byte,asn1.Tag}	{bool}	*String	5541
3819	cryptobyte	ReadASN1	{*cryptobyte.String,asn1.Tag}	{bool}	*String	5541
3820	cryptobyte	ReadASN1Element	{*cryptobyte.String,asn1.Tag}	{bool}	*String	5541
3821	cryptobyte	ReadAnyASN1	{*cryptobyte.String,*asn1.Tag}	{bool}	*String	5541
3822	cryptobyte	ReadAnyASN1Element	{*cryptobyte.String,*asn1.Tag}	{bool}	*String	5541
3823	cryptobyte	PeekASN1Tag	{asn1.Tag}	{bool}	String	5541
3824	cryptobyte	SkipASN1	{asn1.Tag}	{bool}	*String	5541
3825	cryptobyte	ReadOptionalASN1	{*cryptobyte.String,*bool,asn1.Tag}	{bool}	*String	5541
3826	cryptobyte	SkipOptionalASN1	{asn1.Tag}	{bool}	*String	5541
3827	cryptobyte	ReadOptionalASN1Integer	{"interface{}",asn1.Tag,"interface{}"}	{bool}	*String	5541
3828	cryptobyte	ReadOptionalASN1OctetString	{*[]byte,*bool,asn1.Tag}	{bool}	*String	5541
3829	cryptobyte	ReadOptionalASN1Boolean	{*bool,bool}	{bool}	*String	5541
3830	cryptobyte	Skip	{int}	{bool}	*String	5541
3831	cryptobyte	ReadUint8	{*uint8}	{bool}	*String	5541
3832	cryptobyte	ReadUint16	{*uint16}	{bool}	*String	5541
3833	cryptobyte	ReadUint24	{*uint32}	{bool}	*String	5541
3834	cryptobyte	ReadUint32	{*uint32}	{bool}	*String	5541
3835	cryptobyte	ReadUint8LengthPrefixed	{*cryptobyte.String}	{bool}	*String	5541
3836	cryptobyte	ReadUint16LengthPrefixed	{*cryptobyte.String}	{bool}	*String	5541
3837	cryptobyte	ReadUint24LengthPrefixed	{*cryptobyte.String}	{bool}	*String	5541
3838	cryptobyte	ReadBytes	{*[]byte,int}	{bool}	*String	5541
3839	cryptobyte	CopyBytes	{[]byte}	{bool}	*String	5541
3840	cryptobyte	Empty	{}	{bool}	String	5541
3841	chacha20	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	5542
3842	chacha20	Advance	{}	{}	*Cipher	5542
3843	dnsmessage	Unpack	{[]byte}	{error}	*Message	5548
3844	dnsmessage	Pack	{}	{[]byte,error}	*Message	5548
3845	dnsmessage	AppendPack	{[]byte}	{[]byte,error}	*Message	5548
3846	dnsmessage	Start	{[]byte}	{dnsmessage.Header,error}	*Parser	5551
3847	dnsmessage	Question	{}	{dnsmessage.Question,error}	*Parser	5551
3848	dnsmessage	AllQuestions	{}	{[]dnsmessage.Question,error}	*Parser	5551
3849	dnsmessage	SkipQuestion	{}	{error}	*Parser	5551
3850	dnsmessage	SkipAllQuestions	{}	{error}	*Parser	5551
3851	dnsmessage	AnswerHeader	{}	{dnsmessage.ResourceHeader,error}	*Parser	5551
3852	dnsmessage	Answer	{}	{dnsmessage.Resource,error}	*Parser	5551
3853	dnsmessage	AllAnswers	{}	{[]dnsmessage.Resource,error}	*Parser	5551
3854	dnsmessage	SkipAnswer	{}	{error}	*Parser	5551
3855	dnsmessage	SkipAllAnswers	{}	{error}	*Parser	5551
3856	dnsmessage	AuthorityHeader	{}	{dnsmessage.ResourceHeader,error}	*Parser	5551
3857	dnsmessage	Authority	{}	{dnsmessage.Resource,error}	*Parser	5551
3858	dnsmessage	AllAuthorities	{}	{[]dnsmessage.Resource,error}	*Parser	5551
3859	dnsmessage	SkipAuthority	{}	{error}	*Parser	5551
3860	dnsmessage	SkipAllAuthorities	{}	{error}	*Parser	5551
3861	dnsmessage	AdditionalHeader	{}	{dnsmessage.ResourceHeader,error}	*Parser	5551
3862	dnsmessage	Additional	{}	{dnsmessage.Resource,error}	*Parser	5551
3863	dnsmessage	AllAdditionals	{}	{[]dnsmessage.Resource,error}	*Parser	5551
3864	dnsmessage	SkipAdditional	{}	{error}	*Parser	5551
3865	dnsmessage	SkipAllAdditionals	{}	{error}	*Parser	5551
3866	dnsmessage	CNAMEResource	{}	{dnsmessage.CNAMEResource,error}	*Parser	5551
3867	dnsmessage	MXResource	{}	{dnsmessage.MXResource,error}	*Parser	5551
3868	dnsmessage	NSResource	{}	{dnsmessage.NSResource,error}	*Parser	5551
3869	dnsmessage	PTRResource	{}	{dnsmessage.PTRResource,error}	*Parser	5551
3870	dnsmessage	SOAResource	{}	{dnsmessage.SOAResource,error}	*Parser	5551
3871	dnsmessage	TXTResource	{}	{dnsmessage.TXTResource,error}	*Parser	5551
3872	dnsmessage	SRVResource	{}	{dnsmessage.SRVResource,error}	*Parser	5551
3873	dnsmessage	AResource	{}	{dnsmessage.AResource,error}	*Parser	5551
3874	dnsmessage	AAAAResource	{}	{dnsmessage.AAAAResource,error}	*Parser	5551
3875	dnsmessage	EnableCompression	{}	{}	*Builder	5552
3876	dnsmessage	StartQuestions	{}	{error}	*Builder	5552
3877	dnsmessage	StartAnswers	{}	{error}	*Builder	5552
3878	dnsmessage	StartAuthorities	{}	{error}	*Builder	5552
3879	dnsmessage	StartAdditionals	{}	{error}	*Builder	5552
3880	dnsmessage	Question	{dnsmessage.Question}	{error}	*Builder	5552
3881	dnsmessage	CNAMEResource	{dnsmessage.ResourceHeader,dnsmessage.CNAMEResource}	{error}	*Builder	5552
3882	dnsmessage	MXResource	{dnsmessage.ResourceHeader,dnsmessage.MXResource}	{error}	*Builder	5552
3883	dnsmessage	NSResource	{dnsmessage.ResourceHeader,dnsmessage.NSResource}	{error}	*Builder	5552
3884	dnsmessage	PTRResource	{dnsmessage.ResourceHeader,dnsmessage.PTRResource}	{error}	*Builder	5552
3885	dnsmessage	SOAResource	{dnsmessage.ResourceHeader,dnsmessage.SOAResource}	{error}	*Builder	5552
3886	dnsmessage	TXTResource	{dnsmessage.ResourceHeader,dnsmessage.TXTResource}	{error}	*Builder	5552
3887	dnsmessage	SRVResource	{dnsmessage.ResourceHeader,dnsmessage.SRVResource}	{error}	*Builder	5552
3888	dnsmessage	AResource	{dnsmessage.ResourceHeader,dnsmessage.AResource}	{error}	*Builder	5552
3889	dnsmessage	AAAAResource	{dnsmessage.ResourceHeader,dnsmessage.AAAAResource}	{error}	*Builder	5552
3890	dnsmessage	Finish	{}	{[]byte,error}	*Builder	5552
3891	dnsmessage	String	{}	{string}	Name	5554
3892	httpproxy	ProxyFunc	{}	{"func(*url.URL) (*url.URL, error)"}	*Config	5565
3893	hpack	WriteField	{hpack.HeaderField}	{error}	*Encoder	5566
3894	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Encoder	5566
3895	hpack	SetMaxDynamicTableSizeLimit	{uint32}	{}	*Encoder	5566
3896	hpack	Error	{}	{string}	DecodingError	5567
3897	hpack	Error	{}	{string}	InvalidIndexError	5568
3898	hpack	IsPseudo	{}	{bool}	HeaderField	5569
3899	hpack	String	{}	{string}	HeaderField	5569
3900	hpack	Size	{}	{uint32}	HeaderField	5569
3901	hpack	SetMaxStringLength	{int}	{}	*Decoder	5570
3902	hpack	SetEmitFunc	{func(hpack.HeaderField)}	{}	*Decoder	5570
3903	hpack	SetEmitEnabled	{bool}	{}	*Decoder	5570
3904	hpack	EmitEnabled	{}	{bool}	*Decoder	5570
3905	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Decoder	5570
3906	hpack	SetAllowedMaxDynamicTableSize	{uint32}	{}	*Decoder	5570
3907	hpack	DecodeFull	{[]byte}	{[]hpack.HeaderField,error}	*Decoder	5570
3908	hpack	Close	{}	{error}	*Decoder	5570
3909	hpack	Write	{[]byte}	{int,error}	*Decoder	5570
3910	idna	ToASCII	{string}	{string,error}	*Profile	5572
3911	idna	ToUnicode	{string}	{string,error}	*Profile	5572
3912	idna	String	{}	{string}	*Profile	5572
3913	lif	Family	{}	{int}	*Inet4Addr	5574
3914	lif	Family	{}	{int}	*Inet6Addr	5575
3915	route	Family	{}	{int}	*LinkAddr	5579
3916	route	Family	{}	{int}	*Inet4Addr	5580
3917	route	Family	{}	{int}	*Inet6Addr	5581
3918	route	Family	{}	{int}	*DefaultAddr	5582
3919	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	5583
3920	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	5583
3921	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	5583
3922	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	5583
3923	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	5583
3924	route	Sys	{}	{[]route.Sys}	*InterfaceAddrMessage	5584
3925	route	Sys	{}	{[]route.Sys}	*InterfaceMulticastAddrMessage	5585
3926	route	Sys	{}	{[]route.Sys}	*InterfaceAnnounceMessage	5586
3927	route	Marshal	{}	{[]byte,error}	*RouteMessage	5590
3928	route	Sys	{}	{[]route.Sys}	*RouteMessage	5590
3929	route	Sys	{}	{[]route.Sys}	*RouteMessage	5590
3930	route	Sys	{}	{[]route.Sys}	*RouteMessage	5590
3931	route	Sys	{}	{[]route.Sys}	*RouteMessage	5590
3932	route	Sys	{}	{[]route.Sys}	*RouteMessage	5590
3933	route	SysType	{}	{route.SysType}	*RouteMetrics	5592
3934	route	SysType	{}	{route.SysType}	*RouteMetrics	5592
3935	route	SysType	{}	{route.SysType}	*RouteMetrics	5592
3936	route	SysType	{}	{route.SysType}	*RouteMetrics	5592
3937	route	SysType	{}	{route.SysType}	*RouteMetrics	5592
3938	route	SysType	{}	{route.SysType}	*InterfaceMetrics	5593
3939	route	SysType	{}	{route.SysType}	*InterfaceMetrics	5593
3940	route	SysType	{}	{route.SysType}	*InterfaceMetrics	5593
3941	route	SysType	{}	{route.SysType}	*InterfaceMetrics	5593
3942	route	SysType	{}	{route.SysType}	*InterfaceMetrics	5593
3943	bidirule	Reset	{}	{}	*Transformer	5602
3944	bidirule	Transform	{[]byte,[]byte,bool}	{int,error}	*Transformer	5602
3945	bidirule	Span	{[]byte,bool}	{int,error}	*Transformer	5602
3946	transform	Reset	{}	{}	NopResetter	5605
3947	transform	Read	{[]byte}	{int,error}	*Reader	5606
3948	transform	Write	{[]byte}	{int,error}	*Writer	5607
3949	transform	Close	{}	{error}	*Writer	5607
3950	bidi	SetBytes	{[]byte,...bidi.Option}	{int,error}	*Paragraph	5610
3951	bidi	SetString	{string,...bidi.Option}	{int,error}	*Paragraph	5610
3952	bidi	IsLeftToRight	{}	{bool}	*Paragraph	5610
3953	bidi	Direction	{}	{bidi.Direction}	*Paragraph	5610
3954	bidi	RunAt	{int}	{bidi.Run}	*Paragraph	5610
3955	bidi	Order	{}	{bidi.Ordering,error}	*Paragraph	5610
3956	bidi	Line	{int,int}	{bidi.Ordering,error}	*Paragraph	5610
3957	bidi	Direction	{}	{bidi.Direction}	*Ordering	5611
3958	bidi	NumRuns	{}	{int}	*Ordering	5611
3959	bidi	Run	{int}	{bidi.Run}	*Ordering	5611
3960	bidi	String	{}	{string}	*Run	5612
3961	bidi	Bytes	{}	{[]byte}	*Run	5612
3962	bidi	Direction	{}	{bidi.Direction}	*Run	5612
3963	bidi	Pos	{}	{int}	*Run	5612
3964	bidi	Class	{}	{bidi.Class}	Properties	5613
3965	bidi	IsBracket	{}	{bool}	Properties	5613
3966	bidi	IsOpeningBracket	{}	{bool}	Properties	5613
3967	norm	BoundaryBefore	{}	{bool}	Properties	5615
3968	norm	BoundaryAfter	{}	{bool}	Properties	5615
3969	norm	Decomposition	{}	{[]byte}	Properties	5615
3970	norm	Size	{}	{int}	Properties	5615
3971	norm	CCC	{}	{uint8}	Properties	5615
3972	norm	LeadCCC	{}	{uint8}	Properties	5615
3973	norm	TrailCCC	{}	{uint8}	Properties	5615
3974	norm	Init	{norm.Form,[]byte}	{}	*Iter	5616
3975	norm	InitString	{norm.Form,string}	{}	*Iter	5616
3976	norm	Seek	{int64,int}	{int64,error}	*Iter	5616
3977	norm	Pos	{}	{int}	*Iter	5616
3978	norm	Done	{}	{bool}	*Iter	5616
3979	norm	Next	{}	{[]byte}	*Iter	5616
3980	norm	Properties	{[]byte}	{norm.Properties}	Form	5617
3981	norm	PropertiesString	{string}	{norm.Properties}	Form	5617
3982	norm	Bytes	{[]byte}	{[]byte}	Form	5617
3983	norm	String	{string}	{string}	Form	5617
3984	norm	IsNormal	{[]byte}	{bool}	Form	5617
3985	norm	IsNormalString	{string}	{bool}	Form	5617
3986	norm	Append	{[]byte,...byte}	{[]byte}	Form	5617
3987	norm	AppendString	{[]byte,string}	{[]byte}	Form	5617
3988	norm	QuickSpan	{[]byte}	{int}	Form	5617
3989	norm	Span	{[]byte,bool}	{int,error}	Form	5617
3990	norm	SpanString	{string,bool}	{int,error}	Form	5617
3991	norm	QuickSpanString	{string}	{int}	Form	5617
3992	norm	FirstBoundary	{[]byte}	{int}	Form	5617
3993	norm	FirstBoundaryInString	{string}	{int}	Form	5617
3994	norm	NextBoundary	{[]byte,bool}	{int}	Form	5617
3995	norm	NextBoundaryInString	{string,bool}	{int}	Form	5617
3996	norm	LastBoundary	{[]byte}	{int}	Form	5617
3997	norm	Writer	{io.Writer}	{io.WriteCloser}	Form	5617
3998	norm	Reader	{io.Reader}	{io.Reader}	Form	5617
3999	norm	Reset	{}	{}	Form	5617
4000	norm	Transform	{[]byte,[]byte,bool}	{int,error}	Form	5617
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
89	gc	LivenessMap	struct
90	gc	LivenessIndex	struct
91	gc	Sig	struct
92	gc	GCProg	struct
93	gc	InitEntry	struct
94	gc	InitPlan	struct
95	gc	Branch	struct
96	gc	SSAGenState	struct
97	gc	FloatingEQNEJump	struct
98	gc	Error	struct
99	gc	Dlist	struct
100	gc	Symlink	struct
101	gc	Node	struct
102	gc	Name	struct
103	gc	Param	struct
104	gc	Func	struct
105	gc	Inline	struct
106	gc	Mark	struct
107	gc	ScopeID	int32
108	gc	Op	uint8
109	gc	Nodes	struct
110	main	V	struct
111	main	S	struct
112	main	T	struct
113	main	I	
114	main	T1	struct
115	main	T2	struct
116	main	T3	struct
117	main	T4	struct
118	main	T5	struct
119	main	T6	struct
120	main	T7	struct
121	main	T8	struct
122	main	T9	struct
123	main	T10	struct
124	main	T15	struct
125	main	T16	struct
126	main	T17	struct
127	main	T23	struct
128	main	T24	struct
129	main	T25	struct
130	main	T31	struct
131	main	T32	struct
132	main	T33	struct
133	main	T63	struct
134	main	T64	struct
135	main	T65	struct
136	main	T1023	struct
137	main	T1024	struct
138	main	T1025	struct
139	main	T1031	struct
140	main	T1032	struct
141	main	T1033	struct
142	main	T1039	struct
143	main	T1040	struct
144	main	T1041	struct
145	main	B	[]int
146	main	T1	[]*main.B
147	main	T2	[]*main.B
148	main	T3	struct
149	main	T4	struct
150	main	T	struct
151	main	T1	struct
152	main	T2	struct
153	main	T3	struct
154	main	T4	struct
155	main	T5	struct
156	main	T6	struct
157	main	T7	struct
158	main	T8	struct
159	main	T9	struct
160	main	T10	struct
161	main	T15	struct
162	main	T16	struct
163	main	T17	struct
164	main	T23	struct
165	main	T24	struct
166	main	T25	struct
167	main	T31	struct
168	main	T32	struct
169	main	T33	struct
170	main	T63	struct
171	main	T64	struct
172	main	T65	struct
173	main	T1023	struct
174	main	T1024	struct
175	main	T1025	struct
176	main	T8u1	struct
177	main	T8u2	struct
178	main	T16u1	struct
179	main	T16u2	struct
180	main	T24u1	struct
181	main	T24u2	struct
182	main	T32u1	struct
183	main	T32u2	struct
184	main	T64u1	struct
185	main	T64u2	struct
186	main	T256u1	struct
187	main	T256u2	struct
188	gc	Timings	struct
189	ssa	Block	struct
190	ssa	Edge	struct
191	ssa	BlockKind	int8
192	ssa	BranchPrediction	int8
193	ssa	Cache	struct
194	ssa	Config	struct
195	ssa	Types	struct
196	ssa	Logger	
197	ssa	Frontend	
198	ssa	GCNode	
199	ssa	StorageClass	uint8
200	ssa	SlotID	int32
201	ssa	VarID	int32
202	ssa	FuncDebug	struct
203	ssa	BlockDebug	struct
204	ssa	StackOffset	int32
205	ssa	VarLoc	struct
206	ssa	RegisterSet	uint64
207	ssa	Func	struct
208	main	ArchsByName	[]main.arch
209	main	Rule	struct
210	ssa	HTMLWriter	struct
211	ssa	ID	int32
212	ssa	Location	
213	ssa	Register	struct
214	ssa	LocalSlot	struct
215	ssa	LocPair	[]ssa.Location
216	ssa	Op	int32
217	ssa	SymEffect	int8
218	ssa	ValAndOff	int64
219	ssa	RBTint32	struct
220	ssa	ValHeap	struct
221	ssa	SparseTreeNode	struct
222	ssa	SparseTree	[]ssa.SparseTreeNode
223	ssa	SparseTreeMap	ssa.RBTint32
224	ssa	SparseTreeHelper	struct
225	ssa	Value	struct
226	syntax	Node	
227	syntax	File	struct
228	syntax	Decl	
229	syntax	ImportDecl	struct
230	syntax	ConstDecl	struct
231	syntax	TypeDecl	struct
232	syntax	VarDecl	struct
233	syntax	FuncDecl	struct
234	syntax	Group	struct
235	syntax	Expr	
236	syntax	BadExpr	struct
237	syntax	Name	struct
238	syntax	BasicLit	struct
239	syntax	CompositeLit	struct
240	syntax	KeyValueExpr	struct
241	syntax	FuncLit	struct
242	syntax	ParenExpr	struct
243	syntax	SelectorExpr	struct
244	syntax	IndexExpr	struct
245	syntax	SliceExpr	struct
246	syntax	AssertExpr	struct
247	syntax	TypeSwitchGuard	struct
248	syntax	Operation	struct
249	syntax	CallExpr	struct
250	syntax	ListExpr	struct
251	syntax	ArrayType	struct
252	syntax	SliceType	struct
253	syntax	DotsType	struct
254	syntax	StructType	struct
255	syntax	Field	struct
256	syntax	InterfaceType	struct
257	syntax	FuncType	struct
258	syntax	MapType	struct
259	syntax	ChanType	struct
260	syntax	ChanDir	uint
261	syntax	Stmt	
262	syntax	SimpleStmt	
263	syntax	EmptyStmt	struct
264	syntax	LabeledStmt	struct
265	syntax	BlockStmt	struct
266	syntax	ExprStmt	struct
267	syntax	SendStmt	struct
268	syntax	DeclStmt	struct
269	syntax	AssignStmt	struct
270	syntax	BranchStmt	struct
271	syntax	CallStmt	struct
272	syntax	ReturnStmt	struct
273	syntax	IfStmt	struct
274	syntax	ForStmt	struct
275	syntax	SwitchStmt	struct
276	syntax	SelectStmt	struct
277	syntax	RangeClause	struct
278	syntax	CaseClause	struct
279	syntax	CommClause	struct
280	syntax	CommentKind	uint
281	syntax	Comment	struct
282	syntax	Pos	struct
283	syntax	PosBase	struct
284	syntax	Mode	uint
285	syntax	Error	struct
286	syntax	ErrorHandler	func(error)
287	syntax	Pragma	uint16
288	syntax	PragmaHandler	func(syntax.Pos, string) syntax.Pragma
289	syntax	LitKind	uint
290	syntax	Operator	uint
291	types	Pkg	struct
292	types	Sym	struct
293	types	Node	struct
294	types	EType	uint8
295	types	ChanDir	uint8
296	types	Type	struct
297	types	Map	struct
298	types	Forward	struct
299	types	Func	struct
300	types	Struct	struct
301	types	Funarg	uint8
302	types	Interface	struct
303	types	Ptr	struct
304	types	DDDField	struct
305	types	ChanArgs	struct
306	types	FuncArgs	struct
307	types	Chan	struct
308	types	Tuple	struct
309	types	Array	struct
310	types	Slice	struct
311	types	Field	struct
312	types	Fields	struct
313	types	Cmp	int8
314	main	Block	struct
315	main	File	struct
316	main	FuncExtent	struct
317	main	FuncVisitor	struct
318	main	Pkg	struct
319	main	Profile	struct
320	main	ProfileBlock	struct
321	main	Boundary	struct
322	main	Dir	struct
323	main	Dirs	struct
324	main	Package	struct
325	main	PackageError	string
326	nested	Foo	struct
327	pkg	ExportedType	struct
328	pkg	ExportedStructOneField	struct
329	pkg	ExportedInterface	
330	pkg	T2	int
331	pkg	T1	pkg.T2
332	main	TypeConfig	struct
333	main	Type	struct
334	base	Command	struct
335	base	StringsFlag	[]string
336	cache	ActionID	[]byte
337	cache	OutputID	[]byte
338	cache	Cache	struct
339	cache	Entry	struct
340	cache	Hash	struct
341	cfg	EnvVar	struct
342	cmdflag	Defn	struct
343	dirhash	Hash	func([]string, func(string) (io.ReadCloser, error)) (string, error)
344	generate	Generator	struct
345	get	RepoRoot	struct
346	get	ModuleMode	int
347	get	ImportMismatchError	struct
348	list	Context	struct
349	list	TrackingWriter	struct
350	load	PerPackageFlag	struct
351	load	Package	struct
352	load	PackagePublic	struct
353	load	PackageInternal	struct
354	load	NoGoError	struct
355	load	CoverVar	struct
356	load	PackageError	struct
357	load	ImportStack	[]string
358	load	TargetDir	int
359	load	TestCover	struct
360	codehost	Repo	
361	codehost	RevInfo	struct
362	codehost	FileRev	struct
363	codehost	RunError	struct
364	codehost	VCSError	struct
365	modfetch	Repo	
366	modfetch	RevInfo	struct
367	modfile	Position	struct
368	modfile	Expr	
369	modfile	Comment	struct
370	modfile	Comments	struct
371	modfile	FileSyntax	struct
372	modfile	CommentBlock	struct
373	modfile	Line	struct
374	modfile	LineBlock	struct
375	modfile	LParen	struct
376	modfile	RParen	struct
377	modfile	File	struct
378	modfile	Module	struct
379	modfile	Go	struct
380	modfile	Require	struct
381	modfile	Exclude	struct
382	modfile	Replace	struct
383	modfile	VersionFixer	func(string) (string, error)
384	modinfo	ModulePublic	struct
385	modinfo	ModuleError	struct
386	modload	ImportMissingError	struct
387	module	Version	struct
388	mvs	Reqs	
389	mvs	MissingModuleError	struct
390	par	Work	struct
391	par	Cache	struct
392	search	Match	struct
393	txtar	Archive	struct
394	txtar	File	struct
395	web	HTTPError	struct
396	web	HTTPError	struct
397	web	SecurityMode	int
398	web2	Option	
399	work	Builder	struct
400	work	Action	struct
401	work	BuildMode	int
402	p	A1	
403	p	B1	
404	p	C1	
405	p	D1	
406	bio	Reader	struct
407	bio	Writer	struct
408	dwarf	Sym	
409	dwarf	Var	struct
410	dwarf	Scope	struct
411	dwarf	Range	struct
412	dwarf	FnState	struct
413	dwarf	InlCalls	struct
414	dwarf	InlCall	struct
415	dwarf	Context	
416	dwarf	DWAttr	struct
417	dwarf	DWDie	struct
418	dwarf	VarsByOffset	[]*dwarf.Var
419	edit	Buffer	struct
420	gcprog	Writer	struct
421	goobj	Sym	struct
422	goobj	SymID	struct
423	goobj	Data	struct
424	goobj	Reloc	struct
425	goobj	Var	struct
426	goobj	Func	struct
427	goobj	FuncData	struct
428	goobj	InlinedCall	struct
429	goobj	Package	struct
430	goobj	NativeReader	struct
431	arm	Optab	struct
432	arm	Opcross	[][][]uint8
433	arm64	Optab	struct
434	obj	InlTree	struct
435	obj	InlinedCall	struct
436	obj	Addr	struct
437	obj	AddrName	int8
438	obj	AddrType	uint8
439	obj	Prog	struct
440	obj	As	int16
441	obj	LSym	struct
442	obj	FuncInfo	struct
443	obj	Attribute	int16
444	obj	Pcln	struct
445	obj	Reloc	struct
446	obj	Auto	struct
447	obj	Pcdata	struct
448	obj	Link	struct
449	obj	LinkArch	struct
450	mips	Optab	struct
451	mips	Dep	struct
452	mips	Sch	struct
453	obj	DwarfFixupTable	struct
454	obj	Plist	struct
455	obj	ProgAlloc	func() *obj.Prog
456	ppc64	Optab	struct
457	s390x	Optab	struct
458	x86	Optab	struct
459	x86	Movtab	struct
460	x86	AsmBuf	struct
461	objabi	FuncID	uint32
462	objabi	HeadType	uint8
463	objabi	RelocType	int32
464	objabi	SymKind	uint8
465	objfile	Disasm	struct
466	objfile	CachedFile	struct
467	objfile	FileCache	struct
468	objfile	Liner	
469	objfile	File	struct
470	objfile	Entry	struct
471	objfile	Sym	struct
472	objfile	Reloc	struct
473	objfile	RelocStringer	
474	src	Pos	struct
475	src	PosBase	struct
476	src	PosXlogue	uint
477	src	XPos	struct
478	src	PosTable	struct
479	sys	ArchFamily	byte
480	sys	Arch	struct
481	test2json	Mode	int
482	ld	ArHdr	struct
483	ld	BuildMode	uint8
484	ld	LinkMode	uint8
485	ld	GCProg	struct
486	ld	ElfEhdr	struct
487	ld	ElfShdr	struct
488	ld	ElfPhdr	struct
489	ld	Elfstring	struct
490	ld	Elfaux	struct
491	ld	Elflib	struct
492	ld	Pkg	struct
493	ld	Arch	struct
494	ld	Hostobj	struct
495	ld	SymbolType	int8
496	ld	Shlib	struct
497	ld	Link	struct
498	ld	Pciter	struct
499	ld	MachoHdr	struct
500	ld	MachoSect	struct
501	ld	MachoSeg	struct
502	ld	MachoLoad	struct
503	ld	Rpath	struct
504	ld	OutBuf	struct
505	ld	IMAGE_IMPORT_DESCRIPTOR	struct
506	ld	IMAGE_EXPORT_DIRECTORY	struct
507	ld	Imp	struct
508	ld	Dll	struct
509	a	FuncReturningInt	func() int
510	loadelf	ElfHdrBytes	struct
511	loadelf	ElfSectBytes	struct
512	loadelf	ElfProgBytes	struct
513	loadelf	ElfSymBytes	struct
514	loadelf	ElfHdrBytes64	struct
515	loadelf	ElfSectBytes64	struct
516	loadelf	ElfProgBytes64	struct
517	loadelf	ElfSymBytes64	struct
518	loadelf	ElfSect	struct
519	loadelf	ElfObj	struct
520	loadelf	ElfSym	struct
521	sym	Attribute	int32
522	sym	Library	struct
523	sym	Reloc	struct
524	sym	RelocVariant	uint8
525	sym	RelocByOff	[]sym.Reloc
526	sym	Segment	struct
527	sym	Section	struct
528	sym	Symbol	struct
529	sym	FuncInfo	struct
530	sym	InlinedCall	struct
531	sym	Pcdata	struct
532	sym	Auto	struct
533	sym	Symbols	struct
534	sym	SymKind	uint8
535	main	Archive	struct
536	main	Entry	struct
537	main	FileLike	
538	main	Record	struct
539	main	Range	struct
540	main	ViewerData	struct
541	main	ViewerEvent	struct
542	main	ViewerFrame	struct
543	main	NameArg	struct
544	main	TaskArg	struct
545	main	RegionArg	struct
546	main	SortIndexArg	struct
547	main	Arg	struct
548	main	Arg	struct
549	driver	HTTPServerArgs	plugin.HTTPServerArgs
550	driver	Options	struct
551	driver	Writer	
552	driver	FlagSet	
553	driver	Fetcher	
554	driver	Symbolizer	
555	driver	MappingSources	map[string][]
556	driver	ObjTool	
557	driver	Inst	struct
558	driver	ObjFile	
559	driver	Frame	struct
560	driver	Sym	struct
561	driver	UI	
562	binutils	Binutils	struct
563	driver	PostProcessor	func(io.Reader, io.Writer, plugin.UI) error
564	graph	DotAttributes	struct
565	graph	DotNodeAttributes	struct
566	graph	DotConfig	struct
567	graph	Graph	struct
568	graph	Options	struct
569	graph	Nodes	[]*graph.Node
570	graph	Node	struct
571	graph	NodeInfo	struct
572	graph	NodeMap	map[graph.NodeInfo]*graph.Node
573	graph	NodeSet	map[graph.NodeInfo]bool
574	graph	NodePtrSet	map[*graph.Node]bool
575	graph	EdgeMap	map[*graph.Node]*graph.Edge
576	graph	Edge	struct
577	graph	Tag	struct
578	graph	TagMap	map[string]*graph.Tag
579	graph	NodeOrder	int
580	plugin	Options	struct
581	plugin	Writer	
582	plugin	FlagSet	
583	plugin	Fetcher	
584	plugin	Symbolizer	
585	plugin	MappingSources	map[string][]
586	plugin	ObjTool	
587	plugin	Inst	struct
588	plugin	ObjFile	
589	plugin	Frame	struct
590	plugin	Sym	struct
591	plugin	UI	
592	plugin	HTTPServerArgs	struct
593	proftest	TestUI	struct
594	report	Options	struct
595	report	TextItem	struct
596	report	Report	struct
597	symbolizer	Symbolizer	struct
598	profile	TagMatch	func(*profile.Sample) bool
599	profile	Profile	struct
600	profile	ValueType	struct
601	profile	Sample	struct
602	profile	Mapping	struct
603	profile	Location	struct
604	profile	Line	struct
605	profile	Function	struct
606	demangle	AST	
607	demangle	Name	struct
608	demangle	Typed	struct
609	demangle	Qualified	struct
610	demangle	Template	struct
611	demangle	TemplateParam	struct
612	demangle	Qualifiers	[]string
613	demangle	TypeWithQualifiers	struct
614	demangle	MethodWithQualifiers	struct
615	demangle	BuiltinType	struct
616	demangle	PointerType	struct
617	demangle	ReferenceType	struct
618	demangle	RvalueReferenceType	struct
619	demangle	ComplexType	struct
620	demangle	ImaginaryType	struct
621	demangle	VendorQualifier	struct
622	demangle	ArrayType	struct
623	demangle	FunctionType	struct
624	demangle	FunctionParam	struct
625	demangle	PtrMem	struct
626	demangle	FixedType	struct
627	demangle	VectorType	struct
628	demangle	Decltype	struct
629	demangle	Operator	struct
630	demangle	Constructor	struct
631	demangle	Destructor	struct
632	demangle	GlobalCDtor	struct
633	demangle	TaggedName	struct
634	demangle	PackExpansion	struct
635	demangle	ArgumentPack	struct
636	demangle	SizeofPack	struct
637	demangle	SizeofArgs	struct
638	demangle	Cast	struct
639	demangle	Nullary	struct
640	demangle	Unary	struct
641	demangle	Binary	struct
642	demangle	Trinary	struct
643	demangle	Fold	struct
644	demangle	New	struct
645	demangle	Literal	struct
646	demangle	ExprList	struct
647	demangle	InitializerList	struct
648	demangle	DefaultArg	struct
649	demangle	Closure	struct
650	demangle	UnnamedType	struct
651	demangle	Clone	struct
652	demangle	Special	struct
653	demangle	Special2	struct
654	demangle	Option	int
655	armasm	Mode	int
656	armasm	Op	uint16
657	armasm	Inst	struct
658	armasm	Args	[]armasm.Arg
659	armasm	Arg	
660	armasm	Float32Imm	float32
661	armasm	Float64Imm	float32
662	armasm	Imm	uint32
663	armasm	ImmAlt	struct
664	armasm	Label	uint32
665	armasm	Reg	uint8
666	armasm	RegX	struct
667	armasm	RegList	uint16
668	armasm	Endian	uint8
669	armasm	Shift	uint8
670	armasm	RegShift	struct
671	armasm	RegShiftReg	struct
672	armasm	PCRel	int32
673	armasm	AddrMode	uint8
674	armasm	Mem	struct
675	arm64asm	Sys	uint8
676	arm64asm	Op	uint16
677	arm64asm	Inst	struct
678	arm64asm	Args	[]arm64asm.Arg
679	arm64asm	Arg	
680	arm64asm	Reg	uint16
681	arm64asm	RegSP	arm64asm.Reg
682	arm64asm	ImmShift	struct
683	arm64asm	ExtShift	uint8
684	arm64asm	RegExtshiftAmount	struct
685	arm64asm	PCRel	int64
686	arm64asm	AddrMode	uint8
687	arm64asm	MemImmediate	struct
688	arm64asm	MemExtend	struct
689	arm64asm	Imm	struct
690	arm64asm	Imm64	struct
691	arm64asm	Imm_hint	uint8
692	arm64asm	Imm_clrex	uint8
693	arm64asm	Imm_dcps	uint16
694	arm64asm	Cond	struct
695	arm64asm	Imm_c	uint8
696	arm64asm	Imm_option	uint8
697	arm64asm	Imm_prfop	uint8
698	arm64asm	Pstatefield	uint8
699	arm64asm	Systemreg	struct
700	arm64asm	Imm_fp	struct
701	arm64asm	Arrangement	uint8
702	arm64asm	RegisterWithArrangement	struct
703	arm64asm	RegisterWithArrangementAndIndex	struct
704	ppc64asm	ArgType	int8
705	ppc64asm	BitField	struct
706	ppc64asm	BitFields	[]ppc64asm.BitField
707	ppc64asm	Inst	struct
708	ppc64asm	Op	uint16
709	ppc64asm	Arg	
710	ppc64asm	Args	[]ppc64asm.Arg
711	ppc64asm	Reg	uint16
712	ppc64asm	CondReg	int8
713	ppc64asm	SpReg	uint16
714	ppc64asm	PCRel	int32
715	ppc64asm	Label	uint32
716	ppc64asm	Imm	int32
717	ppc64asm	Offset	int32
718	x86asm	Inst	struct
719	x86asm	Prefixes	[]x86asm.Prefix
720	x86asm	Prefix	uint16
721	x86asm	Op	uint32
722	x86asm	Args	[]x86asm.Arg
723	x86asm	Arg	
724	x86asm	Reg	uint8
725	x86asm	Mem	struct
726	x86asm	Rel	int32
727	x86asm	Imm	int64
728	x86asm	SymLookup	func(uint64) (string, uint64)
729	terminal	EscapeCodes	struct
730	terminal	Terminal	struct
731	terminal	State	struct
732	terminal	State	struct
733	terminal	State	struct
734	terminal	State	struct
735	unix	CPUSet	[]unix.cpuMask
736	unix	SocketControlMessage	struct
737	unix	WaitStatus	uint32
738	unix	SockaddrDatalink	struct
739	unix	SockaddrDatalink	struct
740	unix	SockaddrDatalink	struct
741	unix	WaitStatus	uint32
742	unix	SockaddrLinklayer	struct
743	unix	SockaddrNetlink	struct
744	unix	SockaddrHCI	struct
745	unix	SockaddrL2	struct
746	unix	SockaddrCAN	struct
747	unix	SockaddrALG	struct
748	unix	SockaddrVM	struct
749	unix	SockaddrDatalink	struct
750	unix	SockaddrDatalink	struct
751	unix	SockaddrDatalink	struct
752	unix	WaitStatus	uint32
753	unix	Sockaddr	
754	unix	SockaddrInet4	struct
755	unix	SockaddrInet6	struct
756	unix	SockaddrUnix	struct
757	unix	PtraceRegs386	struct
758	unix	PtraceRegsAmd64	struct
759	unix	PtraceRegsArm	struct
760	unix	PtraceRegsArm64	struct
761	unix	PtraceRegsMips	struct
762	unix	PtraceRegsMips64	struct
763	unix	PtraceRegsMipsle	struct
764	unix	PtraceRegsMips64le	struct
765	unix	Timespec	struct
766	unix	Timeval	struct
767	unix	Timeval32	struct
768	unix	Rusage	struct
769	unix	Rlimit	struct
770	unix	Stat_t	struct
771	unix	Statfs_t	struct
772	unix	Flock_t	struct
773	unix	Fstore_t	struct
774	unix	Radvisory_t	struct
775	unix	Fbootstraptransfer_t	struct
776	unix	Log2phys_t	struct
777	unix	Fsid	struct
778	unix	Dirent	struct
779	unix	RawSockaddrInet4	struct
780	unix	RawSockaddrInet6	struct
781	unix	RawSockaddrUnix	struct
782	unix	RawSockaddrDatalink	struct
783	unix	RawSockaddr	struct
784	unix	RawSockaddrAny	struct
785	unix	Linger	struct
786	unix	Iovec	struct
787	unix	IPMreq	struct
788	unix	IPv6Mreq	struct
789	unix	Msghdr	struct
790	unix	Cmsghdr	struct
791	unix	Inet4Pktinfo	struct
792	unix	Inet6Pktinfo	struct
793	unix	IPv6MTUInfo	struct
794	unix	ICMPv6Filter	struct
795	unix	Kevent_t	struct
796	unix	FdSet	struct
797	unix	IfMsghdr	struct
798	unix	IfData	struct
799	unix	IfaMsghdr	struct
800	unix	IfmaMsghdr	struct
801	unix	IfmaMsghdr2	struct
802	unix	RtMsghdr	struct
803	unix	RtMetrics	struct
804	unix	BpfVersion	struct
805	unix	BpfStat	struct
806	unix	BpfProgram	struct
807	unix	BpfInsn	struct
808	unix	BpfHdr	struct
809	unix	Termios	struct
810	unix	Winsize	struct
811	unix	PollFd	struct
812	unix	Utsname	struct
813	unix	Timespec	struct
814	unix	Timeval	struct
815	unix	Timeval32	struct
816	unix	Rusage	struct
817	unix	Rlimit	struct
818	unix	Stat_t	struct
819	unix	Statfs_t	struct
820	unix	Flock_t	struct
821	unix	Fstore_t	struct
822	unix	Radvisory_t	struct
823	unix	Fbootstraptransfer_t	struct
824	unix	Log2phys_t	struct
825	unix	Fsid	struct
826	unix	Dirent	struct
827	unix	RawSockaddrInet4	struct
828	unix	RawSockaddrInet6	struct
829	unix	RawSockaddrUnix	struct
830	unix	RawSockaddrDatalink	struct
831	unix	RawSockaddr	struct
832	unix	RawSockaddrAny	struct
833	unix	Linger	struct
834	unix	Iovec	struct
835	unix	IPMreq	struct
836	unix	IPv6Mreq	struct
837	unix	Msghdr	struct
838	unix	Cmsghdr	struct
839	unix	Inet4Pktinfo	struct
840	unix	Inet6Pktinfo	struct
841	unix	IPv6MTUInfo	struct
842	unix	ICMPv6Filter	struct
843	unix	Kevent_t	struct
844	unix	FdSet	struct
845	unix	IfMsghdr	struct
846	unix	IfData	struct
847	unix	IfaMsghdr	struct
848	unix	IfmaMsghdr	struct
849	unix	IfmaMsghdr2	struct
850	unix	RtMsghdr	struct
851	unix	RtMetrics	struct
852	unix	BpfVersion	struct
853	unix	BpfStat	struct
854	unix	BpfProgram	struct
855	unix	BpfInsn	struct
856	unix	BpfHdr	struct
857	unix	Termios	struct
858	unix	Winsize	struct
859	unix	PollFd	struct
860	unix	Utsname	struct
861	unix	Timespec	struct
862	unix	Timeval	struct
863	unix	Timeval32	[]byte
864	unix	Rusage	struct
865	unix	Rlimit	struct
866	unix	Stat_t	struct
867	unix	Statfs_t	struct
868	unix	Flock_t	struct
869	unix	Fstore_t	struct
870	unix	Radvisory_t	struct
871	unix	Fbootstraptransfer_t	struct
872	unix	Log2phys_t	struct
873	unix	Fsid	struct
874	unix	Dirent	struct
875	unix	RawSockaddrInet4	struct
876	unix	RawSockaddrInet6	struct
877	unix	RawSockaddrUnix	struct
878	unix	RawSockaddrDatalink	struct
879	unix	RawSockaddr	struct
880	unix	RawSockaddrAny	struct
881	unix	Linger	struct
882	unix	Iovec	struct
883	unix	IPMreq	struct
884	unix	IPv6Mreq	struct
885	unix	Msghdr	struct
886	unix	Cmsghdr	struct
887	unix	Inet4Pktinfo	struct
888	unix	Inet6Pktinfo	struct
889	unix	IPv6MTUInfo	struct
890	unix	ICMPv6Filter	struct
891	unix	Kevent_t	struct
892	unix	FdSet	struct
893	unix	IfMsghdr	struct
894	unix	IfData	struct
895	unix	IfaMsghdr	struct
896	unix	IfmaMsghdr	struct
897	unix	IfmaMsghdr2	struct
898	unix	RtMsghdr	struct
899	unix	RtMetrics	struct
900	unix	BpfVersion	struct
901	unix	BpfStat	struct
902	unix	BpfProgram	struct
903	unix	BpfInsn	struct
904	unix	BpfHdr	struct
905	unix	Termios	struct
906	unix	Winsize	struct
907	unix	PollFd	struct
908	unix	Utsname	struct
909	unix	Timespec	struct
910	unix	Timeval	struct
911	unix	Timeval32	struct
912	unix	Rusage	struct
913	unix	Rlimit	struct
914	unix	Stat_t	struct
915	unix	Statfs_t	struct
916	unix	Flock_t	struct
917	unix	Fstore_t	struct
918	unix	Radvisory_t	struct
919	unix	Fbootstraptransfer_t	struct
920	unix	Log2phys_t	struct
921	unix	Fsid	struct
922	unix	Dirent	struct
923	unix	RawSockaddrInet4	struct
924	unix	RawSockaddrInet6	struct
925	unix	RawSockaddrUnix	struct
926	unix	RawSockaddrDatalink	struct
927	unix	RawSockaddr	struct
928	unix	RawSockaddrAny	struct
929	unix	Linger	struct
930	unix	Iovec	struct
931	unix	IPMreq	struct
932	unix	IPv6Mreq	struct
933	unix	Msghdr	struct
934	unix	Cmsghdr	struct
935	unix	Inet4Pktinfo	struct
936	unix	Inet6Pktinfo	struct
937	unix	IPv6MTUInfo	struct
938	unix	ICMPv6Filter	struct
939	unix	Kevent_t	struct
940	unix	FdSet	struct
941	unix	IfMsghdr	struct
942	unix	IfData	struct
943	unix	IfaMsghdr	struct
944	unix	IfmaMsghdr	struct
945	unix	IfmaMsghdr2	struct
946	unix	RtMsghdr	struct
947	unix	RtMetrics	struct
948	unix	BpfVersion	struct
949	unix	BpfStat	struct
950	unix	BpfProgram	struct
951	unix	BpfInsn	struct
952	unix	BpfHdr	struct
953	unix	Termios	struct
954	unix	Winsize	struct
955	unix	PollFd	struct
956	unix	Utsname	struct
957	unix	Timespec	struct
958	unix	Timeval	struct
959	unix	Rusage	struct
960	unix	Rlimit	struct
961	unix	Stat_t	struct
962	unix	Statfs_t	struct
963	unix	Flock_t	struct
964	unix	Dirent	struct
965	unix	Fsid	struct
966	unix	RawSockaddrInet4	struct
967	unix	RawSockaddrInet6	struct
968	unix	RawSockaddrUnix	struct
969	unix	RawSockaddrDatalink	struct
970	unix	RawSockaddr	struct
971	unix	RawSockaddrAny	struct
972	unix	Linger	struct
973	unix	Iovec	struct
974	unix	IPMreq	struct
975	unix	IPv6Mreq	struct
976	unix	Msghdr	struct
977	unix	Cmsghdr	struct
978	unix	Inet6Pktinfo	struct
979	unix	IPv6MTUInfo	struct
980	unix	ICMPv6Filter	struct
981	unix	Kevent_t	struct
982	unix	FdSet	struct
983	unix	IfMsghdr	struct
984	unix	IfData	struct
985	unix	IfaMsghdr	struct
986	unix	IfmaMsghdr	struct
987	unix	IfAnnounceMsghdr	struct
988	unix	RtMsghdr	struct
989	unix	RtMetrics	struct
990	unix	BpfVersion	struct
991	unix	BpfStat	struct
992	unix	BpfProgram	struct
993	unix	BpfInsn	struct
994	unix	BpfHdr	struct
995	unix	Termios	struct
996	unix	Winsize	struct
997	unix	PollFd	struct
998	unix	Utsname	struct
999	unix	Timespec	struct
1000	unix	Timeval	struct
1001	unix	Rusage	struct
1002	unix	Rlimit	struct
1003	unix	Stat_t	struct
1004	unix	Statfs_t	struct
1005	unix	Flock_t	struct
1006	unix	Dirent	struct
1007	unix	Fsid	struct
1008	unix	RawSockaddrInet4	struct
1009	unix	RawSockaddrInet6	struct
1010	unix	RawSockaddrUnix	struct
1011	unix	RawSockaddrDatalink	struct
1012	unix	RawSockaddr	struct
1013	unix	RawSockaddrAny	struct
1014	unix	Linger	struct
1015	unix	Iovec	struct
1016	unix	IPMreq	struct
1017	unix	IPMreqn	struct
1018	unix	IPv6Mreq	struct
1019	unix	Msghdr	struct
1020	unix	Cmsghdr	struct
1021	unix	Inet6Pktinfo	struct
1022	unix	IPv6MTUInfo	struct
1023	unix	ICMPv6Filter	struct
1024	unix	Kevent_t	struct
1025	unix	FdSet	struct
1026	unix	IfMsghdr	struct
1027	unix	IfData	struct
1028	unix	IfaMsghdr	struct
1029	unix	IfmaMsghdr	struct
1030	unix	IfAnnounceMsghdr	struct
1031	unix	RtMsghdr	struct
1032	unix	RtMetrics	struct
1033	unix	BpfVersion	struct
1034	unix	BpfStat	struct
1035	unix	BpfZbuf	struct
1036	unix	BpfProgram	struct
1037	unix	BpfInsn	struct
1038	unix	BpfHdr	struct
1039	unix	BpfZbufHeader	struct
1040	unix	Termios	struct
1041	unix	Winsize	struct
1042	unix	PollFd	struct
1043	unix	CapRights	struct
1044	unix	Utsname	struct
1045	unix	Timespec	struct
1046	unix	Timeval	struct
1047	unix	Rusage	struct
1048	unix	Rlimit	struct
1049	unix	Stat_t	struct
1050	unix	Statfs_t	struct
1051	unix	Flock_t	struct
1052	unix	Dirent	struct
1053	unix	Fsid	struct
1054	unix	RawSockaddrInet4	struct
1055	unix	RawSockaddrInet6	struct
1056	unix	RawSockaddrUnix	struct
1057	unix	RawSockaddrDatalink	struct
1058	unix	RawSockaddr	struct
1059	unix	RawSockaddrAny	struct
1060	unix	Linger	struct
1061	unix	Iovec	struct
1062	unix	IPMreq	struct
1063	unix	IPMreqn	struct
1064	unix	IPv6Mreq	struct
1065	unix	Msghdr	struct
1066	unix	Cmsghdr	struct
1067	unix	Inet6Pktinfo	struct
1068	unix	IPv6MTUInfo	struct
1069	unix	ICMPv6Filter	struct
1070	unix	Kevent_t	struct
1071	unix	FdSet	struct
1072	unix	IfMsghdr	struct
1073	unix	IfData	struct
1074	unix	IfaMsghdr	struct
1075	unix	IfmaMsghdr	struct
1076	unix	IfAnnounceMsghdr	struct
1077	unix	RtMsghdr	struct
1078	unix	RtMetrics	struct
1079	unix	BpfVersion	struct
1080	unix	BpfStat	struct
1081	unix	BpfZbuf	struct
1082	unix	BpfProgram	struct
1083	unix	BpfInsn	struct
1084	unix	BpfHdr	struct
1085	unix	BpfZbufHeader	struct
1086	unix	Termios	struct
1087	unix	Winsize	struct
1088	unix	PollFd	struct
1089	unix	CapRights	struct
1090	unix	Utsname	struct
1091	unix	Timespec	struct
1092	unix	Timeval	struct
1093	unix	Rusage	struct
1094	unix	Rlimit	struct
1095	unix	Stat_t	struct
1096	unix	Statfs_t	struct
1097	unix	Flock_t	struct
1098	unix	Dirent	struct
1099	unix	Fsid	struct
1100	unix	RawSockaddrInet4	struct
1101	unix	RawSockaddrInet6	struct
1102	unix	RawSockaddrUnix	struct
1103	unix	RawSockaddrDatalink	struct
1104	unix	RawSockaddr	struct
1105	unix	RawSockaddrAny	struct
1106	unix	Linger	struct
1107	unix	Iovec	struct
1108	unix	IPMreq	struct
1109	unix	IPMreqn	struct
1110	unix	IPv6Mreq	struct
1111	unix	Msghdr	struct
1112	unix	Cmsghdr	struct
1113	unix	Inet6Pktinfo	struct
1114	unix	IPv6MTUInfo	struct
1115	unix	ICMPv6Filter	struct
1116	unix	Kevent_t	struct
1117	unix	FdSet	struct
1118	unix	IfMsghdr	struct
1119	unix	IfData	struct
1120	unix	IfaMsghdr	struct
1121	unix	IfmaMsghdr	struct
1122	unix	IfAnnounceMsghdr	struct
1123	unix	RtMsghdr	struct
1124	unix	RtMetrics	struct
1125	unix	BpfVersion	struct
1126	unix	BpfStat	struct
1127	unix	BpfZbuf	struct
1128	unix	BpfProgram	struct
1129	unix	BpfInsn	struct
1130	unix	BpfHdr	struct
1131	unix	BpfZbufHeader	struct
1132	unix	Termios	struct
1133	unix	Winsize	struct
1134	unix	PollFd	struct
1135	unix	CapRights	struct
1136	unix	Utsname	struct
1137	unix	Timespec	struct
1138	unix	Timeval	struct
1139	unix	Timex	struct
1140	unix	Time_t	int32
1141	unix	Tms	struct
1142	unix	Utimbuf	struct
1143	unix	Rusage	struct
1144	unix	Rlimit	struct
1145	unix	Stat_t	struct
1146	unix	StatxTimestamp	struct
1147	unix	Statx_t	struct
1148	unix	Dirent	struct
1149	unix	Fsid	struct
1150	unix	Flock_t	struct
1151	unix	FscryptPolicy	struct
1152	unix	FscryptKey	struct
1153	unix	KeyctlDHParams	struct
1154	unix	RawSockaddrInet4	struct
1155	unix	RawSockaddrInet6	struct
1156	unix	RawSockaddrUnix	struct
1157	unix	RawSockaddrLinklayer	struct
1158	unix	RawSockaddrNetlink	struct
1159	unix	RawSockaddrHCI	struct
1160	unix	RawSockaddrL2	struct
1161	unix	RawSockaddrCAN	struct
1162	unix	RawSockaddrALG	struct
1163	unix	RawSockaddrVM	struct
1164	unix	RawSockaddr	struct
1165	unix	RawSockaddrAny	struct
1166	unix	Linger	struct
1167	unix	Iovec	struct
1168	unix	IPMreq	struct
1169	unix	IPMreqn	struct
1170	unix	IPv6Mreq	struct
1171	unix	PacketMreq	struct
1172	unix	Msghdr	struct
1173	unix	Cmsghdr	struct
1174	unix	Inet4Pktinfo	struct
1175	unix	Inet6Pktinfo	struct
1176	unix	IPv6MTUInfo	struct
1177	unix	ICMPv6Filter	struct
1178	unix	Ucred	struct
1179	unix	TCPInfo	struct
1180	unix	NlMsghdr	struct
1181	unix	NlMsgerr	struct
1182	unix	RtGenmsg	struct
1183	unix	NlAttr	struct
1184	unix	RtAttr	struct
1185	unix	IfInfomsg	struct
1186	unix	IfAddrmsg	struct
1187	unix	RtMsg	struct
1188	unix	RtNexthop	struct
1189	unix	SockFilter	struct
1190	unix	SockFprog	struct
1191	unix	InotifyEvent	struct
1192	unix	PtraceRegs	struct
1193	unix	FdSet	struct
1194	unix	Sysinfo_t	struct
1195	unix	Utsname	struct
1196	unix	Ustat_t	struct
1197	unix	EpollEvent	struct
1198	unix	PollFd	struct
1199	unix	Sigset_t	struct
1200	unix	Termios	struct
1201	unix	Winsize	struct
1202	unix	Taskstats	struct
1203	unix	CGroupStats	struct
1204	unix	Genlmsghdr	struct
1205	unix	PerfEventAttr	struct
1206	unix	PerfEventMmapPage	struct
1207	unix	SockaddrStorage	struct
1208	unix	TCPMD5Sig	struct
1209	unix	HDDriveCmdHdr	struct
1210	unix	HDGeometry	struct
1211	unix	HDDriveID	struct
1212	unix	Statfs_t	struct
1213	unix	TpacketHdr	struct
1214	unix	Tpacket2Hdr	struct
1215	unix	Tpacket3Hdr	struct
1216	unix	TpacketHdrVariant1	struct
1217	unix	TpacketBlockDesc	struct
1218	unix	TpacketReq	struct
1219	unix	TpacketReq3	struct
1220	unix	TpacketStats	struct
1221	unix	TpacketStatsV3	struct
1222	unix	TpacketAuxdata	struct
1223	unix	Nfgenmsg	struct
1224	unix	RTCTime	struct
1225	unix	RTCWkAlrm	struct
1226	unix	RTCPLLInfo	struct
1227	unix	Timespec	struct
1228	unix	Timeval	struct
1229	unix	Timex	struct
1230	unix	Time_t	int64
1231	unix	Tms	struct
1232	unix	Utimbuf	struct
1233	unix	Rusage	struct
1234	unix	Rlimit	struct
1235	unix	Stat_t	struct
1236	unix	StatxTimestamp	struct
1237	unix	Statx_t	struct
1238	unix	Dirent	struct
1239	unix	Fsid	struct
1240	unix	Flock_t	struct
1241	unix	FscryptPolicy	struct
1242	unix	FscryptKey	struct
1243	unix	KeyctlDHParams	struct
1244	unix	RawSockaddrInet4	struct
1245	unix	RawSockaddrInet6	struct
1246	unix	RawSockaddrUnix	struct
1247	unix	RawSockaddrLinklayer	struct
1248	unix	RawSockaddrNetlink	struct
1249	unix	RawSockaddrHCI	struct
1250	unix	RawSockaddrL2	struct
1251	unix	RawSockaddrCAN	struct
1252	unix	RawSockaddrALG	struct
1253	unix	RawSockaddrVM	struct
1254	unix	RawSockaddr	struct
1255	unix	RawSockaddrAny	struct
1256	unix	Linger	struct
1257	unix	Iovec	struct
1258	unix	IPMreq	struct
1259	unix	IPMreqn	struct
1260	unix	IPv6Mreq	struct
1261	unix	PacketMreq	struct
1262	unix	Msghdr	struct
1263	unix	Cmsghdr	struct
1264	unix	Inet4Pktinfo	struct
1265	unix	Inet6Pktinfo	struct
1266	unix	IPv6MTUInfo	struct
1267	unix	ICMPv6Filter	struct
1268	unix	Ucred	struct
1269	unix	TCPInfo	struct
1270	unix	NlMsghdr	struct
1271	unix	NlMsgerr	struct
1272	unix	RtGenmsg	struct
1273	unix	NlAttr	struct
1274	unix	RtAttr	struct
1275	unix	IfInfomsg	struct
1276	unix	IfAddrmsg	struct
1277	unix	RtMsg	struct
1278	unix	RtNexthop	struct
1279	unix	SockFilter	struct
1280	unix	SockFprog	struct
1281	unix	InotifyEvent	struct
1282	unix	PtraceRegs	struct
1283	unix	FdSet	struct
1284	unix	Sysinfo_t	struct
1285	unix	Utsname	struct
1286	unix	Ustat_t	struct
1287	unix	EpollEvent	struct
1288	unix	PollFd	struct
1289	unix	Sigset_t	struct
1290	unix	Termios	struct
1291	unix	Winsize	struct
1292	unix	Taskstats	struct
1293	unix	CGroupStats	struct
1294	unix	Genlmsghdr	struct
1295	unix	PerfEventAttr	struct
1296	unix	PerfEventMmapPage	struct
1297	unix	SockaddrStorage	struct
1298	unix	TCPMD5Sig	struct
1299	unix	HDDriveCmdHdr	struct
1300	unix	HDGeometry	struct
1301	unix	HDDriveID	struct
1302	unix	Statfs_t	struct
1303	unix	TpacketHdr	struct
1304	unix	Tpacket2Hdr	struct
1305	unix	Tpacket3Hdr	struct
1306	unix	TpacketHdrVariant1	struct
1307	unix	TpacketBlockDesc	struct
1308	unix	TpacketReq	struct
1309	unix	TpacketReq3	struct
1310	unix	TpacketStats	struct
1311	unix	TpacketStatsV3	struct
1312	unix	TpacketAuxdata	struct
1313	unix	Nfgenmsg	struct
1314	unix	RTCTime	struct
1315	unix	RTCWkAlrm	struct
1316	unix	RTCPLLInfo	struct
1317	unix	Timespec	struct
1318	unix	Timeval	struct
1319	unix	Timex	struct
1320	unix	Time_t	int32
1321	unix	Tms	struct
1322	unix	Utimbuf	struct
1323	unix	Rusage	struct
1324	unix	Rlimit	struct
1325	unix	Stat_t	struct
1326	unix	StatxTimestamp	struct
1327	unix	Statx_t	struct
1328	unix	Dirent	struct
1329	unix	Fsid	struct
1330	unix	Flock_t	struct
1331	unix	FscryptPolicy	struct
1332	unix	FscryptKey	struct
1333	unix	KeyctlDHParams	struct
1334	unix	RawSockaddrInet4	struct
1335	unix	RawSockaddrInet6	struct
1336	unix	RawSockaddrUnix	struct
1337	unix	RawSockaddrLinklayer	struct
1338	unix	RawSockaddrNetlink	struct
1339	unix	RawSockaddrHCI	struct
1340	unix	RawSockaddrL2	struct
1341	unix	RawSockaddrCAN	struct
1342	unix	RawSockaddrALG	struct
1343	unix	RawSockaddrVM	struct
1344	unix	RawSockaddr	struct
1345	unix	RawSockaddrAny	struct
1346	unix	Linger	struct
1347	unix	Iovec	struct
1348	unix	IPMreq	struct
1349	unix	IPMreqn	struct
1350	unix	IPv6Mreq	struct
1351	unix	PacketMreq	struct
1352	unix	Msghdr	struct
1353	unix	Cmsghdr	struct
1354	unix	Inet4Pktinfo	struct
1355	unix	Inet6Pktinfo	struct
1356	unix	IPv6MTUInfo	struct
1357	unix	ICMPv6Filter	struct
1358	unix	Ucred	struct
1359	unix	TCPInfo	struct
1360	unix	NlMsghdr	struct
1361	unix	NlMsgerr	struct
1362	unix	RtGenmsg	struct
1363	unix	NlAttr	struct
1364	unix	RtAttr	struct
1365	unix	IfInfomsg	struct
1366	unix	IfAddrmsg	struct
1367	unix	RtMsg	struct
1368	unix	RtNexthop	struct
1369	unix	SockFilter	struct
1370	unix	SockFprog	struct
1371	unix	InotifyEvent	struct
1372	unix	PtraceRegs	struct
1373	unix	FdSet	struct
1374	unix	Sysinfo_t	struct
1375	unix	Utsname	struct
1376	unix	Ustat_t	struct
1377	unix	EpollEvent	struct
1378	unix	PollFd	struct
1379	unix	Sigset_t	struct
1380	unix	Termios	struct
1381	unix	Winsize	struct
1382	unix	Taskstats	struct
1383	unix	CGroupStats	struct
1384	unix	Genlmsghdr	struct
1385	unix	PerfEventAttr	struct
1386	unix	PerfEventMmapPage	struct
1387	unix	SockaddrStorage	struct
1388	unix	TCPMD5Sig	struct
1389	unix	HDDriveCmdHdr	struct
1390	unix	HDGeometry	struct
1391	unix	HDDriveID	struct
1392	unix	Statfs_t	struct
1393	unix	TpacketHdr	struct
1394	unix	Tpacket2Hdr	struct
1395	unix	Tpacket3Hdr	struct
1396	unix	TpacketHdrVariant1	struct
1397	unix	TpacketBlockDesc	struct
1398	unix	TpacketReq	struct
1399	unix	TpacketReq3	struct
1400	unix	TpacketStats	struct
1401	unix	TpacketStatsV3	struct
1402	unix	TpacketAuxdata	struct
1403	unix	Nfgenmsg	struct
1404	unix	RTCTime	struct
1405	unix	RTCWkAlrm	struct
1406	unix	RTCPLLInfo	struct
1407	unix	Timespec	struct
1408	unix	Timeval	struct
1409	unix	Timex	struct
1410	unix	Time_t	int64
1411	unix	Tms	struct
1412	unix	Utimbuf	struct
1413	unix	Rusage	struct
1414	unix	Rlimit	struct
1415	unix	Stat_t	struct
1416	unix	StatxTimestamp	struct
1417	unix	Statx_t	struct
1418	unix	Dirent	struct
1419	unix	Fsid	struct
1420	unix	Flock_t	struct
1421	unix	FscryptPolicy	struct
1422	unix	FscryptKey	struct
1423	unix	KeyctlDHParams	struct
1424	unix	RawSockaddrInet4	struct
1425	unix	RawSockaddrInet6	struct
1426	unix	RawSockaddrUnix	struct
1427	unix	RawSockaddrLinklayer	struct
1428	unix	RawSockaddrNetlink	struct
1429	unix	RawSockaddrHCI	struct
1430	unix	RawSockaddrL2	struct
1431	unix	RawSockaddrCAN	struct
1432	unix	RawSockaddrALG	struct
1433	unix	RawSockaddrVM	struct
1434	unix	RawSockaddr	struct
1435	unix	RawSockaddrAny	struct
1436	unix	Linger	struct
1437	unix	Iovec	struct
1438	unix	IPMreq	struct
1439	unix	IPMreqn	struct
1440	unix	IPv6Mreq	struct
1441	unix	PacketMreq	struct
1442	unix	Msghdr	struct
1443	unix	Cmsghdr	struct
1444	unix	Inet4Pktinfo	struct
1445	unix	Inet6Pktinfo	struct
1446	unix	IPv6MTUInfo	struct
1447	unix	ICMPv6Filter	struct
1448	unix	Ucred	struct
1449	unix	TCPInfo	struct
1450	unix	NlMsghdr	struct
1451	unix	NlMsgerr	struct
1452	unix	RtGenmsg	struct
1453	unix	NlAttr	struct
1454	unix	RtAttr	struct
1455	unix	IfInfomsg	struct
1456	unix	IfAddrmsg	struct
1457	unix	RtMsg	struct
1458	unix	RtNexthop	struct
1459	unix	SockFilter	struct
1460	unix	SockFprog	struct
1461	unix	InotifyEvent	struct
1462	unix	PtraceRegs	struct
1463	unix	FdSet	struct
1464	unix	Sysinfo_t	struct
1465	unix	Utsname	struct
1466	unix	Ustat_t	struct
1467	unix	EpollEvent	struct
1468	unix	PollFd	struct
1469	unix	Sigset_t	struct
1470	unix	Termios	struct
1471	unix	Winsize	struct
1472	unix	Taskstats	struct
1473	unix	CGroupStats	struct
1474	unix	Genlmsghdr	struct
1475	unix	PerfEventAttr	struct
1476	unix	PerfEventMmapPage	struct
1477	unix	SockaddrStorage	struct
1478	unix	TCPMD5Sig	struct
1479	unix	HDDriveCmdHdr	struct
1480	unix	HDGeometry	struct
1481	unix	HDDriveID	struct
1482	unix	Statfs_t	struct
1483	unix	TpacketHdr	struct
1484	unix	Tpacket2Hdr	struct
1485	unix	Tpacket3Hdr	struct
1486	unix	TpacketHdrVariant1	struct
1487	unix	TpacketBlockDesc	struct
1488	unix	TpacketReq	struct
1489	unix	TpacketReq3	struct
1490	unix	TpacketStats	struct
1491	unix	TpacketStatsV3	struct
1492	unix	TpacketAuxdata	struct
1493	unix	Nfgenmsg	struct
1494	unix	RTCTime	struct
1495	unix	RTCWkAlrm	struct
1496	unix	RTCPLLInfo	struct
1497	unix	Timespec	struct
1498	unix	Timeval	struct
1499	unix	Timex	struct
1500	unix	Time_t	int32
1501	unix	Tms	struct
1502	unix	Utimbuf	struct
1503	unix	Rusage	struct
1504	unix	Rlimit	struct
1505	unix	Stat_t	struct
1506	unix	StatxTimestamp	struct
1507	unix	Statx_t	struct
1508	unix	Dirent	struct
1509	unix	Fsid	struct
1510	unix	Flock_t	struct
1511	unix	FscryptPolicy	struct
1512	unix	FscryptKey	struct
1513	unix	KeyctlDHParams	struct
1514	unix	RawSockaddrInet4	struct
1515	unix	RawSockaddrInet6	struct
1516	unix	RawSockaddrUnix	struct
1517	unix	RawSockaddrLinklayer	struct
1518	unix	RawSockaddrNetlink	struct
1519	unix	RawSockaddrHCI	struct
1520	unix	RawSockaddrL2	struct
1521	unix	RawSockaddrCAN	struct
1522	unix	RawSockaddrALG	struct
1523	unix	RawSockaddrVM	struct
1524	unix	RawSockaddr	struct
1525	unix	RawSockaddrAny	struct
1526	unix	Linger	struct
1527	unix	Iovec	struct
1528	unix	IPMreq	struct
1529	unix	IPMreqn	struct
1530	unix	IPv6Mreq	struct
1531	unix	PacketMreq	struct
1532	unix	Msghdr	struct
1533	unix	Cmsghdr	struct
1534	unix	Inet4Pktinfo	struct
1535	unix	Inet6Pktinfo	struct
1536	unix	IPv6MTUInfo	struct
1537	unix	ICMPv6Filter	struct
1538	unix	Ucred	struct
1539	unix	TCPInfo	struct
1540	unix	NlMsghdr	struct
1541	unix	NlMsgerr	struct
1542	unix	RtGenmsg	struct
1543	unix	NlAttr	struct
1544	unix	RtAttr	struct
1545	unix	IfInfomsg	struct
1546	unix	IfAddrmsg	struct
1547	unix	RtMsg	struct
1548	unix	RtNexthop	struct
1549	unix	SockFilter	struct
1550	unix	SockFprog	struct
1551	unix	InotifyEvent	struct
1552	unix	PtraceRegs	struct
1553	unix	FdSet	struct
1554	unix	Sysinfo_t	struct
1555	unix	Utsname	struct
1556	unix	Ustat_t	struct
1557	unix	EpollEvent	struct
1558	unix	PollFd	struct
1559	unix	Sigset_t	struct
1560	unix	Termios	struct
1561	unix	Winsize	struct
1562	unix	Taskstats	struct
1563	unix	CGroupStats	struct
1564	unix	Genlmsghdr	struct
1565	unix	PerfEventAttr	struct
1566	unix	PerfEventMmapPage	struct
1567	unix	SockaddrStorage	struct
1568	unix	TCPMD5Sig	struct
1569	unix	HDDriveCmdHdr	struct
1570	unix	HDGeometry	struct
1571	unix	HDDriveID	struct
1572	unix	Statfs_t	struct
1573	unix	TpacketHdr	struct
1574	unix	Tpacket2Hdr	struct
1575	unix	Tpacket3Hdr	struct
1576	unix	TpacketHdrVariant1	struct
1577	unix	TpacketBlockDesc	struct
1578	unix	TpacketReq	struct
1579	unix	TpacketReq3	struct
1580	unix	TpacketStats	struct
1581	unix	TpacketStatsV3	struct
1582	unix	TpacketAuxdata	struct
1583	unix	Nfgenmsg	struct
1584	unix	RTCTime	struct
1585	unix	RTCWkAlrm	struct
1586	unix	RTCPLLInfo	struct
1587	unix	Timespec	struct
1588	unix	Timeval	struct
1589	unix	Timex	struct
1590	unix	Time_t	int64
1591	unix	Tms	struct
1592	unix	Utimbuf	struct
1593	unix	Rusage	struct
1594	unix	Rlimit	struct
1595	unix	Stat_t	struct
1596	unix	StatxTimestamp	struct
1597	unix	Statx_t	struct
1598	unix	Dirent	struct
1599	unix	Fsid	struct
1600	unix	Flock_t	struct
1601	unix	FscryptPolicy	struct
1602	unix	FscryptKey	struct
1603	unix	KeyctlDHParams	struct
1604	unix	RawSockaddrInet4	struct
1605	unix	RawSockaddrInet6	struct
1606	unix	RawSockaddrUnix	struct
1607	unix	RawSockaddrLinklayer	struct
1608	unix	RawSockaddrNetlink	struct
1609	unix	RawSockaddrHCI	struct
1610	unix	RawSockaddrL2	struct
1611	unix	RawSockaddrCAN	struct
1612	unix	RawSockaddrALG	struct
1613	unix	RawSockaddrVM	struct
1614	unix	RawSockaddr	struct
1615	unix	RawSockaddrAny	struct
1616	unix	Linger	struct
1617	unix	Iovec	struct
1618	unix	IPMreq	struct
1619	unix	IPMreqn	struct
1620	unix	IPv6Mreq	struct
1621	unix	PacketMreq	struct
1622	unix	Msghdr	struct
1623	unix	Cmsghdr	struct
1624	unix	Inet4Pktinfo	struct
1625	unix	Inet6Pktinfo	struct
1626	unix	IPv6MTUInfo	struct
1627	unix	ICMPv6Filter	struct
1628	unix	Ucred	struct
1629	unix	TCPInfo	struct
1630	unix	NlMsghdr	struct
1631	unix	NlMsgerr	struct
1632	unix	RtGenmsg	struct
1633	unix	NlAttr	struct
1634	unix	RtAttr	struct
1635	unix	IfInfomsg	struct
1636	unix	IfAddrmsg	struct
1637	unix	RtMsg	struct
1638	unix	RtNexthop	struct
1639	unix	SockFilter	struct
1640	unix	SockFprog	struct
1641	unix	InotifyEvent	struct
1642	unix	PtraceRegs	struct
1643	unix	FdSet	struct
1644	unix	Sysinfo_t	struct
1645	unix	Utsname	struct
1646	unix	Ustat_t	struct
1647	unix	EpollEvent	struct
1648	unix	PollFd	struct
1649	unix	Sigset_t	struct
1650	unix	Termios	struct
1651	unix	Winsize	struct
1652	unix	Taskstats	struct
1653	unix	CGroupStats	struct
1654	unix	Genlmsghdr	struct
1655	unix	PerfEventAttr	struct
1656	unix	PerfEventMmapPage	struct
1657	unix	SockaddrStorage	struct
1658	unix	TCPMD5Sig	struct
1659	unix	HDDriveCmdHdr	struct
1660	unix	HDGeometry	struct
1661	unix	HDDriveID	struct
1662	unix	Statfs_t	struct
1663	unix	TpacketHdr	struct
1664	unix	Tpacket2Hdr	struct
1665	unix	Tpacket3Hdr	struct
1666	unix	TpacketHdrVariant1	struct
1667	unix	TpacketBlockDesc	struct
1668	unix	TpacketReq	struct
1669	unix	TpacketReq3	struct
1670	unix	TpacketStats	struct
1671	unix	TpacketStatsV3	struct
1672	unix	TpacketAuxdata	struct
1673	unix	Nfgenmsg	struct
1674	unix	RTCTime	struct
1675	unix	RTCWkAlrm	struct
1676	unix	RTCPLLInfo	struct
1677	unix	Timespec	struct
1678	unix	Timeval	struct
1679	unix	Timex	struct
1680	unix	Time_t	int64
1681	unix	Tms	struct
1682	unix	Utimbuf	struct
1683	unix	Rusage	struct
1684	unix	Rlimit	struct
1685	unix	Stat_t	struct
1686	unix	StatxTimestamp	struct
1687	unix	Statx_t	struct
1688	unix	Dirent	struct
1689	unix	Fsid	struct
1690	unix	Flock_t	struct
1691	unix	FscryptPolicy	struct
1692	unix	FscryptKey	struct
1693	unix	KeyctlDHParams	struct
1694	unix	RawSockaddrInet4	struct
1695	unix	RawSockaddrInet6	struct
1696	unix	RawSockaddrUnix	struct
1697	unix	RawSockaddrLinklayer	struct
1698	unix	RawSockaddrNetlink	struct
1699	unix	RawSockaddrHCI	struct
1700	unix	RawSockaddrL2	struct
1701	unix	RawSockaddrCAN	struct
1702	unix	RawSockaddrALG	struct
1703	unix	RawSockaddrVM	struct
1704	unix	RawSockaddr	struct
1705	unix	RawSockaddrAny	struct
1706	unix	Linger	struct
1707	unix	Iovec	struct
1708	unix	IPMreq	struct
1709	unix	IPMreqn	struct
1710	unix	IPv6Mreq	struct
1711	unix	PacketMreq	struct
1712	unix	Msghdr	struct
1713	unix	Cmsghdr	struct
1714	unix	Inet4Pktinfo	struct
1715	unix	Inet6Pktinfo	struct
1716	unix	IPv6MTUInfo	struct
1717	unix	ICMPv6Filter	struct
1718	unix	Ucred	struct
1719	unix	TCPInfo	struct
1720	unix	NlMsghdr	struct
1721	unix	NlMsgerr	struct
1722	unix	RtGenmsg	struct
1723	unix	NlAttr	struct
1724	unix	RtAttr	struct
1725	unix	IfInfomsg	struct
1726	unix	IfAddrmsg	struct
1727	unix	RtMsg	struct
1728	unix	RtNexthop	struct
1729	unix	SockFilter	struct
1730	unix	SockFprog	struct
1731	unix	InotifyEvent	struct
1732	unix	PtraceRegs	struct
1733	unix	FdSet	struct
1734	unix	Sysinfo_t	struct
1735	unix	Utsname	struct
1736	unix	Ustat_t	struct
1737	unix	EpollEvent	struct
1738	unix	PollFd	struct
1739	unix	Sigset_t	struct
1740	unix	Termios	struct
1741	unix	Winsize	struct
1742	unix	Taskstats	struct
1743	unix	CGroupStats	struct
1744	unix	Genlmsghdr	struct
1745	unix	PerfEventAttr	struct
1746	unix	PerfEventMmapPage	struct
1747	unix	SockaddrStorage	struct
1748	unix	TCPMD5Sig	struct
1749	unix	HDDriveCmdHdr	struct
1750	unix	HDGeometry	struct
1751	unix	HDDriveID	struct
1752	unix	Statfs_t	struct
1753	unix	TpacketHdr	struct
1754	unix	Tpacket2Hdr	struct
1755	unix	Tpacket3Hdr	struct
1756	unix	TpacketHdrVariant1	struct
1757	unix	TpacketBlockDesc	struct
1758	unix	TpacketReq	struct
1759	unix	TpacketReq3	struct
1760	unix	TpacketStats	struct
1761	unix	TpacketStatsV3	struct
1762	unix	TpacketAuxdata	struct
1763	unix	Nfgenmsg	struct
1764	unix	RTCTime	struct
1765	unix	RTCWkAlrm	struct
1766	unix	RTCPLLInfo	struct
1767	unix	Timespec	struct
1768	unix	Timeval	struct
1769	unix	Timex	struct
1770	unix	Time_t	int32
1771	unix	Tms	struct
1772	unix	Utimbuf	struct
1773	unix	Rusage	struct
1774	unix	Rlimit	struct
1775	unix	Stat_t	struct
1776	unix	StatxTimestamp	struct
1777	unix	Statx_t	struct
1778	unix	Dirent	struct
1779	unix	Fsid	struct
1780	unix	Flock_t	struct
1781	unix	FscryptPolicy	struct
1782	unix	FscryptKey	struct
1783	unix	KeyctlDHParams	struct
1784	unix	RawSockaddrInet4	struct
1785	unix	RawSockaddrInet6	struct
1786	unix	RawSockaddrUnix	struct
1787	unix	RawSockaddrLinklayer	struct
1788	unix	RawSockaddrNetlink	struct
1789	unix	RawSockaddrHCI	struct
1790	unix	RawSockaddrL2	struct
1791	unix	RawSockaddrCAN	struct
1792	unix	RawSockaddrALG	struct
1793	unix	RawSockaddrVM	struct
1794	unix	RawSockaddr	struct
1795	unix	RawSockaddrAny	struct
1796	unix	Linger	struct
1797	unix	Iovec	struct
1798	unix	IPMreq	struct
1799	unix	IPMreqn	struct
1800	unix	IPv6Mreq	struct
1801	unix	PacketMreq	struct
1802	unix	Msghdr	struct
1803	unix	Cmsghdr	struct
1804	unix	Inet4Pktinfo	struct
1805	unix	Inet6Pktinfo	struct
1806	unix	IPv6MTUInfo	struct
1807	unix	ICMPv6Filter	struct
1808	unix	Ucred	struct
1809	unix	TCPInfo	struct
1810	unix	NlMsghdr	struct
1811	unix	NlMsgerr	struct
1812	unix	RtGenmsg	struct
1813	unix	NlAttr	struct
1814	unix	RtAttr	struct
1815	unix	IfInfomsg	struct
1816	unix	IfAddrmsg	struct
1817	unix	RtMsg	struct
1818	unix	RtNexthop	struct
1819	unix	SockFilter	struct
1820	unix	SockFprog	struct
1821	unix	InotifyEvent	struct
1822	unix	PtraceRegs	struct
1823	unix	FdSet	struct
1824	unix	Sysinfo_t	struct
1825	unix	Utsname	struct
1826	unix	Ustat_t	struct
1827	unix	EpollEvent	struct
1828	unix	PollFd	struct
1829	unix	Sigset_t	struct
1830	unix	Termios	struct
1831	unix	Winsize	struct
1832	unix	Taskstats	struct
1833	unix	CGroupStats	struct
1834	unix	Genlmsghdr	struct
1835	unix	PerfEventAttr	struct
1836	unix	PerfEventMmapPage	struct
1837	unix	SockaddrStorage	struct
1838	unix	TCPMD5Sig	struct
1839	unix	HDDriveCmdHdr	struct
1840	unix	HDGeometry	struct
1841	unix	HDDriveID	struct
1842	unix	Statfs_t	struct
1843	unix	TpacketHdr	struct
1844	unix	Tpacket2Hdr	struct
1845	unix	Tpacket3Hdr	struct
1846	unix	TpacketHdrVariant1	struct
1847	unix	TpacketBlockDesc	struct
1848	unix	TpacketReq	struct
1849	unix	TpacketReq3	struct
1850	unix	TpacketStats	struct
1851	unix	TpacketStatsV3	struct
1852	unix	TpacketAuxdata	struct
1853	unix	Nfgenmsg	struct
1854	unix	RTCTime	struct
1855	unix	RTCWkAlrm	struct
1856	unix	RTCPLLInfo	struct
1857	unix	Timespec	struct
1858	unix	Timeval	struct
1859	unix	Timex	struct
1860	unix	Time_t	int64
1861	unix	Tms	struct
1862	unix	Utimbuf	struct
1863	unix	Rusage	struct
1864	unix	Rlimit	struct
1865	unix	Stat_t	struct
1866	unix	StatxTimestamp	struct
1867	unix	Statx_t	struct
1868	unix	Dirent	struct
1869	unix	Fsid	struct
1870	unix	Flock_t	struct
1871	unix	FscryptPolicy	struct
1872	unix	FscryptKey	struct
1873	unix	KeyctlDHParams	struct
1874	unix	RawSockaddrInet4	struct
1875	unix	RawSockaddrInet6	struct
1876	unix	RawSockaddrUnix	struct
1877	unix	RawSockaddrLinklayer	struct
1878	unix	RawSockaddrNetlink	struct
1879	unix	RawSockaddrHCI	struct
1880	unix	RawSockaddrL2	struct
1881	unix	RawSockaddrCAN	struct
1882	unix	RawSockaddrALG	struct
1883	unix	RawSockaddrVM	struct
1884	unix	RawSockaddr	struct
1885	unix	RawSockaddrAny	struct
1886	unix	Linger	struct
1887	unix	Iovec	struct
1888	unix	IPMreq	struct
1889	unix	IPMreqn	struct
1890	unix	IPv6Mreq	struct
1891	unix	PacketMreq	struct
1892	unix	Msghdr	struct
1893	unix	Cmsghdr	struct
1894	unix	Inet4Pktinfo	struct
1895	unix	Inet6Pktinfo	struct
1896	unix	IPv6MTUInfo	struct
1897	unix	ICMPv6Filter	struct
1898	unix	Ucred	struct
1899	unix	TCPInfo	struct
1900	unix	NlMsghdr	struct
1901	unix	NlMsgerr	struct
1902	unix	RtGenmsg	struct
1903	unix	NlAttr	struct
1904	unix	RtAttr	struct
1905	unix	IfInfomsg	struct
1906	unix	IfAddrmsg	struct
1907	unix	RtMsg	struct
1908	unix	RtNexthop	struct
1909	unix	SockFilter	struct
1910	unix	SockFprog	struct
1911	unix	InotifyEvent	struct
1912	unix	PtraceRegs	struct
1913	unix	FdSet	struct
1914	unix	Sysinfo_t	struct
1915	unix	Utsname	struct
1916	unix	Ustat_t	struct
1917	unix	EpollEvent	struct
1918	unix	PollFd	struct
1919	unix	Sigset_t	struct
1920	unix	Termios	struct
1921	unix	Winsize	struct
1922	unix	Taskstats	struct
1923	unix	CGroupStats	struct
1924	unix	Genlmsghdr	struct
1925	unix	PerfEventAttr	struct
1926	unix	PerfEventMmapPage	struct
1927	unix	SockaddrStorage	struct
1928	unix	TCPMD5Sig	struct
1929	unix	HDDriveCmdHdr	struct
1930	unix	HDGeometry	struct
1931	unix	HDDriveID	struct
1932	unix	Statfs_t	struct
1933	unix	TpacketHdr	struct
1934	unix	Tpacket2Hdr	struct
1935	unix	Tpacket3Hdr	struct
1936	unix	TpacketHdrVariant1	struct
1937	unix	TpacketBlockDesc	struct
1938	unix	TpacketReq	struct
1939	unix	TpacketReq3	struct
1940	unix	TpacketStats	struct
1941	unix	TpacketStatsV3	struct
1942	unix	TpacketAuxdata	struct
1943	unix	Nfgenmsg	struct
1944	unix	RTCTime	struct
1945	unix	RTCWkAlrm	struct
1946	unix	RTCPLLInfo	struct
1947	unix	Timespec	struct
1948	unix	Timeval	struct
1949	unix	Timex	struct
1950	unix	Time_t	int64
1951	unix	Tms	struct
1952	unix	Utimbuf	struct
1953	unix	Rusage	struct
1954	unix	Rlimit	struct
1955	unix	Stat_t	struct
1956	unix	StatxTimestamp	struct
1957	unix	Statx_t	struct
1958	unix	Dirent	struct
1959	unix	Fsid	struct
1960	unix	Flock_t	struct
1961	unix	FscryptPolicy	struct
1962	unix	FscryptKey	struct
1963	unix	KeyctlDHParams	struct
1964	unix	RawSockaddrInet4	struct
1965	unix	RawSockaddrInet6	struct
1966	unix	RawSockaddrUnix	struct
1967	unix	RawSockaddrLinklayer	struct
1968	unix	RawSockaddrNetlink	struct
1969	unix	RawSockaddrHCI	struct
1970	unix	RawSockaddrL2	struct
1971	unix	RawSockaddrCAN	struct
1972	unix	RawSockaddrALG	struct
1973	unix	RawSockaddrVM	struct
1974	unix	RawSockaddr	struct
1975	unix	RawSockaddrAny	struct
1976	unix	Linger	struct
1977	unix	Iovec	struct
1978	unix	IPMreq	struct
1979	unix	IPMreqn	struct
1980	unix	IPv6Mreq	struct
1981	unix	PacketMreq	struct
1982	unix	Msghdr	struct
1983	unix	Cmsghdr	struct
1984	unix	Inet4Pktinfo	struct
1985	unix	Inet6Pktinfo	struct
1986	unix	IPv6MTUInfo	struct
1987	unix	ICMPv6Filter	struct
1988	unix	Ucred	struct
1989	unix	TCPInfo	struct
1990	unix	NlMsghdr	struct
1991	unix	NlMsgerr	struct
1992	unix	RtGenmsg	struct
1993	unix	NlAttr	struct
1994	unix	RtAttr	struct
1995	unix	IfInfomsg	struct
1996	unix	IfAddrmsg	struct
1997	unix	RtMsg	struct
1998	unix	RtNexthop	struct
1999	unix	SockFilter	struct
2000	unix	SockFprog	struct
2001	unix	InotifyEvent	struct
2002	unix	PtraceRegs	struct
2003	unix	FdSet	struct
2004	unix	Sysinfo_t	struct
2005	unix	Utsname	struct
2006	unix	Ustat_t	struct
2007	unix	EpollEvent	struct
2008	unix	PollFd	struct
2009	unix	Sigset_t	struct
2010	unix	Termios	struct
2011	unix	Winsize	struct
2012	unix	Taskstats	struct
2013	unix	CGroupStats	struct
2014	unix	Genlmsghdr	struct
2015	unix	PerfEventAttr	struct
2016	unix	PerfEventMmapPage	struct
2017	unix	SockaddrStorage	struct
2018	unix	TCPMD5Sig	struct
2019	unix	HDDriveCmdHdr	struct
2020	unix	HDGeometry	struct
2021	unix	HDDriveID	struct
2022	unix	Statfs_t	struct
2023	unix	TpacketHdr	struct
2024	unix	Tpacket2Hdr	struct
2025	unix	Tpacket3Hdr	struct
2026	unix	TpacketHdrVariant1	struct
2027	unix	TpacketBlockDesc	struct
2028	unix	TpacketReq	struct
2029	unix	TpacketReq3	struct
2030	unix	TpacketStats	struct
2031	unix	TpacketStatsV3	struct
2032	unix	TpacketAuxdata	struct
2033	unix	Nfgenmsg	struct
2034	unix	RTCTime	struct
2035	unix	RTCWkAlrm	struct
2036	unix	RTCPLLInfo	struct
2037	unix	Timespec	struct
2038	unix	Timeval	struct
2039	unix	Timex	struct
2040	unix	Time_t	int64
2041	unix	Tms	struct
2042	unix	Utimbuf	struct
2043	unix	Rusage	struct
2044	unix	Rlimit	struct
2045	unix	Stat_t	struct
2046	unix	StatxTimestamp	struct
2047	unix	Statx_t	struct
2048	unix	Dirent	struct
2049	unix	Fsid	struct
2050	unix	Flock_t	struct
2051	unix	FscryptPolicy	struct
2052	unix	FscryptKey	struct
2053	unix	KeyctlDHParams	struct
2054	unix	RawSockaddrInet4	struct
2055	unix	RawSockaddrInet6	struct
2056	unix	RawSockaddrUnix	struct
2057	unix	RawSockaddrLinklayer	struct
2058	unix	RawSockaddrNetlink	struct
2059	unix	RawSockaddrHCI	struct
2060	unix	RawSockaddrL2	struct
2061	unix	RawSockaddrCAN	struct
2062	unix	RawSockaddrALG	struct
2063	unix	RawSockaddrVM	struct
2064	unix	RawSockaddr	struct
2065	unix	RawSockaddrAny	struct
2066	unix	Linger	struct
2067	unix	Iovec	struct
2068	unix	IPMreq	struct
2069	unix	IPMreqn	struct
2070	unix	IPv6Mreq	struct
2071	unix	PacketMreq	struct
2072	unix	Msghdr	struct
2073	unix	Cmsghdr	struct
2074	unix	Inet4Pktinfo	struct
2075	unix	Inet6Pktinfo	struct
2076	unix	IPv6MTUInfo	struct
2077	unix	ICMPv6Filter	struct
2078	unix	Ucred	struct
2079	unix	TCPInfo	struct
2080	unix	NlMsghdr	struct
2081	unix	NlMsgerr	struct
2082	unix	RtGenmsg	struct
2083	unix	NlAttr	struct
2084	unix	RtAttr	struct
2085	unix	IfInfomsg	struct
2086	unix	IfAddrmsg	struct
2087	unix	RtMsg	struct
2088	unix	RtNexthop	struct
2089	unix	SockFilter	struct
2090	unix	SockFprog	struct
2091	unix	InotifyEvent	struct
2092	unix	PtraceRegs	struct
2093	unix	PtracePsw	struct
2094	unix	PtraceFpregs	struct
2095	unix	PtracePer	struct
2096	unix	FdSet	struct
2097	unix	Sysinfo_t	struct
2098	unix	Utsname	struct
2099	unix	Ustat_t	struct
2100	unix	EpollEvent	struct
2101	unix	PollFd	struct
2102	unix	Sigset_t	struct
2103	unix	Termios	struct
2104	unix	Winsize	struct
2105	unix	Taskstats	struct
2106	unix	CGroupStats	struct
2107	unix	Genlmsghdr	struct
2108	unix	PerfEventAttr	struct
2109	unix	PerfEventMmapPage	struct
2110	unix	SockaddrStorage	struct
2111	unix	TCPMD5Sig	struct
2112	unix	HDDriveCmdHdr	struct
2113	unix	HDGeometry	struct
2114	unix	HDDriveID	struct
2115	unix	Statfs_t	struct
2116	unix	TpacketHdr	struct
2117	unix	Tpacket2Hdr	struct
2118	unix	Tpacket3Hdr	struct
2119	unix	TpacketHdrVariant1	struct
2120	unix	TpacketBlockDesc	struct
2121	unix	TpacketReq	struct
2122	unix	TpacketReq3	struct
2123	unix	TpacketStats	struct
2124	unix	TpacketStatsV3	struct
2125	unix	TpacketAuxdata	struct
2126	unix	Nfgenmsg	struct
2127	unix	RTCTime	struct
2128	unix	RTCWkAlrm	struct
2129	unix	RTCPLLInfo	struct
2130	unix	Timespec	struct
2131	unix	Timeval	struct
2132	unix	Timex	struct
2133	unix	Time_t	int64
2134	unix	Tms	struct
2135	unix	Utimbuf	struct
2136	unix	Rusage	struct
2137	unix	Rlimit	struct
2138	unix	Stat_t	struct
2139	unix	Statfs_t	struct
2140	unix	Dirent	struct
2141	unix	Fsid	struct
2142	unix	Flock_t	struct
2143	unix	RawSockaddrInet4	struct
2144	unix	RawSockaddrInet6	struct
2145	unix	RawSockaddrUnix	struct
2146	unix	RawSockaddrLinklayer	struct
2147	unix	RawSockaddrNetlink	struct
2148	unix	RawSockaddrHCI	struct
2149	unix	RawSockaddrCAN	struct
2150	unix	RawSockaddrALG	struct
2151	unix	RawSockaddrVM	struct
2152	unix	RawSockaddr	struct
2153	unix	RawSockaddrAny	struct
2154	unix	Linger	struct
2155	unix	Iovec	struct
2156	unix	IPMreq	struct
2157	unix	IPMreqn	struct
2158	unix	IPv6Mreq	struct
2159	unix	Msghdr	struct
2160	unix	Cmsghdr	struct
2161	unix	Inet4Pktinfo	struct
2162	unix	Inet6Pktinfo	struct
2163	unix	IPv6MTUInfo	struct
2164	unix	ICMPv6Filter	struct
2165	unix	Ucred	struct
2166	unix	TCPInfo	struct
2167	unix	NlMsghdr	struct
2168	unix	NlMsgerr	struct
2169	unix	RtGenmsg	struct
2170	unix	NlAttr	struct
2171	unix	RtAttr	struct
2172	unix	IfInfomsg	struct
2173	unix	IfAddrmsg	struct
2174	unix	RtMsg	struct
2175	unix	RtNexthop	struct
2176	unix	SockFilter	struct
2177	unix	SockFprog	struct
2178	unix	InotifyEvent	struct
2179	unix	PtraceRegs	struct
2180	unix	FdSet	struct
2181	unix	Sysinfo_t	struct
2182	unix	Utsname	struct
2183	unix	Ustat_t	struct
2184	unix	EpollEvent	struct
2185	unix	PollFd	struct
2186	unix	Sigset_t	struct
2187	unix	Termios	struct
2188	unix	Timespec	struct
2189	unix	Timeval	struct
2190	unix	Rusage	struct
2191	unix	Rlimit	struct
2192	unix	Stat_t	struct
2193	unix	Statfs_t	[]byte
2194	unix	Flock_t	struct
2195	unix	Dirent	struct
2196	unix	Fsid	struct
2197	unix	RawSockaddrInet4	struct
2198	unix	RawSockaddrInet6	struct
2199	unix	RawSockaddrUnix	struct
2200	unix	RawSockaddrDatalink	struct
2201	unix	RawSockaddr	struct
2202	unix	RawSockaddrAny	struct
2203	unix	Linger	struct
2204	unix	Iovec	struct
2205	unix	IPMreq	struct
2206	unix	IPv6Mreq	struct
2207	unix	Msghdr	struct
2208	unix	Cmsghdr	struct
2209	unix	Inet6Pktinfo	struct
2210	unix	IPv6MTUInfo	struct
2211	unix	ICMPv6Filter	struct
2212	unix	Kevent_t	struct
2213	unix	FdSet	struct
2214	unix	IfMsghdr	struct
2215	unix	IfData	struct
2216	unix	IfaMsghdr	struct
2217	unix	IfAnnounceMsghdr	struct
2218	unix	RtMsghdr	struct
2219	unix	RtMetrics	struct
2220	unix	Mclpool	[]byte
2221	unix	BpfVersion	struct
2222	unix	BpfStat	struct
2223	unix	BpfProgram	struct
2224	unix	BpfInsn	struct
2225	unix	BpfHdr	struct
2226	unix	BpfTimeval	struct
2227	unix	Termios	struct
2228	unix	Winsize	struct
2229	unix	PollFd	struct
2230	unix	Sysctlnode	struct
2231	unix	Utsname	struct
2232	unix	Timespec	struct
2233	unix	Timeval	struct
2234	unix	Rusage	struct
2235	unix	Rlimit	struct
2236	unix	Stat_t	struct
2237	unix	Statfs_t	[]byte
2238	unix	Flock_t	struct
2239	unix	Dirent	struct
2240	unix	Fsid	struct
2241	unix	RawSockaddrInet4	struct
2242	unix	RawSockaddrInet6	struct
2243	unix	RawSockaddrUnix	struct
2244	unix	RawSockaddrDatalink	struct
2245	unix	RawSockaddr	struct
2246	unix	RawSockaddrAny	struct
2247	unix	Linger	struct
2248	unix	Iovec	struct
2249	unix	IPMreq	struct
2250	unix	IPv6Mreq	struct
2251	unix	Msghdr	struct
2252	unix	Cmsghdr	struct
2253	unix	Inet6Pktinfo	struct
2254	unix	IPv6MTUInfo	struct
2255	unix	ICMPv6Filter	struct
2256	unix	Kevent_t	struct
2257	unix	FdSet	struct
2258	unix	IfMsghdr	struct
2259	unix	IfData	struct
2260	unix	IfaMsghdr	struct
2261	unix	IfAnnounceMsghdr	struct
2262	unix	RtMsghdr	struct
2263	unix	RtMetrics	struct
2264	unix	Mclpool	[]byte
2265	unix	BpfVersion	struct
2266	unix	BpfStat	struct
2267	unix	BpfProgram	struct
2268	unix	BpfInsn	struct
2269	unix	BpfHdr	struct
2270	unix	BpfTimeval	struct
2271	unix	Termios	struct
2272	unix	Winsize	struct
2273	unix	PollFd	struct
2274	unix	Sysctlnode	struct
2275	unix	Utsname	struct
2276	unix	Timespec	struct
2277	unix	Timeval	struct
2278	unix	Rusage	struct
2279	unix	Rlimit	struct
2280	unix	Stat_t	struct
2281	unix	Statfs_t	[]byte
2282	unix	Flock_t	struct
2283	unix	Dirent	struct
2284	unix	Fsid	struct
2285	unix	RawSockaddrInet4	struct
2286	unix	RawSockaddrInet6	struct
2287	unix	RawSockaddrUnix	struct
2288	unix	RawSockaddrDatalink	struct
2289	unix	RawSockaddr	struct
2290	unix	RawSockaddrAny	struct
2291	unix	Linger	struct
2292	unix	Iovec	struct
2293	unix	IPMreq	struct
2294	unix	IPv6Mreq	struct
2295	unix	Msghdr	struct
2296	unix	Cmsghdr	struct
2297	unix	Inet6Pktinfo	struct
2298	unix	IPv6MTUInfo	struct
2299	unix	ICMPv6Filter	struct
2300	unix	Kevent_t	struct
2301	unix	FdSet	struct
2302	unix	IfMsghdr	struct
2303	unix	IfData	struct
2304	unix	IfaMsghdr	struct
2305	unix	IfAnnounceMsghdr	struct
2306	unix	RtMsghdr	struct
2307	unix	RtMetrics	struct
2308	unix	Mclpool	[]byte
2309	unix	BpfVersion	struct
2310	unix	BpfStat	struct
2311	unix	BpfProgram	struct
2312	unix	BpfInsn	struct
2313	unix	BpfHdr	struct
2314	unix	BpfTimeval	struct
2315	unix	Termios	struct
2316	unix	Winsize	struct
2317	unix	PollFd	struct
2318	unix	Sysctlnode	struct
2319	unix	Utsname	struct
2320	unix	Timespec	struct
2321	unix	Timeval	struct
2322	unix	Rusage	struct
2323	unix	Rlimit	struct
2324	unix	Stat_t	struct
2325	unix	Statfs_t	struct
2326	unix	Flock_t	struct
2327	unix	Dirent	struct
2328	unix	Fsid	struct
2329	unix	RawSockaddrInet4	struct
2330	unix	RawSockaddrInet6	struct
2331	unix	RawSockaddrUnix	struct
2332	unix	RawSockaddrDatalink	struct
2333	unix	RawSockaddr	struct
2334	unix	RawSockaddrAny	struct
2335	unix	Linger	struct
2336	unix	Iovec	struct
2337	unix	IPMreq	struct
2338	unix	IPv6Mreq	struct
2339	unix	Msghdr	struct
2340	unix	Cmsghdr	struct
2341	unix	Inet6Pktinfo	struct
2342	unix	IPv6MTUInfo	struct
2343	unix	ICMPv6Filter	struct
2344	unix	Kevent_t	struct
2345	unix	FdSet	struct
2346	unix	IfMsghdr	struct
2347	unix	IfData	struct
2348	unix	IfaMsghdr	struct
2349	unix	IfAnnounceMsghdr	struct
2350	unix	RtMsghdr	struct
2351	unix	RtMetrics	struct
2352	unix	Mclpool	struct
2353	unix	BpfVersion	struct
2354	unix	BpfStat	struct
2355	unix	BpfProgram	struct
2356	unix	BpfInsn	struct
2357	unix	BpfHdr	struct
2358	unix	BpfTimeval	struct
2359	unix	Termios	struct
2360	unix	Winsize	struct
2361	unix	PollFd	struct
2362	unix	Utsname	struct
2363	unix	Timespec	struct
2364	unix	Timeval	struct
2365	unix	Rusage	struct
2366	unix	Rlimit	struct
2367	unix	Stat_t	struct
2368	unix	Statfs_t	struct
2369	unix	Flock_t	struct
2370	unix	Dirent	struct
2371	unix	Fsid	struct
2372	unix	RawSockaddrInet4	struct
2373	unix	RawSockaddrInet6	struct
2374	unix	RawSockaddrUnix	struct
2375	unix	RawSockaddrDatalink	struct
2376	unix	RawSockaddr	struct
2377	unix	RawSockaddrAny	struct
2378	unix	Linger	struct
2379	unix	Iovec	struct
2380	unix	IPMreq	struct
2381	unix	IPv6Mreq	struct
2382	unix	Msghdr	struct
2383	unix	Cmsghdr	struct
2384	unix	Inet6Pktinfo	struct
2385	unix	IPv6MTUInfo	struct
2386	unix	ICMPv6Filter	struct
2387	unix	Kevent_t	struct
2388	unix	FdSet	struct
2389	unix	IfMsghdr	struct
2390	unix	IfData	struct
2391	unix	IfaMsghdr	struct
2392	unix	IfAnnounceMsghdr	struct
2393	unix	RtMsghdr	struct
2394	unix	RtMetrics	struct
2395	unix	Mclpool	struct
2396	unix	BpfVersion	struct
2397	unix	BpfStat	struct
2398	unix	BpfProgram	struct
2399	unix	BpfInsn	struct
2400	unix	BpfHdr	struct
2401	unix	BpfTimeval	struct
2402	unix	Termios	struct
2403	unix	Winsize	struct
2404	unix	PollFd	struct
2405	unix	Utsname	struct
2406	unix	Timespec	struct
2407	unix	Timeval	struct
2408	unix	Rusage	struct
2409	unix	Rlimit	struct
2410	unix	Stat_t	struct
2411	unix	Statfs_t	struct
2412	unix	Flock_t	struct
2413	unix	Dirent	struct
2414	unix	Fsid	struct
2415	unix	RawSockaddrInet4	struct
2416	unix	RawSockaddrInet6	struct
2417	unix	RawSockaddrUnix	struct
2418	unix	RawSockaddrDatalink	struct
2419	unix	RawSockaddr	struct
2420	unix	RawSockaddrAny	struct
2421	unix	Linger	struct
2422	unix	Iovec	struct
2423	unix	IPMreq	struct
2424	unix	IPv6Mreq	struct
2425	unix	Msghdr	struct
2426	unix	Cmsghdr	struct
2427	unix	Inet6Pktinfo	struct
2428	unix	IPv6MTUInfo	struct
2429	unix	ICMPv6Filter	struct
2430	unix	Kevent_t	struct
2431	unix	FdSet	struct
2432	unix	IfMsghdr	struct
2433	unix	IfData	struct
2434	unix	IfaMsghdr	struct
2435	unix	IfAnnounceMsghdr	struct
2436	unix	RtMsghdr	struct
2437	unix	RtMetrics	struct
2438	unix	Mclpool	struct
2439	unix	BpfVersion	struct
2440	unix	BpfStat	struct
2441	unix	BpfProgram	struct
2442	unix	BpfInsn	struct
2443	unix	BpfHdr	struct
2444	unix	BpfTimeval	struct
2445	unix	Termios	struct
2446	unix	Winsize	struct
2447	unix	PollFd	struct
2448	unix	Utsname	struct
2449	unix	Timespec	struct
2450	unix	Timeval	struct
2451	unix	Timeval32	struct
2452	unix	Tms	struct
2453	unix	Utimbuf	struct
2454	unix	Rusage	struct
2455	unix	Rlimit	struct
2456	unix	Stat_t	struct
2457	unix	Flock_t	struct
2458	unix	Dirent	struct
2459	unix	Statvfs_t	struct
2460	unix	RawSockaddrInet4	struct
2461	unix	RawSockaddrInet6	struct
2462	unix	RawSockaddrUnix	struct
2463	unix	RawSockaddrDatalink	struct
2464	unix	RawSockaddr	struct
2465	unix	RawSockaddrAny	struct
2466	unix	Linger	struct
2467	unix	Iovec	struct
2468	unix	IPMreq	struct
2469	unix	IPv6Mreq	struct
2470	unix	Msghdr	struct
2471	unix	Cmsghdr	struct
2472	unix	Inet6Pktinfo	struct
2473	unix	IPv6MTUInfo	struct
2474	unix	ICMPv6Filter	struct
2475	unix	FdSet	struct
2476	unix	Utsname	struct
2477	unix	Ustat_t	struct
2478	unix	IfMsghdr	struct
2479	unix	IfData	struct
2480	unix	IfaMsghdr	struct
2481	unix	RtMsghdr	struct
2482	unix	RtMetrics	struct
2483	unix	BpfVersion	struct
2484	unix	BpfStat	struct
2485	unix	BpfProgram	struct
2486	unix	BpfInsn	struct
2487	unix	BpfTimeval	struct
2488	unix	BpfHdr	struct
2489	unix	Termios	struct
2490	unix	Termio	struct
2491	unix	Winsize	struct
2492	unix	PollFd	struct
2493	windows	DLLError	struct
2494	windows	DLL	struct
2495	windows	Proc	struct
2496	windows	LazyDLL	struct
2497	windows	LazyProc	struct
2498	registry	Key	syscall.Handle
2499	registry	KeyInfo	struct
2500	windows	UserInfo10	struct
2501	windows	SidIdentifierAuthority	struct
2502	windows	SID	struct
2503	windows	SIDAndAttributes	struct
2504	windows	Tokenuser	struct
2505	windows	Tokenprimarygroup	struct
2506	windows	Tokengroups	struct
2507	windows	Token	windows.Handle
2508	windows	SERVICE_STATUS	struct
2509	windows	SERVICE_TABLE_ENTRY	struct
2510	windows	QUERY_SERVICE_CONFIG	struct
2511	windows	SERVICE_DESCRIPTION	struct
2512	windows	SERVICE_STATUS_PROCESS	struct
2513	windows	ENUM_SERVICE_STATUS_PROCESS	struct
2514	debug	Log	
2515	debug	ConsoleLog	struct
2516	eventlog	Log	struct
2517	mgr	Config	struct
2518	mgr	Mgr	struct
2519	mgr	Service	struct
2520	svc	State	uint32
2521	svc	Cmd	uint32
2522	svc	Accepted	uint32
2523	svc	Status	struct
2524	svc	ChangeRequest	struct
2525	svc	Handler	
2526	windows	Handle	uintptr
2527	windows	RawSockaddrInet4	struct
2528	windows	RawSockaddrInet6	struct
2529	windows	RawSockaddr	struct
2530	windows	RawSockaddrAny	struct
2531	windows	Sockaddr	
2532	windows	SockaddrInet4	struct
2533	windows	SockaddrInet6	struct
2534	windows	SockaddrUnix	struct
2535	windows	Rusage	struct
2536	windows	WaitStatus	struct
2537	windows	Timespec	struct
2538	windows	Linger	struct
2539	windows	IPMreq	struct
2540	windows	IPv6Mreq	struct
2541	windows	Signal	int
2542	windows	Timeval	struct
2543	windows	SecurityAttributes	struct
2544	windows	Overlapped	struct
2545	windows	FileNotifyInformation	struct
2546	windows	Filetime	struct
2547	windows	Win32finddata	struct
2548	windows	ByHandleFileInformation	struct
2549	windows	Win32FileAttributeData	struct
2550	windows	StartupInfo	struct
2551	windows	ProcessInformation	struct
2552	windows	ProcessEntry32	struct
2553	windows	Systemtime	struct
2554	windows	Timezoneinformation	struct
2555	windows	WSABuf	struct
2556	windows	WSAMsg	struct
2557	windows	Hostent	struct
2558	windows	Protoent	struct
2559	windows	DNSSRVData	struct
2560	windows	DNSPTRData	struct
2561	windows	DNSMXData	struct
2562	windows	DNSTXTData	struct
2563	windows	DNSRecord	struct
2564	windows	TransmitFileBuffers	struct
2565	windows	SockaddrGen	[]byte
2566	windows	InterfaceInfo	struct
2567	windows	IpAddressString	struct
2568	windows	IpMaskString	windows.IpAddressString
2569	windows	IpAddrString	struct
2570	windows	IpAdapterInfo	struct
2571	windows	MibIfRow	struct
2572	windows	CertContext	struct
2573	windows	CertChainContext	struct
2574	windows	CertSimpleChain	struct
2575	windows	CertChainElement	struct
2576	windows	CertRevocationInfo	struct
2577	windows	CertTrustStatus	struct
2578	windows	CertUsageMatch	struct
2579	windows	CertEnhKeyUsage	struct
2580	windows	CertChainPara	struct
2581	windows	CertChainPolicyPara	struct
2582	windows	SSLExtraCertChainPolicyPara	struct
2583	windows	CertChainPolicyStatus	struct
2584	windows	AddrinfoW	struct
2585	windows	GUID	struct
2586	windows	WSAProtocolInfo	struct
2587	windows	WSAProtocolChain	struct
2588	windows	TCPKeepalive	struct
2589	windows	SocketAddress	struct
2590	windows	IpAdapterUnicastAddress	struct
2591	windows	IpAdapterAnycastAddress	struct
2592	windows	IpAdapterMulticastAddress	struct
2593	windows	IpAdapterDnsServerAdapter	struct
2594	windows	IpAdapterPrefix	struct
2595	windows	IpAdapterAddresses	struct
2596	windows	Coord	struct
2597	windows	SmallRect	struct
2598	windows	ConsoleScreenBufferInfo	struct
2599	windows	WSAData	struct
2600	windows	Servent	struct
2601	windows	WSAData	struct
2602	windows	Servent	struct
2603	cfg	CFG	struct
2604	cfg	Block	struct
2605	main	File	struct
2606	main	Package	struct
2607	main	MethodSig	struct
2608	main	Span	struct
2609	testdata	S	struct
2610	testdata	ST	struct
2611	testdata	Counter	uint64
2612	testdata	T	struct
2613	testdata	T	int
2614	testdata	FT	func() int
2615	testdata	MyStruct	struct
2616	testdata	Tlock	struct
2617	testdata	EmbeddedRWMutex	struct
2618	testdata	FieldMutex	struct
2619	testdata	L0	struct
2620	testdata	L1	struct
2621	testdata	L2	struct
2622	testdata	EmbeddedMutexPointer	struct
2623	testdata	EmbeddedLocker	struct
2624	testdata	CustomLock	struct
2625	testdata	LocalOnce	sync.Once
2626	testdata	LocalMutex	sync.Mutex
2627	testdata	T	int
2628	buf	Buf	[]byte
2629	testdata	MethodTest	int
2630	testdata	MethodTestInterface	
2631	testdata	T	struct
2632	testdata	BoolFormatter	bool
2633	testdata	FormatterVal	bool
2634	testdata	RecursiveSlice	[]testdata.RecursiveSlice
2635	testdata	RecursiveMap	map[int]testdata.RecursiveMap
2636	testdata	RecursiveStruct	struct
2637	testdata	RecursiveStruct1	struct
2638	testdata	RecursiveStruct2	struct
2639	testdata	T	struct
2640	testdata	StructTagTest	struct
2641	testdata	UnexportedEncodingTagTest	struct
2642	testdata	JSONEmbeddedField	struct
2643	testdata	AnonymousJSON	struct
2644	testdata	AnonymousXML	struct
2645	testdata	DuplicateJSONFields	struct
2646	testdata	UnexpectedSpacetest	struct
2647	testdata	V	
2648	testdata	StringHeader	struct
2649	testdata	SliceHeader	struct
2650	bzip2	StructuralError	string
2651	flate	Writer	struct
2652	flate	CorruptInputError	int64
2653	flate	InternalError	string
2654	flate	ReadError	struct
2655	flate	WriteError	struct
2656	flate	Resetter	
2657	flate	Reader	
2658	gzip	Header	struct
2659	gzip	Reader	struct
2660	gzip	Writer	struct
2661	lzw	Order	int
2662	zlib	Resetter	
2663	zlib	Writer	struct
2664	heap	Interface	
2665	list	Element	struct
2666	list	List	struct
2667	ring	Ring	struct
2668	context	Context	
2669	context	CancelFunc	func()
2670	aes	KeySizeError	int
2671	cipher	Block	
2672	cipher	Stream	
2673	cipher	BlockMode	
2674	cipher	AEAD	
2675	cipher	StreamReader	struct
2676	cipher	StreamWriter	struct
2677	crypto	Hash	uint
2678	crypto	PublicKey	interface{}
2679	crypto	PrivateKey	interface{}
2680	crypto	Signer	
2681	crypto	SignerOpts	
2682	crypto	Decrypter	
2683	crypto	DecrypterOpts	interface{}
2684	des	KeySizeError	int
2685	dsa	Parameters	struct
2686	dsa	PublicKey	struct
2687	dsa	PrivateKey	struct
2688	dsa	ParameterSizes	int
2689	ecdsa	PublicKey	struct
2690	ecdsa	PrivateKey	struct
2691	elliptic	Curve	
2692	elliptic	CurveParams	struct
2693	main	Data	struct
2694	rc4	Cipher	struct
2695	rc4	KeySizeError	int
2696	rsa	PKCS1v15DecryptOptions	struct
2697	rsa	PSSOptions	struct
2698	rsa	PublicKey	struct
2699	rsa	OAEPOptions	struct
2700	rsa	PrivateKey	struct
2701	rsa	PrecomputedValues	struct
2702	rsa	CRTValue	struct
2703	tls	CurveID	uint16
2704	tls	ConnectionState	struct
2705	tls	ClientAuthType	int
2706	tls	ClientSessionState	struct
2707	tls	ClientSessionCache	
2708	tls	SignatureScheme	uint16
2709	tls	ClientHelloInfo	struct
2710	tls	CertificateRequestInfo	struct
2711	tls	RenegotiationSupport	int
2712	tls	Config	struct
2713	tls	Certificate	struct
2714	tls	Conn	struct
2715	tls	RecordHeaderError	struct
2716	x509	CertPool	struct
2717	x509	PEMCipher	int
2718	pkix	AlgorithmIdentifier	struct
2719	pkix	RDNSequence	[]pkix.RelativeDistinguishedNameSET
2720	pkix	RelativeDistinguishedNameSET	[]pkix.AttributeTypeAndValue
2721	pkix	AttributeTypeAndValue	struct
2722	pkix	AttributeTypeAndValueSET	struct
2723	pkix	Extension	struct
2724	pkix	Name	struct
2725	pkix	CertificateList	struct
2726	pkix	TBSCertificateList	struct
2727	pkix	RevokedCertificate	struct
2728	x509	InvalidReason	int
2729	x509	CertificateInvalidError	struct
2730	x509	HostnameError	struct
2731	x509	UnknownAuthorityError	struct
2732	x509	SystemRootsError	struct
2733	x509	VerifyOptions	struct
2734	x509	SignatureAlgorithm	int
2735	x509	PublicKeyAlgorithm	int
2736	x509	KeyUsage	int
2737	x509	ExtKeyUsage	int
2738	x509	Certificate	struct
2739	x509	InsecureAlgorithmError	x509.SignatureAlgorithm
2740	x509	ConstraintViolationError	struct
2741	x509	UnhandledCriticalExtension	struct
2742	x509	CertificateRequest	struct
2743	driver	Value	interface{}
2744	driver	NamedValue	struct
2745	driver	Driver	
2746	driver	DriverContext	
2747	driver	Connector	
2748	driver	Pinger	
2749	driver	Execer	
2750	driver	ExecerContext	
2751	driver	Queryer	
2752	driver	QueryerContext	
2753	driver	Conn	
2754	driver	ConnPrepareContext	
2755	driver	IsolationLevel	int
2756	driver	TxOptions	struct
2757	driver	ConnBeginTx	
2758	driver	SessionResetter	
2759	driver	Result	
2760	driver	Stmt	
2761	driver	StmtExecContext	
2762	driver	StmtQueryContext	
2763	driver	NamedValueChecker	
2764	driver	ColumnConverter	
2765	driver	Rows	
2766	driver	RowsNextResultSet	
2767	driver	RowsColumnTypeScanType	
2768	driver	RowsColumnTypeDatabaseTypeName	
2769	driver	RowsColumnTypeLength	
2770	driver	RowsColumnTypeNullable	
2771	driver	RowsColumnTypePrecisionScale	
2772	driver	Tx	
2773	driver	RowsAffected	int64
2774	driver	ValueConverter	
2775	driver	Valuer	
2776	driver	Null	struct
2777	driver	NotNull	struct
2778	sql	NamedArg	struct
2779	sql	IsolationLevel	int
2780	sql	TxOptions	struct
2781	sql	RawBytes	[]byte
2782	sql	NullString	struct
2783	sql	NullInt64	struct
2784	sql	NullFloat64	struct
2785	sql	NullBool	struct
2786	sql	Scanner	
2787	sql	Out	struct
2788	sql	DB	struct
2789	sql	DBStats	struct
2790	sql	Conn	struct
2791	sql	Tx	struct
2792	sql	Stmt	struct
2793	sql	Rows	struct
2794	sql	ColumnType	struct
2795	sql	Row	struct
2796	sql	Result	
2797	dwarf	DecodeError	struct
2798	dwarf	Attr	uint32
2799	dwarf	Tag	uint32
2800	dwarf	Entry	struct
2801	dwarf	Field	struct
2802	dwarf	Class	int
2803	dwarf	Offset	uint32
2804	dwarf	Reader	struct
2805	dwarf	LineReader	struct
2806	dwarf	LineEntry	struct
2807	dwarf	LineFile	struct
2808	dwarf	LineReaderPos	struct
2809	dwarf	Data	struct
2810	dwarf	Type	
2811	dwarf	CommonType	struct
2812	dwarf	BasicType	struct
2813	dwarf	CharType	struct
2814	dwarf	UcharType	struct
2815	dwarf	IntType	struct
2816	dwarf	UintType	struct
2817	dwarf	FloatType	struct
2818	dwarf	ComplexType	struct
2819	dwarf	BoolType	struct
2820	dwarf	AddrType	struct
2821	dwarf	UnspecifiedType	struct
2822	dwarf	QualType	struct
2823	dwarf	ArrayType	struct
2824	dwarf	VoidType	struct
2825	dwarf	PtrType	struct
2826	dwarf	StructType	struct
2827	dwarf	StructField	struct
2828	dwarf	EnumType	struct
2829	dwarf	EnumValue	struct
2830	dwarf	FuncType	struct
2831	dwarf	DotDotDotType	struct
2832	dwarf	TypedefType	struct
2833	elf	Version	byte
2834	elf	Class	byte
2835	elf	Data	byte
2836	elf	OSABI	byte
2837	elf	Type	uint16
2838	elf	Machine	uint16
2839	elf	SectionIndex	int
2840	elf	SectionType	uint32
2841	elf	SectionFlag	uint32
2842	elf	CompressionType	int
2843	elf	ProgType	int
2844	elf	ProgFlag	uint32
2845	elf	DynTag	int
2846	elf	DynFlag	int
2847	elf	NType	int
2848	elf	SymBind	int
2849	elf	SymType	int
2850	elf	SymVis	int
2851	elf	R_X86_64	int
2852	elf	R_AARCH64	int
2853	elf	R_ALPHA	int
2854	elf	R_ARM	int
2855	elf	R_386	int
2856	elf	R_MIPS	int
2857	elf	R_PPC	int
2858	elf	R_PPC64	int
2859	elf	R_RISCV	int
2860	elf	R_390	int
2861	elf	R_SPARC	int
2862	elf	Header32	struct
2863	elf	Section32	struct
2864	elf	Prog32	struct
2865	elf	Dyn32	struct
2866	elf	Chdr32	struct
2867	elf	Rel32	struct
2868	elf	Rela32	struct
2869	elf	Sym32	struct
2870	elf	Header64	struct
2871	elf	Section64	struct
2872	elf	Prog64	struct
2873	elf	Dyn64	struct
2874	elf	Chdr64	struct
2875	elf	Rel64	struct
2876	elf	Rela64	struct
2877	elf	Sym64	struct
2878	elf	FileHeader	struct
2879	elf	File	struct
2880	elf	SectionHeader	struct
2881	elf	Section	struct
2882	elf	ProgHeader	struct
2883	elf	Prog	struct
2884	elf	Symbol	struct
2885	elf	FormatError	struct
2886	elf	ImportedSymbol	struct
2887	gosym	LineTable	struct
2888	gosym	Sym	struct
2889	gosym	Func	struct
2890	gosym	Obj	struct
2891	gosym	Table	struct
2892	gosym	UnknownFileError	string
2893	gosym	UnknownLineError	struct
2894	gosym	DecodingError	struct
2895	macho	FatFile	struct
2896	macho	FatArchHeader	struct
2897	macho	FatArch	struct
2898	macho	File	struct
2899	macho	Load	
2900	macho	LoadBytes	[]byte
2901	macho	SegmentHeader	struct
2902	macho	Segment	struct
2903	macho	SectionHeader	struct
2904	macho	Reloc	struct
2905	macho	Section	struct
2906	macho	Dylib	struct
2907	macho	Symtab	struct
2908	macho	Dysymtab	struct
2909	macho	Rpath	struct
2910	macho	Symbol	struct
2911	macho	FormatError	struct
2912	macho	FileHeader	struct
2913	macho	Type	uint32
2914	macho	Cpu	uint32
2915	macho	LoadCmd	uint32
2916	macho	Segment32	struct
2917	macho	Segment64	struct
2918	macho	SymtabCmd	struct
2919	macho	DysymtabCmd	struct
2920	macho	DylibCmd	struct
2921	macho	RpathCmd	struct
2922	macho	Thread	struct
2923	macho	Section32	struct
2924	macho	Section64	struct
2925	macho	Nlist32	struct
2926	macho	Nlist64	struct
2927	macho	Regs386	struct
2928	macho	RegsAMD64	struct
2929	macho	RelocTypeGeneric	int
2930	macho	RelocTypeX86_64	int
2931	macho	RelocTypeARM	int
2932	macho	RelocTypeARM64	int
2933	pe	File	struct
2934	pe	ImportDirectory	struct
2935	pe	FormatError	struct
2936	pe	FileHeader	struct
2937	pe	DataDirectory	struct
2938	pe	OptionalHeader32	struct
2939	pe	OptionalHeader64	struct
2940	pe	SectionHeader32	struct
2941	pe	Reloc	struct
2942	pe	SectionHeader	struct
2943	pe	Section	struct
2944	pe	StringTable	[]byte
2945	pe	COFFSymbol	struct
2946	pe	Symbol	struct
2947	plan9obj	FileHeader	struct
2948	plan9obj	File	struct
2949	plan9obj	SectionHeader	struct
2950	plan9obj	Section	struct
2951	plan9obj	Sym	struct
2952	ascii85	CorruptInputError	int64
2953	asn1	StructuralError	struct
2954	asn1	SyntaxError	struct
2955	asn1	BitString	struct
2956	asn1	ObjectIdentifier	[]int
2957	asn1	Enumerated	int
2958	asn1	Flag	bool
2959	asn1	RawValue	struct
2960	asn1	RawContent	[]byte
2961	base32	Encoding	struct
2962	base32	CorruptInputError	int64
2963	base64	Encoding	struct
2964	base64	CorruptInputError	int64
2965	binary	ByteOrder	
2966	csv	ParseError	struct
2967	csv	Reader	struct
2968	csv	Writer	struct
2969	encoding	BinaryMarshaler	
2970	encoding	BinaryUnmarshaler	
2971	encoding	TextMarshaler	
2972	encoding	TextUnmarshaler	
2973	main	Type	struct
2974	gob	Decoder	struct
2975	main	Type	struct
2976	gob	Encoder	struct
2977	gob	CommonType	struct
2978	gob	GobEncoder	
2979	gob	GobDecoder	
2980	hex	InvalidByteError	byte
2981	json	Unmarshaler	
2982	json	UnmarshalTypeError	struct
2983	json	UnmarshalFieldError	struct
2984	json	InvalidUnmarshalError	struct
2985	json	Number	string
2986	json	Marshaler	
2987	json	UnsupportedTypeError	struct
2988	json	UnsupportedValueError	struct
2989	json	InvalidUTF8Error	struct
2990	json	MarshalerError	struct
2991	json	SyntaxError	struct
2992	json	Decoder	struct
2993	json	Encoder	struct
2994	json	RawMessage	[]byte
2995	json	Token	interface{}
2996	json	Delim	rune
2997	pem	Block	struct
2998	xml	Marshaler	
2999	xml	MarshalerAttr	
3000	xml	Encoder	struct
3001	xml	UnsupportedTypeError	struct
3002	xml	UnmarshalError	string
3003	xml	Unmarshaler	
3004	xml	UnmarshalerAttr	
3005	xml	TagPathError	struct
3006	xml	SyntaxError	struct
3007	xml	Name	struct
3008	xml	Attr	struct
3009	xml	Token	interface{}
3010	xml	StartElement	struct
3011	xml	EndElement	struct
3012	xml	CharData	[]byte
3013	xml	Comment	[]byte
3014	xml	ProcInst	struct
3015	xml	Directive	[]byte
3016	xml	TokenReader	
3017	xml	Decoder	struct
3018	expvar	Var	
3019	expvar	Int	struct
3020	expvar	Float	struct
3021	expvar	Map	struct
3022	expvar	KeyValue	struct
3023	expvar	String	struct
3024	expvar	Func	func() interface{}
3025	flag	Value	
3026	flag	Getter	
3027	flag	ErrorHandling	int
3028	flag	FlagSet	struct
3029	flag	Flag	struct
3030	fmt	State	
3031	fmt	Formatter	
3032	fmt	Stringer	
3033	fmt	GoStringer	
3034	fmt	ScanState	
3035	fmt	Scanner	
3036	ast	Node	
3037	ast	Expr	
3038	ast	Stmt	
3039	ast	Decl	
3040	ast	Comment	struct
3041	ast	CommentGroup	struct
3042	ast	Field	struct
3043	ast	FieldList	struct
3044	ast	BadExpr	struct
3045	ast	Ident	struct
3046	ast	Ellipsis	struct
3047	ast	BasicLit	struct
3048	ast	FuncLit	struct
3049	ast	CompositeLit	struct
3050	ast	ParenExpr	struct
3051	ast	SelectorExpr	struct
3052	ast	IndexExpr	struct
3053	ast	SliceExpr	struct
3054	ast	TypeAssertExpr	struct
3055	ast	CallExpr	struct
3056	ast	StarExpr	struct
3057	ast	UnaryExpr	struct
3058	ast	BinaryExpr	struct
3059	ast	KeyValueExpr	struct
3060	ast	ChanDir	int
3061	ast	ArrayType	struct
3062	ast	StructType	struct
3063	ast	FuncType	struct
3064	ast	InterfaceType	struct
3065	ast	MapType	struct
3066	ast	ChanType	struct
3067	ast	BadStmt	struct
3068	ast	DeclStmt	struct
3069	ast	EmptyStmt	struct
3070	ast	LabeledStmt	struct
3071	ast	ExprStmt	struct
3072	ast	SendStmt	struct
3073	ast	IncDecStmt	struct
3074	ast	AssignStmt	struct
3075	ast	GoStmt	struct
3076	ast	DeferStmt	struct
3077	ast	ReturnStmt	struct
3078	ast	BranchStmt	struct
3079	ast	BlockStmt	struct
3080	ast	IfStmt	struct
3081	ast	CaseClause	struct
3082	ast	SwitchStmt	struct
3083	ast	TypeSwitchStmt	struct
3084	ast	CommClause	struct
3085	ast	SelectStmt	struct
3086	ast	ForStmt	struct
3087	ast	RangeStmt	struct
3088	ast	Spec	
3089	ast	ImportSpec	struct
3090	ast	ValueSpec	struct
3091	ast	TypeSpec	struct
3092	ast	BadDecl	struct
3093	ast	GenDecl	struct
3094	ast	FuncDecl	struct
3095	ast	File	struct
3096	ast	Package	struct
3097	ast	CommentMap	map[ast.Node][]*ast.CommentGroup
3098	ast	Filter	func(string) bool
3099	ast	MergeMode	uint
3100	ast	FieldFilter	func(string, reflect.Value) bool
3101	ast	Importer	func(map[string]*ast.Object, string) (*ast.Object, error)
3102	ast	Scope	struct
3103	ast	Object	struct
3104	ast	ObjKind	int
3105	ast	Visitor	
3106	build	Context	struct
3107	build	ImportMode	uint
3108	build	Package	struct
3109	build	NoGoError	struct
3110	build	MultiplePackageError	struct
3111	constant	Kind	int
3112	constant	Value	
3113	doc	Package	struct
3114	doc	Value	struct
3115	doc	Type	struct
3116	doc	Func	struct
3117	doc	Note	struct
3118	doc	Mode	int
3119	doc	Example	struct
3120	doc	Filter	func(string) bool
3121	b	T	struct
3122	testing	InternalBenchmark	struct
3123	testing	B	struct
3124	testing	BenchmarkResult	struct
3125	blank	T	int
3126	blank	S	struct
3127	c	A	struct
3128	c	B	struct
3129	c	C	struct
3130	c	D	struct
3131	c	E1	struct
3132	c	E2	struct
3133	c	E3	struct
3134	c	E4	struct
3135	c	T1	struct
3136	c	T2	struct
3137	d	T2	struct
3138	d	TG2	struct
3139	d	TG1	struct
3140	d	TG0	struct
3141	d	T1	struct
3142	d	T0	struct
3143	e	T1	struct
3144	e	T2	struct
3145	e	T3	struct
3146	e	T4	struct
3147	e	T4	struct
3148	e	T5	struct
3149	e	U1	struct
3150	e	U2	struct
3151	e	U3	struct
3152	e	U4	struct
3153	e	V1	struct
3154	e	V2	struct
3155	e	V3	struct
3156	e	V4	struct
3157	e	V5	struct
3158	e	V6	struct
3159	error1	I0	
3160	error1	T0	struct
3161	error1	S0	struct
3162	error2	I0	
3163	error2	T0	struct
3164	error2	S0	struct
3165	testing	InternalExample	struct
3166	issue12839	T1	struct
3167	issue12839	T2	struct
3168	issue22856	T	struct
3169	testing	T	struct
3170	testing	InternalTest	struct
3171	importer	Lookup	func(string) (io.ReadCloser, error)
3172	gccgoimporter	GccgoInstallation	struct
3173	gccgoimporter	PackageInit	struct
3174	gccgoimporter	InitData	struct
3175	gccgoimporter	Importer	func(map[string]*types.Package, string, func(string) (io.ReadCloser, error)) (*types.Package, error)
3176	conversions	Units	string
3177	escapeinfo	T	struct
3178	pointer	Int8Ptr	*int8
3179	a	A	struct
3180	b	A	a.A
3181	exports	T1	int
3182	exports	T2	[]int
3183	exports	T3	[]int
3184	exports	T4	*int
3185	exports	T5	chan int\n
3186	exports	T6a	chan int\n
3187	exports	T6b	chan (chan int\n)\n
3188	exports	T6c	chan (chan int\n)\n
3189	exports	T7	chan *ast.File\n
3190	exports	T8	struct
3191	exports	T9	struct
3192	exports	T10	struct
3193	exports	T11	map[int]string
3194	exports	T12	interface{}
3195	exports	T13	
3196	exports	T14	
3197	exports	T15	func()
3198	exports	T16	func(int)
3199	exports	T17	func(int)
3200	exports	T18	func() float32
3201	exports	T19	func() float32
3202	exports	T20	func(...interface{})
3203	exports	T21	struct
3204	exports	T22	struct
3205	exports	T23	struct
3206	exports	T24	*exports.T24
3207	exports	T25	*exports.T26
3208	exports	T26	*exports.T27
3209	exports	T27	*exports.T25
3210	exports	T28	func(exports.T28) exports.T28
3211	p	Error	error
3212	issue25301	A	
3213	issue25301	T	
3214	issue25301	S	struct
3215	issue25596	E	
3216	issue25596	T	
3217	test	BlankField	struct
3218	srcimporter	Importer	struct
3219	parser	Mode	uint
3220	printer	Mode	uint
3221	printer	Config	struct
3222	printer	CommentedNode	struct
3223	scanner	Error	struct
3224	scanner	ErrorList	[]*scanner.Error
3225	scanner	ErrorHandler	func(token.Position, string)
3226	scanner	Scanner	struct
3227	scanner	Mode	uint
3228	token	Position	struct
3229	token	Pos	int
3230	token	File	struct
3231	token	FileSet	struct
3232	token	Token	int
3233	types	Error	struct
3234	types	Importer	
3235	types	ImportMode	int
3236	types	ImporterFrom	
3237	types	Config	struct
3238	types	Info	struct
3239	types	TypeAndValue	struct
3240	types	Initializer	struct
3241	types	Checker	struct
3242	types	MethodSet	struct
3243	types	Object	
3244	types	PkgName	struct
3245	types	Const	struct
3246	types	TypeName	struct
3247	types	Var	struct
3248	types	Func	struct
3249	types	Label	struct
3250	types	Builtin	struct
3251	types	Nil	struct
3252	types	Package	struct
3253	types	Scope	struct
3254	types	SelectionKind	int
3255	types	Selection	struct
3256	types	Sizes	
3257	types	StdSizes	struct
3258	types	Type	
3259	types	BasicKind	int
3260	types	BasicInfo	int
3261	types	Basic	struct
3262	types	Array	struct
3263	types	Slice	struct
3264	types	Struct	struct
3265	types	Pointer	struct
3266	types	Tuple	struct
3267	types	Signature	struct
3268	types	Interface	struct
3269	types	Map	struct
3270	types	Chan	struct
3271	types	ChanDir	int
3272	types	Named	struct
3273	types	Qualifier	func(*types.Package) string
3274	crc32	Table	[]uint32
3275	crc64	Table	[]uint64
3276	hash	Hash	
3277	hash	Hash32	
3278	hash	Hash64	
3279	template	CSS	string
3280	template	HTML	string
3281	template	HTMLAttr	string
3282	template	JS	string
3283	template	JSStr	string
3284	template	URL	string
3285	template	Srcset	string
3286	template	Error	struct
3287	template	ErrorCode	int
3288	template	Template	struct
3289	template	FuncMap	map[string]interface{}
3290	color	Color	
3291	color	RGBA	struct
3292	color	RGBA64	struct
3293	color	NRGBA	struct
3294	color	NRGBA64	struct
3295	color	Alpha	struct
3296	color	Alpha16	struct
3297	color	Gray	struct
3298	color	Gray16	struct
3299	color	Model	
3300	color	Palette	[]color.Color
3301	color	YCbCr	struct
3302	color	NYCbCrA	struct
3303	color	CMYK	struct
3304	draw	Image	
3305	draw	Quantizer	
3306	draw	Op	int
3307	draw	Drawer	
3308	image	Point	struct
3309	image	Rectangle	struct
3310	gif	GIF	struct
3311	gif	Options	struct
3312	image	Config	struct
3313	image	Image	
3314	image	PalettedImage	
3315	image	RGBA	struct
3316	image	RGBA64	struct
3317	image	NRGBA	struct
3318	image	NRGBA64	struct
3319	image	Alpha	struct
3320	image	Alpha16	struct
3321	image	Gray	struct
3322	image	Gray16	struct
3323	image	CMYK	struct
3324	image	Paletted	struct
3325	jpeg	FormatError	string
3326	jpeg	UnsupportedError	string
3327	jpeg	Reader	
3328	jpeg	Options	struct
3329	image	Uniform	struct
3330	png	FormatError	string
3331	png	UnsupportedError	string
3332	png	Encoder	struct
3333	png	EncoderBufferPool	
3334	png	EncoderBuffer	png.encoder
3335	png	CompressionLevel	int
3336	image	YCbCrSubsampleRatio	int
3337	image	YCbCr	struct
3338	image	NYCbCrA	struct
3339	suffixarray	Index	struct
3340	nettrace	TraceKey	struct
3341	nettrace	LookupIPAltResolverKey	struct
3342	nettrace	Trace	struct
3343	poll	TimeoutError	struct
3344	poll	FD	struct
3345	poll	FD	struct
3346	poll	FD	struct
3347	singleflight	Group	struct
3348	singleflight	Result	struct
3349	unix	GetRandomFlag	uintptr
3350	windows	PROCESS_MEMORY_COUNTERS	struct
3351	registry	Key	syscall.Handle
3352	registry	KeyInfo	struct
3353	windows	REPARSE_DATA_BUFFER_HEADER	struct
3354	windows	SymbolicLinkReparseBuffer	struct
3355	windows	MountPointReparseBuffer	struct
3356	windows	LUID	struct
3357	windows	LUID_AND_ATTRIBUTES	struct
3358	windows	TOKEN_PRIVILEGES	struct
3359	windows	SID_AND_ATTRIBUTES	struct
3360	windows	TOKEN_MANDATORY_LABEL	struct
3361	windows	TokenType	uint32
3362	windows	LocalGroupUserInfo0	struct
3363	windows	UserInfo4	struct
3364	windows	SocketAddress	struct
3365	windows	IpAdapterUnicastAddress	struct
3366	windows	IpAdapterAnycastAddress	struct
3367	windows	IpAdapterMulticastAddress	struct
3368	windows	IpAdapterDnsServerAdapter	struct
3369	windows	IpAdapterPrefix	struct
3370	windows	IpAdapterAddresses	struct
3371	windows	WSAMsg	struct
3372	windows	SHARE_INFO_2	struct
3373	testlog	Interface	
3374	trace	GDesc	struct
3375	trace	UserRegionDesc	struct
3376	trace	GExecutionStat	struct
3377	trace	Event	struct
3378	trace	Frame	struct
3379	trace	ParseResult	struct
3380	trace	G	struct
3381	trace	Writer	struct
3382	io	Reader	
3383	io	Writer	
3384	io	Closer	
3385	io	Seeker	
3386	io	ReadWriter	
3387	io	ReadCloser	
3388	io	WriteCloser	
3389	io	ReadWriteCloser	
3390	io	ReadSeeker	
3391	io	WriteSeeker	
3392	io	ReadWriteSeeker	
3393	io	ReaderFrom	
3394	io	WriterTo	
3395	io	ReaderAt	
3396	io	WriterAt	
3397	io	ByteReader	
3398	io	ByteScanner	
3399	io	ByteWriter	
3400	io	RuneReader	
3401	io	RuneScanner	
3402	io	LimitedReader	struct
3403	io	SectionReader	struct
3404	io	PipeReader	struct
3405	io	PipeWriter	struct
3406	log	Logger	struct
3407	syslog	Priority	int
3408	syslog	Writer	struct
3409	big	Word	uint
3410	big	Float	struct
3411	big	ErrNaN	struct
3412	big	RoundingMode	byte
3413	big	Accuracy	int8
3414	big	Int	struct
3415	big	Rat	struct
3416	rand	Source	
3417	rand	Source64	
3418	rand	Rand	struct
3419	rand	Zipf	struct
3420	mime	WordEncoder	byte
3421	mime	WordDecoder	struct
3422	multipart	Form	struct
3423	multipart	FileHeader	struct
3424	multipart	File	
3425	multipart	Part	struct
3426	multipart	Reader	struct
3427	multipart	Writer	struct
3428	quotedprintable	Reader	struct
3429	quotedprintable	Writer	struct
3430	net	Dialer	struct
3431	net	ListenConfig	struct
3432	net	SRV	struct
3433	net	MX	struct
3434	net	NS	struct
3435	cgi	Handler	struct
3436	http	Client	struct
3437	http	RoundTripper	
3438	http	Cookie	struct
3439	http	SameSite	int
3440	cookiejar	PublicSuffixList	
3441	cookiejar	Options	struct
3442	cookiejar	Jar	struct
3443	http	Dir	string
3444	http	FileSystem	
3445	http	File	
3446	http	I	
3447	http	Header	map[string][]string
3448	http	PushOptions	struct
3449	http	Pusher	
3450	httptest	ResponseRecorder	struct
3451	httptest	Server	struct
3452	httptrace	ClientTrace	struct
3453	httptrace	WroteRequestInfo	struct
3454	httptrace	DNSStartInfo	struct
3455	httptrace	DNSDoneInfo	struct
3456	httptrace	GotConnInfo	struct
3457	httputil	ServerConn	struct
3458	httputil	ClientConn	struct
3459	httputil	ReverseProxy	struct
3460	httputil	BufferPool	
3461	internal	FlushAfterChunkWriter	struct
3462	http	CookieJar	
3463	http	ProtocolError	struct
3464	http	Request	struct
3465	http	Response	struct
3466	http	Handler	
3467	http	ResponseWriter	
3468	http	Flusher	
3469	http	Hijacker	
3470	http	CloseNotifier	
3471	http	HandlerFunc	func(http.ResponseWriter, *http.Request)
3472	http	ServeMux	struct
3473	http	Server	struct
3474	http	ConnState	int
3475	http	Transport	struct
3476	main	Counter	struct
3477	main	Chan	chan int\n
3478	net	Interface	struct
3479	net	Flags	uint
3480	socktest	Switch	struct
3481	socktest	Cookie	uint64
3482	socktest	Status	struct
3483	socktest	Stat	struct
3484	socktest	FilterType	int
3485	socktest	Filter	func(*socktest.Status) (socktest.AfterFilter, error)
3486	socktest	AfterFilter	func(*socktest.Status) error
3487	socktest	Sockets	map[int]socktest.Status
3488	socktest	Sockets	map[int]socktest.Status
3489	socktest	Sockets	map[syscall.Handle]socktest.Status
3490	net	IP	[]byte
3491	net	IPMask	[]byte
3492	net	IPNet	struct
3493	net	IPAddr	struct
3494	net	IPConn	struct
3495	net	Resolver	struct
3496	net	HardwareAddr	[]byte
3497	mail	Message	struct
3498	mail	Header	map[string][]string
3499	mail	Address	struct
3500	mail	AddressParser	struct
3501	net	Addr	
3502	net	Conn	
3503	net	PacketConn	
3504	net	Listener	
3505	net	Error	
3506	net	OpError	struct
3507	net	ParseError	struct
3508	net	AddrError	struct
3509	net	UnknownNetworkError	string
3510	net	InvalidAddrError	string
3511	net	DNSConfigError	struct
3512	net	DNSError	struct
3513	net	Buffers	[][]byte
3514	rpc	ServerError	string
3515	rpc	Call	struct
3516	rpc	Client	struct
3517	rpc	ClientCodec	
3518	rpc	Request	struct
3519	rpc	Response	struct
3520	rpc	Server	struct
3521	rpc	ServerCodec	
3522	smtp	Auth	
3523	smtp	ServerInfo	struct
3524	smtp	Client	struct
3525	net	TCPAddr	struct
3526	net	TCPConn	struct
3527	net	TCPListener	struct
3528	textproto	MIMEHeader	map[string][]string
3529	textproto	Pipeline	struct
3530	textproto	Reader	struct
3531	textproto	Error	struct
3532	textproto	ProtocolError	string
3533	textproto	Conn	struct
3534	textproto	Writer	struct
3535	net	UDPAddr	struct
3536	net	UDPConn	struct
3537	net	UnixAddr	struct
3538	net	UnixConn	struct
3539	net	UnixListener	struct
3540	url	Error	struct
3541	url	EscapeError	string
3542	url	InvalidHostError	string
3543	url	URL	struct
3544	url	Userinfo	struct
3545	url	Values	map[string][]string
3546	os	PathError	struct
3547	os	SyscallError	struct
3548	exec	Error	struct
3549	exec	Cmd	struct
3550	exec	F	func(*exec.Cmd) (*os.File, error)
3551	exec	ExitError	struct
3552	os	Process	struct
3553	os	ProcAttr	struct
3554	os	Signal	
3555	os	ProcessState	struct
3556	os	ProcessState	struct
3557	os	LinkError	struct
3558	pty	PtyError	struct
3559	os	File	struct
3560	os	FileInfo	
3561	os	FileMode	uint32
3562	user	User	struct
3563	user	Group	struct
3564	user	UnknownUserIdError	int
3565	user	UnknownUserError	string
3566	user	UnknownGroupIdError	string
3567	user	UnknownGroupError	string
3568	filepath	WalkFunc	func(string, os.FileInfo, error) error
3569	plugin	Plugin	struct
3570	plugin	Symbol	interface{}
3571	reflect	Type	
3572	reflect	Kind	uint
3573	reflect	ChanDir	int
3574	reflect	Method	struct
3575	reflect	StructField	struct
3576	reflect	StructTag	string
3577	reflect	Value	struct
3578	reflect	ValueError	struct
3579	reflect	StringHeader	struct
3580	reflect	SliceHeader	struct
3581	reflect	SelectDir	int
3582	reflect	SelectCase	struct
3583	regexp	Regexp	struct
3584	syntax	Error	struct
3585	syntax	ErrorCode	string
3586	syntax	Flags	uint16
3587	syntax	Prog	struct
3588	syntax	InstOp	uint8
3589	syntax	EmptyOp	uint8
3590	syntax	Inst	struct
3591	syntax	Regexp	struct
3592	syntax	Op	uint8
3593	debug	GCStats	struct
3594	runtime	Usigset	C.__sigset_t
3595	runtime	Fpxreg	C.struct__libc_fpxreg
3596	runtime	Xmmreg	C.struct__libc_xmmreg
3597	runtime	Fpstate	C.struct__libc_fpstate
3598	runtime	Fpxreg1	C.struct__fpxreg
3599	runtime	Xmmreg1	C.struct__xmmreg
3600	runtime	Fpstate1	C.struct__fpstate
3601	runtime	Fpreg1	C.struct__fpreg
3602	runtime	StackT	C.stack_t
3603	runtime	Mcontext	C.mcontext_t
3604	runtime	Ucontext	C.ucontext_t
3605	runtime	Sigcontext	C.struct_sigcontext
3606	runtime	Fpreg	C.struct__fpreg
3607	runtime	Fpxreg	C.struct__fpxreg
3608	runtime	Xmmreg	C.struct__xmmreg
3609	runtime	Fpstate	C.struct__fpstate
3610	runtime	Timespec	C.struct_timespec
3611	runtime	Timeval	C.struct_timeval
3612	runtime	Sigaction	C.struct_kernel_sigaction
3613	runtime	Siginfo	C.siginfo_t
3614	runtime	StackT	C.stack_t
3615	runtime	Sigcontext	C.struct_sigcontext
3616	runtime	Ucontext	C.struct_ucontext
3617	runtime	Itimerval	C.struct_itimerval
3618	runtime	EpollEvent	C.struct_epoll_event
3619	runtime	Usigset	C.__sigset_t
3620	runtime	Ptregs	C.struct_pt_regs
3621	runtime	Gregset	C.elf_gregset_t
3622	runtime	FPregset	C.elf_fpregset_t
3623	runtime	Vreg	C.elf_vrreg_t
3624	runtime	StackT	C.stack_t
3625	runtime	Sigcontext	C.struct_sigcontext
3626	runtime	Ucontext	C.struct_ucontext
3627	runtime	Timespec	C.struct_timespec
3628	runtime	StackT	C.stack_t
3629	runtime	Sigcontext	C.struct_sigcontext
3630	runtime	Ucontext	C.struct_ucontext
3631	runtime	Timeval	C.struct_timeval
3632	runtime	Itimerval	C.struct_itimerval
3633	runtime	Siginfo	C.struct_xsiginfo
3634	runtime	Sigaction	C.struct_xsigaction
3635	runtime	StackT	C.struct_sigaltstack
3636	runtime	Sighandler	C.union___sigaction_u
3637	runtime	Sigaction	C.struct___sigaction
3638	runtime	Usigaction	C.struct_sigaction
3639	runtime	Sigset	C.sigset_t
3640	runtime	Sigval	C.union_sigval
3641	runtime	Siginfo	C.siginfo_t
3642	runtime	Timeval	C.struct_timeval
3643	runtime	Itimerval	C.struct_itimerval
3644	runtime	Timespec	C.struct_timespec
3645	runtime	FPControl	C.struct_fp_control
3646	runtime	FPStatus	C.struct_fp_status
3647	runtime	RegMMST	C.struct_mmst_reg
3648	runtime	RegXMM	C.struct_xmm_reg
3649	runtime	Regs64	C.struct_x86_thread_state64
3650	runtime	FloatState64	C.struct_x86_float_state64
3651	runtime	ExceptionState64	C.struct_x86_exception_state64
3652	runtime	Mcontext64	C.struct_mcontext64
3653	runtime	Regs32	C.struct_i386_thread_state
3654	runtime	FloatState32	C.struct_i386_float_state
3655	runtime	ExceptionState32	C.struct_i386_exception_state
3656	runtime	Mcontext32	C.struct_mcontext32
3657	runtime	Ucontext	C.struct_ucontext
3658	runtime	Kevent	C.struct_kevent
3659	runtime	Pthread	C.pthread_t
3660	runtime	PthreadAttr	C.pthread_attr_t
3661	runtime	PthreadMutex	C.pthread_mutex_t
3662	runtime	PthreadMutexAttr	C.pthread_mutexattr_t
3663	runtime	PthreadCond	C.pthread_cond_t
3664	runtime	PthreadCondAttr	C.pthread_condattr_t
3665	runtime	MachTimebaseInfo	C.mach_timebase_info_data_t
3666	runtime	Rtprio	C.struct_rtprio
3667	runtime	Lwpparams	C.struct_lwp_params
3668	runtime	Sigset	C.struct___sigset
3669	runtime	StackT	C.stack_t
3670	runtime	Siginfo	C.siginfo_t
3671	runtime	Mcontext	C.mcontext_t
3672	runtime	Ucontext	C.ucontext_t
3673	runtime	Timespec	C.struct_timespec
3674	runtime	Timeval	C.struct_timeval
3675	runtime	Itimerval	C.struct_itimerval
3676	runtime	Kevent	C.struct_kevent
3677	runtime	Rtprio	C.struct_rtprio
3678	runtime	ThrParam	C.struct_thr_param
3679	runtime	Sigset	C.struct___sigset
3680	runtime	StackT	C.stack_t
3681	runtime	Siginfo	C.siginfo_t
3682	runtime	Mcontext	C.mcontext_t
3683	runtime	Ucontext	C.ucontext_t
3684	runtime	Timespec	C.struct_timespec
3685	runtime	Timeval	C.struct_timeval
3686	runtime	Itimerval	C.struct_itimerval
3687	runtime	Umtx_time	C.struct__umtx_time
3688	runtime	Kevent	C.struct_kevent
3689	runtime	Sigset	C.sigset_t
3690	runtime	Timespec	C.struct_timespec
3691	runtime	Timeval	C.struct_timeval
3692	runtime	Sigaction	C.struct_sigaction
3693	runtime	Siginfo	C.siginfo_t
3694	runtime	Itimerval	C.struct_itimerval
3695	runtime	EpollEvent	C.struct_epoll_event
3696	runtime	Sigset	C.sigset_t
3697	runtime	Siginfo	C.struct__ksiginfo
3698	runtime	StackT	C.stack_t
3699	runtime	Timespec	C.struct_timespec
3700	runtime	Timeval	C.struct_timeval
3701	runtime	Itimerval	C.struct_itimerval
3702	runtime	McontextT	C.mcontext_t
3703	runtime	UcontextT	C.ucontext_t
3704	runtime	Kevent	C.struct_kevent
3705	runtime	TforkT	C.struct___tfork
3706	runtime	Sigcontext	C.struct_sigcontext
3707	runtime	Siginfo	C.siginfo_t
3708	runtime	Sigset	C.sigset_t
3709	runtime	Sigval	C.union_sigval
3710	runtime	StackT	C.stack_t
3711	runtime	Timespec	C.struct_timespec
3712	runtime	Timeval	C.struct_timeval
3713	runtime	Itimerval	C.struct_itimerval
3714	runtime	KeventT	C.struct_kevent
3715	runtime	SemT	C.sem_t
3716	runtime	Sigset	C.sigset_t
3717	runtime	StackT	C.stack_t
3718	runtime	Siginfo	C.siginfo_t
3719	runtime	Sigaction	C.struct_sigaction
3720	runtime	Fpregset	C.fpregset_t
3721	runtime	Mcontext	C.mcontext_t
3722	runtime	Ucontext	C.ucontext_t
3723	runtime	Timespec	C.struct_timespec
3724	runtime	Timeval	C.struct_timeval
3725	runtime	Itimerval	C.struct_itimerval
3726	runtime	PortEvent	C.port_event_t
3727	runtime	Pthread	C.pthread_t
3728	runtime	PthreadAttr	C.pthread_attr_t
3729	runtime	Stat	C.struct_stat
3730	runtime	SystemInfo	C.SYSTEM_INFO
3731	runtime	ExceptionRecord	C.EXCEPTION_RECORD
3732	runtime	FloatingSaveArea	C.FLOATING_SAVE_AREA
3733	runtime	M128a	C.M128A
3734	runtime	Context	C.CONTEXT
3735	runtime	Overlapped	C.OVERLAPPED
3736	runtime	MemoryBasicInformation	C.MEMORY_BASIC_INFORMATION
3737	runtime	Error	
3738	runtime	TypeAssertionError	struct
3739	sys	ArchFamilyType	int
3740	sys	Uintreg	uint32
3741	sys	Uintreg	uint64
3742	sys	Uintreg	uint64
3743	sys	Uintreg	uint32
3744	sys	Uintreg	uint64
3745	sys	Uintreg	uint32
3746	sys	Uintreg	uint64
3747	sys	Uintreg	uint64
3748	sys	Uintreg	uint32
3749	sys	Uintreg	uint64
3750	sys	Uintreg	uint64
3751	sys	Uintreg	uint64
3752	sys	Uintreg	uint64
3753	runtime	StackRecord	struct
3754	runtime	MemProfileRecord	struct
3755	runtime	BlockProfileRecord	struct
3756	runtime	MemStats	struct
3757	profile	TagMatch	func(string, int64) bool
3758	profile	Profile	struct
3759	profile	ValueType	struct
3760	profile	Sample	struct
3761	profile	Label	struct
3762	profile	Mapping	struct
3763	profile	Location	struct
3764	profile	Line	struct
3765	profile	Function	struct
3766	profile	Demangler	func([]string) (map[string]string, error)
3767	pprof	LabelSet	struct
3768	pprof	Profile	struct
3769	runtime	Frames	struct
3770	runtime	Frame	struct
3771	runtime	Func	struct
3772	trace	Task	struct
3773	trace	Region	struct
3774	sort	Interface	
3775	sort	IntSlice	[]int
3776	sort	Float64Slice	[]float64
3777	sort	StringSlice	[]string
3778	strconv	NumError	struct
3779	strings	Builder	struct
3780	strings	Reader	struct
3781	strings	Replacer	struct
3782	atomic	Value	struct
3783	sync	Cond	struct
3784	sync	Map	struct
3785	sync	Mutex	struct
3786	sync	Locker	
3787	sync	Once	struct
3788	sync	Pool	struct
3789	sync	RWMutex	struct
3790	sync	WaitGroup	struct
3791	syscall	Qid	struct
3792	syscall	Dir	struct
3793	syscall	DLLError	struct
3794	syscall	DLL	struct
3795	syscall	Proc	struct
3796	syscall	LazyDLL	struct
3797	syscall	LazyProc	struct
3798	syscall	SysProcAttr	struct
3799	syscall	SysProcIDMap	struct
3800	syscall	SysProcAttr	struct
3801	syscall	ProcAttr	struct
3802	syscall	SysProcAttr	struct
3803	syscall	SysProcAttr	struct
3804	syscall	Credential	struct
3805	syscall	ProcAttr	struct
3806	syscall	ProcAttr	struct
3807	syscall	SysProcAttr	struct
3808	js	Callback	struct
3809	js	EventCallbackFlag	int
3810	js	Value	struct
3811	js	Error	struct
3812	js	Type	int
3813	js	ValueError	struct
3814	js	TypedArray	struct
3815	main	Param	struct
3816	main	Rets	struct
3817	main	Fn	struct
3818	main	Source	struct
3819	syscall	RawConn	
3820	syscall	Conn	
3821	syscall	Sockaddr	interface{}
3822	syscall	SockaddrInet4	struct
3823	syscall	SockaddrInet6	struct
3824	syscall	SockaddrUnix	struct
3825	syscall	Sockaddr	
3826	syscall	SockaddrInet4	struct
3827	syscall	SockaddrInet6	struct
3828	syscall	SockaddrUnix	struct
3829	syscall	SockaddrDatalink	struct
3830	syscall	RoutingMessage	
3831	syscall	IPMreq	struct
3832	syscall	IPv6Mreq	struct
3833	syscall	Linger	struct
3834	syscall	ICMPv6Filter	struct
3835	syscall	NetlinkRouteRequest	struct
3836	syscall	NetlinkMessage	struct
3837	syscall	NetlinkRouteAttr	struct
3838	syscall	RoutingMessage	
3839	syscall	RouteMessage	struct
3840	syscall	InterfaceMessage	struct
3841	syscall	InterfaceAddrMessage	struct
3842	syscall	InterfaceMulticastAddrMessage	struct
3843	syscall	InterfaceAnnounceMessage	struct
3844	syscall	InterfaceMulticastAddrMessage	struct
3845	syscall	InterfaceAnnounceMessage	struct
3846	syscall	InterfaceMulticastAddrMessage	struct
3847	syscall	InterfaceAnnounceMessage	struct
3848	syscall	InterfaceAnnounceMessage	struct
3849	syscall	UserInfo10	struct
3850	syscall	SID	struct
3851	syscall	SIDAndAttributes	struct
3852	syscall	Tokenuser	struct
3853	syscall	Tokenprimarygroup	struct
3854	syscall	Token	syscall.Handle
3855	syscall	SocketControlMessage	struct
3856	syscall	WaitStatus	uint32
3857	syscall	SockaddrDatalink	struct
3858	syscall	SockaddrDatalink	struct
3859	syscall	SockaddrDatalink	struct
3860	syscall	Dirent	struct
3861	syscall	Errno	uintptr
3862	syscall	Signal	int
3863	syscall	Stat_t	struct
3864	syscall	WaitStatus	uint32
3865	syscall	Rusage	struct
3866	syscall	ProcAttr	struct
3867	syscall	SysProcAttr	struct
3868	syscall	Iovec	struct
3869	syscall	Timespec	struct
3870	syscall	Timeval	struct
3871	syscall	WaitStatus	uint32
3872	syscall	SockaddrLinklayer	struct
3873	syscall	SockaddrNetlink	struct
3874	syscall	Dirent	struct
3875	syscall	Errno	uintptr
3876	syscall	Signal	int
3877	syscall	Stat_t	struct
3878	syscall	WaitStatus	uint32
3879	syscall	Rusage	struct
3880	syscall	ProcAttr	struct
3881	syscall	SysProcAttr	struct
3882	syscall	Iovec	struct
3883	syscall	Timespec	struct
3884	syscall	Timeval	struct
3885	syscall	Timespec	struct
3886	syscall	Timeval	struct
3887	syscall	Timespec	struct
3888	syscall	Timeval	struct
3889	syscall	SockaddrDatalink	struct
3890	syscall	SockaddrDatalink	struct
3891	syscall	ErrorString	string
3892	syscall	Note	string
3893	syscall	Waitmsg	struct
3894	syscall	Timespec	struct
3895	syscall	Timeval	struct
3896	syscall	SockaddrDatalink	struct
3897	syscall	WaitStatus	uint32
3898	syscall	Errno	uintptr
3899	syscall	Signal	int
3900	syscall	Sockaddr	
3901	syscall	SockaddrInet4	struct
3902	syscall	SockaddrInet6	struct
3903	syscall	SockaddrUnix	struct
3904	syscall	Handle	uintptr
3905	syscall	Errno	uintptr
3906	syscall	RawSockaddrInet4	struct
3907	syscall	RawSockaddrInet6	struct
3908	syscall	RawSockaddr	struct
3909	syscall	RawSockaddrAny	struct
3910	syscall	Sockaddr	
3911	syscall	SockaddrInet4	struct
3912	syscall	SockaddrInet6	struct
3913	syscall	SockaddrUnix	struct
3914	syscall	Rusage	struct
3915	syscall	WaitStatus	struct
3916	syscall	Timespec	struct
3917	syscall	Linger	struct
3918	syscall	IPMreq	struct
3919	syscall	IPv6Mreq	struct
3920	syscall	Signal	int
3921	syscall	Timespec	C.struct_timespec
3922	syscall	Timeval	C.struct_timeval
3923	syscall	Timeval32	C.struct_timeval32
3924	syscall	Rusage	C.struct_rusage
3925	syscall	Rlimit	C.struct_rlimit
3926	syscall	Stat_t	C.struct_stat64
3927	syscall	Statfs_t	C.struct_statfs64
3928	syscall	Flock_t	C.struct_flock
3929	syscall	Fstore_t	C.struct_fstore
3930	syscall	Radvisory_t	C.struct_radvisory
3931	syscall	Fbootstraptransfer_t	C.struct_fbootstraptransfer
3932	syscall	Log2phys_t	C.struct_log2phys
3933	syscall	Fsid	C.struct_fsid
3934	syscall	Dirent	C.struct_dirent
3935	syscall	RawSockaddrInet4	C.struct_sockaddr_in
3936	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
3937	syscall	RawSockaddrUnix	C.struct_sockaddr_un
3938	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
3939	syscall	RawSockaddr	C.struct_sockaddr
3940	syscall	RawSockaddrAny	C.struct_sockaddr_any
3941	syscall	Linger	C.struct_linger
3942	syscall	Iovec	C.struct_iovec
3943	syscall	IPMreq	C.struct_ip_mreq
3944	syscall	IPv6Mreq	C.struct_ipv6_mreq
3945	syscall	Msghdr	C.struct_msghdr
3946	syscall	Cmsghdr	C.struct_cmsghdr
3947	syscall	Inet4Pktinfo	C.struct_in_pktinfo
3948	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
3949	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
3950	syscall	ICMPv6Filter	C.struct_icmp6_filter
3951	syscall	Kevent_t	C.struct_kevent
3952	syscall	FdSet	C.fd_set
3953	syscall	IfMsghdr	C.struct_if_msghdr
3954	syscall	IfData	C.struct_if_data
3955	syscall	IfaMsghdr	C.struct_ifa_msghdr
3956	syscall	IfmaMsghdr	C.struct_ifma_msghdr
3957	syscall	IfmaMsghdr2	C.struct_ifma_msghdr2
3958	syscall	RtMsghdr	C.struct_rt_msghdr
3959	syscall	RtMetrics	C.struct_rt_metrics
3960	syscall	BpfVersion	C.struct_bpf_version
3961	syscall	BpfStat	C.struct_bpf_stat
3962	syscall	BpfProgram	C.struct_bpf_program
3963	syscall	BpfInsn	C.struct_bpf_insn
3964	syscall	BpfHdr	C.struct_bpf_hdr
3965	syscall	Termios	C.struct_termios
3966	syscall	Timespec	C.struct_timespec
3967	syscall	Timeval	C.struct_timeval
3968	syscall	Rusage	C.struct_rusage
3969	syscall	Rlimit	C.struct_rlimit
3970	syscall	Stat_t	C.struct_stat
3971	syscall	Statfs_t	C.struct_statfs
3972	syscall	Flock_t	C.struct_flock
3973	syscall	Dirent	C.struct_dirent
3974	syscall	Fsid	C.struct_fsid
3975	syscall	RawSockaddrInet4	C.struct_sockaddr_in
3976	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
3977	syscall	RawSockaddrUnix	C.struct_sockaddr_un
3978	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
3979	syscall	RawSockaddr	C.struct_sockaddr
3980	syscall	RawSockaddrAny	C.struct_sockaddr_any
3981	syscall	Linger	C.struct_linger
3982	syscall	Iovec	C.struct_iovec
3983	syscall	IPMreq	C.struct_ip_mreq
3984	syscall	IPv6Mreq	C.struct_ipv6_mreq
3985	syscall	Msghdr	C.struct_msghdr
3986	syscall	Cmsghdr	C.struct_cmsghdr
3987	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
3988	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
3989	syscall	ICMPv6Filter	C.struct_icmp6_filter
3990	syscall	Kevent_t	C.struct_kevent
3991	syscall	FdSet	C.fd_set
3992	syscall	IfMsghdr	C.struct_if_msghdr
3993	syscall	IfData	C.struct_if_data
3994	syscall	IfaMsghdr	C.struct_ifa_msghdr
3995	syscall	IfmaMsghdr	C.struct_ifma_msghdr
3996	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
3997	syscall	RtMsghdr	C.struct_rt_msghdr
3998	syscall	RtMetrics	C.struct_rt_metrics
3999	syscall	BpfVersion	C.struct_bpf_version
4000	syscall	BpfStat	C.struct_bpf_stat
4001	syscall	BpfProgram	C.struct_bpf_program
4002	syscall	BpfInsn	C.struct_bpf_insn
4003	syscall	BpfHdr	C.struct_bpf_hdr
4004	syscall	Termios	C.struct_termios
4005	syscall	Timespec	C.struct_timespec
4006	syscall	Timeval	C.struct_timeval
4007	syscall	Rusage	C.struct_rusage
4008	syscall	Rlimit	C.struct_rlimit
4009	syscall	Stat_t	C.struct_stat8
4010	syscall	Statfs_t	C.struct_statfs
4011	syscall	Flock_t	C.struct_flock
4012	syscall	Dirent	C.struct_dirent
4013	syscall	Fsid	C.struct_fsid
4014	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4015	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4016	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4017	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4018	syscall	RawSockaddr	C.struct_sockaddr
4019	syscall	RawSockaddrAny	C.struct_sockaddr_any
4020	syscall	Linger	C.struct_linger
4021	syscall	Iovec	C.struct_iovec
4022	syscall	IPMreq	C.struct_ip_mreq
4023	syscall	IPMreqn	C.struct_ip_mreqn
4024	syscall	IPv6Mreq	C.struct_ipv6_mreq
4025	syscall	Msghdr	C.struct_msghdr
4026	syscall	Cmsghdr	C.struct_cmsghdr
4027	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4028	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4029	syscall	ICMPv6Filter	C.struct_icmp6_filter
4030	syscall	Kevent_t	C.struct_kevent
4031	syscall	FdSet	C.fd_set
4032	syscall	IfMsghdr	C.struct_if_msghdr8
4033	syscall	IfData	C.struct_if_data8
4034	syscall	IfaMsghdr	C.struct_ifa_msghdr
4035	syscall	IfmaMsghdr	C.struct_ifma_msghdr
4036	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
4037	syscall	RtMsghdr	C.struct_rt_msghdr
4038	syscall	RtMetrics	C.struct_rt_metrics
4039	syscall	BpfVersion	C.struct_bpf_version
4040	syscall	BpfStat	C.struct_bpf_stat
4041	syscall	BpfZbuf	C.struct_bpf_zbuf
4042	syscall	BpfProgram	C.struct_bpf_program
4043	syscall	BpfInsn	C.struct_bpf_insn
4044	syscall	BpfHdr	C.struct_bpf_hdr
4045	syscall	BpfZbufHeader	C.struct_bpf_zbuf_header
4046	syscall	Termios	C.struct_termios
4047	syscall	Timespec	C.struct_timespec
4048	syscall	Timeval	C.struct_timeval
4049	syscall	Timex	C.struct_timex
4050	syscall	Time_t	C.time_t
4051	syscall	Tms	C.struct_tms
4052	syscall	Utimbuf	C.struct_utimbuf
4053	syscall	Rusage	C.struct_rusage
4054	syscall	Rlimit	C.struct_rlimit
4055	syscall	Stat_t	C.struct_stat
4056	syscall	Statfs_t	C.struct_statfs
4057	syscall	Dirent	C.struct_dirent
4058	syscall	Fsid	C.fsid_t
4059	syscall	Flock_t	C.struct_flock
4060	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4061	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4062	syscall	RawSockaddrUnix	C.struct_my_sockaddr_un
4063	syscall	RawSockaddrLinklayer	C.struct_sockaddr_ll
4064	syscall	RawSockaddrNetlink	C.struct_sockaddr_nl
4065	syscall	RawSockaddr	C.struct_sockaddr
4066	syscall	RawSockaddrAny	C.struct_sockaddr_any
4067	syscall	Linger	C.struct_linger
4068	syscall	Iovec	C.struct_iovec
4069	syscall	IPMreq	C.struct_ip_mreq
4070	syscall	IPMreqn	C.struct_ip_mreqn
4071	syscall	IPv6Mreq	C.struct_ipv6_mreq
4072	syscall	Msghdr	C.struct_msghdr
4073	syscall	Cmsghdr	C.struct_cmsghdr
4074	syscall	Inet4Pktinfo	C.struct_in_pktinfo
4075	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4076	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4077	syscall	ICMPv6Filter	C.struct_icmp6_filter
4078	syscall	Ucred	C.struct_ucred
4079	syscall	TCPInfo	C.struct_tcp_info
4080	syscall	NlMsghdr	C.struct_nlmsghdr
4081	syscall	NlMsgerr	C.struct_nlmsgerr
4082	syscall	RtGenmsg	C.struct_rtgenmsg
4083	syscall	NlAttr	C.struct_nlattr
4084	syscall	RtAttr	C.struct_rtattr
4085	syscall	IfInfomsg	C.struct_ifinfomsg
4086	syscall	IfAddrmsg	C.struct_ifaddrmsg
4087	syscall	RtMsg	C.struct_rtmsg
4088	syscall	RtNexthop	C.struct_rtnexthop
4089	syscall	SockFilter	C.struct_sock_filter
4090	syscall	SockFprog	C.struct_sock_fprog
4091	syscall	InotifyEvent	C.struct_inotify_event
4092	syscall	PtraceRegs	C.PtraceRegs
4093	syscall	FdSet	C.fd_set
4094	syscall	Sysinfo_t	C.struct_sysinfo
4095	syscall	Utsname	C.struct_utsname
4096	syscall	Ustat_t	C.struct_ustat
4097	syscall	EpollEvent	C.struct_my_epoll_event
4098	syscall	Termios	C.struct_termios
4099	syscall	Timespec	C.struct_timespec
4100	syscall	Timeval	C.struct_timeval
4101	syscall	Rusage	C.struct_rusage
4102	syscall	Rlimit	C.struct_rlimit
4103	syscall	Stat_t	C.struct_stat
4104	syscall	Statfs_t	C.struct_statfs
4105	syscall	Flock_t	C.struct_flock
4106	syscall	Dirent	C.struct_dirent
4107	syscall	Fsid	C.fsid_t
4108	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4109	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4110	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4111	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4112	syscall	RawSockaddr	C.struct_sockaddr
4113	syscall	RawSockaddrAny	C.struct_sockaddr_any
4114	syscall	Linger	C.struct_linger
4115	syscall	Iovec	C.struct_iovec
4116	syscall	IPMreq	C.struct_ip_mreq
4117	syscall	IPv6Mreq	C.struct_ipv6_mreq
4118	syscall	Msghdr	C.struct_msghdr
4119	syscall	Cmsghdr	C.struct_cmsghdr
4120	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4121	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4122	syscall	ICMPv6Filter	C.struct_icmp6_filter
4123	syscall	Kevent_t	C.struct_kevent
4124	syscall	FdSet	C.fd_set
4125	syscall	IfMsghdr	C.struct_if_msghdr
4126	syscall	IfData	C.struct_if_data
4127	syscall	IfaMsghdr	C.struct_ifa_msghdr
4128	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
4129	syscall	RtMsghdr	C.struct_rt_msghdr
4130	syscall	RtMetrics	C.struct_rt_metrics
4131	syscall	Mclpool	C.struct_mclpool
4132	syscall	BpfVersion	C.struct_bpf_version
4133	syscall	BpfStat	C.struct_bpf_stat
4134	syscall	BpfProgram	C.struct_bpf_program
4135	syscall	BpfInsn	C.struct_bpf_insn
4136	syscall	BpfHdr	C.struct_bpf_hdr
4137	syscall	BpfTimeval	C.struct_bpf_timeval
4138	syscall	Termios	C.struct_termios
4139	syscall	Sysctlnode	C.struct_sysctlnode
4140	syscall	Timespec	C.struct_timespec
4141	syscall	Timeval	C.struct_timeval
4142	syscall	Rusage	C.struct_rusage
4143	syscall	Rlimit	C.struct_rlimit
4144	syscall	Stat_t	C.struct_stat
4145	syscall	Statfs_t	C.struct_statfs
4146	syscall	Flock_t	C.struct_flock
4147	syscall	Dirent	C.struct_dirent
4148	syscall	Fsid	C.fsid_t
4149	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4150	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4151	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4152	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4153	syscall	RawSockaddr	C.struct_sockaddr
4273	syscall	Rusage	struct
4154	syscall	RawSockaddrAny	C.struct_sockaddr_any
4155	syscall	Linger	C.struct_linger
4156	syscall	Iovec	C.struct_iovec
4157	syscall	IPMreq	C.struct_ip_mreq
4158	syscall	IPv6Mreq	C.struct_ipv6_mreq
4159	syscall	Msghdr	C.struct_msghdr
4160	syscall	Cmsghdr	C.struct_cmsghdr
4161	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4162	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4163	syscall	ICMPv6Filter	C.struct_icmp6_filter
4164	syscall	Kevent_t	C.struct_kevent
4165	syscall	FdSet	C.fd_set
4166	syscall	IfMsghdr	C.struct_if_msghdr
4167	syscall	IfData	C.struct_if_data
4168	syscall	IfaMsghdr	C.struct_ifa_msghdr
4169	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
4170	syscall	RtMsghdr	C.struct_rt_msghdr
4171	syscall	RtMetrics	C.struct_rt_metrics
4172	syscall	Mclpool	C.struct_mclpool
4173	syscall	BpfVersion	C.struct_bpf_version
4174	syscall	BpfStat	C.struct_bpf_stat
4175	syscall	BpfProgram	C.struct_bpf_program
4176	syscall	BpfInsn	C.struct_bpf_insn
4177	syscall	BpfHdr	C.struct_bpf_hdr
4178	syscall	BpfTimeval	C.struct_bpf_timeval
4179	syscall	Termios	C.struct_termios
4180	syscall	Timespec	C.struct_timespec
4181	syscall	Timeval	C.struct_timeval
4182	syscall	Timeval32	C.struct_timeval32
4183	syscall	Rusage	C.struct_rusage
4184	syscall	Rlimit	C.struct_rlimit
4185	syscall	Stat_t	C.struct_stat
4186	syscall	Flock_t	C.struct_flock
4187	syscall	Dirent	C.struct_dirent
4188	syscall	RawSockaddrInet4	C.struct_sockaddr_in
4189	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
4190	syscall	RawSockaddrUnix	C.struct_sockaddr_un
4191	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
4192	syscall	RawSockaddr	C.struct_sockaddr
4193	syscall	RawSockaddrAny	C.struct_sockaddr_any
4194	syscall	Linger	C.struct_linger
4195	syscall	Iovec	C.struct_iovec
4196	syscall	IPMreq	C.struct_ip_mreq
4197	syscall	IPv6Mreq	C.struct_ipv6_mreq
4198	syscall	Msghdr	C.struct_msghdr
4199	syscall	Cmsghdr	C.struct_cmsghdr
4200	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
4201	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
4202	syscall	ICMPv6Filter	C.struct_icmp6_filter
4203	syscall	FdSet	C.fd_set
4204	syscall	IfMsghdr	C.struct_if_msghdr
4205	syscall	IfData	C.struct_if_data
4206	syscall	IfaMsghdr	C.struct_ifa_msghdr
4207	syscall	RtMsghdr	C.struct_rt_msghdr
4208	syscall	RtMetrics	C.struct_rt_metrics
4209	syscall	BpfVersion	C.struct_bpf_version
4210	syscall	BpfStat	C.struct_bpf_stat
4211	syscall	BpfProgram	C.struct_bpf_program
4212	syscall	BpfInsn	C.struct_bpf_insn
4213	syscall	BpfTimeval	C.struct_bpf_timeval
4214	syscall	BpfHdr	C.struct_bpf_hdr
4215	syscall	Termios	C.struct_termios
4216	syscall	Pointer	*struct{}
4217	syscall	Timeval	struct
4218	syscall	SecurityAttributes	struct
4219	syscall	Overlapped	struct
4220	syscall	FileNotifyInformation	struct
4221	syscall	Filetime	struct
4222	syscall	Win32finddata	struct
4223	syscall	ByHandleFileInformation	struct
4224	syscall	Win32FileAttributeData	struct
4225	syscall	StartupInfo	struct
4226	syscall	ProcessInformation	struct
4227	syscall	ProcessEntry32	struct
4228	syscall	Systemtime	struct
4229	syscall	Timezoneinformation	struct
4230	syscall	WSABuf	struct
4231	syscall	Hostent	struct
4232	syscall	Protoent	struct
4233	syscall	DNSSRVData	struct
4234	syscall	DNSPTRData	struct
4235	syscall	DNSMXData	struct
4236	syscall	DNSTXTData	struct
4237	syscall	DNSRecord	struct
4238	syscall	TransmitFileBuffers	struct
4239	syscall	SockaddrGen	[]byte
4240	syscall	InterfaceInfo	struct
4241	syscall	IpAddressString	struct
4242	syscall	IpMaskString	syscall.IpAddressString
4243	syscall	IpAddrString	struct
4244	syscall	IpAdapterInfo	struct
4245	syscall	MibIfRow	struct
4246	syscall	CertInfo	struct
4247	syscall	CertContext	struct
4248	syscall	CertChainContext	struct
4249	syscall	CertTrustListInfo	struct
4250	syscall	CertSimpleChain	struct
4251	syscall	CertChainElement	struct
4252	syscall	CertRevocationCrlInfo	struct
4253	syscall	CertRevocationInfo	struct
4254	syscall	CertTrustStatus	struct
4255	syscall	CertUsageMatch	struct
4256	syscall	CertEnhKeyUsage	struct
4257	syscall	CertChainPara	struct
4258	syscall	CertChainPolicyPara	struct
4259	syscall	SSLExtraCertChainPolicyPara	struct
4260	syscall	CertChainPolicyStatus	struct
4261	syscall	AddrinfoW	struct
4262	syscall	GUID	struct
4263	syscall	WSAProtocolInfo	struct
4264	syscall	WSAProtocolChain	struct
4265	syscall	TCPKeepalive	struct
4266	syscall	WSAData	struct
4267	syscall	Servent	struct
4268	syscall	WSAData	struct
4269	syscall	Servent	struct
4270	syscall	Timespec	struct
4271	syscall	Timeval	struct
4272	syscall	Timeval32	[]byte
4274	syscall	Rlimit	struct
4275	syscall	Stat_t	struct
4276	syscall	Statfs_t	struct
4277	syscall	Flock_t	struct
4278	syscall	Fstore_t	struct
4279	syscall	Radvisory_t	struct
4280	syscall	Fbootstraptransfer_t	struct
4281	syscall	Log2phys_t	struct
4282	syscall	Fsid	struct
4283	syscall	Dirent	struct
4284	syscall	RawSockaddrInet4	struct
4285	syscall	RawSockaddrInet6	struct
4286	syscall	RawSockaddrUnix	struct
4287	syscall	RawSockaddrDatalink	struct
4288	syscall	RawSockaddr	struct
4289	syscall	RawSockaddrAny	struct
4290	syscall	Linger	struct
4291	syscall	Iovec	struct
4292	syscall	IPMreq	struct
4293	syscall	IPv6Mreq	struct
4294	syscall	Msghdr	struct
4295	syscall	Cmsghdr	struct
4296	syscall	Inet4Pktinfo	struct
4297	syscall	Inet6Pktinfo	struct
4298	syscall	IPv6MTUInfo	struct
4299	syscall	ICMPv6Filter	struct
4300	syscall	Kevent_t	struct
4301	syscall	FdSet	struct
4302	syscall	IfMsghdr	struct
4303	syscall	IfData	struct
4304	syscall	IfaMsghdr	struct
4305	syscall	IfmaMsghdr	struct
4306	syscall	IfmaMsghdr2	struct
4307	syscall	RtMsghdr	struct
4308	syscall	RtMetrics	struct
4309	syscall	BpfVersion	struct
4310	syscall	BpfStat	struct
4311	syscall	BpfProgram	struct
4312	syscall	BpfInsn	struct
4313	syscall	BpfHdr	struct
4314	syscall	Termios	struct
4315	syscall	Timespec	struct
4316	syscall	Timeval	struct
4317	syscall	Timeval32	struct
4318	syscall	Rusage	struct
4319	syscall	Rlimit	struct
4320	syscall	Stat_t	struct
4321	syscall	Statfs_t	struct
4322	syscall	Flock_t	struct
4323	syscall	Fstore_t	struct
4324	syscall	Radvisory_t	struct
4325	syscall	Fbootstraptransfer_t	struct
4326	syscall	Log2phys_t	struct
4327	syscall	Fsid	struct
4328	syscall	Dirent	struct
4329	syscall	RawSockaddrInet4	struct
4330	syscall	RawSockaddrInet6	struct
4331	syscall	RawSockaddrUnix	struct
4332	syscall	RawSockaddrDatalink	struct
4333	syscall	RawSockaddr	struct
4334	syscall	RawSockaddrAny	struct
4335	syscall	Linger	struct
4336	syscall	Iovec	struct
4337	syscall	IPMreq	struct
4338	syscall	IPv6Mreq	struct
4339	syscall	Msghdr	struct
4340	syscall	Cmsghdr	struct
4341	syscall	Inet4Pktinfo	struct
4342	syscall	Inet6Pktinfo	struct
4343	syscall	IPv6MTUInfo	struct
4344	syscall	ICMPv6Filter	struct
4345	syscall	Kevent_t	struct
4346	syscall	FdSet	struct
4347	syscall	IfMsghdr	struct
4348	syscall	IfData	struct
4349	syscall	IfaMsghdr	struct
4350	syscall	IfmaMsghdr	struct
4351	syscall	IfmaMsghdr2	struct
4352	syscall	RtMsghdr	struct
4353	syscall	RtMetrics	struct
4354	syscall	BpfVersion	struct
4355	syscall	BpfStat	struct
4356	syscall	BpfProgram	struct
4357	syscall	BpfInsn	struct
4358	syscall	BpfHdr	struct
4359	syscall	Termios	struct
4360	syscall	Timespec	struct
4361	syscall	Timeval	struct
4362	syscall	Timeval32	[]byte
4363	syscall	Rusage	struct
4364	syscall	Rlimit	struct
4365	syscall	Stat_t	struct
4366	syscall	Statfs_t	struct
4367	syscall	Flock_t	struct
4368	syscall	Fstore_t	struct
4369	syscall	Radvisory_t	struct
4370	syscall	Fbootstraptransfer_t	struct
4371	syscall	Log2phys_t	struct
4372	syscall	Fsid	struct
4373	syscall	Dirent	struct
4374	syscall	RawSockaddrInet4	struct
4375	syscall	RawSockaddrInet6	struct
4376	syscall	RawSockaddrUnix	struct
4377	syscall	RawSockaddrDatalink	struct
4378	syscall	RawSockaddr	struct
4379	syscall	RawSockaddrAny	struct
4380	syscall	Linger	struct
4381	syscall	Iovec	struct
4382	syscall	IPMreq	struct
4383	syscall	IPv6Mreq	struct
4384	syscall	Msghdr	struct
4385	syscall	Cmsghdr	struct
4386	syscall	Inet4Pktinfo	struct
4387	syscall	Inet6Pktinfo	struct
4388	syscall	IPv6MTUInfo	struct
4389	syscall	ICMPv6Filter	struct
4390	syscall	Kevent_t	struct
4391	syscall	FdSet	struct
4392	syscall	IfMsghdr	struct
4393	syscall	IfData	struct
4394	syscall	IfaMsghdr	struct
4395	syscall	IfmaMsghdr	struct
4396	syscall	IfmaMsghdr2	struct
4397	syscall	RtMsghdr	struct
4398	syscall	RtMetrics	struct
4399	syscall	BpfVersion	struct
4400	syscall	BpfStat	struct
4401	syscall	BpfProgram	struct
4402	syscall	BpfInsn	struct
4403	syscall	BpfHdr	struct
4404	syscall	Termios	struct
4405	syscall	Timespec	struct
4406	syscall	Timeval	struct
4407	syscall	Timeval32	struct
4408	syscall	Rusage	struct
4409	syscall	Rlimit	struct
4410	syscall	Stat_t	struct
4411	syscall	Statfs_t	struct
4412	syscall	Flock_t	struct
4413	syscall	Fstore_t	struct
4414	syscall	Radvisory_t	struct
4415	syscall	Fbootstraptransfer_t	struct
4416	syscall	Log2phys_t	struct
4417	syscall	Fsid	struct
4418	syscall	Dirent	struct
4419	syscall	RawSockaddrInet4	struct
4420	syscall	RawSockaddrInet6	struct
4421	syscall	RawSockaddrUnix	struct
4422	syscall	RawSockaddrDatalink	struct
4423	syscall	RawSockaddr	struct
4424	syscall	RawSockaddrAny	struct
4425	syscall	Linger	struct
4426	syscall	Iovec	struct
4427	syscall	IPMreq	struct
4428	syscall	IPv6Mreq	struct
4429	syscall	Msghdr	struct
4430	syscall	Cmsghdr	struct
4431	syscall	Inet4Pktinfo	struct
4432	syscall	Inet6Pktinfo	struct
4433	syscall	IPv6MTUInfo	struct
4434	syscall	ICMPv6Filter	struct
4435	syscall	Kevent_t	struct
4436	syscall	FdSet	struct
4437	syscall	IfMsghdr	struct
4438	syscall	IfData	struct
4439	syscall	IfaMsghdr	struct
4440	syscall	IfmaMsghdr	struct
4441	syscall	IfmaMsghdr2	struct
4442	syscall	RtMsghdr	struct
4443	syscall	RtMetrics	struct
4444	syscall	BpfVersion	struct
4445	syscall	BpfStat	struct
4446	syscall	BpfProgram	struct
4447	syscall	BpfInsn	struct
4448	syscall	BpfHdr	struct
4449	syscall	Termios	struct
4450	syscall	Timespec	struct
4451	syscall	Timeval	struct
4452	syscall	Rusage	struct
4453	syscall	Rlimit	struct
4454	syscall	Stat_t	struct
4455	syscall	Statfs_t	struct
4456	syscall	Flock_t	struct
4457	syscall	Dirent	struct
4458	syscall	Fsid	struct
4459	syscall	RawSockaddrInet4	struct
4460	syscall	RawSockaddrInet6	struct
4461	syscall	RawSockaddrUnix	struct
4462	syscall	RawSockaddrDatalink	struct
4463	syscall	RawSockaddr	struct
4464	syscall	RawSockaddrAny	struct
4465	syscall	Linger	struct
4466	syscall	Iovec	struct
4467	syscall	IPMreq	struct
4468	syscall	IPv6Mreq	struct
4469	syscall	Msghdr	struct
4470	syscall	Cmsghdr	struct
4471	syscall	Inet6Pktinfo	struct
4472	syscall	IPv6MTUInfo	struct
4473	syscall	ICMPv6Filter	struct
4474	syscall	Kevent_t	struct
4475	syscall	FdSet	struct
4476	syscall	IfMsghdr	struct
4477	syscall	IfData	struct
4478	syscall	IfaMsghdr	struct
4479	syscall	IfmaMsghdr	struct
4480	syscall	IfAnnounceMsghdr	struct
4481	syscall	RtMsghdr	struct
4482	syscall	RtMetrics	struct
4483	syscall	BpfVersion	struct
4484	syscall	BpfStat	struct
4485	syscall	BpfProgram	struct
4486	syscall	BpfInsn	struct
4487	syscall	BpfHdr	struct
4488	syscall	Termios	struct
4489	syscall	Timespec	struct
4490	syscall	Timeval	struct
4491	syscall	Rusage	struct
4492	syscall	Rlimit	struct
4493	syscall	Stat_t	struct
4494	syscall	Statfs_t	struct
4495	syscall	Flock_t	struct
4496	syscall	Dirent	struct
4497	syscall	Fsid	struct
4498	syscall	RawSockaddrInet4	struct
4499	syscall	RawSockaddrInet6	struct
4500	syscall	RawSockaddrUnix	struct
4501	syscall	RawSockaddrDatalink	struct
4502	syscall	RawSockaddr	struct
4503	syscall	RawSockaddrAny	struct
4504	syscall	Linger	struct
4505	syscall	Iovec	struct
4506	syscall	IPMreq	struct
4507	syscall	IPMreqn	struct
4508	syscall	IPv6Mreq	struct
4509	syscall	Msghdr	struct
4510	syscall	Cmsghdr	struct
4511	syscall	Inet6Pktinfo	struct
4512	syscall	IPv6MTUInfo	struct
4513	syscall	ICMPv6Filter	struct
4514	syscall	Kevent_t	struct
4515	syscall	FdSet	struct
4516	syscall	IfMsghdr	struct
4517	syscall	IfData	struct
4518	syscall	IfaMsghdr	struct
4519	syscall	IfmaMsghdr	struct
4520	syscall	IfAnnounceMsghdr	struct
4521	syscall	RtMsghdr	struct
4522	syscall	RtMetrics	struct
4523	syscall	BpfVersion	struct
4524	syscall	BpfStat	struct
4525	syscall	BpfZbuf	struct
4526	syscall	BpfProgram	struct
4527	syscall	BpfInsn	struct
4528	syscall	BpfHdr	struct
4529	syscall	BpfZbufHeader	struct
4530	syscall	Termios	struct
4531	syscall	Timespec	struct
4532	syscall	Timeval	struct
4533	syscall	Rusage	struct
4534	syscall	Rlimit	struct
4535	syscall	Stat_t	struct
4536	syscall	Statfs_t	struct
4537	syscall	Flock_t	struct
4538	syscall	Dirent	struct
4539	syscall	Fsid	struct
4540	syscall	RawSockaddrInet4	struct
4541	syscall	RawSockaddrInet6	struct
4542	syscall	RawSockaddrUnix	struct
4543	syscall	RawSockaddrDatalink	struct
4544	syscall	RawSockaddr	struct
4545	syscall	RawSockaddrAny	struct
4546	syscall	Linger	struct
4547	syscall	Iovec	struct
4548	syscall	IPMreq	struct
4549	syscall	IPMreqn	struct
4550	syscall	IPv6Mreq	struct
4551	syscall	Msghdr	struct
4552	syscall	Cmsghdr	struct
4553	syscall	Inet6Pktinfo	struct
4554	syscall	IPv6MTUInfo	struct
4555	syscall	ICMPv6Filter	struct
4556	syscall	Kevent_t	struct
4557	syscall	FdSet	struct
4558	syscall	IfMsghdr	struct
4559	syscall	IfData	struct
4560	syscall	IfaMsghdr	struct
4561	syscall	IfmaMsghdr	struct
4562	syscall	IfAnnounceMsghdr	struct
4563	syscall	RtMsghdr	struct
4564	syscall	RtMetrics	struct
4565	syscall	BpfVersion	struct
4566	syscall	BpfStat	struct
4567	syscall	BpfZbuf	struct
4568	syscall	BpfProgram	struct
4569	syscall	BpfInsn	struct
4570	syscall	BpfHdr	struct
4571	syscall	BpfZbufHeader	struct
4572	syscall	Termios	struct
4573	syscall	Timespec	struct
4574	syscall	Timeval	struct
4575	syscall	Rusage	struct
4576	syscall	Rlimit	struct
4577	syscall	Stat_t	struct
4578	syscall	Statfs_t	struct
4579	syscall	Flock_t	struct
4580	syscall	Dirent	struct
4581	syscall	Fsid	struct
4582	syscall	RawSockaddrInet4	struct
4583	syscall	RawSockaddrInet6	struct
4584	syscall	RawSockaddrUnix	struct
4585	syscall	RawSockaddrDatalink	struct
4586	syscall	RawSockaddr	struct
4587	syscall	RawSockaddrAny	struct
4588	syscall	Linger	struct
4589	syscall	Iovec	struct
4590	syscall	IPMreq	struct
4591	syscall	IPMreqn	struct
4592	syscall	IPv6Mreq	struct
4593	syscall	Msghdr	struct
4594	syscall	Cmsghdr	struct
4595	syscall	Inet6Pktinfo	struct
4596	syscall	IPv6MTUInfo	struct
4597	syscall	ICMPv6Filter	struct
4598	syscall	Kevent_t	struct
4599	syscall	FdSet	struct
4600	syscall	IfMsghdr	struct
4601	syscall	IfData	struct
4602	syscall	IfaMsghdr	struct
4603	syscall	IfmaMsghdr	struct
4604	syscall	IfAnnounceMsghdr	struct
4605	syscall	RtMsghdr	struct
4606	syscall	RtMetrics	struct
4607	syscall	BpfVersion	struct
4608	syscall	BpfStat	struct
4609	syscall	BpfZbuf	struct
4610	syscall	BpfProgram	struct
4611	syscall	BpfInsn	struct
4612	syscall	BpfHdr	struct
4613	syscall	BpfZbufHeader	struct
4614	syscall	Termios	struct
4615	syscall	Timespec	struct
4616	syscall	Timeval	struct
4617	syscall	Timex	struct
4618	syscall	Time_t	int32
4619	syscall	Tms	struct
4620	syscall	Utimbuf	struct
4621	syscall	Rusage	struct
4622	syscall	Rlimit	struct
4623	syscall	Stat_t	struct
4624	syscall	Statfs_t	struct
4625	syscall	Dirent	struct
4626	syscall	Fsid	struct
4627	syscall	Flock_t	struct
4628	syscall	RawSockaddrInet4	struct
4629	syscall	RawSockaddrInet6	struct
4630	syscall	RawSockaddrUnix	struct
4631	syscall	RawSockaddrLinklayer	struct
4632	syscall	RawSockaddrNetlink	struct
4633	syscall	RawSockaddr	struct
4634	syscall	RawSockaddrAny	struct
4635	syscall	Linger	struct
4636	syscall	Iovec	struct
4637	syscall	IPMreq	struct
4638	syscall	IPMreqn	struct
4639	syscall	IPv6Mreq	struct
4640	syscall	Msghdr	struct
4641	syscall	Cmsghdr	struct
4642	syscall	Inet4Pktinfo	struct
4643	syscall	Inet6Pktinfo	struct
4644	syscall	IPv6MTUInfo	struct
4645	syscall	ICMPv6Filter	struct
4646	syscall	Ucred	struct
4647	syscall	TCPInfo	struct
4648	syscall	NlMsghdr	struct
4649	syscall	NlMsgerr	struct
4650	syscall	RtGenmsg	struct
4651	syscall	NlAttr	struct
4652	syscall	RtAttr	struct
4653	syscall	IfInfomsg	struct
4654	syscall	IfAddrmsg	struct
4655	syscall	RtMsg	struct
4656	syscall	RtNexthop	struct
4657	syscall	SockFilter	struct
4658	syscall	SockFprog	struct
4659	syscall	InotifyEvent	struct
4660	syscall	PtraceRegs	struct
4661	syscall	FdSet	struct
4662	syscall	Sysinfo_t	struct
4663	syscall	Utsname	struct
4664	syscall	Ustat_t	struct
4665	syscall	EpollEvent	struct
4666	syscall	Termios	struct
4667	syscall	Timespec	struct
4668	syscall	Timeval	struct
4669	syscall	Timex	struct
4670	syscall	Time_t	int64
4671	syscall	Tms	struct
4672	syscall	Utimbuf	struct
4673	syscall	Rusage	struct
4674	syscall	Rlimit	struct
4675	syscall	Stat_t	struct
4676	syscall	Statfs_t	struct
4677	syscall	Dirent	struct
4678	syscall	Fsid	struct
4679	syscall	Flock_t	struct
4680	syscall	RawSockaddrInet4	struct
4681	syscall	RawSockaddrInet6	struct
4682	syscall	RawSockaddrUnix	struct
4683	syscall	RawSockaddrLinklayer	struct
4684	syscall	RawSockaddrNetlink	struct
4685	syscall	RawSockaddr	struct
4686	syscall	RawSockaddrAny	struct
4687	syscall	Linger	struct
4688	syscall	Iovec	struct
4689	syscall	IPMreq	struct
4690	syscall	IPMreqn	struct
4691	syscall	IPv6Mreq	struct
4692	syscall	Msghdr	struct
4693	syscall	Cmsghdr	struct
4694	syscall	Inet4Pktinfo	struct
4695	syscall	Inet6Pktinfo	struct
4696	syscall	IPv6MTUInfo	struct
4697	syscall	ICMPv6Filter	struct
4698	syscall	Ucred	struct
4699	syscall	TCPInfo	struct
4700	syscall	NlMsghdr	struct
4701	syscall	NlMsgerr	struct
4702	syscall	RtGenmsg	struct
4703	syscall	NlAttr	struct
4704	syscall	RtAttr	struct
4705	syscall	IfInfomsg	struct
4706	syscall	IfAddrmsg	struct
4707	syscall	RtMsg	struct
4708	syscall	RtNexthop	struct
4709	syscall	SockFilter	struct
4710	syscall	SockFprog	struct
4711	syscall	InotifyEvent	struct
4712	syscall	PtraceRegs	struct
4713	syscall	FdSet	struct
4714	syscall	Sysinfo_t	struct
4715	syscall	Utsname	struct
4716	syscall	Ustat_t	struct
4717	syscall	EpollEvent	struct
4718	syscall	Termios	struct
4719	syscall	Timespec	struct
4720	syscall	Timeval	struct
4721	syscall	Timex	struct
4722	syscall	Time_t	int32
4723	syscall	Tms	struct
4724	syscall	Utimbuf	struct
4725	syscall	Rusage	struct
4726	syscall	Rlimit	struct
4727	syscall	Stat_t	struct
4728	syscall	Statfs_t	struct
4729	syscall	Dirent	struct
4730	syscall	Fsid	struct
4731	syscall	Flock_t	struct
4732	syscall	RawSockaddrInet4	struct
4733	syscall	RawSockaddrInet6	struct
4734	syscall	RawSockaddrUnix	struct
4735	syscall	RawSockaddrLinklayer	struct
4736	syscall	RawSockaddrNetlink	struct
4737	syscall	RawSockaddr	struct
4738	syscall	RawSockaddrAny	struct
4739	syscall	Linger	struct
4740	syscall	Iovec	struct
4741	syscall	IPMreq	struct
4742	syscall	IPMreqn	struct
4743	syscall	IPv6Mreq	struct
4744	syscall	Msghdr	struct
4745	syscall	Cmsghdr	struct
4746	syscall	Inet4Pktinfo	struct
4747	syscall	Inet6Pktinfo	struct
4748	syscall	IPv6MTUInfo	struct
4749	syscall	ICMPv6Filter	struct
4750	syscall	Ucred	struct
4751	syscall	TCPInfo	struct
4752	syscall	NlMsghdr	struct
4753	syscall	NlMsgerr	struct
4754	syscall	RtGenmsg	struct
4755	syscall	NlAttr	struct
4756	syscall	RtAttr	struct
4757	syscall	IfInfomsg	struct
4758	syscall	IfAddrmsg	struct
4759	syscall	RtMsg	struct
4760	syscall	RtNexthop	struct
4761	syscall	SockFilter	struct
4762	syscall	SockFprog	struct
4763	syscall	InotifyEvent	struct
4764	syscall	PtraceRegs	struct
4765	syscall	FdSet	struct
4766	syscall	Sysinfo_t	struct
4767	syscall	Utsname	struct
4768	syscall	Ustat_t	struct
4769	syscall	EpollEvent	struct
4770	syscall	Termios	struct
4771	syscall	Timespec	struct
4772	syscall	Timeval	struct
4773	syscall	Timex	struct
4774	syscall	Time_t	int64
4775	syscall	Tms	struct
4776	syscall	Utimbuf	struct
4777	syscall	Rusage	struct
4778	syscall	Rlimit	struct
4779	syscall	Stat_t	struct
4780	syscall	Statfs_t	struct
4781	syscall	Dirent	struct
4782	syscall	Fsid	struct
4783	syscall	Flock_t	struct
4784	syscall	RawSockaddrInet4	struct
4785	syscall	RawSockaddrInet6	struct
4786	syscall	RawSockaddrUnix	struct
4787	syscall	RawSockaddrLinklayer	struct
4788	syscall	RawSockaddrNetlink	struct
4789	syscall	RawSockaddr	struct
4790	syscall	RawSockaddrAny	struct
4791	syscall	Linger	struct
4792	syscall	Iovec	struct
4793	syscall	IPMreq	struct
4794	syscall	IPMreqn	struct
4795	syscall	IPv6Mreq	struct
4796	syscall	Msghdr	struct
4797	syscall	Cmsghdr	struct
4798	syscall	Inet4Pktinfo	struct
4799	syscall	Inet6Pktinfo	struct
4800	syscall	IPv6MTUInfo	struct
4801	syscall	ICMPv6Filter	struct
4802	syscall	Ucred	struct
4803	syscall	TCPInfo	struct
4804	syscall	NlMsghdr	struct
4805	syscall	NlMsgerr	struct
4806	syscall	RtGenmsg	struct
4807	syscall	NlAttr	struct
4808	syscall	RtAttr	struct
4809	syscall	IfInfomsg	struct
4810	syscall	IfAddrmsg	struct
4811	syscall	RtMsg	struct
4812	syscall	RtNexthop	struct
4813	syscall	SockFilter	struct
4814	syscall	SockFprog	struct
4815	syscall	InotifyEvent	struct
4816	syscall	PtraceRegs	struct
4817	syscall	FdSet	struct
4818	syscall	Sysinfo_t	struct
4819	syscall	Utsname	struct
4820	syscall	Ustat_t	struct
4821	syscall	EpollEvent	struct
4822	syscall	Termios	struct
4823	syscall	Timespec	struct
4824	syscall	Timeval	struct
4825	syscall	Timex	struct
4826	syscall	Time_t	int32
4827	syscall	Tms	struct
4828	syscall	Utimbuf	struct
4829	syscall	Rusage	struct
4830	syscall	Rlimit	struct
4831	syscall	Stat_t	struct
4832	syscall	Statfs_t	struct
4833	syscall	Dirent	struct
4834	syscall	Fsid	struct
4835	syscall	Flock_t	struct
4836	syscall	RawSockaddrInet4	struct
4837	syscall	RawSockaddrInet6	struct
4838	syscall	RawSockaddrUnix	struct
4839	syscall	RawSockaddrLinklayer	struct
4840	syscall	RawSockaddrNetlink	struct
4841	syscall	RawSockaddr	struct
4842	syscall	RawSockaddrAny	struct
4843	syscall	Linger	struct
4844	syscall	Iovec	struct
4845	syscall	IPMreq	struct
4846	syscall	IPMreqn	struct
4847	syscall	IPv6Mreq	struct
4848	syscall	Msghdr	struct
4849	syscall	Cmsghdr	struct
4850	syscall	Inet4Pktinfo	struct
4851	syscall	Inet6Pktinfo	struct
4852	syscall	IPv6MTUInfo	struct
4853	syscall	ICMPv6Filter	struct
4854	syscall	Ucred	struct
4855	syscall	TCPInfo	struct
4856	syscall	NlMsghdr	struct
4857	syscall	NlMsgerr	struct
4858	syscall	RtGenmsg	struct
4859	syscall	NlAttr	struct
4860	syscall	RtAttr	struct
4861	syscall	IfInfomsg	struct
4862	syscall	IfAddrmsg	struct
4863	syscall	RtMsg	struct
4864	syscall	RtNexthop	struct
4865	syscall	SockFilter	struct
4866	syscall	SockFprog	struct
4867	syscall	InotifyEvent	struct
4868	syscall	PtraceRegs	struct
4869	syscall	FdSet	struct
4870	syscall	Sysinfo_t	struct
4871	syscall	Utsname	struct
4872	syscall	Ustat_t	struct
4873	syscall	EpollEvent	struct
4874	syscall	Termios	struct
4875	syscall	Timespec	struct
4876	syscall	Timeval	struct
4877	syscall	Timex	struct
4878	syscall	Time_t	int64
4879	syscall	Tms	struct
4880	syscall	Utimbuf	struct
4881	syscall	Rusage	struct
4882	syscall	Rlimit	struct
4883	syscall	Stat_t	struct
4884	syscall	Statfs_t	struct
4885	syscall	Dirent	struct
4886	syscall	Fsid	struct
4887	syscall	Flock_t	struct
4888	syscall	RawSockaddrInet4	struct
4889	syscall	RawSockaddrInet6	struct
4890	syscall	RawSockaddrUnix	struct
4891	syscall	RawSockaddrLinklayer	struct
4892	syscall	RawSockaddrNetlink	struct
4893	syscall	RawSockaddr	struct
4894	syscall	RawSockaddrAny	struct
4895	syscall	Linger	struct
4896	syscall	Iovec	struct
4897	syscall	IPMreq	struct
4898	syscall	IPMreqn	struct
4899	syscall	IPv6Mreq	struct
4900	syscall	Msghdr	struct
4901	syscall	Cmsghdr	struct
4902	syscall	Inet4Pktinfo	struct
4903	syscall	Inet6Pktinfo	struct
4904	syscall	IPv6MTUInfo	struct
4905	syscall	ICMPv6Filter	struct
4906	syscall	Ucred	struct
4907	syscall	TCPInfo	struct
4908	syscall	NlMsghdr	struct
4909	syscall	NlMsgerr	struct
4910	syscall	RtGenmsg	struct
4911	syscall	NlAttr	struct
4912	syscall	RtAttr	struct
4913	syscall	IfInfomsg	struct
4914	syscall	IfAddrmsg	struct
4915	syscall	RtMsg	struct
4916	syscall	RtNexthop	struct
4917	syscall	SockFilter	struct
4918	syscall	SockFprog	struct
4919	syscall	InotifyEvent	struct
4920	syscall	PtraceRegs	struct
4921	syscall	FdSet	struct
4922	syscall	Sysinfo_t	struct
4923	syscall	Utsname	struct
4924	syscall	Ustat_t	struct
4925	syscall	EpollEvent	struct
4926	syscall	Termios	struct
4927	syscall	Timespec	struct
4928	syscall	Timeval	struct
4929	syscall	Timex	struct
4930	syscall	Time_t	int64
4931	syscall	Tms	struct
4932	syscall	Utimbuf	struct
4933	syscall	Rusage	struct
4934	syscall	Rlimit	struct
4935	syscall	Stat_t	struct
4936	syscall	Statfs_t	struct
4937	syscall	Dirent	struct
4938	syscall	Fsid	struct
4939	syscall	Flock_t	struct
4940	syscall	RawSockaddrInet4	struct
4941	syscall	RawSockaddrInet6	struct
4942	syscall	RawSockaddrUnix	struct
4943	syscall	RawSockaddrLinklayer	struct
4944	syscall	RawSockaddrNetlink	struct
4945	syscall	RawSockaddr	struct
4946	syscall	RawSockaddrAny	struct
4947	syscall	Linger	struct
4948	syscall	Iovec	struct
4949	syscall	IPMreq	struct
4950	syscall	IPMreqn	struct
4951	syscall	IPv6Mreq	struct
4952	syscall	Msghdr	struct
4953	syscall	Cmsghdr	struct
4954	syscall	Inet4Pktinfo	struct
4955	syscall	Inet6Pktinfo	struct
4956	syscall	IPv6MTUInfo	struct
4957	syscall	ICMPv6Filter	struct
4958	syscall	Ucred	struct
4959	syscall	TCPInfo	struct
4960	syscall	NlMsghdr	struct
4961	syscall	NlMsgerr	struct
4962	syscall	RtGenmsg	struct
4963	syscall	NlAttr	struct
4964	syscall	RtAttr	struct
4965	syscall	IfInfomsg	struct
4966	syscall	IfAddrmsg	struct
4967	syscall	RtMsg	struct
4968	syscall	RtNexthop	struct
4969	syscall	SockFilter	struct
4970	syscall	SockFprog	struct
4971	syscall	InotifyEvent	struct
4972	syscall	PtraceRegs	struct
4973	syscall	FdSet	struct
4974	syscall	Sysinfo_t	struct
4975	syscall	Utsname	struct
4976	syscall	Ustat_t	struct
4977	syscall	EpollEvent	struct
4978	syscall	Termios	struct
4979	syscall	Timespec	struct
4980	syscall	Timeval	struct
4981	syscall	Timex	struct
4982	syscall	Time_t	int32
4983	syscall	Tms	struct
4984	syscall	Utimbuf	struct
4985	syscall	Rusage	struct
4986	syscall	Rlimit	struct
4987	syscall	Stat_t	struct
4988	syscall	Statfs_t	struct
4989	syscall	Dirent	struct
4990	syscall	Fsid	struct
4991	syscall	Flock_t	struct
4992	syscall	RawSockaddrInet4	struct
4993	syscall	RawSockaddrInet6	struct
4994	syscall	RawSockaddrUnix	struct
4995	syscall	RawSockaddrLinklayer	struct
4996	syscall	RawSockaddrNetlink	struct
4997	syscall	RawSockaddr	struct
4998	syscall	RawSockaddrAny	struct
4999	syscall	Linger	struct
5000	syscall	Iovec	struct
5001	syscall	IPMreq	struct
5002	syscall	IPMreqn	struct
5003	syscall	IPv6Mreq	struct
5004	syscall	Msghdr	struct
5005	syscall	Cmsghdr	struct
5006	syscall	Inet4Pktinfo	struct
5007	syscall	Inet6Pktinfo	struct
5008	syscall	IPv6MTUInfo	struct
5009	syscall	ICMPv6Filter	struct
5010	syscall	Ucred	struct
5011	syscall	TCPInfo	struct
5012	syscall	NlMsghdr	struct
5013	syscall	NlMsgerr	struct
5014	syscall	RtGenmsg	struct
5015	syscall	NlAttr	struct
5016	syscall	RtAttr	struct
5017	syscall	IfInfomsg	struct
5018	syscall	IfAddrmsg	struct
5019	syscall	RtMsg	struct
5020	syscall	RtNexthop	struct
5021	syscall	SockFilter	struct
5022	syscall	SockFprog	struct
5023	syscall	InotifyEvent	struct
5024	syscall	PtraceRegs	struct
5025	syscall	FdSet	struct
5026	syscall	Sysinfo_t	struct
5027	syscall	Utsname	struct
5028	syscall	Ustat_t	struct
5029	syscall	EpollEvent	struct
5030	syscall	Termios	struct
5031	syscall	Timespec	struct
5032	syscall	Timeval	struct
5033	syscall	Timex	struct
5034	syscall	Time_t	int64
5035	syscall	Tms	struct
5036	syscall	Utimbuf	struct
5037	syscall	Rusage	struct
5038	syscall	Rlimit	struct
5039	syscall	Stat_t	struct
5040	syscall	Statfs_t	struct
5041	syscall	Dirent	struct
5042	syscall	Fsid	struct
5043	syscall	Flock_t	struct
5044	syscall	RawSockaddrInet4	struct
5045	syscall	RawSockaddrInet6	struct
5046	syscall	RawSockaddrUnix	struct
5047	syscall	RawSockaddrLinklayer	struct
5048	syscall	RawSockaddrNetlink	struct
5049	syscall	RawSockaddr	struct
5050	syscall	RawSockaddrAny	struct
5051	syscall	Linger	struct
5052	syscall	Iovec	struct
5053	syscall	IPMreq	struct
5054	syscall	IPMreqn	struct
5055	syscall	IPv6Mreq	struct
5056	syscall	Msghdr	struct
5057	syscall	Cmsghdr	struct
5058	syscall	Inet4Pktinfo	struct
5059	syscall	Inet6Pktinfo	struct
5060	syscall	IPv6MTUInfo	struct
5061	syscall	ICMPv6Filter	struct
5062	syscall	Ucred	struct
5063	syscall	TCPInfo	struct
5064	syscall	NlMsghdr	struct
5065	syscall	NlMsgerr	struct
5066	syscall	RtGenmsg	struct
5067	syscall	NlAttr	struct
5068	syscall	RtAttr	struct
5069	syscall	IfInfomsg	struct
5070	syscall	IfAddrmsg	struct
5071	syscall	RtMsg	struct
5072	syscall	RtNexthop	struct
5073	syscall	SockFilter	struct
5074	syscall	SockFprog	struct
5075	syscall	InotifyEvent	struct
5076	syscall	PtraceRegs	struct
5077	syscall	FdSet	struct
5078	syscall	Sysinfo_t	struct
5079	syscall	Utsname	struct
5080	syscall	Ustat_t	struct
5081	syscall	EpollEvent	struct
5082	syscall	Termios	struct
5083	syscall	Timespec	struct
5084	syscall	Timeval	struct
5085	syscall	Timex	struct
5086	syscall	Time_t	int64
5087	syscall	Tms	struct
5088	syscall	Utimbuf	struct
5089	syscall	Rusage	struct
5090	syscall	Rlimit	struct
5091	syscall	Stat_t	struct
5092	syscall	Statfs_t	struct
5093	syscall	Dirent	struct
5094	syscall	Fsid	struct
5095	syscall	Flock_t	struct
5096	syscall	RawSockaddrInet4	struct
5097	syscall	RawSockaddrInet6	struct
5098	syscall	RawSockaddrUnix	struct
5099	syscall	RawSockaddrLinklayer	struct
5100	syscall	RawSockaddrNetlink	struct
5101	syscall	RawSockaddr	struct
5102	syscall	RawSockaddrAny	struct
5103	syscall	Linger	struct
5104	syscall	Iovec	struct
5105	syscall	IPMreq	struct
5106	syscall	IPMreqn	struct
5107	syscall	IPv6Mreq	struct
5108	syscall	Msghdr	struct
5109	syscall	Cmsghdr	struct
5110	syscall	Inet4Pktinfo	struct
5111	syscall	Inet6Pktinfo	struct
5112	syscall	IPv6MTUInfo	struct
5113	syscall	ICMPv6Filter	struct
5114	syscall	Ucred	struct
5115	syscall	TCPInfo	struct
5116	syscall	NlMsghdr	struct
5117	syscall	NlMsgerr	struct
5118	syscall	RtGenmsg	struct
5119	syscall	NlAttr	struct
5120	syscall	RtAttr	struct
5121	syscall	IfInfomsg	struct
5122	syscall	IfAddrmsg	struct
5123	syscall	RtMsg	struct
5124	syscall	RtNexthop	struct
5125	syscall	SockFilter	struct
5126	syscall	SockFprog	struct
5127	syscall	InotifyEvent	struct
5128	syscall	PtraceRegs	struct
5129	syscall	FdSet	struct
5130	syscall	Sysinfo_t	struct
5131	syscall	Utsname	struct
5132	syscall	Ustat_t	struct
5133	syscall	EpollEvent	struct
5134	syscall	Termios	struct
5135	syscall	Timespec	struct
5136	syscall	Timeval	struct
5137	syscall	Timex	struct
5138	syscall	Time_t	int64
5139	syscall	Tms	struct
5140	syscall	Utimbuf	struct
5141	syscall	Rusage	struct
5142	syscall	Rlimit	struct
5143	syscall	Stat_t	struct
5144	syscall	Statfs_t	struct
5145	syscall	Dirent	struct
5146	syscall	Fsid	struct
5147	syscall	Flock_t	struct
5148	syscall	RawSockaddrInet4	struct
5149	syscall	RawSockaddrInet6	struct
5150	syscall	RawSockaddrUnix	struct
5151	syscall	RawSockaddrLinklayer	struct
5152	syscall	RawSockaddrNetlink	struct
5153	syscall	RawSockaddr	struct
5154	syscall	RawSockaddrAny	struct
5155	syscall	Linger	struct
5156	syscall	Iovec	struct
5157	syscall	IPMreq	struct
5158	syscall	IPMreqn	struct
5159	syscall	IPv6Mreq	struct
5160	syscall	Msghdr	struct
5161	syscall	Cmsghdr	struct
5162	syscall	Inet4Pktinfo	struct
5163	syscall	Inet6Pktinfo	struct
5164	syscall	IPv6MTUInfo	struct
5165	syscall	ICMPv6Filter	struct
5166	syscall	Ucred	struct
5167	syscall	TCPInfo	struct
5168	syscall	NlMsghdr	struct
5169	syscall	NlMsgerr	struct
5170	syscall	RtGenmsg	struct
5171	syscall	NlAttr	struct
5172	syscall	RtAttr	struct
5173	syscall	IfInfomsg	struct
5174	syscall	IfAddrmsg	struct
5175	syscall	RtMsg	struct
5176	syscall	RtNexthop	struct
5177	syscall	SockFilter	struct
5178	syscall	SockFprog	struct
5179	syscall	InotifyEvent	struct
5180	syscall	PtraceRegs	struct
5181	syscall	PtracePsw	struct
5182	syscall	PtraceFpregs	struct
5183	syscall	PtracePer	struct
5184	syscall	FdSet	struct
5185	syscall	Sysinfo_t	struct
5186	syscall	Utsname	struct
5187	syscall	Ustat_t	struct
5188	syscall	EpollEvent	struct
5189	syscall	Termios	struct
5190	syscall	Timespec	struct
5191	syscall	Timeval	struct
5192	syscall	Rusage	struct
5193	syscall	Rlimit	struct
5194	syscall	Stat_t	struct
5195	syscall	Statfs_t	[]byte
5196	syscall	Flock_t	struct
5197	syscall	Dirent	struct
5198	syscall	Fsid	struct
5199	syscall	RawSockaddrInet4	struct
5200	syscall	RawSockaddrInet6	struct
5201	syscall	RawSockaddrUnix	struct
5202	syscall	RawSockaddrDatalink	struct
5203	syscall	RawSockaddr	struct
5204	syscall	RawSockaddrAny	struct
5205	syscall	Linger	struct
5206	syscall	Iovec	struct
5207	syscall	IPMreq	struct
5208	syscall	IPv6Mreq	struct
5209	syscall	Msghdr	struct
5210	syscall	Cmsghdr	struct
5211	syscall	Inet6Pktinfo	struct
5212	syscall	IPv6MTUInfo	struct
5213	syscall	ICMPv6Filter	struct
5214	syscall	Kevent_t	struct
5215	syscall	FdSet	struct
5216	syscall	IfMsghdr	struct
5217	syscall	IfData	struct
5218	syscall	IfaMsghdr	struct
5219	syscall	IfAnnounceMsghdr	struct
5220	syscall	RtMsghdr	struct
5221	syscall	RtMetrics	struct
5222	syscall	Mclpool	[]byte
5223	syscall	BpfVersion	struct
5224	syscall	BpfStat	struct
5225	syscall	BpfProgram	struct
5226	syscall	BpfInsn	struct
5227	syscall	BpfHdr	struct
5228	syscall	BpfTimeval	struct
5229	syscall	Termios	struct
5230	syscall	Sysctlnode	struct
5231	syscall	Timespec	struct
5232	syscall	Timeval	struct
5233	syscall	Rusage	struct
5234	syscall	Rlimit	struct
5235	syscall	Stat_t	struct
5236	syscall	Statfs_t	[]byte
5237	syscall	Flock_t	struct
5238	syscall	Dirent	struct
5239	syscall	Fsid	struct
5240	syscall	RawSockaddrInet4	struct
5241	syscall	RawSockaddrInet6	struct
5242	syscall	RawSockaddrUnix	struct
5243	syscall	RawSockaddrDatalink	struct
5244	syscall	RawSockaddr	struct
5245	syscall	RawSockaddrAny	struct
5246	syscall	Linger	struct
5247	syscall	Iovec	struct
5248	syscall	IPMreq	struct
5249	syscall	IPv6Mreq	struct
5250	syscall	Msghdr	struct
5251	syscall	Cmsghdr	struct
5252	syscall	Inet6Pktinfo	struct
5253	syscall	IPv6MTUInfo	struct
5254	syscall	ICMPv6Filter	struct
5255	syscall	Kevent_t	struct
5256	syscall	FdSet	struct
5257	syscall	IfMsghdr	struct
5258	syscall	IfData	struct
5259	syscall	IfaMsghdr	struct
5260	syscall	IfAnnounceMsghdr	struct
5261	syscall	RtMsghdr	struct
5262	syscall	RtMetrics	struct
5263	syscall	Mclpool	[]byte
5264	syscall	BpfVersion	struct
5265	syscall	BpfStat	struct
5266	syscall	BpfProgram	struct
5267	syscall	BpfInsn	struct
5268	syscall	BpfHdr	struct
5269	syscall	BpfTimeval	struct
5270	syscall	Termios	struct
5271	syscall	Sysctlnode	struct
5272	syscall	Timespec	struct
5273	syscall	Timeval	struct
5274	syscall	Rusage	struct
5275	syscall	Rlimit	struct
5276	syscall	Stat_t	struct
5277	syscall	Statfs_t	[]byte
5278	syscall	Flock_t	struct
5279	syscall	Dirent	struct
5280	syscall	Fsid	struct
5281	syscall	RawSockaddrInet4	struct
5282	syscall	RawSockaddrInet6	struct
5283	syscall	RawSockaddrUnix	struct
5284	syscall	RawSockaddrDatalink	struct
5285	syscall	RawSockaddr	struct
5286	syscall	RawSockaddrAny	struct
5287	syscall	Linger	struct
5288	syscall	Iovec	struct
5289	syscall	IPMreq	struct
5290	syscall	IPv6Mreq	struct
5291	syscall	Msghdr	struct
5292	syscall	Cmsghdr	struct
5293	syscall	Inet6Pktinfo	struct
5294	syscall	IPv6MTUInfo	struct
5295	syscall	ICMPv6Filter	struct
5296	syscall	Kevent_t	struct
5297	syscall	FdSet	struct
5298	syscall	IfMsghdr	struct
5299	syscall	IfData	struct
5300	syscall	IfaMsghdr	struct
5301	syscall	IfAnnounceMsghdr	struct
5302	syscall	RtMsghdr	struct
5303	syscall	RtMetrics	struct
5304	syscall	Mclpool	[]byte
5305	syscall	BpfVersion	struct
5306	syscall	BpfStat	struct
5307	syscall	BpfProgram	struct
5308	syscall	BpfInsn	struct
5309	syscall	BpfHdr	struct
5310	syscall	BpfTimeval	struct
5311	syscall	Termios	struct
5312	syscall	Sysctlnode	struct
5313	syscall	Timespec	struct
5314	syscall	Timeval	struct
5315	syscall	Rusage	struct
5316	syscall	Rlimit	struct
5317	syscall	Stat_t	struct
5318	syscall	Statfs_t	struct
5319	syscall	Flock_t	struct
5320	syscall	Dirent	struct
5321	syscall	Fsid	struct
5322	syscall	RawSockaddrInet4	struct
5323	syscall	RawSockaddrInet6	struct
5324	syscall	RawSockaddrUnix	struct
5325	syscall	RawSockaddrDatalink	struct
5326	syscall	RawSockaddr	struct
5327	syscall	RawSockaddrAny	struct
5328	syscall	Linger	struct
5329	syscall	Iovec	struct
5330	syscall	IPMreq	struct
5331	syscall	IPv6Mreq	struct
5332	syscall	Msghdr	struct
5333	syscall	Cmsghdr	struct
5334	syscall	Inet6Pktinfo	struct
5335	syscall	IPv6MTUInfo	struct
5336	syscall	ICMPv6Filter	struct
5337	syscall	Kevent_t	struct
5338	syscall	FdSet	struct
5339	syscall	IfMsghdr	struct
5340	syscall	IfData	struct
5341	syscall	IfaMsghdr	struct
5342	syscall	IfAnnounceMsghdr	struct
5343	syscall	RtMsghdr	struct
5344	syscall	RtMetrics	struct
5345	syscall	Mclpool	struct
5346	syscall	BpfVersion	struct
5347	syscall	BpfStat	struct
5348	syscall	BpfProgram	struct
5349	syscall	BpfInsn	struct
5350	syscall	BpfHdr	struct
5351	syscall	BpfTimeval	struct
5352	syscall	Termios	struct
5353	syscall	Timespec	struct
5354	syscall	Timeval	struct
5355	syscall	Rusage	struct
5356	syscall	Rlimit	struct
5357	syscall	Stat_t	struct
5358	syscall	Statfs_t	struct
5359	syscall	Flock_t	struct
5360	syscall	Dirent	struct
5361	syscall	Fsid	struct
5362	syscall	RawSockaddrInet4	struct
5363	syscall	RawSockaddrInet6	struct
5364	syscall	RawSockaddrUnix	struct
5365	syscall	RawSockaddrDatalink	struct
5366	syscall	RawSockaddr	struct
5367	syscall	RawSockaddrAny	struct
5368	syscall	Linger	struct
5369	syscall	Iovec	struct
5370	syscall	IPMreq	struct
5371	syscall	IPv6Mreq	struct
5372	syscall	Msghdr	struct
5373	syscall	Cmsghdr	struct
5374	syscall	Inet6Pktinfo	struct
5375	syscall	IPv6MTUInfo	struct
5376	syscall	ICMPv6Filter	struct
5377	syscall	Kevent_t	struct
5378	syscall	FdSet	struct
5379	syscall	IfMsghdr	struct
5380	syscall	IfData	struct
5381	syscall	IfaMsghdr	struct
5382	syscall	IfAnnounceMsghdr	struct
5383	syscall	RtMsghdr	struct
5384	syscall	RtMetrics	struct
5385	syscall	Mclpool	struct
5386	syscall	BpfVersion	struct
5387	syscall	BpfStat	struct
5388	syscall	BpfProgram	struct
5389	syscall	BpfInsn	struct
5390	syscall	BpfHdr	struct
5391	syscall	BpfTimeval	struct
5392	syscall	Termios	struct
5393	syscall	Timespec	struct
5394	syscall	Timeval	struct
5395	syscall	Rusage	struct
5396	syscall	Rlimit	struct
5397	syscall	Stat_t	struct
5398	syscall	Statfs_t	struct
5399	syscall	Flock_t	struct
5400	syscall	Dirent	struct
5401	syscall	Fsid	struct
5402	syscall	RawSockaddrInet4	struct
5403	syscall	RawSockaddrInet6	struct
5404	syscall	RawSockaddrUnix	struct
5405	syscall	RawSockaddrDatalink	struct
5406	syscall	RawSockaddr	struct
5407	syscall	RawSockaddrAny	struct
5408	syscall	Linger	struct
5409	syscall	Iovec	struct
5410	syscall	IPMreq	struct
5411	syscall	IPv6Mreq	struct
5412	syscall	Msghdr	struct
5413	syscall	Cmsghdr	struct
5414	syscall	Inet6Pktinfo	struct
5415	syscall	IPv6MTUInfo	struct
5416	syscall	ICMPv6Filter	struct
5417	syscall	Kevent_t	struct
5418	syscall	FdSet	struct
5419	syscall	IfMsghdr	struct
5420	syscall	IfData	struct
5421	syscall	IfaMsghdr	struct
5422	syscall	IfAnnounceMsghdr	struct
5423	syscall	RtMsghdr	struct
5424	syscall	RtMetrics	struct
5425	syscall	Mclpool	struct
5426	syscall	BpfVersion	struct
5427	syscall	BpfStat	struct
5428	syscall	BpfProgram	struct
5429	syscall	BpfInsn	struct
5430	syscall	BpfHdr	struct
5431	syscall	BpfTimeval	struct
5432	syscall	Termios	struct
5433	syscall	Timespec	struct
5434	syscall	Timeval	struct
5435	syscall	Timeval32	struct
5436	syscall	Rusage	struct
5437	syscall	Rlimit	struct
5438	syscall	Stat_t	struct
5439	syscall	Flock_t	struct
5440	syscall	Dirent	struct
5441	syscall	RawSockaddrInet4	struct
5442	syscall	RawSockaddrInet6	struct
5443	syscall	RawSockaddrUnix	struct
5444	syscall	RawSockaddrDatalink	struct
5445	syscall	RawSockaddr	struct
5446	syscall	RawSockaddrAny	struct
5447	syscall	Linger	struct
5448	syscall	Iovec	struct
5449	syscall	IPMreq	struct
5450	syscall	IPv6Mreq	struct
5451	syscall	Msghdr	struct
5452	syscall	Cmsghdr	struct
5453	syscall	Inet6Pktinfo	struct
5454	syscall	IPv6MTUInfo	struct
5455	syscall	ICMPv6Filter	struct
5456	syscall	FdSet	struct
5457	syscall	IfMsghdr	struct
5458	syscall	IfData	struct
5459	syscall	IfaMsghdr	struct
5460	syscall	RtMsghdr	struct
5461	syscall	RtMetrics	struct
5462	syscall	BpfVersion	struct
5463	syscall	BpfStat	struct
5464	syscall	BpfProgram	struct
5465	syscall	BpfInsn	struct
5466	syscall	BpfTimeval	struct
5467	syscall	BpfHdr	struct
5468	syscall	Termios	struct
5469	testing	InternalBenchmark	struct
5470	testing	B	struct
5471	testing	BenchmarkResult	struct
5472	testing	PB	struct
5473	testing	CoverBlock	struct
5474	testing	Cover	struct
5475	testing	InternalExample	struct
5476	testdeps	TestDeps	struct
5477	quick	Generator	
5478	quick	Config	struct
5479	quick	SetupError	string
5480	quick	CheckError	struct
5481	quick	CheckEqualError	struct
5482	testing	TB	
5483	testing	T	struct
5484	testing	InternalTest	struct
5485	testing	M	struct
5486	scanner	Position	struct
5487	scanner	Scanner	struct
5488	tabwriter	Writer	struct
5489	template	ExecError	struct
5490	template	FuncMap	map[string]interface{}
5491	parse	Node	
5492	parse	NodeType	int
5493	parse	Pos	int
5494	parse	ListNode	struct
5495	parse	TextNode	struct
5496	parse	PipeNode	struct
5497	parse	ActionNode	struct
5498	parse	CommandNode	struct
5499	parse	IdentifierNode	struct
5500	parse	VariableNode	struct
5501	parse	DotNode	struct
5502	parse	NilNode	struct
5503	parse	FieldNode	struct
5504	parse	ChainNode	struct
5505	parse	BoolNode	struct
5506	parse	NumberNode	struct
5507	parse	StringNode	struct
5508	parse	BranchNode	struct
5509	parse	IfNode	struct
5510	parse	RangeNode	struct
5511	parse	WithNode	struct
5512	parse	TemplateNode	struct
5513	parse	Tree	struct
5514	template	Template	struct
5515	time	ParseError	struct
5516	main	MapZone	struct
5517	main	SupplementalData	struct
5518	time	Timer	struct
5519	time	Ticker	struct
5520	time	Time	struct
5521	time	Month	int
5522	time	Weekday	int
5523	time	Duration	int64
5524	time	Location	struct
5525	unicode	RangeTable	struct
5526	unicode	Range16	struct
5527	unicode	Range32	struct
5528	unicode	CaseRange	struct
5529	unicode	SpecialCase	[]unicode.CaseRange
5530	main	Char	struct
5531	main	Script	struct
5532	main	State	int
5533	main	Op	func(rune) bool
5534	unsafe	ArbitraryType	int
5535	unsafe	Pointer	*unsafe.ArbitraryType
5536	asn1	Tag	uint8
5537	cryptobyte	Builder	struct
5538	cryptobyte	BuilderContinuation	func(*cryptobyte.Builder)
5539	cryptobyte	BuildError	struct
5540	cryptobyte	MarshalingValue	
5541	cryptobyte	String	[]byte
5542	chacha20	Cipher	struct
5543	dnsmessage	Type	uint16
5544	dnsmessage	Class	uint16
5545	dnsmessage	OpCode	uint16
5546	dnsmessage	RCode	uint16
5547	dnsmessage	Header	struct
5548	dnsmessage	Message	struct
5549	dnsmessage	Resource	struct
5550	dnsmessage	ResourceBody	
5551	dnsmessage	Parser	struct
5552	dnsmessage	Builder	struct
5553	dnsmessage	ResourceHeader	struct
5554	dnsmessage	Name	struct
5555	dnsmessage	Question	struct
5556	dnsmessage	CNAMEResource	struct
5557	dnsmessage	MXResource	struct
5558	dnsmessage	NSResource	struct
5559	dnsmessage	PTRResource	struct
5560	dnsmessage	SOAResource	struct
5561	dnsmessage	TXTResource	struct
5562	dnsmessage	SRVResource	struct
5563	dnsmessage	AResource	struct
5564	dnsmessage	AAAAResource	struct
5565	httpproxy	Config	struct
5566	hpack	Encoder	struct
5567	hpack	DecodingError	struct
5568	hpack	InvalidIndexError	int
5569	hpack	HeaderField	struct
5570	hpack	Decoder	struct
5571	idna	Option	func(*idna.options)
5572	idna	Profile	struct
5573	lif	Addr	
5574	lif	Inet4Addr	struct
5575	lif	Inet6Addr	struct
5576	lif	Link	struct
5577	nettest	MakePipe	func() (net.Conn, func(), error)
5578	route	Addr	
5579	route	LinkAddr	struct
5580	route	Inet4Addr	struct
5581	route	Inet6Addr	struct
5582	route	DefaultAddr	struct
5583	route	InterfaceMessage	struct
5584	route	InterfaceAddrMessage	struct
5585	route	InterfaceMulticastAddrMessage	struct
5586	route	InterfaceAnnounceMessage	struct
5587	route	Message	
5588	route	Sys	
5589	route	SysType	int
5590	route	RouteMessage	struct
5591	route	RIBType	int
5592	route	RouteMetrics	struct
5593	route	InterfaceMetrics	struct
5594	route	RouteMetrics	struct
5595	route	InterfaceMetrics	struct
5596	route	RouteMetrics	struct
5597	route	InterfaceMetrics	struct
5598	route	RouteMetrics	struct
5599	route	InterfaceMetrics	struct
5600	route	RouteMetrics	struct
5601	route	InterfaceMetrics	struct
5602	bidirule	Transformer	struct
5603	transform	Transformer	
5604	transform	SpanningTransformer	
5605	transform	NopResetter	struct
5606	transform	Reader	struct
5607	transform	Writer	struct
5608	bidi	Direction	int
5609	bidi	Option	func(*bidi.options)
5610	bidi	Paragraph	struct
5611	bidi	Ordering	struct
5612	bidi	Run	struct
5613	bidi	Properties	struct
5614	bidi	Class	uint
5615	norm	Properties	struct
5616	norm	Iter	struct
5617	norm	Form	int
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
48	ssa	StorageClass	{}	{ssa.StorageClass}		17
49	ssa	String	{}	{string}		18
50	syntax	Pos	{}	{syntax.Pos}		20
51	syntax	syntax.Node	{}	{}		21
52	syntax	syntax.Node	{}	{}		22
53	syntax	syntax.Node	{}	{}		23
54	syntax	syntax.Stmt	{}	{}		24
55	pkg	ExportedMethod	{}	{}		26
56	pkg	io.Reader	{}	{}		26
57	codehost	Tags	{string}	{[]string,error}		27
58	codehost	Stat	{string}	{*codehost.RevInfo,error}		27
59	codehost	Latest	{}	{*codehost.RevInfo,error}		27
60	codehost	ReadFile	{string,string,int64}	{[]byte,error}		27
61	codehost	ReadFileRevs	{[]string,string,int64}	{map[string]*codehost.FileRev,error}		27
62	codehost	ReadZip	{string,string,int64}	{io.ReadCloser,string,error}		27
63	codehost	RecentTag	{string,string}	{string,error}		27
64	modfetch	ModulePath	{}	{string}		28
65	modfetch	Versions	{string}	{[]string,error}		28
66	modfetch	Stat	{string}	{*modfetch.RevInfo,error}		28
67	modfetch	Latest	{}	{*modfetch.RevInfo,error}		28
68	modfetch	GoMod	{string}	{[]byte,error}		28
69	modfetch	Zip	{string,string}	{string,error}		28
70	modfile	Span	{}	{modfile.Position}		29
71	modfile	Comment	{}	{*modfile.Comments}		29
72	mvs	Required	{module.Version}	{[]module.Version,error}		30
73	mvs	Max	{string,string}	{string}		30
74	mvs	Upgrade	{module.Version}	{module.Version,error}		30
75	mvs	Previous	{module.Version}	{module.Version,error}		30
76	p	p.A1	{}	{}		33
77	p	p.B1	{}	{}		34
78	p	p.C1	{}	{}		35
79	dwarf	Len	{}	{int64}		36
80	dwarf	PtrSize	{}	{int}		37
81	dwarf	AddInt	{dwarf.Sym,int,int64}	{}		37
82	dwarf	AddBytes	{dwarf.Sym,[]byte}	{}		37
83	dwarf	AddAddress	{dwarf.Sym,"interface{}",int64}	{}		37
84	dwarf	AddSectionOffset	{dwarf.Sym,int,"interface{}",int64}	{}		37
85	dwarf	AddDWARFSectionOffset	{dwarf.Sym,int,"interface{}",int64}	{}		37
86	dwarf	CurrentOffset	{dwarf.Sym}	{int64}		37
87	dwarf	RecordDclReference	{dwarf.Sym,dwarf.Sym,int,int}	{}		37
88	dwarf	RecordChildDieOffsets	{dwarf.Sym,[]*dwarf.Var,[]int32}	{}		37
89	dwarf	AddString	{dwarf.Sym,string}	{}		37
90	dwarf	AddFileRef	{dwarf.Sym,"interface{}"}	{}		37
91	dwarf	Logf	{string,"...interface{}"}	{}		37
92	objfile	PCToLine	{uint64}	{string,int,*gosym.Func}		41
93	objfile	String	{uint64}	{string}		42
94	main	Name	{}	{string}		44
95	main	Stat	{}	{os.FileInfo,error}		44
96	main	Read	{[]byte}	{int,error}		44
97	main	Close	{}	{error}		44
98	driver	Open	{string}	{io.WriteCloser,error}		46
99	driver	Bool	{string,bool,string}	{*bool}		47
100	driver	Int	{string,int,string}	{*int}		47
101	driver	Float64	{string,float64,string}	{*float64}		47
102	driver	String	{string,string,string}	{*string}		47
103	driver	BoolVar	{*bool,string,bool,string}	{}		47
104	driver	IntVar	{*int,string,int,string}	{}		47
105	driver	Float64Var	{*float64,string,float64,string}	{}		47
106	driver	StringVar	{*string,string,string,string}	{}		47
107	driver	StringList	{string,string,string}	{*[]*string}		47
108	driver	ExtraUsage	{}	{string}		47
109	driver	Parse	{func()}	{[]string}		47
110	driver	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		48
111	driver	Symbolize	{string,driver.MappingSources,*profile.Profile}	{error}		49
112	driver	Open	{string,uint64,uint64,uint64}	{driver.ObjFile,error}		50
113	driver	Disasm	{string,uint64,uint64}	{[]driver.Inst,error}		50
114	driver	Name	{}	{string}		51
115	driver	Base	{}	{uint64}		51
116	driver	BuildID	{}	{string}		51
117	driver	SourceLine	{uint64}	{[]driver.Frame,error}		51
118	driver	Symbols	{*regexp.Regexp,uint64}	{[]*driver.Sym,error}		51
119	driver	Close	{}	{error}		51
120	driver	ReadLine	{string}	{string,error}		52
121	driver	Print	{"...interface{}"}	{}		52
122	driver	PrintErr	{"...interface{}"}	{}		52
123	driver	IsTerminal	{}	{bool}		52
124	driver	WantBrowser	{}	{bool}		52
125	driver	SetAutoComplete	{"func(string) string"}	{}		52
126	plugin	Open	{string}	{io.WriteCloser,error}		53
127	plugin	Bool	{string,bool,string}	{*bool}		54
128	plugin	Int	{string,int,string}	{*int}		54
129	plugin	Float64	{string,float64,string}	{*float64}		54
130	plugin	String	{string,string,string}	{*string}		54
131	plugin	BoolVar	{*bool,string,bool,string}	{}		54
132	plugin	IntVar	{*int,string,int,string}	{}		54
133	plugin	Float64Var	{*float64,string,float64,string}	{}		54
134	plugin	StringVar	{*string,string,string,string}	{}		54
135	plugin	StringList	{string,string,string}	{*[]*string}		54
136	plugin	ExtraUsage	{}	{string}		54
137	plugin	Parse	{func()}	{[]string}		54
138	plugin	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		55
139	plugin	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}		56
140	plugin	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}		57
141	plugin	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}		57
142	plugin	Name	{}	{string}		58
143	plugin	Base	{}	{uint64}		58
144	plugin	BuildID	{}	{string}		58
145	plugin	SourceLine	{uint64}	{[]plugin.Frame,error}		58
146	plugin	Symbols	{*regexp.Regexp,uint64}	{[]*plugin.Sym,error}		58
147	plugin	Close	{}	{error}		58
148	plugin	ReadLine	{string}	{string,error}		59
149	plugin	Print	{"...interface{}"}	{}		59
150	plugin	PrintErr	{"...interface{}"}	{}		59
151	plugin	IsTerminal	{}	{bool}		59
152	plugin	WantBrowser	{}	{bool}		59
153	plugin	SetAutoComplete	{"func(string) string"}	{}		59
154	demangle	Traverse	{"func(demangle.AST) bool"}	{}		60
155	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}		60
156	demangle	GoString	{}	{string}		60
157	armasm	IsArg	{}	{}		61
158	armasm	String	{}	{string}		61
159	arm64asm	String	{}	{string}		62
160	ppc64asm	IsArg	{}	{}		63
161	ppc64asm	String	{}	{string}		63
162	x86asm	String	{}	{string}		64
163	debug	Close	{}	{error}		66
164	debug	Info	{uint32,string}	{error}		66
165	debug	Warning	{uint32,string}	{error}		66
166	debug	Error	{uint32,string}	{error}		66
167	svc	Execute	{[]string,"chan svc.ChangeRequest\n","chan svc.Status\n"}	{bool,uint32}		67
168	testdata	ReadByte	{}	{byte}		70
169	testdata	Pointer	{}	{uintptr}		71
170	testdata	UnsafeAddr	{}	{uintptr}		71
171	flate	Reset	{io.Reader,[]byte}	{error}		72
172	flate	io.Reader	{}	{}		73
173	flate	io.ByteReader	{}	{}		73
174	zlib	Reset	{io.Reader,[]byte}	{error}		74
175	heap	sort.Interface	{}	{}		75
176	heap	Push	{"interface{}"}	{}		75
177	heap	Pop	{}	{"interface{}"}		75
178	context	Deadline	{}	{time.Time,bool}		78
179	context	Done	{}	{"chan struct{}\n"}		78
180	context	Err	{}	{error}		78
181	context	Value	{"interface{}"}	{"interface{}"}		78
182	cipher	BlockSize	{}	{int}		79
183	cipher	Encrypt	{[]byte,[]byte}	{}		79
184	cipher	Decrypt	{[]byte,[]byte}	{}		79
185	cipher	XORKeyStream	{[]byte,[]byte}	{}		80
186	cipher	BlockSize	{}	{int}		81
187	cipher	CryptBlocks	{[]byte,[]byte}	{}		81
188	cipher	NonceSize	{}	{int}		82
189	cipher	Overhead	{}	{int}		82
190	cipher	Seal	{[]byte,[]byte,[]byte,[]byte}	{[]byte}		82
191	cipher	Open	{[]byte,[]byte,[]byte,[]byte}	{[]byte,error}		82
192	crypto	Public	{}	{crypto.PublicKey}		85
193	crypto	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}		85
194	crypto	HashFunc	{}	{crypto.Hash}		86
195	crypto	Public	{}	{crypto.PublicKey}		87
196	crypto	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}		87
197	elliptic	Params	{}	{*elliptic.CurveParams}		89
198	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}		89
199	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}		89
200	elliptic	Double	{*big.Int,*big.Int}	{*big.Int}		89
201	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int}		89
202	elliptic	ScalarBaseMult	{[]byte}	{*big.Int}		89
203	tls	Get	{string}	{*tls.ClientSessionState,bool}		90
204	tls	Put	{string,*tls.ClientSessionState}	{}		90
205	driver	Open	{string}	{driver.Conn,error}		95
206	driver	OpenConnector	{string}	{driver.Connector,error}		96
207	driver	Connect	{context.Context}	{driver.Conn,error}		97
208	driver	Driver	{}	{driver.Driver}		97
209	driver	Ping	{context.Context}	{error}		98
210	driver	Exec	{string,[]driver.Value}	{driver.Result,error}		99
211	driver	ExecContext	{context.Context,string,[]driver.NamedValue}	{driver.Result,error}		100
212	driver	Query	{string,[]driver.Value}	{driver.Rows,error}		101
213	driver	QueryContext	{context.Context,string,[]driver.NamedValue}	{driver.Rows,error}		102
214	driver	Prepare	{string}	{driver.Stmt,error}		103
215	driver	Close	{}	{error}		103
216	driver	Begin	{}	{driver.Tx,error}		103
217	driver	PrepareContext	{context.Context,string}	{driver.Stmt,error}		104
218	driver	BeginTx	{context.Context,driver.TxOptions}	{driver.Tx,error}		105
219	driver	ResetSession	{context.Context}	{error}		106
220	driver	LastInsertId	{}	{int64,error}		107
221	driver	RowsAffected	{}	{int64,error}		107
222	driver	Close	{}	{error}		108
223	driver	NumInput	{}	{int}		108
224	driver	Exec	{[]driver.Value}	{driver.Result,error}		108
225	driver	Query	{[]driver.Value}	{driver.Rows,error}		108
226	driver	ExecContext	{context.Context,[]driver.NamedValue}	{driver.Result,error}		109
227	driver	QueryContext	{context.Context,[]driver.NamedValue}	{driver.Rows,error}		110
228	driver	CheckNamedValue	{*driver.NamedValue}	{error}		111
229	driver	ColumnConverter	{int}	{driver.ValueConverter}		112
230	driver	Columns	{}	{[]string}		113
231	driver	Close	{}	{error}		113
232	driver	Next	{[]driver.Value}	{error}		113
233	driver	driver.Rows	{}	{}		114
234	driver	HasNextResultSet	{}	{bool}		114
235	driver	NextResultSet	{}	{error}		114
236	driver	driver.Rows	{}	{}		115
237	driver	ColumnTypeScanType	{int}	{reflect.Type}		115
238	driver	driver.Rows	{}	{}		116
239	driver	ColumnTypeDatabaseTypeName	{int}	{string}		116
240	driver	driver.Rows	{}	{}		117
241	driver	ColumnTypeLength	{int}	{int64,bool}		117
242	driver	driver.Rows	{}	{}		118
243	driver	ColumnTypeNullable	{int}	{bool}		118
244	driver	driver.Rows	{}	{}		119
245	driver	ColumnTypePrecisionScale	{int}	{int64,bool}		119
246	driver	Commit	{}	{error}		120
247	driver	Rollback	{}	{error}		120
248	driver	ConvertValue	{"interface{}"}	{driver.Value,error}		121
249	driver	Value	{}	{driver.Value,error}		122
250	sql	Scan	{"interface{}"}	{error}		124
251	sql	LastInsertId	{}	{int64,error}		126
252	sql	RowsAffected	{}	{int64,error}		126
253	dwarf	Common	{}	{*dwarf.CommonType}		128
254	dwarf	String	{}	{string}		128
255	dwarf	Size	{}	{int64}		128
256	macho	Raw	{}	{[]byte}		129
257	binary	Uint16	{[]byte}	{uint16}		131
258	binary	Uint32	{[]byte}	{uint32}		131
259	binary	Uint64	{[]byte}	{uint64}		131
260	binary	PutUint16	{[]byte,uint16}	{}		131
261	binary	PutUint32	{[]byte,uint32}	{}		131
262	binary	PutUint64	{[]byte,uint64}	{}		131
263	binary	String	{}	{string}		131
264	encoding	MarshalBinary	{}	{[]byte,error}		132
265	encoding	UnmarshalBinary	{[]byte}	{error}		133
266	encoding	MarshalText	{}	{[]byte,error}		134
267	encoding	UnmarshalText	{[]byte}	{error}		135
268	gob	GobEncode	{}	{[]byte,error}		136
269	gob	GobDecode	{[]byte}	{error}		137
270	json	UnmarshalJSON	{[]byte}	{error}		138
271	json	MarshalJSON	{}	{[]byte,error}		139
272	xml	MarshalXML	{*xml.Encoder,xml.StartElement}	{error}		141
273	xml	MarshalXMLAttr	{xml.Name}	{xml.Attr,error}		142
274	xml	UnmarshalXML	{*xml.Decoder,xml.StartElement}	{error}		143
275	xml	UnmarshalXMLAttr	{xml.Attr}	{error}		144
276	xml	Token	{}	{xml.Token,error}		146
277	expvar	String	{}	{string}		147
278	flag	String	{}	{string}		148
279	flag	Set	{string}	{error}		148
280	flag	flag.Value	{}	{}		149
281	flag	Get	{}	{"interface{}"}		149
282	fmt	Write	{[]byte}	{int,error}		150
283	fmt	Width	{}	{int,bool}		150
284	fmt	Precision	{}	{int,bool}		150
285	fmt	Flag	{int}	{bool}		150
286	fmt	Format	{fmt.State,rune}	{}		151
287	fmt	String	{}	{string}		152
288	fmt	GoString	{}	{string}		153
289	fmt	ReadRune	{}	{rune,int,error}		154
290	fmt	UnreadRune	{}	{error}		154
291	fmt	SkipSpace	{}	{}		154
292	fmt	Token	{bool,"func(rune) bool"}	{[]byte,error}		154
293	fmt	Width	{}	{int,bool}		154
294	fmt	Read	{[]byte}	{int,error}		154
295	fmt	Scan	{fmt.ScanState,rune}	{error}		155
296	ast	Pos	{}	{token.Pos}		156
297	ast	End	{}	{token.Pos}		156
298	ast	ast.Node	{}	{}		157
299	ast	ast.Node	{}	{}		158
300	ast	ast.Node	{}	{}		159
301	ast	ast.Node	{}	{}		160
302	ast	Visit	{ast.Node}	{ast.Visitor}		164
303	constant	Kind	{}	{constant.Kind}		165
304	constant	String	{}	{string}		165
305	constant	ExactString	{}	{string}		165
306	exports	exports.T12	{}	{}		172
307	exports	exports.T13	{}	{}		172
308	p	M	{}	{}		173
309	issue25301	M	{}	{}		174
310	issue25301	issue25301.A	{}	{}		175
311	issue25596	M	{}	{issue25596.T}		176
312	issue25596	issue25596.E	{}	{}		177
313	types	Import	{string}	{*types.Package,error}		179
314	types	types.Importer	{}	{}		180
315	types	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}		180
316	types	Parent	{}	{*types.Scope}		181
317	types	Pos	{}	{token.Pos}		181
318	types	Pkg	{}	{*types.Package}		181
319	types	Name	{}	{string}		181
320	types	Type	{}	{types.Type}		181
321	types	Exported	{}	{bool}		181
322	types	Id	{}	{string}		181
323	types	String	{}	{string}		181
324	types	Alignof	{types.Type}	{int64}		182
325	types	Offsetsof	{[]*types.Var}	{[]int64}		182
326	types	Sizeof	{types.Type}	{int64}		182
327	types	Underlying	{}	{types.Type}		183
328	types	String	{}	{string}		183
329	hash	io.Writer	{}	{}		184
330	hash	Sum	{[]byte}	{[]byte}		184
331	hash	Reset	{}	{}		184
332	hash	Size	{}	{int}		184
333	hash	BlockSize	{}	{int}		184
334	hash	hash.Hash	{}	{}		185
335	hash	Sum32	{}	{uint32}		185
336	hash	hash.Hash	{}	{}		186
337	hash	Sum64	{}	{uint64}		186
338	color	RGBA	{}	{uint32}		187
339	color	Convert	{color.Color}	{color.Color}		188
340	draw	image.Image	{}	{}		189
341	draw	Set	{int,int,color.Color}	{}		189
342	draw	Quantize	{color.Palette,image.Image}	{color.Palette}		190
343	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}		191
344	image	ColorModel	{}	{color.Model}		192
345	image	Bounds	{}	{image.Rectangle}		192
346	image	At	{int,int}	{color.Color}		192
347	image	ColorIndexAt	{int,int}	{uint8}		193
348	image	image.Image	{}	{}		193
349	jpeg	io.ByteReader	{}	{}		194
350	jpeg	io.Reader	{}	{}		194
351	png	Get	{}	{*png.EncoderBuffer}		195
352	png	Put	{*png.EncoderBuffer}	{}		195
353	testlog	Getenv	{string}	{}		197
354	testlog	Stat	{string}	{}		197
355	testlog	Open	{string}	{}		197
356	testlog	Chdir	{string}	{}		197
357	io	Read	{[]byte}	{int,error}		198
358	io	Write	{[]byte}	{int,error}		199
359	io	Close	{}	{error}		200
360	io	Seek	{int64,int}	{int64,error}		201
361	io	io.Reader	{}	{}		202
362	io	io.Writer	{}	{}		202
363	io	io.Reader	{}	{}		203
364	io	io.Closer	{}	{}		203
365	io	io.Writer	{}	{}		204
366	io	io.Closer	{}	{}		204
367	io	io.Reader	{}	{}		205
368	io	io.Writer	{}	{}		205
369	io	io.Closer	{}	{}		205
370	io	io.Reader	{}	{}		206
371	io	io.Seeker	{}	{}		206
372	io	io.Writer	{}	{}		207
373	io	io.Seeker	{}	{}		207
374	io	io.Reader	{}	{}		208
375	io	io.Writer	{}	{}		208
376	io	io.Seeker	{}	{}		208
377	io	ReadFrom	{io.Reader}	{int64,error}		209
378	io	WriteTo	{io.Writer}	{int64,error}		210
379	io	ReadAt	{[]byte,int64}	{int,error}		211
380	io	WriteAt	{[]byte,int64}	{int,error}		212
381	io	ReadByte	{}	{byte,error}		213
382	io	io.ByteReader	{}	{}		214
383	io	UnreadByte	{}	{error}		214
384	io	WriteByte	{byte}	{error}		215
385	io	ReadRune	{}	{rune,int,error}		216
386	io	io.RuneReader	{}	{}		217
387	io	UnreadRune	{}	{error}		217
388	rand	Int63	{}	{int64}		218
389	rand	Seed	{int64}	{}		218
390	rand	rand.Source	{}	{}		219
391	rand	Uint64	{}	{uint64}		219
392	multipart	io.Reader	{}	{}		220
393	multipart	io.ReaderAt	{}	{}		220
394	multipart	io.Seeker	{}	{}		220
395	multipart	io.Closer	{}	{}		220
396	http	RoundTrip	{*http.Request}	{*http.Response,error}		221
397	cookiejar	PublicSuffix	{string}	{string}		222
398	cookiejar	String	{}	{string}		222
399	http	Open	{string}	{http.File,error}		223
400	http	io.Closer	{}	{}		224
401	http	io.Reader	{}	{}		224
402	http	io.Seeker	{}	{}		224
403	http	Readdir	{int}	{[]os.FileInfo,error}		224
404	http	Stat	{}	{os.FileInfo,error}		224
405	http	Push	{string,*http.PushOptions}	{error}		226
406	httputil	Get	{}	{[]byte}		227
407	httputil	Put	{[]byte}	{}		227
408	http	SetCookies	{*url.URL,[]*http.Cookie}	{}		228
409	http	Cookies	{*url.URL}	{[]*http.Cookie}		228
410	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}		229
411	http	Header	{}	{http.Header}		230
412	http	Write	{[]byte}	{int,error}		230
413	http	WriteHeader	{int}	{}		230
414	http	Flush	{}	{}		231
415	http	Hijack	{}	{net.Conn,*bufio.ReadWriter,error}		232
416	http	CloseNotify	{}	{"chan bool\n"}		233
417	net	Network	{}	{string}		234
418	net	String	{}	{string}		234
419	net	Read	{[]byte}	{int,error}		235
420	net	Write	{[]byte}	{int,error}		235
421	net	Close	{}	{error}		235
422	net	LocalAddr	{}	{net.Addr}		235
423	net	RemoteAddr	{}	{net.Addr}		235
424	net	SetDeadline	{time.Time}	{error}		235
425	net	SetReadDeadline	{time.Time}	{error}		235
426	net	SetWriteDeadline	{time.Time}	{error}		235
427	net	ReadFrom	{[]byte}	{int,net.Addr,error}		236
428	net	WriteTo	{[]byte,net.Addr}	{int,error}		236
429	net	Close	{}	{error}		236
430	net	LocalAddr	{}	{net.Addr}		236
431	net	SetDeadline	{time.Time}	{error}		236
432	net	SetReadDeadline	{time.Time}	{error}		236
433	net	SetWriteDeadline	{time.Time}	{error}		236
434	net	Accept	{}	{net.Conn,error}		237
435	net	Close	{}	{error}		237
436	net	Addr	{}	{net.Addr}		237
437	net	Timeout	{}	{bool}		238
438	net	Temporary	{}	{bool}		238
439	rpc	WriteRequest	{*rpc.Request,"interface{}"}	{error}		241
440	rpc	ReadResponseHeader	{*rpc.Response}	{error}		241
441	rpc	ReadResponseBody	{"interface{}"}	{error}		241
442	rpc	Close	{}	{error}		241
443	rpc	ReadRequestHeader	{*rpc.Request}	{error}		245
444	rpc	ReadRequestBody	{"interface{}"}	{error}		245
445	rpc	WriteResponse	{*rpc.Response,"interface{}"}	{error}		245
446	rpc	Close	{}	{error}		245
447	smtp	Start	{*smtp.ServerInfo}	{string,[]byte,error}		246
448	smtp	Next	{[]byte,bool}	{[]byte,error}		246
449	os	String	{}	{string}		247
450	os	Signal	{}	{}		247
451	os	Name	{}	{string}		248
452	os	Size	{}	{int64}		248
453	os	Mode	{}	{os.FileMode}		248
454	os	ModTime	{}	{time.Time}		248
455	os	IsDir	{}	{bool}		248
456	os	Sys	{}	{"interface{}"}		248
457	reflect	Align	{}	{int}		250
458	reflect	FieldAlign	{}	{int}		250
459	reflect	Method	{int}	{reflect.Method}		250
460	reflect	MethodByName	{string}	{reflect.Method,bool}		250
461	reflect	NumMethod	{}	{int}		250
462	reflect	Name	{}	{string}		250
463	reflect	PkgPath	{}	{string}		250
464	reflect	Size	{}	{uintptr}		250
465	reflect	String	{}	{string}		250
466	reflect	Kind	{}	{reflect.Kind}		250
467	reflect	Implements	{reflect.Type}	{bool}		250
468	reflect	AssignableTo	{reflect.Type}	{bool}		250
469	reflect	ConvertibleTo	{reflect.Type}	{bool}		250
470	reflect	Comparable	{}	{bool}		250
471	reflect	Bits	{}	{int}		250
472	reflect	ChanDir	{}	{reflect.ChanDir}		250
473	reflect	IsVariadic	{}	{bool}		250
474	reflect	Elem	{}	{reflect.Type}		250
475	reflect	Field	{int}	{reflect.StructField}		250
476	reflect	FieldByIndex	{[]int}	{reflect.StructField}		250
477	reflect	FieldByName	{string}	{reflect.StructField,bool}		250
478	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.StructField,bool}		250
479	reflect	In	{int}	{reflect.Type}		250
480	reflect	Key	{}	{reflect.Type}		250
481	reflect	Len	{}	{int}		250
482	reflect	NumField	{}	{int}		250
483	reflect	NumIn	{}	{int}		250
484	reflect	NumOut	{}	{int}		250
485	reflect	Out	{int}	{reflect.Type}		250
486	runtime	RuntimeError	{}	{}		251
487	sort	Len	{}	{int}		252
488	sort	Less	{int,int}	{bool}		252
489	sort	Swap	{int,int}	{}		252
490	sync	Lock	{}	{}		253
491	sync	Unlock	{}	{}		253
492	syscall	Control	{func(uintptr)}	{error}		255
493	syscall	Read	{"func(uintptr) bool"}	{error}		255
494	syscall	Write	{"func(uintptr) bool"}	{error}		255
495	syscall	SyscallConn	{}	{syscall.RawConn,error}		256
496	quick	Generate	{*rand.Rand,int}	{reflect.Value}		263
497	testing	Error	{"...interface{}"}	{}		264
498	testing	Errorf	{string,"...interface{}"}	{}		264
499	testing	Fail	{}	{}		264
500	testing	FailNow	{}	{}		264
501	testing	Failed	{}	{bool}		264
502	testing	Fatal	{"...interface{}"}	{}		264
503	testing	Fatalf	{string,"...interface{}"}	{}		264
504	testing	Log	{"...interface{}"}	{}		264
505	testing	Logf	{string,"...interface{}"}	{}		264
506	testing	Name	{}	{string}		264
507	testing	Skip	{"...interface{}"}	{}		264
508	testing	SkipNow	{}	{}		264
509	testing	Skipf	{string,"...interface{}"}	{}		264
510	testing	Skipped	{}	{bool}		264
511	testing	Helper	{}	{}		264
512	parse	Type	{}	{parse.NodeType}		265
513	parse	String	{}	{string}		265
514	parse	Copy	{}	{parse.Node}		265
515	parse	Position	{}	{parse.Pos}		265
516	cryptobyte	Marshal	{*cryptobyte.Builder}	{error}		266
517	lif	Family	{}	{int}		268
518	route	Family	{}	{int}		269
519	route	Sys	{}	{[]route.Sys}		270
520	route	SysType	{}	{route.SysType}		271
521	transform	Transform	{[]byte,[]byte,bool}	{int,error}		272
522	transform	Reset	{}	{}		272
523	transform	transform.Transformer	{}	{}		273
524	transform	Span	{[]byte,bool}	{int,error}		273
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
27	codehost	Repo	t
28	modfetch	Repo	t
29	modfile	Expr	t
30	mvs	Reqs	t
31	web2	Option	f
32	p	A1	f
33	p	B1	t
34	p	C1	t
35	p	D1	t
36	dwarf	Sym	t
37	dwarf	Context	t
38	dwarf	Data	t
39	obj	Val	t
40	obj	Curfn	t
41	objfile	Liner	t
42	objfile	RelocStringer	t
43	sym	Elfsect	t
44	main	FileLike	t
45	main	Arg	t
46	driver	Writer	t
47	driver	FlagSet	t
48	driver	Fetcher	t
49	driver	Symbolizer	t
50	driver	ObjTool	t
51	driver	ObjFile	t
52	driver	UI	t
53	plugin	Writer	t
54	plugin	FlagSet	t
55	plugin	Fetcher	t
56	plugin	Symbolizer	t
57	plugin	ObjTool	t
58	plugin	ObjFile	t
59	plugin	UI	t
60	demangle	AST	f
61	armasm	Arg	t
62	arm64asm	Arg	f
63	ppc64asm	Arg	t
64	x86asm	Arg	f
65	unix	Sockaddr	f
66	debug	Log	t
67	svc	Handler	t
68	windows	Sockaddr	f
69	main	Data	t
70	testdata	MethodTestInterface	t
71	testdata	V	t
72	flate	Resetter	t
73	flate	Reader	t
74	zlib	Resetter	t
75	heap	Interface	t
76	list	Value	t
77	ring	Value	t
78	context	Context	t
79	cipher	Block	t
80	cipher	Stream	t
81	cipher	BlockMode	t
82	cipher	AEAD	t
83	crypto	PublicKey	t
84	crypto	PrivateKey	t
85	crypto	Signer	t
86	crypto	SignerOpts	t
87	crypto	Decrypter	t
88	crypto	DecrypterOpts	t
89	elliptic	Curve	t
90	tls	ClientSessionCache	t
91	pkix	Value	t
92	x509	PublicKey	t
93	x509	PublicKey	t
94	driver	Value	t
95	driver	Driver	t
96	driver	DriverContext	t
97	driver	Connector	t
98	driver	Pinger	t
99	driver	Execer	t
100	driver	ExecerContext	t
101	driver	Queryer	t
102	driver	QueryerContext	t
103	driver	Conn	t
104	driver	ConnPrepareContext	t
105	driver	ConnBeginTx	t
106	driver	SessionResetter	t
107	driver	Result	t
108	driver	Stmt	t
109	driver	StmtExecContext	t
110	driver	StmtQueryContext	t
111	driver	NamedValueChecker	t
112	driver	ColumnConverter	t
113	driver	Rows	t
114	driver	RowsNextResultSet	t
115	driver	RowsColumnTypeScanType	t
116	driver	RowsColumnTypeDatabaseTypeName	t
117	driver	RowsColumnTypeLength	t
118	driver	RowsColumnTypeNullable	t
119	driver	RowsColumnTypePrecisionScale	t
120	driver	Tx	t
121	driver	ValueConverter	t
122	driver	Valuer	t
123	sql	Value	t
124	sql	Scanner	t
125	sql	Dest	t
126	sql	Result	t
127	dwarf	Val	t
128	dwarf	Type	t
129	macho	Load	t
130	pe	OptionalHeader	t
131	binary	ByteOrder	t
132	encoding	BinaryMarshaler	t
133	encoding	BinaryUnmarshaler	t
134	encoding	TextMarshaler	t
135	encoding	TextUnmarshaler	t
136	gob	GobEncoder	t
137	gob	GobDecoder	t
138	json	Unmarshaler	t
139	json	Marshaler	t
140	json	Token	t
141	xml	Marshaler	t
142	xml	MarshalerAttr	t
143	xml	Unmarshaler	t
144	xml	UnmarshalerAttr	t
145	xml	Token	t
146	xml	TokenReader	t
147	expvar	Var	t
148	flag	Value	t
149	flag	Getter	t
150	fmt	State	t
151	fmt	Formatter	t
152	fmt	Stringer	t
153	fmt	GoStringer	t
154	fmt	ScanState	t
155	fmt	Scanner	t
156	ast	Node	t
157	ast	Expr	f
158	ast	Stmt	f
159	ast	Decl	f
160	ast	Spec	f
161	ast	Decl	t
162	ast	Data	t
163	ast	Type	t
164	ast	Visitor	t
165	constant	Value	f
166	error1	I0	f
167	error1	ExportedField	f
168	error2	I0	f
169	error2	ExportedField	f
170	exports	T12	t
171	exports	T13	f
172	exports	T14	f
173	p	V	t
174	issue25301	A	t
175	issue25301	T	t
176	issue25596	E	t
177	issue25596	T	t
178	printer	Node	t
179	types	Importer	t
180	types	ImporterFrom	t
181	types	Object	f
182	types	Sizes	t
183	types	Type	t
184	hash	Hash	t
185	hash	Hash32	t
186	hash	Hash64	t
187	color	Color	t
188	color	Model	t
189	draw	Image	t
190	draw	Quantizer	t
191	draw	Drawer	t
192	image	Image	t
193	image	PalettedImage	t
194	jpeg	Reader	t
195	png	EncoderBufferPool	t
196	singleflight	Val	t
197	testlog	Interface	t
198	io	Reader	t
199	io	Writer	t
200	io	Closer	t
201	io	Seeker	t
202	io	ReadWriter	t
203	io	ReadCloser	t
204	io	WriteCloser	t
205	io	ReadWriteCloser	t
206	io	ReadSeeker	t
207	io	WriteSeeker	t
208	io	ReadWriteSeeker	t
209	io	ReaderFrom	t
210	io	WriterTo	t
211	io	ReaderAt	t
212	io	WriterAt	t
213	io	ByteReader	t
214	io	ByteScanner	t
215	io	ByteWriter	t
216	io	RuneReader	t
217	io	RuneScanner	t
218	rand	Source	t
219	rand	Source64	t
220	multipart	File	t
221	http	RoundTripper	t
222	cookiejar	PublicSuffixList	t
223	http	FileSystem	t
224	http	File	t
225	http	I	f
226	http	Pusher	t
227	httputil	BufferPool	t
228	http	CookieJar	t
229	http	Handler	t
230	http	ResponseWriter	t
231	http	Flusher	t
232	http	Hijacker	t
233	http	CloseNotifier	t
234	net	Addr	t
235	net	Conn	t
236	net	PacketConn	t
237	net	Listener	t
238	net	Error	f
239	rpc	Args	t
240	rpc	Reply	t
241	rpc	ClientCodec	t
242	jsonrpc	Error	t
243	jsonrpc	Result	t
244	jsonrpc	Error	t
245	rpc	ServerCodec	t
246	smtp	Auth	t
247	os	Signal	t
248	os	FileInfo	t
249	plugin	Symbol	t
250	reflect	Type	f
251	runtime	Error	f
252	sort	Interface	t
253	sync	Locker	t
254	js	TypedArray	t
255	syscall	RawConn	t
256	syscall	Conn	t
257	syscall	Sockaddr	t
258	syscall	Sockaddr	f
259	syscall	RoutingMessage	f
260	syscall	RoutingMessage	f
261	syscall	Sockaddr	f
262	syscall	Sockaddr	f
263	quick	Generator	t
264	testing	TB	f
265	parse	Node	f
266	cryptobyte	MarshalingValue	t
267	dnsmessage	ResourceBody	f
268	lif	Addr	t
269	route	Addr	t
270	route	Message	t
271	route	Sys	t
272	transform	Transformer	t
273	transform	SpanningTransformer	t
\.


--
-- Name: concrete_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_methods_id_seq', 4000, true);


--
-- Name: concrete_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_types_id_seq', 5617, true);


--
-- Name: interface_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interface_methods_id_seq', 524, true);


--
-- Name: interfaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interfaces_id_seq', 273, true);


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

