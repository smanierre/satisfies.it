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
2	tar	Next	{}	{*tar.Header,error}	*Reader	2
3	tar	Read	{[]byte}	{int,error}	*Reader	2
4	tar	Flush	{}	{error}	*Writer	3
5	tar	WriteHeader	{*tar.Header}	{error}	*Writer	3
6	tar	Write	{[]byte}	{int,error}	*Writer	3
7	tar	Close	{}	{error}	*Writer	3
8	zip	RegisterDecompressor	{uint16,zip.Decompressor}	{}	*Reader	4
9	zip	Close	{}	{error}	*ReadCloser	5
10	zip	DataOffset	{}	{int64,error}	*File	6
11	zip	Open	{}	{io.ReadCloser,error}	*File	6
12	zip	FileInfo	{}	{os.FileInfo}	*FileHeader	9
13	zip	ModTime	{}	{time.Time}	*FileHeader	9
14	zip	SetModTime	{time.Time}	{}	*FileHeader	9
15	zip	Mode	{}	{os.FileMode}	*FileHeader	9
16	zip	SetMode	{os.FileMode}	{}	*FileHeader	9
17	zip	SetOffset	{int64}	{}	*Writer	10
18	zip	Flush	{}	{error}	*Writer	10
19	zip	Close	{}	{error}	*Writer	10
20	zip	Create	{string}	{io.Writer,error}	*Writer	10
21	zip	CreateHeader	{*zip.FileHeader}	{io.Writer,error}	*Writer	10
22	zip	RegisterCompressor	{uint16,zip.Compressor}	{}	*Writer	10
23	bufio	Reset	{io.Reader}	{}	*Reader	11
24	bufio	Peek	{int}	{[]byte,error}	*Reader	11
25	bufio	Discard	{int}	{int,error}	*Reader	11
26	bufio	Read	{[]byte}	{int,error}	*Reader	11
27	bufio	ReadByte	{}	{byte,error}	*Reader	11
28	bufio	UnreadByte	{}	{error}	*Reader	11
29	bufio	ReadRune	{}	{rune,int,error}	*Reader	11
30	bufio	UnreadRune	{}	{error}	*Reader	11
31	bufio	Buffered	{}	{int}	*Reader	11
32	bufio	ReadSlice	{byte}	{[]byte,error}	*Reader	11
33	bufio	ReadLine	{}	{[]byte,bool,error}	*Reader	11
34	bufio	ReadBytes	{byte}	{[]byte,error}	*Reader	11
35	bufio	ReadString	{byte}	{string,error}	*Reader	11
36	bufio	WriteTo	{io.Writer}	{int64,error}	*Reader	11
37	bufio	Reset	{io.Writer}	{}	*Writer	12
38	bufio	Flush	{}	{error}	*Writer	12
39	bufio	Available	{}	{int}	*Writer	12
40	bufio	Buffered	{}	{int}	*Writer	12
41	bufio	Write	{[]byte}	{int,error}	*Writer	12
42	bufio	WriteByte	{byte}	{error}	*Writer	12
43	bufio	WriteRune	{rune}	{int,error}	*Writer	12
44	bufio	WriteString	{string}	{int,error}	*Writer	12
45	bufio	ReadFrom	{io.Reader}	{int64,error}	*Writer	12
46	bufio	Err	{}	{error}	*Scanner	14
47	bufio	Bytes	{}	{[]byte}	*Scanner	14
48	bufio	Text	{}	{string}	*Scanner	14
49	bufio	Scan	{}	{bool}	*Scanner	14
50	bufio	Buffer	{[]byte,int}	{}	*Scanner	14
51	bufio	Split	{bufio.SplitFunc}	{}	*Scanner	14
52	bytes	Bytes	{}	{[]byte}	*Buffer	21
53	bytes	String	{}	{string}	*Buffer	21
54	bytes	Len	{}	{int}	*Buffer	21
55	bytes	Cap	{}	{int}	*Buffer	21
56	bytes	Truncate	{int}	{}	*Buffer	21
57	bytes	Reset	{}	{}	*Buffer	21
58	bytes	Grow	{int}	{}	*Buffer	21
59	bytes	Write	{[]byte}	{int,error}	*Buffer	21
60	bytes	WriteString	{string}	{int,error}	*Buffer	21
61	bytes	ReadFrom	{io.Reader}	{int64,error}	*Buffer	21
62	bytes	WriteTo	{io.Writer}	{int64,error}	*Buffer	21
63	bytes	WriteByte	{byte}	{error}	*Buffer	21
64	bytes	WriteRune	{rune}	{int,error}	*Buffer	21
65	bytes	Read	{[]byte}	{int,error}	*Buffer	21
66	bytes	Next	{int}	{[]byte}	*Buffer	21
67	bytes	ReadByte	{}	{byte,error}	*Buffer	21
68	bytes	ReadRune	{}	{rune,int,error}	*Buffer	21
69	bytes	UnreadRune	{}	{error}	*Buffer	21
70	bytes	UnreadByte	{}	{error}	*Buffer	21
71	bytes	ReadBytes	{byte}	{[]byte,error}	*Buffer	21
72	bytes	ReadString	{byte}	{string,error}	*Buffer	21
73	bytes	Len	{}	{int}	*Reader	22
74	bytes	Size	{}	{int64}	*Reader	22
75	bytes	Read	{[]byte}	{int,error}	*Reader	22
76	bytes	ReadAt	{[]byte,int64}	{int,error}	*Reader	22
77	bytes	ReadByte	{}	{byte,error}	*Reader	22
78	bytes	UnreadByte	{}	{error}	*Reader	22
79	bytes	ReadRune	{}	{rune,int,error}	*Reader	22
80	bytes	UnreadRune	{}	{error}	*Reader	22
81	bytes	Seek	{int64,int}	{int64,error}	*Reader	22
82	bytes	WriteTo	{io.Writer}	{int64,error}	*Reader	22
83	bytes	Reset	{[]byte}	{}	*Reader	22
84	main	Features	{}	{[]string}	*Walker	23
85	main	Import	{string}	{*types.Package,error}	*Walker	23
86	p1	StructValueMethod	{}	{}	S	26
87	p1	StructValueMethodNamedRecv	{}	{}	S	26
88	p1	SMethod	{int8,int16,int64}	{}	*S2	29
89	p1	JustOnT	{}	{}	*T	37
90	p1	JustOnB	{}	{}	*B	38
91	p1	OnEmbedded	{}	{}	*Embedded	42
92	p3	GoodPlayer	{}	{int}	*ThirdBase	46
93	asm	Parse	{}	{*obj.Prog,bool}	*Parser	48
94	flags	String	{}	{string}	*MultiFlag	50
95	flags	Set	{string}	{error}	*MultiFlag	50
96	lex	Error	{"...interface{}"}	{}	*Input	51
97	lex	Next	{}	{lex.ScanToken}	*Input	51
98	lex	Text	{}	{string}	*Input	51
99	lex	Push	{lex.TokenReader}	{}	*Input	51
100	lex	Close	{}	{}	*Input	51
101	lex	String	{}	{string}	ScanToken	52
102	lex	String	{}	{string}	Token	54
103	lex	Next	{}	{lex.ScanToken}	*Slice	56
104	lex	Text	{}	{string}	*Slice	56
105	lex	File	{}	{string}	*Slice	56
106	lex	Base	{}	{*src.PosBase}	*Slice	56
107	lex	SetBase	{*src.PosBase}	{}	*Slice	56
108	lex	Line	{}	{int}	*Slice	56
109	lex	Col	{}	{int}	*Slice	56
110	lex	Close	{}	{}	*Slice	56
111	lex	Push	{lex.TokenReader}	{}	*Stack	57
112	lex	Next	{}	{lex.ScanToken}	*Stack	57
113	lex	Text	{}	{string}	*Stack	57
114	lex	File	{}	{string}	*Stack	57
115	lex	Base	{}	{*src.PosBase}	*Stack	57
116	lex	SetBase	{*src.PosBase}	{}	*Stack	57
117	lex	Line	{}	{int}	*Stack	57
118	lex	Col	{}	{int}	*Stack	57
119	lex	Close	{}	{}	*Stack	57
120	lex	Text	{}	{string}	*Tokenizer	58
121	lex	File	{}	{string}	*Tokenizer	58
122	lex	Base	{}	{*src.PosBase}	*Tokenizer	58
123	lex	SetBase	{*src.PosBase}	{}	*Tokenizer	58
124	lex	Line	{}	{int}	*Tokenizer	58
125	lex	Col	{}	{int}	*Tokenizer	58
126	lex	Next	{}	{lex.ScanToken}	*Tokenizer	58
127	lex	Close	{}	{}	*Tokenizer	58
128	main	Translate	{*main.File}	{}	*Package	59
129	main	Record	{*main.File}	{}	*Package	59
130	main	Fatalf	{string,"...interface{}"}	{}	*Package	59
131	main	Printf	{string,"...interface{}"}	{}	*Package	59
132	main	ParseGo	{string,[]byte}	{}	*File	60
133	main	DiscardCgoDirectives	{}	{}	*File	60
134	main	Visit	{ast.Node}	{ast.Visitor}	*File	60
135	main	Bad	{token.Pos,"...interface{}"}	{}	*File	60
136	main	Badf	{token.Pos,string,"...interface{}"}	{}	*File	60
137	main	Warn	{token.Pos,"...interface{}"}	{}	*File	60
138	main	Warnf	{token.Pos,string,"...interface{}"}	{}	*File	60
139	main	Visit	{ast.Node}	{ast.Visitor}	*File	60
140	main	Pos	{}	{token.Pos}	*Ref	62
141	main	IsVar	{}	{bool}	*Name	63
142	main	IsConst	{}	{bool}	*Name	63
143	main	String	{}	{string}	*TypeRepr	65
144	main	Empty	{}	{bool}	*TypeRepr	65
145	main	Set	{string,"...interface{}"}	{}	*TypeRepr	65
146	gc	Ctype	{}	{gc.Ctype}	Val	70
147	gc	Interface	{}	{"interface{}"}	Val	70
148	gc	Format	{fmt.State,rune}	{}	Val	70
149	gc	String	{}	{string}	Class	77
150	gc	NewProg	{}	{*obj.Prog}	*Progs	79
151	gc	Flush	{}	{}	*Progs	79
152	gc	Free	{}	{}	*Progs	79
153	gc	Prog	{obj.As}	{*obj.Prog}	*Progs	79
154	gc	Appendpp	{*obj.Prog,obj.As,obj.AddrType,int16,int64,obj.AddrType,int16,int64}	{*obj.Prog}	*Progs	79
155	gc	SetInt	{*gc.Mpint}	{}	*Mpflt	80
156	gc	Set	{*gc.Mpflt}	{}	*Mpflt	80
157	gc	Add	{*gc.Mpflt}	{}	*Mpflt	80
158	gc	AddFloat64	{float64}	{}	*Mpflt	80
159	gc	Sub	{*gc.Mpflt}	{}	*Mpflt	80
160	gc	Mul	{*gc.Mpflt}	{}	*Mpflt	80
161	gc	MulFloat64	{float64}	{}	*Mpflt	80
162	gc	Quo	{*gc.Mpflt}	{}	*Mpflt	80
163	gc	Cmp	{*gc.Mpflt}	{int}	*Mpflt	80
164	gc	CmpFloat64	{float64}	{int}	*Mpflt	80
165	gc	Float64	{}	{float64}	*Mpflt	80
166	gc	Float32	{}	{float64}	*Mpflt	80
167	gc	SetFloat64	{float64}	{}	*Mpflt	80
168	gc	Neg	{}	{}	*Mpflt	80
169	gc	SetString	{string}	{}	*Mpflt	80
170	gc	String	{}	{string}	*Mpflt	80
171	gc	SetOverflow	{}	{}	*Mpint	82
172	gc	Set	{*gc.Mpint}	{}	*Mpint	82
173	gc	SetFloat	{*gc.Mpflt}	{bool}	*Mpint	82
174	gc	Add	{*gc.Mpint}	{}	*Mpint	82
175	gc	Sub	{*gc.Mpint}	{}	*Mpint	82
176	gc	Mul	{*gc.Mpint}	{}	*Mpint	82
177	gc	Quo	{*gc.Mpint}	{}	*Mpint	82
178	gc	Rem	{*gc.Mpint}	{}	*Mpint	82
179	gc	Or	{*gc.Mpint}	{}	*Mpint	82
180	gc	And	{*gc.Mpint}	{}	*Mpint	82
181	gc	AndNot	{*gc.Mpint}	{}	*Mpint	82
182	gc	Xor	{*gc.Mpint}	{}	*Mpint	82
183	gc	Lsh	{*gc.Mpint}	{}	*Mpint	82
184	gc	Rsh	{*gc.Mpint}	{}	*Mpint	82
185	gc	Cmp	{*gc.Mpint}	{int}	*Mpint	82
186	gc	CmpInt64	{int64}	{int}	*Mpint	82
187	gc	Neg	{}	{}	*Mpint	82
188	gc	Int64	{}	{int64}	*Mpint	82
189	gc	SetInt64	{int64}	{}	*Mpint	82
190	gc	SetString	{string}	{}	*Mpint	82
191	gc	String	{}	{string}	*Mpint	82
192	gc	Prog	{obj.As}	{*obj.Prog}	*SSAGenState	91
193	gc	Pc	{}	{*obj.Prog}	*SSAGenState	91
194	gc	SetPos	{src.XPos}	{}	*SSAGenState	91
195	gc	DebugFriendlySetPosFrom	{*ssa.Value}	{}	*SSAGenState	91
196	gc	FPJump	{*ssa.Block,*ssa.Block,*[][]gc.FloatingEQNEJump}	{}	*SSAGenState	91
197	gc	AddrScratch	{*obj.Addr}	{}	*SSAGenState	91
198	gc	Call	{*ssa.Value}	{*obj.Prog}	*SSAGenState	91
199	gc	Int64	{}	{int64}	*Node	96
200	gc	Bool	{}	{bool}	*Node	96
201	gc	Format	{fmt.State,rune}	{}	*Node	96
202	gc	String	{}	{string}	*Node	96
203	gc	Typ	{}	{*types.Type}	*Node	96
204	gc	IsMethod	{}	{bool}	*Node	96
205	gc	SliceBounds	{}	{*gc.Node}	*Node	96
206	gc	SetSliceBounds	{*gc.Node,*gc.Node,*gc.Node}	{}	*Node	96
207	gc	IsAutoTmp	{}	{bool}	*Node	96
208	gc	Class	{}	{gc.Class}	*Node	96
209	gc	Walkdef	{}	{uint8}	*Node	96
210	gc	Typecheck	{}	{uint8}	*Node	96
211	gc	Initorder	{}	{uint8}	*Node	96
212	gc	HasBreak	{}	{bool}	*Node	96
213	gc	IsClosureVar	{}	{bool}	*Node	96
214	gc	NoInline	{}	{bool}	*Node	96
215	gc	IsOutputParamHeapAddr	{}	{bool}	*Node	96
216	gc	Assigned	{}	{bool}	*Node	96
217	gc	Addrtaken	{}	{bool}	*Node	96
218	gc	Implicit	{}	{bool}	*Node	96
219	gc	Isddd	{}	{bool}	*Node	96
220	gc	Local	{}	{bool}	*Node	96
221	gc	Diag	{}	{bool}	*Node	96
222	gc	Colas	{}	{bool}	*Node	96
223	gc	NonNil	{}	{bool}	*Node	96
224	gc	Noescape	{}	{bool}	*Node	96
225	gc	Bounded	{}	{bool}	*Node	96
226	gc	Addable	{}	{bool}	*Node	96
227	gc	HasCall	{}	{bool}	*Node	96
228	gc	Likely	{}	{bool}	*Node	96
229	gc	HasVal	{}	{bool}	*Node	96
230	gc	HasOpt	{}	{bool}	*Node	96
231	gc	Embedded	{}	{bool}	*Node	96
232	gc	SetClass	{gc.Class}	{}	*Node	96
233	gc	SetWalkdef	{uint8}	{}	*Node	96
234	gc	SetTypecheck	{uint8}	{}	*Node	96
235	gc	SetInitorder	{uint8}	{}	*Node	96
236	gc	SetHasBreak	{bool}	{}	*Node	96
237	gc	SetIsClosureVar	{bool}	{}	*Node	96
238	gc	SetNoInline	{bool}	{}	*Node	96
239	gc	SetIsOutputParamHeapAddr	{bool}	{}	*Node	96
240	gc	SetAssigned	{bool}	{}	*Node	96
241	gc	SetAddrtaken	{bool}	{}	*Node	96
242	gc	SetImplicit	{bool}	{}	*Node	96
243	gc	SetIsddd	{bool}	{}	*Node	96
244	gc	SetLocal	{bool}	{}	*Node	96
245	gc	SetDiag	{bool}	{}	*Node	96
246	gc	SetColas	{bool}	{}	*Node	96
247	gc	SetNonNil	{bool}	{}	*Node	96
248	gc	SetNoescape	{bool}	{}	*Node	96
249	gc	SetBounded	{bool}	{}	*Node	96
250	gc	SetAddable	{bool}	{}	*Node	96
251	gc	SetHasCall	{bool}	{}	*Node	96
252	gc	SetLikely	{bool}	{}	*Node	96
253	gc	SetHasVal	{bool}	{}	*Node	96
254	gc	SetHasOpt	{bool}	{}	*Node	96
255	gc	SetEmbedded	{bool}	{}	*Node	96
256	gc	Val	{}	{gc.Val}	*Node	96
257	gc	SetVal	{gc.Val}	{}	*Node	96
258	gc	Opt	{}	{"interface{}"}	*Node	96
259	gc	SetOpt	{"interface{}"}	{}	*Node	96
260	gc	Iota	{}	{int64}	*Node	96
261	gc	SetIota	{int64}	{}	*Node	96
262	gc	Line	{}	{string}	*Node	96
263	gc	Captured	{}	{bool}	*Name	97
264	gc	Readonly	{}	{bool}	*Name	97
265	gc	Byval	{}	{bool}	*Name	97
266	gc	Needzero	{}	{bool}	*Name	97
267	gc	Keepalive	{}	{bool}	*Name	97
268	gc	AutoTemp	{}	{bool}	*Name	97
269	gc	Used	{}	{bool}	*Name	97
270	gc	SetCaptured	{bool}	{}	*Name	97
271	gc	SetReadonly	{bool}	{}	*Name	97
272	gc	SetByval	{bool}	{}	*Name	97
273	gc	SetNeedzero	{bool}	{}	*Name	97
274	gc	SetKeepalive	{bool}	{}	*Name	97
275	gc	SetAutoTemp	{bool}	{}	*Name	97
276	gc	SetUsed	{bool}	{}	*Name	97
277	gc	Dupok	{}	{bool}	*Func	99
278	gc	Wrapper	{}	{bool}	*Func	99
279	gc	Needctxt	{}	{bool}	*Func	99
280	gc	ReflectMethod	{}	{bool}	*Func	99
281	gc	IsHiddenClosure	{}	{bool}	*Func	99
282	gc	NoFramePointer	{}	{bool}	*Func	99
283	gc	HasDefer	{}	{bool}	*Func	99
284	gc	NilCheckDisabled	{}	{bool}	*Func	99
285	gc	SetDupok	{bool}	{}	*Func	99
286	gc	SetWrapper	{bool}	{}	*Func	99
287	gc	SetNeedctxt	{bool}	{}	*Func	99
288	gc	SetReflectMethod	{bool}	{}	*Func	99
289	gc	SetIsHiddenClosure	{bool}	{}	*Func	99
290	gc	SetNoFramePointer	{bool}	{}	*Func	99
291	gc	SetHasDefer	{bool}	{}	*Func	99
292	gc	SetNilCheckDisabled	{bool}	{}	*Func	99
293	gc	String	{}	{string}	Op	102
294	gc	GoString	{}	{string}	Op	102
295	gc	Format	{fmt.State,rune}	{}	Op	102
296	gc	IsSlice3	{}	{bool}	Op	102
297	gc	Format	{fmt.State,rune}	{}	Nodes	103
298	gc	String	{}	{string}	Nodes	103
299	gc	Slice	{}	{[]*gc.Node}	Nodes	103
300	gc	Len	{}	{int}	Nodes	103
301	gc	Index	{int}	{*gc.Node}	Nodes	103
302	gc	First	{}	{*gc.Node}	Nodes	103
303	gc	Second	{}	{*gc.Node}	Nodes	103
304	gc	Set	{[]*gc.Node}	{}	*Nodes	103
305	gc	Set1	{*gc.Node}	{}	*Nodes	103
306	gc	Set2	{*gc.Node,*gc.Node}	{}	*Nodes	103
307	gc	Set3	{*gc.Node,*gc.Node,*gc.Node}	{}	*Nodes	103
308	gc	MoveNodes	{*gc.Nodes}	{}	*Nodes	103
309	gc	SetIndex	{int,*gc.Node}	{}	Nodes	103
310	gc	SetFirst	{*gc.Node}	{}	Nodes	103
311	gc	SetSecond	{*gc.Node}	{}	Nodes	103
312	gc	Addr	{int}	{**gc.Node}	Nodes	103
313	gc	Append	{...*gc.Node}	{}	*Nodes	103
314	gc	Prepend	{...*gc.Node}	{}	*Nodes	103
315	gc	AppendNodes	{*gc.Nodes}	{}	*Nodes	103
316	main	F	{}	{}	*S	105
317	main	F	{}	{}	*T	106
318	gc	Start	{...string}	{}	*Timings	182
319	gc	Stop	{...string}	{}	*Timings	182
320	gc	AddEvent	{int64,string}	{}	*Timings	182
321	gc	Write	{io.Writer,string}	{}	*Timings	182
322	ssa	String	{}	{string}	*Block	183
323	ssa	LongString	{}	{string}	*Block	183
324	ssa	SetControl	{*ssa.Value}	{}	*Block	183
325	ssa	AddEdgeTo	{*ssa.Block}	{}	*Block	183
326	ssa	Logf	{string,"...interface{}"}	{}	*Block	183
327	ssa	Log	{}	{bool}	*Block	183
328	ssa	Fatalf	{string,"...interface{}"}	{}	*Block	183
329	ssa	NewValue0	{src.XPos,ssa.Op,*types.Type}	{*ssa.Value}	*Block	183
330	ssa	NewValue0I	{src.XPos,ssa.Op,*types.Type,int64}	{*ssa.Value}	*Block	183
331	ssa	NewValue0A	{src.XPos,ssa.Op,*types.Type,"interface{}"}	{*ssa.Value}	*Block	183
332	ssa	NewValue0IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}"}	{*ssa.Value}	*Block	183
333	ssa	NewValue1	{src.XPos,ssa.Op,*types.Type,*ssa.Value}	{*ssa.Value}	*Block	183
334	ssa	NewValue1I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Block	183
335	ssa	NewValue1A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	183
336	ssa	NewValue1IA	{src.XPos,ssa.Op,*types.Type,int64,"interface{}",*ssa.Value}	{*ssa.Value}	*Block	183
337	ssa	NewValue2	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	183
338	ssa	NewValue2I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	183
339	ssa	NewValue3	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	183
340	ssa	NewValue3I	{src.XPos,ssa.Op,*types.Type,int64,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	183
341	ssa	NewValue3A	{src.XPos,ssa.Op,*types.Type,"interface{}",*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	183
342	ssa	NewValue4	{src.XPos,ssa.Op,*types.Type,*ssa.Value,*ssa.Value,*ssa.Value,*ssa.Value}	{*ssa.Value}	*Block	183
343	ssa	HTML	{}	{string}	*Block	183
344	ssa	LongHTML	{}	{string}	*Block	183
345	ssa	Block	{}	{*ssa.Block}	Edge	184
346	ssa	Index	{}	{int}	Edge	184
347	ssa	String	{}	{string}	BlockKind	185
348	ssa	Reset	{}	{}	*Cache	187
349	ssa	Set387	{bool}	{}	*Config	188
350	ssa	SparsePhiCutoff	{}	{uint64}	*Config	188
351	ssa	Ctxt	{}	{*obj.Link}	*Config	188
352	ssa	NumBlocks	{}	{int}	*Func	193
353	ssa	NumValues	{}	{int}	*Func	193
354	ssa	LogStat	{string,"...interface{}"}	{}	*Func	193
355	ssa	NewBlock	{ssa.BlockKind}	{*ssa.Block}	*Func	193
356	ssa	ConstBool	{src.XPos,*types.Type,bool}	{*ssa.Value}	*Func	193
357	ssa	ConstInt8	{src.XPos,*types.Type,int8}	{*ssa.Value}	*Func	193
358	ssa	ConstInt16	{src.XPos,*types.Type,int16}	{*ssa.Value}	*Func	193
359	ssa	ConstInt32	{src.XPos,*types.Type,int32}	{*ssa.Value}	*Func	193
360	ssa	ConstInt64	{src.XPos,*types.Type,int64}	{*ssa.Value}	*Func	193
792	ld	OnList	{}	{bool}	Attribute	434
361	ssa	ConstFloat32	{src.XPos,*types.Type,float64}	{*ssa.Value}	*Func	193
362	ssa	ConstFloat64	{src.XPos,*types.Type,float64}	{*ssa.Value}	*Func	193
363	ssa	ConstSlice	{src.XPos,*types.Type}	{*ssa.Value}	*Func	193
364	ssa	ConstInterface	{src.XPos,*types.Type}	{*ssa.Value}	*Func	193
365	ssa	ConstNil	{src.XPos,*types.Type}	{*ssa.Value}	*Func	193
366	ssa	ConstEmptyString	{src.XPos,*types.Type}	{*ssa.Value}	*Func	193
367	ssa	ConstOffPtrSP	{src.XPos,*types.Type,int64,*ssa.Value}	{*ssa.Value}	*Func	193
368	ssa	Frontend	{}	{ssa.Frontend}	*Func	193
369	ssa	Warnl	{src.XPos,string,"...interface{}"}	{}	*Func	193
370	ssa	Logf	{string,"...interface{}"}	{}	*Func	193
371	ssa	Log	{}	{bool}	*Func	193
372	ssa	Fatalf	{string,"...interface{}"}	{}	*Func	193
373	ssa	Postorder	{}	{[]*ssa.Block}	*Func	193
374	ssa	Idom	{}	{[]*ssa.Block}	*Func	193
375	ssa	DebugHashMatch	{string,string}	{bool}	*Func	193
376	ssa	HTML	{}	{string}	*Func	193
377	ssa	String	{}	{string}	*Func	193
378	main	Len	{}	{int}	ArchsByName	194
379	main	Swap	{int,int}	{}	ArchsByName	194
380	main	Less	{int,int}	{bool}	ArchsByName	194
381	main	String	{}	{string}	Rule	195
382	ssa	Close	{}	{}	*HTMLWriter	196
383	ssa	WriteFunc	{string,*ssa.Func}	{}	*HTMLWriter	196
384	ssa	WriteColumn	{string,string}	{}	*HTMLWriter	196
385	ssa	Printf	{string,"...interface{}"}	{}	*HTMLWriter	196
386	ssa	WriteString	{string}	{}	*HTMLWriter	196
387	ssa	Name	{}	{string}	*Register	199
388	ssa	Name	{}	{string}	LocalSlot	200
389	ssa	Name	{}	{string}	LocPair	201
390	ssa	Asm	{}	{obj.As}	Op	202
391	ssa	String	{}	{string}	Op	202
392	ssa	UsesScratch	{}	{bool}	Op	202
393	ssa	SymEffect	{}	{ssa.SymEffect}	Op	202
394	ssa	IsCall	{}	{bool}	Op	202
395	ssa	Val	{}	{int64}	ValAndOff	204
396	ssa	Off	{}	{int64}	ValAndOff	204
397	ssa	Int64	{}	{int64}	ValAndOff	204
398	ssa	String	{}	{string}	ValAndOff	204
399	ssa	String	{}	{string}	*RBTint32	205
400	ssa	IsEmpty	{}	{bool}	*RBTint32	205
401	ssa	IsSingle	{}	{bool}	*RBTint32	205
402	ssa	VisitInOrder	{"func(int32, interface{})"}	{}	*RBTint32	205
403	ssa	Find	{int32}	{"interface{}"}	*RBTint32	205
404	ssa	Insert	{int32,"interface{}"}	{"interface{}"}	*RBTint32	205
405	ssa	Min	{}	{int32,"interface{}"}	*RBTint32	205
406	ssa	Max	{}	{int32,"interface{}"}	*RBTint32	205
407	ssa	Glb	{int32}	{int32,"interface{}"}	*RBTint32	205
408	ssa	GlbEq	{int32}	{int32,"interface{}"}	*RBTint32	205
409	ssa	Lub	{int32}	{int32,"interface{}"}	*RBTint32	205
410	ssa	LubEq	{int32}	{int32,"interface{}"}	*RBTint32	205
411	ssa	Len	{}	{int}	ValHeap	206
412	ssa	Swap	{int,int}	{}	ValHeap	206
413	ssa	Push	{"interface{}"}	{}	*ValHeap	206
414	ssa	Pop	{}	{"interface{}"}	*ValHeap	206
415	ssa	Less	{int,int}	{bool}	ValHeap	206
416	ssa	String	{}	{string}	*SparseTreeNode	207
417	ssa	Entry	{}	{int32}	*SparseTreeNode	207
418	ssa	Exit	{}	{int32}	*SparseTreeNode	207
419	ssa	Sibling	{*ssa.Block}	{*ssa.Block}	SparseTree	208
420	ssa	Child	{*ssa.Block}	{*ssa.Block}	SparseTree	208
421	ssa	Insert	{*ssa.Block,int32,"interface{}",*ssa.SparseTreeHelper}	{}	*SparseTreeMap	209
422	ssa	Find	{*ssa.Block,int32,*ssa.SparseTreeHelper}	{"interface{}"}	*SparseTreeMap	209
423	ssa	String	{}	{string}	*SparseTreeMap	209
424	ssa	NewTree	{}	{*ssa.SparseTreeMap}	*SparseTreeHelper	210
425	ssa	HTML	{}	{string}	*Value	211
426	ssa	LongHTML	{}	{string}	*Value	211
427	ssa	String	{}	{string}	*Value	211
428	ssa	AuxInt8	{}	{int8}	*Value	211
429	ssa	AuxInt16	{}	{int16}	*Value	211
430	ssa	AuxInt32	{}	{int32}	*Value	211
431	ssa	AuxFloat	{}	{float64}	*Value	211
432	ssa	AuxValAndOff	{}	{ssa.ValAndOff}	*Value	211
433	ssa	LongString	{}	{string}	*Value	211
434	ssa	AddArg	{*ssa.Value}	{}	*Value	211
435	ssa	AddArgs	{...*ssa.Value}	{}	*Value	211
436	ssa	SetArg	{int,*ssa.Value}	{}	*Value	211
437	ssa	RemoveArg	{int}	{}	*Value	211
438	ssa	SetArgs1	{*ssa.Value}	{}	*Value	211
439	ssa	SetArgs2	{*ssa.Value,*ssa.Value}	{}	*Value	211
440	ssa	Logf	{string,"...interface{}"}	{}	*Value	211
441	ssa	Log	{}	{bool}	*Value	211
442	ssa	Fatalf	{string,"...interface{}"}	{}	*Value	211
443	ssa	Reg	{}	{int16}	*Value	211
444	ssa	Reg0	{}	{int16}	*Value	211
445	ssa	Reg1	{}	{int16}	*Value	211
446	ssa	RegName	{}	{string}	*Value	211
447	ssa	MemoryArg	{}	{*ssa.Value}	*Value	211
448	ssa	String	{}	{string}	*ExternSymbol	212
449	ssa	String	{}	{string}	*ArgSymbol	213
450	ssa	String	{}	{string}	*AutoSymbol	214
451	syntax	Error	{}	{string}	Error	272
452	syntax	Error	{}	{string}	*Error	272
453	syntax	String	{}	{string}	Operator	278
454	types	Lookup	{string}	{*types.Sym}	*Pkg	279
455	types	LookupOK	{string}	{*types.Sym,bool}	*Pkg	279
456	types	LookupBytes	{[]byte}	{*types.Sym}	*Pkg	279
457	types	Export	{}	{bool}	*Sym	280
458	types	Package	{}	{bool}	*Sym	280
459	types	Exported	{}	{bool}	*Sym	280
460	types	Uniq	{}	{bool}	*Sym	280
461	types	Siggen	{}	{bool}	*Sym	280
462	types	Asm	{}	{bool}	*Sym	280
463	types	AlgGen	{}	{bool}	*Sym	280
464	types	SetExport	{bool}	{}	*Sym	280
465	types	SetPackage	{bool}	{}	*Sym	280
466	types	SetExported	{bool}	{}	*Sym	280
467	types	SetUniq	{bool}	{}	*Sym	280
468	types	SetSiggen	{bool}	{}	*Sym	280
469	types	SetAsm	{bool}	{}	*Sym	280
470	types	SetAlgGen	{bool}	{}	*Sym	280
471	types	IsBlank	{}	{bool}	*Sym	280
472	types	LinksymName	{}	{string}	*Sym	280
473	types	Linksym	{}	{*obj.LSym}	*Sym	280
474	types	String	{}	{string}	*Sym	280
475	types	Format	{fmt.State,rune}	{}	*Sym	280
476	types	String	{}	{string}	EType	282
477	types	CanRecv	{}	{bool}	ChanDir	283
478	types	CanSend	{}	{bool}	ChanDir	283
479	types	Local	{}	{bool}	*Type	284
480	types	NotInHeap	{}	{bool}	*Type	284
481	types	Broke	{}	{bool}	*Type	284
482	types	Noalg	{}	{bool}	*Type	284
483	types	Deferwidth	{}	{bool}	*Type	284
484	types	Recur	{}	{bool}	*Type	284
485	types	SetLocal	{bool}	{}	*Type	284
486	types	SetNotInHeap	{bool}	{}	*Type	284
487	types	SetBroke	{bool}	{}	*Type	284
488	types	SetNoalg	{bool}	{}	*Type	284
489	types	SetDeferwidth	{bool}	{}	*Type	284
490	types	SetRecur	{bool}	{}	*Type	284
491	types	MapType	{}	{*types.Map}	*Type	284
492	types	ForwardType	{}	{*types.Forward}	*Type	284
493	types	FuncType	{}	{*types.Func}	*Type	284
494	types	StructType	{}	{*types.Struct}	*Type	284
495	types	ChanType	{}	{*types.Chan}	*Type	284
496	types	Copy	{}	{*types.Type}	*Type	284
497	types	Recvs	{}	{*types.Type}	*Type	284
498	types	Params	{}	{*types.Type}	*Type	284
499	types	Results	{}	{*types.Type}	*Type	284
500	types	Recv	{}	{*types.Field}	*Type	284
501	types	Key	{}	{*types.Type}	*Type	284
502	types	Val	{}	{*types.Type}	*Type	284
503	types	Elem	{}	{*types.Type}	*Type	284
504	types	DDDField	{}	{*types.Type}	*Type	284
505	types	ChanArgs	{}	{*types.Type}	*Type	284
506	types	FuncArgs	{}	{*types.Type}	*Type	284
507	types	Nname	{}	{*types.Node}	*Type	284
508	types	SetNname	{*types.Node}	{}	*Type	284
509	types	IsFuncArgStruct	{}	{bool}	*Type	284
510	types	Methods	{}	{*types.Fields}	*Type	284
511	types	AllMethods	{}	{*types.Fields}	*Type	284
512	types	Fields	{}	{*types.Fields}	*Type	284
513	types	Field	{int}	{*types.Field}	*Type	284
514	types	FieldSlice	{}	{[]*types.Field}	*Type	284
515	types	SetFields	{[]*types.Field}	{}	*Type	284
516	types	SetInterface	{[]*types.Field}	{}	*Type	284
517	types	IsDDDArray	{}	{bool}	*Type	284
518	types	WidthCalculated	{}	{bool}	*Type	284
519	types	ArgWidth	{}	{int64}	*Type	284
520	types	Size	{}	{int64}	*Type	284
521	types	Alignment	{}	{int64}	*Type	284
522	types	SimpleString	{}	{string}	*Type	284
523	types	Compare	{*types.Type}	{types.Cmp}	*Type	284
524	types	IsKind	{types.EType}	{bool}	*Type	284
525	types	IsBoolean	{}	{bool}	*Type	284
526	types	ToUnsigned	{}	{*types.Type}	*Type	284
527	types	IsInteger	{}	{bool}	*Type	284
528	types	IsSigned	{}	{bool}	*Type	284
529	types	IsFloat	{}	{bool}	*Type	284
530	types	IsComplex	{}	{bool}	*Type	284
531	types	IsPtr	{}	{bool}	*Type	284
532	types	IsUnsafePtr	{}	{bool}	*Type	284
533	types	IsPtrShaped	{}	{bool}	*Type	284
534	types	IsString	{}	{bool}	*Type	284
535	types	IsMap	{}	{bool}	*Type	284
536	types	IsChan	{}	{bool}	*Type	284
537	types	IsSlice	{}	{bool}	*Type	284
538	types	IsArray	{}	{bool}	*Type	284
539	types	IsStruct	{}	{bool}	*Type	284
540	types	IsInterface	{}	{bool}	*Type	284
541	types	IsEmptyInterface	{}	{bool}	*Type	284
542	types	ElemType	{}	{*types.Type}	*Type	284
543	types	PtrTo	{}	{*types.Type}	*Type	284
544	types	NumFields	{}	{int}	*Type	284
545	types	FieldType	{int}	{*types.Type}	*Type	284
546	types	FieldOff	{int}	{int64}	*Type	284
547	types	FieldName	{int}	{string}	*Type	284
548	types	NumElem	{}	{int64}	*Type	284
549	types	SetNumElem	{int64}	{}	*Type	284
550	types	ChanDir	{}	{types.ChanDir}	*Type	284
551	types	IsMemory	{}	{bool}	*Type	284
552	types	IsFlags	{}	{bool}	*Type	284
553	types	IsVoid	{}	{bool}	*Type	284
554	types	IsTuple	{}	{bool}	*Type	284
555	types	IsUntyped	{}	{bool}	*Type	284
556	types	HasPointer	{}	{bool}	*Type	284
557	types	Symbol	{}	{*obj.LSym}	*Type	284
558	types	Tie	{}	{byte}	*Type	284
559	types	String	{}	{string}	*Type	284
560	types	ShortString	{}	{string}	*Type	284
561	types	LongString	{}	{string}	*Type	284
562	types	Format	{fmt.State,rune}	{}	*Type	284
563	types	Key	{}	{types.Type}	*Map	285
564	types	Elem	{}	{types.Type}	*Map	285
565	types	Underlying	{}	{types.Type}	*Map	285
566	types	String	{}	{string}	*Map	285
567	types	FullName	{}	{string}	*Func	287
568	types	Scope	{}	{*types.Scope}	*Func	287
569	types	String	{}	{string}	*Func	287
570	types	NumFields	{}	{int}	*Struct	288
571	types	Field	{int}	{*types.Var}	*Struct	288
572	types	Tag	{int}	{string}	*Struct	288
573	types	Underlying	{}	{types.Type}	*Struct	288
574	types	String	{}	{string}	*Struct	288
575	types	NumExplicitMethods	{}	{int}	*Interface	290
576	types	ExplicitMethod	{int}	{*types.Func}	*Interface	290
577	types	NumEmbeddeds	{}	{int}	*Interface	290
578	types	Embedded	{int}	{*types.Named}	*Interface	290
579	types	NumMethods	{}	{int}	*Interface	290
580	types	Method	{int}	{*types.Func}	*Interface	290
581	types	Empty	{}	{bool}	*Interface	290
582	types	Complete	{}	{*types.Interface}	*Interface	290
583	types	Underlying	{}	{types.Type}	*Interface	290
584	types	String	{}	{string}	*Interface	290
585	types	Dir	{}	{types.ChanDir}	*Chan	295
586	types	Elem	{}	{types.Type}	*Chan	295
587	types	Underlying	{}	{types.Type}	*Chan	295
588	types	String	{}	{string}	*Chan	295
589	types	Len	{}	{int}	*Tuple	296
590	types	At	{int}	{*types.Var}	*Tuple	296
591	types	Underlying	{}	{types.Type}	*Tuple	296
592	types	String	{}	{string}	*Tuple	296
593	types	Len	{}	{int64}	*Array	297
594	types	Elem	{}	{types.Type}	*Array	297
595	types	Underlying	{}	{types.Type}	*Array	297
596	types	String	{}	{string}	*Array	297
597	types	Elem	{}	{types.Type}	*Slice	298
598	types	Underlying	{}	{types.Type}	*Slice	298
599	types	String	{}	{string}	*Slice	298
600	types	Isddd	{}	{bool}	*Field	299
601	types	Broke	{}	{bool}	*Field	299
602	types	Nointerface	{}	{bool}	*Field	299
603	types	SetIsddd	{bool}	{}	*Field	299
604	types	SetBroke	{bool}	{}	*Field	299
605	types	SetNointerface	{bool}	{}	*Field	299
606	types	End	{}	{int64}	*Field	299
607	types	Copy	{}	{*types.Field}	*Field	299
608	types	Len	{}	{int}	*Fields	300
609	types	Slice	{}	{[]*types.Field}	*Fields	300
610	types	Index	{int}	{*types.Field}	*Fields	300
611	types	Set	{[]*types.Field}	{}	*Fields	300
612	types	Append	{...*types.Field}	{}	*Fields	300
613	main	Visit	{ast.Node}	{ast.Visitor}	*FuncVisitor	305
614	main	Boundaries	{[]byte}	{[]main.Boundary}	*Profile	306
615	main	Reset	{}	{}	*Dirs	309
616	main	Next	{}	{string,bool}	*Dirs	309
617	main	Error	{}	{string}	PackageError	311
618	pkg	ExportedMethod	{int}	{bool}	ExportedType	312
619	base	Name	{}	{string}	*Command	319
620	base	Usage	{}	{}	*Command	319
621	base	Runnable	{}	{bool}	*Command	319
622	base	Set	{string}	{error}	*StringsFlag	320
623	base	String	{}	{string}	*StringsFlag	320
624	get	Error	{}	{string}	ImportMismatchError	324
625	list	Write	{[]byte}	{int,error}	*TrackingWriter	326
626	list	Flush	{}	{}	*TrackingWriter	326
627	list	NeedNL	{}	{bool}	*TrackingWriter	326
628	load	AllFiles	{}	{[]string}	*Package	327
629	load	Resolve	{[]string}	{[]string}	*Package	327
630	load	UsesSwig	{}	{bool}	*Package	327
631	load	UsesCgo	{}	{bool}	*Package	327
632	load	Error	{}	{string}	*NoGoError	330
633	load	Error	{}	{string}	*PackageError	332
634	load	Push	{string}	{}	*ImportStack	333
635	load	Pop	{}	{}	*ImportStack	333
636	load	Copy	{}	{[]string}	*ImportStack	333
637	web	Error	{}	{string}	*HTTPError	334
638	web	Error	{}	{string}	*HTTPError	334
639	work	Init	{}	{}	*Builder	337
640	work	Action	{work.BuildMode,work.BuildMode,*load.Package}	{*work.Action}	*Builder	337
641	work	Do	{*work.Action}	{}	*Builder	337
642	work	PkgconfigCmd	{}	{string}	*Builder	337
643	work	Showcmd	{string,string,"...interface{}"}	{}	*Builder	337
644	work	Mkdir	{string}	{error}	*Builder	337
645	work	GccCmd	{string}	{[]string}	*Builder	337
646	work	GxxCmd	{string}	{[]string}	*Builder	337
647	work	CFlags	{*load.Package}	{[]string,error}	*Builder	337
648	bio	Seek	{int64,int}	{int64}	*Reader	340
649	bio	Offset	{}	{int64}	*Reader	340
650	bio	Close	{}	{error}	*Reader	340
651	bio	Seek	{int64,int}	{int64}	*Writer	341
652	bio	Offset	{}	{int64}	*Writer	341
653	bio	Close	{}	{error}	*Writer	341
654	dwarf	UnifyRanges	{*dwarf.Scope}	{}	*Scope	344
655	dwarf	Len	{}	{int}	VarsByOffset	349
656	dwarf	Less	{int,int}	{bool}	VarsByOffset	349
657	dwarf	Swap	{int,int}	{}	VarsByOffset	349
658	gcprog	Init	{func(byte)}	{}	*Writer	350
659	gcprog	Debug	{io.Writer}	{}	*Writer	350
660	gcprog	BitIndex	{}	{int64}	*Writer	350
661	gcprog	End	{}	{}	*Writer	350
662	gcprog	Ptr	{int64}	{}	*Writer	350
663	gcprog	ShouldRepeat	{int64,int64}	{bool}	*Writer	350
664	gcprog	Repeat	{int64,int64}	{}	*Writer	350
665	gcprog	ZeroUntil	{int64}	{}	*Writer	350
666	gcprog	Append	{[]byte,int64}	{}	*Writer	350
667	goobj	String	{}	{string}	SymID	352
668	goobj	String	{uint64}	{string}	*Reloc	354
669	obj	Add	{int,src.XPos,*obj.LSym}	{int}	*InlTree	363
670	obj	String	{}	{string}	AddrType	367
671	obj	From3Type	{}	{obj.AddrType}	*Prog	368
672	obj	Line	{}	{string}	*Prog	368
673	obj	String	{}	{string}	*Prog	368
674	obj	String	{}	{string}	As	369
675	obj	Grow	{int64}	{}	*LSym	370
676	obj	GrowCap	{int64}	{}	*LSym	370
677	obj	WriteFloat32	{*obj.Link,int64,float32}	{}	*LSym	370
678	obj	WriteFloat64	{*obj.Link,int64,float64}	{}	*LSym	370
679	obj	WriteInt	{*obj.Link,int64,int,int64}	{}	*LSym	370
680	obj	WriteAddr	{*obj.Link,int64,int,*obj.LSym,int64}	{}	*LSym	370
681	obj	WriteOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	370
682	obj	WriteWeakOff	{*obj.Link,int64,*obj.LSym,int64}	{}	*LSym	370
683	obj	WriteString	{*obj.Link,int64,int,string}	{}	*LSym	370
684	obj	WriteBytes	{*obj.Link,int64,[]byte}	{int64}	*LSym	370
685	obj	String	{}	{string}	*LSym	370
686	obj	Len	{}	{int64}	*LSym	370
687	obj	DuplicateOK	{}	{bool}	Attribute	372
688	obj	MakeTypelink	{}	{bool}	Attribute	372
689	obj	CFunc	{}	{bool}	Attribute	372
690	obj	NoSplit	{}	{bool}	Attribute	372
691	obj	Leaf	{}	{bool}	Attribute	372
692	obj	SeenGlobl	{}	{bool}	Attribute	372
693	obj	OnList	{}	{bool}	Attribute	372
694	obj	ReflectMethod	{}	{bool}	Attribute	372
695	obj	Local	{}	{bool}	Attribute	372
696	obj	Wrapper	{}	{bool}	Attribute	372
697	obj	NeedCtxt	{}	{bool}	Attribute	372
698	obj	NoFrame	{}	{bool}	Attribute	372
699	obj	Static	{}	{bool}	Attribute	372
700	obj	Set	{obj.Attribute,bool}	{}	*Attribute	372
701	obj	TextAttrString	{}	{string}	Attribute	372
702	obj	OutermostPos	{src.XPos}	{src.Pos}	*Link	377
703	obj	AddImport	{string}	{}	*Link	377
704	obj	Diag	{string,"...interface{}"}	{}	*Link	377
705	obj	Logf	{string,"...interface{}"}	{}	*Link	377
706	obj	FixedFrameSize	{}	{int64}	*Link	377
707	obj	InitTextSym	{*obj.LSym,int}	{}	*Link	377
708	obj	Globl	{*obj.LSym,int64,int}	{}	*Link	377
709	obj	LookupDerived	{*obj.LSym,string}	{*obj.LSym}	*Link	377
710	obj	LookupStatic	{string}	{*obj.LSym}	*Link	377
711	obj	Lookup	{string}	{*obj.LSym}	*Link	377
712	obj	LookupInit	{string,func(*obj.LSym)}	{*obj.LSym}	*Link	377
713	obj	Float32Sym	{float32}	{*obj.LSym}	*Link	377
714	obj	Float64Sym	{float64}	{*obj.LSym}	*Link	377
715	obj	Int64Sym	{int64}	{*obj.LSym}	*Link	377
716	obj	NewProg	{}	{*obj.Prog}	*Link	377
717	obj	CanReuseProgs	{}	{bool}	*Link	377
718	obj	Dconv	{*obj.Addr}	{string}	*Link	377
719	x86	Put1	{byte}	{}	*AsmBuf	388
720	x86	Put2	{byte,byte}	{}	*AsmBuf	388
721	x86	Put3	{byte,byte,byte}	{}	*AsmBuf	388
722	x86	Put4	{byte,byte,byte,byte}	{}	*AsmBuf	388
723	x86	PutInt16	{int16}	{}	*AsmBuf	388
724	x86	PutInt32	{int32}	{}	*AsmBuf	388
725	x86	PutInt64	{int64}	{}	*AsmBuf	388
726	x86	Put	{[]byte}	{}	*AsmBuf	388
727	x86	Insert	{int,byte}	{}	*AsmBuf	388
728	x86	Last	{}	{byte}	*AsmBuf	388
729	x86	Len	{}	{int}	*AsmBuf	388
730	x86	Bytes	{}	{[]byte}	*AsmBuf	388
731	x86	Reset	{}	{}	*AsmBuf	388
732	x86	At	{int}	{byte}	*AsmBuf	388
733	objabi	Set	{string}	{error}	*HeadType	389
734	objabi	String	{}	{string}	*HeadType	389
735	objabi	IsDirectJump	{}	{bool}	RelocType	390
736	objabi	String	{}	{string}	RelocType	390
737	objabi	String	{}	{string}	SymKind	391
738	objfile	Print	{io.Writer,*regexp.Regexp,uint64,uint64,bool}	{}	*Disasm	392
739	objfile	Decode	{uint64,uint64,[]objfile.Reloc,"func(uint64, string, int, string)"}	{}	*Disasm	392
740	objfile	Line	{string,int}	{[]byte,error}	*FileCache	394
741	objfile	Disasm	{}	{*objfile.Disasm,error}	*File	396
742	objfile	Close	{}	{error}	*File	396
743	objfile	Symbols	{}	{[]objfile.Sym,error}	*File	396
744	objfile	PCLineTable	{}	{objfile.Liner,error}	*File	396
745	objfile	Text	{}	{uint64,[]byte,error}	*File	396
746	objfile	GOARCH	{}	{string}	*File	396
747	objfile	LoadAddress	{}	{uint64,error}	*File	396
748	objfile	DWARF	{}	{*dwarf.Data,error}	*File	396
749	src	IsKnown	{}	{bool}	Pos	400
750	src	Before	{src.Pos}	{bool}	Pos	400
751	src	After	{src.Pos}	{bool}	Pos	400
752	src	Filename	{}	{string}	Pos	400
753	src	Base	{}	{*src.PosBase}	Pos	400
754	src	SetBase	{*src.PosBase}	{}	*Pos	400
755	src	RelFilename	{}	{string}	Pos	400
756	src	RelLine	{}	{uint}	Pos	400
757	src	AbsFilename	{}	{string}	Pos	400
758	src	SymFilename	{}	{string}	Pos	400
759	src	String	{}	{string}	Pos	400
760	src	Format	{bool}	{string}	Pos	400
761	src	Pos	{}	{*src.Pos}	*PosBase	401
762	src	Filename	{}	{string}	*PosBase	401
763	src	AbsFilename	{}	{string}	*PosBase	401
764	src	SymFilename	{}	{string}	*PosBase	401
765	src	Line	{}	{uint}	*PosBase	401
766	src	InliningIndex	{}	{int}	*PosBase	401
767	src	IsKnown	{}	{bool}	XPos	402
768	src	Before	{src.XPos}	{bool}	XPos	402
769	src	After	{src.XPos}	{bool}	XPos	402
770	src	XPos	{src.Pos}	{src.XPos}	*PosTable	403
771	src	Pos	{src.XPos}	{src.Pos}	*PosTable	403
772	sys	InFamily	{...sys.ArchFamily}	{bool}	*Arch	405
773	ld	Set	{string}	{error}	*BuildMode	407
774	ld	String	{}	{string}	*BuildMode	407
775	ld	Set	{string}	{error}	*LinkMode	408
776	ld	String	{}	{string}	*LinkMode	408
777	ld	Init	{*ld.Link,string}	{}	*GCProg	409
778	ld	End	{int64}	{}	*GCProg	409
779	ld	AddSym	{*ld.Symbol}	{}	*GCProg	409
780	ld	String	{}	{string}	*Symbol	433
781	ld	ElfsymForReloc	{}	{int32}	*Symbol	433
782	ld	Len	{}	{int64}	*Symbol	433
783	ld	DuplicateOK	{}	{bool}	Attribute	434
784	ld	External	{}	{bool}	Attribute	434
785	ld	NoSplit	{}	{bool}	Attribute	434
786	ld	Reachable	{}	{bool}	Attribute	434
787	ld	CgoExportDynamic	{}	{bool}	Attribute	434
788	ld	CgoExportStatic	{}	{bool}	Attribute	434
789	ld	Special	{}	{bool}	Attribute	434
790	ld	StackCheck	{}	{bool}	Attribute	434
791	ld	NotInSymbolTable	{}	{bool}	Attribute	434
793	ld	Local	{}	{bool}	Attribute	434
794	ld	ReflectMethod	{}	{bool}	Attribute	434
795	ld	MakeTypelink	{}	{bool}	Attribute	434
796	ld	Shared	{}	{bool}	Attribute	434
797	ld	CgoExport	{}	{bool}	Attribute	434
798	ld	Set	{ld.Attribute,bool}	{}	*Attribute	434
799	ld	AddTramp	{*ld.Symbol}	{}	*Link	438
800	ld	DynlinkingGo	{}	{bool}	*Link	438
801	ld	FixedFrameSize	{}	{int64}	*Link	438
802	ld	Logf	{string,"...interface{}"}	{}	*Link	438
803	ld	String	{}	{string}	Library	439
804	ld	Set	{string}	{error}	*Rpath	449
805	ld	String	{}	{string}	*Rpath	449
806	ld	Lookup	{string,int}	{*ld.Symbol}	*Symbols	459
807	ld	ROLookup	{string,int}	{*ld.Symbol}	*Symbols	459
808	ld	IncVersion	{}	{int}	*Symbols	459
809	ld	String	{}	{string}	SymKind	460
810	main	String	{}	{string}	*Entry	462
811	driver	InternalOptions	{}	{*plugin.Options}	*Options	472
812	binutils	SetFastSymbolization	{bool}	{}	*Binutils	484
813	binutils	SetTools	{string}	{}	*Binutils	484
814	binutils	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}	*Binutils	484
815	binutils	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}	*Binutils	484
816	graph	TrimTree	{graph.NodePtrSet}	{}	*Graph	489
817	graph	String	{}	{string}	*Graph	489
818	graph	DiscardLowFrequencyNodes	{int64}	{graph.NodeSet}	*Graph	489
819	graph	DiscardLowFrequencyNodePtrs	{int64}	{graph.NodePtrSet}	*Graph	489
820	graph	TrimLowFrequencyTags	{int64}	{}	*Graph	489
821	graph	TrimLowFrequencyEdges	{int64}	{int}	*Graph	489
822	graph	SortNodes	{bool,bool}	{}	*Graph	489
823	graph	SelectTopNodePtrs	{int,bool}	{graph.NodePtrSet}	*Graph	489
824	graph	SelectTopNodes	{int,bool}	{graph.NodeSet}	*Graph	489
825	graph	RemoveRedundantEdges	{}	{}	*Graph	489
826	graph	Sum	{}	{int64,int64}	Nodes	491
827	graph	Sort	{graph.NodeOrder}	{error}	Nodes	491
828	graph	FlatValue	{}	{int64}	*Node	492
829	graph	CumValue	{}	{int64}	*Node	492
830	graph	AddToEdge	{*graph.Node,int64,bool,bool}	{}	*Node	492
831	graph	AddToEdgeDiv	{*graph.Node,int64,int64,bool,bool}	{}	*Node	492
832	graph	PrintableName	{}	{string}	*NodeInfo	493
833	graph	NameComponents	{}	{[]string}	*NodeInfo	493
834	graph	FindOrInsertNode	{graph.NodeInfo,graph.NodeSet}	{*graph.Node}	NodeMap	494
835	graph	Sort	{}	{[]*graph.Edge}	EdgeMap	497
836	graph	Sum	{}	{int64}	EdgeMap	497
837	graph	WeightValue	{}	{int64}	*Edge	498
838	graph	FlatValue	{}	{int64}	*Tag	499
839	graph	CumValue	{}	{int64}	*Tag	499
840	proftest	ReadLine	{string}	{string,error}	*TestUI	514
841	proftest	Print	{"...interface{}"}	{}	*TestUI	514
842	proftest	PrintErr	{"...interface{}"}	{}	*TestUI	514
843	proftest	IsTerminal	{}	{bool}	*TestUI	514
844	proftest	SetAutoComplete	{"func(string) string"}	{}	*TestUI	514
845	symbolizer	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}	*Symbolizer	517
846	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	519
847	profile	FilterTagsByName	{*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	519
848	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	519
849	profile	SampleIndexByName	{string}	{int,error}	*Profile	519
850	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	519
851	profile	ParseMemoryMapFromScanner	{*bufio.Scanner}	{error}	*Profile	519
852	profile	Compact	{}	{*profile.Profile}	*Profile	519
853	profile	Write	{io.Writer}	{error}	*Profile	519
854	profile	WriteUncompressed	{io.Writer}	{error}	*Profile	519
855	profile	CheckValid	{}	{error}	*Profile	519
856	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	519
857	profile	String	{}	{string}	*Profile	519
858	profile	Scale	{float64}	{}	*Profile	519
859	profile	ScaleN	{[]float64}	{error}	*Profile	519
860	profile	HasFunctions	{}	{bool}	*Profile	519
861	profile	HasFileLines	{}	{bool}	*Profile	519
862	profile	Copy	{}	{*profile.Profile}	*Profile	519
863	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	519
864	profile	RemoveUninteresting	{}	{error}	*Profile	519
865	profile	PruneFrom	{*regexp.Regexp}	{}	*Profile	519
866	profile	FilterSamplesByName	{*regexp.Regexp,*regexp.Regexp,*regexp.Regexp}	{bool}	*Profile	519
867	profile	FilterSamplesByTag	{profile.TagMatch,profile.TagMatch}	{bool}	*Profile	519
868	profile	ParseMemoryMap	{io.Reader}	{error}	*Profile	519
869	profile	Write	{io.Writer}	{error}	*Profile	519
870	profile	CheckValid	{}	{error}	*Profile	519
871	profile	Aggregate	{bool,bool,bool,bool,bool}	{error}	*Profile	519
872	profile	String	{}	{string}	*Profile	519
873	profile	Merge	{*profile.Profile,float64}	{error}	*Profile	519
874	profile	Compatible	{*profile.Profile}	{error}	*Profile	519
875	profile	HasFunctions	{}	{bool}	*Profile	519
876	profile	HasFileLines	{}	{bool}	*Profile	519
877	profile	Copy	{}	{*profile.Profile}	*Profile	519
878	profile	Demangle	{profile.Demangler}	{error}	*Profile	519
879	profile	Empty	{}	{bool}	*Profile	519
880	profile	Prune	{*regexp.Regexp,*regexp.Regexp}	{}	*Profile	519
881	profile	RemoveUninteresting	{}	{error}	*Profile	519
882	profile	Unsymbolizable	{}	{bool}	*Mapping	522
883	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Name	527
884	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Name	527
885	demangle	GoString	{}	{string}	*Name	527
886	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Typed	528
887	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Typed	528
888	demangle	GoString	{}	{string}	*Typed	528
889	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Qualified	529
890	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Qualified	529
891	demangle	GoString	{}	{string}	*Qualified	529
892	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Template	530
893	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Template	530
894	demangle	GoString	{}	{string}	*Template	530
895	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TemplateParam	531
896	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TemplateParam	531
897	demangle	GoString	{}	{string}	*TemplateParam	531
898	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TypeWithQualifiers	533
899	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TypeWithQualifiers	533
900	demangle	GoString	{}	{string}	*TypeWithQualifiers	533
901	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*MethodWithQualifiers	534
902	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*MethodWithQualifiers	534
903	demangle	GoString	{}	{string}	*MethodWithQualifiers	534
904	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*BuiltinType	535
905	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*BuiltinType	535
906	demangle	GoString	{}	{string}	*BuiltinType	535
907	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PointerType	536
908	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PointerType	536
909	demangle	GoString	{}	{string}	*PointerType	536
910	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ReferenceType	537
911	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ReferenceType	537
912	demangle	GoString	{}	{string}	*ReferenceType	537
913	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*RvalueReferenceType	538
914	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*RvalueReferenceType	538
915	demangle	GoString	{}	{string}	*RvalueReferenceType	538
916	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ComplexType	539
917	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ComplexType	539
918	demangle	GoString	{}	{string}	*ComplexType	539
919	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ImaginaryType	540
920	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ImaginaryType	540
921	demangle	GoString	{}	{string}	*ImaginaryType	540
922	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VendorQualifier	541
923	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VendorQualifier	541
924	demangle	GoString	{}	{string}	*VendorQualifier	541
925	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArrayType	542
926	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArrayType	542
927	demangle	GoString	{}	{string}	*ArrayType	542
928	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionType	543
929	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionType	543
930	demangle	GoString	{}	{string}	*FunctionType	543
931	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FunctionParam	544
932	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FunctionParam	544
933	demangle	GoString	{}	{string}	*FunctionParam	544
934	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PtrMem	545
935	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PtrMem	545
936	demangle	GoString	{}	{string}	*PtrMem	545
937	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*FixedType	546
938	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*FixedType	546
939	demangle	GoString	{}	{string}	*FixedType	546
940	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*VectorType	547
941	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*VectorType	547
942	demangle	GoString	{}	{string}	*VectorType	547
943	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Decltype	548
944	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Decltype	548
945	demangle	GoString	{}	{string}	*Decltype	548
946	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Operator	549
947	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Operator	549
948	demangle	GoString	{}	{string}	*Operator	549
949	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Constructor	550
950	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Constructor	550
951	demangle	GoString	{}	{string}	*Constructor	550
952	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Destructor	551
953	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Destructor	551
954	demangle	GoString	{}	{string}	*Destructor	551
955	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*GlobalCDtor	552
956	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*GlobalCDtor	552
957	demangle	GoString	{}	{string}	*GlobalCDtor	552
958	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*TaggedName	553
959	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*TaggedName	553
960	demangle	GoString	{}	{string}	*TaggedName	553
961	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*PackExpansion	554
962	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*PackExpansion	554
963	demangle	GoString	{}	{string}	*PackExpansion	554
964	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ArgumentPack	555
965	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ArgumentPack	555
966	demangle	GoString	{}	{string}	*ArgumentPack	555
967	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofPack	556
968	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofPack	556
969	demangle	GoString	{}	{string}	*SizeofPack	556
970	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*SizeofArgs	557
971	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*SizeofArgs	557
972	demangle	GoString	{}	{string}	*SizeofArgs	557
973	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Cast	558
974	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Cast	558
975	demangle	GoString	{}	{string}	*Cast	558
976	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Nullary	559
977	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Nullary	559
978	demangle	GoString	{}	{string}	*Nullary	559
979	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Unary	560
980	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Unary	560
981	demangle	GoString	{}	{string}	*Unary	560
982	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Binary	561
983	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Binary	561
984	demangle	GoString	{}	{string}	*Binary	561
985	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Trinary	562
986	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Trinary	562
987	demangle	GoString	{}	{string}	*Trinary	562
988	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Fold	563
989	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Fold	563
990	demangle	GoString	{}	{string}	*Fold	563
991	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*New	564
992	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*New	564
993	demangle	GoString	{}	{string}	*New	564
994	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Literal	565
995	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Literal	565
996	demangle	GoString	{}	{string}	*Literal	565
997	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*ExprList	566
998	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*ExprList	566
999	demangle	GoString	{}	{string}	*ExprList	566
1000	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*InitializerList	567
1001	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*InitializerList	567
1002	demangle	GoString	{}	{string}	*InitializerList	567
1003	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*DefaultArg	568
1004	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*DefaultArg	568
1005	demangle	GoString	{}	{string}	*DefaultArg	568
1006	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Closure	569
1007	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Closure	569
1008	demangle	GoString	{}	{string}	*Closure	569
1009	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*UnnamedType	570
1010	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*UnnamedType	570
1011	demangle	GoString	{}	{string}	*UnnamedType	570
1012	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Clone	571
1013	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Clone	571
1014	demangle	GoString	{}	{string}	*Clone	571
1015	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special	572
1016	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special	572
1017	demangle	GoString	{}	{string}	*Special	572
1018	demangle	Traverse	{"func(demangle.AST) bool"}	{}	*Special2	573
1019	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}	*Special2	573
1020	demangle	GoString	{}	{string}	*Special2	573
1021	armasm	String	{}	{string}	Mode	575
1022	armasm	String	{}	{string}	Op	576
1023	armasm	String	{}	{string}	Inst	577
1024	armasm	IsArg	{}	{}	Float32Imm	580
1025	armasm	String	{}	{string}	Float32Imm	580
1026	armasm	IsArg	{}	{}	Float64Imm	581
1027	armasm	String	{}	{string}	Float64Imm	581
1028	armasm	IsArg	{}	{}	Imm	582
1029	armasm	String	{}	{string}	Imm	582
1030	armasm	IsArg	{}	{}	ImmAlt	583
1031	armasm	Imm	{}	{armasm.Imm}	ImmAlt	583
1797	token	IsKeyword	{}	{bool}	Token	1223
1032	armasm	String	{}	{string}	ImmAlt	583
1033	armasm	IsArg	{}	{}	Label	584
1034	armasm	String	{}	{string}	Label	584
1035	armasm	IsArg	{}	{}	Reg	585
1036	armasm	String	{}	{string}	Reg	585
1037	armasm	IsArg	{}	{}	RegX	586
1038	armasm	String	{}	{string}	RegX	586
1039	armasm	IsArg	{}	{}	RegList	587
1040	armasm	String	{}	{string}	RegList	587
1041	armasm	IsArg	{}	{}	Endian	588
1042	armasm	String	{}	{string}	Endian	588
1043	armasm	String	{}	{string}	Shift	589
1044	armasm	IsArg	{}	{}	RegShift	590
1045	armasm	String	{}	{string}	RegShift	590
1046	armasm	IsArg	{}	{}	RegShiftReg	591
1047	armasm	String	{}	{string}	RegShiftReg	591
1048	armasm	IsArg	{}	{}	PCRel	592
1049	armasm	String	{}	{string}	PCRel	592
1050	armasm	IsArg	{}	{}	Mem	594
1051	armasm	String	{}	{string}	Mem	594
1052	ppc64asm	String	{}	{string}	ArgType	595
1053	ppc64asm	GoString	{}	{string}	ArgType	595
1054	ppc64asm	String	{}	{string}	BitField	596
1055	ppc64asm	Parse	{uint32}	{uint32}	BitField	596
1056	ppc64asm	ParseSigned	{uint32}	{int32}	BitField	596
1057	ppc64asm	String	{}	{string}	BitFields	597
1058	ppc64asm	Append	{ppc64asm.BitField}	{}	*BitFields	597
1059	ppc64asm	Parse	{uint32}	{uint32}	BitFields	597
1060	ppc64asm	ParseSigned	{uint32}	{int32}	BitFields	597
1061	ppc64asm	String	{}	{string}	Inst	598
1062	ppc64asm	String	{}	{string}	Op	599
1063	ppc64asm	IsArg	{}	{}	Reg	602
1064	ppc64asm	String	{}	{string}	Reg	602
1065	ppc64asm	IsArg	{}	{}	CondReg	603
1066	ppc64asm	String	{}	{string}	CondReg	603
1067	ppc64asm	IsArg	{}	{}	SpReg	604
1068	ppc64asm	String	{}	{string}	SpReg	604
1069	ppc64asm	IsArg	{}	{}	PCRel	605
1070	ppc64asm	String	{}	{string}	PCRel	605
1071	ppc64asm	IsArg	{}	{}	Label	606
1072	ppc64asm	String	{}	{string}	Label	606
1073	ppc64asm	IsArg	{}	{}	Imm	607
1074	ppc64asm	String	{}	{string}	Imm	607
1075	ppc64asm	IsArg	{}	{}	Offset	608
1076	ppc64asm	String	{}	{string}	Offset	608
1077	x86asm	String	{}	{string}	Inst	609
1078	x86asm	IsREX	{}	{bool}	Prefix	611
1079	x86asm	IsVEX	{}	{bool}	Prefix	611
1080	x86asm	String	{}	{string}	Prefix	611
1081	x86asm	String	{}	{string}	Op	612
1082	x86asm	String	{}	{string}	Reg	615
1083	x86asm	String	{}	{string}	Mem	616
1084	x86asm	String	{}	{string}	Rel	617
1085	x86asm	String	{}	{string}	Imm	618
1086	cfg	Format	{*token.FileSet}	{string}	*CFG	619
1087	cfg	String	{}	{string}	*Block	620
1088	cfg	Return	{}	{*ast.ReturnStmt}	*Block	620
1089	testdata	SetX	{int}	{}	*ST	626
1090	testdata	OkMeth	{}	{}	*EmbeddedRWMutex	630
1091	testdata	BadMeth	{}	{}	EmbeddedRWMutex	630
1092	testdata	OkMeth	{}	{}	*FieldMutex	631
1093	testdata	BadMeth	{}	{}	FieldMutex	631
1094	testdata	Ok	{}	{}	*L0	632
1095	testdata	Bad	{}	{}	L0	632
1096	testdata	Ok	{}	{}	*EmbeddedMutexPointer	635
1097	testdata	AlsoOk	{}	{}	EmbeddedMutexPointer	635
1098	testdata	Ok	{}	{}	*EmbeddedLocker	636
1099	testdata	AlsoOk	{}	{}	EmbeddedLocker	636
1100	testdata	Lock	{}	{}	*CustomLock	637
1101	testdata	Unlock	{}	{}	*CustomLock	637
1102	testdata	Bad	{}	{}	LocalOnce	638
1103	testdata	Bad	{}	{}	LocalMutex	639
1104	testdata	M	{}	{}	T	640
1105	buf	Append	{[]byte}	{}	*Buf	641
1106	buf	Reset	{}	{}	Buf	641
1107	buf	Len	{}	{int}	Buf	641
1108	testdata	Scan	{fmt.ScanState,byte}	{}	*MethodTest	642
1109	testdata	Format	{fmt.State,rune}	{}	*Formatter	645
1110	testdata	Format	{fmt.State,rune}	{}	FormatterVal	646
1111	bzip2	Error	{}	{string}	StructuralError	662
1112	flate	Write	{[]byte}	{int,error}	*Writer	663
1113	flate	Flush	{}	{error}	*Writer	663
1114	flate	Close	{}	{error}	*Writer	663
1115	flate	Reset	{io.Writer}	{}	*Writer	663
1116	flate	Error	{}	{string}	CorruptInputError	664
1117	flate	Error	{}	{string}	InternalError	665
1118	flate	Error	{}	{string}	*ReadError	666
1119	flate	Error	{}	{string}	*WriteError	667
1120	gzip	Reset	{io.Reader}	{error}	*Reader	671
1121	gzip	Multistream	{bool}	{}	*Reader	671
1122	gzip	Read	{[]byte}	{int,error}	*Reader	671
1123	gzip	Close	{}	{error}	*Reader	671
1124	gzip	Reset	{io.Writer}	{}	*Writer	672
1125	gzip	Write	{[]byte}	{int,error}	*Writer	672
1126	gzip	Flush	{}	{error}	*Writer	672
1127	gzip	Close	{}	{error}	*Writer	672
1128	zlib	Reset	{io.Writer}	{}	*Writer	675
1129	zlib	Write	{[]byte}	{int,error}	*Writer	675
1130	zlib	Flush	{}	{error}	*Writer	675
1131	zlib	Close	{}	{error}	*Writer	675
1132	list	Next	{}	{*list.Element}	*Element	677
1133	list	Prev	{}	{*list.Element}	*Element	677
1134	list	Init	{}	{*list.List}	*List	678
1135	list	Len	{}	{int}	*List	678
1136	list	Front	{}	{*list.Element}	*List	678
1137	list	Back	{}	{*list.Element}	*List	678
1138	list	Remove	{*list.Element}	{"interface{}"}	*List	678
1139	list	PushFront	{"interface{}"}	{*list.Element}	*List	678
1140	list	PushBack	{"interface{}"}	{*list.Element}	*List	678
1141	list	InsertBefore	{"interface{}",*list.Element}	{*list.Element}	*List	678
1142	list	InsertAfter	{"interface{}",*list.Element}	{*list.Element}	*List	678
1143	list	MoveToFront	{*list.Element}	{}	*List	678
1144	list	MoveToBack	{*list.Element}	{}	*List	678
1145	list	MoveBefore	{*list.Element,*list.Element}	{}	*List	678
1146	list	MoveAfter	{*list.Element,*list.Element}	{}	*List	678
1147	list	PushBackList	{*list.List}	{}	*List	678
1148	list	PushFrontList	{*list.List}	{}	*List	678
1149	ring	Next	{}	{*ring.Ring}	*Ring	679
1150	ring	Prev	{}	{*ring.Ring}	*Ring	679
1151	ring	Move	{int}	{*ring.Ring}	*Ring	679
1152	ring	Link	{*ring.Ring}	{*ring.Ring}	*Ring	679
1153	ring	Unlink	{int}	{*ring.Ring}	*Ring	679
1154	ring	Len	{}	{int}	*Ring	679
1155	ring	Do	{"func(interface{})"}	{}	*Ring	679
1156	aes	Error	{}	{string}	KeySizeError	682
1157	cipher	Read	{[]byte}	{int,error}	StreamReader	687
1158	cipher	Write	{[]byte}	{int,error}	StreamWriter	688
1159	cipher	Close	{}	{error}	StreamWriter	688
1160	crypto	HashFunc	{}	{crypto.Hash}	Hash	689
1161	crypto	Size	{}	{int}	Hash	689
1162	crypto	New	{}	{hash.Hash}	Hash	689
1163	crypto	Available	{}	{bool}	Hash	689
1164	des	Error	{}	{string}	KeySizeError	696
1165	ecdsa	Public	{}	{crypto.PublicKey}	*PrivateKey	702
1166	ecdsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	702
1167	elliptic	Params	{}	{*elliptic.CurveParams}	*CurveParams	704
1168	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}	*CurveParams	704
1169	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	704
1170	elliptic	Double	{*big.Int,*big.Int}	{*big.Int,*big.Int}	*CurveParams	704
1171	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int,*big.Int}	*CurveParams	704
1172	elliptic	ScalarBaseMult	{[]byte}	{*big.Int,*big.Int}	*CurveParams	704
1173	rc4	Reset	{}	{}	*Cipher	706
1174	rc4	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	706
1175	rc4	XORKeyStream	{[]byte,[]byte}	{}	*Cipher	706
1176	rc4	Error	{}	{string}	KeySizeError	707
1177	rsa	HashFunc	{}	{crypto.Hash}	*PSSOptions	709
1178	rsa	Public	{}	{crypto.PublicKey}	*PrivateKey	712
1179	rsa	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}	*PrivateKey	712
1180	rsa	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}	*PrivateKey	712
1181	rsa	Validate	{}	{error}	*PrivateKey	712
1182	rsa	Precompute	{}	{}	*PrivateKey	712
1183	tls	Clone	{}	{*tls.Config}	*Config	724
1184	tls	SetSessionTicketKeys	{[][]byte}	{}	*Config	724
1185	tls	BuildNameToCertificate	{}	{}	*Config	724
1186	tls	LocalAddr	{}	{net.Addr}	*Conn	726
1187	tls	RemoteAddr	{}	{net.Addr}	*Conn	726
1188	tls	SetDeadline	{time.Time}	{error}	*Conn	726
1189	tls	SetReadDeadline	{time.Time}	{error}	*Conn	726
1190	tls	SetWriteDeadline	{time.Time}	{error}	*Conn	726
1191	tls	Write	{[]byte}	{int,error}	*Conn	726
1192	tls	Read	{[]byte}	{int,error}	*Conn	726
1193	tls	Close	{}	{error}	*Conn	726
1194	tls	CloseWrite	{}	{error}	*Conn	726
1195	tls	Handshake	{}	{error}	*Conn	726
1196	tls	ConnectionState	{}	{tls.ConnectionState}	*Conn	726
1197	tls	OCSPResponse	{}	{[]byte}	*Conn	726
1198	tls	VerifyHostname	{string}	{error}	*Conn	726
1199	tls	Error	{}	{string}	RecordHeaderError	727
1200	x509	AddCert	{*x509.Certificate}	{}	*CertPool	728
1201	x509	AppendCertsFromPEM	{[]byte}	{bool}	*CertPool	728
1202	x509	Subjects	{}	{[][]byte}	*CertPool	728
1203	pkix	FillFromRDNSequence	{*pkix.RDNSequence}	{}	*Name	736
1204	pkix	ToRDNSequence	{}	{pkix.RDNSequence}	Name	736
1205	pkix	HasExpired	{time.Time}	{bool}	*CertificateList	737
1206	x509	Error	{}	{string}	CertificateInvalidError	741
1207	x509	Error	{}	{string}	HostnameError	742
1208	x509	Error	{}	{string}	UnknownAuthorityError	743
1209	x509	Error	{}	{string}	SystemRootsError	744
1210	x509	String	{}	{string}	SignatureAlgorithm	746
1211	x509	Verify	{x509.VerifyOptions}	{[][]*x509.Certificate,error}	*Certificate	750
1212	x509	VerifyHostname	{string}	{error}	*Certificate	750
1213	x509	Equal	{*x509.Certificate}	{bool}	*Certificate	750
1214	x509	CheckSignatureFrom	{*x509.Certificate}	{error}	*Certificate	750
1215	x509	CheckSignature	{x509.SignatureAlgorithm,[]byte,[]byte}	{error}	*Certificate	750
1216	x509	CheckCRLSignature	{*pkix.CertificateList}	{error}	*Certificate	750
1217	x509	CreateCRL	{io.Reader,"interface{}",[]pkix.RevokedCertificate,time.Time,time.Time}	{[]byte,error}	*Certificate	750
1218	x509	Error	{}	{string}	InsecureAlgorithmError	751
1219	x509	Error	{}	{string}	ConstraintViolationError	752
1220	x509	Error	{}	{string}	UnhandledCriticalExtension	753
1221	x509	CheckSignature	{}	{error}	*CertificateRequest	754
1222	driver	LastInsertId	{}	{int64,error}	RowsAffected	782
1223	driver	RowsAffected	{}	{int64,error}	RowsAffected	782
1224	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	Null	785
1225	driver	ConvertValue	{"interface{}"}	{driver.Value,error}	NotNull	786
1226	sql	Scan	{"interface{}"}	{error}	*NullString	791
1227	sql	Value	{}	{driver.Value,error}	NullString	791
1228	sql	Scan	{"interface{}"}	{error}	*NullInt64	792
1229	sql	Value	{}	{driver.Value,error}	NullInt64	792
1230	sql	Scan	{"interface{}"}	{error}	*NullFloat64	793
1231	sql	Value	{}	{driver.Value,error}	NullFloat64	793
1232	sql	Scan	{"interface{}"}	{error}	*NullBool	794
1233	sql	Value	{}	{driver.Value,error}	NullBool	794
1234	sql	PingContext	{context.Context}	{error}	*DB	797
1235	sql	Ping	{}	{error}	*DB	797
1236	sql	Close	{}	{error}	*DB	797
1237	sql	SetMaxIdleConns	{int}	{}	*DB	797
1238	sql	SetMaxOpenConns	{int}	{}	*DB	797
1239	sql	SetConnMaxLifetime	{time.Duration}	{}	*DB	797
1240	sql	Stats	{}	{sql.DBStats}	*DB	797
1241	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*DB	797
1242	sql	Prepare	{string}	{*sql.Stmt,error}	*DB	797
1243	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*DB	797
1244	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*DB	797
1245	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*DB	797
1246	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*DB	797
1247	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*DB	797
1248	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*DB	797
1249	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*DB	797
1250	sql	Begin	{}	{*sql.Tx,error}	*DB	797
1251	sql	Driver	{}	{driver.Driver}	*DB	797
1252	sql	Conn	{context.Context}	{*sql.Conn,error}	*DB	797
1253	sql	PingContext	{context.Context}	{error}	*Conn	799
1254	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Conn	799
1255	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Conn	799
1256	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Conn	799
1257	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Conn	799
1258	sql	BeginTx	{context.Context,*sql.TxOptions}	{*sql.Tx,error}	*Conn	799
1259	sql	Close	{}	{error}	*Conn	799
1260	sql	Commit	{}	{error}	*Tx	800
1261	sql	Rollback	{}	{error}	*Tx	800
1262	sql	PrepareContext	{context.Context,string}	{*sql.Stmt,error}	*Tx	800
1263	sql	Prepare	{string}	{*sql.Stmt,error}	*Tx	800
1264	sql	StmtContext	{context.Context,*sql.Stmt}	{*sql.Stmt}	*Tx	800
1265	sql	Stmt	{*sql.Stmt}	{*sql.Stmt}	*Tx	800
1266	sql	ExecContext	{context.Context,string,"...interface{}"}	{sql.Result,error}	*Tx	800
1267	sql	Exec	{string,"...interface{}"}	{sql.Result,error}	*Tx	800
1268	sql	QueryContext	{context.Context,string,"...interface{}"}	{*sql.Rows,error}	*Tx	800
1269	sql	Query	{string,"...interface{}"}	{*sql.Rows,error}	*Tx	800
1270	sql	QueryRowContext	{context.Context,string,"...interface{}"}	{*sql.Row}	*Tx	800
1271	sql	QueryRow	{string,"...interface{}"}	{*sql.Row}	*Tx	800
1272	sql	ExecContext	{context.Context,"...interface{}"}	{sql.Result,error}	*Stmt	801
1273	sql	Exec	{"...interface{}"}	{sql.Result,error}	*Stmt	801
1274	sql	QueryContext	{context.Context,"...interface{}"}	{*sql.Rows,error}	*Stmt	801
1275	sql	Query	{"...interface{}"}	{*sql.Rows,error}	*Stmt	801
1276	sql	QueryRowContext	{context.Context,"...interface{}"}	{*sql.Row}	*Stmt	801
1277	sql	QueryRow	{"...interface{}"}	{*sql.Row}	*Stmt	801
1278	sql	Close	{}	{error}	*Stmt	801
1279	sql	Next	{}	{bool}	*Rows	802
1280	sql	NextResultSet	{}	{bool}	*Rows	802
1281	sql	Err	{}	{error}	*Rows	802
1282	sql	Columns	{}	{[]string,error}	*Rows	802
1283	sql	ColumnTypes	{}	{[]*sql.ColumnType,error}	*Rows	802
1284	sql	Scan	{"...interface{}"}	{error}	*Rows	802
1285	sql	Close	{}	{error}	*Rows	802
1286	sql	Name	{}	{string}	*ColumnType	803
1287	sql	Length	{}	{int64,bool}	*ColumnType	803
1288	sql	DecimalSize	{}	{int64,bool}	*ColumnType	803
1289	sql	ScanType	{}	{reflect.Type}	*ColumnType	803
1290	sql	Nullable	{}	{bool}	*ColumnType	803
1291	sql	DatabaseTypeName	{}	{string}	*ColumnType	803
1292	sql	Scan	{"...interface{}"}	{error}	*Row	804
1293	dwarf	Error	{}	{string}	DecodeError	806
1294	dwarf	String	{}	{string}	Attr	807
1295	dwarf	GoString	{}	{string}	Attr	807
1296	dwarf	String	{}	{string}	Tag	808
1297	dwarf	GoString	{}	{string}	Tag	808
1298	dwarf	Val	{dwarf.Attr}	{"interface{}"}	*Entry	809
1299	dwarf	AttrField	{dwarf.Attr}	{*dwarf.Field}	*Entry	809
1300	dwarf	String	{}	{string}	Class	811
1301	dwarf	GoString	{}	{string}	Class	811
1302	dwarf	AddressSize	{}	{int}	*Reader	813
1303	dwarf	Seek	{dwarf.Offset}	{}	*Reader	813
1304	dwarf	Next	{}	{*dwarf.Entry,error}	*Reader	813
1305	dwarf	SkipChildren	{}	{}	*Reader	813
1306	dwarf	SeekPC	{uint64}	{*dwarf.Entry,error}	*Reader	813
1307	dwarf	Next	{*dwarf.LineEntry}	{error}	*LineReader	814
1308	dwarf	Tell	{}	{dwarf.LineReaderPos}	*LineReader	814
1309	dwarf	Seek	{dwarf.LineReaderPos}	{}	*LineReader	814
1310	dwarf	Reset	{}	{}	*LineReader	814
1311	dwarf	SeekPC	{uint64,*dwarf.LineEntry}	{error}	*LineReader	814
1312	dwarf	Reader	{}	{*dwarf.Reader}	*Data	818
1313	dwarf	Ranges	{*dwarf.Entry}	{[][]uint64,error}	*Data	818
1314	dwarf	LineReader	{*dwarf.Entry}	{*dwarf.LineReader,error}	*Data	818
1315	dwarf	AddTypes	{string,[]byte}	{error}	*Data	818
1316	dwarf	Type	{dwarf.Offset}	{dwarf.Type,error}	*Data	818
1317	dwarf	Common	{}	{*dwarf.CommonType}	*CommonType	820
1318	dwarf	Size	{}	{int64}	*CommonType	820
1319	dwarf	Basic	{}	{*dwarf.BasicType}	*BasicType	821
1320	dwarf	String	{}	{string}	*BasicType	821
1321	dwarf	String	{}	{string}	*QualType	831
1322	dwarf	Size	{}	{int64}	*QualType	831
1323	dwarf	String	{}	{string}	*ArrayType	832
1324	dwarf	Size	{}	{int64}	*ArrayType	832
1325	dwarf	String	{}	{string}	*VoidType	833
1326	dwarf	String	{}	{string}	*PtrType	834
1327	dwarf	String	{}	{string}	*StructType	835
1328	dwarf	Defn	{}	{string}	*StructType	835
1329	dwarf	String	{}	{string}	*EnumType	837
1330	dwarf	String	{}	{string}	*FuncType	839
1331	dwarf	String	{}	{string}	*DotDotDotType	840
1332	dwarf	String	{}	{string}	*TypedefType	841
1333	dwarf	Size	{}	{int64}	*TypedefType	841
1334	elf	String	{}	{string}	Version	842
1335	elf	GoString	{}	{string}	Version	842
1336	elf	String	{}	{string}	Class	843
1337	elf	GoString	{}	{string}	Class	843
1338	elf	String	{}	{string}	Data	844
1339	elf	GoString	{}	{string}	Data	844
1340	elf	String	{}	{string}	OSABI	845
1341	elf	GoString	{}	{string}	OSABI	845
1342	elf	String	{}	{string}	Type	846
1343	elf	GoString	{}	{string}	Type	846
1344	elf	String	{}	{string}	Machine	847
1345	elf	GoString	{}	{string}	Machine	847
1346	elf	String	{}	{string}	SectionIndex	848
1347	elf	GoString	{}	{string}	SectionIndex	848
1348	elf	String	{}	{string}	SectionType	849
1349	elf	GoString	{}	{string}	SectionType	849
1350	elf	String	{}	{string}	SectionFlag	850
1351	elf	GoString	{}	{string}	SectionFlag	850
1352	elf	String	{}	{string}	CompressionType	851
1353	elf	GoString	{}	{string}	CompressionType	851
1354	elf	String	{}	{string}	ProgType	852
1355	elf	GoString	{}	{string}	ProgType	852
1356	elf	String	{}	{string}	ProgFlag	853
1357	elf	GoString	{}	{string}	ProgFlag	853
1358	elf	String	{}	{string}	DynTag	854
1359	elf	GoString	{}	{string}	DynTag	854
1360	elf	String	{}	{string}	DynFlag	855
1361	elf	GoString	{}	{string}	DynFlag	855
1362	elf	String	{}	{string}	NType	856
1363	elf	GoString	{}	{string}	NType	856
1364	elf	String	{}	{string}	SymBind	857
1365	elf	GoString	{}	{string}	SymBind	857
1366	elf	String	{}	{string}	SymType	858
1367	elf	GoString	{}	{string}	SymType	858
1368	elf	String	{}	{string}	SymVis	859
1369	elf	GoString	{}	{string}	SymVis	859
1370	elf	String	{}	{string}	R_X86_64	860
1371	elf	GoString	{}	{string}	R_X86_64	860
1372	elf	String	{}	{string}	R_AARCH64	861
1373	elf	GoString	{}	{string}	R_AARCH64	861
1374	elf	String	{}	{string}	R_ALPHA	862
1375	elf	GoString	{}	{string}	R_ALPHA	862
1376	elf	String	{}	{string}	R_ARM	863
1377	elf	GoString	{}	{string}	R_ARM	863
1378	elf	String	{}	{string}	R_386	864
1379	elf	GoString	{}	{string}	R_386	864
1380	elf	String	{}	{string}	R_MIPS	865
1381	elf	GoString	{}	{string}	R_MIPS	865
1382	elf	String	{}	{string}	R_PPC	866
1383	elf	GoString	{}	{string}	R_PPC	866
1384	elf	String	{}	{string}	R_PPC64	867
1385	elf	GoString	{}	{string}	R_PPC64	867
1386	elf	String	{}	{string}	R_390	868
1387	elf	GoString	{}	{string}	R_390	868
1388	elf	String	{}	{string}	R_SPARC	869
1389	elf	GoString	{}	{string}	R_SPARC	869
1390	elf	Close	{}	{error}	*File	887
1391	elf	SectionByType	{elf.SectionType}	{*elf.Section}	*File	887
1392	elf	Section	{string}	{*elf.Section}	*File	887
1393	elf	DWARF	{}	{*dwarf.Data,error}	*File	887
1394	elf	Symbols	{}	{[]elf.Symbol,error}	*File	887
1395	elf	DynamicSymbols	{}	{[]elf.Symbol,error}	*File	887
1396	elf	ImportedSymbols	{}	{[]elf.ImportedSymbol,error}	*File	887
1397	elf	ImportedLibraries	{}	{[]string,error}	*File	887
1398	elf	DynString	{elf.DynTag}	{[]string,error}	*File	887
1399	elf	Data	{}	{[]byte,error}	*Section	889
1400	elf	Open	{}	{io.ReadSeeker}	*Section	889
1401	elf	Open	{}	{io.ReadSeeker}	*Prog	891
1402	elf	Error	{}	{string}	*FormatError	893
1403	gosym	PCToLine	{uint64}	{int}	*LineTable	895
1404	gosym	LineToPC	{int,uint64}	{uint64}	*LineTable	895
1405	gosym	Static	{}	{bool}	*Sym	896
1406	gosym	PackageName	{}	{string}	*Sym	896
1407	gosym	ReceiverName	{}	{string}	*Sym	896
1408	gosym	BaseName	{}	{string}	*Sym	896
1409	gosym	PCToFunc	{uint64}	{*gosym.Func}	*Table	899
1410	gosym	PCToLine	{uint64}	{string,int,*gosym.Func}	*Table	899
1411	gosym	LineToPC	{string,int}	{uint64,*gosym.Func,error}	*Table	899
1412	gosym	LookupSym	{string}	{*gosym.Sym}	*Table	899
1413	gosym	LookupFunc	{string}	{*gosym.Func}	*Table	899
1414	gosym	SymByAddr	{uint64}	{*gosym.Sym}	*Table	899
1415	gosym	Error	{}	{string}	UnknownFileError	900
1416	gosym	Error	{}	{string}	*UnknownLineError	901
1417	gosym	Error	{}	{string}	*DecodingError	902
1418	macho	Close	{}	{error}	*FatFile	903
1419	macho	Close	{}	{error}	*File	906
1420	macho	Segment	{string}	{*macho.Segment}	*File	906
1421	macho	Section	{string}	{*macho.Section}	*File	906
1422	macho	DWARF	{}	{*dwarf.Data,error}	*File	906
1423	macho	ImportedSymbols	{}	{[]string,error}	*File	906
1424	macho	ImportedLibraries	{}	{[]string,error}	*File	906
1425	macho	Raw	{}	{[]byte}	LoadBytes	908
1426	macho	Data	{}	{[]byte,error}	*Segment	910
1427	macho	Open	{}	{io.ReadSeeker}	*Segment	910
1428	macho	Data	{}	{[]byte,error}	*Section	912
1429	macho	Open	{}	{io.ReadSeeker}	*Section	912
1430	macho	Error	{}	{string}	*FormatError	916
1431	macho	String	{}	{string}	Cpu	919
1432	macho	GoString	{}	{string}	Cpu	919
1433	macho	String	{}	{string}	LoadCmd	920
1434	macho	GoString	{}	{string}	LoadCmd	920
1435	pe	Close	{}	{error}	*File	934
1436	pe	Section	{string}	{*pe.Section}	*File	934
1437	pe	DWARF	{}	{*dwarf.Data,error}	*File	934
1438	pe	ImportedSymbols	{}	{[]string,error}	*File	934
1439	pe	ImportedLibraries	{}	{[]string,error}	*File	934
1440	pe	Error	{}	{string}	*FormatError	936
1441	pe	Data	{}	{[]byte,error}	*Section	944
1442	pe	Open	{}	{io.ReadSeeker}	*Section	944
1443	pe	String	{uint32}	{string,error}	StringTable	945
1444	pe	FullName	{pe.StringTable}	{string,error}	*COFFSymbol	946
1445	plan9obj	Close	{}	{error}	*File	949
1446	plan9obj	Symbols	{}	{[]plan9obj.Sym,error}	*File	949
1447	plan9obj	Section	{string}	{*plan9obj.Section}	*File	949
1448	plan9obj	Data	{}	{[]byte,error}	*Section	951
1449	plan9obj	Open	{}	{io.ReadSeeker}	*Section	951
1450	ascii85	Error	{}	{string}	CorruptInputError	953
1451	asn1	Error	{}	{string}	StructuralError	954
1452	asn1	Error	{}	{string}	SyntaxError	955
1453	asn1	At	{int}	{int}	BitString	956
1454	asn1	RightAlign	{}	{[]byte}	BitString	956
1455	asn1	Equal	{asn1.ObjectIdentifier}	{bool}	ObjectIdentifier	957
1456	asn1	String	{}	{string}	ObjectIdentifier	957
1457	base32	WithPadding	{rune}	{*base32.Encoding}	Encoding	962
1458	base32	Encode	{[]byte,[]byte}	{}	*Encoding	962
1459	base32	EncodeToString	{[]byte}	{string}	*Encoding	962
1460	base32	EncodedLen	{int}	{int}	*Encoding	962
1461	base32	Decode	{[]byte,[]byte}	{int,error}	*Encoding	962
1462	base32	DecodeString	{string}	{[]byte,error}	*Encoding	962
1463	base32	DecodedLen	{int}	{int}	*Encoding	962
1464	base32	Error	{}	{string}	CorruptInputError	963
1465	base64	WithPadding	{rune}	{*base64.Encoding}	Encoding	964
1466	base64	Strict	{}	{*base64.Encoding}	Encoding	964
1467	base64	Encode	{[]byte,[]byte}	{}	*Encoding	964
1468	base64	EncodeToString	{[]byte}	{string}	*Encoding	964
1469	base64	EncodedLen	{int}	{int}	*Encoding	964
1470	base64	Decode	{[]byte,[]byte}	{int,error}	*Encoding	964
1471	base64	DecodeString	{string}	{[]byte,error}	*Encoding	964
1472	base64	DecodedLen	{int}	{int}	*Encoding	964
1473	base64	Error	{}	{string}	CorruptInputError	965
1474	csv	Error	{}	{string}	*ParseError	967
1475	csv	Read	{}	{[]string,error}	*Reader	968
1476	csv	ReadAll	{}	{[][]string,error}	*Reader	968
1477	csv	Write	{[]string}	{error}	*Writer	969
1478	csv	Flush	{}	{}	*Writer	969
1479	csv	Error	{}	{error}	*Writer	969
1480	csv	WriteAll	{[][]string}	{error}	*Writer	969
1481	gob	Decode	{"interface{}"}	{error}	*Decoder	975
1482	gob	DecodeValue	{reflect.Value}	{error}	*Decoder	975
1483	gob	Encode	{"interface{}"}	{error}	*Encoder	977
1484	gob	EncodeValue	{reflect.Value}	{error}	*Encoder	977
1485	hex	Error	{}	{string}	InvalidByteError	981
1486	json	Error	{}	{string}	*UnmarshalTypeError	983
1487	json	Error	{}	{string}	*UnmarshalFieldError	984
1488	json	Error	{}	{string}	*InvalidUnmarshalError	985
1489	json	String	{}	{string}	Number	986
1490	json	Float64	{}	{float64,error}	Number	986
1491	json	Int64	{}	{int64,error}	Number	986
1492	json	Error	{}	{string}	*UnsupportedTypeError	988
1493	json	Error	{}	{string}	*UnsupportedValueError	989
1494	json	Error	{}	{string}	*InvalidUTF8Error	990
1495	json	Error	{}	{string}	*MarshalerError	991
1496	json	Error	{}	{string}	*SyntaxError	992
1497	json	UseNumber	{}	{}	*Decoder	993
1498	json	Decode	{"interface{}"}	{error}	*Decoder	993
1499	json	Buffered	{}	{io.Reader}	*Decoder	993
1500	json	Token	{}	{json.Token,error}	*Decoder	993
1501	json	More	{}	{bool}	*Decoder	993
1502	json	Encode	{"interface{}"}	{error}	*Encoder	994
1503	json	SetIndent	{string,string}	{}	*Encoder	994
1504	json	SetEscapeHTML	{bool}	{}	*Encoder	994
1505	json	MarshalJSON	{}	{[]byte,error}	RawMessage	995
1506	json	UnmarshalJSON	{[]byte}	{error}	*RawMessage	995
1507	json	String	{}	{string}	Delim	997
1508	xml	Indent	{string,string}	{}	*Encoder	1001
1509	xml	Encode	{"interface{}"}	{error}	*Encoder	1001
1510	xml	EncodeElement	{"interface{}",xml.StartElement}	{error}	*Encoder	1001
1511	xml	EncodeToken	{xml.Token}	{error}	*Encoder	1001
1512	xml	Flush	{}	{error}	*Encoder	1001
1513	xml	Error	{}	{string}	*UnsupportedTypeError	1002
1514	xml	Error	{}	{string}	UnmarshalError	1003
1515	xml	Error	{}	{string}	*TagPathError	1006
1516	xml	Error	{}	{string}	*SyntaxError	1007
1517	xml	Copy	{}	{xml.StartElement}	StartElement	1011
1518	xml	End	{}	{xml.EndElement}	StartElement	1011
1519	xml	Copy	{}	{xml.CharData}	CharData	1013
1520	xml	Copy	{}	{xml.Comment}	Comment	1014
1521	xml	Copy	{}	{xml.ProcInst}	ProcInst	1015
1522	xml	Copy	{}	{xml.Directive}	Directive	1016
1523	xml	Decode	{"interface{}"}	{error}	*Decoder	1017
1524	xml	DecodeElement	{"interface{}",*xml.StartElement}	{error}	*Decoder	1017
1525	xml	Skip	{}	{error}	*Decoder	1017
1526	xml	Token	{}	{xml.Token,error}	*Decoder	1017
1527	xml	RawToken	{}	{xml.Token,error}	*Decoder	1017
1528	xml	InputOffset	{}	{int64}	*Decoder	1017
1529	expvar	Value	{}	{int64}	*Int	1019
1530	expvar	String	{}	{string}	*Int	1019
1531	expvar	Add	{int64}	{}	*Int	1019
1532	expvar	Set	{int64}	{}	*Int	1019
1533	expvar	Value	{}	{float64}	*Float	1020
1534	expvar	String	{}	{string}	*Float	1020
1535	expvar	Add	{float64}	{}	*Float	1020
1536	expvar	Set	{float64}	{}	*Float	1020
1537	expvar	String	{}	{string}	*Map	1021
1538	expvar	Init	{}	{*expvar.Map}	*Map	1021
1539	expvar	Get	{string}	{expvar.Var}	*Map	1021
1540	expvar	Set	{string,expvar.Var}	{}	*Map	1021
1541	expvar	Add	{string,int64}	{}	*Map	1021
1542	expvar	AddFloat	{string,float64}	{}	*Map	1021
1543	expvar	Do	{func(expvar.KeyValue)}	{}	*Map	1021
1544	expvar	Value	{}	{string}	*String	1023
1545	expvar	String	{}	{string}	*String	1023
1546	expvar	Set	{string}	{}	*String	1023
1547	expvar	Value	{}	{"interface{}"}	Func	1024
1548	expvar	String	{}	{string}	Func	1024
1549	flag	SetOutput	{io.Writer}	{}	*FlagSet	1028
1550	flag	VisitAll	{func(*flag.Flag)}	{}	*FlagSet	1028
1551	flag	Visit	{func(*flag.Flag)}	{}	*FlagSet	1028
1552	flag	Lookup	{string}	{*flag.Flag}	*FlagSet	1028
1553	flag	Set	{string,string}	{error}	*FlagSet	1028
1554	flag	PrintDefaults	{}	{}	*FlagSet	1028
1555	flag	NFlag	{}	{int}	*FlagSet	1028
1556	flag	Arg	{int}	{string}	*FlagSet	1028
1557	flag	NArg	{}	{int}	*FlagSet	1028
1558	flag	Args	{}	{[]string}	*FlagSet	1028
1559	flag	BoolVar	{*bool,string,bool,string}	{}	*FlagSet	1028
1560	flag	Bool	{string,bool,string}	{*bool}	*FlagSet	1028
1561	flag	IntVar	{*int,string,int,string}	{}	*FlagSet	1028
1562	flag	Int	{string,int,string}	{*int}	*FlagSet	1028
1563	flag	Int64Var	{*int64,string,int64,string}	{}	*FlagSet	1028
1564	flag	Int64	{string,int64,string}	{*int64}	*FlagSet	1028
1565	flag	UintVar	{*uint,string,uint,string}	{}	*FlagSet	1028
1566	flag	Uint	{string,uint,string}	{*uint}	*FlagSet	1028
1567	flag	Uint64Var	{*uint64,string,uint64,string}	{}	*FlagSet	1028
1568	flag	Uint64	{string,uint64,string}	{*uint64}	*FlagSet	1028
1569	flag	StringVar	{*string,string,string,string}	{}	*FlagSet	1028
1570	flag	String	{string,string,string}	{*string}	*FlagSet	1028
1571	flag	Float64Var	{*float64,string,float64,string}	{}	*FlagSet	1028
1572	flag	Float64	{string,float64,string}	{*float64}	*FlagSet	1028
1573	flag	DurationVar	{*time.Duration,string,time.Duration,string}	{}	*FlagSet	1028
1574	flag	Duration	{string,time.Duration,string}	{*time.Duration}	*FlagSet	1028
1575	flag	Var	{flag.Value,string,string}	{}	*FlagSet	1028
1576	flag	Parse	{[]string}	{error}	*FlagSet	1028
1577	flag	Parsed	{}	{bool}	*FlagSet	1028
1578	flag	Init	{string,flag.ErrorHandling}	{}	*FlagSet	1028
1579	ast	Pos	{}	{token.Pos}	*Comment	1040
1580	ast	End	{}	{token.Pos}	*Comment	1040
1581	ast	Pos	{}	{token.Pos}	*CommentGroup	1041
1582	ast	End	{}	{token.Pos}	*CommentGroup	1041
1583	ast	Text	{}	{string}	*CommentGroup	1041
1584	ast	Pos	{}	{token.Pos}	*Field	1042
1585	ast	End	{}	{token.Pos}	*Field	1042
1586	ast	Pos	{}	{token.Pos}	*FieldList	1043
1587	ast	End	{}	{token.Pos}	*FieldList	1043
1588	ast	NumFields	{}	{int}	*FieldList	1043
1589	ast	Pos	{}	{token.Pos}	*BadExpr	1044
1590	ast	End	{}	{token.Pos}	*BadExpr	1044
1591	ast	Pos	{}	{token.Pos}	*Ident	1045
1592	ast	End	{}	{token.Pos}	*Ident	1045
1593	ast	IsExported	{}	{bool}	*Ident	1045
1594	ast	String	{}	{string}	*Ident	1045
1595	ast	Pos	{}	{token.Pos}	*Ellipsis	1046
1596	ast	End	{}	{token.Pos}	*Ellipsis	1046
1597	ast	Pos	{}	{token.Pos}	*BasicLit	1047
1598	ast	End	{}	{token.Pos}	*BasicLit	1047
1599	ast	Pos	{}	{token.Pos}	*FuncLit	1048
1600	ast	End	{}	{token.Pos}	*FuncLit	1048
1601	ast	Pos	{}	{token.Pos}	*CompositeLit	1049
1602	ast	End	{}	{token.Pos}	*CompositeLit	1049
1603	ast	Pos	{}	{token.Pos}	*ParenExpr	1050
1604	ast	End	{}	{token.Pos}	*ParenExpr	1050
1605	ast	Pos	{}	{token.Pos}	*SelectorExpr	1051
1606	ast	End	{}	{token.Pos}	*SelectorExpr	1051
1607	ast	Pos	{}	{token.Pos}	*IndexExpr	1052
1608	ast	End	{}	{token.Pos}	*IndexExpr	1052
1609	ast	Pos	{}	{token.Pos}	*SliceExpr	1053
1610	ast	End	{}	{token.Pos}	*SliceExpr	1053
1611	ast	Pos	{}	{token.Pos}	*TypeAssertExpr	1054
1612	ast	End	{}	{token.Pos}	*TypeAssertExpr	1054
1613	ast	Pos	{}	{token.Pos}	*CallExpr	1055
1614	ast	End	{}	{token.Pos}	*CallExpr	1055
1615	ast	Pos	{}	{token.Pos}	*StarExpr	1056
1616	ast	End	{}	{token.Pos}	*StarExpr	1056
1617	ast	Pos	{}	{token.Pos}	*UnaryExpr	1057
1618	ast	End	{}	{token.Pos}	*UnaryExpr	1057
1619	ast	Pos	{}	{token.Pos}	*BinaryExpr	1058
1620	ast	End	{}	{token.Pos}	*BinaryExpr	1058
1621	ast	Pos	{}	{token.Pos}	*KeyValueExpr	1059
1622	ast	End	{}	{token.Pos}	*KeyValueExpr	1059
1623	ast	Pos	{}	{token.Pos}	*ArrayType	1061
1624	ast	End	{}	{token.Pos}	*ArrayType	1061
1625	ast	Pos	{}	{token.Pos}	*StructType	1062
1626	ast	End	{}	{token.Pos}	*StructType	1062
1627	ast	Pos	{}	{token.Pos}	*FuncType	1063
1628	ast	End	{}	{token.Pos}	*FuncType	1063
1629	ast	Pos	{}	{token.Pos}	*InterfaceType	1064
1630	ast	End	{}	{token.Pos}	*InterfaceType	1064
1631	ast	Pos	{}	{token.Pos}	*MapType	1065
1632	ast	End	{}	{token.Pos}	*MapType	1065
1633	ast	Pos	{}	{token.Pos}	*ChanType	1066
1634	ast	End	{}	{token.Pos}	*ChanType	1066
1635	ast	Pos	{}	{token.Pos}	*BadStmt	1067
1636	ast	End	{}	{token.Pos}	*BadStmt	1067
1637	ast	Pos	{}	{token.Pos}	*DeclStmt	1068
1638	ast	End	{}	{token.Pos}	*DeclStmt	1068
1639	ast	Pos	{}	{token.Pos}	*EmptyStmt	1069
1640	ast	End	{}	{token.Pos}	*EmptyStmt	1069
1641	ast	Pos	{}	{token.Pos}	*LabeledStmt	1070
1642	ast	End	{}	{token.Pos}	*LabeledStmt	1070
1643	ast	Pos	{}	{token.Pos}	*ExprStmt	1071
1644	ast	End	{}	{token.Pos}	*ExprStmt	1071
1645	ast	Pos	{}	{token.Pos}	*SendStmt	1072
1646	ast	End	{}	{token.Pos}	*SendStmt	1072
1647	ast	Pos	{}	{token.Pos}	*IncDecStmt	1073
1648	ast	End	{}	{token.Pos}	*IncDecStmt	1073
1649	ast	Pos	{}	{token.Pos}	*AssignStmt	1074
1650	ast	End	{}	{token.Pos}	*AssignStmt	1074
1651	ast	Pos	{}	{token.Pos}	*GoStmt	1075
1652	ast	End	{}	{token.Pos}	*GoStmt	1075
1653	ast	Pos	{}	{token.Pos}	*DeferStmt	1076
1654	ast	End	{}	{token.Pos}	*DeferStmt	1076
1655	ast	Pos	{}	{token.Pos}	*ReturnStmt	1077
1656	ast	End	{}	{token.Pos}	*ReturnStmt	1077
1657	ast	Pos	{}	{token.Pos}	*BranchStmt	1078
1658	ast	End	{}	{token.Pos}	*BranchStmt	1078
1659	ast	Pos	{}	{token.Pos}	*BlockStmt	1079
1660	ast	End	{}	{token.Pos}	*BlockStmt	1079
1661	ast	Pos	{}	{token.Pos}	*IfStmt	1080
1662	ast	End	{}	{token.Pos}	*IfStmt	1080
1663	ast	Pos	{}	{token.Pos}	*CaseClause	1081
1664	ast	End	{}	{token.Pos}	*CaseClause	1081
1665	ast	Pos	{}	{token.Pos}	*SwitchStmt	1082
1666	ast	End	{}	{token.Pos}	*SwitchStmt	1082
1667	ast	Pos	{}	{token.Pos}	*TypeSwitchStmt	1083
1668	ast	End	{}	{token.Pos}	*TypeSwitchStmt	1083
1669	ast	Pos	{}	{token.Pos}	*CommClause	1084
1670	ast	End	{}	{token.Pos}	*CommClause	1084
1671	ast	Pos	{}	{token.Pos}	*SelectStmt	1085
1672	ast	End	{}	{token.Pos}	*SelectStmt	1085
1673	ast	Pos	{}	{token.Pos}	*ForStmt	1086
1674	ast	End	{}	{token.Pos}	*ForStmt	1086
1675	ast	Pos	{}	{token.Pos}	*RangeStmt	1087
1676	ast	End	{}	{token.Pos}	*RangeStmt	1087
1677	ast	Pos	{}	{token.Pos}	*ImportSpec	1089
1678	ast	End	{}	{token.Pos}	*ImportSpec	1089
1679	ast	Pos	{}	{token.Pos}	*ValueSpec	1090
1680	ast	End	{}	{token.Pos}	*ValueSpec	1090
1681	ast	Pos	{}	{token.Pos}	*TypeSpec	1091
1682	ast	End	{}	{token.Pos}	*TypeSpec	1091
1683	ast	Pos	{}	{token.Pos}	*BadDecl	1092
1684	ast	End	{}	{token.Pos}	*BadDecl	1092
1685	ast	Pos	{}	{token.Pos}	*GenDecl	1093
1686	ast	End	{}	{token.Pos}	*GenDecl	1093
1687	ast	Pos	{}	{token.Pos}	*FuncDecl	1094
1688	ast	End	{}	{token.Pos}	*FuncDecl	1094
1689	ast	Pos	{}	{token.Pos}	*File	1095
1690	ast	End	{}	{token.Pos}	*File	1095
1691	ast	Pos	{}	{token.Pos}	*Package	1096
1692	ast	End	{}	{token.Pos}	*Package	1096
1693	ast	Update	{ast.Node,ast.Node}	{ast.Node}	CommentMap	1097
1694	ast	Filter	{ast.Node}	{ast.CommentMap}	CommentMap	1097
1695	ast	Comments	{}	{[]*ast.CommentGroup}	CommentMap	1097
1696	ast	String	{}	{string}	CommentMap	1097
1697	ast	Lookup	{string}	{*ast.Object}	*Scope	1102
1698	ast	Insert	{*ast.Object}	{*ast.Object}	*Scope	1102
1699	ast	String	{}	{string}	*Scope	1102
1700	ast	Pos	{}	{token.Pos}	*Object	1103
1701	ast	String	{}	{string}	ObjKind	1104
1702	build	SrcDirs	{}	{[]string}	*Context	1106
1703	build	ImportDir	{string,build.ImportMode}	{*build.Package,error}	*Context	1106
1704	build	Import	{string,string,build.ImportMode}	{*build.Package,error}	*Context	1106
1705	build	MatchFile	{string,string}	{bool,error}	*Context	1106
1706	build	IsCommand	{}	{bool}	*Package	1108
1707	build	Error	{}	{string}	*NoGoError	1109
1708	build	Error	{}	{string}	*MultiplePackageError	1110
1709	doc	Filter	{doc.Filter}	{}	*Package	1113
1710	b	M	{}	{}	*T	1121
1711	testing	StartTimer	{}	{}	*B	1123
1712	testing	StopTimer	{}	{}	*B	1123
1713	testing	ResetTimer	{}	{}	*B	1123
1714	testing	SetBytes	{int64}	{}	*B	1123
1715	testing	StartTimer	{}	{}	*B	1123
1716	testing	StopTimer	{}	{}	*B	1123
1717	testing	ResetTimer	{}	{}	*B	1123
1718	testing	SetBytes	{int64}	{}	*B	1123
1719	testing	ReportAllocs	{}	{}	*B	1123
1720	testing	Run	{string,func(*testing.B)}	{bool}	*B	1123
1721	testing	RunParallel	{func(*testing.PB)}	{}	*B	1123
1722	testing	SetParallelism	{int}	{}	*B	1123
1723	testing	NsPerOp	{}	{int64}	BenchmarkResult	1124
1724	testing	String	{}	{string}	BenchmarkResult	1124
1725	testing	NsPerOp	{}	{int64}	BenchmarkResult	1124
1798	types	Error	{}	{string}	Error	1224
1726	testing	AllocsPerOp	{}	{int64}	BenchmarkResult	1124
1727	testing	AllocedBytesPerOp	{}	{int64}	BenchmarkResult	1124
1728	testing	String	{}	{string}	BenchmarkResult	1124
1729	testing	MemString	{}	{string}	BenchmarkResult	1124
1730	c	M	{}	{}	*T1	1135
1731	e	M	{}	{}	T2	1144
1732	e	M	{}	{}	T3	1145
1733	e	M	{}	{}	*T4	1146
1734	e	M	{}	{}	*U1	1149
1735	e	M	{}	{}	*U2	1150
1736	e	N	{}	{}	*U3	1151
1737	e	M	{}	{}	*U4	1152
1738	e	M	{}	{}	*V4	1156
1739	e	M	{}	{}	*V6	1158
1740	testing	Parallel	{}	{}	*T	1166
1741	testing	Parallel	{}	{}	*T	1166
1742	testing	Run	{string,func(*testing.T)}	{bool}	*T	1166
1743	gccgoimporter	InitFromDriver	{string}	{error}	*GccgoInstallation	1169
1744	gccgoimporter	SearchPaths	{}	{[]string}	*GccgoInstallation	1169
1745	gccgoimporter	GetImporter	{[]string,map[*types.Package]gccgoimporter.InitData}	{gccgoimporter.Importer}	*GccgoInstallation	1169
1746	exports	M1	{}	{}	*T1	1177
1747	srcimporter	Import	{string}	{*types.Package,error}	*Importer	1209
1748	srcimporter	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}	*Importer	1209
1749	printer	Fprint	{io.Writer,*token.FileSet,"interface{}"}	{error}	*Config	1212
1750	scanner	Error	{}	{string}	Error	1214
1751	scanner	Add	{token.Position,string}	{}	*ErrorList	1215
1752	scanner	Reset	{}	{}	*ErrorList	1215
1753	scanner	Len	{}	{int}	ErrorList	1215
1754	scanner	Swap	{int,int}	{}	ErrorList	1215
1755	scanner	Less	{int,int}	{bool}	ErrorList	1215
1756	scanner	Sort	{}	{}	ErrorList	1215
1757	scanner	RemoveMultiples	{}	{}	*ErrorList	1215
1758	scanner	Error	{}	{string}	ErrorList	1215
1759	scanner	Err	{}	{error}	ErrorList	1215
1760	scanner	Init	{*token.File,[]byte,scanner.ErrorHandler,scanner.Mode}	{}	*Scanner	1217
1761	scanner	Scan	{}	{token.Pos,token.Token,string}	*Scanner	1217
1762	scanner	Init	{io.Reader}	{*scanner.Scanner}	*Scanner	1217
1763	scanner	Next	{}	{rune}	*Scanner	1217
1764	scanner	Peek	{}	{rune}	*Scanner	1217
1765	scanner	Scan	{}	{rune}	*Scanner	1217
1766	scanner	Pos	{}	{scanner.Position}	*Scanner	1217
1767	scanner	TokenText	{}	{string}	*Scanner	1217
1768	token	IsValid	{}	{bool}	*Position	1219
1769	token	String	{}	{string}	Position	1219
1770	token	IsValid	{}	{bool}	Pos	1220
1771	token	Name	{}	{string}	*File	1221
1772	token	Base	{}	{int}	*File	1221
1773	token	Size	{}	{int}	*File	1221
1774	token	LineCount	{}	{int}	*File	1221
1775	token	AddLine	{int}	{}	*File	1221
1776	token	MergeLine	{int}	{}	*File	1221
1777	token	SetLines	{[]int}	{bool}	*File	1221
1778	token	SetLinesForContent	{[]byte}	{}	*File	1221
1779	token	AddLineInfo	{int,string,int}	{}	*File	1221
1780	token	Pos	{int}	{token.Pos}	*File	1221
1781	token	Offset	{token.Pos}	{int}	*File	1221
1782	token	Line	{token.Pos}	{int}	*File	1221
1783	token	PositionFor	{token.Pos,bool}	{token.Position}	*File	1221
1784	token	Position	{token.Pos}	{token.Position}	*File	1221
1785	token	Base	{}	{int}	*FileSet	1222
1786	token	AddFile	{string,int,int}	{*token.File}	*FileSet	1222
1787	token	Iterate	{"func(*token.File) bool"}	{}	*FileSet	1222
1788	token	File	{token.Pos}	{*token.File}	*FileSet	1222
1789	token	PositionFor	{token.Pos,bool}	{token.Position}	*FileSet	1222
1790	token	Position	{token.Pos}	{token.Position}	*FileSet	1222
1791	token	Read	{"func(interface{}) error"}	{error}	*FileSet	1222
1792	token	Write	{"func(interface{}) error"}	{error}	*FileSet	1222
1793	token	String	{}	{string}	Token	1223
1794	token	Precedence	{}	{int}	Token	1223
1795	token	IsLiteral	{}	{bool}	Token	1223
1796	token	IsOperator	{}	{bool}	Token	1223
1799	types	Check	{string,*token.FileSet,[]*ast.File,*types.Info}	{*types.Package,error}	*Config	1228
1800	types	TypeOf	{ast.Expr}	{types.Type}	*Info	1229
1801	types	ObjectOf	{*ast.Ident}	{types.Object}	*Info	1229
1802	types	IsVoid	{}	{bool}	TypeAndValue	1230
1803	types	IsType	{}	{bool}	TypeAndValue	1230
1804	types	IsBuiltin	{}	{bool}	TypeAndValue	1230
1805	types	IsValue	{}	{bool}	TypeAndValue	1230
1806	types	IsNil	{}	{bool}	TypeAndValue	1230
1807	types	Addressable	{}	{bool}	TypeAndValue	1230
1808	types	Assignable	{}	{bool}	TypeAndValue	1230
1809	types	HasOk	{}	{bool}	TypeAndValue	1230
1810	types	String	{}	{string}	*Initializer	1231
1811	types	Files	{[]*ast.File}	{error}	*Checker	1232
1812	types	String	{}	{string}	*MethodSet	1233
1813	types	Len	{}	{int}	*MethodSet	1233
1814	types	At	{int}	{*types.Selection}	*MethodSet	1233
1815	types	Lookup	{*types.Package,string}	{*types.Selection}	*MethodSet	1233
1816	types	Imported	{}	{*types.Package}	*PkgName	1235
1817	types	String	{}	{string}	*PkgName	1235
1818	types	Val	{}	{constant.Value}	*Const	1236
1819	types	String	{}	{string}	*Const	1236
1820	types	IsAlias	{}	{bool}	*TypeName	1237
1821	types	String	{}	{string}	*TypeName	1237
1822	types	Anonymous	{}	{bool}	*Var	1238
1823	types	IsField	{}	{bool}	*Var	1238
1824	types	String	{}	{string}	*Var	1238
1825	types	String	{}	{string}	*Label	1240
1826	types	String	{}	{string}	*Builtin	1241
1827	types	String	{}	{string}	*Nil	1242
1828	types	Path	{}	{string}	*Package	1243
1829	types	Name	{}	{string}	*Package	1243
1830	types	SetName	{string}	{}	*Package	1243
1831	types	Scope	{}	{*types.Scope}	*Package	1243
1832	types	Complete	{}	{bool}	*Package	1243
1833	types	MarkComplete	{}	{}	*Package	1243
1834	types	Imports	{}	{[]*types.Package}	*Package	1243
1835	types	SetImports	{[]*types.Package}	{}	*Package	1243
1836	types	String	{}	{string}	*Package	1243
1837	types	Parent	{}	{*types.Scope}	*Scope	1244
1838	types	Len	{}	{int}	*Scope	1244
1839	types	Names	{}	{[]string}	*Scope	1244
1840	types	NumChildren	{}	{int}	*Scope	1244
1841	types	Child	{int}	{*types.Scope}	*Scope	1244
1842	types	Lookup	{string}	{types.Object}	*Scope	1244
1843	types	LookupParent	{string,token.Pos}	{*types.Scope,types.Object}	*Scope	1244
1844	types	Insert	{types.Object}	{types.Object}	*Scope	1244
1845	types	Pos	{}	{token.Pos}	*Scope	1244
1846	types	End	{}	{token.Pos}	*Scope	1244
1847	types	Contains	{token.Pos}	{bool}	*Scope	1244
1848	types	Innermost	{token.Pos}	{*types.Scope}	*Scope	1244
1849	types	WriteTo	{io.Writer,int,bool}	{}	*Scope	1244
1850	types	String	{}	{string}	*Scope	1244
1851	types	Kind	{}	{types.SelectionKind}	*Selection	1246
1852	types	Recv	{}	{types.Type}	*Selection	1246
1853	types	Obj	{}	{types.Object}	*Selection	1246
1854	types	Type	{}	{types.Type}	*Selection	1246
1855	types	Index	{}	{[]int}	*Selection	1246
1856	types	Indirect	{}	{bool}	*Selection	1246
1857	types	String	{}	{string}	*Selection	1246
1858	types	Alignof	{types.Type}	{int64}	*StdSizes	1248
1859	types	Offsetsof	{[]*types.Var}	{[]int64}	*StdSizes	1248
1860	types	Sizeof	{types.Type}	{int64}	*StdSizes	1248
1861	types	Kind	{}	{types.BasicKind}	*Basic	1252
1862	types	Info	{}	{types.BasicInfo}	*Basic	1252
1863	types	Name	{}	{string}	*Basic	1252
1864	types	Underlying	{}	{types.Type}	*Basic	1252
1865	types	String	{}	{string}	*Basic	1252
1866	types	Elem	{}	{types.Type}	*Pointer	1256
1867	types	Underlying	{}	{types.Type}	*Pointer	1256
1868	types	String	{}	{string}	*Pointer	1256
1869	types	Recv	{}	{*types.Var}	*Signature	1258
1870	types	Params	{}	{*types.Tuple}	*Signature	1258
1871	types	Results	{}	{*types.Tuple}	*Signature	1258
1872	types	Variadic	{}	{bool}	*Signature	1258
1873	types	Underlying	{}	{types.Type}	*Signature	1258
1874	types	String	{}	{string}	*Signature	1258
1875	types	Obj	{}	{*types.TypeName}	*Named	1263
1876	types	NumMethods	{}	{int}	*Named	1263
1877	types	Method	{int}	{*types.Func}	*Named	1263
1878	types	SetUnderlying	{types.Type}	{}	*Named	1263
1879	types	AddMethod	{*types.Func}	{}	*Named	1263
1880	types	Underlying	{}	{types.Type}	*Named	1263
1881	types	String	{}	{string}	*Named	1263
1882	template	Error	{}	{string}	*Error	1276
1883	template	Templates	{}	{[]*template.Template}	*Template	1278
1884	template	Option	{...string}	{*template.Template}	*Template	1278
1885	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	1278
1886	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	1278
1887	template	DefinedTemplates	{}	{string}	*Template	1278
1888	template	Parse	{string}	{*template.Template,error}	*Template	1278
1889	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	1278
1890	template	Clone	{}	{*template.Template,error}	*Template	1278
1891	template	New	{string}	{*template.Template}	*Template	1278
1892	template	Name	{}	{string}	*Template	1278
1893	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	1278
1894	template	Delims	{string,string}	{*template.Template}	*Template	1278
1895	template	Lookup	{string}	{*template.Template}	*Template	1278
1896	template	ParseFiles	{...string}	{*template.Template,error}	*Template	1278
1897	template	ParseGlob	{string}	{*template.Template,error}	*Template	1278
1898	template	ExecuteTemplate	{io.Writer,string,"interface{}"}	{error}	*Template	1278
1899	template	Execute	{io.Writer,"interface{}"}	{error}	*Template	1278
1900	template	DefinedTemplates	{}	{string}	*Template	1278
1901	template	ParseFiles	{...string}	{*template.Template,error}	*Template	1278
1902	template	ParseGlob	{string}	{*template.Template,error}	*Template	1278
1903	template	Option	{...string}	{*template.Template}	*Template	1278
1904	template	Name	{}	{string}	*Template	1278
1905	template	New	{string}	{*template.Template}	*Template	1278
1906	template	Clone	{}	{*template.Template,error}	*Template	1278
1907	template	AddParseTree	{string,*parse.Tree}	{*template.Template,error}	*Template	1278
1908	template	Templates	{}	{[]*template.Template}	*Template	1278
1909	template	Delims	{string,string}	{*template.Template}	*Template	1278
1910	template	Funcs	{template.FuncMap}	{*template.Template}	*Template	1278
1911	template	Lookup	{string}	{*template.Template}	*Template	1278
1912	template	Parse	{string}	{*template.Template,error}	*Template	1278
1913	color	RGBA	{}	{uint32}	RGBA	1281
1914	color	RGBA	{}	{uint32}	RGBA64	1282
1915	color	RGBA	{}	{uint32}	NRGBA	1283
1916	color	RGBA	{}	{uint32}	NRGBA64	1284
1917	color	RGBA	{}	{uint32}	Alpha	1285
1918	color	RGBA	{}	{uint32}	Alpha16	1286
1919	color	RGBA	{}	{uint32}	Gray	1287
1920	color	RGBA	{}	{uint32}	Gray16	1288
1921	color	Convert	{color.Color}	{color.Color}	Palette	1290
1922	color	Index	{color.Color}	{int}	Palette	1290
1923	color	RGBA	{}	{uint32,uint32,uint32,uint32}	YCbCr	1291
1924	color	RGBA	{}	{uint32,uint32,uint32,uint32}	NYCbCrA	1292
1925	color	RGBA	{}	{uint32,uint32,uint32,uint32}	CMYK	1293
1926	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}	Op	1296
1927	image	String	{}	{string}	Point	1298
1928	image	Add	{image.Point}	{image.Point}	Point	1298
1929	image	Sub	{image.Point}	{image.Point}	Point	1298
1930	image	Mul	{int}	{image.Point}	Point	1298
1931	image	Div	{int}	{image.Point}	Point	1298
1932	image	In	{image.Rectangle}	{bool}	Point	1298
1933	image	Mod	{image.Rectangle}	{image.Point}	Point	1298
1934	image	Eq	{image.Point}	{bool}	Point	1298
1935	image	String	{}	{string}	Rectangle	1299
1936	image	Dx	{}	{int}	Rectangle	1299
1937	image	Dy	{}	{int}	Rectangle	1299
1938	image	Size	{}	{image.Point}	Rectangle	1299
1939	image	Add	{image.Point}	{image.Rectangle}	Rectangle	1299
1940	image	Sub	{image.Point}	{image.Rectangle}	Rectangle	1299
1941	image	Inset	{int}	{image.Rectangle}	Rectangle	1299
1942	image	Intersect	{image.Rectangle}	{image.Rectangle}	Rectangle	1299
1943	image	Union	{image.Rectangle}	{image.Rectangle}	Rectangle	1299
1944	image	Empty	{}	{bool}	Rectangle	1299
1945	image	Eq	{image.Rectangle}	{bool}	Rectangle	1299
1946	image	Overlaps	{image.Rectangle}	{bool}	Rectangle	1299
1947	image	In	{image.Rectangle}	{bool}	Rectangle	1299
1948	image	Canon	{}	{image.Rectangle}	Rectangle	1299
1949	image	At	{int,int}	{color.Color}	Rectangle	1299
1950	image	Bounds	{}	{image.Rectangle}	Rectangle	1299
1951	image	ColorModel	{}	{color.Model}	Rectangle	1299
1952	image	ColorModel	{}	{color.Model}	*RGBA	1305
1953	image	Bounds	{}	{image.Rectangle}	*RGBA	1305
1954	image	At	{int,int}	{color.Color}	*RGBA	1305
1955	image	RGBAAt	{int,int}	{color.RGBA}	*RGBA	1305
1956	image	PixOffset	{int,int}	{int}	*RGBA	1305
1957	image	Set	{int,int,color.Color}	{}	*RGBA	1305
1958	image	SetRGBA	{int,int,color.RGBA}	{}	*RGBA	1305
1959	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA	1305
1960	image	Opaque	{}	{bool}	*RGBA	1305
1961	image	ColorModel	{}	{color.Model}	*RGBA64	1306
1962	image	Bounds	{}	{image.Rectangle}	*RGBA64	1306
1963	image	At	{int,int}	{color.Color}	*RGBA64	1306
1964	image	RGBA64At	{int,int}	{color.RGBA64}	*RGBA64	1306
1965	image	PixOffset	{int,int}	{int}	*RGBA64	1306
1966	image	Set	{int,int,color.Color}	{}	*RGBA64	1306
1967	image	SetRGBA64	{int,int,color.RGBA64}	{}	*RGBA64	1306
1968	image	SubImage	{image.Rectangle}	{image.Image}	*RGBA64	1306
1969	image	Opaque	{}	{bool}	*RGBA64	1306
1970	image	ColorModel	{}	{color.Model}	*NRGBA	1307
1971	image	Bounds	{}	{image.Rectangle}	*NRGBA	1307
1972	image	At	{int,int}	{color.Color}	*NRGBA	1307
1973	image	NRGBAAt	{int,int}	{color.NRGBA}	*NRGBA	1307
1974	image	PixOffset	{int,int}	{int}	*NRGBA	1307
1975	image	Set	{int,int,color.Color}	{}	*NRGBA	1307
1976	image	SetNRGBA	{int,int,color.NRGBA}	{}	*NRGBA	1307
1977	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA	1307
1978	image	Opaque	{}	{bool}	*NRGBA	1307
1979	image	ColorModel	{}	{color.Model}	*NRGBA64	1308
1980	image	Bounds	{}	{image.Rectangle}	*NRGBA64	1308
1981	image	At	{int,int}	{color.Color}	*NRGBA64	1308
1982	image	NRGBA64At	{int,int}	{color.NRGBA64}	*NRGBA64	1308
1983	image	PixOffset	{int,int}	{int}	*NRGBA64	1308
1984	image	Set	{int,int,color.Color}	{}	*NRGBA64	1308
1985	image	SetNRGBA64	{int,int,color.NRGBA64}	{}	*NRGBA64	1308
1986	image	SubImage	{image.Rectangle}	{image.Image}	*NRGBA64	1308
1987	image	Opaque	{}	{bool}	*NRGBA64	1308
1988	image	ColorModel	{}	{color.Model}	*Alpha	1309
1989	image	Bounds	{}	{image.Rectangle}	*Alpha	1309
1990	image	At	{int,int}	{color.Color}	*Alpha	1309
1991	image	AlphaAt	{int,int}	{color.Alpha}	*Alpha	1309
1992	image	PixOffset	{int,int}	{int}	*Alpha	1309
1993	image	Set	{int,int,color.Color}	{}	*Alpha	1309
1994	image	SetAlpha	{int,int,color.Alpha}	{}	*Alpha	1309
1995	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha	1309
1996	image	Opaque	{}	{bool}	*Alpha	1309
1997	image	ColorModel	{}	{color.Model}	*Alpha16	1310
1998	image	Bounds	{}	{image.Rectangle}	*Alpha16	1310
1999	image	At	{int,int}	{color.Color}	*Alpha16	1310
2000	image	Alpha16At	{int,int}	{color.Alpha16}	*Alpha16	1310
2001	image	PixOffset	{int,int}	{int}	*Alpha16	1310
2002	image	Set	{int,int,color.Color}	{}	*Alpha16	1310
2003	image	SetAlpha16	{int,int,color.Alpha16}	{}	*Alpha16	1310
2004	image	SubImage	{image.Rectangle}	{image.Image}	*Alpha16	1310
2005	image	Opaque	{}	{bool}	*Alpha16	1310
2006	image	ColorModel	{}	{color.Model}	*Gray	1311
2007	image	Bounds	{}	{image.Rectangle}	*Gray	1311
2008	image	At	{int,int}	{color.Color}	*Gray	1311
2009	image	GrayAt	{int,int}	{color.Gray}	*Gray	1311
2010	image	PixOffset	{int,int}	{int}	*Gray	1311
2011	image	Set	{int,int,color.Color}	{}	*Gray	1311
2012	image	SetGray	{int,int,color.Gray}	{}	*Gray	1311
2013	image	SubImage	{image.Rectangle}	{image.Image}	*Gray	1311
2014	image	Opaque	{}	{bool}	*Gray	1311
2015	image	ColorModel	{}	{color.Model}	*Gray16	1312
2016	image	Bounds	{}	{image.Rectangle}	*Gray16	1312
2017	image	At	{int,int}	{color.Color}	*Gray16	1312
2018	image	Gray16At	{int,int}	{color.Gray16}	*Gray16	1312
2019	image	PixOffset	{int,int}	{int}	*Gray16	1312
2020	image	Set	{int,int,color.Color}	{}	*Gray16	1312
2021	image	SetGray16	{int,int,color.Gray16}	{}	*Gray16	1312
2022	image	SubImage	{image.Rectangle}	{image.Image}	*Gray16	1312
2023	image	Opaque	{}	{bool}	*Gray16	1312
2024	image	ColorModel	{}	{color.Model}	*CMYK	1313
2025	image	Bounds	{}	{image.Rectangle}	*CMYK	1313
2026	image	At	{int,int}	{color.Color}	*CMYK	1313
2027	image	CMYKAt	{int,int}	{color.CMYK}	*CMYK	1313
2028	image	PixOffset	{int,int}	{int}	*CMYK	1313
2029	image	Set	{int,int,color.Color}	{}	*CMYK	1313
2030	image	SetCMYK	{int,int,color.CMYK}	{}	*CMYK	1313
2031	image	SubImage	{image.Rectangle}	{image.Image}	*CMYK	1313
2032	image	Opaque	{}	{bool}	*CMYK	1313
2033	image	ColorModel	{}	{color.Model}	*Paletted	1314
2034	image	Bounds	{}	{image.Rectangle}	*Paletted	1314
2035	image	At	{int,int}	{color.Color}	*Paletted	1314
2036	image	PixOffset	{int,int}	{int}	*Paletted	1314
2037	image	Set	{int,int,color.Color}	{}	*Paletted	1314
2038	image	ColorIndexAt	{int,int}	{uint8}	*Paletted	1314
2039	image	SetColorIndex	{int,int,uint8}	{}	*Paletted	1314
2040	image	SubImage	{image.Rectangle}	{image.Image}	*Paletted	1314
2041	image	Opaque	{}	{bool}	*Paletted	1314
2042	jpeg	Error	{}	{string}	FormatError	1315
2043	jpeg	Error	{}	{string}	UnsupportedError	1316
2044	image	RGBA	{}	{uint32}	*Uniform	1319
2045	image	ColorModel	{}	{color.Model}	*Uniform	1319
2046	image	Convert	{color.Color}	{color.Color}	*Uniform	1319
2047	image	Bounds	{}	{image.Rectangle}	*Uniform	1319
2048	image	At	{int,int}	{color.Color}	*Uniform	1319
2049	image	Opaque	{}	{bool}	*Uniform	1319
2050	png	Error	{}	{string}	FormatError	1320
2051	png	Error	{}	{string}	UnsupportedError	1321
2052	png	Encode	{io.Writer,image.Image}	{error}	*Encoder	1322
2053	image	String	{}	{string}	YCbCrSubsampleRatio	1326
2054	image	ColorModel	{}	{color.Model}	*YCbCr	1327
2055	image	Bounds	{}	{image.Rectangle}	*YCbCr	1327
2056	image	At	{int,int}	{color.Color}	*YCbCr	1327
2057	image	YCbCrAt	{int,int}	{color.YCbCr}	*YCbCr	1327
2058	image	YOffset	{int,int}	{int}	*YCbCr	1327
2059	image	COffset	{int,int}	{int}	*YCbCr	1327
2060	image	SubImage	{image.Rectangle}	{image.Image}	*YCbCr	1327
2061	image	Opaque	{}	{bool}	*YCbCr	1327
2062	image	ColorModel	{}	{color.Model}	*NYCbCrA	1328
2063	image	At	{int,int}	{color.Color}	*NYCbCrA	1328
2064	image	NYCbCrAAt	{int,int}	{color.NYCbCrA}	*NYCbCrA	1328
2065	image	AOffset	{int,int}	{int}	*NYCbCrA	1328
2066	image	SubImage	{image.Rectangle}	{image.Image}	*NYCbCrA	1328
2067	image	Opaque	{}	{bool}	*NYCbCrA	1328
2068	suffixarray	Read	{io.Reader}	{error}	*Index	1329
2069	suffixarray	Write	{io.Writer}	{error}	*Index	1329
2070	suffixarray	Bytes	{}	{[]byte}	*Index	1329
2071	suffixarray	Lookup	{[]byte,int}	{[]int}	*Index	1329
2072	suffixarray	FindAllIndex	{*regexp.Regexp,int}	{[][]int}	*Index	1329
2073	poll	Error	{}	{string}	*TimeoutError	1333
2074	poll	Timeout	{}	{bool}	*TimeoutError	1333
2075	poll	Temporary	{}	{bool}	*TimeoutError	1333
2076	poll	Close	{}	{error}	*FD	1334
2077	poll	Read	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	1334
2078	poll	Write	{"func([]byte) (int, error)",[]byte}	{int,error}	*FD	1334
2079	poll	SetDeadline	{time.Time}	{error}	*FD	1334
2080	poll	SetReadDeadline	{time.Time}	{error}	*FD	1334
2081	poll	SetWriteDeadline	{time.Time}	{error}	*FD	1334
2082	poll	ReadLock	{}	{error}	*FD	1334
2083	poll	ReadUnlock	{}	{}	*FD	1334
2084	poll	RawControl	{func(uintptr)}	{error}	*FD	1334
2085	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	1334
2086	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	1334
2087	poll	SetDeadline	{time.Time}	{error}	*FD	1334
2088	poll	SetReadDeadline	{time.Time}	{error}	*FD	1334
2089	poll	SetWriteDeadline	{time.Time}	{error}	*FD	1334
2090	poll	SetDeadline	{time.Time}	{error}	*FD	1334
2091	poll	SetReadDeadline	{time.Time}	{error}	*FD	1334
2092	poll	SetWriteDeadline	{time.Time}	{error}	*FD	1334
2093	poll	Fchmod	{uint32}	{error}	*FD	1334
2094	poll	Fchown	{int,int}	{error}	*FD	1334
2095	poll	Ftruncate	{int64}	{error}	*FD	1334
2096	poll	Fsync	{}	{error}	*FD	1334
2097	poll	Init	{string,bool}	{error}	*FD	1334
2098	poll	Close	{}	{error}	*FD	1334
2099	poll	Shutdown	{int}	{error}	*FD	1334
2100	poll	Read	{[]byte}	{int,error}	*FD	1334
2101	poll	Pread	{[]byte,int64}	{int,error}	*FD	1334
2102	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	1334
2103	poll	ReadMsg	{[]byte,[]byte}	{int,int,int,syscall.Sockaddr,error}	*FD	1334
2104	poll	Write	{[]byte}	{int,error}	*FD	1334
2105	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	1334
2106	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	1334
2107	poll	WriteMsg	{[]byte,[]byte,syscall.Sockaddr}	{int,int,error}	*FD	1334
2108	poll	Accept	{}	{int,syscall.Sockaddr,string,error}	*FD	1334
2109	poll	Seek	{int64,int}	{int64,error}	*FD	1334
2110	poll	ReadDirent	{[]byte}	{int,error}	*FD	1334
2111	poll	Fchdir	{}	{error}	*FD	1334
2112	poll	Fstat	{*syscall.Stat_t}	{error}	*FD	1334
2113	poll	WaitWrite	{}	{error}	*FD	1334
2114	poll	RawControl	{func(uintptr)}	{error}	*FD	1334
2115	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	1334
2116	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	1334
2117	poll	Init	{string,bool}	{string,error}	*FD	1334
2118	poll	Close	{}	{error}	*FD	1334
2119	poll	Shutdown	{int}	{error}	*FD	1334
2120	poll	Read	{[]byte}	{int,error}	*FD	1334
2121	poll	Pread	{[]byte,int64}	{int,error}	*FD	1334
2122	poll	ReadFrom	{[]byte}	{int,syscall.Sockaddr,error}	*FD	1334
2123	poll	Write	{[]byte}	{int,error}	*FD	1334
2124	poll	Pwrite	{[]byte,int64}	{int,error}	*FD	1334
2125	poll	Writev	{*[][]byte}	{int64,error}	*FD	1334
2126	poll	WriteTo	{[]byte,syscall.Sockaddr}	{int,error}	*FD	1334
2127	poll	ConnectEx	{syscall.Sockaddr}	{error}	*FD	1334
2128	poll	Accept	{"func() (syscall.Handle, error)"}	{syscall.Handle,[]syscall.RawSockaddrAny,uint32,string,error}	*FD	1334
2129	poll	Seek	{int64,int}	{int64,error}	*FD	1334
2130	poll	FindNextFile	{*syscall.Win32finddata}	{error}	*FD	1334
2131	poll	Fchdir	{}	{error}	*FD	1334
2132	poll	GetFileType	{}	{uint32,error}	*FD	1334
2133	poll	GetFileInformationByHandle	{*syscall.ByHandleFileInformation}	{error}	*FD	1334
2134	poll	RawControl	{func(uintptr)}	{error}	*FD	1334
2135	poll	RawRead	{"func(uintptr) bool"}	{error}	*FD	1334
2136	poll	RawWrite	{"func(uintptr) bool"}	{error}	*FD	1334
2137	poll	SetsockoptInt	{int,int,int}	{error}	*FD	1334
2138	poll	SetsockoptInet4Addr	{int,int,[]byte}	{error}	*FD	1334
2139	poll	SetsockoptLinger	{int,int,*syscall.Linger}	{error}	*FD	1334
2140	poll	SetsockoptIPMreqn	{int,int,*syscall.IPMreqn}	{error}	*FD	1334
2141	poll	SetsockoptByte	{int,int,byte}	{error}	*FD	1334
2142	poll	Setsockopt	{int32,int32,*byte,int32}	{error}	*FD	1334
2143	poll	WSAIoctl	{uint32,*byte,uint32,*byte,uint32,*uint32,*syscall.Overlapped,uintptr}	{error}	*FD	1334
2144	poll	SetsockoptIPMreq	{int,int,*syscall.IPMreq}	{error}	*FD	1334
2145	poll	SetsockoptIPv6Mreq	{int,int,*syscall.IPv6Mreq}	{error}	*FD	1334
2146	poll	Writev	{*[][]byte}	{int64,error}	*FD	1334
2147	singleflight	Do	{string,"func() (interface{}, error)"}	{"interface{}",error,bool}	*Group	1337
2148	singleflight	DoChan	{string,"func() (interface{}, error)"}	{"chan singleflight.Result\n"}	*Group	1337
2149	singleflight	Forget	{string}	{}	*Group	1337
2150	registry	Close	{}	{error}	Key	1340
2151	registry	ReadSubKeyNames	{int}	{[]string,error}	Key	1340
2152	registry	Stat	{}	{*registry.KeyInfo,error}	Key	1340
2153	registry	GetValue	{string,[]byte}	{int,uint32,error}	Key	1340
2154	registry	GetStringValue	{string}	{string,uint32,error}	Key	1340
2155	registry	GetMUIStringValue	{string}	{string,error}	Key	1340
2156	registry	GetStringsValue	{string}	{[]string,uint32,error}	Key	1340
2157	registry	GetIntegerValue	{string}	{uint64,uint32,error}	Key	1340
2158	registry	GetBinaryValue	{string}	{[]byte,uint32,error}	Key	1340
2159	registry	SetDWordValue	{string,uint32}	{error}	Key	1340
2160	registry	SetQWordValue	{string,uint64}	{error}	Key	1340
2161	registry	SetStringValue	{string,string}	{error}	Key	1340
2162	registry	SetExpandStringValue	{string,string}	{error}	Key	1340
2163	registry	SetStringsValue	{string,[]string}	{error}	Key	1340
2164	registry	SetBinaryValue	{string,[]byte}	{error}	Key	1340
2165	registry	DeleteValue	{string}	{error}	Key	1340
2166	registry	ReadValueNames	{int}	{[]string,error}	Key	1340
2167	trace	Emit	{byte,...uint64}	{}	*Writer	1360
2168	io	Read	{[]byte}	{int,error}	*LimitedReader	1381
2169	io	Read	{[]byte}	{int,error}	*SectionReader	1382
2170	io	Seek	{int64,int}	{int64,error}	*SectionReader	1382
2171	io	ReadAt	{[]byte,int64}	{int,error}	*SectionReader	1382
2172	io	Size	{}	{int64}	*SectionReader	1382
2173	io	Read	{[]byte}	{int,error}	*PipeReader	1383
2174	io	Close	{}	{error}	*PipeReader	1383
2175	io	CloseWithError	{error}	{error}	*PipeReader	1383
2176	io	Write	{[]byte}	{int,error}	*PipeWriter	1384
2177	io	Close	{}	{error}	*PipeWriter	1384
2178	io	CloseWithError	{error}	{error}	*PipeWriter	1384
2179	log	SetOutput	{io.Writer}	{}	*Logger	1385
2180	log	Output	{int,string}	{error}	*Logger	1385
2181	log	Printf	{string,"...interface{}"}	{}	*Logger	1385
2182	log	Print	{"...interface{}"}	{}	*Logger	1385
2183	log	Println	{"...interface{}"}	{}	*Logger	1385
2184	log	Fatal	{"...interface{}"}	{}	*Logger	1385
2185	log	Fatalf	{string,"...interface{}"}	{}	*Logger	1385
2186	log	Fatalln	{"...interface{}"}	{}	*Logger	1385
2187	log	Panic	{"...interface{}"}	{}	*Logger	1385
2188	log	Panicf	{string,"...interface{}"}	{}	*Logger	1385
2189	log	Panicln	{"...interface{}"}	{}	*Logger	1385
2190	log	Flags	{}	{int}	*Logger	1385
2191	log	SetFlags	{int}	{}	*Logger	1385
2192	log	Prefix	{}	{string}	*Logger	1385
2193	log	SetPrefix	{string}	{}	*Logger	1385
2194	syslog	Write	{[]byte}	{int,error}	*Writer	1387
2195	syslog	Close	{}	{error}	*Writer	1387
2196	syslog	Emerg	{string}	{error}	*Writer	1387
2197	syslog	Alert	{string}	{error}	*Writer	1387
2198	syslog	Crit	{string}	{error}	*Writer	1387
2199	syslog	Err	{string}	{error}	*Writer	1387
2200	syslog	Warning	{string}	{error}	*Writer	1387
2201	syslog	Notice	{string}	{error}	*Writer	1387
2202	syslog	Info	{string}	{error}	*Writer	1387
2203	syslog	Debug	{string}	{error}	*Writer	1387
2204	big	SetPrec	{uint}	{*big.Float}	*Float	1389
2205	big	SetMode	{big.RoundingMode}	{*big.Float}	*Float	1389
2206	big	Prec	{}	{uint}	*Float	1389
2207	big	MinPrec	{}	{uint}	*Float	1389
2208	big	Mode	{}	{big.RoundingMode}	*Float	1389
2209	big	Acc	{}	{big.Accuracy}	*Float	1389
2210	big	Sign	{}	{int}	*Float	1389
2211	big	MantExp	{*big.Float}	{int}	*Float	1389
2212	big	SetMantExp	{*big.Float,int}	{*big.Float}	*Float	1389
2213	big	Signbit	{}	{bool}	*Float	1389
2214	big	IsInf	{}	{bool}	*Float	1389
2215	big	IsInt	{}	{bool}	*Float	1389
2216	big	SetUint64	{uint64}	{*big.Float}	*Float	1389
2217	big	SetInt64	{int64}	{*big.Float}	*Float	1389
2218	big	SetFloat64	{float64}	{*big.Float}	*Float	1389
2219	big	SetInt	{*big.Int}	{*big.Float}	*Float	1389
2220	big	SetRat	{*big.Rat}	{*big.Float}	*Float	1389
2221	big	SetInf	{bool}	{*big.Float}	*Float	1389
2222	big	Set	{*big.Float}	{*big.Float}	*Float	1389
2223	big	Copy	{*big.Float}	{*big.Float}	*Float	1389
2224	big	Uint64	{}	{uint64,big.Accuracy}	*Float	1389
2225	big	Int64	{}	{int64,big.Accuracy}	*Float	1389
2226	big	Float32	{}	{float32,big.Accuracy}	*Float	1389
2227	big	Float64	{}	{float64,big.Accuracy}	*Float	1389
2228	big	Int	{*big.Int}	{*big.Int,big.Accuracy}	*Float	1389
2229	big	Rat	{*big.Rat}	{*big.Rat,big.Accuracy}	*Float	1389
2230	big	Abs	{*big.Float}	{*big.Float}	*Float	1389
2231	big	Neg	{*big.Float}	{*big.Float}	*Float	1389
2232	big	Add	{*big.Float,*big.Float}	{*big.Float}	*Float	1389
2233	big	Sub	{*big.Float,*big.Float}	{*big.Float}	*Float	1389
2234	big	Mul	{*big.Float,*big.Float}	{*big.Float}	*Float	1389
2235	big	Quo	{*big.Float,*big.Float}	{*big.Float}	*Float	1389
2236	big	Cmp	{*big.Float}	{int}	*Float	1389
2237	big	SetString	{string}	{*big.Float,bool}	*Float	1389
2238	big	Parse	{string,int}	{*big.Float,int,error}	*Float	1389
2239	big	Scan	{fmt.ScanState,rune}	{error}	*Float	1389
2240	big	GobEncode	{}	{[]byte,error}	*Float	1389
2241	big	GobDecode	{[]byte}	{error}	*Float	1389
2242	big	MarshalText	{}	{[]byte,error}	*Float	1389
2243	big	UnmarshalText	{[]byte}	{error}	*Float	1389
2244	big	Text	{byte,int}	{string}	*Float	1389
2245	big	String	{}	{string}	*Float	1389
2246	big	Append	{[]byte,byte,int}	{[]byte}	*Float	1389
2247	big	Format	{fmt.State,rune}	{}	*Float	1389
2248	big	Error	{}	{string}	ErrNaN	1390
2249	big	String	{}	{string}	RoundingMode	1391
2250	big	String	{}	{string}	Accuracy	1392
2251	big	Sign	{}	{int}	*Int	1393
2252	big	SetInt64	{int64}	{*big.Int}	*Int	1393
2253	big	SetUint64	{uint64}	{*big.Int}	*Int	1393
2254	big	Set	{*big.Int}	{*big.Int}	*Int	1393
2255	big	Bits	{}	{[]big.Word}	*Int	1393
2256	big	SetBits	{[]big.Word}	{*big.Int}	*Int	1393
2257	big	Abs	{*big.Int}	{*big.Int}	*Int	1393
2258	big	Neg	{*big.Int}	{*big.Int}	*Int	1393
2259	big	Add	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2260	big	Sub	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2261	big	Mul	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2262	big	MulRange	{int64,int64}	{*big.Int}	*Int	1393
2263	big	Binomial	{int64,int64}	{*big.Int}	*Int	1393
2264	big	Quo	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2265	big	Rem	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2266	big	QuoRem	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	1393
2267	big	Div	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2268	big	Mod	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2269	big	DivMod	{*big.Int,*big.Int,*big.Int}	{*big.Int,*big.Int}	*Int	1393
2270	big	Cmp	{*big.Int}	{int}	*Int	1393
2271	big	Int64	{}	{int64}	*Int	1393
2272	big	Uint64	{}	{uint64}	*Int	1393
2273	big	IsInt64	{}	{bool}	*Int	1393
2274	big	IsUint64	{}	{bool}	*Int	1393
2275	big	SetString	{string,int}	{*big.Int,bool}	*Int	1393
2276	big	SetBytes	{[]byte}	{*big.Int}	*Int	1393
2277	big	Bytes	{}	{[]byte}	*Int	1393
2278	big	BitLen	{}	{int}	*Int	1393
2279	big	Exp	{*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	1393
2280	big	GCD	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}	*Int	1393
2281	big	Rand	{*rand.Rand,*big.Int}	{*big.Int}	*Int	1393
2282	big	ModInverse	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2283	big	ModSqrt	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2284	big	Lsh	{*big.Int,uint}	{*big.Int}	*Int	1393
2285	big	Rsh	{*big.Int,uint}	{*big.Int}	*Int	1393
2286	big	Bit	{int}	{uint}	*Int	1393
2287	big	SetBit	{*big.Int,int,uint}	{*big.Int}	*Int	1393
2288	big	And	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2289	big	AndNot	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2290	big	Or	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2291	big	Xor	{*big.Int,*big.Int}	{*big.Int}	*Int	1393
2292	big	Not	{*big.Int}	{*big.Int}	*Int	1393
2293	big	Sqrt	{*big.Int}	{*big.Int}	*Int	1393
2294	big	Text	{int}	{string}	*Int	1393
2295	big	Append	{[]byte,int}	{[]byte}	*Int	1393
2296	big	String	{}	{string}	*Int	1393
2297	big	Format	{fmt.State,rune}	{}	*Int	1393
2298	big	Scan	{fmt.ScanState,rune}	{error}	*Int	1393
2299	big	GobEncode	{}	{[]byte,error}	*Int	1393
2300	big	GobDecode	{[]byte}	{error}	*Int	1393
2301	big	MarshalText	{}	{[]byte,error}	*Int	1393
2302	big	UnmarshalText	{[]byte}	{error}	*Int	1393
2303	big	MarshalJSON	{}	{[]byte,error}	*Int	1393
2304	big	UnmarshalJSON	{[]byte}	{error}	*Int	1393
2305	big	ProbablyPrime	{int}	{bool}	*Int	1393
2306	big	SetFloat64	{float64}	{*big.Rat}	*Rat	1394
2307	big	Float32	{}	{float32,bool}	*Rat	1394
2308	big	Float64	{}	{float64,bool}	*Rat	1394
2309	big	SetFrac	{*big.Int,*big.Int}	{*big.Rat}	*Rat	1394
2310	big	SetFrac64	{int64,int64}	{*big.Rat}	*Rat	1394
2311	big	SetInt	{*big.Int}	{*big.Rat}	*Rat	1394
2312	big	SetInt64	{int64}	{*big.Rat}	*Rat	1394
2313	big	Set	{*big.Rat}	{*big.Rat}	*Rat	1394
2314	big	Abs	{*big.Rat}	{*big.Rat}	*Rat	1394
2315	big	Neg	{*big.Rat}	{*big.Rat}	*Rat	1394
2316	big	Inv	{*big.Rat}	{*big.Rat}	*Rat	1394
2317	big	Sign	{}	{int}	*Rat	1394
2318	big	IsInt	{}	{bool}	*Rat	1394
2319	big	Num	{}	{*big.Int}	*Rat	1394
2320	big	Denom	{}	{*big.Int}	*Rat	1394
2321	big	Cmp	{*big.Rat}	{int}	*Rat	1394
2322	big	Add	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	1394
2323	big	Sub	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	1394
2324	big	Mul	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	1394
2325	big	Quo	{*big.Rat,*big.Rat}	{*big.Rat}	*Rat	1394
2326	big	Scan	{fmt.ScanState,rune}	{error}	*Rat	1394
2327	big	SetString	{string}	{*big.Rat,bool}	*Rat	1394
2328	big	String	{}	{string}	*Rat	1394
2329	big	RatString	{}	{string}	*Rat	1394
2330	big	FloatString	{int}	{string}	*Rat	1394
2331	big	GobEncode	{}	{[]byte,error}	*Rat	1394
2332	big	GobDecode	{[]byte}	{error}	*Rat	1394
2333	big	MarshalText	{}	{[]byte,error}	*Rat	1394
2334	big	UnmarshalText	{[]byte}	{error}	*Rat	1394
2335	rand	ExpFloat64	{}	{float64}	*Rand	1397
2336	rand	NormFloat64	{}	{float64}	*Rand	1397
2337	rand	Seed	{int64}	{}	*Rand	1397
2338	rand	Int63	{}	{int64}	*Rand	1397
2339	rand	Uint32	{}	{uint32}	*Rand	1397
2340	rand	Uint64	{}	{uint64}	*Rand	1397
2341	rand	Int31	{}	{int32}	*Rand	1397
2342	rand	Int	{}	{int}	*Rand	1397
2343	rand	Int63n	{int64}	{int64}	*Rand	1397
2344	rand	Int31n	{int32}	{int32}	*Rand	1397
2345	rand	Intn	{int}	{int}	*Rand	1397
2346	rand	Float64	{}	{float64}	*Rand	1397
2347	rand	Float32	{}	{float32}	*Rand	1397
2348	rand	Perm	{int}	{[]int}	*Rand	1397
2349	rand	Read	{[]byte}	{int,error}	*Rand	1397
2350	rand	Uint64	{}	{uint64}	*Zipf	1398
2351	mime	Encode	{string,string}	{string}	WordEncoder	1399
2352	mime	Decode	{string}	{string,error}	*WordDecoder	1400
2353	mime	DecodeHeader	{string}	{string,error}	*WordDecoder	1400
2354	multipart	RemoveAll	{}	{error}	*Form	1401
2355	multipart	Open	{}	{multipart.File,error}	*FileHeader	1402
2356	multipart	FormName	{}	{string}	*Part	1404
2357	multipart	FileName	{}	{string}	*Part	1404
2358	multipart	Read	{[]byte}	{int,error}	*Part	1404
2359	multipart	Close	{}	{error}	*Part	1404
2360	multipart	ReadForm	{int64}	{*multipart.Form,error}	*Reader	1405
2361	multipart	NextPart	{}	{*multipart.Part,error}	*Reader	1405
2362	multipart	Boundary	{}	{string}	*Writer	1406
2363	multipart	SetBoundary	{string}	{error}	*Writer	1406
2364	multipart	FormDataContentType	{}	{string}	*Writer	1406
2365	multipart	CreatePart	{textproto.MIMEHeader}	{io.Writer,error}	*Writer	1406
2366	multipart	CreateFormFile	{string,string}	{io.Writer,error}	*Writer	1406
2367	multipart	CreateFormField	{string}	{io.Writer,error}	*Writer	1406
2368	multipart	WriteField	{string,string}	{error}	*Writer	1406
2369	multipart	Close	{}	{error}	*Writer	1406
2370	quotedprintable	Read	{[]byte}	{int,error}	*Reader	1407
2371	quotedprintable	Write	{[]byte}	{int,error}	*Writer	1408
2372	quotedprintable	Close	{}	{error}	*Writer	1408
2373	net	Dial	{string,string}	{net.Conn,error}	*Dialer	1409
2374	net	DialContext	{context.Context,string,string}	{net.Conn,error}	*Dialer	1409
2375	cgi	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Handler	1413
2376	http	Get	{string}	{*http.Response,error}	*Client	1414
2377	http	Do	{*http.Request}	{*http.Response,error}	*Client	1414
2378	http	Post	{string,string,io.Reader}	{*http.Response,error}	*Client	1414
2379	http	PostForm	{string,url.Values}	{*http.Response,error}	*Client	1414
2380	http	Head	{string}	{*http.Response,error}	*Client	1414
2381	http	String	{}	{string}	*Cookie	1416
2382	cookiejar	Cookies	{*url.URL}	{[]*http.Cookie}	*Jar	1419
2383	cookiejar	SetCookies	{*url.URL,[]*http.Cookie}	{}	*Jar	1419
2384	http	Open	{string}	{http.File,error}	Dir	1420
2385	http	Add	{string,string}	{}	Header	1424
2386	http	Set	{string,string}	{}	Header	1424
2387	http	Get	{string}	{string}	Header	1424
2388	http	Del	{string}	{}	Header	1424
2389	http	Write	{io.Writer}	{error}	Header	1424
2390	http	WriteSubset	{io.Writer,map[string]bool}	{error}	Header	1424
2391	httptest	Header	{}	{http.Header}	*ResponseRecorder	1427
2392	httptest	Write	{[]byte}	{int,error}	*ResponseRecorder	1427
2393	httptest	WriteString	{string}	{int,error}	*ResponseRecorder	1427
2394	httptest	WriteHeader	{int}	{}	*ResponseRecorder	1427
2395	httptest	Flush	{}	{}	*ResponseRecorder	1427
2396	httptest	Result	{}	{*http.Response}	*ResponseRecorder	1427
2397	httptest	Start	{}	{}	*Server	1428
2398	httptest	StartTLS	{}	{}	*Server	1428
2399	httptest	Close	{}	{}	*Server	1428
2400	httptest	CloseClientConnections	{}	{}	*Server	1428
2401	httptest	Certificate	{}	{*x509.Certificate}	*Server	1428
2402	httptest	Client	{}	{*http.Client}	*Server	1428
2403	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ServerConn	1434
2404	httputil	Close	{}	{error}	*ServerConn	1434
2405	httputil	Read	{}	{*http.Request,error}	*ServerConn	1434
2406	httputil	Pending	{}	{int}	*ServerConn	1434
2407	httputil	Write	{*http.Request,*http.Response}	{error}	*ServerConn	1434
2408	httputil	Hijack	{}	{net.Conn,*bufio.Reader}	*ClientConn	1435
2409	httputil	Close	{}	{error}	*ClientConn	1435
2410	httputil	Write	{*http.Request}	{error}	*ClientConn	1435
2411	httputil	Pending	{}	{int}	*ClientConn	1435
2412	httputil	Read	{*http.Request}	{*http.Response,error}	*ClientConn	1435
2413	httputil	Do	{*http.Request}	{*http.Response,error}	*ClientConn	1435
2414	httputil	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ReverseProxy	1436
2415	http	Error	{}	{string}	*ProtocolError	1440
2416	http	Context	{}	{context.Context}	*Request	1441
2417	http	WithContext	{context.Context}	{*http.Request}	*Request	1441
2418	http	ProtoAtLeast	{int,int}	{bool}	*Request	1441
2419	http	UserAgent	{}	{string}	*Request	1441
2420	http	Cookies	{}	{[]*http.Cookie}	*Request	1441
2421	http	Cookie	{string}	{*http.Cookie,error}	*Request	1441
2422	http	AddCookie	{*http.Cookie}	{}	*Request	1441
2423	http	Referer	{}	{string}	*Request	1441
2424	http	MultipartReader	{}	{*multipart.Reader,error}	*Request	1441
2425	http	Write	{io.Writer}	{error}	*Request	1441
2426	http	WriteProxy	{io.Writer}	{error}	*Request	1441
2427	http	BasicAuth	{}	{string,bool}	*Request	1441
2428	http	SetBasicAuth	{string,string}	{}	*Request	1441
2429	http	ParseForm	{}	{error}	*Request	1441
2430	http	ParseMultipartForm	{int64}	{error}	*Request	1441
2431	http	FormValue	{string}	{string}	*Request	1441
2432	http	PostFormValue	{string}	{string}	*Request	1441
2433	http	FormFile	{string}	{multipart.File,*multipart.FileHeader,error}	*Request	1441
2434	http	Cookies	{}	{[]*http.Cookie}	*Response	1442
2435	http	Location	{}	{*url.URL,error}	*Response	1442
2436	http	ProtoAtLeast	{int,int}	{bool}	*Response	1442
2437	http	Write	{io.Writer}	{error}	*Response	1442
2438	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	HandlerFunc	1448
2439	http	Handler	{*http.Request}	{http.Handler,string}	*ServeMux	1449
2440	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*ServeMux	1449
2441	http	Handle	{string,http.Handler}	{}	*ServeMux	1449
2442	http	HandleFunc	{string,"func(http.ResponseWriter, *http.Request)"}	{}	*ServeMux	1449
2443	http	Close	{}	{error}	*Server	1450
2444	http	Shutdown	{context.Context}	{error}	*Server	1450
2445	http	RegisterOnShutdown	{func()}	{}	*Server	1450
2446	http	ListenAndServe	{}	{error}	*Server	1450
2447	http	Serve	{net.Listener}	{error}	*Server	1450
2448	http	ServeTLS	{net.Listener,string,string}	{error}	*Server	1450
2449	http	SetKeepAlivesEnabled	{bool}	{}	*Server	1450
2450	http	ListenAndServeTLS	{string,string}	{error}	*Server	1450
2451	http	String	{}	{string}	ConnState	1451
2452	http	RoundTrip	{*http.Request}	{*http.Response,error}	*Transport	1452
2453	http	RegisterProtocol	{string,http.RoundTripper}	{}	*Transport	1452
2454	http	CloseIdleConnections	{}	{}	*Transport	1452
2455	http	CancelRequest	{*http.Request}	{}	*Transport	1452
2456	main	String	{}	{string}	*Counter	1453
2457	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Counter	1453
2458	main	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	Chan	1454
2459	net	Addrs	{}	{[]net.Addr,error}	*Interface	1455
2460	net	MulticastAddrs	{}	{[]net.Addr,error}	*Interface	1455
2461	net	String	{}	{string}	Flags	1456
2462	socktest	Stats	{}	{[]socktest.Stat}	*Switch	1457
2463	socktest	Sockets	{}	{socktest.Sockets}	*Switch	1457
2464	socktest	Set	{socktest.FilterType,socktest.Filter}	{}	*Switch	1457
2465	socktest	Accept4	{int,int}	{int,syscall.Sockaddr,error}	*Switch	1457
2466	socktest	Socket	{int,int,int}	{int,error}	*Switch	1457
2467	socktest	Close	{int}	{error}	*Switch	1457
2468	socktest	Connect	{int,syscall.Sockaddr}	{error}	*Switch	1457
2469	socktest	Listen	{int,int}	{error}	*Switch	1457
2470	socktest	Accept	{int}	{int,syscall.Sockaddr,error}	*Switch	1457
2471	socktest	GetsockoptInt	{int,int,int}	{int,error}	*Switch	1457
2472	socktest	Socket	{int,int,int}	{syscall.Handle,error}	*Switch	1457
2473	socktest	Closesocket	{syscall.Handle}	{error}	*Switch	1457
2474	socktest	Connect	{syscall.Handle,syscall.Sockaddr}	{error}	*Switch	1457
2475	socktest	ConnectEx	{syscall.Handle,syscall.Sockaddr,*byte,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	1457
2476	socktest	Listen	{syscall.Handle,int}	{error}	*Switch	1457
2477	socktest	AcceptEx	{syscall.Handle,syscall.Handle,*byte,uint32,uint32,uint32,*uint32,*syscall.Overlapped}	{error}	*Switch	1457
2478	socktest	Family	{}	{int}	Cookie	1458
2479	socktest	Type	{}	{int}	Cookie	1458
2480	socktest	Protocol	{}	{int}	Cookie	1458
2481	socktest	String	{}	{string}	Status	1459
2482	socktest	String	{}	{string}	Stat	1460
2483	net	IsUnspecified	{}	{bool}	IP	1467
2484	net	IsLoopback	{}	{bool}	IP	1467
2485	net	IsMulticast	{}	{bool}	IP	1467
2486	net	IsInterfaceLocalMulticast	{}	{bool}	IP	1467
2487	net	IsLinkLocalMulticast	{}	{bool}	IP	1467
2488	net	IsLinkLocalUnicast	{}	{bool}	IP	1467
2489	net	IsGlobalUnicast	{}	{bool}	IP	1467
2490	net	To4	{}	{net.IP}	IP	1467
2491	net	To16	{}	{net.IP}	IP	1467
2492	net	DefaultMask	{}	{net.IPMask}	IP	1467
2493	net	Mask	{net.IPMask}	{net.IP}	IP	1467
2494	net	String	{}	{string}	IP	1467
2495	net	MarshalText	{}	{[]byte,error}	IP	1467
2496	net	UnmarshalText	{[]byte}	{error}	*IP	1467
2497	net	Equal	{net.IP}	{bool}	IP	1467
2498	net	Size	{}	{int}	IPMask	1468
2499	net	String	{}	{string}	IPMask	1468
2500	net	Contains	{net.IP}	{bool}	*IPNet	1469
2501	net	Network	{}	{string}	*IPNet	1469
2502	net	String	{}	{string}	*IPNet	1469
2503	net	Network	{}	{string}	*IPAddr	1470
2504	net	String	{}	{string}	*IPAddr	1470
2505	net	SyscallConn	{}	{syscall.RawConn,error}	*IPConn	1471
2506	net	ReadFromIP	{[]byte}	{int,*net.IPAddr,error}	*IPConn	1471
2507	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*IPConn	1471
2508	net	ReadMsgIP	{[]byte,[]byte}	{int,*net.IPAddr,error}	*IPConn	1471
2509	net	WriteToIP	{[]byte,*net.IPAddr}	{int,error}	*IPConn	1471
2510	net	WriteTo	{[]byte,net.Addr}	{int,error}	*IPConn	1471
2511	net	WriteMsgIP	{[]byte,[]byte,*net.IPAddr}	{int,error}	*IPConn	1471
2512	net	LookupHost	{context.Context,string}	{[]string,error}	*Resolver	1472
2513	net	LookupIPAddr	{context.Context,string}	{[]net.IPAddr,error}	*Resolver	1472
2514	net	LookupPort	{context.Context,string,string}	{int,error}	*Resolver	1472
2515	net	LookupCNAME	{context.Context,string}	{string,error}	*Resolver	1472
2516	net	LookupSRV	{context.Context,string,string,string}	{string,[]*net.SRV,error}	*Resolver	1472
2517	net	LookupMX	{context.Context,string}	{[]*net.MX,error}	*Resolver	1472
2518	net	LookupNS	{context.Context,string}	{[]*net.NS,error}	*Resolver	1472
2519	net	LookupTXT	{context.Context,string}	{[]string,error}	*Resolver	1472
2520	net	LookupAddr	{context.Context,string}	{[]string,error}	*Resolver	1472
2521	net	String	{}	{string}	HardwareAddr	1473
2522	mail	Get	{string}	{string}	Header	1475
2523	mail	Date	{}	{time.Time,error}	Header	1475
2524	mail	AddressList	{string}	{[]*mail.Address,error}	Header	1475
2525	mail	String	{}	{string}	*Address	1476
2526	mail	Parse	{string}	{*mail.Address,error}	*AddressParser	1477
2527	mail	ParseList	{string}	{[]*mail.Address,error}	*AddressParser	1477
2528	net	Error	{}	{string}	*OpError	1483
2529	net	Timeout	{}	{bool}	*OpError	1483
2530	net	Temporary	{}	{bool}	*OpError	1483
2531	net	Error	{}	{string}	*ParseError	1484
2532	net	Error	{}	{string}	*AddrError	1485
2533	net	Timeout	{}	{bool}	*AddrError	1485
2534	net	Temporary	{}	{bool}	*AddrError	1485
2535	net	Error	{}	{string}	UnknownNetworkError	1486
2536	net	Timeout	{}	{bool}	UnknownNetworkError	1486
2537	net	Temporary	{}	{bool}	UnknownNetworkError	1486
2538	net	Error	{}	{string}	InvalidAddrError	1487
2539	net	Timeout	{}	{bool}	InvalidAddrError	1487
2540	net	Temporary	{}	{bool}	InvalidAddrError	1487
2541	net	Error	{}	{string}	*DNSConfigError	1488
2542	net	Timeout	{}	{bool}	*DNSConfigError	1488
2543	net	Temporary	{}	{bool}	*DNSConfigError	1488
2544	net	Error	{}	{string}	*DNSError	1489
2545	net	Timeout	{}	{bool}	*DNSError	1489
2546	net	Temporary	{}	{bool}	*DNSError	1489
2547	net	WriteTo	{io.Writer}	{int64,error}	*Buffers	1490
2548	net	Read	{[]byte}	{int,error}	*Buffers	1490
2549	rpc	Error	{}	{string}	ServerError	1491
2550	rpc	Close	{}	{error}	*Client	1493
2551	rpc	Go	{string,"interface{}","interface{}","chan *rpc.Call\n"}	{*rpc.Call}	*Client	1493
2552	rpc	Call	{string,"interface{}","interface{}"}	{error}	*Client	1493
2553	rpc	Register	{"interface{}"}	{error}	*Server	1497
2554	rpc	RegisterName	{string,"interface{}"}	{error}	*Server	1497
2555	rpc	ServeConn	{io.ReadWriteCloser}	{}	*Server	1497
2556	rpc	ServeCodec	{rpc.ServerCodec}	{}	*Server	1497
2557	rpc	ServeRequest	{rpc.ServerCodec}	{error}	*Server	1497
2558	rpc	Accept	{net.Listener}	{}	*Server	1497
2559	rpc	ServeHTTP	{http.ResponseWriter,*http.Request}	{}	*Server	1497
2560	rpc	HandleHTTP	{string,string}	{}	*Server	1497
2561	smtp	Close	{}	{error}	*Client	1501
2562	smtp	Hello	{string}	{error}	*Client	1501
2563	smtp	StartTLS	{*tls.Config}	{error}	*Client	1501
2564	smtp	TLSConnectionState	{}	{tls.ConnectionState,bool}	*Client	1501
2565	smtp	Verify	{string}	{error}	*Client	1501
2566	smtp	Auth	{smtp.Auth}	{error}	*Client	1501
2567	smtp	Mail	{string}	{error}	*Client	1501
2568	smtp	Rcpt	{string}	{error}	*Client	1501
2569	smtp	Data	{}	{io.WriteCloser,error}	*Client	1501
2570	smtp	Extension	{string}	{bool,string}	*Client	1501
2571	smtp	Reset	{}	{error}	*Client	1501
2572	smtp	Quit	{}	{error}	*Client	1501
2573	net	Network	{}	{string}	*TCPAddr	1502
2574	net	String	{}	{string}	*TCPAddr	1502
2575	net	SyscallConn	{}	{syscall.RawConn,error}	*TCPConn	1503
2576	net	ReadFrom	{io.Reader}	{int64,error}	*TCPConn	1503
2577	net	CloseRead	{}	{error}	*TCPConn	1503
2578	net	CloseWrite	{}	{error}	*TCPConn	1503
2579	net	SetLinger	{int}	{error}	*TCPConn	1503
2580	net	SetKeepAlive	{bool}	{error}	*TCPConn	1503
2581	net	SetKeepAlivePeriod	{time.Duration}	{error}	*TCPConn	1503
2582	net	SetNoDelay	{bool}	{error}	*TCPConn	1503
2583	net	AcceptTCP	{}	{*net.TCPConn,error}	*TCPListener	1504
2584	net	Accept	{}	{net.Conn,error}	*TCPListener	1504
2585	net	Close	{}	{error}	*TCPListener	1504
2586	net	Addr	{}	{net.Addr}	*TCPListener	1504
2587	net	SetDeadline	{time.Time}	{error}	*TCPListener	1504
2588	net	File	{}	{*os.File,error}	*TCPListener	1504
2589	textproto	Add	{string,string}	{}	MIMEHeader	1505
2590	textproto	Set	{string,string}	{}	MIMEHeader	1505
2591	textproto	Get	{string}	{string}	MIMEHeader	1505
2592	textproto	Del	{string}	{}	MIMEHeader	1505
2593	textproto	Next	{}	{uint}	*Pipeline	1506
2594	textproto	StartRequest	{uint}	{}	*Pipeline	1506
2595	textproto	EndRequest	{uint}	{}	*Pipeline	1506
2596	textproto	StartResponse	{uint}	{}	*Pipeline	1506
2597	textproto	EndResponse	{uint}	{}	*Pipeline	1506
2598	textproto	ReadLine	{}	{string,error}	*Reader	1507
2599	textproto	ReadLineBytes	{}	{[]byte,error}	*Reader	1507
2600	textproto	ReadContinuedLine	{}	{string,error}	*Reader	1507
2601	textproto	ReadContinuedLineBytes	{}	{[]byte,error}	*Reader	1507
2602	textproto	ReadCodeLine	{int}	{int,string,error}	*Reader	1507
2603	textproto	ReadResponse	{int}	{int,string,error}	*Reader	1507
2604	textproto	DotReader	{}	{io.Reader}	*Reader	1507
2605	textproto	ReadDotBytes	{}	{[]byte,error}	*Reader	1507
2606	textproto	ReadDotLines	{}	{[]string,error}	*Reader	1507
2607	textproto	ReadMIMEHeader	{}	{textproto.MIMEHeader,error}	*Reader	1507
2608	textproto	Error	{}	{string}	*Error	1508
2609	textproto	Error	{}	{string}	ProtocolError	1509
2610	textproto	Close	{}	{error}	*Conn	1510
2611	textproto	Cmd	{string,"...interface{}"}	{uint,error}	*Conn	1510
2612	textproto	PrintfLine	{string,"...interface{}"}	{error}	*Writer	1511
2613	textproto	DotWriter	{}	{io.WriteCloser}	*Writer	1511
2614	net	Network	{}	{string}	*UDPAddr	1512
2615	net	String	{}	{string}	*UDPAddr	1512
2616	net	SyscallConn	{}	{syscall.RawConn,error}	*UDPConn	1513
2617	net	ReadFromUDP	{[]byte}	{int,*net.UDPAddr,error}	*UDPConn	1513
2618	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UDPConn	1513
2619	net	ReadMsgUDP	{[]byte,[]byte}	{int,*net.UDPAddr,error}	*UDPConn	1513
2620	net	WriteToUDP	{[]byte,*net.UDPAddr}	{int,error}	*UDPConn	1513
2621	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UDPConn	1513
2622	net	WriteMsgUDP	{[]byte,[]byte,*net.UDPAddr}	{int,error}	*UDPConn	1513
2623	net	Network	{}	{string}	*UnixAddr	1514
2624	net	String	{}	{string}	*UnixAddr	1514
2625	net	SyscallConn	{}	{syscall.RawConn,error}	*UnixConn	1515
2626	net	CloseRead	{}	{error}	*UnixConn	1515
2627	net	CloseWrite	{}	{error}	*UnixConn	1515
2628	net	ReadFromUnix	{[]byte}	{int,*net.UnixAddr,error}	*UnixConn	1515
2629	net	ReadFrom	{[]byte}	{int,net.Addr,error}	*UnixConn	1515
2630	net	ReadMsgUnix	{[]byte,[]byte}	{int,*net.UnixAddr,error}	*UnixConn	1515
2631	net	WriteToUnix	{[]byte,*net.UnixAddr}	{int,error}	*UnixConn	1515
2632	net	WriteTo	{[]byte,net.Addr}	{int,error}	*UnixConn	1515
2633	net	WriteMsgUnix	{[]byte,[]byte,*net.UnixAddr}	{int,error}	*UnixConn	1515
2634	net	AcceptUnix	{}	{*net.UnixConn,error}	*UnixListener	1516
2635	net	Accept	{}	{net.Conn,error}	*UnixListener	1516
2636	net	Close	{}	{error}	*UnixListener	1516
2637	net	Addr	{}	{net.Addr}	*UnixListener	1516
2638	net	SetDeadline	{time.Time}	{error}	*UnixListener	1516
2639	net	File	{}	{*os.File,error}	*UnixListener	1516
2640	net	SetUnlinkOnClose	{bool}	{}	*UnixListener	1516
2641	url	Error	{}	{string}	*Error	1517
2642	url	Timeout	{}	{bool}	*Error	1517
2643	url	Temporary	{}	{bool}	*Error	1517
2644	url	Error	{}	{string}	EscapeError	1518
2645	url	Error	{}	{string}	InvalidHostError	1519
2646	url	EscapedPath	{}	{string}	*URL	1520
2647	url	String	{}	{string}	*URL	1520
2648	url	IsAbs	{}	{bool}	*URL	1520
2649	url	Parse	{string}	{*url.URL,error}	*URL	1520
2650	url	ResolveReference	{*url.URL}	{*url.URL}	*URL	1520
2651	url	Query	{}	{url.Values}	*URL	1520
2652	url	RequestURI	{}	{string}	*URL	1520
2653	url	Hostname	{}	{string}	*URL	1520
2654	url	Port	{}	{string}	*URL	1520
2655	url	MarshalBinary	{}	{[]byte,error}	*URL	1520
2656	url	UnmarshalBinary	{[]byte}	{error}	*URL	1520
2657	url	Username	{}	{string}	*Userinfo	1521
2658	url	Password	{}	{string,bool}	*Userinfo	1521
2659	url	String	{}	{string}	*Userinfo	1521
2660	url	Get	{string}	{string}	Values	1522
2661	url	Set	{string,string}	{}	Values	1522
2662	url	Add	{string,string}	{}	Values	1522
2663	url	Del	{string}	{}	Values	1522
2664	url	Encode	{}	{string}	Values	1522
2665	os	Error	{}	{string}	*PathError	1523
2666	os	Error	{}	{string}	*SyscallError	1524
2667	exec	Error	{}	{string}	*Error	1525
2668	exec	Run	{}	{error}	*Cmd	1526
2669	exec	Start	{}	{error}	*Cmd	1526
2670	exec	Wait	{}	{error}	*Cmd	1526
2671	exec	Output	{}	{[]byte,error}	*Cmd	1526
2672	exec	CombinedOutput	{}	{[]byte,error}	*Cmd	1526
2673	exec	StdinPipe	{}	{io.WriteCloser,error}	*Cmd	1526
2674	exec	StdoutPipe	{}	{io.ReadCloser,error}	*Cmd	1526
2675	exec	StderrPipe	{}	{io.ReadCloser,error}	*Cmd	1526
2676	exec	Error	{}	{string}	*ExitError	1528
2677	os	Release	{}	{error}	*Process	1529
2678	os	Kill	{}	{error}	*Process	1529
2679	os	Wait	{}	{*os.ProcessState,error}	*Process	1529
2680	os	Signal	{os.Signal}	{error}	*Process	1529
2681	os	UserTime	{}	{time.Duration}	*ProcessState	1532
2682	os	SystemTime	{}	{time.Duration}	*ProcessState	1532
2683	os	Exited	{}	{bool}	*ProcessState	1532
2684	os	Success	{}	{bool}	*ProcessState	1532
2685	os	Sys	{}	{"interface{}"}	*ProcessState	1532
2686	os	SysUsage	{}	{"interface{}"}	*ProcessState	1532
2687	os	Pid	{}	{int}	*ProcessState	1532
2688	os	String	{}	{string}	*ProcessState	1532
2689	os	Pid	{}	{int}	*ProcessState	1532
2690	os	String	{}	{string}	*ProcessState	1532
2691	os	Error	{}	{string}	*LinkError	1534
2692	os	Readdir	{int}	{[]os.FileInfo,error}	*File	1535
2693	os	Readdirnames	{int}	{[]string,error}	*File	1535
2694	os	Name	{}	{string}	*File	1535
2695	os	Read	{[]byte}	{int,error}	*File	1535
2696	os	ReadAt	{[]byte,int64}	{int,error}	*File	1535
2697	os	Write	{[]byte}	{int,error}	*File	1535
2698	os	WriteAt	{[]byte,int64}	{int,error}	*File	1535
2699	os	Seek	{int64,int}	{int64,error}	*File	1535
2700	os	WriteString	{string}	{int,error}	*File	1535
2701	os	Chmod	{os.FileMode}	{error}	*File	1535
2702	os	Fd	{}	{uintptr}	*File	1535
2703	os	Close	{}	{error}	*File	1535
2704	os	Stat	{}	{os.FileInfo,error}	*File	1535
2705	os	Truncate	{int64}	{error}	*File	1535
2706	os	Sync	{}	{error}	*File	1535
2707	os	Chown	{int,int}	{error}	*File	1535
2708	os	Chdir	{}	{error}	*File	1535
2709	os	Chown	{int,int}	{error}	*File	1535
2710	os	Truncate	{int64}	{error}	*File	1535
2711	os	Sync	{}	{error}	*File	1535
2712	os	Chdir	{}	{error}	*File	1535
2713	os	Fd	{}	{uintptr}	*File	1535
2714	os	Close	{}	{error}	*File	1535
2715	os	Fd	{}	{uintptr}	*File	1535
2716	os	Close	{}	{error}	*File	1535
2717	os	Stat	{}	{os.FileInfo,error}	*File	1535
2718	os	Stat	{}	{os.FileInfo,error}	*File	1535
2719	os	String	{}	{string}	FileMode	1537
2720	os	IsDir	{}	{bool}	FileMode	1537
2721	os	IsRegular	{}	{bool}	FileMode	1537
2722	os	Perm	{}	{os.FileMode}	FileMode	1537
2723	user	GroupIds	{}	{[]string,error}	*User	1538
2724	user	Error	{}	{string}	UnknownUserIdError	1540
2725	user	Error	{}	{string}	UnknownUserError	1541
2726	user	Error	{}	{string}	UnknownGroupIdError	1542
2727	user	Error	{}	{string}	UnknownGroupError	1543
2728	plugin	Lookup	{string}	{plugin.Symbol,error}	*Plugin	1545
2729	reflect	String	{}	{string}	Kind	1548
2730	reflect	String	{}	{string}	ChanDir	1549
2731	reflect	Get	{string}	{string}	StructTag	1552
2732	reflect	Lookup	{string}	{string,bool}	StructTag	1552
2733	reflect	Addr	{}	{reflect.Value}	Value	1553
2734	reflect	Bool	{}	{bool}	Value	1553
2735	reflect	Bytes	{}	{[]byte}	Value	1553
2736	reflect	CanAddr	{}	{bool}	Value	1553
2737	reflect	CanSet	{}	{bool}	Value	1553
2738	reflect	Call	{[]reflect.Value}	{[]reflect.Value}	Value	1553
2739	reflect	CallSlice	{[]reflect.Value}	{[]reflect.Value}	Value	1553
2740	reflect	Cap	{}	{int}	Value	1553
2741	reflect	Close	{}	{}	Value	1553
2742	reflect	Complex	{}	{complex128}	Value	1553
2743	reflect	Elem	{}	{reflect.Value}	Value	1553
2744	reflect	Field	{int}	{reflect.Value}	Value	1553
2745	reflect	FieldByIndex	{[]int}	{reflect.Value}	Value	1553
2746	reflect	FieldByName	{string}	{reflect.Value}	Value	1553
2747	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.Value}	Value	1553
2748	reflect	Float	{}	{float64}	Value	1553
2749	reflect	Index	{int}	{reflect.Value}	Value	1553
2750	reflect	Int	{}	{int64}	Value	1553
2751	reflect	CanInterface	{}	{bool}	Value	1553
2752	reflect	Interface	{}	{"interface{}"}	Value	1553
2753	reflect	InterfaceData	{}	{[]uintptr}	Value	1553
2754	reflect	IsNil	{}	{bool}	Value	1553
2755	reflect	IsValid	{}	{bool}	Value	1553
2756	reflect	Kind	{}	{reflect.Kind}	Value	1553
2757	reflect	Len	{}	{int}	Value	1553
2758	reflect	MapIndex	{reflect.Value}	{reflect.Value}	Value	1553
2759	reflect	MapKeys	{}	{[]reflect.Value}	Value	1553
2760	reflect	Method	{int}	{reflect.Value}	Value	1553
2761	reflect	NumMethod	{}	{int}	Value	1553
2762	reflect	MethodByName	{string}	{reflect.Value}	Value	1553
2763	reflect	NumField	{}	{int}	Value	1553
2764	reflect	OverflowComplex	{complex128}	{bool}	Value	1553
2765	reflect	OverflowFloat	{float64}	{bool}	Value	1553
2766	reflect	OverflowInt	{int64}	{bool}	Value	1553
2767	reflect	OverflowUint	{uint64}	{bool}	Value	1553
2768	reflect	Pointer	{}	{uintptr}	Value	1553
2769	reflect	Recv	{}	{reflect.Value,bool}	Value	1553
2770	reflect	Send	{reflect.Value}	{}	Value	1553
2771	reflect	Set	{reflect.Value}	{}	Value	1553
2772	reflect	SetBool	{bool}	{}	Value	1553
2773	reflect	SetBytes	{[]byte}	{}	Value	1553
2774	reflect	SetComplex	{complex128}	{}	Value	1553
2775	reflect	SetFloat	{float64}	{}	Value	1553
2776	reflect	SetInt	{int64}	{}	Value	1553
2777	reflect	SetLen	{int}	{}	Value	1553
2778	reflect	SetCap	{int}	{}	Value	1553
2779	reflect	SetMapIndex	{reflect.Value,reflect.Value}	{}	Value	1553
2780	reflect	SetUint	{uint64}	{}	Value	1553
2781	reflect	SetPointer	{unsafe.Pointer}	{}	Value	1553
2782	reflect	SetString	{string}	{}	Value	1553
2783	reflect	Slice	{int,int}	{reflect.Value}	Value	1553
2784	reflect	Slice3	{int,int,int}	{reflect.Value}	Value	1553
2785	reflect	String	{}	{string}	Value	1553
2786	reflect	TryRecv	{}	{reflect.Value,bool}	Value	1553
2787	reflect	TrySend	{reflect.Value}	{bool}	Value	1553
2788	reflect	Type	{}	{reflect.Type}	Value	1553
2789	reflect	Uint	{}	{uint64}	Value	1553
2790	reflect	UnsafeAddr	{}	{uintptr}	Value	1553
2791	reflect	Convert	{reflect.Type}	{reflect.Value}	Value	1553
2792	reflect	Error	{}	{string}	*ValueError	1554
2793	regexp	String	{}	{string}	*Regexp	1559
2794	regexp	Copy	{}	{*regexp.Regexp}	*Regexp	1559
2795	regexp	Longest	{}	{}	*Regexp	1559
2796	regexp	NumSubexp	{}	{int}	*Regexp	1559
2797	regexp	SubexpNames	{}	{[]string}	*Regexp	1559
2798	regexp	LiteralPrefix	{}	{string,bool}	*Regexp	1559
2799	regexp	MatchReader	{io.RuneReader}	{bool}	*Regexp	1559
2800	regexp	MatchString	{string}	{bool}	*Regexp	1559
2801	regexp	Match	{[]byte}	{bool}	*Regexp	1559
2802	regexp	ReplaceAllString	{string,string}	{string}	*Regexp	1559
2803	regexp	ReplaceAllLiteralString	{string,string}	{string}	*Regexp	1559
2804	regexp	ReplaceAllStringFunc	{string,"func(string) string"}	{string}	*Regexp	1559
2805	regexp	ReplaceAll	{[]byte,[]byte}	{[]byte}	*Regexp	1559
2806	regexp	ReplaceAllLiteral	{[]byte,[]byte}	{[]byte}	*Regexp	1559
2807	regexp	ReplaceAllFunc	{[]byte,"func([]byte) []byte"}	{[]byte}	*Regexp	1559
2808	regexp	Find	{[]byte}	{[]byte}	*Regexp	1559
2809	regexp	FindIndex	{[]byte}	{[]int}	*Regexp	1559
2810	regexp	FindString	{string}	{string}	*Regexp	1559
2811	regexp	FindStringIndex	{string}	{[]int}	*Regexp	1559
2812	regexp	FindReaderIndex	{io.RuneReader}	{[]int}	*Regexp	1559
2813	regexp	FindSubmatch	{[]byte}	{[][]byte}	*Regexp	1559
2814	regexp	Expand	{[]byte,[]byte,[]byte,[]int}	{[]byte}	*Regexp	1559
2815	regexp	ExpandString	{[]byte,string,string,[]int}	{[]byte}	*Regexp	1559
2816	regexp	FindSubmatchIndex	{[]byte}	{[]int}	*Regexp	1559
2817	regexp	FindStringSubmatch	{string}	{[]string}	*Regexp	1559
2818	regexp	FindStringSubmatchIndex	{string}	{[]int}	*Regexp	1559
2819	regexp	FindReaderSubmatchIndex	{io.RuneReader}	{[]int}	*Regexp	1559
2820	regexp	FindAll	{[]byte,int}	{[][]byte}	*Regexp	1559
2821	regexp	FindAllIndex	{[]byte,int}	{[][]int}	*Regexp	1559
2822	regexp	FindAllString	{string,int}	{[]string}	*Regexp	1559
2823	regexp	FindAllStringIndex	{string,int}	{[][]int}	*Regexp	1559
2824	regexp	FindAllSubmatch	{[]byte,int}	{[][][]byte}	*Regexp	1559
2825	regexp	FindAllSubmatchIndex	{[]byte,int}	{[][]int}	*Regexp	1559
2826	regexp	FindAllStringSubmatch	{string,int}	{[][]string}	*Regexp	1559
2827	regexp	FindAllStringSubmatchIndex	{string,int}	{[][]int}	*Regexp	1559
2828	regexp	Split	{string,int}	{[]string}	*Regexp	1559
2829	syntax	String	{}	{string}	ErrorCode	1561
2830	syntax	String	{}	{string}	*Prog	1563
2831	syntax	Prefix	{}	{string,bool}	*Prog	1563
2832	syntax	StartCond	{}	{syntax.EmptyOp}	*Prog	1563
2833	syntax	String	{}	{string}	InstOp	1564
2834	syntax	MatchRune	{rune}	{bool}	*Inst	1566
2835	syntax	MatchRunePos	{rune}	{int}	*Inst	1566
2836	syntax	MatchEmptyWidth	{rune,rune}	{bool}	*Inst	1566
2837	syntax	String	{}	{string}	*Inst	1566
2838	syntax	Equal	{*syntax.Regexp}	{bool}	*Regexp	1567
2839	syntax	String	{}	{string}	*Regexp	1567
2840	syntax	MaxCap	{}	{int}	*Regexp	1567
2841	syntax	CapNames	{}	{[]string}	*Regexp	1567
2842	syntax	Simplify	{}	{*syntax.Regexp}	*Regexp	1567
2843	runtime	RuntimeError	{}	{}	*TypeAssertionError	1709
2844	runtime	Error	{}	{string}	*TypeAssertionError	1709
2845	runtime	Stack	{}	{[]uintptr}	*StackRecord	1723
2846	runtime	InUseBytes	{}	{int64}	*MemProfileRecord	1724
2847	runtime	InUseObjects	{}	{int64}	*MemProfileRecord	1724
2848	runtime	Stack	{}	{[]uintptr}	*MemProfileRecord	1724
2849	pprof	Name	{}	{string}	*Profile	1738
2850	pprof	Count	{}	{int}	*Profile	1738
2851	pprof	Add	{"interface{}",int}	{}	*Profile	1738
2852	pprof	Remove	{"interface{}"}	{}	*Profile	1738
2853	pprof	WriteTo	{io.Writer,int}	{error}	*Profile	1738
2854	runtime	Next	{}	{runtime.Frame,bool}	*Frames	1739
2855	runtime	Name	{}	{string}	*Func	1741
2856	runtime	Entry	{}	{uintptr}	*Func	1741
2857	runtime	FileLine	{uintptr}	{string,int}	*Func	1741
2858	sort	Search	{int}	{int}	IntSlice	1743
2859	sort	Len	{}	{int}	IntSlice	1743
2860	sort	Less	{int,int}	{bool}	IntSlice	1743
2861	sort	Swap	{int,int}	{}	IntSlice	1743
2862	sort	Sort	{}	{}	IntSlice	1743
2863	sort	Search	{float64}	{int}	Float64Slice	1744
2864	sort	Len	{}	{int}	Float64Slice	1744
2865	sort	Less	{int,int}	{bool}	Float64Slice	1744
2866	sort	Swap	{int,int}	{}	Float64Slice	1744
2867	sort	Sort	{}	{}	Float64Slice	1744
2868	sort	Search	{string}	{int}	StringSlice	1745
2869	sort	Len	{}	{int}	StringSlice	1745
2870	sort	Less	{int,int}	{bool}	StringSlice	1745
2871	sort	Swap	{int,int}	{}	StringSlice	1745
2872	sort	Sort	{}	{}	StringSlice	1745
2873	strconv	Error	{}	{string}	*NumError	1746
2874	strings	Len	{}	{int}	*Reader	1747
2875	strings	Size	{}	{int64}	*Reader	1747
2876	strings	Read	{[]byte}	{int,error}	*Reader	1747
2877	strings	ReadAt	{[]byte,int64}	{int,error}	*Reader	1747
2878	strings	ReadByte	{}	{byte,error}	*Reader	1747
2879	strings	UnreadByte	{}	{error}	*Reader	1747
2880	strings	ReadRune	{}	{rune,int,error}	*Reader	1747
2881	strings	UnreadRune	{}	{error}	*Reader	1747
2882	strings	Seek	{int64,int}	{int64,error}	*Reader	1747
2883	strings	WriteTo	{io.Writer}	{int64,error}	*Reader	1747
2884	strings	Reset	{string}	{}	*Reader	1747
2885	strings	Replace	{string}	{string}	*Replacer	1748
2886	strings	WriteString	{io.Writer,string}	{int,error}	*Replacer	1748
2887	atomic	Load	{}	{"interface{}"}	*Value	1749
2888	atomic	Store	{"interface{}"}	{}	*Value	1749
2889	sync	Wait	{}	{}	*Cond	1750
2890	sync	Signal	{}	{}	*Cond	1750
2891	sync	Broadcast	{}	{}	*Cond	1750
2892	sync	Load	{"interface{}"}	{"interface{}",bool}	*Map	1751
2893	sync	Store	{"interface{}","interface{}"}	{}	*Map	1751
2894	sync	LoadOrStore	{"interface{}","interface{}"}	{"interface{}",bool}	*Map	1751
2895	sync	Delete	{"interface{}"}	{}	*Map	1751
2896	sync	Range	{"func(interface{}) bool"}	{}	*Map	1751
2897	sync	Lock	{}	{}	*Mutex	1752
2898	sync	Unlock	{}	{}	*Mutex	1752
2899	sync	Do	{func()}	{}	*Once	1754
2900	sync	Put	{"interface{}"}	{}	*Pool	1755
2901	sync	Get	{}	{"interface{}"}	*Pool	1755
2902	sync	RLock	{}	{}	*RWMutex	1756
2903	sync	RUnlock	{}	{}	*RWMutex	1756
2904	sync	Lock	{}	{}	*RWMutex	1756
2905	sync	Unlock	{}	{}	*RWMutex	1756
2906	sync	RLocker	{}	{sync.Locker}	*RWMutex	1756
2907	sync	Add	{int}	{}	*WaitGroup	1757
2908	sync	Done	{}	{}	*WaitGroup	1757
2909	sync	Wait	{}	{}	*WaitGroup	1757
2910	syscall	Null	{}	{}	*Dir	1759
2911	syscall	Marshal	{[]byte}	{int,error}	*Dir	1759
2912	syscall	Error	{}	{string}	*DLLError	1760
2913	syscall	FindProc	{string}	{*syscall.Proc,error}	*DLL	1761
2914	syscall	MustFindProc	{string}	{*syscall.Proc}	*DLL	1761
2915	syscall	Release	{}	{error}	*DLL	1761
2916	syscall	Addr	{}	{uintptr}	*Proc	1762
2917	syscall	Call	{...uintptr}	{uintptr,error}	*Proc	1762
2918	syscall	Load	{}	{error}	*LazyDLL	1763
2919	syscall	Handle	{}	{uintptr}	*LazyDLL	1763
2920	syscall	NewProc	{string}	{*syscall.LazyProc}	*LazyDLL	1763
2921	syscall	Find	{}	{error}	*LazyProc	1764
2922	syscall	Addr	{}	{uintptr}	*LazyProc	1764
2923	syscall	Call	{...uintptr}	{uintptr,error}	*LazyProc	1764
2924	main	BoolTmpVarCode	{}	{string}	*Param	1775
2925	main	SliceTmpVarCode	{}	{string}	*Param	1775
2926	main	StringTmpVarCode	{}	{string}	*Param	1775
2927	main	TmpVarCode	{}	{string}	*Param	1775
2928	main	TmpVarHelperCode	{}	{string}	*Param	1775
2929	main	SyscallArgList	{}	{[]string}	*Param	1775
2930	main	IsError	{}	{bool}	*Param	1775
2931	main	HelperType	{}	{string}	*Param	1775
2932	main	ErrorVarName	{}	{string}	*Rets	1776
2933	main	ToParams	{}	{[]*main.Param}	*Rets	1776
2934	main	List	{}	{string}	*Rets	1776
2935	main	PrintList	{}	{string}	*Rets	1776
2936	main	SetReturnValuesCode	{}	{string}	*Rets	1776
2937	main	SetErrorCode	{}	{string}	*Rets	1776
2938	main	DLLName	{}	{string}	*Fn	1777
2939	main	DLLFuncName	{}	{string}	*Fn	1777
2940	main	ParamList	{}	{string}	*Fn	1777
2941	main	HelperParamList	{}	{string}	*Fn	1777
2942	main	ParamPrintList	{}	{string}	*Fn	1777
2943	main	ParamCount	{}	{int}	*Fn	1777
2944	main	SyscallParamCount	{}	{int}	*Fn	1777
2945	main	Syscall	{}	{string}	*Fn	1777
2946	main	SyscallParamList	{}	{string}	*Fn	1777
2947	main	HelperCallParamList	{}	{string}	*Fn	1777
2948	main	IsUTF16	{}	{bool}	*Fn	1777
2949	main	StrconvFunc	{}	{string}	*Fn	1777
2950	main	StrconvType	{}	{string}	*Fn	1777
2951	main	HasStringParam	{}	{bool}	*Fn	1777
2952	main	HelperName	{}	{string}	*Fn	1777
2953	main	Import	{string}	{}	*Source	1778
2954	main	ExternalImport	{string}	{}	*Source	1778
2955	main	DLLs	{}	{[]string}	*Source	1778
2956	main	ParseFile	{string}	{error}	*Source	1778
2957	main	IsStdRepo	{}	{bool,error}	*Source	1778
2958	main	Generate	{io.Writer}	{error}	*Source	1778
2959	syscall	String	{}	{string,error}	*SID	1806
2960	syscall	Len	{}	{int}	*SID	1806
2961	syscall	Copy	{}	{*syscall.SID,error}	*SID	1806
2962	syscall	LookupAccount	{string}	{string,uint32,error}	*SID	1806
2963	syscall	Close	{}	{error}	Token	1810
2964	syscall	GetTokenUser	{}	{*syscall.Tokenuser,error}	Token	1810
2965	syscall	GetTokenPrimaryGroup	{}	{*syscall.Tokenprimarygroup,error}	Token	1810
2966	syscall	GetUserProfileDirectory	{}	{string,error}	Token	1810
2967	syscall	Exited	{}	{bool}	WaitStatus	1812
2968	syscall	ExitStatus	{}	{int}	WaitStatus	1812
2969	syscall	Signaled	{}	{bool}	WaitStatus	1812
2970	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1812
2971	syscall	CoreDump	{}	{bool}	WaitStatus	1812
2972	syscall	Stopped	{}	{bool}	WaitStatus	1812
2973	syscall	Continued	{}	{bool}	WaitStatus	1812
2974	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1812
2975	syscall	TrapCause	{}	{int}	WaitStatus	1812
2976	syscall	Exited	{}	{bool}	WaitStatus	1812
2977	syscall	Signaled	{}	{bool}	WaitStatus	1812
2978	syscall	Stopped	{}	{bool}	WaitStatus	1812
2979	syscall	Continued	{}	{bool}	WaitStatus	1812
2980	syscall	CoreDump	{}	{bool}	WaitStatus	1812
2981	syscall	ExitStatus	{}	{int}	WaitStatus	1812
2982	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1812
2983	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1812
2984	syscall	TrapCause	{}	{int}	WaitStatus	1812
2985	syscall	Exited	{}	{bool}	WaitStatus	1812
2986	syscall	ExitStatus	{}	{int}	WaitStatus	1812
2987	syscall	Signaled	{}	{bool}	WaitStatus	1812
2988	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1812
2989	syscall	CoreDump	{}	{bool}	WaitStatus	1812
2990	syscall	Stopped	{}	{bool}	WaitStatus	1812
2991	syscall	Continued	{}	{bool}	WaitStatus	1812
2992	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1812
2993	syscall	TrapCause	{}	{int}	WaitStatus	1812
2994	syscall	Exited	{}	{bool}	WaitStatus	1812
2995	syscall	ExitStatus	{}	{int}	WaitStatus	1812
2996	syscall	Signaled	{}	{bool}	WaitStatus	1812
2997	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1812
2998	syscall	CoreDump	{}	{bool}	WaitStatus	1812
2999	syscall	Stopped	{}	{bool}	WaitStatus	1812
3000	syscall	Continued	{}	{bool}	WaitStatus	1812
3001	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1812
3002	syscall	TrapCause	{}	{int}	WaitStatus	1812
3003	syscall	Exited	{}	{bool}	WaitStatus	1812
3004	syscall	ExitStatus	{}	{int}	WaitStatus	1812
3005	syscall	Signal	{}	{syscall.Signal}	WaitStatus	1812
3006	syscall	CoreDump	{}	{bool}	WaitStatus	1812
3007	syscall	Stopped	{}	{bool}	WaitStatus	1812
3008	syscall	Continued	{}	{bool}	WaitStatus	1812
3009	syscall	StopSignal	{}	{syscall.Signal}	WaitStatus	1812
3010	syscall	Signaled	{}	{bool}	WaitStatus	1812
3011	syscall	TrapCause	{}	{int}	WaitStatus	1812
3012	syscall	Error	{}	{string}	Errno	1820
3013	syscall	Temporary	{}	{bool}	Errno	1820
3014	syscall	Timeout	{}	{bool}	Errno	1820
3015	syscall	Error	{}	{string}	Errno	1820
3016	syscall	Temporary	{}	{bool}	Errno	1820
3017	syscall	Timeout	{}	{bool}	Errno	1820
3018	syscall	Error	{}	{string}	Errno	1820
3019	syscall	Temporary	{}	{bool}	Errno	1820
3020	syscall	Timeout	{}	{bool}	Errno	1820
3021	syscall	Signal	{}	{}	Signal	1821
3022	syscall	String	{}	{string}	Signal	1821
3023	syscall	Signal	{}	{}	Signal	1821
3024	syscall	String	{}	{string}	Signal	1821
3025	syscall	Signal	{}	{}	Signal	1821
3026	syscall	String	{}	{string}	Signal	1821
3027	syscall	SetLen	{int}	{}	*Iovec	1827
3028	syscall	SetLen	{int}	{}	*Iovec	1827
3029	syscall	SetLen	{int}	{}	*Iovec	1827
3030	syscall	SetLen	{int}	{}	*Iovec	1827
3031	syscall	SetLen	{int}	{}	*Iovec	1827
3032	syscall	SetLen	{int}	{}	*Iovec	1827
3033	syscall	SetLen	{int}	{}	*Iovec	1827
3034	syscall	SetLen	{int}	{}	*Iovec	1827
3035	syscall	SetLen	{int}	{}	*Iovec	1827
3036	syscall	SetLen	{int}	{}	*Iovec	1827
3037	syscall	SetLen	{int}	{}	*Iovec	1827
3038	syscall	SetLen	{int}	{}	*Iovec	1827
3039	syscall	SetLen	{int}	{}	*Iovec	1827
3040	syscall	SetLen	{int}	{}	*Iovec	1827
3041	syscall	SetLen	{int}	{}	*Iovec	1827
3042	syscall	SetLen	{int}	{}	*Iovec	1827
3043	syscall	SetLen	{int}	{}	*Iovec	1827
3044	syscall	SetLen	{int}	{}	*Iovec	1827
3045	syscall	SetLen	{int}	{}	*Iovec	1827
3046	syscall	SetLen	{int}	{}	*Iovec	1827
3047	syscall	SetLen	{int}	{}	*Iovec	1827
3048	syscall	SetLen	{int}	{}	*Iovec	1827
3049	syscall	SetLen	{int}	{}	*Iovec	1827
3050	syscall	Unix	{}	{int64,int64}	*Timespec	1828
3051	syscall	Nano	{}	{int64}	*Timespec	1828
3052	syscall	Unix	{}	{int64,int64}	*Timeval	1829
3053	syscall	Nano	{}	{int64}	*Timeval	1829
3054	syscall	Nanoseconds	{}	{int64}	*Timeval	1829
3055	syscall	Error	{}	{string}	ErrorString	1836
3056	syscall	Temporary	{}	{bool}	ErrorString	1836
3057	syscall	Timeout	{}	{bool}	ErrorString	1836
3058	syscall	Signal	{}	{}	Note	1837
3059	syscall	String	{}	{string}	Note	1837
3060	syscall	Exited	{}	{bool}	Waitmsg	1838
3061	syscall	Signaled	{}	{bool}	Waitmsg	1838
3062	syscall	ExitStatus	{}	{int}	Waitmsg	1838
3063	syscall	Sockaddr	{}	{syscall.Sockaddr,error}	*RawSockaddrAny	1854
3064	syscall	SetControllen	{int}	{}	*Msghdr	1890
3065	syscall	SetControllen	{int}	{}	*Msghdr	1890
3066	syscall	SetControllen	{int}	{}	*Msghdr	1890
3067	syscall	SetControllen	{int}	{}	*Msghdr	1890
3068	syscall	SetControllen	{int}	{}	*Msghdr	1890
3069	syscall	SetControllen	{int}	{}	*Msghdr	1890
3070	syscall	SetControllen	{int}	{}	*Msghdr	1890
3071	syscall	SetControllen	{int}	{}	*Msghdr	1890
3072	syscall	SetControllen	{int}	{}	*Msghdr	1890
3073	syscall	SetControllen	{int}	{}	*Msghdr	1890
3074	syscall	SetControllen	{int}	{}	*Msghdr	1890
3075	syscall	SetControllen	{int}	{}	*Msghdr	1890
3076	syscall	SetControllen	{int}	{}	*Msghdr	1890
3077	syscall	SetControllen	{int}	{}	*Msghdr	1890
3078	syscall	SetControllen	{int}	{}	*Msghdr	1890
3079	syscall	SetControllen	{int}	{}	*Msghdr	1890
3080	syscall	SetControllen	{int}	{}	*Msghdr	1890
3081	syscall	SetControllen	{int}	{}	*Msghdr	1890
3082	syscall	SetControllen	{int}	{}	*Msghdr	1890
3083	syscall	SetControllen	{int}	{}	*Msghdr	1890
3084	syscall	SetControllen	{int}	{}	*Msghdr	1890
3085	syscall	SetControllen	{int}	{}	*Msghdr	1890
3086	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3087	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3088	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3089	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3090	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3091	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3092	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3093	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3094	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3095	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3096	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3097	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3098	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3099	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3100	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3101	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3102	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3103	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3104	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3105	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3106	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3107	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3108	syscall	SetLen	{int}	{}	*Cmsghdr	1891
3109	syscall	PC	{}	{uint64}	*PtraceRegs	2037
3110	syscall	SetPC	{uint64}	{}	*PtraceRegs	2037
3111	syscall	PC	{}	{uint64}	*PtraceRegs	2037
3112	syscall	SetPC	{uint64}	{}	*PtraceRegs	2037
3113	syscall	PC	{}	{uint64}	*PtraceRegs	2037
3114	syscall	SetPC	{uint64}	{}	*PtraceRegs	2037
3115	syscall	PC	{}	{uint64}	*PtraceRegs	2037
3116	syscall	SetPC	{uint64}	{}	*PtraceRegs	2037
3117	syscall	PC	{}	{uint64}	*PtraceRegs	2037
3118	syscall	SetPC	{uint64}	{}	*PtraceRegs	2037
3119	syscall	PC	{}	{uint64}	*PtraceRegs	2037
3120	syscall	SetPC	{uint64}	{}	*PtraceRegs	2037
3121	syscall	PC	{}	{uint64}	*PtraceRegs	2037
3122	syscall	SetPC	{uint64}	{}	*PtraceRegs	2037
3123	syscall	PC	{}	{uint64}	*PtraceRegs	2037
3124	syscall	SetPC	{uint64}	{}	*PtraceRegs	2037
3125	syscall	Nanoseconds	{}	{int64}	*Filetime	3364
3126	testing	Next	{}	{bool}	*PB	3413
3127	testdeps	MatchString	{string,string}	{bool,error}	TestDeps	3417
3128	testdeps	StartCPUProfile	{io.Writer}	{error}	TestDeps	3417
3129	testdeps	StopCPUProfile	{}	{}	TestDeps	3417
3130	testdeps	WriteHeapProfile	{io.Writer}	{error}	TestDeps	3417
3131	testdeps	WriteProfileTo	{string,io.Writer,int}	{error}	TestDeps	3417
3132	testdeps	ImportPath	{}	{string}	TestDeps	3417
3133	quick	Error	{}	{string}	SetupError	3420
3134	quick	Error	{}	{string}	*CheckError	3421
3135	quick	Error	{}	{string}	*CheckEqualError	3422
3136	testing	Run	{}	{int}	*M	3426
3137	scanner	IsValid	{}	{bool}	*Position	3427
3138	scanner	String	{}	{string}	Position	3427
3139	tabwriter	Init	{io.Writer,int,int,int,byte,uint}	{*tabwriter.Writer}	*Writer	3429
3140	tabwriter	Flush	{}	{error}	*Writer	3429
3141	tabwriter	Write	{[]byte}	{int,error}	*Writer	3429
3142	template	Error	{}	{string}	ExecError	3430
3143	parse	Type	{}	{parse.NodeType}	NodeType	3433
3144	parse	Position	{}	{parse.Pos}	Pos	3434
3145	parse	String	{}	{string}	*ListNode	3435
3146	parse	CopyList	{}	{*parse.ListNode}	*ListNode	3435
3147	parse	Copy	{}	{parse.Node}	*ListNode	3435
3148	parse	String	{}	{string}	*TextNode	3436
3149	parse	Copy	{}	{parse.Node}	*TextNode	3436
3150	parse	String	{}	{string}	*PipeNode	3437
3151	parse	CopyPipe	{}	{*parse.PipeNode}	*PipeNode	3437
3152	parse	Copy	{}	{parse.Node}	*PipeNode	3437
3153	parse	String	{}	{string}	*ActionNode	3438
3154	parse	Copy	{}	{parse.Node}	*ActionNode	3438
3155	parse	String	{}	{string}	*CommandNode	3439
3156	parse	Copy	{}	{parse.Node}	*CommandNode	3439
3157	parse	SetPos	{parse.Pos}	{*parse.IdentifierNode}	*IdentifierNode	3440
3158	parse	SetTree	{*parse.Tree}	{*parse.IdentifierNode}	*IdentifierNode	3440
3159	parse	String	{}	{string}	*IdentifierNode	3440
3160	parse	Copy	{}	{parse.Node}	*IdentifierNode	3440
3161	parse	String	{}	{string}	*VariableNode	3441
3162	parse	Copy	{}	{parse.Node}	*VariableNode	3441
3163	parse	Type	{}	{parse.NodeType}	*DotNode	3442
3164	parse	String	{}	{string}	*DotNode	3442
3165	parse	Copy	{}	{parse.Node}	*DotNode	3442
3166	parse	Type	{}	{parse.NodeType}	*NilNode	3443
3167	parse	String	{}	{string}	*NilNode	3443
3168	parse	Copy	{}	{parse.Node}	*NilNode	3443
3169	parse	String	{}	{string}	*FieldNode	3444
3170	parse	Copy	{}	{parse.Node}	*FieldNode	3444
3171	parse	Add	{string}	{}	*ChainNode	3445
3172	parse	String	{}	{string}	*ChainNode	3445
3173	parse	Copy	{}	{parse.Node}	*ChainNode	3445
3174	parse	String	{}	{string}	*BoolNode	3446
3175	parse	Copy	{}	{parse.Node}	*BoolNode	3446
3176	parse	String	{}	{string}	*NumberNode	3447
3177	parse	Copy	{}	{parse.Node}	*NumberNode	3447
3178	parse	String	{}	{string}	*StringNode	3448
3179	parse	Copy	{}	{parse.Node}	*StringNode	3448
3180	parse	String	{}	{string}	*BranchNode	3449
3181	parse	Copy	{}	{parse.Node}	*BranchNode	3449
3182	parse	Copy	{}	{parse.Node}	*IfNode	3450
3183	parse	Copy	{}	{parse.Node}	*RangeNode	3451
3184	parse	Copy	{}	{parse.Node}	*WithNode	3452
3185	parse	String	{}	{string}	*TemplateNode	3453
3186	parse	Copy	{}	{parse.Node}	*TemplateNode	3453
3187	parse	Copy	{}	{*parse.Tree}	*Tree	3454
3188	parse	ErrorContext	{parse.Node}	{string}	*Tree	3454
3189	parse	Parse	{string,string,string,map[string]*parse.Tree,"...map[string]interface{}"}	{*parse.Tree,error}	*Tree	3454
3190	time	Error	{}	{string}	*ParseError	3456
3191	time	Stop	{}	{bool}	*Timer	3459
3192	time	Reset	{time.Duration}	{bool}	*Timer	3459
3193	time	Stop	{}	{}	*Ticker	3460
3194	time	String	{}	{string}	Time	3461
3195	time	Format	{string}	{string}	Time	3461
3196	time	AppendFormat	{[]byte,string}	{[]byte}	Time	3461
3197	time	After	{time.Time}	{bool}	Time	3461
3198	time	Before	{time.Time}	{bool}	Time	3461
3199	time	Equal	{time.Time}	{bool}	Time	3461
3200	time	IsZero	{}	{bool}	Time	3461
3201	time	Date	{}	{int,time.Month,int}	Time	3461
3202	time	Year	{}	{int}	Time	3461
3203	time	Month	{}	{time.Month}	Time	3461
3204	time	Day	{}	{int}	Time	3461
3205	time	Weekday	{}	{time.Weekday}	Time	3461
3206	time	ISOWeek	{}	{int}	Time	3461
3207	time	Clock	{}	{int}	Time	3461
3208	time	Hour	{}	{int}	Time	3461
3209	time	Minute	{}	{int}	Time	3461
3210	time	Second	{}	{int}	Time	3461
3211	time	Nanosecond	{}	{int}	Time	3461
3212	time	YearDay	{}	{int}	Time	3461
3213	time	Add	{time.Duration}	{time.Time}	Time	3461
3214	time	Sub	{time.Time}	{time.Duration}	Time	3461
3215	time	AddDate	{int,int,int}	{time.Time}	Time	3461
3216	time	UTC	{}	{time.Time}	Time	3461
3217	time	Local	{}	{time.Time}	Time	3461
3218	time	In	{*time.Location}	{time.Time}	Time	3461
3219	time	Location	{}	{*time.Location}	Time	3461
3220	time	Zone	{}	{string,int}	Time	3461
3221	time	Unix	{}	{int64}	Time	3461
3222	time	UnixNano	{}	{int64}	Time	3461
3223	time	MarshalBinary	{}	{[]byte,error}	Time	3461
3224	time	UnmarshalBinary	{[]byte}	{error}	*Time	3461
3225	time	GobEncode	{}	{[]byte,error}	Time	3461
3226	time	GobDecode	{[]byte}	{error}	*Time	3461
3227	time	MarshalJSON	{}	{[]byte,error}	Time	3461
3228	time	UnmarshalJSON	{[]byte}	{error}	*Time	3461
3229	time	MarshalText	{}	{[]byte,error}	Time	3461
3230	time	UnmarshalText	{[]byte}	{error}	*Time	3461
3231	time	Truncate	{time.Duration}	{time.Time}	Time	3461
3232	time	Round	{time.Duration}	{time.Time}	Time	3461
3233	time	String	{}	{string}	Month	3462
3234	time	String	{}	{string}	Weekday	3463
3235	time	String	{}	{string}	Duration	3464
3236	time	Nanoseconds	{}	{int64}	Duration	3464
3237	time	Seconds	{}	{float64}	Duration	3464
3238	time	Minutes	{}	{float64}	Duration	3464
3239	time	Hours	{}	{float64}	Duration	3464
3240	time	Truncate	{time.Duration}	{time.Duration}	Duration	3464
3241	time	Round	{time.Duration}	{time.Duration}	Duration	3464
3242	time	String	{}	{string}	*Location	3465
3243	unicode	ToUpper	{rune}	{rune}	SpecialCase	3470
3244	unicode	ToTitle	{rune}	{rune}	SpecialCase	3470
3245	unicode	ToLower	{rune}	{rune}	SpecialCase	3470
3246	hpack	WriteField	{hpack.HeaderField}	{error}	*Encoder	3477
3247	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Encoder	3477
3248	hpack	SetMaxDynamicTableSizeLimit	{uint32}	{}	*Encoder	3477
3249	hpack	Error	{}	{string}	DecodingError	3478
3250	hpack	Error	{}	{string}	InvalidIndexError	3479
3251	hpack	IsPseudo	{}	{bool}	HeaderField	3480
3252	hpack	String	{}	{string}	HeaderField	3480
3253	hpack	Size	{}	{uint32}	HeaderField	3480
3254	hpack	SetMaxStringLength	{int}	{}	*Decoder	3481
3255	hpack	SetEmitFunc	{func(hpack.HeaderField)}	{}	*Decoder	3481
3256	hpack	SetEmitEnabled	{bool}	{}	*Decoder	3481
3257	hpack	EmitEnabled	{}	{bool}	*Decoder	3481
3258	hpack	SetMaxDynamicTableSize	{uint32}	{}	*Decoder	3481
3259	hpack	SetAllowedMaxDynamicTableSize	{uint32}	{}	*Decoder	3481
3260	hpack	DecodeFull	{[]byte}	{[]hpack.HeaderField,error}	*Decoder	3481
3261	hpack	Close	{}	{error}	*Decoder	3481
3262	hpack	Write	{[]byte}	{int,error}	*Decoder	3481
3263	idna	ToASCII	{string}	{string,error}	*Profile	3483
3264	idna	ToUnicode	{string}	{string,error}	*Profile	3483
3265	idna	String	{}	{string}	*Profile	3483
3266	lif	Family	{}	{int}	*Inet4Addr	3485
3267	lif	Family	{}	{int}	*Inet6Addr	3486
3268	proxy	Dial	{string,string}	{net.Conn,error}	*PerHost	3489
3269	proxy	AddFromString	{string}	{}	*PerHost	3489
3270	proxy	AddIP	{net.IP}	{}	*PerHost	3489
3271	proxy	AddNetwork	{*net.IPNet}	{}	*PerHost	3489
3272	proxy	AddZone	{string}	{}	*PerHost	3489
3273	proxy	AddHost	{string}	{}	*PerHost	3489
3274	route	Family	{}	{int}	*LinkAddr	3493
3275	route	Family	{}	{int}	*Inet4Addr	3494
3276	route	Family	{}	{int}	*Inet6Addr	3495
3277	route	Family	{}	{int}	*DefaultAddr	3496
3278	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3497
3279	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3497
3280	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3497
3281	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3497
3282	route	Sys	{}	{[]route.Sys}	*InterfaceMessage	3497
3283	route	Sys	{}	{[]route.Sys}	*InterfaceAddrMessage	3498
3284	route	Sys	{}	{[]route.Sys}	*InterfaceMulticastAddrMessage	3499
3285	route	Sys	{}	{[]route.Sys}	*InterfaceAnnounceMessage	3500
3286	route	Marshal	{}	{[]byte,error}	*RouteMessage	3504
3287	route	Sys	{}	{[]route.Sys}	*RouteMessage	3504
3288	route	Sys	{}	{[]route.Sys}	*RouteMessage	3504
3289	route	Sys	{}	{[]route.Sys}	*RouteMessage	3504
3290	route	Sys	{}	{[]route.Sys}	*RouteMessage	3504
3291	route	Sys	{}	{[]route.Sys}	*RouteMessage	3504
3292	route	SysType	{}	{route.SysType}	*RouteMetrics	3506
3293	route	SysType	{}	{route.SysType}	*RouteMetrics	3506
3294	route	SysType	{}	{route.SysType}	*RouteMetrics	3506
3295	route	SysType	{}	{route.SysType}	*RouteMetrics	3506
3296	route	SysType	{}	{route.SysType}	*RouteMetrics	3506
3297	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3507
3298	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3507
3299	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3507
3300	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3507
3301	route	SysType	{}	{route.SysType}	*InterfaceMetrics	3507
3302	bidirule	Reset	{}	{}	*Transformer	3516
3303	bidirule	Transform	{[]byte,[]byte,bool}	{int,error}	*Transformer	3516
3304	bidirule	Span	{[]byte,bool}	{int,error}	*Transformer	3516
3305	transform	Reset	{}	{}	NopResetter	3519
3306	transform	Read	{[]byte}	{int,error}	*Reader	3520
3307	transform	Write	{[]byte}	{int,error}	*Writer	3521
3308	transform	Close	{}	{error}	*Writer	3521
3309	bidi	SetBytes	{[]byte,...bidi.Option}	{int,error}	*Paragraph	3524
3310	bidi	SetString	{string,...bidi.Option}	{int,error}	*Paragraph	3524
3311	bidi	IsLeftToRight	{}	{bool}	*Paragraph	3524
3312	bidi	Direction	{}	{bidi.Direction}	*Paragraph	3524
3313	bidi	RunAt	{int}	{bidi.Run}	*Paragraph	3524
3314	bidi	Order	{}	{bidi.Ordering,error}	*Paragraph	3524
3315	bidi	Line	{int,int}	{bidi.Ordering,error}	*Paragraph	3524
3316	bidi	Direction	{}	{bidi.Direction}	*Ordering	3525
3317	bidi	NumRuns	{}	{int}	*Ordering	3525
3318	bidi	Run	{int}	{bidi.Run}	*Ordering	3525
3319	bidi	String	{}	{string}	*Run	3526
3320	bidi	Bytes	{}	{[]byte}	*Run	3526
3321	bidi	Direction	{}	{bidi.Direction}	*Run	3526
3322	bidi	Pos	{}	{int}	*Run	3526
3323	bidi	Class	{}	{bidi.Class}	Properties	3527
3324	bidi	IsBracket	{}	{bool}	Properties	3527
3325	bidi	IsOpeningBracket	{}	{bool}	Properties	3527
3326	norm	BoundaryBefore	{}	{bool}	Properties	3529
3327	norm	BoundaryAfter	{}	{bool}	Properties	3529
3328	norm	Decomposition	{}	{[]byte}	Properties	3529
3329	norm	Size	{}	{int}	Properties	3529
3330	norm	CCC	{}	{uint8}	Properties	3529
3331	norm	LeadCCC	{}	{uint8}	Properties	3529
3332	norm	TrailCCC	{}	{uint8}	Properties	3529
3333	norm	Init	{norm.Form,[]byte}	{}	*Iter	3530
3334	norm	InitString	{norm.Form,string}	{}	*Iter	3530
3335	norm	Seek	{int64,int}	{int64,error}	*Iter	3530
3336	norm	Pos	{}	{int}	*Iter	3530
3337	norm	Done	{}	{bool}	*Iter	3530
3338	norm	Next	{}	{[]byte}	*Iter	3530
3339	norm	Properties	{[]byte}	{norm.Properties}	Form	3531
3340	norm	PropertiesString	{string}	{norm.Properties}	Form	3531
3341	norm	Bytes	{[]byte}	{[]byte}	Form	3531
3342	norm	String	{string}	{string}	Form	3531
3343	norm	IsNormal	{[]byte}	{bool}	Form	3531
3344	norm	IsNormalString	{string}	{bool}	Form	3531
3345	norm	Append	{[]byte,...byte}	{[]byte}	Form	3531
3346	norm	AppendString	{[]byte,string}	{[]byte}	Form	3531
3347	norm	QuickSpan	{[]byte}	{int}	Form	3531
3348	norm	Span	{[]byte,bool}	{int,error}	Form	3531
3349	norm	SpanString	{string,bool}	{int,error}	Form	3531
3350	norm	QuickSpanString	{string}	{int}	Form	3531
3351	norm	FirstBoundary	{[]byte}	{int}	Form	3531
3352	norm	FirstBoundaryInString	{string}	{int}	Form	3531
3353	norm	NextBoundary	{[]byte,bool}	{int}	Form	3531
3354	norm	NextBoundaryInString	{string,bool}	{int}	Form	3531
3355	norm	LastBoundary	{[]byte}	{int}	Form	3531
3356	norm	Writer	{io.Writer}	{io.WriteCloser}	Form	3531
3357	norm	Reader	{io.Reader}	{io.Reader}	Form	3531
3358	norm	Reset	{}	{}	Form	3531
3359	norm	Transform	{[]byte,[]byte,bool}	{int,error}	Form	3531
\.


--
-- Data for Name: concrete_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.concrete_types (id, package, name, basetype) FROM stdin;
1	tar	Header	struct
2	tar	Reader	struct
3	tar	Writer	struct
4	zip	Reader	struct
5	zip	ReadCloser	struct
6	zip	File	struct
7	zip	Compressor	func(io.Writer) (io.WriteCloser, error)
8	zip	Decompressor	func(io.Reader) io.ReadCloser
9	zip	FileHeader	struct
10	zip	Writer	struct
11	bufio	Reader	struct
12	bufio	Writer	struct
13	bufio	ReadWriter	struct
14	bufio	Scanner	struct
15	bufio	SplitFunc	func([]byte, bool) (int, []byte, error)
16	builtin	Type	int
17	builtin	Type1	int
18	builtin	IntegerType	int
19	builtin	FloatType	float32
20	builtin	ComplexType	complex64
21	bytes	Buffer	struct
22	bytes	Reader	struct
23	main	Walker	struct
24	p1	MyInt	int
25	p1	Time	struct
26	p1	S	struct
27	p1	URL	struct
28	p1	EmbedURLPtr	struct
29	p1	S2	struct
30	p1	Namer	
31	p1	I	
32	p1	Public	
33	p1	Private	
34	p1	Error	
35	p1	Codec	struct
36	p1	SI	struct
37	p1	T	struct
38	p1	B	struct
39	p1	TPtrUnexported	struct
40	p1	TPtrExported	struct
41	p1	FuncType	func(int, string) (*p1.B, error)
42	p1	Embedded	struct
43	p1	EmbedSelector	struct
44	p1	ByteStruct	struct
45	p2	Twoer	
46	p3	ThirdBase	struct
47	arch	Arch	struct
48	asm	Parser	struct
49	asm	Patch	struct
50	flags	MultiFlag	[]string
51	lex	Input	struct
52	lex	ScanToken	rune
53	lex	TokenReader	
54	lex	Token	struct
55	lex	Macro	struct
56	lex	Slice	struct
57	lex	Stack	struct
58	lex	Tokenizer	struct
59	main	Package	struct
60	main	File	struct
61	main	Call	struct
62	main	Ref	struct
63	main	Name	struct
64	main	ExpFunc	struct
65	main	TypeRepr	struct
66	main	Type	struct
67	main	FuncType	struct
68	gc	AlgKind	int
69	gc	Ctype	int8
70	gc	Val	struct
71	gc	NilVal	struct
72	gc	Level	struct
73	gc	EscStep	struct
74	gc	NodeEscState	struct
75	gc	EscState	struct
76	gc	FmtFlag	int
77	gc	Class	uint8
78	gc	Arch	struct
79	gc	Progs	struct
80	gc	Mpflt	struct
81	gc	Mpcplx	struct
82	gc	Mpint	struct
83	gc	Order	struct
84	gc	BlockEffects	struct
85	gc	Liveness	struct
86	gc	Sig	struct
87	gc	GCProg	struct
88	gc	InitEntry	struct
89	gc	InitPlan	struct
90	gc	Branch	struct
91	gc	SSAGenState	struct
92	gc	FloatingEQNEJump	struct
93	gc	Error	struct
94	gc	Dlist	struct
95	gc	Symlink	struct
96	gc	Node	struct
97	gc	Name	struct
98	gc	Param	struct
99	gc	Func	struct
100	gc	Mark	struct
101	gc	ScopeID	int32
102	gc	Op	uint8
103	gc	Nodes	struct
104	main	V	struct
105	main	S	struct
106	main	T	struct
107	main	I	
108	main	T1	struct
109	main	T2	struct
110	main	T3	struct
111	main	T4	struct
112	main	T5	struct
113	main	T6	struct
114	main	T7	struct
115	main	T8	struct
116	main	T9	struct
117	main	T10	struct
118	main	T15	struct
119	main	T16	struct
120	main	T17	struct
121	main	T23	struct
122	main	T24	struct
123	main	T25	struct
124	main	T31	struct
125	main	T32	struct
126	main	T33	struct
127	main	T63	struct
128	main	T64	struct
129	main	T65	struct
130	main	T1023	struct
131	main	T1024	struct
132	main	T1025	struct
133	main	T1031	struct
134	main	T1032	struct
135	main	T1033	struct
136	main	T1039	struct
137	main	T1040	struct
138	main	T1041	struct
139	main	B	[]int
140	main	T1	[]*main.B
141	main	T2	[]*main.B
142	main	T3	struct
143	main	T4	struct
144	main	T	struct
145	main	T1	struct
146	main	T2	struct
147	main	T3	struct
148	main	T4	struct
149	main	T5	struct
150	main	T6	struct
151	main	T7	struct
152	main	T8	struct
153	main	T9	struct
154	main	T10	struct
155	main	T15	struct
156	main	T16	struct
157	main	T17	struct
158	main	T23	struct
159	main	T24	struct
160	main	T25	struct
161	main	T31	struct
162	main	T32	struct
163	main	T33	struct
164	main	T63	struct
165	main	T64	struct
166	main	T65	struct
167	main	T1023	struct
168	main	T1024	struct
169	main	T1025	struct
170	main	T8u1	struct
171	main	T8u2	struct
172	main	T16u1	struct
173	main	T16u2	struct
174	main	T24u1	struct
175	main	T24u2	struct
176	main	T32u1	struct
177	main	T32u2	struct
178	main	T64u1	struct
179	main	T64u2	struct
180	main	T256u1	struct
181	main	T256u2	struct
182	gc	Timings	struct
183	ssa	Block	struct
184	ssa	Edge	struct
185	ssa	BlockKind	int8
186	ssa	BranchPrediction	int8
187	ssa	Cache	struct
188	ssa	Config	struct
189	ssa	Types	struct
190	ssa	Logger	
191	ssa	Frontend	
192	ssa	GCNode	
193	ssa	Func	struct
194	main	ArchsByName	[]main.arch
195	main	Rule	struct
196	ssa	HTMLWriter	struct
197	ssa	ID	int32
198	ssa	Location	
199	ssa	Register	struct
200	ssa	LocalSlot	struct
201	ssa	LocPair	[]ssa.Location
202	ssa	Op	int32
203	ssa	SymEffect	int8
204	ssa	ValAndOff	int64
205	ssa	RBTint32	struct
206	ssa	ValHeap	struct
207	ssa	SparseTreeNode	struct
208	ssa	SparseTree	[]ssa.SparseTreeNode
209	ssa	SparseTreeMap	ssa.RBTint32
210	ssa	SparseTreeHelper	struct
211	ssa	Value	struct
212	ssa	ExternSymbol	struct
213	ssa	ArgSymbol	struct
214	ssa	AutoSymbol	struct
215	syntax	Node	
216	syntax	File	struct
217	syntax	Decl	
218	syntax	ImportDecl	struct
219	syntax	ConstDecl	struct
220	syntax	TypeDecl	struct
221	syntax	VarDecl	struct
222	syntax	FuncDecl	struct
223	syntax	Group	struct
224	syntax	Expr	
225	syntax	BadExpr	struct
226	syntax	Name	struct
227	syntax	BasicLit	struct
228	syntax	CompositeLit	struct
229	syntax	KeyValueExpr	struct
230	syntax	FuncLit	struct
231	syntax	ParenExpr	struct
232	syntax	SelectorExpr	struct
233	syntax	IndexExpr	struct
234	syntax	SliceExpr	struct
235	syntax	AssertExpr	struct
236	syntax	Operation	struct
237	syntax	CallExpr	struct
238	syntax	ListExpr	struct
239	syntax	ArrayType	struct
240	syntax	SliceType	struct
241	syntax	DotsType	struct
242	syntax	StructType	struct
243	syntax	Field	struct
244	syntax	InterfaceType	struct
245	syntax	FuncType	struct
246	syntax	MapType	struct
247	syntax	ChanType	struct
248	syntax	ChanDir	uint
249	syntax	Stmt	
250	syntax	SimpleStmt	
251	syntax	EmptyStmt	struct
252	syntax	LabeledStmt	struct
253	syntax	BlockStmt	struct
254	syntax	ExprStmt	struct
255	syntax	SendStmt	struct
256	syntax	DeclStmt	struct
257	syntax	AssignStmt	struct
258	syntax	BranchStmt	struct
259	syntax	CallStmt	struct
260	syntax	ReturnStmt	struct
261	syntax	IfStmt	struct
262	syntax	ForStmt	struct
263	syntax	SwitchStmt	struct
264	syntax	SelectStmt	struct
265	syntax	RangeClause	struct
266	syntax	TypeSwitchGuard	struct
267	syntax	CaseClause	struct
268	syntax	CommClause	struct
269	syntax	CommentKind	uint
270	syntax	Comment	struct
271	syntax	Mode	uint
272	syntax	Error	struct
273	syntax	ErrorHandler	func(error)
274	syntax	Pragma	uint16
275	syntax	PragmaHandler	func(src.Pos, string) syntax.Pragma
276	syntax	FilenameHandler	func(string) string
277	syntax	LitKind	uint
278	syntax	Operator	uint
279	types	Pkg	struct
280	types	Sym	struct
281	types	Node	struct
282	types	EType	uint8
283	types	ChanDir	uint8
284	types	Type	struct
285	types	Map	struct
286	types	Forward	struct
287	types	Func	struct
288	types	Struct	struct
289	types	Funarg	uint8
290	types	Interface	struct
291	types	Ptr	struct
292	types	DDDField	struct
293	types	ChanArgs	struct
294	types	FuncArgs	struct
295	types	Chan	struct
296	types	Tuple	struct
297	types	Array	struct
298	types	Slice	struct
299	types	Field	struct
300	types	Fields	struct
301	types	Cmp	int8
302	main	Block	struct
303	main	File	struct
304	main	FuncExtent	struct
305	main	FuncVisitor	struct
306	main	Profile	struct
307	main	ProfileBlock	struct
308	main	Boundary	struct
309	main	Dirs	struct
310	main	Package	struct
311	main	PackageError	string
312	pkg	ExportedType	struct
313	pkg	ExportedStructOneField	struct
314	pkg	ExportedInterface	
315	pkg	T2	int
316	pkg	T1	pkg.T2
317	main	TypeConfig	struct
318	main	Type	struct
319	base	Command	struct
320	base	StringsFlag	[]string
321	cfg	EnvVar	struct
322	cmdflag	Defn	struct
323	generate	Generator	struct
324	get	ImportMismatchError	struct
325	list	Context	struct
326	list	TrackingWriter	struct
327	load	Package	struct
328	load	PackagePublic	struct
329	load	PackageInternal	struct
330	load	NoGoError	struct
331	load	CoverVar	struct
332	load	PackageError	struct
333	load	ImportStack	[]string
334	web	HTTPError	struct
335	web	HTTPError	struct
336	web	SecurityMode	int
337	work	Builder	struct
338	work	Action	struct
339	work	BuildMode	int
340	bio	Reader	struct
341	bio	Writer	struct
342	dwarf	Sym	
343	dwarf	Var	struct
344	dwarf	Scope	struct
345	dwarf	Range	struct
346	dwarf	Context	
347	dwarf	DWAttr	struct
348	dwarf	DWDie	struct
349	dwarf	VarsByOffset	[]*dwarf.Var
350	gcprog	Writer	struct
351	goobj	Sym	struct
352	goobj	SymID	struct
353	goobj	Data	struct
354	goobj	Reloc	struct
355	goobj	Var	struct
356	goobj	Func	struct
357	goobj	FuncData	struct
358	goobj	InlinedCall	struct
359	goobj	Package	struct
360	arm	Optab	struct
361	arm	Opcross	[][][]uint8
362	arm64	Optab	struct
363	obj	InlTree	struct
364	obj	InlinedCall	struct
365	obj	Addr	struct
366	obj	AddrName	int8
367	obj	AddrType	uint8
368	obj	Prog	struct
369	obj	As	int16
370	obj	LSym	struct
371	obj	FuncInfo	struct
372	obj	Attribute	int16
373	obj	Pcln	struct
374	obj	Reloc	struct
375	obj	Auto	struct
376	obj	Pcdata	struct
377	obj	Link	struct
378	obj	LinkArch	struct
379	mips	Optab	struct
380	mips	Dep	struct
381	mips	Sch	struct
382	obj	Plist	struct
383	obj	ProgAlloc	func() *obj.Prog
384	ppc64	Optab	struct
385	s390x	Optab	struct
386	x86	Optab	struct
387	x86	Movtab	struct
388	x86	AsmBuf	struct
389	objabi	HeadType	uint8
390	objabi	RelocType	int32
391	objabi	SymKind	uint8
392	objfile	Disasm	struct
393	objfile	CachedFile	struct
394	objfile	FileCache	struct
395	objfile	Liner	
396	objfile	File	struct
397	objfile	Sym	struct
398	objfile	Reloc	struct
399	objfile	RelocStringer	
400	src	Pos	struct
401	src	PosBase	struct
402	src	XPos	struct
403	src	PosTable	struct
404	sys	ArchFamily	byte
405	sys	Arch	struct
406	ld	ArHdr	struct
407	ld	BuildMode	uint8
408	ld	LinkMode	uint8
409	ld	GCProg	struct
410	ld	ElfEhdr	struct
411	ld	ElfShdr	struct
412	ld	ElfPhdr	struct
413	ld	Elfstring	struct
414	ld	Elfaux	struct
415	ld	Elflib	struct
416	ld	Pkg	struct
417	ld	ElfHdrBytes	struct
418	ld	ElfSectBytes	struct
419	ld	ElfProgBytes	struct
420	ld	ElfSymBytes	struct
421	ld	ElfHdrBytes64	struct
422	ld	ElfSectBytes64	struct
423	ld	ElfProgBytes64	struct
424	ld	ElfSymBytes64	struct
425	ld	ElfSect	struct
426	ld	ElfObj	struct
427	ld	ElfSym	struct
428	ld	Arch	struct
429	ld	Segment	struct
430	ld	Section	struct
431	ld	Hostobj	struct
432	ld	SymbolType	int8
433	ld	Symbol	struct
434	ld	Attribute	int16
435	ld	Reloc	struct
436	ld	Auto	struct
437	ld	Shlib	struct
438	ld	Link	struct
439	ld	Library	struct
440	ld	FuncInfo	struct
441	ld	InlinedCall	struct
442	ld	Pcdata	struct
443	ld	Pciter	struct
444	ld	RelocVariant	uint8
445	ld	MachoHdr	struct
446	ld	MachoSect	struct
447	ld	MachoSeg	struct
448	ld	MachoLoad	struct
449	ld	Rpath	struct
450	ld	IMAGE_FILE_HEADER	struct
451	ld	IMAGE_DATA_DIRECTORY	struct
452	ld	IMAGE_OPTIONAL_HEADER	struct
453	ld	IMAGE_SECTION_HEADER	struct
454	ld	IMAGE_IMPORT_DESCRIPTOR	struct
455	ld	IMAGE_EXPORT_DIRECTORY	struct
456	ld	PE64_IMAGE_OPTIONAL_HEADER	struct
457	ld	Imp	struct
458	ld	Dll	struct
459	ld	Symbols	struct
460	ld	SymKind	int16
461	main	Archive	struct
462	main	Entry	struct
463	main	FileLike	
464	main	Record	struct
465	main	Range	struct
466	main	ViewerData	struct
467	main	ViewerEvent	struct
468	main	ViewerFrame	struct
469	main	NameArg	struct
470	main	SortIndexArg	struct
471	main	Arg	struct
472	driver	Options	struct
473	driver	Writer	
474	driver	FlagSet	
475	driver	Fetcher	
476	driver	Symbolizer	
477	driver	MappingSources	map[string][]
478	driver	ObjTool	
479	driver	Inst	struct
480	driver	ObjFile	
481	driver	Frame	struct
482	driver	Sym	struct
483	driver	UI	
484	binutils	Binutils	struct
485	driver	PostProcessor	func(io.Reader, io.Writer, plugin.UI) error
486	graph	DotAttributes	struct
487	graph	DotNodeAttributes	struct
488	graph	DotConfig	struct
489	graph	Graph	struct
490	graph	Options	struct
491	graph	Nodes	[]*graph.Node
492	graph	Node	struct
493	graph	NodeInfo	struct
494	graph	NodeMap	map[graph.NodeInfo]*graph.Node
495	graph	NodeSet	map[graph.NodeInfo]bool
496	graph	NodePtrSet	map[*graph.Node]bool
497	graph	EdgeMap	map[*graph.Node]*graph.Edge
498	graph	Edge	struct
499	graph	Tag	struct
500	graph	TagMap	map[string]*graph.Tag
501	graph	NodeOrder	int
502	plugin	Options	struct
503	plugin	Writer	
504	plugin	FlagSet	
505	plugin	Fetcher	
506	plugin	Symbolizer	
507	plugin	MappingSources	map[string][]
508	plugin	ObjTool	
509	plugin	Inst	struct
510	plugin	ObjFile	
511	plugin	Frame	struct
512	plugin	Sym	struct
513	plugin	UI	
514	proftest	TestUI	struct
515	report	Options	struct
516	report	Report	struct
517	symbolizer	Symbolizer	struct
518	profile	TagMatch	func(*profile.Sample) bool
519	profile	Profile	struct
520	profile	ValueType	struct
521	profile	Sample	struct
522	profile	Mapping	struct
523	profile	Location	struct
524	profile	Line	struct
525	profile	Function	struct
526	demangle	AST	
527	demangle	Name	struct
528	demangle	Typed	struct
529	demangle	Qualified	struct
530	demangle	Template	struct
531	demangle	TemplateParam	struct
532	demangle	Qualifiers	[]string
533	demangle	TypeWithQualifiers	struct
534	demangle	MethodWithQualifiers	struct
535	demangle	BuiltinType	struct
536	demangle	PointerType	struct
537	demangle	ReferenceType	struct
538	demangle	RvalueReferenceType	struct
539	demangle	ComplexType	struct
540	demangle	ImaginaryType	struct
541	demangle	VendorQualifier	struct
542	demangle	ArrayType	struct
543	demangle	FunctionType	struct
544	demangle	FunctionParam	struct
545	demangle	PtrMem	struct
546	demangle	FixedType	struct
547	demangle	VectorType	struct
548	demangle	Decltype	struct
549	demangle	Operator	struct
550	demangle	Constructor	struct
551	demangle	Destructor	struct
552	demangle	GlobalCDtor	struct
553	demangle	TaggedName	struct
554	demangle	PackExpansion	struct
555	demangle	ArgumentPack	struct
556	demangle	SizeofPack	struct
557	demangle	SizeofArgs	struct
558	demangle	Cast	struct
559	demangle	Nullary	struct
560	demangle	Unary	struct
561	demangle	Binary	struct
562	demangle	Trinary	struct
563	demangle	Fold	struct
564	demangle	New	struct
565	demangle	Literal	struct
566	demangle	ExprList	struct
567	demangle	InitializerList	struct
568	demangle	DefaultArg	struct
569	demangle	Closure	struct
570	demangle	UnnamedType	struct
571	demangle	Clone	struct
572	demangle	Special	struct
573	demangle	Special2	struct
574	demangle	Option	int
575	armasm	Mode	int
576	armasm	Op	uint16
577	armasm	Inst	struct
578	armasm	Args	[]armasm.Arg
579	armasm	Arg	
580	armasm	Float32Imm	float32
581	armasm	Float64Imm	float32
582	armasm	Imm	uint32
583	armasm	ImmAlt	struct
584	armasm	Label	uint32
585	armasm	Reg	uint8
586	armasm	RegX	struct
587	armasm	RegList	uint16
588	armasm	Endian	uint8
589	armasm	Shift	uint8
590	armasm	RegShift	struct
591	armasm	RegShiftReg	struct
592	armasm	PCRel	int32
593	armasm	AddrMode	uint8
594	armasm	Mem	struct
595	ppc64asm	ArgType	int8
596	ppc64asm	BitField	struct
597	ppc64asm	BitFields	[]ppc64asm.BitField
598	ppc64asm	Inst	struct
599	ppc64asm	Op	uint16
600	ppc64asm	Arg	
601	ppc64asm	Args	[]ppc64asm.Arg
602	ppc64asm	Reg	uint16
603	ppc64asm	CondReg	int8
604	ppc64asm	SpReg	uint16
605	ppc64asm	PCRel	int32
606	ppc64asm	Label	uint32
607	ppc64asm	Imm	int32
608	ppc64asm	Offset	int32
609	x86asm	Inst	struct
610	x86asm	Prefixes	[]x86asm.Prefix
611	x86asm	Prefix	uint16
612	x86asm	Op	uint32
613	x86asm	Args	[]x86asm.Arg
614	x86asm	Arg	
615	x86asm	Reg	uint8
616	x86asm	Mem	struct
617	x86asm	Rel	int32
618	x86asm	Imm	int64
619	cfg	CFG	struct
620	cfg	Block	struct
621	main	File	struct
622	main	Package	struct
623	main	MethodSig	struct
624	main	Span	struct
625	testdata	S	struct
626	testdata	ST	struct
627	testdata	Counter	uint64
628	testdata	MyStruct	struct
629	testdata	Tlock	struct
630	testdata	EmbeddedRWMutex	struct
631	testdata	FieldMutex	struct
632	testdata	L0	struct
633	testdata	L1	struct
634	testdata	L2	struct
635	testdata	EmbeddedMutexPointer	struct
636	testdata	EmbeddedLocker	struct
637	testdata	CustomLock	struct
638	testdata	LocalOnce	sync.Once
639	testdata	LocalMutex	sync.Mutex
640	testdata	T	int
641	buf	Buf	[]byte
642	testdata	MethodTest	int
643	testdata	MethodTestInterface	
644	testdata	T	struct
645	testdata	Formatter	bool
646	testdata	FormatterVal	bool
647	testdata	RecursiveSlice	[]testdata.RecursiveSlice
648	testdata	RecursiveMap	map[int]testdata.RecursiveMap
649	testdata	RecursiveStruct	struct
650	testdata	RecursiveStruct1	struct
651	testdata	RecursiveStruct2	struct
652	testdata	T	struct
653	testdata	StructTagTest	struct
654	testdata	UnexportedEncodingTagTest	struct
655	testdata	JSONEmbeddedField	struct
656	testdata	AnonymousJSON	struct
657	testdata	AnonymousXML	struct
658	testdata	DuplicateJSONFields	struct
659	testdata	V	
660	testdata	StringHeader	struct
661	testdata	SliceHeader	struct
662	bzip2	StructuralError	string
663	flate	Writer	struct
664	flate	CorruptInputError	int64
665	flate	InternalError	string
666	flate	ReadError	struct
667	flate	WriteError	struct
668	flate	Resetter	
669	flate	Reader	
670	gzip	Header	struct
671	gzip	Reader	struct
672	gzip	Writer	struct
673	lzw	Order	int
674	zlib	Resetter	
675	zlib	Writer	struct
676	heap	Interface	
677	list	Element	struct
678	list	List	struct
679	ring	Ring	struct
680	context	Context	
681	context	CancelFunc	func()
682	aes	KeySizeError	int
683	cipher	Block	
684	cipher	Stream	
685	cipher	BlockMode	
686	cipher	AEAD	
687	cipher	StreamReader	struct
688	cipher	StreamWriter	struct
689	crypto	Hash	uint
690	crypto	PublicKey	interface{}
691	crypto	PrivateKey	interface{}
692	crypto	Signer	
693	crypto	SignerOpts	
694	crypto	Decrypter	
695	crypto	DecrypterOpts	interface{}
696	des	KeySizeError	int
697	dsa	Parameters	struct
698	dsa	PublicKey	struct
699	dsa	PrivateKey	struct
700	dsa	ParameterSizes	int
701	ecdsa	PublicKey	struct
702	ecdsa	PrivateKey	struct
703	elliptic	Curve	
704	elliptic	CurveParams	struct
705	main	Data	struct
706	rc4	Cipher	struct
707	rc4	KeySizeError	int
708	rsa	PKCS1v15DecryptOptions	struct
709	rsa	PSSOptions	struct
710	rsa	PublicKey	struct
711	rsa	OAEPOptions	struct
712	rsa	PrivateKey	struct
713	rsa	PrecomputedValues	struct
714	rsa	CRTValue	struct
715	tls	CurveID	uint16
716	tls	ConnectionState	struct
717	tls	ClientAuthType	int
718	tls	ClientSessionState	struct
719	tls	ClientSessionCache	
720	tls	SignatureScheme	uint16
721	tls	ClientHelloInfo	struct
722	tls	CertificateRequestInfo	struct
723	tls	RenegotiationSupport	int
724	tls	Config	struct
725	tls	Certificate	struct
726	tls	Conn	struct
727	tls	RecordHeaderError	struct
728	x509	CertPool	struct
729	x509	PEMCipher	int
730	pkix	AlgorithmIdentifier	struct
731	pkix	RDNSequence	[]pkix.RelativeDistinguishedNameSET
732	pkix	RelativeDistinguishedNameSET	[]pkix.AttributeTypeAndValue
733	pkix	AttributeTypeAndValue	struct
734	pkix	AttributeTypeAndValueSET	struct
735	pkix	Extension	struct
736	pkix	Name	struct
737	pkix	CertificateList	struct
738	pkix	TBSCertificateList	struct
739	pkix	RevokedCertificate	struct
740	x509	InvalidReason	int
741	x509	CertificateInvalidError	struct
742	x509	HostnameError	struct
743	x509	UnknownAuthorityError	struct
744	x509	SystemRootsError	struct
745	x509	VerifyOptions	struct
746	x509	SignatureAlgorithm	int
747	x509	PublicKeyAlgorithm	int
748	x509	KeyUsage	int
749	x509	ExtKeyUsage	int
750	x509	Certificate	struct
751	x509	InsecureAlgorithmError	x509.SignatureAlgorithm
752	x509	ConstraintViolationError	struct
753	x509	UnhandledCriticalExtension	struct
754	x509	CertificateRequest	struct
755	driver	Value	interface{}
756	driver	NamedValue	struct
757	driver	Driver	
758	driver	Pinger	
759	driver	Execer	
760	driver	ExecerContext	
761	driver	Queryer	
762	driver	QueryerContext	
763	driver	Conn	
764	driver	ConnPrepareContext	
765	driver	IsolationLevel	int
766	driver	TxOptions	struct
767	driver	ConnBeginTx	
768	driver	Result	
769	driver	Stmt	
770	driver	StmtExecContext	
771	driver	StmtQueryContext	
772	driver	NamedValueChecker	
773	driver	ColumnConverter	
774	driver	Rows	
775	driver	RowsNextResultSet	
776	driver	RowsColumnTypeScanType	
777	driver	RowsColumnTypeDatabaseTypeName	
778	driver	RowsColumnTypeLength	
779	driver	RowsColumnTypeNullable	
780	driver	RowsColumnTypePrecisionScale	
781	driver	Tx	
782	driver	RowsAffected	int64
783	driver	ValueConverter	
784	driver	Valuer	
785	driver	Null	struct
786	driver	NotNull	struct
787	sql	NamedArg	struct
788	sql	IsolationLevel	int
789	sql	TxOptions	struct
790	sql	RawBytes	[]byte
791	sql	NullString	struct
792	sql	NullInt64	struct
793	sql	NullFloat64	struct
794	sql	NullBool	struct
795	sql	Scanner	
796	sql	Out	struct
797	sql	DB	struct
798	sql	DBStats	struct
799	sql	Conn	struct
800	sql	Tx	struct
801	sql	Stmt	struct
802	sql	Rows	struct
803	sql	ColumnType	struct
804	sql	Row	struct
805	sql	Result	
806	dwarf	DecodeError	struct
807	dwarf	Attr	uint32
808	dwarf	Tag	uint32
809	dwarf	Entry	struct
810	dwarf	Field	struct
811	dwarf	Class	int
812	dwarf	Offset	uint32
813	dwarf	Reader	struct
814	dwarf	LineReader	struct
815	dwarf	LineEntry	struct
816	dwarf	LineFile	struct
817	dwarf	LineReaderPos	struct
818	dwarf	Data	struct
819	dwarf	Type	
820	dwarf	CommonType	struct
821	dwarf	BasicType	struct
822	dwarf	CharType	struct
823	dwarf	UcharType	struct
824	dwarf	IntType	struct
825	dwarf	UintType	struct
826	dwarf	FloatType	struct
827	dwarf	ComplexType	struct
828	dwarf	BoolType	struct
829	dwarf	AddrType	struct
830	dwarf	UnspecifiedType	struct
831	dwarf	QualType	struct
832	dwarf	ArrayType	struct
833	dwarf	VoidType	struct
834	dwarf	PtrType	struct
835	dwarf	StructType	struct
836	dwarf	StructField	struct
837	dwarf	EnumType	struct
838	dwarf	EnumValue	struct
839	dwarf	FuncType	struct
840	dwarf	DotDotDotType	struct
841	dwarf	TypedefType	struct
842	elf	Version	byte
843	elf	Class	byte
844	elf	Data	byte
845	elf	OSABI	byte
846	elf	Type	uint16
847	elf	Machine	uint16
848	elf	SectionIndex	int
849	elf	SectionType	uint32
850	elf	SectionFlag	uint32
851	elf	CompressionType	int
852	elf	ProgType	int
853	elf	ProgFlag	uint32
854	elf	DynTag	int
855	elf	DynFlag	int
856	elf	NType	int
857	elf	SymBind	int
858	elf	SymType	int
859	elf	SymVis	int
860	elf	R_X86_64	int
861	elf	R_AARCH64	int
862	elf	R_ALPHA	int
863	elf	R_ARM	int
864	elf	R_386	int
865	elf	R_MIPS	int
866	elf	R_PPC	int
867	elf	R_PPC64	int
868	elf	R_390	int
869	elf	R_SPARC	int
870	elf	Header32	struct
871	elf	Section32	struct
872	elf	Prog32	struct
873	elf	Dyn32	struct
874	elf	Chdr32	struct
875	elf	Rel32	struct
876	elf	Rela32	struct
877	elf	Sym32	struct
878	elf	Header64	struct
879	elf	Section64	struct
880	elf	Prog64	struct
881	elf	Dyn64	struct
882	elf	Chdr64	struct
883	elf	Rel64	struct
884	elf	Rela64	struct
885	elf	Sym64	struct
886	elf	FileHeader	struct
887	elf	File	struct
888	elf	SectionHeader	struct
889	elf	Section	struct
890	elf	ProgHeader	struct
891	elf	Prog	struct
892	elf	Symbol	struct
893	elf	FormatError	struct
894	elf	ImportedSymbol	struct
895	gosym	LineTable	struct
896	gosym	Sym	struct
897	gosym	Func	struct
898	gosym	Obj	struct
899	gosym	Table	struct
900	gosym	UnknownFileError	string
901	gosym	UnknownLineError	struct
902	gosym	DecodingError	struct
903	macho	FatFile	struct
904	macho	FatArchHeader	struct
905	macho	FatArch	struct
906	macho	File	struct
907	macho	Load	
908	macho	LoadBytes	[]byte
909	macho	SegmentHeader	struct
910	macho	Segment	struct
911	macho	SectionHeader	struct
912	macho	Section	struct
913	macho	Dylib	struct
914	macho	Symtab	struct
915	macho	Dysymtab	struct
916	macho	FormatError	struct
917	macho	FileHeader	struct
918	macho	Type	uint32
919	macho	Cpu	uint32
920	macho	LoadCmd	uint32
921	macho	Segment64	struct
922	macho	Segment32	struct
923	macho	DylibCmd	struct
924	macho	Section32	struct
925	macho	Section64	struct
926	macho	SymtabCmd	struct
927	macho	DysymtabCmd	struct
928	macho	Nlist32	struct
929	macho	Nlist64	struct
930	macho	Symbol	struct
931	macho	Thread	struct
932	macho	Regs386	struct
933	macho	RegsAMD64	struct
934	pe	File	struct
935	pe	ImportDirectory	struct
936	pe	FormatError	struct
937	pe	FileHeader	struct
938	pe	DataDirectory	struct
939	pe	OptionalHeader32	struct
940	pe	OptionalHeader64	struct
941	pe	SectionHeader32	struct
942	pe	Reloc	struct
943	pe	SectionHeader	struct
944	pe	Section	struct
945	pe	StringTable	[]byte
946	pe	COFFSymbol	struct
947	pe	Symbol	struct
948	plan9obj	FileHeader	struct
949	plan9obj	File	struct
950	plan9obj	SectionHeader	struct
951	plan9obj	Section	struct
952	plan9obj	Sym	struct
953	ascii85	CorruptInputError	int64
954	asn1	StructuralError	struct
955	asn1	SyntaxError	struct
956	asn1	BitString	struct
957	asn1	ObjectIdentifier	[]int
958	asn1	Enumerated	int
959	asn1	Flag	bool
960	asn1	RawValue	struct
961	asn1	RawContent	[]byte
962	base32	Encoding	struct
963	base32	CorruptInputError	int64
964	base64	Encoding	struct
965	base64	CorruptInputError	int64
966	binary	ByteOrder	
967	csv	ParseError	struct
968	csv	Reader	struct
969	csv	Writer	struct
970	encoding	BinaryMarshaler	
971	encoding	BinaryUnmarshaler	
972	encoding	TextMarshaler	
973	encoding	TextUnmarshaler	
974	main	Type	struct
975	gob	Decoder	struct
976	main	Type	struct
977	gob	Encoder	struct
978	gob	CommonType	struct
979	gob	GobEncoder	
980	gob	GobDecoder	
981	hex	InvalidByteError	byte
982	json	Unmarshaler	
983	json	UnmarshalTypeError	struct
984	json	UnmarshalFieldError	struct
985	json	InvalidUnmarshalError	struct
986	json	Number	string
987	json	Marshaler	
988	json	UnsupportedTypeError	struct
989	json	UnsupportedValueError	struct
990	json	InvalidUTF8Error	struct
991	json	MarshalerError	struct
992	json	SyntaxError	struct
993	json	Decoder	struct
994	json	Encoder	struct
995	json	RawMessage	[]byte
996	json	Token	interface{}
997	json	Delim	rune
998	pem	Block	struct
999	xml	Marshaler	
1000	xml	MarshalerAttr	
1001	xml	Encoder	struct
1002	xml	UnsupportedTypeError	struct
1003	xml	UnmarshalError	string
1004	xml	Unmarshaler	
1005	xml	UnmarshalerAttr	
1006	xml	TagPathError	struct
1007	xml	SyntaxError	struct
1008	xml	Name	struct
1009	xml	Attr	struct
1010	xml	Token	interface{}
1011	xml	StartElement	struct
1012	xml	EndElement	struct
1013	xml	CharData	[]byte
1014	xml	Comment	[]byte
1015	xml	ProcInst	struct
1016	xml	Directive	[]byte
1017	xml	Decoder	struct
1018	expvar	Var	
1019	expvar	Int	struct
1020	expvar	Float	struct
1021	expvar	Map	struct
1022	expvar	KeyValue	struct
1023	expvar	String	struct
1024	expvar	Func	func() interface{}
1025	flag	Value	
1026	flag	Getter	
1027	flag	ErrorHandling	int
1028	flag	FlagSet	struct
1029	flag	Flag	struct
1030	fmt	State	
1031	fmt	Formatter	
1032	fmt	Stringer	
1033	fmt	GoStringer	
1034	fmt	ScanState	
1035	fmt	Scanner	
1036	ast	Node	
1037	ast	Expr	
1038	ast	Stmt	
1039	ast	Decl	
1040	ast	Comment	struct
1041	ast	CommentGroup	struct
1042	ast	Field	struct
1043	ast	FieldList	struct
1044	ast	BadExpr	struct
1045	ast	Ident	struct
1046	ast	Ellipsis	struct
1047	ast	BasicLit	struct
1048	ast	FuncLit	struct
1049	ast	CompositeLit	struct
1050	ast	ParenExpr	struct
1051	ast	SelectorExpr	struct
1052	ast	IndexExpr	struct
1053	ast	SliceExpr	struct
1054	ast	TypeAssertExpr	struct
1055	ast	CallExpr	struct
1056	ast	StarExpr	struct
1057	ast	UnaryExpr	struct
1058	ast	BinaryExpr	struct
1059	ast	KeyValueExpr	struct
1060	ast	ChanDir	int
1061	ast	ArrayType	struct
1062	ast	StructType	struct
1063	ast	FuncType	struct
1064	ast	InterfaceType	struct
1065	ast	MapType	struct
1066	ast	ChanType	struct
1067	ast	BadStmt	struct
1068	ast	DeclStmt	struct
1069	ast	EmptyStmt	struct
1070	ast	LabeledStmt	struct
1071	ast	ExprStmt	struct
1072	ast	SendStmt	struct
1073	ast	IncDecStmt	struct
1074	ast	AssignStmt	struct
1075	ast	GoStmt	struct
1076	ast	DeferStmt	struct
1077	ast	ReturnStmt	struct
1078	ast	BranchStmt	struct
1079	ast	BlockStmt	struct
1080	ast	IfStmt	struct
1081	ast	CaseClause	struct
1082	ast	SwitchStmt	struct
1083	ast	TypeSwitchStmt	struct
1084	ast	CommClause	struct
1085	ast	SelectStmt	struct
1086	ast	ForStmt	struct
1087	ast	RangeStmt	struct
1088	ast	Spec	
1089	ast	ImportSpec	struct
1090	ast	ValueSpec	struct
1091	ast	TypeSpec	struct
1092	ast	BadDecl	struct
1093	ast	GenDecl	struct
1094	ast	FuncDecl	struct
1095	ast	File	struct
1096	ast	Package	struct
1097	ast	CommentMap	map[ast.Node][]*ast.CommentGroup
1098	ast	Filter	func(string) bool
1099	ast	MergeMode	uint
1100	ast	FieldFilter	func(string, reflect.Value) bool
1101	ast	Importer	func(map[string]*ast.Object, string) (*ast.Object, error)
1102	ast	Scope	struct
1103	ast	Object	struct
1104	ast	ObjKind	int
1105	ast	Visitor	
1106	build	Context	struct
1107	build	ImportMode	uint
1108	build	Package	struct
1109	build	NoGoError	struct
1110	build	MultiplePackageError	struct
1111	constant	Kind	int
1112	constant	Value	
1113	doc	Package	struct
1114	doc	Value	struct
1115	doc	Type	struct
1116	doc	Func	struct
1117	doc	Note	struct
1118	doc	Mode	int
1119	doc	Example	struct
1120	doc	Filter	func(string) bool
1121	b	T	struct
1122	testing	InternalBenchmark	struct
1123	testing	B	struct
1124	testing	BenchmarkResult	struct
1125	blank	T	int
1126	blank	S	struct
1127	c	A	struct
1128	c	B	struct
1129	c	C	struct
1130	c	D	struct
1131	c	E1	struct
1132	c	E2	struct
1133	c	E3	struct
1134	c	E4	struct
1135	c	T1	struct
1136	c	T2	struct
1137	d	T2	struct
1138	d	TG2	struct
1139	d	TG1	struct
1140	d	TG0	struct
1141	d	T1	struct
1142	d	T0	struct
1143	e	T1	struct
1144	e	T2	struct
1145	e	T3	struct
1146	e	T4	struct
1147	e	T4	struct
1148	e	T5	struct
1149	e	U1	struct
1150	e	U2	struct
1151	e	U3	struct
1152	e	U4	struct
1153	e	V1	struct
1154	e	V2	struct
1155	e	V3	struct
1156	e	V4	struct
1157	e	V5	struct
1158	e	V6	struct
1159	error1	I0	
1160	error1	T0	struct
1161	error1	S0	struct
1162	error2	I0	
1163	error2	T0	struct
1164	error2	S0	struct
1165	testing	InternalExample	struct
1166	testing	T	struct
1167	testing	InternalTest	struct
1168	importer	Lookup	func(string) (io.ReadCloser, error)
1169	gccgoimporter	GccgoInstallation	struct
1170	gccgoimporter	PackageInit	struct
1171	gccgoimporter	InitData	struct
1172	gccgoimporter	Importer	func(map[string]*types.Package, string) (*types.Package, error)
1173	conversions	Units	string
1174	pointer	Int8Ptr	*int8
1175	a	A	struct
1176	b	A	a.A
1177	exports	T1	int
1178	exports	T2	[]int
1179	exports	T3	[]int
1180	exports	T4	*int
1181	exports	T5	chan int\n
1182	exports	T6a	chan int\n
1183	exports	T6b	chan (chan int\n)\n
1184	exports	T6c	chan (chan int\n)\n
1185	exports	T7	chan *ast.File\n
1186	exports	T8	struct
1187	exports	T9	struct
1188	exports	T10	struct
1189	exports	T11	map[int]string
1190	exports	T12	interface{}
1191	exports	T13	
1192	exports	T14	
1193	exports	T15	func()
1194	exports	T16	func(int)
1195	exports	T17	func(int)
1196	exports	T18	func() float32
1197	exports	T19	func() float32
1198	exports	T20	func(...interface{})
1199	exports	T21	struct
1200	exports	T22	struct
1201	exports	T23	struct
1202	exports	T24	*exports.T24
1203	exports	T25	*exports.T26
1204	exports	T26	*exports.T27
1205	exports	T27	*exports.T25
1206	exports	T28	func(exports.T28) exports.T28
1207	p	Error	error
1208	test	BlankField	struct
1209	srcimporter	Importer	struct
1210	parser	Mode	uint
1211	printer	Mode	uint
1212	printer	Config	struct
1213	printer	CommentedNode	struct
1214	scanner	Error	struct
1215	scanner	ErrorList	[]*scanner.Error
1216	scanner	ErrorHandler	func(token.Position, string)
1217	scanner	Scanner	struct
1218	scanner	Mode	uint
1219	token	Position	struct
1220	token	Pos	int
1221	token	File	struct
1222	token	FileSet	struct
1223	token	Token	int
1224	types	Error	struct
1225	types	Importer	
1226	types	ImportMode	int
1227	types	ImporterFrom	
1228	types	Config	struct
1229	types	Info	struct
1230	types	TypeAndValue	struct
1231	types	Initializer	struct
1232	types	Checker	struct
1233	types	MethodSet	struct
1234	types	Object	
1235	types	PkgName	struct
1236	types	Const	struct
1237	types	TypeName	struct
1238	types	Var	struct
1239	types	Func	struct
1240	types	Label	struct
1241	types	Builtin	struct
1242	types	Nil	struct
1243	types	Package	struct
1244	types	Scope	struct
1245	types	SelectionKind	int
1246	types	Selection	struct
1247	types	Sizes	
1248	types	StdSizes	struct
1249	types	Type	
1250	types	BasicKind	int
1251	types	BasicInfo	int
1252	types	Basic	struct
1253	types	Array	struct
1254	types	Slice	struct
1255	types	Struct	struct
1256	types	Pointer	struct
1257	types	Tuple	struct
1258	types	Signature	struct
1259	types	Interface	struct
1260	types	Map	struct
1261	types	Chan	struct
1262	types	ChanDir	int
1263	types	Named	struct
1264	types	Qualifier	func(*types.Package) string
1265	crc32	Table	[]uint32
1266	crc64	Table	[]uint64
1267	hash	Hash	
1268	hash	Hash32	
1269	hash	Hash64	
1270	template	CSS	string
1271	template	HTML	string
1272	template	HTMLAttr	string
1273	template	JS	string
1274	template	JSStr	string
1275	template	URL	string
1276	template	Error	struct
1277	template	ErrorCode	int
1278	template	Template	struct
1279	template	FuncMap	map[string]interface{}
1280	color	Color	
1281	color	RGBA	struct
1282	color	RGBA64	struct
1283	color	NRGBA	struct
1284	color	NRGBA64	struct
1285	color	Alpha	struct
1286	color	Alpha16	struct
1287	color	Gray	struct
1288	color	Gray16	struct
1289	color	Model	
1290	color	Palette	[]color.Color
1291	color	YCbCr	struct
1292	color	NYCbCrA	struct
1293	color	CMYK	struct
1294	draw	Image	
1295	draw	Quantizer	
1296	draw	Op	int
1297	draw	Drawer	
1298	image	Point	struct
1299	image	Rectangle	struct
1300	gif	GIF	struct
1301	gif	Options	struct
1302	image	Config	struct
1303	image	Image	
1304	image	PalettedImage	
1305	image	RGBA	struct
1306	image	RGBA64	struct
1307	image	NRGBA	struct
1308	image	NRGBA64	struct
1309	image	Alpha	struct
1310	image	Alpha16	struct
1311	image	Gray	struct
1312	image	Gray16	struct
1313	image	CMYK	struct
1314	image	Paletted	struct
1315	jpeg	FormatError	string
1316	jpeg	UnsupportedError	string
1317	jpeg	Reader	
1318	jpeg	Options	struct
1319	image	Uniform	struct
1320	png	FormatError	string
1321	png	UnsupportedError	string
1322	png	Encoder	struct
1323	png	EncoderBufferPool	
1324	png	EncoderBuffer	png.encoder
1325	png	CompressionLevel	int
1326	image	YCbCrSubsampleRatio	int
1327	image	YCbCr	struct
1328	image	NYCbCrA	struct
1329	suffixarray	Index	struct
1330	nettrace	TraceKey	struct
1331	nettrace	LookupIPAltResolverKey	struct
1332	nettrace	Trace	struct
1333	poll	TimeoutError	struct
1334	poll	FD	struct
1335	poll	FD	struct
1336	poll	FD	struct
1337	singleflight	Group	struct
1338	singleflight	Result	struct
1339	unix	GetRandomFlag	uintptr
1340	registry	Key	syscall.Handle
1341	registry	KeyInfo	struct
1342	windows	REPARSE_DATA_BUFFER_HEADER	struct
1343	windows	SymbolicLinkReparseBuffer	struct
1344	windows	MountPointReparseBuffer	struct
1345	windows	LUID	struct
1346	windows	LUID_AND_ATTRIBUTES	struct
1347	windows	TOKEN_PRIVILEGES	struct
1348	windows	SocketAddress	struct
1349	windows	IpAdapterUnicastAddress	struct
1350	windows	IpAdapterAnycastAddress	struct
1351	windows	IpAdapterMulticastAddress	struct
1352	windows	IpAdapterDnsServerAdapter	struct
1353	windows	IpAdapterPrefix	struct
1354	windows	IpAdapterAddresses	struct
1355	windows	SHARE_INFO_2	struct
1356	trace	GDesc	struct
1357	trace	Event	struct
1358	trace	Frame	struct
1359	trace	G	struct
1360	trace	Writer	struct
1361	io	Reader	
1362	io	Writer	
1363	io	Closer	
1364	io	Seeker	
1365	io	ReadWriter	
1366	io	ReadCloser	
1367	io	WriteCloser	
1368	io	ReadWriteCloser	
1369	io	ReadSeeker	
1370	io	WriteSeeker	
1371	io	ReadWriteSeeker	
1372	io	ReaderFrom	
1373	io	WriterTo	
1374	io	ReaderAt	
1375	io	WriterAt	
1376	io	ByteReader	
1377	io	ByteScanner	
1378	io	ByteWriter	
1379	io	RuneReader	
1380	io	RuneScanner	
1381	io	LimitedReader	struct
1382	io	SectionReader	struct
1383	io	PipeReader	struct
1384	io	PipeWriter	struct
1385	log	Logger	struct
1386	syslog	Priority	int
1387	syslog	Writer	struct
1388	big	Word	uint
1389	big	Float	struct
1390	big	ErrNaN	struct
1391	big	RoundingMode	byte
1392	big	Accuracy	int8
1393	big	Int	struct
1394	big	Rat	struct
1395	rand	Source	
1396	rand	Source64	
1397	rand	Rand	struct
1398	rand	Zipf	struct
1399	mime	WordEncoder	byte
1400	mime	WordDecoder	struct
1401	multipart	Form	struct
1402	multipart	FileHeader	struct
1403	multipart	File	
1404	multipart	Part	struct
1405	multipart	Reader	struct
1406	multipart	Writer	struct
1407	quotedprintable	Reader	struct
1408	quotedprintable	Writer	struct
1409	net	Dialer	struct
1410	net	SRV	struct
1411	net	MX	struct
1412	net	NS	struct
1413	cgi	Handler	struct
1414	http	Client	struct
1415	http	RoundTripper	
1416	http	Cookie	struct
1417	cookiejar	PublicSuffixList	
1418	cookiejar	Options	struct
1419	cookiejar	Jar	struct
1420	http	Dir	string
1421	http	FileSystem	
1422	http	File	
1423	http	I	
1424	http	Header	map[string][]string
1425	http	PushOptions	struct
1426	http	Pusher	
1427	httptest	ResponseRecorder	struct
1428	httptest	Server	struct
1429	httptrace	ClientTrace	struct
1430	httptrace	WroteRequestInfo	struct
1431	httptrace	DNSStartInfo	struct
1432	httptrace	DNSDoneInfo	struct
1433	httptrace	GotConnInfo	struct
1434	httputil	ServerConn	struct
1435	httputil	ClientConn	struct
1436	httputil	ReverseProxy	struct
1437	httputil	BufferPool	
1438	internal	FlushAfterChunkWriter	struct
1439	http	CookieJar	
1440	http	ProtocolError	struct
1441	http	Request	struct
1442	http	Response	struct
1443	http	Handler	
1444	http	ResponseWriter	
1445	http	Flusher	
1446	http	Hijacker	
1447	http	CloseNotifier	
1448	http	HandlerFunc	func(http.ResponseWriter, *http.Request)
1449	http	ServeMux	struct
1450	http	Server	struct
1451	http	ConnState	int
1452	http	Transport	struct
1453	main	Counter	struct
1454	main	Chan	chan int\n
1455	net	Interface	struct
1456	net	Flags	uint
1457	socktest	Switch	struct
1458	socktest	Cookie	uint64
1459	socktest	Status	struct
1460	socktest	Stat	struct
1461	socktest	FilterType	int
1462	socktest	Filter	func(*socktest.Status) (socktest.AfterFilter, error)
1463	socktest	AfterFilter	func(*socktest.Status) error
1464	socktest	Sockets	map[int]socktest.Status
1465	socktest	Sockets	map[int]socktest.Status
1466	socktest	Sockets	map[syscall.Handle]socktest.Status
1467	net	IP	[]byte
1468	net	IPMask	[]byte
1469	net	IPNet	struct
1470	net	IPAddr	struct
1471	net	IPConn	struct
1472	net	Resolver	struct
1473	net	HardwareAddr	[]byte
1474	mail	Message	struct
1475	mail	Header	map[string][]string
1476	mail	Address	struct
1477	mail	AddressParser	struct
1478	net	Addr	
1479	net	Conn	
1480	net	PacketConn	
1481	net	Listener	
1482	net	Error	
1483	net	OpError	struct
1484	net	ParseError	struct
1485	net	AddrError	struct
1486	net	UnknownNetworkError	string
1487	net	InvalidAddrError	string
1488	net	DNSConfigError	struct
1489	net	DNSError	struct
1490	net	Buffers	[][]byte
1491	rpc	ServerError	string
1492	rpc	Call	struct
1493	rpc	Client	struct
1494	rpc	ClientCodec	
1495	rpc	Request	struct
1496	rpc	Response	struct
1497	rpc	Server	struct
1498	rpc	ServerCodec	
1499	smtp	Auth	
1500	smtp	ServerInfo	struct
1501	smtp	Client	struct
1502	net	TCPAddr	struct
1503	net	TCPConn	struct
1504	net	TCPListener	struct
1505	textproto	MIMEHeader	map[string][]string
1506	textproto	Pipeline	struct
1507	textproto	Reader	struct
1508	textproto	Error	struct
1509	textproto	ProtocolError	string
1510	textproto	Conn	struct
1511	textproto	Writer	struct
1512	net	UDPAddr	struct
1513	net	UDPConn	struct
1514	net	UnixAddr	struct
1515	net	UnixConn	struct
1516	net	UnixListener	struct
1517	url	Error	struct
1518	url	EscapeError	string
1519	url	InvalidHostError	string
1520	url	URL	struct
1521	url	Userinfo	struct
1522	url	Values	map[string][]string
1523	os	PathError	struct
1524	os	SyscallError	struct
1525	exec	Error	struct
1526	exec	Cmd	struct
1527	exec	F	func(*exec.Cmd) (*os.File, error)
1528	exec	ExitError	struct
1529	os	Process	struct
1530	os	ProcAttr	struct
1531	os	Signal	
1532	os	ProcessState	struct
1533	os	ProcessState	struct
1534	os	LinkError	struct
1535	os	File	struct
1536	os	FileInfo	
1537	os	FileMode	uint32
1538	user	User	struct
1539	user	Group	struct
1540	user	UnknownUserIdError	int
1541	user	UnknownUserError	string
1542	user	UnknownGroupIdError	string
1543	user	UnknownGroupError	string
1544	filepath	WalkFunc	func(string, os.FileInfo, error) error
1545	plugin	Plugin	struct
1546	plugin	Symbol	interface{}
1547	reflect	Type	
1548	reflect	Kind	uint
1549	reflect	ChanDir	int
1550	reflect	Method	struct
1551	reflect	StructField	struct
1552	reflect	StructTag	string
1553	reflect	Value	struct
1554	reflect	ValueError	struct
1555	reflect	StringHeader	struct
1556	reflect	SliceHeader	struct
1557	reflect	SelectDir	int
1558	reflect	SelectCase	struct
1559	regexp	Regexp	struct
1560	syntax	Error	struct
1561	syntax	ErrorCode	string
1562	syntax	Flags	uint16
1563	syntax	Prog	struct
1564	syntax	InstOp	uint8
1565	syntax	EmptyOp	uint8
1566	syntax	Inst	struct
1567	syntax	Regexp	struct
1568	syntax	Op	uint8
1569	debug	GCStats	struct
1570	runtime	Usigset	C.__sigset_t
1571	runtime	Fpxreg	C.struct__libc_fpxreg
1572	runtime	Xmmreg	C.struct__libc_xmmreg
1573	runtime	Fpstate	C.struct__libc_fpstate
1574	runtime	Fpxreg1	C.struct__fpxreg
1575	runtime	Xmmreg1	C.struct__xmmreg
1576	runtime	Fpstate1	C.struct__fpstate
1577	runtime	Fpreg1	C.struct__fpreg
1578	runtime	StackT	C.stack_t
1579	runtime	Mcontext	C.mcontext_t
1580	runtime	Ucontext	C.ucontext_t
1581	runtime	Sigcontext	C.struct_sigcontext
1582	runtime	Fpreg	C.struct__fpreg
1583	runtime	Fpxreg	C.struct__fpxreg
1584	runtime	Xmmreg	C.struct__xmmreg
1585	runtime	Fpstate	C.struct__fpstate
1586	runtime	Timespec	C.struct_timespec
1587	runtime	Timeval	C.struct_timeval
1588	runtime	Sigaction	C.struct_kernel_sigaction
1589	runtime	Siginfo	C.siginfo_t
1590	runtime	StackT	C.stack_t
1591	runtime	Sigcontext	C.struct_sigcontext
1592	runtime	Ucontext	C.struct_ucontext
1593	runtime	Itimerval	C.struct_itimerval
1594	runtime	EpollEvent	C.struct_epoll_event
1595	runtime	Usigset	C.__sigset_t
1596	runtime	Ptregs	C.struct_pt_regs
1597	runtime	Gregset	C.elf_gregset_t
1598	runtime	FPregset	C.elf_fpregset_t
1599	runtime	Vreg	C.elf_vrreg_t
1600	runtime	StackT	C.stack_t
1601	runtime	Sigcontext	C.struct_sigcontext
1602	runtime	Ucontext	C.struct_ucontext
1603	runtime	Timespec	C.struct_timespec
1604	runtime	StackT	C.stack_t
1605	runtime	Sigcontext	C.struct_sigcontext
1606	runtime	Ucontext	C.struct_ucontext
1607	runtime	Timeval	C.struct_timeval
1608	runtime	Itimerval	C.struct_itimerval
1609	runtime	Siginfo	C.struct_xsiginfo
1610	runtime	Sigaction	C.struct_xsigaction
1611	runtime	MachBody	C.mach_msg_body_t
1612	runtime	MachHeader	C.mach_msg_header_t
1613	runtime	MachNDR	C.NDR_record_t
1614	runtime	MachPort	C.mach_msg_port_descriptor_t
1615	runtime	StackT	C.struct_sigaltstack
1616	runtime	Sighandler	C.union___sigaction_u
1617	runtime	Sigaction	C.struct___sigaction
1618	runtime	Usigaction	C.struct_sigaction
1619	runtime	Sigval	C.union_sigval
1620	runtime	Siginfo	C.siginfo_t
1621	runtime	Timeval	C.struct_timeval
1622	runtime	Itimerval	C.struct_itimerval
1623	runtime	Timespec	C.struct_timespec
1624	runtime	FPControl	C.struct_fp_control
1625	runtime	FPStatus	C.struct_fp_status
1626	runtime	RegMMST	C.struct_mmst_reg
1627	runtime	RegXMM	C.struct_xmm_reg
1628	runtime	Regs64	C.struct_x86_thread_state64
1629	runtime	FloatState64	C.struct_x86_float_state64
1630	runtime	ExceptionState64	C.struct_x86_exception_state64
1631	runtime	Mcontext64	C.struct_mcontext64
1632	runtime	Regs32	C.struct_i386_thread_state
1633	runtime	FloatState32	C.struct_i386_float_state
1634	runtime	ExceptionState32	C.struct_i386_exception_state
1635	runtime	Mcontext32	C.struct_mcontext32
1636	runtime	Ucontext	C.struct_ucontext
1637	runtime	Kevent	C.struct_kevent
1638	runtime	Rtprio	C.struct_rtprio
1639	runtime	Lwpparams	C.struct_lwp_params
1640	runtime	Sigset	C.struct___sigset
1641	runtime	StackT	C.stack_t
1642	runtime	Siginfo	C.siginfo_t
1643	runtime	Mcontext	C.mcontext_t
1644	runtime	Ucontext	C.ucontext_t
1645	runtime	Timespec	C.struct_timespec
1646	runtime	Timeval	C.struct_timeval
1647	runtime	Itimerval	C.struct_itimerval
1648	runtime	Kevent	C.struct_kevent
1649	runtime	Rtprio	C.struct_rtprio
1650	runtime	ThrParam	C.struct_thr_param
1651	runtime	Sigset	C.struct___sigset
1652	runtime	StackT	C.stack_t
1653	runtime	Siginfo	C.siginfo_t
1654	runtime	Mcontext	C.mcontext_t
1655	runtime	Ucontext	C.ucontext_t
1656	runtime	Timespec	C.struct_timespec
1657	runtime	Timeval	C.struct_timeval
1658	runtime	Itimerval	C.struct_itimerval
1659	runtime	Umtx_time	C.struct__umtx_time
1660	runtime	Kevent	C.struct_kevent
1661	runtime	Sigset	C.sigset_t
1662	runtime	Timespec	C.struct_timespec
1663	runtime	Timeval	C.struct_timeval
1664	runtime	Sigaction	C.struct_sigaction
1665	runtime	Siginfo	C.siginfo_t
1666	runtime	Itimerval	C.struct_itimerval
1667	runtime	EpollEvent	C.struct_epoll_event
1668	runtime	Sigset	C.sigset_t
1669	runtime	Siginfo	C.struct__ksiginfo
1670	runtime	StackT	C.stack_t
1671	runtime	Timespec	C.struct_timespec
1672	runtime	Timeval	C.struct_timeval
1673	runtime	Itimerval	C.struct_itimerval
1674	runtime	McontextT	C.mcontext_t
1675	runtime	UcontextT	C.ucontext_t
1676	runtime	Kevent	C.struct_kevent
1677	runtime	TforkT	C.struct___tfork
1678	runtime	Sigcontext	C.struct_sigcontext
1679	runtime	Siginfo	C.siginfo_t
1680	runtime	Sigset	C.sigset_t
1681	runtime	Sigval	C.union_sigval
1682	runtime	StackT	C.stack_t
1683	runtime	Timespec	C.struct_timespec
1684	runtime	Timeval	C.struct_timeval
1685	runtime	Itimerval	C.struct_itimerval
1686	runtime	KeventT	C.struct_kevent
1687	runtime	SemT	C.sem_t
1688	runtime	Sigset	C.sigset_t
1689	runtime	StackT	C.stack_t
1690	runtime	Siginfo	C.siginfo_t
1691	runtime	Sigaction	C.struct_sigaction
1692	runtime	Fpregset	C.fpregset_t
1693	runtime	Mcontext	C.mcontext_t
1694	runtime	Ucontext	C.ucontext_t
1695	runtime	Timespec	C.struct_timespec
1696	runtime	Timeval	C.struct_timeval
1697	runtime	Itimerval	C.struct_itimerval
1698	runtime	PortEvent	C.port_event_t
1699	runtime	Pthread	C.pthread_t
1700	runtime	PthreadAttr	C.pthread_attr_t
1701	runtime	Stat	C.struct_stat
1702	runtime	SystemInfo	C.SYSTEM_INFO
1703	runtime	ExceptionRecord	C.EXCEPTION_RECORD
1704	runtime	FloatingSaveArea	C.FLOATING_SAVE_AREA
1705	runtime	M128a	C.M128A
1706	runtime	Context	C.CONTEXT
1707	runtime	Overlapped	C.OVERLAPPED
1708	runtime	Error	
1709	runtime	TypeAssertionError	struct
1710	sys	ArchFamilyType	int
1711	sys	Uintreg	uint32
1712	sys	Uintreg	uint64
1713	sys	Uintreg	uint64
1714	sys	Uintreg	uint32
1715	sys	Uintreg	uint64
1716	sys	Uintreg	uint32
1717	sys	Uintreg	uint64
1718	sys	Uintreg	uint64
1719	sys	Uintreg	uint32
1720	sys	Uintreg	uint64
1721	sys	Uintreg	uint64
1722	sys	Uintreg	uint64
1723	runtime	StackRecord	struct
1724	runtime	MemProfileRecord	struct
1725	runtime	BlockProfileRecord	struct
1726	runtime	MemStats	struct
1727	profile	TagMatch	func(string, int64) bool
1728	profile	Profile	struct
1729	profile	ValueType	struct
1730	profile	Sample	struct
1731	profile	Label	struct
1732	profile	Mapping	struct
1733	profile	Location	struct
1734	profile	Line	struct
1735	profile	Function	struct
1736	profile	Demangler	func([]string) (map[string]string, error)
1737	pprof	LabelSet	struct
1738	pprof	Profile	struct
1739	runtime	Frames	struct
1740	runtime	Frame	struct
1741	runtime	Func	struct
1742	sort	Interface	
1743	sort	IntSlice	[]int
1744	sort	Float64Slice	[]float64
1745	sort	StringSlice	[]string
1746	strconv	NumError	struct
1747	strings	Reader	struct
1748	strings	Replacer	struct
1749	atomic	Value	struct
1750	sync	Cond	struct
1751	sync	Map	struct
1752	sync	Mutex	struct
1753	sync	Locker	
1754	sync	Once	struct
1755	sync	Pool	struct
1756	sync	RWMutex	struct
1757	sync	WaitGroup	struct
1758	syscall	Qid	struct
1759	syscall	Dir	struct
1760	syscall	DLLError	struct
1761	syscall	DLL	struct
1762	syscall	Proc	struct
1763	syscall	LazyDLL	struct
1764	syscall	LazyProc	struct
1765	syscall	SysProcAttr	struct
1766	syscall	SysProcIDMap	struct
1767	syscall	SysProcAttr	struct
1768	syscall	ProcAttr	struct
1769	syscall	SysProcAttr	struct
1770	syscall	SysProcAttr	struct
1771	syscall	Credential	struct
1772	syscall	ProcAttr	struct
1773	syscall	ProcAttr	struct
1774	syscall	SysProcAttr	struct
1775	main	Param	struct
1776	main	Rets	struct
1777	main	Fn	struct
1778	main	Source	struct
1779	syscall	RawConn	
1780	syscall	Conn	
1781	syscall	Sockaddr	
1782	syscall	SockaddrInet4	struct
1783	syscall	SockaddrInet6	struct
1784	syscall	SockaddrUnix	struct
1785	syscall	SockaddrDatalink	struct
1786	syscall	RoutingMessage	
1787	syscall	IPMreq	struct
1788	syscall	IPv6Mreq	struct
1789	syscall	Linger	struct
1790	syscall	ICMPv6Filter	struct
1791	syscall	NetlinkRouteRequest	struct
1792	syscall	NetlinkMessage	struct
1793	syscall	NetlinkRouteAttr	struct
1794	syscall	RoutingMessage	
1795	syscall	RouteMessage	struct
1796	syscall	InterfaceMessage	struct
1797	syscall	InterfaceAddrMessage	struct
1798	syscall	InterfaceMulticastAddrMessage	struct
1799	syscall	InterfaceAnnounceMessage	struct
1800	syscall	InterfaceMulticastAddrMessage	struct
1801	syscall	InterfaceAnnounceMessage	struct
1802	syscall	InterfaceMulticastAddrMessage	struct
1803	syscall	InterfaceAnnounceMessage	struct
1804	syscall	InterfaceAnnounceMessage	struct
1805	syscall	UserInfo10	struct
1806	syscall	SID	struct
1807	syscall	SIDAndAttributes	struct
1808	syscall	Tokenuser	struct
1809	syscall	Tokenprimarygroup	struct
1810	syscall	Token	syscall.Handle
1811	syscall	SocketControlMessage	struct
1812	syscall	WaitStatus	uint32
1813	syscall	SockaddrDatalink	struct
1814	syscall	SockaddrDatalink	struct
1815	syscall	SockaddrDatalink	struct
1816	syscall	WaitStatus	uint32
1817	syscall	SockaddrLinklayer	struct
1818	syscall	SockaddrNetlink	struct
1819	syscall	Dirent	struct
1820	syscall	Errno	uintptr
1821	syscall	Signal	int
1822	syscall	Stat_t	struct
1823	syscall	WaitStatus	uint32
1824	syscall	Rusage	struct
1825	syscall	ProcAttr	struct
1826	syscall	SysProcAttr	struct
1827	syscall	Iovec	struct
1828	syscall	Timespec	struct
1829	syscall	Timeval	struct
1830	syscall	Timespec	struct
1831	syscall	Timeval	struct
1832	syscall	Timespec	struct
1833	syscall	Timeval	struct
1834	syscall	SockaddrDatalink	struct
1835	syscall	SockaddrDatalink	struct
1836	syscall	ErrorString	string
1837	syscall	Note	string
1838	syscall	Waitmsg	struct
1839	syscall	Timespec	struct
1840	syscall	Timeval	struct
1841	syscall	SockaddrDatalink	struct
1842	syscall	WaitStatus	uint32
1843	syscall	Errno	uintptr
1844	syscall	Signal	int
1845	syscall	Sockaddr	
1846	syscall	SockaddrInet4	struct
1847	syscall	SockaddrInet6	struct
1848	syscall	SockaddrUnix	struct
1849	syscall	Handle	uintptr
1850	syscall	Errno	uintptr
1851	syscall	RawSockaddrInet4	struct
1852	syscall	RawSockaddrInet6	struct
1853	syscall	RawSockaddr	struct
1854	syscall	RawSockaddrAny	struct
1855	syscall	Sockaddr	
1856	syscall	SockaddrInet4	struct
1857	syscall	SockaddrInet6	struct
1858	syscall	SockaddrUnix	struct
1859	syscall	Rusage	struct
1860	syscall	WaitStatus	struct
1861	syscall	Timespec	struct
1862	syscall	Linger	struct
1863	syscall	IPMreq	struct
1864	syscall	IPv6Mreq	struct
1865	syscall	Signal	int
1866	syscall	Timespec	C.struct_timespec
1867	syscall	Timeval	C.struct_timeval
1868	syscall	Timeval32	C.struct_timeval32
1869	syscall	Rusage	C.struct_rusage
1870	syscall	Rlimit	C.struct_rlimit
1871	syscall	Stat_t	C.struct_stat64
1872	syscall	Statfs_t	C.struct_statfs64
1873	syscall	Flock_t	C.struct_flock
1874	syscall	Fstore_t	C.struct_fstore
1875	syscall	Radvisory_t	C.struct_radvisory
1876	syscall	Fbootstraptransfer_t	C.struct_fbootstraptransfer
1877	syscall	Log2phys_t	C.struct_log2phys
1878	syscall	Fsid	C.struct_fsid
1879	syscall	Dirent	C.struct_dirent
1880	syscall	RawSockaddrInet4	C.struct_sockaddr_in
1881	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
1882	syscall	RawSockaddrUnix	C.struct_sockaddr_un
1883	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
1884	syscall	RawSockaddr	C.struct_sockaddr
1885	syscall	RawSockaddrAny	C.struct_sockaddr_any
1886	syscall	Linger	C.struct_linger
1887	syscall	Iovec	C.struct_iovec
1888	syscall	IPMreq	C.struct_ip_mreq
1889	syscall	IPv6Mreq	C.struct_ipv6_mreq
1890	syscall	Msghdr	C.struct_msghdr
1891	syscall	Cmsghdr	C.struct_cmsghdr
1892	syscall	Inet4Pktinfo	C.struct_in_pktinfo
1893	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
1894	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
1895	syscall	ICMPv6Filter	C.struct_icmp6_filter
1896	syscall	Kevent_t	C.struct_kevent
1897	syscall	FdSet	C.fd_set
1898	syscall	IfMsghdr	C.struct_if_msghdr
1899	syscall	IfData	C.struct_if_data
1900	syscall	IfaMsghdr	C.struct_ifa_msghdr
1901	syscall	IfmaMsghdr	C.struct_ifma_msghdr
1902	syscall	IfmaMsghdr2	C.struct_ifma_msghdr2
1903	syscall	RtMsghdr	C.struct_rt_msghdr
1904	syscall	RtMetrics	C.struct_rt_metrics
1905	syscall	BpfVersion	C.struct_bpf_version
1906	syscall	BpfStat	C.struct_bpf_stat
1907	syscall	BpfProgram	C.struct_bpf_program
1908	syscall	BpfInsn	C.struct_bpf_insn
1909	syscall	BpfHdr	C.struct_bpf_hdr
1910	syscall	Termios	C.struct_termios
1911	syscall	Timespec	C.struct_timespec
1912	syscall	Timeval	C.struct_timeval
1913	syscall	Rusage	C.struct_rusage
1914	syscall	Rlimit	C.struct_rlimit
1915	syscall	Stat_t	C.struct_stat
1916	syscall	Statfs_t	C.struct_statfs
1917	syscall	Flock_t	C.struct_flock
1918	syscall	Dirent	C.struct_dirent
1919	syscall	Fsid	C.struct_fsid
1920	syscall	RawSockaddrInet4	C.struct_sockaddr_in
1921	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
1922	syscall	RawSockaddrUnix	C.struct_sockaddr_un
1923	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
1924	syscall	RawSockaddr	C.struct_sockaddr
1925	syscall	RawSockaddrAny	C.struct_sockaddr_any
1926	syscall	Linger	C.struct_linger
1927	syscall	Iovec	C.struct_iovec
1928	syscall	IPMreq	C.struct_ip_mreq
1929	syscall	IPv6Mreq	C.struct_ipv6_mreq
1930	syscall	Msghdr	C.struct_msghdr
1931	syscall	Cmsghdr	C.struct_cmsghdr
1932	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
1933	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
1934	syscall	ICMPv6Filter	C.struct_icmp6_filter
1935	syscall	Kevent_t	C.struct_kevent
1936	syscall	FdSet	C.fd_set
1937	syscall	IfMsghdr	C.struct_if_msghdr
1938	syscall	IfData	C.struct_if_data
1939	syscall	IfaMsghdr	C.struct_ifa_msghdr
1940	syscall	IfmaMsghdr	C.struct_ifma_msghdr
1941	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
1942	syscall	RtMsghdr	C.struct_rt_msghdr
1943	syscall	RtMetrics	C.struct_rt_metrics
1944	syscall	BpfVersion	C.struct_bpf_version
1945	syscall	BpfStat	C.struct_bpf_stat
1946	syscall	BpfProgram	C.struct_bpf_program
1947	syscall	BpfInsn	C.struct_bpf_insn
1948	syscall	BpfHdr	C.struct_bpf_hdr
1949	syscall	Termios	C.struct_termios
1950	syscall	Timespec	C.struct_timespec
1951	syscall	Timeval	C.struct_timeval
1952	syscall	Rusage	C.struct_rusage
1953	syscall	Rlimit	C.struct_rlimit
1954	syscall	Stat_t	C.struct_stat8
1955	syscall	Statfs_t	C.struct_statfs
1956	syscall	Flock_t	C.struct_flock
1957	syscall	Dirent	C.struct_dirent
1958	syscall	Fsid	C.struct_fsid
1959	syscall	RawSockaddrInet4	C.struct_sockaddr_in
1960	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
1961	syscall	RawSockaddrUnix	C.struct_sockaddr_un
1962	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
1963	syscall	RawSockaddr	C.struct_sockaddr
1964	syscall	RawSockaddrAny	C.struct_sockaddr_any
1965	syscall	Linger	C.struct_linger
1966	syscall	Iovec	C.struct_iovec
1967	syscall	IPMreq	C.struct_ip_mreq
1968	syscall	IPMreqn	C.struct_ip_mreqn
1969	syscall	IPv6Mreq	C.struct_ipv6_mreq
1970	syscall	Msghdr	C.struct_msghdr
1971	syscall	Cmsghdr	C.struct_cmsghdr
1972	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
1973	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
1974	syscall	ICMPv6Filter	C.struct_icmp6_filter
1975	syscall	Kevent_t	C.struct_kevent
1976	syscall	FdSet	C.fd_set
1977	syscall	IfMsghdr	C.struct_if_msghdr8
1978	syscall	IfData	C.struct_if_data8
1979	syscall	IfaMsghdr	C.struct_ifa_msghdr
1980	syscall	IfmaMsghdr	C.struct_ifma_msghdr
1981	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
1982	syscall	RtMsghdr	C.struct_rt_msghdr
1983	syscall	RtMetrics	C.struct_rt_metrics
1984	syscall	BpfVersion	C.struct_bpf_version
1985	syscall	BpfStat	C.struct_bpf_stat
1986	syscall	BpfZbuf	C.struct_bpf_zbuf
1987	syscall	BpfProgram	C.struct_bpf_program
1988	syscall	BpfInsn	C.struct_bpf_insn
1989	syscall	BpfHdr	C.struct_bpf_hdr
1990	syscall	BpfZbufHeader	C.struct_bpf_zbuf_header
1991	syscall	Termios	C.struct_termios
1992	syscall	Timespec	C.struct_timespec
1993	syscall	Timeval	C.struct_timeval
1994	syscall	Timex	C.struct_timex
1995	syscall	Time_t	C.time_t
1996	syscall	Tms	C.struct_tms
1997	syscall	Utimbuf	C.struct_utimbuf
1998	syscall	Rusage	C.struct_rusage
1999	syscall	Rlimit	C.struct_rlimit
2000	syscall	Stat_t	C.struct_stat
2001	syscall	Statfs_t	C.struct_statfs
2002	syscall	Dirent	C.struct_dirent
2003	syscall	Fsid	C.fsid_t
2004	syscall	Flock_t	C.struct_flock
2005	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2006	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2007	syscall	RawSockaddrUnix	C.struct_my_sockaddr_un
2008	syscall	RawSockaddrLinklayer	C.struct_sockaddr_ll
2009	syscall	RawSockaddrNetlink	C.struct_sockaddr_nl
2010	syscall	RawSockaddr	C.struct_sockaddr
2011	syscall	RawSockaddrAny	C.struct_sockaddr_any
2012	syscall	Linger	C.struct_linger
2013	syscall	Iovec	C.struct_iovec
2014	syscall	IPMreq	C.struct_ip_mreq
2015	syscall	IPMreqn	C.struct_ip_mreqn
2016	syscall	IPv6Mreq	C.struct_ipv6_mreq
2017	syscall	Msghdr	C.struct_msghdr
2018	syscall	Cmsghdr	C.struct_cmsghdr
2019	syscall	Inet4Pktinfo	C.struct_in_pktinfo
2020	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2021	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2022	syscall	ICMPv6Filter	C.struct_icmp6_filter
2023	syscall	Ucred	C.struct_ucred
2024	syscall	TCPInfo	C.struct_tcp_info
2025	syscall	NlMsghdr	C.struct_nlmsghdr
2026	syscall	NlMsgerr	C.struct_nlmsgerr
2027	syscall	RtGenmsg	C.struct_rtgenmsg
2028	syscall	NlAttr	C.struct_nlattr
2029	syscall	RtAttr	C.struct_rtattr
2030	syscall	IfInfomsg	C.struct_ifinfomsg
2031	syscall	IfAddrmsg	C.struct_ifaddrmsg
2032	syscall	RtMsg	C.struct_rtmsg
2033	syscall	RtNexthop	C.struct_rtnexthop
2034	syscall	SockFilter	C.struct_sock_filter
2035	syscall	SockFprog	C.struct_sock_fprog
2036	syscall	InotifyEvent	C.struct_inotify_event
2037	syscall	PtraceRegs	C.PtraceRegs
2038	syscall	FdSet	C.fd_set
2039	syscall	Sysinfo_t	C.struct_sysinfo
2040	syscall	Utsname	C.struct_utsname
2041	syscall	Ustat_t	C.struct_ustat
2042	syscall	EpollEvent	C.struct_my_epoll_event
2043	syscall	Termios	C.struct_termios
2044	syscall	Timespec	C.struct_timespec
2045	syscall	Timeval	C.struct_timeval
2046	syscall	Rusage	C.struct_rusage
2047	syscall	Rlimit	C.struct_rlimit
2048	syscall	Stat_t	C.struct_stat
2049	syscall	Statfs_t	C.struct_statfs
2050	syscall	Flock_t	C.struct_flock
2051	syscall	Dirent	C.struct_dirent
2052	syscall	Fsid	C.fsid_t
2053	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2054	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2055	syscall	RawSockaddrUnix	C.struct_sockaddr_un
2056	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
2057	syscall	RawSockaddr	C.struct_sockaddr
2058	syscall	RawSockaddrAny	C.struct_sockaddr_any
2059	syscall	Linger	C.struct_linger
2060	syscall	Iovec	C.struct_iovec
2061	syscall	IPMreq	C.struct_ip_mreq
2062	syscall	IPv6Mreq	C.struct_ipv6_mreq
2063	syscall	Msghdr	C.struct_msghdr
2064	syscall	Cmsghdr	C.struct_cmsghdr
2065	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2066	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2067	syscall	ICMPv6Filter	C.struct_icmp6_filter
2068	syscall	Kevent_t	C.struct_kevent
2069	syscall	FdSet	C.fd_set
2070	syscall	IfMsghdr	C.struct_if_msghdr
2071	syscall	IfData	C.struct_if_data
2072	syscall	IfaMsghdr	C.struct_ifa_msghdr
2073	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
2074	syscall	RtMsghdr	C.struct_rt_msghdr
2075	syscall	RtMetrics	C.struct_rt_metrics
2076	syscall	Mclpool	C.struct_mclpool
2077	syscall	BpfVersion	C.struct_bpf_version
2078	syscall	BpfStat	C.struct_bpf_stat
2079	syscall	BpfProgram	C.struct_bpf_program
2080	syscall	BpfInsn	C.struct_bpf_insn
2081	syscall	BpfHdr	C.struct_bpf_hdr
2082	syscall	BpfTimeval	C.struct_bpf_timeval
2083	syscall	Termios	C.struct_termios
2084	syscall	Sysctlnode	C.struct_sysctlnode
2085	syscall	Timespec	C.struct_timespec
2086	syscall	Timeval	C.struct_timeval
2087	syscall	Rusage	C.struct_rusage
2088	syscall	Rlimit	C.struct_rlimit
2089	syscall	Stat_t	C.struct_stat
2090	syscall	Statfs_t	C.struct_statfs
2091	syscall	Flock_t	C.struct_flock
2092	syscall	Dirent	C.struct_dirent
2093	syscall	Fsid	C.fsid_t
2094	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2095	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2096	syscall	RawSockaddrUnix	C.struct_sockaddr_un
2097	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
2098	syscall	RawSockaddr	C.struct_sockaddr
2099	syscall	RawSockaddrAny	C.struct_sockaddr_any
2100	syscall	Linger	C.struct_linger
2101	syscall	Iovec	C.struct_iovec
2102	syscall	IPMreq	C.struct_ip_mreq
2103	syscall	IPv6Mreq	C.struct_ipv6_mreq
2104	syscall	Msghdr	C.struct_msghdr
2105	syscall	Cmsghdr	C.struct_cmsghdr
2106	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2107	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2108	syscall	ICMPv6Filter	C.struct_icmp6_filter
2109	syscall	Kevent_t	C.struct_kevent
2110	syscall	FdSet	C.fd_set
2111	syscall	IfMsghdr	C.struct_if_msghdr
2112	syscall	IfData	C.struct_if_data
2113	syscall	IfaMsghdr	C.struct_ifa_msghdr
2114	syscall	IfAnnounceMsghdr	C.struct_if_announcemsghdr
2115	syscall	RtMsghdr	C.struct_rt_msghdr
2116	syscall	RtMetrics	C.struct_rt_metrics
2117	syscall	Mclpool	C.struct_mclpool
2118	syscall	BpfVersion	C.struct_bpf_version
2119	syscall	BpfStat	C.struct_bpf_stat
2120	syscall	BpfProgram	C.struct_bpf_program
2121	syscall	BpfInsn	C.struct_bpf_insn
2122	syscall	BpfHdr	C.struct_bpf_hdr
2123	syscall	BpfTimeval	C.struct_bpf_timeval
2124	syscall	Termios	C.struct_termios
2125	syscall	Timespec	C.struct_timespec
2126	syscall	Timeval	C.struct_timeval
2127	syscall	Timeval32	C.struct_timeval32
2128	syscall	Rusage	C.struct_rusage
2129	syscall	Rlimit	C.struct_rlimit
2130	syscall	Stat_t	C.struct_stat
2131	syscall	Flock_t	C.struct_flock
2132	syscall	Dirent	C.struct_dirent
2133	syscall	RawSockaddrInet4	C.struct_sockaddr_in
2134	syscall	RawSockaddrInet6	C.struct_sockaddr_in6
2135	syscall	RawSockaddrUnix	C.struct_sockaddr_un
2136	syscall	RawSockaddrDatalink	C.struct_sockaddr_dl
2137	syscall	RawSockaddr	C.struct_sockaddr
2138	syscall	RawSockaddrAny	C.struct_sockaddr_any
2139	syscall	Linger	C.struct_linger
2140	syscall	Iovec	C.struct_iovec
2141	syscall	IPMreq	C.struct_ip_mreq
2142	syscall	IPv6Mreq	C.struct_ipv6_mreq
2143	syscall	Msghdr	C.struct_msghdr
2144	syscall	Cmsghdr	C.struct_cmsghdr
2145	syscall	Inet6Pktinfo	C.struct_in6_pktinfo
2146	syscall	IPv6MTUInfo	C.struct_ip6_mtuinfo
2147	syscall	ICMPv6Filter	C.struct_icmp6_filter
2148	syscall	FdSet	C.fd_set
2149	syscall	IfMsghdr	C.struct_if_msghdr
2150	syscall	IfData	C.struct_if_data
2151	syscall	IfaMsghdr	C.struct_ifa_msghdr
2152	syscall	RtMsghdr	C.struct_rt_msghdr
2153	syscall	RtMetrics	C.struct_rt_metrics
2154	syscall	BpfVersion	C.struct_bpf_version
2155	syscall	BpfStat	C.struct_bpf_stat
2156	syscall	BpfProgram	C.struct_bpf_program
2157	syscall	BpfInsn	C.struct_bpf_insn
2158	syscall	BpfTimeval	C.struct_bpf_timeval
2159	syscall	BpfHdr	C.struct_bpf_hdr
2160	syscall	Termios	C.struct_termios
2161	syscall	Timespec	struct
2162	syscall	Timeval	struct
2163	syscall	Timeval32	[]byte
2164	syscall	Rusage	struct
2165	syscall	Rlimit	struct
2166	syscall	Stat_t	struct
2167	syscall	Statfs_t	struct
2168	syscall	Flock_t	struct
2169	syscall	Fstore_t	struct
2170	syscall	Radvisory_t	struct
2171	syscall	Fbootstraptransfer_t	struct
2172	syscall	Log2phys_t	struct
2173	syscall	Fsid	struct
2174	syscall	Dirent	struct
2175	syscall	RawSockaddrInet4	struct
2176	syscall	RawSockaddrInet6	struct
2177	syscall	RawSockaddrUnix	struct
2178	syscall	RawSockaddrDatalink	struct
2179	syscall	RawSockaddr	struct
2180	syscall	RawSockaddrAny	struct
2181	syscall	Linger	struct
2182	syscall	Iovec	struct
2183	syscall	IPMreq	struct
2184	syscall	IPv6Mreq	struct
2185	syscall	Msghdr	struct
2186	syscall	Cmsghdr	struct
2187	syscall	Inet4Pktinfo	struct
2188	syscall	Inet6Pktinfo	struct
2189	syscall	IPv6MTUInfo	struct
2190	syscall	ICMPv6Filter	struct
2191	syscall	Kevent_t	struct
2192	syscall	FdSet	struct
2193	syscall	IfMsghdr	struct
2194	syscall	IfData	struct
2195	syscall	IfaMsghdr	struct
2196	syscall	IfmaMsghdr	struct
2197	syscall	IfmaMsghdr2	struct
2198	syscall	RtMsghdr	struct
2199	syscall	RtMetrics	struct
2200	syscall	BpfVersion	struct
2201	syscall	BpfStat	struct
2202	syscall	BpfProgram	struct
2203	syscall	BpfInsn	struct
2204	syscall	BpfHdr	struct
2205	syscall	Termios	struct
2206	syscall	Timespec	struct
2207	syscall	Timeval	struct
2208	syscall	Timeval32	struct
2209	syscall	Rusage	struct
2210	syscall	Rlimit	struct
2211	syscall	Stat_t	struct
2212	syscall	Statfs_t	struct
2213	syscall	Flock_t	struct
2214	syscall	Fstore_t	struct
2215	syscall	Radvisory_t	struct
2216	syscall	Fbootstraptransfer_t	struct
2217	syscall	Log2phys_t	struct
2218	syscall	Fsid	struct
2219	syscall	Dirent	struct
2220	syscall	RawSockaddrInet4	struct
2221	syscall	RawSockaddrInet6	struct
2222	syscall	RawSockaddrUnix	struct
2223	syscall	RawSockaddrDatalink	struct
2224	syscall	RawSockaddr	struct
2225	syscall	RawSockaddrAny	struct
2226	syscall	Linger	struct
2227	syscall	Iovec	struct
2228	syscall	IPMreq	struct
2229	syscall	IPv6Mreq	struct
2230	syscall	Msghdr	struct
2231	syscall	Cmsghdr	struct
2232	syscall	Inet4Pktinfo	struct
2233	syscall	Inet6Pktinfo	struct
2234	syscall	IPv6MTUInfo	struct
2235	syscall	ICMPv6Filter	struct
2236	syscall	Kevent_t	struct
2237	syscall	FdSet	struct
2238	syscall	IfMsghdr	struct
2239	syscall	IfData	struct
2240	syscall	IfaMsghdr	struct
2241	syscall	IfmaMsghdr	struct
2242	syscall	IfmaMsghdr2	struct
2243	syscall	RtMsghdr	struct
2244	syscall	RtMetrics	struct
2245	syscall	BpfVersion	struct
2246	syscall	BpfStat	struct
2247	syscall	BpfProgram	struct
2248	syscall	BpfInsn	struct
2249	syscall	BpfHdr	struct
2250	syscall	Termios	struct
2251	syscall	Timespec	struct
2252	syscall	Timeval	struct
2253	syscall	Timeval32	[]byte
2254	syscall	Rusage	struct
2255	syscall	Rlimit	struct
2256	syscall	Stat_t	struct
2257	syscall	Statfs_t	struct
2258	syscall	Flock_t	struct
2259	syscall	Fstore_t	struct
2260	syscall	Radvisory_t	struct
2261	syscall	Fbootstraptransfer_t	struct
2262	syscall	Log2phys_t	struct
2263	syscall	Fsid	struct
2264	syscall	Dirent	struct
2265	syscall	RawSockaddrInet4	struct
2266	syscall	RawSockaddrInet6	struct
2267	syscall	RawSockaddrUnix	struct
2268	syscall	RawSockaddrDatalink	struct
2269	syscall	RawSockaddr	struct
2270	syscall	RawSockaddrAny	struct
2271	syscall	Linger	struct
2272	syscall	Iovec	struct
2273	syscall	IPMreq	struct
2274	syscall	IPv6Mreq	struct
2275	syscall	Msghdr	struct
2276	syscall	Cmsghdr	struct
2277	syscall	Inet4Pktinfo	struct
2278	syscall	Inet6Pktinfo	struct
2279	syscall	IPv6MTUInfo	struct
2280	syscall	ICMPv6Filter	struct
2281	syscall	Kevent_t	struct
2282	syscall	FdSet	struct
2283	syscall	IfMsghdr	struct
2284	syscall	IfData	struct
2285	syscall	IfaMsghdr	struct
2286	syscall	IfmaMsghdr	struct
2287	syscall	IfmaMsghdr2	struct
2288	syscall	RtMsghdr	struct
2289	syscall	RtMetrics	struct
2290	syscall	BpfVersion	struct
2291	syscall	BpfStat	struct
2292	syscall	BpfProgram	struct
2293	syscall	BpfInsn	struct
2294	syscall	BpfHdr	struct
2295	syscall	Termios	struct
2296	syscall	Timespec	struct
2297	syscall	Timeval	struct
2298	syscall	Timeval32	struct
2299	syscall	Rusage	struct
2300	syscall	Rlimit	struct
2301	syscall	Stat_t	struct
2302	syscall	Statfs_t	struct
2303	syscall	Flock_t	struct
2304	syscall	Fstore_t	struct
2305	syscall	Radvisory_t	struct
2306	syscall	Fbootstraptransfer_t	struct
2307	syscall	Log2phys_t	struct
2308	syscall	Fsid	struct
2309	syscall	Dirent	struct
2310	syscall	RawSockaddrInet4	struct
2311	syscall	RawSockaddrInet6	struct
2312	syscall	RawSockaddrUnix	struct
2313	syscall	RawSockaddrDatalink	struct
2314	syscall	RawSockaddr	struct
2315	syscall	RawSockaddrAny	struct
2316	syscall	Linger	struct
2317	syscall	Iovec	struct
2318	syscall	IPMreq	struct
2319	syscall	IPv6Mreq	struct
2320	syscall	Msghdr	struct
2321	syscall	Cmsghdr	struct
2322	syscall	Inet4Pktinfo	struct
2323	syscall	Inet6Pktinfo	struct
2324	syscall	IPv6MTUInfo	struct
2325	syscall	ICMPv6Filter	struct
2326	syscall	Kevent_t	struct
2327	syscall	FdSet	struct
2328	syscall	IfMsghdr	struct
2329	syscall	IfData	struct
2330	syscall	IfaMsghdr	struct
2331	syscall	IfmaMsghdr	struct
2332	syscall	IfmaMsghdr2	struct
2333	syscall	RtMsghdr	struct
2334	syscall	RtMetrics	struct
2335	syscall	BpfVersion	struct
2336	syscall	BpfStat	struct
2337	syscall	BpfProgram	struct
2338	syscall	BpfInsn	struct
2339	syscall	BpfHdr	struct
2340	syscall	Termios	struct
2341	syscall	Timespec	struct
2342	syscall	Timeval	struct
2343	syscall	Rusage	struct
2344	syscall	Rlimit	struct
2345	syscall	Stat_t	struct
2346	syscall	Statfs_t	struct
2347	syscall	Flock_t	struct
2348	syscall	Dirent	struct
2349	syscall	Fsid	struct
2350	syscall	RawSockaddrInet4	struct
2351	syscall	RawSockaddrInet6	struct
2352	syscall	RawSockaddrUnix	struct
2353	syscall	RawSockaddrDatalink	struct
2354	syscall	RawSockaddr	struct
2355	syscall	RawSockaddrAny	struct
2356	syscall	Linger	struct
2357	syscall	Iovec	struct
2358	syscall	IPMreq	struct
2359	syscall	IPv6Mreq	struct
2360	syscall	Msghdr	struct
2361	syscall	Cmsghdr	struct
2362	syscall	Inet6Pktinfo	struct
2363	syscall	IPv6MTUInfo	struct
2364	syscall	ICMPv6Filter	struct
2365	syscall	Kevent_t	struct
2366	syscall	FdSet	struct
2367	syscall	IfMsghdr	struct
2368	syscall	IfData	struct
2369	syscall	IfaMsghdr	struct
2370	syscall	IfmaMsghdr	struct
2371	syscall	IfAnnounceMsghdr	struct
2372	syscall	RtMsghdr	struct
2373	syscall	RtMetrics	struct
2374	syscall	BpfVersion	struct
2375	syscall	BpfStat	struct
2376	syscall	BpfProgram	struct
2377	syscall	BpfInsn	struct
2378	syscall	BpfHdr	struct
2379	syscall	Termios	struct
2380	syscall	Timespec	struct
2381	syscall	Timeval	struct
2382	syscall	Rusage	struct
2383	syscall	Rlimit	struct
2384	syscall	Stat_t	struct
2385	syscall	Statfs_t	struct
2386	syscall	Flock_t	struct
2387	syscall	Dirent	struct
2388	syscall	Fsid	struct
2389	syscall	RawSockaddrInet4	struct
2390	syscall	RawSockaddrInet6	struct
2391	syscall	RawSockaddrUnix	struct
2392	syscall	RawSockaddrDatalink	struct
2393	syscall	RawSockaddr	struct
2394	syscall	RawSockaddrAny	struct
2395	syscall	Linger	struct
2396	syscall	Iovec	struct
2397	syscall	IPMreq	struct
2398	syscall	IPMreqn	struct
2399	syscall	IPv6Mreq	struct
2400	syscall	Msghdr	struct
2401	syscall	Cmsghdr	struct
2402	syscall	Inet6Pktinfo	struct
2403	syscall	IPv6MTUInfo	struct
2404	syscall	ICMPv6Filter	struct
2405	syscall	Kevent_t	struct
2406	syscall	FdSet	struct
2407	syscall	IfMsghdr	struct
2408	syscall	IfData	struct
2409	syscall	IfaMsghdr	struct
2410	syscall	IfmaMsghdr	struct
2411	syscall	IfAnnounceMsghdr	struct
2412	syscall	RtMsghdr	struct
2413	syscall	RtMetrics	struct
2414	syscall	BpfVersion	struct
2415	syscall	BpfStat	struct
2416	syscall	BpfZbuf	struct
2417	syscall	BpfProgram	struct
2418	syscall	BpfInsn	struct
2419	syscall	BpfHdr	struct
2420	syscall	BpfZbufHeader	struct
2421	syscall	Termios	struct
2422	syscall	Timespec	struct
2423	syscall	Timeval	struct
2424	syscall	Rusage	struct
2425	syscall	Rlimit	struct
2426	syscall	Stat_t	struct
2427	syscall	Statfs_t	struct
2428	syscall	Flock_t	struct
2429	syscall	Dirent	struct
2430	syscall	Fsid	struct
2431	syscall	RawSockaddrInet4	struct
2432	syscall	RawSockaddrInet6	struct
2433	syscall	RawSockaddrUnix	struct
2434	syscall	RawSockaddrDatalink	struct
2435	syscall	RawSockaddr	struct
2436	syscall	RawSockaddrAny	struct
2437	syscall	Linger	struct
2438	syscall	Iovec	struct
2439	syscall	IPMreq	struct
2440	syscall	IPMreqn	struct
2441	syscall	IPv6Mreq	struct
2442	syscall	Msghdr	struct
2443	syscall	Cmsghdr	struct
2444	syscall	Inet6Pktinfo	struct
2445	syscall	IPv6MTUInfo	struct
2446	syscall	ICMPv6Filter	struct
2447	syscall	Kevent_t	struct
2448	syscall	FdSet	struct
2449	syscall	IfMsghdr	struct
2450	syscall	IfData	struct
2451	syscall	IfaMsghdr	struct
2452	syscall	IfmaMsghdr	struct
2453	syscall	IfAnnounceMsghdr	struct
2454	syscall	RtMsghdr	struct
2455	syscall	RtMetrics	struct
2456	syscall	BpfVersion	struct
2457	syscall	BpfStat	struct
2458	syscall	BpfZbuf	struct
2459	syscall	BpfProgram	struct
2460	syscall	BpfInsn	struct
2461	syscall	BpfHdr	struct
2462	syscall	BpfZbufHeader	struct
2463	syscall	Termios	struct
2464	syscall	Timespec	struct
2465	syscall	Timeval	struct
2466	syscall	Rusage	struct
2467	syscall	Rlimit	struct
2468	syscall	Stat_t	struct
2469	syscall	Statfs_t	struct
2470	syscall	Flock_t	struct
2471	syscall	Dirent	struct
2472	syscall	Fsid	struct
2473	syscall	RawSockaddrInet4	struct
2474	syscall	RawSockaddrInet6	struct
2475	syscall	RawSockaddrUnix	struct
2476	syscall	RawSockaddrDatalink	struct
2477	syscall	RawSockaddr	struct
2478	syscall	RawSockaddrAny	struct
2479	syscall	Linger	struct
2480	syscall	Iovec	struct
2481	syscall	IPMreq	struct
2482	syscall	IPMreqn	struct
2483	syscall	IPv6Mreq	struct
2484	syscall	Msghdr	struct
2485	syscall	Cmsghdr	struct
2486	syscall	Inet6Pktinfo	struct
2487	syscall	IPv6MTUInfo	struct
2488	syscall	ICMPv6Filter	struct
2489	syscall	Kevent_t	struct
2490	syscall	FdSet	struct
2491	syscall	IfMsghdr	struct
2492	syscall	IfData	struct
2493	syscall	IfaMsghdr	struct
2494	syscall	IfmaMsghdr	struct
2495	syscall	IfAnnounceMsghdr	struct
2496	syscall	RtMsghdr	struct
2497	syscall	RtMetrics	struct
2498	syscall	BpfVersion	struct
2499	syscall	BpfStat	struct
2500	syscall	BpfZbuf	struct
2501	syscall	BpfProgram	struct
2502	syscall	BpfInsn	struct
2503	syscall	BpfHdr	struct
2504	syscall	BpfZbufHeader	struct
2505	syscall	Termios	struct
2506	syscall	Timespec	struct
2507	syscall	Timeval	struct
2508	syscall	Timex	struct
2509	syscall	Time_t	int32
2510	syscall	Tms	struct
2511	syscall	Utimbuf	struct
2512	syscall	Rusage	struct
2513	syscall	Rlimit	struct
2514	syscall	Stat_t	struct
2515	syscall	Statfs_t	struct
2516	syscall	Dirent	struct
2517	syscall	Fsid	struct
2518	syscall	Flock_t	struct
2519	syscall	RawSockaddrInet4	struct
2520	syscall	RawSockaddrInet6	struct
2521	syscall	RawSockaddrUnix	struct
2522	syscall	RawSockaddrLinklayer	struct
2523	syscall	RawSockaddrNetlink	struct
2524	syscall	RawSockaddr	struct
2525	syscall	RawSockaddrAny	struct
2526	syscall	Linger	struct
2527	syscall	Iovec	struct
2528	syscall	IPMreq	struct
2529	syscall	IPMreqn	struct
2530	syscall	IPv6Mreq	struct
2531	syscall	Msghdr	struct
2532	syscall	Cmsghdr	struct
2533	syscall	Inet4Pktinfo	struct
2534	syscall	Inet6Pktinfo	struct
2535	syscall	IPv6MTUInfo	struct
2536	syscall	ICMPv6Filter	struct
2537	syscall	Ucred	struct
2538	syscall	TCPInfo	struct
2539	syscall	NlMsghdr	struct
2540	syscall	NlMsgerr	struct
2541	syscall	RtGenmsg	struct
2542	syscall	NlAttr	struct
2543	syscall	RtAttr	struct
2544	syscall	IfInfomsg	struct
2545	syscall	IfAddrmsg	struct
2546	syscall	RtMsg	struct
2547	syscall	RtNexthop	struct
2548	syscall	SockFilter	struct
2549	syscall	SockFprog	struct
2550	syscall	InotifyEvent	struct
2551	syscall	PtraceRegs	struct
2552	syscall	FdSet	struct
2553	syscall	Sysinfo_t	struct
2554	syscall	Utsname	struct
2555	syscall	Ustat_t	struct
2556	syscall	EpollEvent	struct
2557	syscall	Termios	struct
2558	syscall	Timespec	struct
2559	syscall	Timeval	struct
2560	syscall	Timex	struct
2561	syscall	Time_t	int64
2562	syscall	Tms	struct
2563	syscall	Utimbuf	struct
2564	syscall	Rusage	struct
2565	syscall	Rlimit	struct
2566	syscall	Stat_t	struct
2567	syscall	Statfs_t	struct
2568	syscall	Dirent	struct
2569	syscall	Fsid	struct
2570	syscall	Flock_t	struct
2571	syscall	RawSockaddrInet4	struct
2572	syscall	RawSockaddrInet6	struct
2573	syscall	RawSockaddrUnix	struct
2574	syscall	RawSockaddrLinklayer	struct
2575	syscall	RawSockaddrNetlink	struct
2576	syscall	RawSockaddr	struct
2577	syscall	RawSockaddrAny	struct
2578	syscall	Linger	struct
2579	syscall	Iovec	struct
2580	syscall	IPMreq	struct
2581	syscall	IPMreqn	struct
2582	syscall	IPv6Mreq	struct
2583	syscall	Msghdr	struct
2584	syscall	Cmsghdr	struct
2585	syscall	Inet4Pktinfo	struct
2586	syscall	Inet6Pktinfo	struct
2587	syscall	IPv6MTUInfo	struct
2588	syscall	ICMPv6Filter	struct
2589	syscall	Ucred	struct
2590	syscall	TCPInfo	struct
2591	syscall	NlMsghdr	struct
2592	syscall	NlMsgerr	struct
2593	syscall	RtGenmsg	struct
2594	syscall	NlAttr	struct
2595	syscall	RtAttr	struct
2596	syscall	IfInfomsg	struct
2597	syscall	IfAddrmsg	struct
2598	syscall	RtMsg	struct
2599	syscall	RtNexthop	struct
2600	syscall	SockFilter	struct
2601	syscall	SockFprog	struct
2602	syscall	InotifyEvent	struct
2603	syscall	PtraceRegs	struct
2604	syscall	FdSet	struct
2605	syscall	Sysinfo_t	struct
2606	syscall	Utsname	struct
2607	syscall	Ustat_t	struct
2608	syscall	EpollEvent	struct
2609	syscall	Termios	struct
2610	syscall	Timespec	struct
2611	syscall	Timeval	struct
2612	syscall	Timex	struct
2613	syscall	Time_t	int32
2614	syscall	Tms	struct
2615	syscall	Utimbuf	struct
2616	syscall	Rusage	struct
2617	syscall	Rlimit	struct
2618	syscall	Stat_t	struct
2619	syscall	Statfs_t	struct
2620	syscall	Dirent	struct
2621	syscall	Fsid	struct
2622	syscall	Flock_t	struct
2623	syscall	RawSockaddrInet4	struct
2624	syscall	RawSockaddrInet6	struct
2625	syscall	RawSockaddrUnix	struct
2626	syscall	RawSockaddrLinklayer	struct
2627	syscall	RawSockaddrNetlink	struct
2628	syscall	RawSockaddr	struct
2629	syscall	RawSockaddrAny	struct
2630	syscall	Linger	struct
2631	syscall	Iovec	struct
2632	syscall	IPMreq	struct
2633	syscall	IPMreqn	struct
2634	syscall	IPv6Mreq	struct
2635	syscall	Msghdr	struct
2636	syscall	Cmsghdr	struct
2637	syscall	Inet4Pktinfo	struct
2638	syscall	Inet6Pktinfo	struct
2639	syscall	IPv6MTUInfo	struct
2640	syscall	ICMPv6Filter	struct
2641	syscall	Ucred	struct
2642	syscall	TCPInfo	struct
2643	syscall	NlMsghdr	struct
2644	syscall	NlMsgerr	struct
2645	syscall	RtGenmsg	struct
2646	syscall	NlAttr	struct
2647	syscall	RtAttr	struct
2648	syscall	IfInfomsg	struct
2649	syscall	IfAddrmsg	struct
2650	syscall	RtMsg	struct
2651	syscall	RtNexthop	struct
2652	syscall	SockFilter	struct
2653	syscall	SockFprog	struct
2654	syscall	InotifyEvent	struct
2655	syscall	PtraceRegs	struct
2656	syscall	FdSet	struct
2657	syscall	Sysinfo_t	struct
2658	syscall	Utsname	struct
2659	syscall	Ustat_t	struct
2660	syscall	EpollEvent	struct
2661	syscall	Termios	struct
2662	syscall	Timespec	struct
2663	syscall	Timeval	struct
2664	syscall	Timex	struct
2665	syscall	Time_t	int64
2666	syscall	Tms	struct
2667	syscall	Utimbuf	struct
2668	syscall	Rusage	struct
2669	syscall	Rlimit	struct
2670	syscall	Stat_t	struct
2671	syscall	Statfs_t	struct
2672	syscall	Dirent	struct
2673	syscall	Fsid	struct
2674	syscall	Flock_t	struct
2675	syscall	RawSockaddrInet4	struct
2676	syscall	RawSockaddrInet6	struct
2677	syscall	RawSockaddrUnix	struct
2678	syscall	RawSockaddrLinklayer	struct
2679	syscall	RawSockaddrNetlink	struct
2680	syscall	RawSockaddr	struct
2681	syscall	RawSockaddrAny	struct
2682	syscall	Linger	struct
2683	syscall	Iovec	struct
2684	syscall	IPMreq	struct
2685	syscall	IPMreqn	struct
2686	syscall	IPv6Mreq	struct
2687	syscall	Msghdr	struct
2688	syscall	Cmsghdr	struct
2689	syscall	Inet4Pktinfo	struct
2690	syscall	Inet6Pktinfo	struct
2691	syscall	IPv6MTUInfo	struct
2692	syscall	ICMPv6Filter	struct
2693	syscall	Ucred	struct
2694	syscall	TCPInfo	struct
2695	syscall	NlMsghdr	struct
2696	syscall	NlMsgerr	struct
2697	syscall	RtGenmsg	struct
2698	syscall	NlAttr	struct
2699	syscall	RtAttr	struct
2700	syscall	IfInfomsg	struct
2701	syscall	IfAddrmsg	struct
2702	syscall	RtMsg	struct
2703	syscall	RtNexthop	struct
2704	syscall	SockFilter	struct
2705	syscall	SockFprog	struct
2706	syscall	InotifyEvent	struct
2707	syscall	PtraceRegs	struct
2708	syscall	FdSet	struct
2709	syscall	Sysinfo_t	struct
2710	syscall	Utsname	struct
2711	syscall	Ustat_t	struct
2712	syscall	EpollEvent	struct
2713	syscall	Termios	struct
2714	syscall	Timespec	struct
2715	syscall	Timeval	struct
2716	syscall	Timex	struct
2717	syscall	Time_t	int32
2718	syscall	Tms	struct
2719	syscall	Utimbuf	struct
2720	syscall	Rusage	struct
2721	syscall	Rlimit	struct
2722	syscall	Stat_t	struct
2723	syscall	Statfs_t	struct
2724	syscall	Dirent	struct
2725	syscall	Fsid	struct
2726	syscall	Flock_t	struct
2727	syscall	RawSockaddrInet4	struct
2728	syscall	RawSockaddrInet6	struct
2729	syscall	RawSockaddrUnix	struct
2730	syscall	RawSockaddrLinklayer	struct
2731	syscall	RawSockaddrNetlink	struct
2732	syscall	RawSockaddr	struct
2733	syscall	RawSockaddrAny	struct
2734	syscall	Linger	struct
2735	syscall	Iovec	struct
2736	syscall	IPMreq	struct
2737	syscall	IPMreqn	struct
2738	syscall	IPv6Mreq	struct
2739	syscall	Msghdr	struct
2740	syscall	Cmsghdr	struct
2741	syscall	Inet4Pktinfo	struct
2742	syscall	Inet6Pktinfo	struct
2743	syscall	IPv6MTUInfo	struct
2744	syscall	ICMPv6Filter	struct
2745	syscall	Ucred	struct
2746	syscall	TCPInfo	struct
2747	syscall	NlMsghdr	struct
2748	syscall	NlMsgerr	struct
2749	syscall	RtGenmsg	struct
2750	syscall	NlAttr	struct
2751	syscall	RtAttr	struct
2752	syscall	IfInfomsg	struct
2753	syscall	IfAddrmsg	struct
2754	syscall	RtMsg	struct
2755	syscall	RtNexthop	struct
2756	syscall	SockFilter	struct
2757	syscall	SockFprog	struct
2758	syscall	InotifyEvent	struct
2759	syscall	PtraceRegs	struct
2760	syscall	FdSet	struct
2761	syscall	Sysinfo_t	struct
2762	syscall	Utsname	struct
2763	syscall	Ustat_t	struct
2764	syscall	EpollEvent	struct
2765	syscall	Termios	struct
2766	syscall	Timespec	struct
2767	syscall	Timeval	struct
2768	syscall	Timex	struct
2769	syscall	Time_t	int64
2770	syscall	Tms	struct
2771	syscall	Utimbuf	struct
2772	syscall	Rusage	struct
2773	syscall	Rlimit	struct
2774	syscall	Stat_t	struct
2775	syscall	Statfs_t	struct
2776	syscall	Dirent	struct
2777	syscall	Fsid	struct
2778	syscall	Flock_t	struct
2779	syscall	RawSockaddrInet4	struct
2780	syscall	RawSockaddrInet6	struct
2781	syscall	RawSockaddrUnix	struct
2782	syscall	RawSockaddrLinklayer	struct
2783	syscall	RawSockaddrNetlink	struct
2784	syscall	RawSockaddr	struct
2785	syscall	RawSockaddrAny	struct
2786	syscall	Linger	struct
2787	syscall	Iovec	struct
2788	syscall	IPMreq	struct
2789	syscall	IPMreqn	struct
2790	syscall	IPv6Mreq	struct
2791	syscall	Msghdr	struct
2792	syscall	Cmsghdr	struct
2793	syscall	Inet4Pktinfo	struct
2794	syscall	Inet6Pktinfo	struct
2795	syscall	IPv6MTUInfo	struct
2796	syscall	ICMPv6Filter	struct
2797	syscall	Ucred	struct
2798	syscall	TCPInfo	struct
2799	syscall	NlMsghdr	struct
2800	syscall	NlMsgerr	struct
2801	syscall	RtGenmsg	struct
2802	syscall	NlAttr	struct
2803	syscall	RtAttr	struct
2804	syscall	IfInfomsg	struct
2805	syscall	IfAddrmsg	struct
2806	syscall	RtMsg	struct
2807	syscall	RtNexthop	struct
2808	syscall	SockFilter	struct
2809	syscall	SockFprog	struct
2810	syscall	InotifyEvent	struct
2811	syscall	PtraceRegs	struct
2812	syscall	FdSet	struct
2813	syscall	Sysinfo_t	struct
2814	syscall	Utsname	struct
2815	syscall	Ustat_t	struct
2816	syscall	EpollEvent	struct
2817	syscall	Termios	struct
2818	syscall	Timespec	struct
2819	syscall	Timeval	struct
2820	syscall	Timex	struct
2821	syscall	Time_t	int64
2822	syscall	Tms	struct
2823	syscall	Utimbuf	struct
2824	syscall	Rusage	struct
2825	syscall	Rlimit	struct
2826	syscall	Stat_t	struct
2827	syscall	Statfs_t	struct
2828	syscall	Dirent	struct
2829	syscall	Fsid	struct
2830	syscall	Flock_t	struct
2831	syscall	RawSockaddrInet4	struct
2832	syscall	RawSockaddrInet6	struct
2833	syscall	RawSockaddrUnix	struct
2834	syscall	RawSockaddrLinklayer	struct
2835	syscall	RawSockaddrNetlink	struct
2836	syscall	RawSockaddr	struct
2837	syscall	RawSockaddrAny	struct
2838	syscall	Linger	struct
2839	syscall	Iovec	struct
2840	syscall	IPMreq	struct
2841	syscall	IPMreqn	struct
2842	syscall	IPv6Mreq	struct
2843	syscall	Msghdr	struct
2844	syscall	Cmsghdr	struct
2845	syscall	Inet4Pktinfo	struct
2846	syscall	Inet6Pktinfo	struct
2847	syscall	IPv6MTUInfo	struct
2848	syscall	ICMPv6Filter	struct
2849	syscall	Ucred	struct
2850	syscall	TCPInfo	struct
2851	syscall	NlMsghdr	struct
2852	syscall	NlMsgerr	struct
2853	syscall	RtGenmsg	struct
2854	syscall	NlAttr	struct
2855	syscall	RtAttr	struct
2856	syscall	IfInfomsg	struct
2857	syscall	IfAddrmsg	struct
2858	syscall	RtMsg	struct
2859	syscall	RtNexthop	struct
2860	syscall	SockFilter	struct
2861	syscall	SockFprog	struct
2862	syscall	InotifyEvent	struct
2863	syscall	PtraceRegs	struct
2864	syscall	FdSet	struct
2865	syscall	Sysinfo_t	struct
2866	syscall	Utsname	struct
2867	syscall	Ustat_t	struct
2868	syscall	EpollEvent	struct
2869	syscall	Termios	struct
2870	syscall	Timespec	struct
2871	syscall	Timeval	struct
2872	syscall	Timex	struct
2873	syscall	Time_t	int32
2874	syscall	Tms	struct
2875	syscall	Utimbuf	struct
2876	syscall	Rusage	struct
2877	syscall	Rlimit	struct
2878	syscall	Stat_t	struct
2879	syscall	Statfs_t	struct
2880	syscall	Dirent	struct
2881	syscall	Fsid	struct
2882	syscall	Flock_t	struct
2883	syscall	RawSockaddrInet4	struct
2884	syscall	RawSockaddrInet6	struct
2885	syscall	RawSockaddrUnix	struct
2886	syscall	RawSockaddrLinklayer	struct
2887	syscall	RawSockaddrNetlink	struct
2888	syscall	RawSockaddr	struct
2889	syscall	RawSockaddrAny	struct
2890	syscall	Linger	struct
2891	syscall	Iovec	struct
2892	syscall	IPMreq	struct
2893	syscall	IPMreqn	struct
2894	syscall	IPv6Mreq	struct
2895	syscall	Msghdr	struct
2896	syscall	Cmsghdr	struct
2897	syscall	Inet4Pktinfo	struct
2898	syscall	Inet6Pktinfo	struct
2899	syscall	IPv6MTUInfo	struct
2900	syscall	ICMPv6Filter	struct
2901	syscall	Ucred	struct
2902	syscall	TCPInfo	struct
2903	syscall	NlMsghdr	struct
2904	syscall	NlMsgerr	struct
2905	syscall	RtGenmsg	struct
2906	syscall	NlAttr	struct
2907	syscall	RtAttr	struct
2908	syscall	IfInfomsg	struct
2909	syscall	IfAddrmsg	struct
2910	syscall	RtMsg	struct
2911	syscall	RtNexthop	struct
2912	syscall	SockFilter	struct
2913	syscall	SockFprog	struct
2914	syscall	InotifyEvent	struct
2915	syscall	PtraceRegs	struct
2916	syscall	FdSet	struct
2917	syscall	Sysinfo_t	struct
2918	syscall	Utsname	struct
2919	syscall	Ustat_t	struct
2920	syscall	EpollEvent	struct
2921	syscall	Termios	struct
2922	syscall	Timespec	struct
2923	syscall	Timeval	struct
2924	syscall	Timex	struct
2925	syscall	Time_t	int64
2926	syscall	Tms	struct
2927	syscall	Utimbuf	struct
2928	syscall	Rusage	struct
2929	syscall	Rlimit	struct
2930	syscall	Stat_t	struct
2931	syscall	Statfs_t	struct
2932	syscall	Dirent	struct
2933	syscall	Fsid	struct
2934	syscall	Flock_t	struct
2935	syscall	RawSockaddrInet4	struct
2936	syscall	RawSockaddrInet6	struct
2937	syscall	RawSockaddrUnix	struct
2938	syscall	RawSockaddrLinklayer	struct
2939	syscall	RawSockaddrNetlink	struct
2940	syscall	RawSockaddr	struct
2941	syscall	RawSockaddrAny	struct
2942	syscall	Linger	struct
2943	syscall	Iovec	struct
2944	syscall	IPMreq	struct
2945	syscall	IPMreqn	struct
2946	syscall	IPv6Mreq	struct
2947	syscall	Msghdr	struct
2948	syscall	Cmsghdr	struct
2949	syscall	Inet4Pktinfo	struct
2950	syscall	Inet6Pktinfo	struct
2951	syscall	IPv6MTUInfo	struct
2952	syscall	ICMPv6Filter	struct
2953	syscall	Ucred	struct
2954	syscall	TCPInfo	struct
2955	syscall	NlMsghdr	struct
2956	syscall	NlMsgerr	struct
2957	syscall	RtGenmsg	struct
2958	syscall	NlAttr	struct
2959	syscall	RtAttr	struct
2960	syscall	IfInfomsg	struct
2961	syscall	IfAddrmsg	struct
2962	syscall	RtMsg	struct
2963	syscall	RtNexthop	struct
2964	syscall	SockFilter	struct
2965	syscall	SockFprog	struct
2966	syscall	InotifyEvent	struct
2967	syscall	PtraceRegs	struct
2968	syscall	FdSet	struct
2969	syscall	Sysinfo_t	struct
2970	syscall	Utsname	struct
2971	syscall	Ustat_t	struct
2972	syscall	EpollEvent	struct
2973	syscall	Termios	struct
2974	syscall	Timespec	struct
2975	syscall	Timeval	struct
2976	syscall	Timex	struct
2977	syscall	Time_t	int64
2978	syscall	Tms	struct
2979	syscall	Utimbuf	struct
2980	syscall	Rusage	struct
2981	syscall	Rlimit	struct
2982	syscall	Stat_t	struct
2983	syscall	Statfs_t	struct
2984	syscall	Dirent	struct
2985	syscall	Fsid	struct
2986	syscall	Flock_t	struct
2987	syscall	RawSockaddrInet4	struct
2988	syscall	RawSockaddrInet6	struct
2989	syscall	RawSockaddrUnix	struct
2990	syscall	RawSockaddrLinklayer	struct
2991	syscall	RawSockaddrNetlink	struct
2992	syscall	RawSockaddr	struct
2993	syscall	RawSockaddrAny	struct
2994	syscall	Linger	struct
2995	syscall	Iovec	struct
2996	syscall	IPMreq	struct
2997	syscall	IPMreqn	struct
2998	syscall	IPv6Mreq	struct
2999	syscall	Msghdr	struct
3000	syscall	Cmsghdr	struct
3001	syscall	Inet4Pktinfo	struct
3002	syscall	Inet6Pktinfo	struct
3003	syscall	IPv6MTUInfo	struct
3004	syscall	ICMPv6Filter	struct
3005	syscall	Ucred	struct
3006	syscall	TCPInfo	struct
3007	syscall	NlMsghdr	struct
3008	syscall	NlMsgerr	struct
3009	syscall	RtGenmsg	struct
3010	syscall	NlAttr	struct
3011	syscall	RtAttr	struct
3012	syscall	IfInfomsg	struct
3013	syscall	IfAddrmsg	struct
3014	syscall	RtMsg	struct
3015	syscall	RtNexthop	struct
3016	syscall	SockFilter	struct
3017	syscall	SockFprog	struct
3018	syscall	InotifyEvent	struct
3019	syscall	PtraceRegs	struct
3020	syscall	FdSet	struct
3021	syscall	Sysinfo_t	struct
3022	syscall	Utsname	struct
3023	syscall	Ustat_t	struct
3024	syscall	EpollEvent	struct
3025	syscall	Termios	struct
3026	syscall	Timespec	struct
3027	syscall	Timeval	struct
3028	syscall	Timex	struct
3029	syscall	Time_t	int64
3030	syscall	Tms	struct
3031	syscall	Utimbuf	struct
3032	syscall	Rusage	struct
3033	syscall	Rlimit	struct
3034	syscall	Stat_t	struct
3035	syscall	Statfs_t	struct
3036	syscall	Dirent	struct
3037	syscall	Fsid	struct
3038	syscall	Flock_t	struct
3039	syscall	RawSockaddrInet4	struct
3040	syscall	RawSockaddrInet6	struct
3041	syscall	RawSockaddrUnix	struct
3042	syscall	RawSockaddrLinklayer	struct
3043	syscall	RawSockaddrNetlink	struct
3044	syscall	RawSockaddr	struct
3045	syscall	RawSockaddrAny	struct
3046	syscall	Linger	struct
3047	syscall	Iovec	struct
3048	syscall	IPMreq	struct
3049	syscall	IPMreqn	struct
3050	syscall	IPv6Mreq	struct
3051	syscall	Msghdr	struct
3052	syscall	Cmsghdr	struct
3053	syscall	Inet4Pktinfo	struct
3054	syscall	Inet6Pktinfo	struct
3055	syscall	IPv6MTUInfo	struct
3056	syscall	ICMPv6Filter	struct
3057	syscall	Ucred	struct
3058	syscall	TCPInfo	struct
3059	syscall	NlMsghdr	struct
3060	syscall	NlMsgerr	struct
3061	syscall	RtGenmsg	struct
3062	syscall	NlAttr	struct
3063	syscall	RtAttr	struct
3064	syscall	IfInfomsg	struct
3065	syscall	IfAddrmsg	struct
3066	syscall	RtMsg	struct
3067	syscall	RtNexthop	struct
3068	syscall	SockFilter	struct
3069	syscall	SockFprog	struct
3070	syscall	InotifyEvent	struct
3071	syscall	PtraceRegs	struct
3072	syscall	PtracePsw	struct
3073	syscall	PtraceFpregs	struct
3074	syscall	PtracePer	struct
3075	syscall	FdSet	struct
3076	syscall	Sysinfo_t	struct
3077	syscall	Utsname	struct
3078	syscall	Ustat_t	struct
3079	syscall	EpollEvent	struct
3080	syscall	Termios	struct
3081	syscall	Timespec	struct
3082	syscall	Timeval	struct
3083	syscall	Rusage	struct
3084	syscall	Rlimit	struct
3085	syscall	Stat_t	struct
3086	syscall	Statfs_t	[]byte
3087	syscall	Flock_t	struct
3088	syscall	Dirent	struct
3089	syscall	Fsid	struct
3090	syscall	RawSockaddrInet4	struct
3091	syscall	RawSockaddrInet6	struct
3092	syscall	RawSockaddrUnix	struct
3093	syscall	RawSockaddrDatalink	struct
3094	syscall	RawSockaddr	struct
3095	syscall	RawSockaddrAny	struct
3096	syscall	Linger	struct
3097	syscall	Iovec	struct
3098	syscall	IPMreq	struct
3099	syscall	IPv6Mreq	struct
3100	syscall	Msghdr	struct
3101	syscall	Cmsghdr	struct
3102	syscall	Inet6Pktinfo	struct
3103	syscall	IPv6MTUInfo	struct
3104	syscall	ICMPv6Filter	struct
3105	syscall	Kevent_t	struct
3106	syscall	FdSet	struct
3107	syscall	IfMsghdr	struct
3108	syscall	IfData	struct
3109	syscall	IfaMsghdr	struct
3110	syscall	IfAnnounceMsghdr	struct
3111	syscall	RtMsghdr	struct
3112	syscall	RtMetrics	struct
3113	syscall	Mclpool	[]byte
3114	syscall	BpfVersion	struct
3115	syscall	BpfStat	struct
3116	syscall	BpfProgram	struct
3117	syscall	BpfInsn	struct
3118	syscall	BpfHdr	struct
3119	syscall	BpfTimeval	struct
3120	syscall	Termios	struct
3121	syscall	Sysctlnode	struct
3122	syscall	Timespec	struct
3123	syscall	Timeval	struct
3124	syscall	Rusage	struct
3125	syscall	Rlimit	struct
3126	syscall	Stat_t	struct
3127	syscall	Statfs_t	[]byte
3128	syscall	Flock_t	struct
3129	syscall	Dirent	struct
3130	syscall	Fsid	struct
3131	syscall	RawSockaddrInet4	struct
3132	syscall	RawSockaddrInet6	struct
3133	syscall	RawSockaddrUnix	struct
3134	syscall	RawSockaddrDatalink	struct
3135	syscall	RawSockaddr	struct
3136	syscall	RawSockaddrAny	struct
3137	syscall	Linger	struct
3138	syscall	Iovec	struct
3139	syscall	IPMreq	struct
3140	syscall	IPv6Mreq	struct
3141	syscall	Msghdr	struct
3142	syscall	Cmsghdr	struct
3143	syscall	Inet6Pktinfo	struct
3144	syscall	IPv6MTUInfo	struct
3145	syscall	ICMPv6Filter	struct
3146	syscall	Kevent_t	struct
3147	syscall	FdSet	struct
3148	syscall	IfMsghdr	struct
3149	syscall	IfData	struct
3150	syscall	IfaMsghdr	struct
3151	syscall	IfAnnounceMsghdr	struct
3152	syscall	RtMsghdr	struct
3153	syscall	RtMetrics	struct
3154	syscall	Mclpool	[]byte
3155	syscall	BpfVersion	struct
3156	syscall	BpfStat	struct
3157	syscall	BpfProgram	struct
3158	syscall	BpfInsn	struct
3159	syscall	BpfHdr	struct
3160	syscall	BpfTimeval	struct
3161	syscall	Termios	struct
3162	syscall	Sysctlnode	struct
3163	syscall	Timespec	struct
3164	syscall	Timeval	struct
3165	syscall	Rusage	struct
3166	syscall	Rlimit	struct
3167	syscall	Stat_t	struct
3168	syscall	Statfs_t	[]byte
3169	syscall	Flock_t	struct
3170	syscall	Dirent	struct
3171	syscall	Fsid	struct
3172	syscall	RawSockaddrInet4	struct
3173	syscall	RawSockaddrInet6	struct
3174	syscall	RawSockaddrUnix	struct
3175	syscall	RawSockaddrDatalink	struct
3176	syscall	RawSockaddr	struct
3177	syscall	RawSockaddrAny	struct
3178	syscall	Linger	struct
3179	syscall	Iovec	struct
3180	syscall	IPMreq	struct
3181	syscall	IPv6Mreq	struct
3182	syscall	Msghdr	struct
3183	syscall	Cmsghdr	struct
3184	syscall	Inet6Pktinfo	struct
3185	syscall	IPv6MTUInfo	struct
3186	syscall	ICMPv6Filter	struct
3187	syscall	Kevent_t	struct
3188	syscall	FdSet	struct
3189	syscall	IfMsghdr	struct
3190	syscall	IfData	struct
3191	syscall	IfaMsghdr	struct
3192	syscall	IfAnnounceMsghdr	struct
3193	syscall	RtMsghdr	struct
3194	syscall	RtMetrics	struct
3195	syscall	Mclpool	[]byte
3196	syscall	BpfVersion	struct
3197	syscall	BpfStat	struct
3198	syscall	BpfProgram	struct
3199	syscall	BpfInsn	struct
3200	syscall	BpfHdr	struct
3201	syscall	BpfTimeval	struct
3202	syscall	Termios	struct
3203	syscall	Sysctlnode	struct
3204	syscall	Timespec	struct
3205	syscall	Timeval	struct
3206	syscall	Rusage	struct
3207	syscall	Rlimit	struct
3208	syscall	Stat_t	struct
3209	syscall	Statfs_t	struct
3210	syscall	Flock_t	struct
3211	syscall	Dirent	struct
3212	syscall	Fsid	struct
3213	syscall	RawSockaddrInet4	struct
3214	syscall	RawSockaddrInet6	struct
3215	syscall	RawSockaddrUnix	struct
3216	syscall	RawSockaddrDatalink	struct
3217	syscall	RawSockaddr	struct
3218	syscall	RawSockaddrAny	struct
3219	syscall	Linger	struct
3220	syscall	Iovec	struct
3221	syscall	IPMreq	struct
3222	syscall	IPv6Mreq	struct
3223	syscall	Msghdr	struct
3224	syscall	Cmsghdr	struct
3225	syscall	Inet6Pktinfo	struct
3226	syscall	IPv6MTUInfo	struct
3227	syscall	ICMPv6Filter	struct
3228	syscall	Kevent_t	struct
3229	syscall	FdSet	struct
3230	syscall	IfMsghdr	struct
3231	syscall	IfData	struct
3232	syscall	IfaMsghdr	struct
3233	syscall	IfAnnounceMsghdr	struct
3234	syscall	RtMsghdr	struct
3235	syscall	RtMetrics	struct
3236	syscall	Mclpool	struct
3237	syscall	BpfVersion	struct
3238	syscall	BpfStat	struct
3239	syscall	BpfProgram	struct
3240	syscall	BpfInsn	struct
3241	syscall	BpfHdr	struct
3242	syscall	BpfTimeval	struct
3243	syscall	Termios	struct
3244	syscall	Timespec	struct
3245	syscall	Timeval	struct
3246	syscall	Rusage	struct
3247	syscall	Rlimit	struct
3248	syscall	Stat_t	struct
3249	syscall	Statfs_t	struct
3250	syscall	Flock_t	struct
3251	syscall	Dirent	struct
3252	syscall	Fsid	struct
3253	syscall	RawSockaddrInet4	struct
3254	syscall	RawSockaddrInet6	struct
3255	syscall	RawSockaddrUnix	struct
3256	syscall	RawSockaddrDatalink	struct
3257	syscall	RawSockaddr	struct
3258	syscall	RawSockaddrAny	struct
3259	syscall	Linger	struct
3260	syscall	Iovec	struct
3261	syscall	IPMreq	struct
3262	syscall	IPv6Mreq	struct
3263	syscall	Msghdr	struct
3264	syscall	Cmsghdr	struct
3265	syscall	Inet6Pktinfo	struct
3266	syscall	IPv6MTUInfo	struct
3267	syscall	ICMPv6Filter	struct
3268	syscall	Kevent_t	struct
3269	syscall	FdSet	struct
3270	syscall	IfMsghdr	struct
3271	syscall	IfData	struct
3272	syscall	IfaMsghdr	struct
3273	syscall	IfAnnounceMsghdr	struct
3274	syscall	RtMsghdr	struct
3275	syscall	RtMetrics	struct
3276	syscall	Mclpool	struct
3277	syscall	BpfVersion	struct
3278	syscall	BpfStat	struct
3279	syscall	BpfProgram	struct
3280	syscall	BpfInsn	struct
3281	syscall	BpfHdr	struct
3282	syscall	BpfTimeval	struct
3283	syscall	Termios	struct
3284	syscall	Timespec	struct
3285	syscall	Timeval	struct
3286	syscall	Rusage	struct
3287	syscall	Rlimit	struct
3288	syscall	Stat_t	struct
3289	syscall	Statfs_t	struct
3290	syscall	Flock_t	struct
3291	syscall	Dirent	struct
3292	syscall	Fsid	struct
3293	syscall	RawSockaddrInet4	struct
3294	syscall	RawSockaddrInet6	struct
3295	syscall	RawSockaddrUnix	struct
3296	syscall	RawSockaddrDatalink	struct
3297	syscall	RawSockaddr	struct
3298	syscall	RawSockaddrAny	struct
3299	syscall	Linger	struct
3300	syscall	Iovec	struct
3301	syscall	IPMreq	struct
3302	syscall	IPv6Mreq	struct
3303	syscall	Msghdr	struct
3304	syscall	Cmsghdr	struct
3305	syscall	Inet6Pktinfo	struct
3306	syscall	IPv6MTUInfo	struct
3307	syscall	ICMPv6Filter	struct
3308	syscall	Kevent_t	struct
3309	syscall	FdSet	struct
3310	syscall	IfMsghdr	struct
3311	syscall	IfData	struct
3312	syscall	IfaMsghdr	struct
3313	syscall	IfAnnounceMsghdr	struct
3314	syscall	RtMsghdr	struct
3315	syscall	RtMetrics	struct
3316	syscall	Mclpool	struct
3317	syscall	BpfVersion	struct
3318	syscall	BpfStat	struct
3319	syscall	BpfProgram	struct
3320	syscall	BpfInsn	struct
3321	syscall	BpfHdr	struct
3322	syscall	BpfTimeval	struct
3323	syscall	Termios	struct
3324	syscall	Timespec	struct
3325	syscall	Timeval	struct
3326	syscall	Timeval32	struct
3327	syscall	Rusage	struct
3328	syscall	Rlimit	struct
3329	syscall	Stat_t	struct
3330	syscall	Flock_t	struct
3331	syscall	Dirent	struct
3332	syscall	RawSockaddrInet4	struct
3333	syscall	RawSockaddrInet6	struct
3334	syscall	RawSockaddrUnix	struct
3335	syscall	RawSockaddrDatalink	struct
3336	syscall	RawSockaddr	struct
3337	syscall	RawSockaddrAny	struct
3338	syscall	Linger	struct
3339	syscall	Iovec	struct
3340	syscall	IPMreq	struct
3341	syscall	IPv6Mreq	struct
3342	syscall	Msghdr	struct
3343	syscall	Cmsghdr	struct
3344	syscall	Inet6Pktinfo	struct
3345	syscall	IPv6MTUInfo	struct
3346	syscall	ICMPv6Filter	struct
3347	syscall	FdSet	struct
3348	syscall	IfMsghdr	struct
3349	syscall	IfData	struct
3350	syscall	IfaMsghdr	struct
3351	syscall	RtMsghdr	struct
3352	syscall	RtMetrics	struct
3353	syscall	BpfVersion	struct
3354	syscall	BpfStat	struct
3355	syscall	BpfProgram	struct
3356	syscall	BpfInsn	struct
3357	syscall	BpfTimeval	struct
3358	syscall	BpfHdr	struct
3359	syscall	Termios	struct
3360	syscall	Timeval	struct
3361	syscall	SecurityAttributes	struct
3362	syscall	Overlapped	struct
3363	syscall	FileNotifyInformation	struct
3364	syscall	Filetime	struct
3365	syscall	Win32finddata	struct
3366	syscall	ByHandleFileInformation	struct
3367	syscall	Win32FileAttributeData	struct
3368	syscall	StartupInfo	struct
3369	syscall	ProcessInformation	struct
3370	syscall	ProcessEntry32	struct
3371	syscall	Systemtime	struct
3372	syscall	Timezoneinformation	struct
3373	syscall	WSABuf	struct
3374	syscall	Hostent	struct
3375	syscall	Protoent	struct
3376	syscall	DNSSRVData	struct
3377	syscall	DNSPTRData	struct
3378	syscall	DNSMXData	struct
3379	syscall	DNSTXTData	struct
3380	syscall	DNSRecord	struct
3381	syscall	TransmitFileBuffers	struct
3382	syscall	SockaddrGen	[]byte
3383	syscall	InterfaceInfo	struct
3384	syscall	IpAddressString	struct
3385	syscall	IpMaskString	syscall.IpAddressString
3386	syscall	IpAddrString	struct
3387	syscall	IpAdapterInfo	struct
3388	syscall	MibIfRow	struct
3389	syscall	CertContext	struct
3390	syscall	CertChainContext	struct
3391	syscall	CertSimpleChain	struct
3392	syscall	CertChainElement	struct
3393	syscall	CertRevocationInfo	struct
3394	syscall	CertTrustStatus	struct
3395	syscall	CertUsageMatch	struct
3396	syscall	CertEnhKeyUsage	struct
3397	syscall	CertChainPara	struct
3398	syscall	CertChainPolicyPara	struct
3399	syscall	SSLExtraCertChainPolicyPara	struct
3400	syscall	CertChainPolicyStatus	struct
3401	syscall	AddrinfoW	struct
3402	syscall	GUID	struct
3403	syscall	WSAProtocolInfo	struct
3404	syscall	WSAProtocolChain	struct
3405	syscall	TCPKeepalive	struct
3406	syscall	WSAData	struct
3407	syscall	Servent	struct
3408	syscall	WSAData	struct
3409	syscall	Servent	struct
3410	testing	InternalBenchmark	struct
3411	testing	B	struct
3412	testing	BenchmarkResult	struct
3413	testing	PB	struct
3414	testing	CoverBlock	struct
3415	testing	Cover	struct
3416	testing	InternalExample	struct
3417	testdeps	TestDeps	struct
3418	quick	Generator	
3419	quick	Config	struct
3420	quick	SetupError	string
3421	quick	CheckError	struct
3422	quick	CheckEqualError	struct
3423	testing	TB	
3424	testing	T	struct
3425	testing	InternalTest	struct
3426	testing	M	struct
3427	scanner	Position	struct
3428	scanner	Scanner	struct
3429	tabwriter	Writer	struct
3430	template	ExecError	struct
3431	template	FuncMap	map[string]interface{}
3432	parse	Node	
3433	parse	NodeType	int
3434	parse	Pos	int
3435	parse	ListNode	struct
3436	parse	TextNode	struct
3437	parse	PipeNode	struct
3438	parse	ActionNode	struct
3439	parse	CommandNode	struct
3440	parse	IdentifierNode	struct
3441	parse	VariableNode	struct
3442	parse	DotNode	struct
3443	parse	NilNode	struct
3444	parse	FieldNode	struct
3445	parse	ChainNode	struct
3446	parse	BoolNode	struct
3447	parse	NumberNode	struct
3448	parse	StringNode	struct
3449	parse	BranchNode	struct
3450	parse	IfNode	struct
3451	parse	RangeNode	struct
3452	parse	WithNode	struct
3453	parse	TemplateNode	struct
3454	parse	Tree	struct
3455	template	Template	struct
3456	time	ParseError	struct
3457	main	MapZone	struct
3458	main	SupplementalData	struct
3459	time	Timer	struct
3460	time	Ticker	struct
3461	time	Time	struct
3462	time	Month	int
3463	time	Weekday	int
3464	time	Duration	int64
3465	time	Location	struct
3466	unicode	RangeTable	struct
3467	unicode	Range16	struct
3468	unicode	Range32	struct
3469	unicode	CaseRange	struct
3470	unicode	SpecialCase	[]unicode.CaseRange
3471	main	Char	struct
3472	main	Script	struct
3473	main	State	int
3474	main	Op	func(rune) bool
3475	unsafe	ArbitraryType	int
3476	unsafe	Pointer	*unsafe.ArbitraryType
3477	hpack	Encoder	struct
3478	hpack	DecodingError	struct
3479	hpack	InvalidIndexError	int
3480	hpack	HeaderField	struct
3481	hpack	Decoder	struct
3482	idna	Option	func(*idna.options)
3483	idna	Profile	struct
3484	lif	Addr	
3485	lif	Inet4Addr	struct
3486	lif	Inet6Addr	struct
3487	lif	Link	struct
3488	nettest	MakePipe	func() (net.Conn, func(), error)
3489	proxy	PerHost	struct
3490	proxy	Dialer	
3491	proxy	Auth	struct
3492	route	Addr	
3493	route	LinkAddr	struct
3494	route	Inet4Addr	struct
3495	route	Inet6Addr	struct
3496	route	DefaultAddr	struct
3497	route	InterfaceMessage	struct
3498	route	InterfaceAddrMessage	struct
3499	route	InterfaceMulticastAddrMessage	struct
3500	route	InterfaceAnnounceMessage	struct
3501	route	Message	
3502	route	Sys	
3503	route	SysType	int
3504	route	RouteMessage	struct
3505	route	RIBType	int
3506	route	RouteMetrics	struct
3507	route	InterfaceMetrics	struct
3508	route	RouteMetrics	struct
3509	route	InterfaceMetrics	struct
3510	route	RouteMetrics	struct
3511	route	InterfaceMetrics	struct
3512	route	RouteMetrics	struct
3513	route	InterfaceMetrics	struct
3514	route	RouteMetrics	struct
3515	route	InterfaceMetrics	struct
3516	bidirule	Transformer	struct
3517	transform	Transformer	
3518	transform	SpanningTransformer	
3519	transform	NopResetter	struct
3520	transform	Reader	struct
3521	transform	Writer	struct
3522	bidi	Direction	int
3523	bidi	Option	func(*bidi.options)
3524	bidi	Paragraph	struct
3525	bidi	Ordering	struct
3526	bidi	Run	struct
3527	bidi	Properties	struct
3528	bidi	Class	uint
3529	norm	Properties	struct
3530	norm	Iter	struct
3531	norm	Form	int
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
20	main	F	{}	{}		12
21	ssa	Logf	{string,"...interface{}"}	{}		14
22	ssa	Log	{}	{bool}		14
23	ssa	Fatalf	{src.XPos,string,"...interface{}"}	{}		14
24	ssa	Warnl	{src.XPos,string,"...interface{}"}	{}		14
25	ssa	Debug_checknil	{}	{bool}		14
26	ssa	Debug_wb	{}	{bool}		14
27	ssa	CanSSA	{*types.Type}	{bool}		15
28	ssa	ssa.Logger	{}	{}		15
29	ssa	StringData	{string}	{"interface{}"}		15
30	ssa	Auto	{src.XPos,*types.Type}	{ssa.GCNode}		15
31	ssa	SplitString	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		15
32	ssa	SplitInterface	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		15
33	ssa	SplitSlice	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot,ssa.LocalSlot}		15
34	ssa	SplitComplex	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		15
35	ssa	SplitStruct	{ssa.LocalSlot,int}	{ssa.LocalSlot}		15
36	ssa	SplitArray	{ssa.LocalSlot}	{ssa.LocalSlot}		15
37	ssa	SplitInt64	{ssa.LocalSlot}	{ssa.LocalSlot,ssa.LocalSlot}		15
38	ssa	DerefItab	{*obj.LSym,int64}	{*obj.LSym}		15
39	ssa	Line	{src.XPos}	{string}		15
40	ssa	AllocFrame	{*ssa.Func}	{}		15
41	ssa	Syslook	{string}	{*obj.LSym}		15
42	ssa	UseWriteBarrier	{}	{bool}		15
43	ssa	Typ	{}	{*types.Type}		16
44	ssa	String	{}	{string}		16
45	ssa	Name	{}	{string}		17
46	syntax	Pos	{}	{src.Pos}		19
47	syntax	syntax.Node	{}	{}		20
48	syntax	syntax.Node	{}	{}		21
49	syntax	syntax.Node	{}	{}		22
50	syntax	syntax.Stmt	{}	{}		23
51	pkg	ExportedMethod	{}	{}		25
52	pkg	io.Reader	{}	{}		25
53	dwarf	Len	{}	{int64}		26
54	dwarf	PtrSize	{}	{int}		27
55	dwarf	AddInt	{dwarf.Sym,int,int64}	{}		27
56	dwarf	AddBytes	{dwarf.Sym,[]byte}	{}		27
57	dwarf	AddAddress	{dwarf.Sym,"interface{}",int64}	{}		27
58	dwarf	AddSectionOffset	{dwarf.Sym,int,"interface{}",int64}	{}		27
59	dwarf	AddString	{dwarf.Sym,string}	{}		27
60	dwarf	SymValue	{dwarf.Sym}	{int64}		27
61	objfile	PCToLine	{uint64}	{string,int,*gosym.Func}		31
62	objfile	String	{uint64}	{string}		32
63	main	Name	{}	{string}		33
64	main	Stat	{}	{os.FileInfo,error}		33
65	main	Read	{[]byte}	{int,error}		33
66	main	Close	{}	{error}		33
67	driver	Open	{string}	{io.WriteCloser,error}		35
68	driver	Bool	{string,bool,string}	{*bool}		36
69	driver	Int	{string,int,string}	{*int}		36
70	driver	Float64	{string,float64,string}	{*float64}		36
71	driver	String	{string,string,string}	{*string}		36
72	driver	BoolVar	{*bool,string,bool,string}	{}		36
73	driver	IntVar	{*int,string,int,string}	{}		36
74	driver	Float64Var	{*float64,string,float64,string}	{}		36
75	driver	StringVar	{*string,string,string,string}	{}		36
76	driver	StringList	{string,string,string}	{*[]*string}		36
77	driver	ExtraUsage	{}	{string}		36
78	driver	Parse	{func()}	{[]string}		36
79	driver	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		37
80	driver	Symbolize	{string,driver.MappingSources,*profile.Profile}	{error}		38
81	driver	Open	{string,uint64,uint64,uint64}	{driver.ObjFile,error}		39
82	driver	Disasm	{string,uint64,uint64}	{[]driver.Inst,error}		39
83	driver	Name	{}	{string}		40
84	driver	Base	{}	{uint64}		40
85	driver	BuildID	{}	{string}		40
86	driver	SourceLine	{uint64}	{[]driver.Frame,error}		40
87	driver	Symbols	{*regexp.Regexp,uint64}	{[]*driver.Sym,error}		40
88	driver	Close	{}	{error}		40
89	driver	ReadLine	{string}	{string,error}		41
90	driver	Print	{"...interface{}"}	{}		41
91	driver	PrintErr	{"...interface{}"}	{}		41
92	driver	IsTerminal	{}	{bool}		41
93	driver	SetAutoComplete	{"func(string) string"}	{}		41
94	plugin	Open	{string}	{io.WriteCloser,error}		42
95	plugin	Bool	{string,bool,string}	{*bool}		43
96	plugin	Int	{string,int,string}	{*int}		43
97	plugin	Float64	{string,float64,string}	{*float64}		43
98	plugin	String	{string,string,string}	{*string}		43
99	plugin	BoolVar	{*bool,string,bool,string}	{}		43
100	plugin	IntVar	{*int,string,int,string}	{}		43
101	plugin	Float64Var	{*float64,string,float64,string}	{}		43
102	plugin	StringVar	{*string,string,string,string}	{}		43
103	plugin	StringList	{string,string,string}	{*[]*string}		43
104	plugin	ExtraUsage	{}	{string}		43
105	plugin	Parse	{func()}	{[]string}		43
106	plugin	Fetch	{string,time.Duration,time.Duration}	{*profile.Profile,string,error}		44
107	plugin	Symbolize	{string,plugin.MappingSources,*profile.Profile}	{error}		45
108	plugin	Open	{string,uint64,uint64,uint64}	{plugin.ObjFile,error}		46
109	plugin	Disasm	{string,uint64,uint64}	{[]plugin.Inst,error}		46
110	plugin	Name	{}	{string}		47
111	plugin	Base	{}	{uint64}		47
112	plugin	BuildID	{}	{string}		47
113	plugin	SourceLine	{uint64}	{[]plugin.Frame,error}		47
114	plugin	Symbols	{*regexp.Regexp,uint64}	{[]*plugin.Sym,error}		47
115	plugin	Close	{}	{error}		47
116	plugin	ReadLine	{string}	{string,error}		48
117	plugin	Print	{"...interface{}"}	{}		48
118	plugin	PrintErr	{"...interface{}"}	{}		48
119	plugin	IsTerminal	{}	{bool}		48
120	plugin	SetAutoComplete	{"func(string) string"}	{}		48
121	demangle	Traverse	{"func(demangle.AST) bool"}	{}		49
122	demangle	Copy	{"func(demangle.AST) demangle.AST","func(demangle.AST) bool"}	{demangle.AST}		49
123	demangle	GoString	{}	{string}		49
124	armasm	IsArg	{}	{}		50
125	armasm	String	{}	{string}		50
126	ppc64asm	IsArg	{}	{}		51
127	ppc64asm	String	{}	{string}		51
128	x86asm	String	{}	{string}		52
129	testdata	ReadByte	{}	{byte}		53
130	testdata	Pointer	{}	{uintptr}		54
131	testdata	UnsafeAddr	{}	{uintptr}		54
132	flate	Reset	{io.Reader,[]byte}	{error}		55
133	flate	io.Reader	{}	{}		56
134	flate	io.ByteReader	{}	{}		56
135	zlib	Reset	{io.Reader,[]byte}	{error}		57
136	heap	sort.Interface	{}	{}		58
137	heap	Push	{"interface{}"}	{}		58
138	heap	Pop	{}	{"interface{}"}		58
139	context	Deadline	{}	{time.Time,bool}		61
140	context	Done	{}	{"chan struct{}\n"}		61
141	context	Err	{}	{error}		61
142	context	Value	{"interface{}"}	{"interface{}"}		61
143	cipher	BlockSize	{}	{int}		62
144	cipher	Encrypt	{[]byte,[]byte}	{}		62
145	cipher	Decrypt	{[]byte,[]byte}	{}		62
146	cipher	XORKeyStream	{[]byte,[]byte}	{}		63
147	cipher	BlockSize	{}	{int}		64
148	cipher	CryptBlocks	{[]byte,[]byte}	{}		64
149	cipher	NonceSize	{}	{int}		65
150	cipher	Overhead	{}	{int}		65
151	cipher	Seal	{[]byte,[]byte,[]byte,[]byte}	{[]byte}		65
152	cipher	Open	{[]byte,[]byte,[]byte,[]byte}	{[]byte,error}		65
153	crypto	Public	{}	{crypto.PublicKey}		68
154	crypto	Sign	{io.Reader,[]byte,crypto.SignerOpts}	{[]byte,error}		68
155	crypto	HashFunc	{}	{crypto.Hash}		69
156	crypto	Public	{}	{crypto.PublicKey}		70
157	crypto	Decrypt	{io.Reader,[]byte,crypto.DecrypterOpts}	{[]byte,error}		70
158	elliptic	Params	{}	{*elliptic.CurveParams}		72
159	elliptic	IsOnCurve	{*big.Int,*big.Int}	{bool}		72
160	elliptic	Add	{*big.Int,*big.Int,*big.Int,*big.Int}	{*big.Int}		72
161	elliptic	Double	{*big.Int,*big.Int}	{*big.Int}		72
162	elliptic	ScalarMult	{*big.Int,*big.Int,[]byte}	{*big.Int}		72
163	elliptic	ScalarBaseMult	{[]byte}	{*big.Int}		72
164	tls	Get	{string}	{*tls.ClientSessionState,bool}		73
165	tls	Put	{string,*tls.ClientSessionState}	{}		73
166	driver	Open	{string}	{driver.Conn,error}		78
167	driver	Ping	{context.Context}	{error}		79
168	driver	Exec	{string,[]driver.Value}	{driver.Result,error}		80
169	driver	ExecContext	{context.Context,string,[]driver.NamedValue}	{driver.Result,error}		81
170	driver	Query	{string,[]driver.Value}	{driver.Rows,error}		82
171	driver	QueryContext	{context.Context,string,[]driver.NamedValue}	{driver.Rows,error}		83
172	driver	Prepare	{string}	{driver.Stmt,error}		84
173	driver	Close	{}	{error}		84
174	driver	Begin	{}	{driver.Tx,error}		84
175	driver	PrepareContext	{context.Context,string}	{driver.Stmt,error}		85
176	driver	BeginTx	{context.Context,driver.TxOptions}	{driver.Tx,error}		86
177	driver	LastInsertId	{}	{int64,error}		87
178	driver	RowsAffected	{}	{int64,error}		87
179	driver	Close	{}	{error}		88
180	driver	NumInput	{}	{int}		88
181	driver	Exec	{[]driver.Value}	{driver.Result,error}		88
182	driver	Query	{[]driver.Value}	{driver.Rows,error}		88
183	driver	ExecContext	{context.Context,[]driver.NamedValue}	{driver.Result,error}		89
184	driver	QueryContext	{context.Context,[]driver.NamedValue}	{driver.Rows,error}		90
185	driver	CheckNamedValue	{*driver.NamedValue}	{error}		91
186	driver	ColumnConverter	{int}	{driver.ValueConverter}		92
187	driver	Columns	{}	{[]string}		93
188	driver	Close	{}	{error}		93
189	driver	Next	{[]driver.Value}	{error}		93
190	driver	driver.Rows	{}	{}		94
191	driver	HasNextResultSet	{}	{bool}		94
192	driver	NextResultSet	{}	{error}		94
193	driver	driver.Rows	{}	{}		95
194	driver	ColumnTypeScanType	{int}	{reflect.Type}		95
195	driver	driver.Rows	{}	{}		96
196	driver	ColumnTypeDatabaseTypeName	{int}	{string}		96
197	driver	driver.Rows	{}	{}		97
198	driver	ColumnTypeLength	{int}	{int64,bool}		97
199	driver	driver.Rows	{}	{}		98
200	driver	ColumnTypeNullable	{int}	{bool}		98
201	driver	driver.Rows	{}	{}		99
202	driver	ColumnTypePrecisionScale	{int}	{int64,bool}		99
203	driver	Commit	{}	{error}		100
204	driver	Rollback	{}	{error}		100
205	driver	ConvertValue	{"interface{}"}	{driver.Value,error}		101
206	driver	Value	{}	{driver.Value,error}		102
207	sql	Scan	{"interface{}"}	{error}		104
208	sql	LastInsertId	{}	{int64,error}		106
209	sql	RowsAffected	{}	{int64,error}		106
210	dwarf	Common	{}	{*dwarf.CommonType}		108
211	dwarf	String	{}	{string}		108
212	dwarf	Size	{}	{int64}		108
213	macho	Raw	{}	{[]byte}		109
214	binary	Uint16	{[]byte}	{uint16}		111
215	binary	Uint32	{[]byte}	{uint32}		111
216	binary	Uint64	{[]byte}	{uint64}		111
217	binary	PutUint16	{[]byte,uint16}	{}		111
218	binary	PutUint32	{[]byte,uint32}	{}		111
219	binary	PutUint64	{[]byte,uint64}	{}		111
220	binary	String	{}	{string}		111
221	encoding	MarshalBinary	{}	{[]byte,error}		112
222	encoding	UnmarshalBinary	{[]byte}	{error}		113
223	encoding	MarshalText	{}	{[]byte,error}		114
224	encoding	UnmarshalText	{[]byte}	{error}		115
225	gob	GobEncode	{}	{[]byte,error}		116
226	gob	GobDecode	{[]byte}	{error}		117
227	json	UnmarshalJSON	{[]byte}	{error}		118
228	json	MarshalJSON	{}	{[]byte,error}		119
229	xml	MarshalXML	{*xml.Encoder,xml.StartElement}	{error}		121
230	xml	MarshalXMLAttr	{xml.Name}	{xml.Attr,error}		122
231	xml	UnmarshalXML	{*xml.Decoder,xml.StartElement}	{error}		123
232	xml	UnmarshalXMLAttr	{xml.Attr}	{error}		124
233	expvar	String	{}	{string}		126
234	flag	String	{}	{string}		127
235	flag	Set	{string}	{error}		127
236	flag	flag.Value	{}	{}		128
237	flag	Get	{}	{"interface{}"}		128
238	fmt	Write	{[]byte}	{int,error}		129
239	fmt	Width	{}	{int,bool}		129
240	fmt	Precision	{}	{int,bool}		129
241	fmt	Flag	{int}	{bool}		129
242	fmt	Format	{fmt.State,rune}	{}		130
243	fmt	String	{}	{string}		131
244	fmt	GoString	{}	{string}		132
245	fmt	ReadRune	{}	{rune,int,error}		133
246	fmt	UnreadRune	{}	{error}		133
247	fmt	SkipSpace	{}	{}		133
248	fmt	Token	{bool,"func(rune) bool"}	{[]byte,error}		133
249	fmt	Width	{}	{int,bool}		133
250	fmt	Read	{[]byte}	{int,error}		133
251	fmt	Scan	{fmt.ScanState,rune}	{error}		134
252	ast	Pos	{}	{token.Pos}		135
253	ast	End	{}	{token.Pos}		135
254	ast	ast.Node	{}	{}		136
255	ast	ast.Node	{}	{}		137
256	ast	ast.Node	{}	{}		138
257	ast	ast.Node	{}	{}		139
258	ast	Visit	{ast.Node}	{ast.Visitor}		143
259	constant	Kind	{}	{constant.Kind}		144
260	constant	String	{}	{string}		144
261	constant	ExactString	{}	{string}		144
262	exports	exports.T12	{}	{}		151
263	exports	exports.T13	{}	{}		151
264	p	M	{}	{}		152
265	types	Import	{string}	{*types.Package,error}		154
266	types	types.Importer	{}	{}		155
267	types	ImportFrom	{string,string,types.ImportMode}	{*types.Package,error}		155
268	types	Parent	{}	{*types.Scope}		156
269	types	Pos	{}	{token.Pos}		156
270	types	Pkg	{}	{*types.Package}		156
271	types	Name	{}	{string}		156
272	types	Type	{}	{types.Type}		156
273	types	Exported	{}	{bool}		156
274	types	Id	{}	{string}		156
275	types	String	{}	{string}		156
276	types	Alignof	{types.Type}	{int64}		157
277	types	Offsetsof	{[]*types.Var}	{[]int64}		157
278	types	Sizeof	{types.Type}	{int64}		157
279	types	Underlying	{}	{types.Type}		158
280	types	String	{}	{string}		158
281	hash	io.Writer	{}	{}		159
282	hash	Sum	{[]byte}	{[]byte}		159
283	hash	Reset	{}	{}		159
284	hash	Size	{}	{int}		159
285	hash	BlockSize	{}	{int}		159
286	hash	hash.Hash	{}	{}		160
287	hash	Sum32	{}	{uint32}		160
288	hash	hash.Hash	{}	{}		161
289	hash	Sum64	{}	{uint64}		161
290	color	RGBA	{}	{uint32}		162
291	color	Convert	{color.Color}	{color.Color}		163
292	draw	image.Image	{}	{}		164
293	draw	Set	{int,int,color.Color}	{}		164
294	draw	Quantize	{color.Palette,image.Image}	{color.Palette}		165
295	draw	Draw	{draw.Image,image.Rectangle,image.Image,image.Point}	{}		166
296	image	ColorModel	{}	{color.Model}		167
297	image	Bounds	{}	{image.Rectangle}		167
298	image	At	{int,int}	{color.Color}		167
299	image	ColorIndexAt	{int,int}	{uint8}		168
300	image	image.Image	{}	{}		168
301	jpeg	io.ByteReader	{}	{}		169
302	jpeg	io.Reader	{}	{}		169
303	png	Get	{}	{*png.EncoderBuffer}		170
304	png	Put	{*png.EncoderBuffer}	{}		170
305	io	Read	{[]byte}	{int,error}		172
306	io	Write	{[]byte}	{int,error}		173
307	io	Close	{}	{error}		174
308	io	Seek	{int64,int}	{int64,error}		175
309	io	io.Reader	{}	{}		176
310	io	io.Writer	{}	{}		176
311	io	io.Reader	{}	{}		177
312	io	io.Closer	{}	{}		177
313	io	io.Writer	{}	{}		178
314	io	io.Closer	{}	{}		178
315	io	io.Reader	{}	{}		179
316	io	io.Writer	{}	{}		179
317	io	io.Closer	{}	{}		179
318	io	io.Reader	{}	{}		180
319	io	io.Seeker	{}	{}		180
320	io	io.Writer	{}	{}		181
321	io	io.Seeker	{}	{}		181
322	io	io.Reader	{}	{}		182
323	io	io.Writer	{}	{}		182
324	io	io.Seeker	{}	{}		182
325	io	ReadFrom	{io.Reader}	{int64,error}		183
326	io	WriteTo	{io.Writer}	{int64,error}		184
327	io	ReadAt	{[]byte,int64}	{int,error}		185
328	io	WriteAt	{[]byte,int64}	{int,error}		186
329	io	ReadByte	{}	{byte,error}		187
330	io	io.ByteReader	{}	{}		188
331	io	UnreadByte	{}	{error}		188
332	io	WriteByte	{byte}	{error}		189
333	io	ReadRune	{}	{rune,int,error}		190
334	io	io.RuneReader	{}	{}		191
335	io	UnreadRune	{}	{error}		191
336	rand	Int63	{}	{int64}		192
337	rand	Seed	{int64}	{}		192
338	rand	rand.Source	{}	{}		193
339	rand	Uint64	{}	{uint64}		193
340	multipart	io.Reader	{}	{}		194
341	multipart	io.ReaderAt	{}	{}		194
342	multipart	io.Seeker	{}	{}		194
343	multipart	io.Closer	{}	{}		194
344	http	RoundTrip	{*http.Request}	{*http.Response,error}		195
345	cookiejar	PublicSuffix	{string}	{string}		196
346	cookiejar	String	{}	{string}		196
347	http	Open	{string}	{http.File,error}		197
348	http	io.Closer	{}	{}		198
349	http	io.Reader	{}	{}		198
350	http	io.Seeker	{}	{}		198
351	http	Readdir	{int}	{[]os.FileInfo,error}		198
352	http	Stat	{}	{os.FileInfo,error}		198
353	http	Push	{string,*http.PushOptions}	{error}		200
354	httputil	Get	{}	{[]byte}		201
355	httputil	Put	{[]byte}	{}		201
356	http	SetCookies	{*url.URL,[]*http.Cookie}	{}		202
357	http	Cookies	{*url.URL}	{[]*http.Cookie}		202
358	http	ServeHTTP	{http.ResponseWriter,*http.Request}	{}		203
359	http	Header	{}	{http.Header}		204
360	http	Write	{[]byte}	{int,error}		204
361	http	WriteHeader	{int}	{}		204
362	http	Flush	{}	{}		205
363	http	Hijack	{}	{net.Conn,*bufio.ReadWriter,error}		206
364	http	CloseNotify	{}	{"chan bool\n"}		207
365	net	Network	{}	{string}		208
366	net	String	{}	{string}		208
367	net	Read	{[]byte}	{int,error}		209
368	net	Write	{[]byte}	{int,error}		209
369	net	Close	{}	{error}		209
370	net	LocalAddr	{}	{net.Addr}		209
371	net	RemoteAddr	{}	{net.Addr}		209
372	net	SetDeadline	{time.Time}	{error}		209
373	net	SetReadDeadline	{time.Time}	{error}		209
374	net	SetWriteDeadline	{time.Time}	{error}		209
375	net	ReadFrom	{[]byte}	{int,net.Addr,error}		210
376	net	WriteTo	{[]byte,net.Addr}	{int,error}		210
377	net	Close	{}	{error}		210
378	net	LocalAddr	{}	{net.Addr}		210
379	net	SetDeadline	{time.Time}	{error}		210
380	net	SetReadDeadline	{time.Time}	{error}		210
381	net	SetWriteDeadline	{time.Time}	{error}		210
382	net	Accept	{}	{net.Conn,error}		211
383	net	Close	{}	{error}		211
384	net	Addr	{}	{net.Addr}		211
385	net	Timeout	{}	{bool}		212
386	net	Temporary	{}	{bool}		212
387	rpc	WriteRequest	{*rpc.Request,"interface{}"}	{error}		215
388	rpc	ReadResponseHeader	{*rpc.Response}	{error}		215
389	rpc	ReadResponseBody	{"interface{}"}	{error}		215
390	rpc	Close	{}	{error}		215
391	rpc	ReadRequestHeader	{*rpc.Request}	{error}		219
392	rpc	ReadRequestBody	{"interface{}"}	{error}		219
393	rpc	WriteResponse	{*rpc.Response,"interface{}"}	{error}		219
394	rpc	Close	{}	{error}		219
395	smtp	Start	{*smtp.ServerInfo}	{string,[]byte,error}		220
396	smtp	Next	{[]byte,bool}	{[]byte,error}		220
397	os	String	{}	{string}		221
398	os	Signal	{}	{}		221
399	os	Name	{}	{string}		222
400	os	Size	{}	{int64}		222
401	os	Mode	{}	{os.FileMode}		222
402	os	ModTime	{}	{time.Time}		222
403	os	IsDir	{}	{bool}		222
404	os	Sys	{}	{"interface{}"}		222
405	reflect	Align	{}	{int}		224
406	reflect	FieldAlign	{}	{int}		224
407	reflect	Method	{int}	{reflect.Method}		224
408	reflect	MethodByName	{string}	{reflect.Method,bool}		224
409	reflect	NumMethod	{}	{int}		224
410	reflect	Name	{}	{string}		224
411	reflect	PkgPath	{}	{string}		224
412	reflect	Size	{}	{uintptr}		224
413	reflect	String	{}	{string}		224
414	reflect	Kind	{}	{reflect.Kind}		224
415	reflect	Implements	{reflect.Type}	{bool}		224
416	reflect	AssignableTo	{reflect.Type}	{bool}		224
417	reflect	ConvertibleTo	{reflect.Type}	{bool}		224
418	reflect	Comparable	{}	{bool}		224
419	reflect	Bits	{}	{int}		224
420	reflect	ChanDir	{}	{reflect.ChanDir}		224
421	reflect	IsVariadic	{}	{bool}		224
422	reflect	Elem	{}	{reflect.Type}		224
423	reflect	Field	{int}	{reflect.StructField}		224
424	reflect	FieldByIndex	{[]int}	{reflect.StructField}		224
425	reflect	FieldByName	{string}	{reflect.StructField,bool}		224
426	reflect	FieldByNameFunc	{"func(string) bool"}	{reflect.StructField,bool}		224
427	reflect	In	{int}	{reflect.Type}		224
428	reflect	Key	{}	{reflect.Type}		224
429	reflect	Len	{}	{int}		224
430	reflect	NumField	{}	{int}		224
431	reflect	NumIn	{}	{int}		224
432	reflect	NumOut	{}	{int}		224
433	reflect	Out	{int}	{reflect.Type}		224
434	runtime	RuntimeError	{}	{}		225
435	sort	Len	{}	{int}		226
436	sort	Less	{int,int}	{bool}		226
437	sort	Swap	{int,int}	{}		226
438	sync	Lock	{}	{}		227
439	sync	Unlock	{}	{}		227
440	syscall	Control	{func(uintptr)}	{error}		228
441	syscall	Read	{"func(uintptr) bool"}	{error}		228
442	syscall	Write	{"func(uintptr) bool"}	{error}		228
443	syscall	SyscallConn	{}	{syscall.RawConn,error}		229
444	quick	Generate	{*rand.Rand,int}	{reflect.Value}		235
445	testing	Error	{"...interface{}"}	{}		236
446	testing	Errorf	{string,"...interface{}"}	{}		236
447	testing	Fail	{}	{}		236
448	testing	FailNow	{}	{}		236
449	testing	Failed	{}	{bool}		236
450	testing	Fatal	{"...interface{}"}	{}		236
451	testing	Fatalf	{string,"...interface{}"}	{}		236
452	testing	Log	{"...interface{}"}	{}		236
453	testing	Logf	{string,"...interface{}"}	{}		236
454	testing	Name	{}	{string}		236
455	testing	Skip	{"...interface{}"}	{}		236
456	testing	SkipNow	{}	{}		236
457	testing	Skipf	{string,"...interface{}"}	{}		236
458	testing	Skipped	{}	{bool}		236
459	testing	Helper	{}	{}		236
460	parse	Type	{}	{parse.NodeType}		237
461	parse	String	{}	{string}		237
462	parse	Copy	{}	{parse.Node}		237
463	parse	Position	{}	{parse.Pos}		237
464	lif	Family	{}	{int}		238
465	proxy	Dial	{string,string}	{net.Conn,error}		239
466	route	Family	{}	{int}		240
467	route	Sys	{}	{[]route.Sys}		241
468	route	SysType	{}	{route.SysType}		242
469	transform	Transform	{[]byte,[]byte,bool}	{int,error}		243
470	transform	Reset	{}	{}		243
471	transform	transform.Transformer	{}	{}		244
472	transform	Span	{[]byte,bool}	{int,error}		244
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
9	gc	Node	t
10	gc	Node	t
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
26	dwarf	Sym	t
27	dwarf	Context	t
28	dwarf	Data	t
29	obj	Val	t
30	obj	Curfn	t
31	objfile	Liner	t
32	objfile	RelocStringer	t
33	main	FileLike	t
34	main	Arg	t
35	driver	Writer	t
36	driver	FlagSet	t
37	driver	Fetcher	t
38	driver	Symbolizer	t
39	driver	ObjTool	t
40	driver	ObjFile	t
41	driver	UI	t
42	plugin	Writer	t
43	plugin	FlagSet	t
44	plugin	Fetcher	t
45	plugin	Symbolizer	t
46	plugin	ObjTool	t
47	plugin	ObjFile	t
48	plugin	UI	t
49	demangle	AST	f
50	armasm	Arg	t
51	ppc64asm	Arg	t
52	x86asm	Arg	f
53	testdata	MethodTestInterface	t
54	testdata	V	t
55	flate	Resetter	t
56	flate	Reader	t
57	zlib	Resetter	t
58	heap	Interface	t
59	list	Value	t
60	ring	Value	t
61	context	Context	t
62	cipher	Block	t
63	cipher	Stream	t
64	cipher	BlockMode	t
65	cipher	AEAD	t
66	crypto	PublicKey	t
67	crypto	PrivateKey	t
68	crypto	Signer	t
69	crypto	SignerOpts	t
70	crypto	Decrypter	t
71	crypto	DecrypterOpts	t
72	elliptic	Curve	t
73	tls	ClientSessionCache	t
74	pkix	Value	t
75	x509	PublicKey	t
76	x509	PublicKey	t
77	driver	Value	t
78	driver	Driver	t
79	driver	Pinger	t
80	driver	Execer	t
81	driver	ExecerContext	t
82	driver	Queryer	t
83	driver	QueryerContext	t
84	driver	Conn	t
85	driver	ConnPrepareContext	t
86	driver	ConnBeginTx	t
87	driver	Result	t
88	driver	Stmt	t
89	driver	StmtExecContext	t
90	driver	StmtQueryContext	t
91	driver	NamedValueChecker	t
92	driver	ColumnConverter	t
93	driver	Rows	t
94	driver	RowsNextResultSet	t
95	driver	RowsColumnTypeScanType	t
96	driver	RowsColumnTypeDatabaseTypeName	t
97	driver	RowsColumnTypeLength	t
98	driver	RowsColumnTypeNullable	t
99	driver	RowsColumnTypePrecisionScale	t
100	driver	Tx	t
101	driver	ValueConverter	t
102	driver	Valuer	t
103	sql	Value	t
104	sql	Scanner	t
105	sql	Dest	t
106	sql	Result	t
107	dwarf	Val	t
108	dwarf	Type	t
109	macho	Load	t
110	pe	OptionalHeader	t
111	binary	ByteOrder	t
112	encoding	BinaryMarshaler	t
113	encoding	BinaryUnmarshaler	t
114	encoding	TextMarshaler	t
115	encoding	TextUnmarshaler	t
116	gob	GobEncoder	t
117	gob	GobDecoder	t
118	json	Unmarshaler	t
119	json	Marshaler	t
120	json	Token	t
121	xml	Marshaler	t
122	xml	MarshalerAttr	t
123	xml	Unmarshaler	t
124	xml	UnmarshalerAttr	t
125	xml	Token	t
126	expvar	Var	t
127	flag	Value	t
128	flag	Getter	t
129	fmt	State	t
130	fmt	Formatter	t
131	fmt	Stringer	t
132	fmt	GoStringer	t
133	fmt	ScanState	t
134	fmt	Scanner	t
135	ast	Node	t
136	ast	Expr	f
137	ast	Stmt	f
138	ast	Decl	f
139	ast	Spec	f
140	ast	Decl	t
141	ast	Data	t
142	ast	Type	t
143	ast	Visitor	t
144	constant	Value	f
145	error1	I0	f
146	error1	ExportedField	f
147	error2	I0	f
148	error2	ExportedField	f
149	exports	T12	t
150	exports	T13	f
151	exports	T14	f
152	p	V	t
153	printer	Node	t
154	types	Importer	t
155	types	ImporterFrom	t
156	types	Object	f
157	types	Sizes	t
158	types	Type	t
159	hash	Hash	t
160	hash	Hash32	t
161	hash	Hash64	t
162	color	Color	t
163	color	Model	t
164	draw	Image	t
165	draw	Quantizer	t
166	draw	Drawer	t
167	image	Image	t
168	image	PalettedImage	t
169	jpeg	Reader	t
170	png	EncoderBufferPool	t
171	singleflight	Val	t
172	io	Reader	t
173	io	Writer	t
174	io	Closer	t
175	io	Seeker	t
176	io	ReadWriter	t
177	io	ReadCloser	t
178	io	WriteCloser	t
179	io	ReadWriteCloser	t
180	io	ReadSeeker	t
181	io	WriteSeeker	t
182	io	ReadWriteSeeker	t
183	io	ReaderFrom	t
184	io	WriterTo	t
185	io	ReaderAt	t
186	io	WriterAt	t
187	io	ByteReader	t
188	io	ByteScanner	t
189	io	ByteWriter	t
190	io	RuneReader	t
191	io	RuneScanner	t
192	rand	Source	t
193	rand	Source64	t
194	multipart	File	t
195	http	RoundTripper	t
196	cookiejar	PublicSuffixList	t
197	http	FileSystem	t
198	http	File	t
199	http	I	f
200	http	Pusher	t
201	httputil	BufferPool	t
202	http	CookieJar	t
203	http	Handler	t
204	http	ResponseWriter	t
205	http	Flusher	t
206	http	Hijacker	t
207	http	CloseNotifier	t
208	net	Addr	t
209	net	Conn	t
210	net	PacketConn	t
211	net	Listener	t
212	net	Error	f
213	rpc	Args	t
214	rpc	Reply	t
215	rpc	ClientCodec	t
216	jsonrpc	Error	t
217	jsonrpc	Result	t
218	jsonrpc	Error	t
219	rpc	ServerCodec	t
220	smtp	Auth	t
221	os	Signal	t
222	os	FileInfo	t
223	plugin	Symbol	t
224	reflect	Type	f
225	runtime	Error	f
226	sort	Interface	t
227	sync	Locker	t
228	syscall	RawConn	t
229	syscall	Conn	t
230	syscall	Sockaddr	f
231	syscall	RoutingMessage	f
232	syscall	RoutingMessage	f
233	syscall	Sockaddr	f
234	syscall	Sockaddr	f
235	quick	Generator	t
236	testing	TB	f
237	parse	Node	f
238	lif	Addr	t
239	proxy	Dialer	t
240	route	Addr	t
241	route	Message	t
242	route	Sys	t
243	transform	Transformer	t
244	transform	SpanningTransformer	t
\.


--
-- Name: concrete_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_methods_id_seq', 3359, true);


--
-- Name: concrete_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.concrete_types_id_seq', 3531, true);


--
-- Name: interface_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interface_methods_id_seq', 472, true);


--
-- Name: interfaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interfaces_id_seq', 244, true);


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