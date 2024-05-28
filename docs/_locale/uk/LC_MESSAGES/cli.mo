��    u      �  �   l      �	  �   �	     �
    �
  8  �  6   $  �   [     �  �     5   �  4   �  �   /    �  �   �  �   �  .  C     r  K   �     �     �     �  $    �   ;     �       '        G  �   P  �     Y   �  �     �   �  s   A  k   �     !     /  �   G     �  �   �  N   �     �          +  x   ;     �  2   �     �  Z     '   o      �  g   �        �   ,  �   �  `   �  �   .   �   )!  �  %"  �   �#     m$  y   }$  I   �$  8   A%  S   z%  �   �%  h   _&  J   �&    '  :   %(  �   `(  �   �(    �)     �*  L   �+  S   ,     f,  0   g-  5   �-  >   �-  j   .  �  x.  �  �/  :  �1  /   �2    �2  �  4  �  �5  �   7  G   �7  Y   8  �   g8  �   �8  ?   �9  8  �9  9  *;  $   d<  K  �<  �   �=  a   [>  I   �>  �   ?  k   @  �   p@  �   ZA     �A  &   B  -   )B  (   WB  )   �B  �   �B  &   8C  $   _C  '   �C  '   �C  #   �C     �C  V   D  '  gD  �  �E     4G  *  HG    sI  S   �K    �K  A   �L    M  _   (N  n   �N  H  �N  �  @P    �Q  /  S  �  6T  2   V  �   AV  -   �V  #   �V  #   W  �  ?W  <  Y  ;   TZ  /   �Z  I   �Z     
[    [  �   1\  �   ]  V  �]  �   _  s   �_  �   _`     	a  /   %a  7  Ua     �b  J  �b  �   �c     �d  C   �d  C   �d  �   .e     'f  _   =f  ?   �f  �   �f  A   �g  E   �g  �   %h     i  "  i  �  ?j  �   /l  �  �l  �   gn  �  co  �   r  #   �r  �   s  i   �s  [   ,t  �   �t    u  �    v  �   �v  �  dw  v   (y  �   �y  A  �z    �{  �  �}  �   �  �   Y�  �  ��  _   ؂  e   8�  ~   ��  �   �  �  Ԅ  �  [�  s  ��  Q   n�  !  ��  �  �  �  ��  2  (�  �   [�  �   ܓ  /  i�  ,  ��  k   Ɩ  A  2�  9  t�  d   ��  �  �  �   ̝  �   ��  I   ��  �  ̟  �   ��  �  X�  �   )�  D   )�  *   n�  -   ��  (   ǥ  )   �  9  �  g   T�  A   ��  +   ��  +   *�  M   V�     ��  �   ��     <   +   J   U       Z   _   	   l   &   )   N   p   ,       F      t                 3       A       -   [   f                  \               E             e   d   q   n       g               o      D                 (      :   2       ?   s   ^   Y   H      ]       1   "   4                      S      G   5       !      K               #       $   i          Q   =   @   T   r   8      B   V   W   `   P      6   *   u   '   h   j   
       7   >   %      M   X          C         L   9                        b   R   /   c       a   0       O   I   m         k       .          ;           **Active** or **running configuration** is the system configuration that is loaded  and currently active (used by VyOS). Any change in the configuration will have to be committed to belong to the active/running configuration. **Example:** **Saved configuration** is the one saved to a file using the :cfgcmd:`save` command. It allows you to keep safe a configuration for future uses. There can be multiple configuration files. The default or "boot" configuration is saved and loaded from the file ``/config/config.boot``. **Working configuration** is the one that is currently being modified in configuration mode. Changes made to the working configuration do not go into effect until the changes are committed with the :cfgcmd:`commit` command. At which time the working configuration will become the active or running configuration. A VyOS system has three major types of configurations: A reboot because you did not enter ``confirm`` will not take you necessarily to the *saved configuration*, but to the point before the unfortunate commit. Access opmode from config mode Access to these commands are possible through the use of the ``run [command]`` command. From this command you will have access to everything accessible from operational mode. Add comment as an annotation to a configuration node. All changes in the working config will thus be lost. All commands executed here are relative to the configuration level you have entered. You can do everything from the top level, but commands will be quite lengthy when manually typing them. An important thing to note is that since the comment is added on top of the section, it will not appear if the ``show <section>`` command is used. With the above example, the `show firewall` command would return starting after the ``firewall {`` line, hiding the comment. Any change you do on the configuration, will not take effect until committed using the :cfgcmd:`commit` command in configuration mode. Both these ``show`` commands should be executed when in operational mode, they do not work directly in configuration mode. There is a special way on how to :ref:`run_opmode_from_config_mode`. By default, the configuration is displayed in a hierarchy like the above example, this is only one of the possible ways to display the configuration. When the configuration is generated and the device is configured, changes are added through a collection of :cfgcmd:`set` and :cfgcmd:`delete` commands. Command Line Interface Command completion and syntax help with ``?`` and ``[tab]`` will also work. Compare configurations Configuration Mode Configuration Overview Configuration commands are flattened from the tree into 'one-liner' commands shown in :opcmd:`show configuration commands` from operation mode. Commands are relative to the level where they are executed and all redundant information from the current level is removed from the command entered. Configuration mode can not be exited while uncommitted changes exist. To exit configuration mode without applying changes, the :cfgcmd:`exit discard` command must be used. Copy a configuration element. Editing the configuration Example showing possible show commands: Example: Exiting from the configuration mode is done via the :cfgcmd:`exit` command from the top level, executing :cfgcmd:`exit` from within a sub-level takes you back to the top level. For example typing ``sh`` followed by the ``TAB`` key will complete to ``show``. Pressing ``TAB`` a second time will display the possible sub-commands of the ``show`` command. Get a collection of all the set commands required which led to the running configuration. If you are remotely connected, you will lose your connection. You may want to copy first the config, edit it to ensure connectivity, and load the edited config. In the case you want to completely delete your configuration and restore the default one, you can enter the following command in configuration mode: It is also possible to display all :cfgcmd:`set` commands within configuration mode using :cfgcmd:`show | commands` It is also possible to display all `set` commands within configuration mode using :cfgcmd:`show | commands` Local Archive Managing configurations Note that ``show`` command respects your edit level and from this level you can view the modified firewall ruleset with just ``show`` with no parameters. Operational Mode Operational mode allows for commands to perform operational system tasks and view system and service status, while configuration mode allows for the modification of system configuration. Prompt changes from ``$`` to ``#``. To exit configuration mode, type ``exit``. Remote Archive Rename a configuration element. Restore Default Revisions are stored on disk. You can view, compare and rollback them to any previous revisions if something goes wrong. Rollback Changes Rollback to revision N (currently requires reboot) Saving and loading manually See the configuration section of this document for more information on configuration mode. Seeing and navigating the configuration Show commit revision difference. Specify remote location of commit archive as any of the below :abbr:`URI (Uniform Resource Identifier)` Terminology The :cfgcmd:`show` command within configuration mode will show the working configuration indicating line changes with ``+`` for additions, ``>`` for replacements and ``-`` for deletions. The CLI provides a built-in help system. In the CLI the ``?`` key may be used to display available commands. The ``TAB`` key can be used to auto-complete commands and will present the help system upon a conflict or unknown value. The VyOS :abbr:`CLI (Command-Line Interface)` comprises an operational and a configuration mode. The ``comment`` command allows you to insert a comment above the ``<config node>`` configuration section. When shown, comments are enclosed with ``/*`` and ``*/`` as open/close delimiters. Comments need to be commited, just like other config changes. The ``comment`` command allows you to insert a comment above the ``<config node>`` configuration section. When shown, comments are enclosed with ``/*`` and ``*/`` as open/close delimiters. Comments need to be committed, just like other config changes. The command :cfgcmd:`compare` allows you to compare different type of configurations. It also lets you compare different revisions through the :cfgcmd:`compare N M` command, where N and M are revision numbers. The output will describe how the configuration N is when compared to M indicating with a plus sign (``+``) the additional parts N has when compared to M, and indicating with a minus sign (``-``) the lacking parts N misses when compared to M. The command above also lets you see the difference between two commits. By default the difference with the running config is shown. The config mode The configuration can be edited by the use of :cfgcmd:`set` and :cfgcmd:`delete` commands from within configuration mode. The current hierarchy level can be changed by the :cfgcmd:`edit` command. The number of revisions don't affect the commit-archive. Then you may want to :cfgcmd:`save` in order to delete the saved configuration too. These commands are also relative to the level you are inside and only relevant configuration blocks will be displayed when entering a sub-level. These two commands above are essentially the same, just executed from different levels in the hierarchy. This means four commits ago we did ``set system ipv6 disable-forwarding``. To delete a configuration entry use the :cfgcmd:`delete` command, this also deletes all sub-levels under the current level you've specified in the :cfgcmd:`delete` command. Deleting an entry will also result in the element reverting back to its default value if one exists. To enter configuration mode use the ``configure`` command: To remove an existing comment from your current configuration, specify an empty string enclosed in double quote marks (``""``) as the comment text. Use the ``show configuration commands | strip-private`` command when you want to hide private data. You may want to do so if you want to share your configuration on the `forum`_. Use this command to load a configuration which will replace the running configuration. Define the location of the configuration file to be loaded. You can use a path to a local file, an SCP address, an SFTP address, an FTP address, an HTTP address, an HTTPS address or a TFTP address. Use this command to preserve configuration changes upon reboot. By default it is stored at */config/config.boot*. In the case you want to store the configuration file somewhere else, you can add a local path, a SCP address, a FTP address or a TFTP address. Use this command to set the value of a parameter or to create a new element. Use this command to spot what the differences are between different configurations. Use this command to temporarily commit your changes and set the number of minutes available for validation. ``confirm`` must be entered within those minutes, otherwise the system will reboot into the previous configuration. The default value is 10 minutes. View all existing revisions on the local system. View the current active configuration in JSON format. View the current active configuration in readable JSON format. View the current active configuration, also known as the running configuration, from the operational mode. VyOS can upload the configuration to a remote location after each call to :cfgcmd:`commit`. You will have to set the commit-archive location. TFTP, FTP, SCP and SFTP servers are supported. Every time a :cfgcmd:`commit` is successful the ``config.boot`` file will be copied to the defined destination(s). The filename used on the remote host will be ``config.boot-hostname.YYYYMMDD_HHMMSS``. VyOS can upload the configuration to a remote location after each call to :cfgcmd:`commit`. You will have to set the commit-archive location. TFTP, FTP, SCP and SFTP servers are supported. Every time a :cfgcmd:`commit` is successfull the ``config.boot`` file will be copied to the defined destination(s). The filename used on the remote host will be ``config.boot-hostname.YYYYMMDD_HHMMSS``. VyOS comes with an integrated versioning system for the system configuration. It automatically maintains a backup of every previous configuration which has been committed to the system. The configurations are versioned locally for rollback but they can also be stored on a remote host for archiving/backup reasons. VyOS lets you compare different configurations. VyOS makes use of a unified configuration file for the entire system's configuration: ``/config/config.boot``. This allows easy template creation, backup, and replication of system configuration. A system can thus also be easily cloned by simply copying the required configuration files. What if you are doing something dangerous? Suppose you want to setup a firewall, and you are not sure there are no mistakes that will lock you out of your system. You can use confirmed commit. If you issue the ``commit-confirm`` command, your changes will be commited, and if you don't issue  the ``confirm`` command in 10 minutes, your system will reboot into previous config revision. What if you are doing something dangerous? Suppose you want to setup a firewall, and you are not sure there are no mistakes that will lock you out of your system. You can use confirmed commit. If you issue the ``commit-confirm`` command, your changes will be committed, and if you don't issue  the ``confirm`` command in 10 minutes, your system will reboot into previous config revision. When entering the configuration mode you are navigating inside a tree structure, to enter configuration mode enter the command :opcmd:`configure` when in operational mode. When going into configuration mode, prompt changes from ``$`` to ``#``. When inside configuration mode you are not directly able to execute operational commands. When the output of a command results in more lines than can be displayed on the terminal screen the output is paginated as indicated by a ``:`` prompt. When using the save_ command, you can add a specific location where to store your configuration file. And, when needed it, you will be able to load it with the ``load`` command: When viewing in page mode the following commands are available: You are now in a sublevel relative to ``interfaces ethernet eth0``, all commands executed from this point on are relative to this sublevel. Use eithe the :cfgcmd:`top` or :cfgcmd:`exit` command to go back to the top of the hierarchy. You can also use the :cfgcmd:`up` command to move only one level up at a time. You are now in a sublevel relative to ``interfaces ethernet eth0``, all commands executed from this point on are relative to this sublevel. Use either the :cfgcmd:`top` or :cfgcmd:`exit` command to go back to the top of the hierarchy. You can also use the :cfgcmd:`up` command to move only one level up at a time. You can also rename config subtrees: You can copy and remove configuration subtrees. Suppose you set up a firewall ruleset ``FromWorld`` with one rule that allows traffic from specific subnet. Now you want to setup a similar rule, but for different subnet. Change your edit level to ``firewall name FromWorld`` and use ``copy rule 10 to rule 20``, then modify rule 20. You can rollback configuration changes using the rollback command. This will apply the selected revision and trigger a system reboot. You can scroll up with the keys ``[Shift]+[PageUp]`` and scroll down with ``[Shift]+[PageDown]``. You can specify a commit message with :cfgcmd:`commit comment <message>`. You can specify the number of revisions stored on disk. N can be in the range of 0 - 65535. When the number of revisions exceeds the configured value, the oldest revision is removed. The default setting for this value is to store 100 revisions locally. You can use the ``save`` and ``load`` commands if you want to manually manage specific configuration files. You may find VyOS not allowing the secure connection because it cannot verify the legitimacy of the remote server. You can use the workaround below to quickly add the remote host's SSH fingerprint to your ``~/.ssh/known_hosts`` file: You will be asked if you want to continue. If you accept, you will have to use :cfgcmd:`commit` if you want to make the changes active. ``b`` will scroll back one page ``ftp://<user>:<passwd>@<host>/<dir>`` ``git+https://<user>:<passwd>@<host>/<path>`` ``http://<user>:<passwd>@<host>:/<dir>`` ``https://<user>:<passwd>@<host>:/<dir>`` ``left-arrow`` and ``right-arrow`` can be used to scroll left or right in the event that the output has lines which exceed the terminal size. ``q`` key can be used to cancel output ``return`` will scroll down one line ``scp://<user>:<passwd>@<host>:/<dir>`` ``sftp://<user>:<passwd>@<host>/<dir>`` ``space`` will scroll down one page ``tftp://<host>/<dir>`` ``up-arrow`` and ``down-arrow`` will scroll up or down one line at a time respectively MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Localazy (https://localazy.com)
Project-Id-Version: 
Language: uk
Plural-Forms: nplurals=3; plural=((n%10==1) && (n%100!=11)) ? 0 : ((n%10>=2 && n%10<=4) && ((n%100<12 || n%100>14))) ? 1 : 2;
 **Активна** або **запущена конфігурація** – це конфігурація системи, яка завантажена та наразі активна (використовується VyOS). Будь-яка зміна в конфігурації повинна бути закріплена для належності до активної/працюючої конфігурації. **Приклад:** **Збережена конфігурація** – це конфігурація, збережена у файл за допомогою команди :cfgcmd:`save`. Це дозволяє зберегти конфігурацію для подальшого використання. Файлів конфігурації може бути декілька. Стандартна або &quot;завантажувальна&quot; конфігурація зберігається та завантажується з файлу ``/config/config.boot``. **Робоча конфігурація** – це конфігурація, яка зараз змінюється в режимі конфігурації. Зміни, внесені до робочої конфігурації, не набудуть чинності, доки зміни не будуть зафіксовані за допомогою команди :cfgcmd:`commit`. У цей час робоча конфігурація стане активною або запущеною конфігурацією. Система VyOS має три основні типи конфігурацій: Перезавантаження через те, що ви не ввели ``confirm``, не обов’язково переведе вас до *збереженої конфігурації*, а до точки перед невдалим комітом. Доступ до opmode з режиму конфігурації Доступ до цих команд можливий за допомогою команди ``run [command]``. За допомогою цієї команди ви матимете доступ до всього, доступного з робочого режиму. Додайте коментар як анотацію до вузла конфігурації. Таким чином, усі зміни в робочій конфігурації буде втрачено. Усі команди, що виконуються тут, відносяться до рівня конфігурації, який ви ввели. Ви можете робити все з верхнього рівня, але команди будуть досить довгими, якщо їх вводити вручну. Важливо зауважити, що оскільки коментар додається вгорі розділу, він не відображатиметься, якщо ``показати<section> `` використовується команда. У наведеному вище прикладі команда `show firewall` повертатиметься після рядка ``firewall {``, приховуючи коментар. Будь-яка зміна, яку ви вносите в конфігурацію, не набуде чинності, доки не буде зафіксовано за допомогою команди :cfgcmd:`commit` у режимі конфігурації. Обидві ці команди ``show`` слід виконувати в робочому режимі, вони не працюють безпосередньо в режимі конфігурації. Існує спеціальний спосіб :ref:`запустити_opmode_from_config_mode`. За замовчуванням конфігурація відображається в ієрархії, як у прикладі вище, це лише один із можливих способів відображення конфігурації. Після створення конфігурації та налаштування пристрою зміни додаються за допомогою набору команд :cfgcmd:`set` і :cfgcmd:`delete`. Інтерфейс командного рядка Доповнення команд і синтаксична довідка з ``?`` і ``[tab]`` також працюватимуть. Порівняйте конфігурації Режим конфігурації Огляд конфігурації Команди конфігурації зведені з дерева в команди «одного рядка», показані в :opcmd:`показати команди конфігурації` з режиму роботи. Команди відносяться до рівня, на якому вони виконуються, і вся зайва інформація з поточного рівня видаляється з введеної команди. Неможливо вийти з режиму конфігурації, поки існують незафіксовані зміни. Щоб вийти з режиму налаштування без застосування змін, необхідно використати команду :cfgcmd:`exit discard`. Скопіюйте елемент конфігурації. Редагування конфігурації Приклад, що показує можливі команди шоу: приклад: Вихід із режиму налаштування здійснюється за допомогою команди :cfgcmd:`exit` з верхнього рівня, виконання :cfgcmd:`exit` з підрівня повертає вас на верхній рівень. Наприклад, введення ``sh`` і клавіша ``TAB`` призведе до ``show``. Повторне натискання ``TAB`` відобразить можливі підкоманди команди ``show``. Отримайте збірку всіх необхідних команд, які призвели до запущеної конфігурації. Якщо ви підключені віддалено, ви втратите з’єднання. Ви можете спочатку скопіювати конфігурацію, відредагувати її, щоб забезпечити з’єднання, і завантажити відредаговану конфігурацію. Якщо ви хочете повністю видалити конфігурацію та відновити стандартну, ви можете ввести таку команду в режимі конфігурації: It is also possible to display all :cfgcmd:`set` commands within configuration mode using :cfgcmd:`show | commands` Також можна відобразити всі команди `set` в режимі конфігурації за допомогою :cfgcmd:`show | команди` Місцевий архів Керування конфігураціями Зауважте, що команда ``show`` поважає ваш рівень редагування, і на цьому рівні ви можете переглядати змінений набір правил брандмауера лише за допомогою ``show`` без параметрів. Режим роботи Оперативний режим дозволяє командам виконувати завдання операційної системи та переглядати стан системи та служби, а режим конфігурації дозволяє змінювати конфігурацію системи. Підказка змінюється з ``$`` на ``#``. Щоб вийти з режиму налаштування, введіть ``вихід``. Віддалений архів Перейменувати елемент конфігурації. Відновити значення за замовчуванням Ревізії зберігаються на диску. Ви можете переглядати, порівнювати та повертати їх до будь-яких попередніх версій, якщо щось піде не так. Відкат змін Відкат до версії N (наразі вимагає перезавантаження) Збереження та завантаження вручну Дивіться розділ конфігурації цього документа, щоб отримати додаткові відомості про режим конфігурації. Перегляд конфігурації та навігація Показати різницю в редакції фіксації. Укажіть віддалене розташування архіву комітів як будь-яке з наведених нижче :abbr:`URI (уніфікований ідентифікатор ресурсу)` Термінологія Команда :cfgcmd:`show` у режимі конфігурації покаже робочу конфігурацію, вказуючи на зміни рядка за допомогою ``+`` для додавання, ``&gt;`` для заміни та ``-`` для видалення. CLI забезпечує вбудовану довідкову систему. У CLI можна використовувати клавішу ``?`` для відображення доступних команд. Клавіша ``TAB`` може використовуватися для автоматичного завершення команд і відображатиме довідкову систему у випадку конфлікту або невідомого значення. VyOS :abbr:`CLI (інтерфейс командного рядка)` містить робочий і конфігураційний режими. Команда ``comment`` дозволяє вставити коментар над ``<config node> `` розділ конфігурації. Коли відображаються, коментарі обмежуються ``/*`` і ``*/`` як розділювачі відкриття/закриття. Коментарі потрібно зафіксувати, як і інші зміни конфігурації. The ``comment`` command allows you to insert a comment above the ``<config node>`` configuration section. When shown, comments are enclosed with ``/*`` and ``*/`` as open/close delimiters. Comments need to be committed, just like other config changes. Команда :cfgcmd:`compare` дозволяє порівнювати різні типи конфігурацій. Це також дозволяє порівнювати різні версії за допомогою команди :cfgcmd:`compare NM`, де N і M є номерами версій. Вихідні дані описуватимуть конфігурацію N у порівнянні з M, вказуючи знаком плюс (``+``) додаткові частини, які N має порівняно з M, і вказуючи знаком мінус (``-``) недоліки частини N відсутні в порівнянні з M. Наведена вище команда також дозволяє побачити різницю між двома комітами. За умовчанням показано різницю з поточною конфігурацією. Режим конфігурації Конфігурацію можна редагувати за допомогою команд :cfgcmd:`set` і :cfgcmd:`delete` у режимі налаштування. Поточний рівень ієрархії можна змінити командою :cfgcmd:`edit`. Кількість редагувань не впливає на архів комітів. Тоді ви можете :cfgcmd:`зберегти`, щоб також видалити збережену конфігурацію. Ці команди також пов’язані з рівнем, на якому ви перебуваєте, і під час переходу на підрівень відображатимуться лише відповідні блоки конфігурації. Ці дві наведені вище команди по суті однакові, просто виконуються з різних рівнів ієрархії. Це означає, що чотири коміти тому ми зробили ``налаштування системного ipv6 disable-forwarding``. Щоб видалити запис конфігурації, скористайтеся командою :cfgcmd:`delete`, це також видаляє всі підрівні поточного рівня, указаного в команді :cfgcmd:`delete`. Видалення запису також призведе до повернення елемента до значення за замовчуванням, якщо воно існує. Щоб увійти в режим налаштування, використовуйте команду ``configure``: Щоб видалити наявний коментар із вашої поточної конфігурації, укажіть порожній рядок у подвійних лапках (``&quot;&quot;``) як текст коментаря. Використовуйте ``показати команди конфігурації | strip-private``, коли ви хочете приховати особисті дані. Ви можете зробити це, якщо хочете поділитися своєю конфігурацією на `форумі`_. Використовуйте цю команду, щоб завантажити конфігурацію, яка замінить поточну конфігурацію. Визначте розташування файлу конфігурації, який потрібно завантажити. Ви можете використовувати шлях до локального файлу, адресу SCP, адресу SFTP, адресу FTP, адресу HTTP, адресу HTTPS або адресу TFTP. Використовуйте цю команду, щоб зберегти зміни конфігурації після перезавантаження. За замовчуванням він зберігається в */config/config.boot*. Якщо ви хочете зберегти файл конфігурації в іншому місці, ви можете додати локальний шлях, адресу SCP, адресу FTP або адресу TFTP. Використовуйте цю команду, щоб встановити значення параметра або створити новий елемент. Використовуйте цю команду, щоб визначити відмінності між різними конфігураціями. Використовуйте цю команду, щоб тимчасово зафіксувати зміни та встановити кількість хвилин, доступних для перевірки. ``confirm`` необхідно ввести протягом цих хвилин, інакше система перезавантажиться до попередньої конфігурації. Стандартне значення становить 10 хвилин. Переглянути всі існуючі версії в локальній системі. Перегляньте поточну активну конфігурацію у форматі JSON. Перегляньте поточну активну конфігурацію в читабельному форматі JSON. Перегляньте поточну активну конфігурацію, також відому як поточна конфігурація, у робочому режимі. VyOS can upload the configuration to a remote location after each call to :cfgcmd:`commit`. You will have to set the commit-archive location. TFTP, FTP, SCP and SFTP servers are supported. Every time a :cfgcmd:`commit` is successful the ``config.boot`` file will be copied to the defined destination(s). The filename used on the remote host will be ``config.boot-hostname.YYYYMMDD_HHMMSS``. VyOS може завантажити конфігурацію у віддалене місце після кожного виклику :cfgcmd:`commit`. Вам потрібно буде встановити розташування архіву комітів. Підтримуються сервери TFTP, FTP, SCP і SFTP. Кожного разу, коли :cfgcmd:`commit` є успішним, файл ``config.boot`` буде скопійовано до визначеного місця призначення. Ім’я файлу, що використовується на віддаленому хості, буде ``config.boot-hostname.YYYYMMDD_HHMMSS``. VyOS поставляється з інтегрованою системою керування версіями для конфігурації системи. Він автоматично підтримує резервну копію кожної попередньої конфігурації, яка була зафіксована в системі. Конфігурації керуються локальними версіями для відкоту, але їх також можна зберігати на віддаленому хості для архівування/резервного копіювання. VyOS дозволяє порівнювати різні конфігурації. VyOS використовує уніфікований файл конфігурації для всієї конфігурації системи: ``/config/config.boot``. Це дозволяє легко створювати шаблони, створювати резервні копії та тиражувати конфігурацію системи. Таким чином, систему також можна легко клонувати, просто скопіювавши необхідні конфігураційні файли. А якщо ви робите щось небезпечне? Припустімо, що ви хочете налаштувати брандмауер і не впевнені, що немає помилок, які заблокують вас у вашій системі. Ви можете використовувати підтверджену фіксацію. Якщо ви введете команду ``commit-confirm``, ваші зміни буде зафіксовано, і якщо ви не введете команду ``confirm`` протягом 10 хвилин, ваша система перезавантажиться до попередньої версії конфігурації. What if you are doing something dangerous? Suppose you want to setup a firewall, and you are not sure there are no mistakes that will lock you out of your system. You can use confirmed commit. If you issue the ``commit-confirm`` command, your changes will be committed, and if you don't issue  the ``confirm`` command in 10 minutes, your system will reboot into previous config revision. Під час входу в режим конфігурації ви переміщуєтеся всередині деревоподібної структури, щоб увійти в режим конфігурації, у робочому режимі введіть команду :opcmd:`configure`. Під час переходу в режим налаштування підказка змінюється з ``$`` на ``#``. У режимі конфігурації ви не можете безпосередньо виконувати робочі команди. Якщо вихід команди призводить до більшої кількості рядків, ніж може бути відображено на екрані терміналу, результат розбивається на сторінки, як вказує підказка ``:``. Використовуючи команду save_, ви можете додати конкретне місце для збереження файлу конфігурації. І за потреби ви зможете завантажити його за допомогою команди ``load``: Під час перегляду в режимі сторінки доступні такі команди: Тепер ви перебуваєте на підрівні відносно ``інтерфейсів ethernet eth0``, усі команди, які виконуються з цього моменту, відносяться до цього підрівня. Використовуйте команду :cfgcmd:`top` або :cfgcmd:`exit`, щоб повернутися на вершину ієрархії. Ви також можете використовувати команду :cfgcmd:`up`, щоб перейти лише на один рівень вище за раз. You are now in a sublevel relative to ``interfaces ethernet eth0``, all commands executed from this point on are relative to this sublevel. Use either the :cfgcmd:`top` or :cfgcmd:`exit` command to go back to the top of the hierarchy. You can also use the :cfgcmd:`up` command to move only one level up at a time. Ви також можете перейменувати піддерева конфігурації: Ви можете копіювати та видаляти піддерева конфігурації. Припустімо, ви встановили набір правил брандмауера ``FromWorld`` з одним правилом, яке дозволяє трафік із певної підмережі. Тепер ви хочете налаштувати подібне правило, але для іншої підмережі. Змініть рівень редагування на ``назва брандмауера FromWorld`` і використовуйте ``копіювати правило 10 до правила 20``, а потім змініть правило 20. Ви можете скасувати зміни конфігурації за допомогою команди rollback. Це застосує вибрану версію та ініціює перезавантаження системи. Ви можете прокручувати вгору за допомогою клавіш ``[Shift]+[PageUp]`` і прокручувати вниз за допомогою ``[Shift]+[PageDown]``. You can specify a commit message with :cfgcmd:`commit comment <message>`. Ви можете вказати кількість версій, що зберігаються на диску. N може бути в діапазоні від 0 до 65535. Коли кількість версій перевищує встановлене значення, найстаріша версія видаляється. За замовчуванням це значення зберігає 100 редакцій локально. Ви можете використовувати команди ``save`` і ``load``, якщо ви хочете вручну керувати певними конфігураційними файлами. Ви можете виявити, що VyOS не дозволяє безпечне з’єднання, оскільки не може перевірити легітимність віддаленого сервера. Щоб швидко додати відбиток SSH віддаленого хоста до вашого файлу ``~/.ssh/known_hosts``, ви можете скористатися наведеним нижче обхідним шляхом: Вас запитають, чи хочете ви продовжити. Якщо ви приймаєте, вам доведеться використовувати :cfgcmd:`commit`, якщо ви хочете зробити зміни активними. ``b`` прокрутить на одну сторінку назад ``ftp://<user> :<passwd> @<host> /<dir> `` ``git+https://<user>:<passwd>@<host>/<path>`` ``http://<user>:<passwd>@<host>:/<dir>`` ``https://<user>:<passwd>@<host>:/<dir>`` ``стрілка вліво`` і ``стрілка вправо`` можна використовувати для прокручування вліво або вправо у випадку, якщо вихідні дані містять рядки, які перевищують розмір терміналу. Для скасування виводу можна використовувати клавішу ``q`` ``return`` прокрутить на один рядок вниз ``scp://<user> :<passwd> @<host> :/<dir> `` ``sftp://<user> :<passwd> @<host> /<dir> `` ``пробіл`` прокрутить на одну сторінку вниз ``tftp://<host> /<dir> `` ``стрілка вгору`` і ``стрілка вниз`` прокручують вгору або вниз на один рядок відповідно 