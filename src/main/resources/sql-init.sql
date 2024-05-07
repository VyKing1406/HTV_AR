PGDMP  #                    |            HTV    16.1    16.1 &               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            
           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    27759    HTV    DATABASE     �   CREATE DATABASE "HTV" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "HTV";
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    27884    object_comment    TABLE     �   CREATE TABLE public.object_comment (
    id bigint NOT NULL,
    content text,
    created_day timestamp(6) without time zone,
    user_id character varying(255),
    object_transform_id bigint
);
 "   DROP TABLE public.object_comment;
       public         heap    postgres    false    4            �            1259    27883    object_comment_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.object_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.object_comment_id_seq;
       public          postgres    false    222    4                       0    0    object_comment_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.object_comment_id_seq OWNED BY public.object_comment.id;
          public          postgres    false    221            �            1259    27833    object_transfrom    TABLE       CREATE TABLE public.object_transfrom (
    id bigint NOT NULL,
    position_x real NOT NULL,
    position_y real NOT NULL,
    position_z real NOT NULL,
    rotation_w real NOT NULL,
    rotation_x real NOT NULL,
    rotation_y real NOT NULL,
    rotation_z real NOT NULL,
    scale_x real NOT NULL,
    scale_y real NOT NULL,
    scale_z real NOT NULL,
    station_id bigint,
    maintenance_instruction character varying(255),
    index bigint NOT NULL,
    sensor_id bigint,
    video_url character varying(255)
);
 $   DROP TABLE public.object_transfrom;
       public         heap    postgres    false    4            �            1259    27832    object_transfrom_id_seq    SEQUENCE     �   CREATE SEQUENCE public.object_transfrom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.object_transfrom_id_seq;
       public          postgres    false    4    218                       0    0    object_transfrom_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.object_transfrom_id_seq OWNED BY public.object_transfrom.id;
          public          postgres    false    217            �            1259    27851    sensor_device    TABLE       CREATE TABLE public.sensor_device (
    id bigint NOT NULL,
    sensor_unit character varying(255) NOT NULL,
    sensor_id character varying(255) NOT NULL,
    sensor_name character varying(255) NOT NULL,
    station_id bigint NOT NULL,
    sensor_image_url character varying(255)
);
 !   DROP TABLE public.sensor_device;
       public         heap    postgres    false    4            �            1259    27850    sensor_device_id_seq    SEQUENCE     }   CREATE SEQUENCE public.sensor_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sensor_device_id_seq;
       public          postgres    false    4    220                       0    0    sensor_device_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.sensor_device_id_seq OWNED BY public.sensor_device.id;
          public          postgres    false    219            �            1259    27770    station    TABLE     �   CREATE TABLE public.station (
    gps_latitude double precision NOT NULL,
    gps_longitude double precision NOT NULL,
    id bigint NOT NULL,
    station_id character varying(255) NOT NULL,
    station_name character varying(255) NOT NULL
);
    DROP TABLE public.station;
       public         heap    postgres    false    4            �            1259    27769    station_id_seq    SEQUENCE     w   CREATE SEQUENCE public.station_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.station_id_seq;
       public          postgres    false    216    4                       0    0    station_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.station_id_seq OWNED BY public.station.id;
          public          postgres    false    215            b           2604    27887    object_comment id    DEFAULT     v   ALTER TABLE ONLY public.object_comment ALTER COLUMN id SET DEFAULT nextval('public.object_comment_id_seq'::regclass);
 @   ALTER TABLE public.object_comment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            `           2604    27836    object_transfrom id    DEFAULT     z   ALTER TABLE ONLY public.object_transfrom ALTER COLUMN id SET DEFAULT nextval('public.object_transfrom_id_seq'::regclass);
 B   ALTER TABLE public.object_transfrom ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            a           2604    27854    sensor_device id    DEFAULT     t   ALTER TABLE ONLY public.sensor_device ALTER COLUMN id SET DEFAULT nextval('public.sensor_device_id_seq'::regclass);
 ?   ALTER TABLE public.sensor_device ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            _           2604    27773 
   station id    DEFAULT     h   ALTER TABLE ONLY public.station ALTER COLUMN id SET DEFAULT nextval('public.station_id_seq'::regclass);
 9   ALTER TABLE public.station ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216                      0    27884    object_comment 
   TABLE DATA                 public          postgres    false    222   �+                 0    27833    object_transfrom 
   TABLE DATA                 public          postgres    false    218   �,                 0    27851    sensor_device 
   TABLE DATA                 public          postgres    false    220   0       �          0    27770    station 
   TABLE DATA                 public          postgres    false    216   |1                  0    0    object_comment_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.object_comment_id_seq', 5, true);
          public          postgres    false    221                       0    0    object_transfrom_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.object_transfrom_id_seq', 259, true);
          public          postgres    false    217                       0    0    sensor_device_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.sensor_device_id_seq', 13, true);
          public          postgres    false    219                       0    0    station_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.station_id_seq', 1, false);
          public          postgres    false    215            j           2606    27891 "   object_comment object_comment_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.object_comment
    ADD CONSTRAINT object_comment_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.object_comment DROP CONSTRAINT object_comment_pkey;
       public            postgres    false    222            f           2606    27838 &   object_transfrom object_transfrom_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.object_transfrom
    ADD CONSTRAINT object_transfrom_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.object_transfrom DROP CONSTRAINT object_transfrom_pkey;
       public            postgres    false    218            h           2606    27858     sensor_device sensor_device_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.sensor_device
    ADD CONSTRAINT sensor_device_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sensor_device DROP CONSTRAINT sensor_device_pkey;
       public            postgres    false    220            d           2606    27777    station station_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.station DROP CONSTRAINT station_pkey;
       public            postgres    false    216            k           2606    44352 ,   object_transfrom fk87n6y4yuhtayqaplcn43cl599    FK CONSTRAINT     �   ALTER TABLE ONLY public.object_transfrom
    ADD CONSTRAINT fk87n6y4yuhtayqaplcn43cl599 FOREIGN KEY (sensor_id) REFERENCES public.sensor_device(id);
 V   ALTER TABLE ONLY public.object_transfrom DROP CONSTRAINT fk87n6y4yuhtayqaplcn43cl599;
       public          postgres    false    220    218    4712            m           2606    27859 )   sensor_device fkhl3asgyccstwraqa2fs4ymnhw    FK CONSTRAINT     �   ALTER TABLE ONLY public.sensor_device
    ADD CONSTRAINT fkhl3asgyccstwraqa2fs4ymnhw FOREIGN KEY (station_id) REFERENCES public.station(id);
 S   ALTER TABLE ONLY public.sensor_device DROP CONSTRAINT fkhl3asgyccstwraqa2fs4ymnhw;
       public          postgres    false    216    220    4708            n           2606    27892 *   object_comment fkop4a3kabrd7u1vlavfgjkoy8y    FK CONSTRAINT     �   ALTER TABLE ONLY public.object_comment
    ADD CONSTRAINT fkop4a3kabrd7u1vlavfgjkoy8y FOREIGN KEY (object_transform_id) REFERENCES public.object_transfrom(id);
 T   ALTER TABLE ONLY public.object_comment DROP CONSTRAINT fkop4a3kabrd7u1vlavfgjkoy8y;
       public          postgres    false    218    222    4710            l           2606    27844 ,   object_transfrom fkta9o5pec1ptvt2mu0bxsvvk5n    FK CONSTRAINT     �   ALTER TABLE ONLY public.object_transfrom
    ADD CONSTRAINT fkta9o5pec1ptvt2mu0bxsvvk5n FOREIGN KEY (station_id) REFERENCES public.station(id);
 V   ALTER TABLE ONLY public.object_transfrom DROP CONSTRAINT fkta9o5pec1ptvt2mu0bxsvvk5n;
       public          postgres    false    4708    218    216               �   x���v
Q���W((M��L��O�JM.�O���M�+Q��L�QH��+r����ĒԔ���J���Ԣx�4TKIQb^qZ~Q.PPS!��'�5XA�XGA�#?1/]!�4H�xx�B���
EwO�T��8�P�����D��X��\��������$�F&��\��w�!qN���A&��8#R��NO����4.. ^�ܓ         f  x���n7��~
ޔ �0Ù��)�)и����6�v�������T2`��a$�v�����O~�q�o~s����v���6��vܯ���߹7���=�C;�}w��,>���,ݾ�%�v?��g����C�jp<yj�ʷޭ�nl�u�in�n��M�[���o�n��%�����o����������{�E�ί<y%�W1D�Q$֥�U�� !����r��A�ť�%�00cJ5��C�R��m;8�q�f�_w��˂���-����k��-޾���A	�+��GJ\@B��|d}� B9�D�K�D5P�B $P��"8�\˴.�㡝K6�Dx�%����4������Ì>PL�2& J�*q�,���5�k�8e��u���{h��lz.�Y���T��<WTd�P0z�T�'[9Z�g��L]R��L���P]�H3)1/�J��&O ��xB�I�����
SR���'�辭wx�_�����U�}���w��g(��J� U0Պګ(Lx%e������Ss�|�_��l�+�^֔�N�lW�>a7�!�e���D�kU^��cEl��a��� ��2f8] �����cԺ��d�1�B<g̳ը��{���Y3�K�l~;i���?2�'���}��H�h�;����q�P_ܦ�:#f�e�j!���Lv����Y����?;�����3g���Ű�x��'2̬�V���\ ۙ2���h�.�g��dbp:n��c�7hz���u�3�*E)'���ΗF�g�/!�y��oz��:��+;;��YQ�8�5 ��A�`�0�==�H*IN3f�B�xթ�k���_]��,��         T  x�ݖMk�0 @��9--t��n�c�n�"-n��ySM��i�_,#�0=�������=H��6������!%hTaZ�e�o�0�h��jJ� i����BFr*/�,�qP�� ���l����k��	ۆ�;	cE5�4LQy.�nف����<�._������d�E�m�ݦ�̱���{��h��]�O?����߱�Y�����Ǟ{� &�[�)ޭ�t��y��¼��0�r�I��#�.�Y�6�[�4<7��&�K�ɶ&�&�K�˶�&�K<ȶc�MJ�p�:#�bh�3�dk�.P�CcW$B�ߡ���J��B�VP��%ٚ��١��/u�      �   n   x���v
Q���W((M��L�+.I,���S�H/(���KJSRu����t(73EG�2������������ah�g�� %u�3���ԁlG� 0[Ӛ�� z6)p     