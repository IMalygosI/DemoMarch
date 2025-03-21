PGDMP         *                }         	   dima_base %   14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)    15.3 3    V           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            W           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            X           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            Y           1262    17633 	   dima_base    DATABASE     u   CREATE DATABASE dima_base WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru_RU.UTF-8';
    DROP DATABASE dima_base;
                dima    false            Z           0    0    DATABASE dima_base    ACL     <   REVOKE CONNECT,TEMPORARY ON DATABASE dima_base FROM PUBLIC;
                   dima    false    3673                        2615    30766 	   DemoMarch    SCHEMA        CREATE SCHEMA "DemoMarch";
    DROP SCHEMA "DemoMarch";
                dima    false            G           1259    30894    Client    TABLE       CREATE TABLE "DemoMarch"."Client" (
    "ID" integer NOT NULL,
    "FIO" character varying(255),
    "Client_Code" integer,
    "Passport" text,
    "Date_Birthday" date,
    "Adress" text,
    "Email" character varying,
    "Password" character varying
);
 !   DROP TABLE "DemoMarch"."Client";
    	   DemoMarch         heap    dima    false    18            H           1259    30897    Client_id_seq    SEQUENCE     �   ALTER TABLE "DemoMarch"."Client" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "DemoMarch"."Client_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         	   DemoMarch          dima    false    18    327            K           1259    30952    Employee    TABLE     T  CREATE TABLE "DemoMarch"."Employee" (
    "ID" integer NOT NULL,
    "Post_ID" integer NOT NULL,
    "FIO" character varying(255) NOT NULL,
    "Login" character varying NOT NULL,
    "Password" character varying NOT NULL,
    "Last_Entry" date NOT NULL,
    "Type_Of_Entrance_ID" integer NOT NULL,
    "Code_Employee" character varying
);
 #   DROP TABLE "DemoMarch"."Employee";
    	   DemoMarch         heap    dima    false    18            L           1259    30955    Employee_id_seq    SEQUENCE     �   ALTER TABLE "DemoMarch"."Employee" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "DemoMarch"."Employee_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         	   DemoMarch          dima    false    18    331            N           1259    31003    Order    TABLE       CREATE TABLE "DemoMarch"."Order" (
    "ID" integer NOT NULL,
    "Order_Code" text,
    "Date_Of_Creation" date,
    "Order_Time" time without time zone,
    "Client_Code" integer,
    "Services_Code" text,
    "Status" integer,
    "Closing_Date" date,
    "Time_Rental" integer
);
     DROP TABLE "DemoMarch"."Order";
    	   DemoMarch         heap    dima    false    18            Q           1259    31031    OrderAndClient    TABLE     |   CREATE TABLE "DemoMarch"."OrderAndClient" (
    "Client_Code" integer NOT NULL,
    "Order_Client_Code" integer NOT NULL
);
 )   DROP TABLE "DemoMarch"."OrderAndClient";
    	   DemoMarch         heap    dima    false    18            R           1259    31048    OrderAndServise    TABLE     {   CREATE TABLE "DemoMarch"."OrderAndServise" (
    "Order_ID_Servise" integer NOT NULL,
    "Servise_ID" integer NOT NULL
);
 *   DROP TABLE "DemoMarch"."OrderAndServise";
    	   DemoMarch         heap    dima    false    18            O           1259    31006    Order_id_seq    SEQUENCE     �   ALTER TABLE "DemoMarch"."Order" ALTER COLUMN "ID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "DemoMarch"."Order_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
         	   DemoMarch          dima    false    18    334            I           1259    30928    Post    TABLE     f   CREATE TABLE "DemoMarch"."Post" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL
);
    DROP TABLE "DemoMarch"."Post";
    	   DemoMarch         heap    dima    false    18            M           1259    30981    Services    TABLE     �   CREATE TABLE "DemoMarch"."Services" (
    "ID" integer NOT NULL,
    "Name" character varying,
    "Code_Services" character varying,
    "Cost_RUB_Per_Hour" numeric(19,4)
);
 #   DROP TABLE "DemoMarch"."Services";
    	   DemoMarch         heap    dima    false    18            P           1259    31014    Status    TABLE     h   CREATE TABLE "DemoMarch"."Status" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL
);
 !   DROP TABLE "DemoMarch"."Status";
    	   DemoMarch         heap    dima    false    18            J           1259    30935    Type_Of_Entrance    TABLE     r   CREATE TABLE "DemoMarch"."Type_Of_Entrance" (
    "ID" integer NOT NULL,
    "Name" character varying NOT NULL
);
 +   DROP TABLE "DemoMarch"."Type_Of_Entrance";
    	   DemoMarch         heap    dima    false    18            S           1259    31107    User    TABLE     h   CREATE TABLE "DemoMarch"."User" (
    "ClientID" integer NOT NULL,
    "EmployeeID" integer NOT NULL
);
    DROP TABLE "DemoMarch"."User";
    	   DemoMarch         heap    dima    false    18            G          0    30894    Client 
   TABLE DATA              COPY "DemoMarch"."Client" ("ID", "FIO", "Client_Code", "Passport", "Date_Birthday", "Adress", "Email", "Password") FROM stdin;
 	   DemoMarch          dima    false    327   �=       K          0    30952    Employee 
   TABLE DATA           �   COPY "DemoMarch"."Employee" ("ID", "Post_ID", "FIO", "Login", "Password", "Last_Entry", "Type_Of_Entrance_ID", "Code_Employee") FROM stdin;
 	   DemoMarch          dima    false    331   �O       N          0    31003    Order 
   TABLE DATA           �   COPY "DemoMarch"."Order" ("ID", "Order_Code", "Date_Of_Creation", "Order_Time", "Client_Code", "Services_Code", "Status", "Closing_Date", "Time_Rental") FROM stdin;
 	   DemoMarch          dima    false    334   �Q       Q          0    31031    OrderAndClient 
   TABLE DATA           S   COPY "DemoMarch"."OrderAndClient" ("Client_Code", "Order_Client_Code") FROM stdin;
 	   DemoMarch          dima    false    337   BU       R          0    31048    OrderAndServise 
   TABLE DATA           R   COPY "DemoMarch"."OrderAndServise" ("Order_ID_Servise", "Servise_ID") FROM stdin;
 	   DemoMarch          dima    false    338   �U       I          0    30928    Post 
   TABLE DATA           3   COPY "DemoMarch"."Post" ("ID", "Name") FROM stdin;
 	   DemoMarch          dima    false    329   �W       M          0    30981    Services 
   TABLE DATA           ]   COPY "DemoMarch"."Services" ("ID", "Name", "Code_Services", "Cost_RUB_Per_Hour") FROM stdin;
 	   DemoMarch          dima    false    333   �W       P          0    31014    Status 
   TABLE DATA           5   COPY "DemoMarch"."Status" ("ID", "Name") FROM stdin;
 	   DemoMarch          dima    false    336   rY       J          0    30935    Type_Of_Entrance 
   TABLE DATA           ?   COPY "DemoMarch"."Type_Of_Entrance" ("ID", "Name") FROM stdin;
 	   DemoMarch          dima    false    330   �Y       S          0    31107    User 
   TABLE DATA           ?   COPY "DemoMarch"."User" ("ClientID", "EmployeeID") FROM stdin;
 	   DemoMarch          dima    false    339   �Y       [           0    0    Client_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"DemoMarch"."Client_id_seq"', 70, true);
       	   DemoMarch          dima    false    328            \           0    0    Employee_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('"DemoMarch"."Employee_id_seq"', 10, true);
       	   DemoMarch          dima    false    332            ]           0    0    Order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('"DemoMarch"."Order_id_seq"', 51, true);
       	   DemoMarch          dima    false    335            �           2606    30902    Client client_pk 
   CONSTRAINT     W   ALTER TABLE ONLY "DemoMarch"."Client"
    ADD CONSTRAINT client_pk PRIMARY KEY ("ID");
 A   ALTER TABLE ONLY "DemoMarch"."Client" DROP CONSTRAINT client_pk;
    	   DemoMarch            dima    false    327            �           2606    30960    Employee employee_pk 
   CONSTRAINT     [   ALTER TABLE ONLY "DemoMarch"."Employee"
    ADD CONSTRAINT employee_pk PRIMARY KEY ("ID");
 E   ALTER TABLE ONLY "DemoMarch"."Employee" DROP CONSTRAINT employee_pk;
    	   DemoMarch            dima    false    331            �           2606    31011    Order order_pk 
   CONSTRAINT     U   ALTER TABLE ONLY "DemoMarch"."Order"
    ADD CONSTRAINT order_pk PRIMARY KEY ("ID");
 ?   ALTER TABLE ONLY "DemoMarch"."Order" DROP CONSTRAINT order_pk;
    	   DemoMarch            dima    false    334            �           2606    31106     OrderAndClient orderandclient_pk 
   CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."OrderAndClient"
    ADD CONSTRAINT orderandclient_pk PRIMARY KEY ("Client_Code", "Order_Client_Code");
 Q   ALTER TABLE ONLY "DemoMarch"."OrderAndClient" DROP CONSTRAINT orderandclient_pk;
    	   DemoMarch            dima    false    337    337            �           2606    31104 "   OrderAndServise orderandservise_pk 
   CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."OrderAndServise"
    ADD CONSTRAINT orderandservise_pk PRIMARY KEY ("Order_ID_Servise", "Servise_ID");
 S   ALTER TABLE ONLY "DemoMarch"."OrderAndServise" DROP CONSTRAINT orderandservise_pk;
    	   DemoMarch            dima    false    338    338            �           2606    30934    Post post_pk 
   CONSTRAINT     S   ALTER TABLE ONLY "DemoMarch"."Post"
    ADD CONSTRAINT post_pk PRIMARY KEY ("ID");
 =   ALTER TABLE ONLY "DemoMarch"."Post" DROP CONSTRAINT post_pk;
    	   DemoMarch            dima    false    329            �           2606    31000    Services services_pk 
   CONSTRAINT     [   ALTER TABLE ONLY "DemoMarch"."Services"
    ADD CONSTRAINT services_pk PRIMARY KEY ("ID");
 E   ALTER TABLE ONLY "DemoMarch"."Services" DROP CONSTRAINT services_pk;
    	   DemoMarch            dima    false    333            �           2606    31020    Status status_pk 
   CONSTRAINT     W   ALTER TABLE ONLY "DemoMarch"."Status"
    ADD CONSTRAINT status_pk PRIMARY KEY ("ID");
 A   ALTER TABLE ONLY "DemoMarch"."Status" DROP CONSTRAINT status_pk;
    	   DemoMarch            dima    false    336            �           2606    30962 $   Type_Of_Entrance type_of_entrance_pk 
   CONSTRAINT     k   ALTER TABLE ONLY "DemoMarch"."Type_Of_Entrance"
    ADD CONSTRAINT type_of_entrance_pk PRIMARY KEY ("ID");
 U   ALTER TABLE ONLY "DemoMarch"."Type_Of_Entrance" DROP CONSTRAINT type_of_entrance_pk;
    	   DemoMarch            dima    false    330            �           2606    31111    User user_pk 
   CONSTRAINT     g   ALTER TABLE ONLY "DemoMarch"."User"
    ADD CONSTRAINT user_pk PRIMARY KEY ("ClientID", "EmployeeID");
 =   ALTER TABLE ONLY "DemoMarch"."User" DROP CONSTRAINT user_pk;
    	   DemoMarch            dima    false    339    339            �           2606    30965    Employee employee_post_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."Employee"
    ADD CONSTRAINT employee_post_fk FOREIGN KEY ("Post_ID") REFERENCES "DemoMarch"."Post"("ID");
 J   ALTER TABLE ONLY "DemoMarch"."Employee" DROP CONSTRAINT employee_post_fk;
    	   DemoMarch          dima    false    329    331    3490            �           2606    30970 %   Employee employee_type_of_entrance_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."Employee"
    ADD CONSTRAINT employee_type_of_entrance_fk FOREIGN KEY ("Type_Of_Entrance_ID") REFERENCES "DemoMarch"."Type_Of_Entrance"("ID");
 V   ALTER TABLE ONLY "DemoMarch"."Employee" DROP CONSTRAINT employee_type_of_entrance_fk;
    	   DemoMarch          dima    false    330    3492    331            �           2606    31021    Order order_status_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."Order"
    ADD CONSTRAINT order_status_fk FOREIGN KEY ("Status") REFERENCES "DemoMarch"."Status"("ID");
 F   ALTER TABLE ONLY "DemoMarch"."Order" DROP CONSTRAINT order_status_fk;
    	   DemoMarch          dima    false    334    3500    336            �           2606    31038 '   OrderAndClient orderandclient_client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."OrderAndClient"
    ADD CONSTRAINT orderandclient_client_fk FOREIGN KEY ("Client_Code") REFERENCES "DemoMarch"."Client"("ID");
 X   ALTER TABLE ONLY "DemoMarch"."OrderAndClient" DROP CONSTRAINT orderandclient_client_fk;
    	   DemoMarch          dima    false    327    3488    337            �           2606    31043 &   OrderAndClient orderandclient_order_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."OrderAndClient"
    ADD CONSTRAINT orderandclient_order_fk FOREIGN KEY ("Order_Client_Code") REFERENCES "DemoMarch"."Order"("ID");
 W   ALTER TABLE ONLY "DemoMarch"."OrderAndClient" DROP CONSTRAINT orderandclient_order_fk;
    	   DemoMarch          dima    false    337    3498    334            �           2606    31096 (   OrderAndServise orderandservise_order_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."OrderAndServise"
    ADD CONSTRAINT orderandservise_order_fk FOREIGN KEY ("Order_ID_Servise") REFERENCES "DemoMarch"."Order"("ID");
 Y   ALTER TABLE ONLY "DemoMarch"."OrderAndServise" DROP CONSTRAINT orderandservise_order_fk;
    	   DemoMarch          dima    false    334    338    3498            �           2606    31086 +   OrderAndServise orderandservise_services_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."OrderAndServise"
    ADD CONSTRAINT orderandservise_services_fk FOREIGN KEY ("Servise_ID") REFERENCES "DemoMarch"."Services"("ID");
 \   ALTER TABLE ONLY "DemoMarch"."OrderAndServise" DROP CONSTRAINT orderandservise_services_fk;
    	   DemoMarch          dima    false    3496    338    333            �           2606    31112    User user_client_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."User"
    ADD CONSTRAINT user_client_fk FOREIGN KEY ("ClientID") REFERENCES "DemoMarch"."Client"("ID");
 D   ALTER TABLE ONLY "DemoMarch"."User" DROP CONSTRAINT user_client_fk;
    	   DemoMarch          dima    false    3488    339    327            �           2606    31117    User user_employee_fk    FK CONSTRAINT     �   ALTER TABLE ONLY "DemoMarch"."User"
    ADD CONSTRAINT user_employee_fk FOREIGN KEY ("EmployeeID") REFERENCES "DemoMarch"."Employee"("ID");
 F   ALTER TABLE ONLY "DemoMarch"."User" DROP CONSTRAINT user_employee_fk;
    	   DemoMarch          dima    false    331    339    3494            G      x��Z�rױ}��
~������r^��q�a e�I�Ή\�$[J%��q��N�tBS�-�����{����,� 5�ݳz�Z�c����ˋ������`�z������������5�}�>�����$PZ�%,gܘH*����=�.�e������;\�����\������x�������Gx�'��ۯ��ʳ/T��qy�?p*(��y2�ߓIrT$=�hp��L�4��I0ʸ���.X�Y^U^,�/�ȿ�G�K�}���}�X�@BZ�,7@�8�	��;O�׺���W���fu����<�$�l���i��x����E�Y��=>����q�K�D|2��N����`-�:PRkΔ���(�(x��c���Oˏ������6��I����O��|�/FqOj+�ĮB.�����~,A�ʣ"=Ǘ+|�W��j�6��	.�p'���tO��"�@���'\����{
a�S�%)��>���$�Y�Ֆs�y#��FVx�.����ʁ�!Vs�� wA�I���3��	�?�g��o�o�78��O�kǋ�"9��ŋ9P��k�����(X'p_��\_P_�)8����%>�
�X�N{��*:�L��b��"#��y��I�q-�E,�2����y�dɠ��ǳ^���,���ɼݰ��~_���\��*~�þ(�G�E8}�^ˠ ����L�&x�e�u�;x&����/�7�:�j�מfɃt68��y��#B��ؓe�s$�s���
�<�*�ꄯ���1Q���p�1mv����2]�"!)��`4,��,9��ټ�ƫB���"�.��d��������5�l��Z�D�wf{����v��W�Br�+�o�ԉ`>�'�l��E2x�f@Ho�N����w��亊t�*_ 	�[��J5
9%S�ɨB����s������ ��Of�t����`��W�Ը�<���s���>%��Ft�u|hpk�@�m�R�p�3V�nU/J^�;��&Zm���8�RW]E�e�@Q�z�Ƨ2��}\���V'|��M�F'u�q�۾�%׻#����H��eǃ,/Rn7�jQzQ����I��5d��r�r�iP�vVD\(��c���A�0�;��}�/��*����
F��d�d�qr�NGqq8M�N�2��j�y������"^z�<��g����X%$7�[�'���	��u�uCp"/P/q��r�C�����M�I`l���BHiY��j����:��w?ԹV��f�|<Lg��d�6�R��q��@��V��j-��h���ѡj� 'ɀ�W�p[.tp2����`��$Y<=�=H����⨊?
��V��.�Bi�K��6�.5�,��IaA4�='���٪	6�|S9�::q[)X"��W��g���otCU!Z�S���%����?ʾ����Z$�H�}H�xJ�eN����[}Q�y�}V1�W���	�"2VIE���g>��Png�'d��>��:��1�H�7�����N��U�6�B�ߴ��9����XHΜ��Qup�[!0!�=J�^�Z4�A�@�ӄ��)^��(�j��zM�/<ٵ���*P�P0hJU�:REb�"�����Z5Bmj����"=o����
��>����Mp��Wˮ6$���r��uƆ�N��}e�!��Pч/��'�:�#j����D�W%p/|"~K�x�m��AЂ"L+�yK`dO�A�?����S��~8�����8>��#�P��Ͻ���d�y�z?�6�_�7eH�'q���W�K�sȺ�ά��j��`M�Yz�:��t$>������]�Z�# Zp80-\E~�!�؃�}��+����0�m�Ⱥ��|�v�/�ar��qj/La[aP���w��7d)��g��θ��H���-A|[�����k��}�<��x��gP�!���W�W踛�)~¥�/$N�'?ƌ��xh��vn4(�H�8��L�� �H[���BU���r�O\����z��j(�8���VF�n�n.�h��E�	=����$ͲY'�*������7�U�4��{��&�;Q���䂱
ٚ����@v�b f���a�8��{r�LY��#2I<���uC��\���6J(�WBa�M���;�;�0�A��������(�:8q�1[�����o:�6�#jg�d;W#�C��zm��`��A:3|�w*F����8�-���`��5�z�%aň���[/�(��m+��LP �y�,�I6��d�����)�����oN1�/��D���LJ?5#�hr����r��FLE,8�G�h�·�t]�*�B��l�}�ߗ���ո��pL�Z�N(���{���=ɡ�:Dц��p�2~�8�g�i�[���R�PR�!����v���㠻���O&�K�� ќƓb��i��Y�X$��xqx��%iU㶜�{mwR�@��v"������G(#�'=��n���梍��Y�䗞��_&�{ErR�=�"�%Z򀆴.��ÝG��1n�F�%D,uw��p�LM��|_�O��1Śf�Q/z��۲�C���sk ��-������8�]��j�����K���%��-U��<F~'H�lѳ��[��B��U)�a��0<�'�GF�f>�m�������o����Y0�"�3�ɖ�-�����N�U��oXt�\��r����w�p�]=�g)2��'�4_��S۶~2�v6��/����h ����\��ƣ�n��F�ˈ5��j{#w��7����J�d0Jң<��f1���H�m+�W�L/_{������z��䞆�R��z�檅�u�q�>��};ɳ$��L�Ӵ���["�!�k��7U��o
��)�b�&�p�S)���F���Q��*?���Ã_-�{��E�%Y)���ٖ�(DEU��V~[J�n���J��V�>Q#�5�gj�!�uw$q:�O`f�c�M�,�ix�#ϋ�*�T{�9W�v)�*	��Տ�vr�+]m�/�[04ݣ���a|�&�cZq��&#�a�	X��]?�z���tI��	,�X
���*D
����%���,���nM��h��ƳQ<'4���N�az^E�C!��$���N��$�B�ϻ���"�g����jCv�6��s�l��ڲ[����Hn�.��$Iw�y�h�$Y�]+i=kwG��>�z��rs�
a|sS��yR��r� Eo�����]XG!�(�����~j���-��?l�����2XΔ��GUQJ�4��ٷ���o9�k� �O��,��[VO<D��Da�i���dpS�v5�Jfd�r��#*����oHѮAx0ɋ�x:����`DÇN�*��X[0n{@`��:	��v@QB���筼��ʲ	<�e'1y���������;^�K�fپ���
�MA�JF=Щߤ��;凵��ݲ��ȳ�h����f�<oW�օ(�յ�F���@��0΂D��Ŭ������ڤ*yr��Vݧb����x
���ä�)��d�B�U��m�P�Q�5�4���]���؝�k���C�?����`6�(/��d3��IR�[.w"��X=Em_�Y���~u��!_o�J�p%��3����*M�54V��yg�q���4P�H�
�o�t�'��j剘����x6��?�\|�'+Z�E{����/+%��Ep?>ͧ�����b�M�N�t:�8�|��Ocn6�ۭ���������gV�aBX�h�Ue�5/�&�zk-`�N��àڟtRnBH��!x3d���]�ph��?�(�'-�پ��*����`�������yv6�D�!��	����yV"��FW[���R�"W�y���7�V�[�n+�BD���q܇��Ϗ�b�?�aڽv�B���+��wv���w��	�0q��*t������^�շ+5;627�0�E<�ƞU��,����(K�Z�G2�ހv�����j���ÿvҝ�M х4y�z��W�f�C�~����Z�4� h�y<_L���݋�:��!�����y�� �  ��0�v��L�TX៪cr_�[7��TVqq1�і��.a�>_�O>�`�.����,�p��-�ș�y2�M�ߵ�x��\pO��X�A��ى8
������y��@��{����Ȕ�uw�w���~y��Jkm%��4)��X����q�f�(~��p�٩�rD�B
�pܱ�W��D��U�^{$�wZ>������ԫ:��ږ�^Y+�N=4���{:�Kߌ��zJ��Y�ƚh-�,wB�!���V��d6M��m����6�z���$�?fivK��wZ��m��;�+�i��>O�B�xY����z8�<�^����-4G�-ʧJ�v���9�{�v��P+K��҄۠Ţw�������W�I�/�������43���4q�4��;�Zy����ق����7��<�7�������q�&ٝE��d3!��A��Ɇ�T�|��$���%S��<(j�_�0��P��      K   �  x�m��N�@��3O� ���@D\
�j�EE�08�ؑc��	��i� UB4U� ��b)@B_��q��D���������ј���������.��.����(Yvc�*U�-�Z�t���Yژg���jzBK3�-MոN����8
��B��Jp�p�����l&� �y
o�|���+z�TƟH���m��9�=�TK��K1���D;9C��X� ��ͥ8���F_�D��;^їMs��`��i2ݑ	)>y~#r��'4=�ю<u��4�qOqu��Јz�����\�=<�]�mK�$|H&O.��O�i)�Z%7��9�\0�	i2<K����Q�bR������(�i���`y�}Ӯ'�<G�+yr|$?��h#�%e�q�Oi���(u�1*�1�n������X��IuJ�`2�)��ꡁ+��:���R�lӨ�8J�c��*�9	I�\Se���p�h�����(���-u<^x�b�w�����[��򯓜���'      N   �  x����q�0E�r) 	�?)�U���x�lX!�da�бD��x�pA�� �3}cF<��+����䟜�u���~��B����Qr~��at(��������G�]?�t���[]K����絣�'U���b%=�D����~��"�Gy�QNP"Nׄ��{S[:��A��x�G%?��	j����aݓ�|Ҫkج�k���͞���׭����ϣ���?�eD�u�0��M<�#O�x< ���y02�x�������K¨�~��8jФ������j�苚�)r�;_�
9�0�Fa�6�zaz~�F�����0�?��q�c��e5�2�Fe��hpfo�)�2z�H9�3	�3�h�zzp�_��1a�F�4O���L)7k�Fk��@�@�W��]É�1�i4�4�n��W�ьaI���)t��1/��6�1\RV*�T��0�訫1��4׏���5e�T�t�;c���ь����F*p1_��	G3�{RP`�Ƞc��:�F�ь���D���<�Ӧ��))�H-��j
�l4SS��V���;S��3S�Rn��E���SӞcɻ�S���B�ӯl�#� �ij��m��W�&3Ft�����'��c�j�d�H=����t�;S��n2S����
����b
_3	�)���ne��r$��a��ҙ)%���ʓ�ٔ�)���̔k6%�B���)��iʍ)4�d��[�)�)2���&�w-G'x�����*6S��x��%�O,6SJ�5��`�<u��J5cJ�u��ch�lƔ�k;쁋1e�'dƔ�;Nųn��+�l�Լ�vq��5fj:l�T�e<��L��51�Sqp�;cЧ|�6s*�R���S�QQ�5�K8y֍1te[̘*�l��m���)���G���      Q   �   x��I�A��f�td\�?�m�!�F��p��qxpy���E-H� S�B*Uh��6��C�Rzԃ�`т���ЁKz�Mo�������,D�3��c)Sd�A6����2y�C�P�B��=~�E�t�=�A/{��>��,���#�ۺ)H      R   �  x�-�ѭ�0D�o���99R/��:V��eQ�'=�dT�9����S֮�=�l���4�3��U�_��U�7>Ɯ�����_���:��誣����v���5|W7�
O=�'>�,��7N�<8L���4T[S4*P���Y�[�.���آqѺ�����0 �  a@:��{��T�N��:�N���X�N�N�N���:�:�S��:�:�N�N�N�N�]���&gi�Kt�.[��Kt�.���W��$�Dwj�f�D��&�i"M���li"M���D�Hi"M��4������Yj�Fj�n�[j�F�������H��H���&����[�����Fj�Fj�Fj�F:�N��I�	 �H'����ҿc��Nh��      I   V   x���	�0߹*�@P۱�K"���`��`R�nG�s��)�ă���
cB�������,�[�r��}.h<dE�J1H      M   |  x��R[N�@���bV� 3�~I��4��MIL\Li|��t��Vqwv䥔�"&~���{ν���/z�n0�3�[��7�e�dO�i��L�;��?�R/~a����^�U}�J�j�D�)~b�縢�ט��!X�"b��bΨ~��ZI�Q�� D���[�1��u�'�&�V8�w:�0׳���zN$n�l#�S������}�(�MS����f�3ż��jZ6XNm�ɑ�1ѳ]_�!E��]�,𹌏Բw�*4͌^�#�#a����w[u��H�ՙm��m����ɠ+�^t帧��x�j�}9�
k1�/����~ %㑊\p��-0�5q]Z�p�(�:F��-P�D�܏��%?���a�^���      P   ?   x�3�0�¾�.l���e�ya���"��"M�rs^�~aÅ].v6p��qqq �@�      J   (   x�3估�b���^츰��>.#�s��f�=... AH�      S      x������ � �     