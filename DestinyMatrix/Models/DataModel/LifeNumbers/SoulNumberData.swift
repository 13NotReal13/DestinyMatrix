//
//  SoulNumberData.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 09/11/2024.
//

import Foundation

struct SoulNumberData {
    static let data: ArkanCategory = ArkanCategory(
        сategoryTitle: "Число Души",
        arkanInfo: [
            // MARK: - 1 Arkan
            1: ArkanInfo(
                shortDescription: "1 Аркан - Маг. Символ уверенности и силы воли.",
                mainDescription: """
                Душа под влиянием Мага — это душа творца и лидера, стремящегося использовать свои навыки для достижения великих целей. Вы обладаете сильной внутренней мотивацией и желанием воплощать идеи в реальность. Люди с числом Души Мага часто уверены в себе и нацелены на успех, находя удовлетворение в контроле над ситуацией и создании нового.
                """,
                positiveEnergyText: """
                Когда ваша энергия сильна, вы уверены в себе и готовы преодолевать любые препятствия. Вы используете свои способности, чтобы добиваться успеха и вдохновлять окружающих.
                """,
                negativeEnergyText: """
                При ослаблении энергии вы можете становиться упрямым, стремящимся к контролю и доминированию, забывая об уважении к другим.
                """,
                adviceText: """
                Используйте свою силу для созидания и вдохновения, а не для доминирования. Развивайте уважение к мнениям других, это позволит вам гармонично использовать свою энергию.
                """
            ),

            // MARK: - 2 Arkan
            2: ArkanInfo(
                shortDescription: "2 Аркан - Жрица. Символ внутренней мудрости и интуиции.",
                mainDescription: """
                Душа Жрицы — это душа, наполненная интуицией и стремлением к познанию внутреннего мира. Вам свойственно обращать внимание на тонкие аспекты жизни, ощущать скрытое и разгадывать внутренние загадки. Вы обладаете способностью понимать чувства других и часто руководствуетесь интуицией, что делает вас мудрым советчиком для окружающих.
                """,
                positiveEnergyText: """
                В состоянии высокой энергии вы чувствуете внутренний покой и уверенность в своих интуитивных способностях. Вы легко видите скрытые аспекты жизни и чувствуете истину.
                """,
                negativeEnergyText: """
                При упадке энергии вы можете становиться замкнутым и отстранённым, что мешает вам доверять собственным чувствам и интуиции.
                """,
                adviceText: """
                Учитесь доверять своим внутренним ощущениям и не бойтесь делиться своей мудростью. Это укрепит вашу связь с окружающими и позволит вам использовать свои способности во благо.
                """
            ),

            // MARK: - 3 Arkan
            3: ArkanInfo(
                shortDescription: "3 Аркан - Императрица. Символ изобилия, заботы и творческого начала.",
                mainDescription: """
                Душа Императрицы наполнена теплом и заботой. Вам свойственно стремиться к созданию комфорта и поддержке окружающих. Обладая ярко выраженными качествами воспитателя и защитника, вы приносите гармонию и стабильность в жизни других. Вам доставляет радость проявлять заботу и делиться своим внутренним светом с теми, кто вам дорог.
                """,
                positiveEnergyText: """
                Когда ваша энергия на высоте, вы излучаете тепло и создаёте атмосферу заботы и комфорта вокруг себя. Люди тянутся к вам за поддержкой и вдохновением.
                """,
                negativeEnergyText: """
                В периоды упадка энергии вы можете становиться чрезмерно опекающим или требовательным, стремясь контролировать благополучие других.
                """,
                adviceText: """
                Позвольте другим проявлять самостоятельность, даря им поддержку, но не вмешиваясь чрезмерно. Это позволит вам сохранить внутреннюю гармонию и укрепить свои отношения.
                """
            ),

            // MARK: - 4 Arkan
            4: ArkanInfo(
                shortDescription: "4 Аркан - Император. Символ стабильности, дисциплины и упорядоченности.",
                mainDescription: """
                Душа Императора — это стремление к порядку, дисциплине и структурированности. Вам нравится организовывать и упорядочивать жизнь, создавая прочную основу для долгосрочных целей. Люди с числом Души Императора ценят стабильность и готовы прилагать усилия, чтобы достичь успеха через настойчивость и ответственность.
                """,
                positiveEnergyText: """
                Когда ваша энергия на высоте, вы проявляете дисциплину и организованность, вдохновляя других своей надёжностью и стабильностью.
                """,
                negativeEnergyText: """
                При ослаблении энергии вы можете становиться ригидным, чрезмерно привязанным к правилам и не гибким в подходе к изменениям.
                """,
                adviceText: """
                Научитесь быть более гибким, позволяя себе адаптироваться к изменениям. Это усилит вашу устойчивость и поможет сохранять гармонию в любых обстоятельствах.
                """
            ),
            
            // MARK: - 5 Arkan
            5: ArkanInfo(
                shortDescription: "5 Аркан - Иерофант. Символ духовности, мудрости и традиций.",
                mainDescription: """
                Душа Иерофанта нацелена на поиск знаний, духовное развитие и верность высоким идеалам. Люди с этим Арканом глубоко ценят традиции, но также стремятся к пониманию сути вещей. Ваша миссия — становиться проводником знаний, быть наставником для других, поддерживая их духовный путь. Вы являетесь тем, кто находит смысл даже в привычных вещах, преобразуя обыденное в нечто важное и вдохновляющее.
                """,
                
                positiveEnergyText: """
                Когда ваша энергия наполнена, вы становитесь проводником мудрости и источником вдохновения. Люди обращаются к вам за советом и находят в вашем присутствии спокойствие и уверенность.
                """,
                
                negativeEnergyText: """
                При упадке энергии вы можете становиться догматичным, чрезмерно привязанным к традициям или навязывать своё видение мира, не учитывая чужих взглядов.
                """,
                
                adviceText: """
                Учитесь принимать новые идеи и гибко подходить к своей роли наставника. Позвольте себе объединять древнюю мудрость и современные взгляды, чтобы становиться ещё более гармоничным.
                """
            ),

            // MARK: - 6 Arkan
            6: ArkanInfo(
                shortDescription: "6 Аркан - Влюблённые. Символ выбора, любви и гармонии.",
                mainDescription: """
                Душа Влюблённых связана с задачей нахождения гармонии и любви как в отношениях, так и в принятии решений. Ваша внутренняя сила помогает вам понимать и принимать других, создавать вокруг себя атмосферу тепла и поддержки. Влюблённые указывают на важность баланса в личной и социальной жизни, а также необходимость выбирать путь сердца, даже если он нелегок.
                """,
                
                positiveEnergyText: """
                В периоды силы вы окружены гармонией, ваше сердце открыто для любви, и вы способны принимать важные решения с ясностью и уверенность в своём выборе.
                """,
                
                negativeEnergyText: """
                В моменты энергетического спада вы можете сомневаться в своих решениях, чувствовать внутреннюю неуверенность или поддаваться влиянию чужих мнений.
                """,
                
                adviceText: """
                Прислушивайтесь к своему сердцу и развивайте уверенность в своих выборах. Важно найти баланс между собственной правдой и желаниями окружающих, сохраняя внутреннюю гармонию.
                """
            ),

            // MARK: - 7 Arkan
            7: ArkanInfo(
                shortDescription: "7 Аркан - Колесница. Символ движения, решимости и уверенности.",
                mainDescription: """
                Душа Колесницы направлена на достижение успеха и проявление силы воли. Вы движетесь вперёд, преодолевая препятствия, и ваша энергия позволяет вам быть лидером в любом деле. Колесница — это символ смелости, решительности и умения брать ответственность за свои решения. Вам важно уметь управлять своими эмоциями, чтобы не допустить импульсивных действий на пути к цели.
                """,
                
                positiveEnergyText: """
                Когда ваша энергия полна, вы легко добиваетесь успеха, сохраняете целеустремлённость и вдохновляете окружающих своей уверенностью и решимостью.
                """,
                
                negativeEnergyText: """
                При недостатке энергии вы можете становиться напряжённым, требовательным к результатам или воспринимать свои неудачи слишком эмоционально.
                """,
                
                adviceText: """
                Научитесь сохранять баланс между стремлением к успеху и спокойствием. Практикуйте самоконтроль и дайте себе время на отдых, чтобы поддерживать внутреннюю силу.
                """
            ),

            // MARK: - 8 Arkan
            8: ArkanInfo(
                shortDescription: "8 Аркан - Сила. Символ внутренней стойкости и мудрости.",
                mainDescription: """
                Душа под влиянием Силы обладает глубоким внутренним равновесием и способностью преодолевать трудности. Вам свойственны стойкость, умение контролировать свои эмоции и сила духа, которая вдохновляет окружающих. Люди с этим Арканом умеют сохранять спокойствие в любых ситуациях, используя свою энергию для решения важных задач и поддержания порядка в своей жизни и жизни окружающих.
                """,
                
                positiveEnergyText: """
                В периоды наполненности вы обретаете уверенность и твёрдость, проявляя терпимость и силу в трудных ситуациях. Вы становитесь надёжной опорой для других.
                """,
                
                negativeEnergyText: """
                При упадке энергии вы можете становиться раздражительным, склонным к агрессии или терять связь со своим внутренним спокойствием.
                """,
                
                adviceText: """
                Старайтесь развивать терпение и сохранять внутреннее равновесие, даже если вам хочется реагировать резко. Ваша истинная сила в способности оставаться спокойным.
                """
            ),
            
            // MARK: - 9 Arkan
            9: ArkanInfo(
                shortDescription: "9 Аркан - Отшельник. Символ мудрости, уединения и самопознания.",
                mainDescription: """
                Душа Отшельника стремится к глубокому самопознанию и поиску внутренней истины. Вам свойственна склонность к уединению, анализу и изучению смыслов жизни. Ваш путь — это путь мудреца, который ищет ответы внутри себя, а не во внешнем мире. Отшельники обладают уникальной способностью видеть суть вещей и понимать тонкие нюансы жизни, что позволяет им быть источником мудрости для окружающих.
                """,
                
                positiveEnergyText: """
                В моменты силы вы становитесь внутренне собранным и спокойным, ваша мудрость и понимание помогают вам находить ответы и быть вдохновением для других.
                """,
                
                negativeEnergyText: """
                При ослаблении энергии вы можете чувствовать себя оторванным от окружающих, становиться слишком замкнутым или уходить в глубокое одиночество.
                """,
                
                adviceText: """
                Откройтесь для общения с близкими, даже если предпочитаете уединение. Ваша мудрость станет ещё ценнее, если вы сможете делиться ею с другими.
                """
            ),

            // MARK: - 10 Arkan
            10: ArkanInfo(
                shortDescription: "10 Аркан - Колесо Фортуны. Символ перемен, судьбы и цикличности жизни.",
                mainDescription: """
                Душа, связанная с Колесом Фортуны, понимает, что жизнь — это постоянные перемены и циклы. Вам легко адаптироваться к изменениям, и вы знаете, как использовать возможности, когда они появляются. Этот путь связан с судьбой и случайностями, которые играют важную роль в вашей жизни. Ваш дар — понимать, когда нужно действовать, а когда лучше ждать, и при этом сохранять внутреннюю устойчивость.
                """,
                
                positiveEnergyText: """
                Когда вы в потоке, вы гармонично воспринимаете перемены, легко приспосабливаетесь и видите возможности там, где другие видят трудности.
                """,
                
                negativeEnergyText: """
                В моменты ослабления энергии вам может казаться, что удача отвернулась, и жизнь стала непредсказуемой, что вызывает беспокойство и тревогу.
                """,
                
                adviceText: """
                Доверьтесь жизненному потоку и примите перемены как часть своего пути. Каждый поворот Колеса Фортуны приносит уроки, которые помогут вам расти и развиваться.
                """
            ),

            // MARK: - 11 Arkan
            11: ArkanInfo(
                shortDescription: "11 Аркан - Справедливость. Символ правды, честности и равновесия.",
                mainDescription: """
                Душа Справедливости всегда ищет баланс, правду и честность во всём. Вам важно ощущать гармонию и справедливость в мире, и вы стремитесь поступать честно в отношениях с другими людьми. Ваша сила — это способность видеть истину, даже если она может быть неприятной, и стремиться к честности во всём. Вы — тот, кто защищает правду и стоит на стороне справедливости, даже когда это нелегко.
                """,
                
                positiveEnergyText: """
                В периоды внутренней силы вы проявляете объективность, умеете принимать взвешенные решения и защищать тех, кто нуждается в помощи.
                """,
                
                negativeEnergyText: """
                При недостатке энергии вам может стать трудно сохранять объективность, и вы склонны к резкости в суждениях или чрезмерной критичности.
                """,
                
                adviceText: """
                Развивайте способность слушать других и стремитесь к гармонии в своих поступках. Справедливость — это не только правда, но и способность понять и принять других.
                """
            ),

            // MARK: - 12 Arkan
            12: ArkanInfo(
                shortDescription: "12 Аркан - Повешенный. Символ принятия, самопожертвования и мудрости.",
                mainDescription: """
                Душа Повешенного нацелена на осознание истинного смысла через самопожертвование и принятие. Вы способны видеть мир под новым углом, находить мудрость в сложных ситуациях и преодолевать трудности через смирение. Путь Повешенного учит, что иногда нужно подождать и позволить событиям развиваться, доверяя высшему замыслу. Ваш дар — понимать, когда нужно действовать, а когда лучше просто наблюдать.
                """,
                
                positiveEnergyText: """
                Когда вы в гармонии, вы ощущаете спокойствие и внутреннее принятие, позволяя жизни идти своим чередом и находя смысл даже в трудных ситуациях.
                """,
                
                negativeEnergyText: """
                При недостатке энергии вы можете чувствовать себя жертвой обстоятельств, становиться пассивным или не видеть выхода из сложных ситуаций.
                """,
                
                adviceText: """
                Оставьте попытки контролировать всё вокруг и позвольте жизни течь свободно. Внутренний покой придёт, когда вы примете то, что происходит.
                """
            ),
            
            // MARK: - 13 Arkan
            13: ArkanInfo(
                shortDescription: "13 Аркан - Смерть. Символ трансформации, завершения и возрождения.",
                mainDescription: """
                Душа под влиянием 13 Аркана принимает изменения и видит их не как конец, а как возможность для возрождения. Путь Смерти — это путь глубоких трансформаций, прощания со старыми паттернами и создания нового начала. Вы обладаете способностью завершать устаревшее и освобождать место для новых возможностей. Этот путь учит смелости принимать неизбежное и находить силу в переменах, видя в каждом завершении шанс для нового начала.
                """,
                
                positiveEnergyText: """
                Когда вы в согласии с собой, вы легко отпускаете старое, чувствуя внутреннюю свободу и готовность к новому. Вы открыты для изменений и воспринимаете их как естественную часть жизни.
                """,
                
                negativeEnergyText: """
                При ослаблении энергии вам может быть трудно принять перемены, что приводит к цеплянию за прошлое и страху перед неизвестностью.
                """,
                
                adviceText: """
                Постарайтесь увидеть в каждом завершении шанс для обновления. Доверьтесь процессу трансформации и позвольте себе идти вперёд, оставляя старые ограничения позади.
                """
            ),

            // MARK: - 14 Arkan
            14: ArkanInfo(
                shortDescription: "14 Аркан - Умеренность. Символ баланса, гармонии и терпения.",
                mainDescription: """
                Душа Умеренности стремится к гармонии и внутреннему равновесию. Ваш путь заключается в нахождении золотой середины, избегая крайностей и поддерживая спокойствие даже в сложных ситуациях. Вы обладаете способностью находить баланс между желаниями и возможностями, контролировать свои эмоции и создавать вокруг себя атмосферу мира и спокойствия. Умеренность учит, что истинное счастье — это умение жить в согласии с собой и миром, не впадая в излишества.
                """,
                
                positiveEnergyText: """
                В моменты внутренней силы вы проявляете спокойствие и способность уравновешивать эмоции. Ваша энергия умиротворяет окружающих, и вы легко решаете задачи, не выходя за рамки гармонии.
                """,
                
                negativeEnergyText: """
                При недостатке энергии вы можете ощущать нестабильность и излишнюю раздражительность, теряя внутренний баланс и становясь склонным к крайностям.
                """,
                
                adviceText: """
                Сосредоточьтесь на уравновешивании своих желаний и возможностей, избегайте излишеств и стремитесь к гармонии в каждом действии. Ваша сила — в способности сохранять мир и равновесие.
                """
            ),

            // MARK: - 15 Arkan
            15: ArkanInfo(
                shortDescription: "15 Аркан - Дьявол. Символ искушения, силы и страсти.",
                mainDescription: """
                Душа под влиянием Дьявола сталкивается с вызовами, искушениями и страстями, требующими осознания своей истинной природы. Ваш путь — исследовать свои внутренние тени и научиться использовать свою силу для созидания, а не разрушения. Дьявол учит управлять желаниями и находить контроль над своими страстями, превращая их в источник энергии и вдохновения. Это путь силы, который требует честности с самим собой и умения идти на глубинные уровни собственной сущности.
                """,
                
                positiveEnergyText: """
                Когда вы сильны, вы контролируете свои страсти и желания, направляя их на созидание и достижение целей. Ваша энергия привлекает окружающих и помогает вам реализовать задуманные планы.
                """,
                
                negativeEnergyText: """
                При недостатке энергии вы можете стать пленником собственных желаний, теряя контроль и позволяя искушениям управлять вашими поступками.
                """,
                
                adviceText: """
                Научитесь видеть в своих страстях источник силы, а не зависимости. Работайте над самоосознанием, чтобы использовать свою энергию с максимальной пользой для себя и других.
                """
            ),

            // MARK: - 16 Arkan
            16: ArkanInfo(
                shortDescription: "16 Аркан - Башня. Символ разрушения, прозрения и освобождения.",
                mainDescription: """
                Душа Башни сталкивается с необходимостью разрушать старые структуры и убеждения, которые больше не служат росту. Ваш путь заключается в освобождении от иллюзий и создании новой, более устойчивой основы. Башня учит принимать перемены, даже если они приносят боль, ведь за ними скрывается истина. Это путь, где разрушение старого открывает путь к новому, более прочному фундаменту, позволяя вам строить жизнь, основанную на подлинности.
                """,
                
                positiveEnergyText: """
                В периоды внутренней силы вы легко принимаете разрушение старых убеждений, ощущая освобождение и пространство для нового роста. Вы способны видеть истину за иллюзиями и строить свою жизнь на прочном фундаменте.
                """,
                
                negativeEnergyText: """
                При недостатке энергии вы можете сопротивляться переменам, ощущая страх перед разрушением и боясь отпустить то, что уже не приносит пользы.
                """,
                
                adviceText: """
                Позвольте старым структурам уйти, чтобы создать место для нового. Примите перемены как часть вашего роста и доверяйте процессу, зная, что за разрушением приходит новая жизнь.
                """
            ),
            
            // MARK: - 17 Arkan
            17: ArkanInfo(
                shortDescription: "17 Аркан - Звезда. Символ надежды, вдохновения и духовного пути.",
                mainDescription: """
                Душа Звезды ищет вдохновение, связь с высшими идеалами и истинное понимание своего предназначения. Этот путь — о вере в лучшее и стремлении к внутренней гармонии. Люди с этим Арканом обладают мощной интуицией и внутренним светом, который направляет их на правильный путь. Звезда учит видеть красоту и смысл в каждом моменте, находя баланс между духовным и материальным.
                """,
                
                positiveEnergyText: """
                Когда ваша энергия изобильна, вы наполняетесь вдохновением и дарите окружающим веру в лучшее. Ваша интуиция становится проводником, и вы ощущаете связь с чем-то великим и значимым.
                """,
                
                negativeEnergyText: """
                При недостатке энергии вы можете терять веру в себя, ощущая сомнения и страх перед будущим, что мешает вам действовать.
                """,
                
                adviceText: """
                Откройтесь своему внутреннему свету и верьте в своё предназначение. Пусть ваша интуиция ведёт вас, и вы обретёте гармонию и ясность на своём пути.
                """
            ),

            // MARK: - 18 Arkan
            18: ArkanInfo(
                shortDescription: "18 Аркан - Луна. Символ подсознания, тайн и интуиции.",
                mainDescription: """
                Душа Луны стремится познать скрытые грани своей сущности, погружаясь в мир снов и тайн. Этот путь — об осознании своих глубинных чувств и интуитивных знаний. Луна показывает, что внутри нас всегда есть ответы на самые сокровенные вопросы. Этот Аркан также учит осторожности, предостерегая от иллюзий и обмана. Путь Луны — это путь обретения внутренней ясности через принятие своих теневых сторон.
                """,
                
                positiveEnergyText: """
                В моменты силы вы чувствуете связь с интуицией и глубинами подсознания, видите вещи такими, какие они есть, и понимаете скрытые смыслы.
                """,
                
                negativeEnergyText: """
                В моменты упадка энергии вы можете ощущать тревогу, замешательство и склонность к самообману, теряя ясность и уверенность.
                """,
                
                adviceText: """
                Доверьтесь своему внутреннему голосу и избегайте иллюзий. Примите свои страхи и внутренние противоречия, чтобы обрести истинное понимание и покой.
                """
            ),

            // MARK: - 19 Arkan
            19: ArkanInfo(
                shortDescription: "19 Аркан - Солнце. Символ радости, успеха и раскрытия потенциала.",
                mainDescription: """
                Душа Солнца стремится к самовыражению, счастью и успеху. Этот путь учит наслаждаться жизнью, делиться своим светом с окружающими и находить радость в каждом моменте. Люди с этим Арканом часто обладают харизмой и жизненной силой, которая вдохновляет других. Солнце указывает на умение раскрывать свой потенциал и использовать его во благо себе и миру.
                """,
                
                positiveEnergyText: """
                Когда вы на пике, вы ощущаете радость, свет и уверенность, дарите окружающим тепло и позитив, вдохновляя их своим примером.
                """,
                
                negativeEnergyText: """
                При упадке энергии вы можете ощущать потерю мотивации и уверенности, избегать самовыражения и замыкаться в себе.
                """,
                
                adviceText: """
                Стремитесь проявлять свою истинную сущность, делитесь теплом и радостью с другими. Найдите своё место под солнцем, и оно будет сиять для вас.
                """
            ),

            // MARK: - 20 Arkan
            20: ArkanInfo(
                shortDescription: "20 Аркан - Суд. Символ осознания, прощения и возрождения.",
                mainDescription: """
                Душа под влиянием Суда ищет понимание и прощение, готова освободиться от прошлого и перейти на новый уровень. Этот путь — об осознании своих ошибок и умении прощать как себя, так и других. Суд помогает завершить старые циклы и начать новый этап с чистой совестью и ясным сознанием. Люди, идущие этим путём, обладают мудростью и стремлением к духовному росту.
                """,
                
                positiveEnergyText: """
                Когда вы сильны, вы способны простить и отпустить, осознавая свою ценность и мудрость, готовность двигаться вперёд без груза прошлого.
                """,
                
                negativeEnergyText: """
                При недостатке энергии вы можете цепляться за старые обиды, затрудняя процесс прощения и мешая своему духовному росту.
                """,
                
                adviceText: """
                Учитесь отпускать прошлое и находить силы в настоящем. Прощение — ваш путь к свободе и новым возможностям.
                """
            ),
            
            // MARK: - 21 Arkan
            21: ArkanInfo(
                shortDescription: "21 Аркан - Мир. Символ гармонии, завершения и целостности.",
                mainDescription: """
                Душа под влиянием Мира стремится к достижению целостности и гармонии со всем сущим. Этот путь — о понимании своего места в мире и обретении внутреннего покоя. Люди с этим Арканом обычно приходят к осознанию, что все аспекты их жизни связаны и что каждый опыт ведёт к личному росту. Мир учит принимать свою уникальность, объединяя прошлое, настоящее и будущее в единую картину.
                """,
                
                positiveEnergyText: """
                В моменты силы вы чувствуете себя целостным и завершённым, воспринимаете жизнь с мудростью и покоем, ощущаете связь со всем миром.
                """,
                
                negativeEnergyText: """
                При ослаблении энергии вы можете чувствовать разобщённость, потерю смысла и гармонии, что ведёт к внутреннему беспокойству.
                """,
                
                adviceText: """
                Стремитесь к внутреннему покою и единству. Примите все стороны своей личности и позвольте гармонии проявиться во всём, что вы делаете.
                """
            ),

            // MARK: - 22 Arkan
            22: ArkanInfo(
                shortDescription: "22 Аркан - Шут. Символ свободы, спонтанности и новых начинаний.",
                mainDescription: """
                Душа Шута открыта для новых возможностей, внезапных поворотов и жизненных сюрпризов. Этот путь — о принятии непредсказуемости и легкости бытия. Шут учит не бояться изменений и смотреть на мир с детским любопытством. Люди под влиянием этого Аркана обладают гибкостью и готовностью принимать любые обстоятельства. Этот Аркан напоминает, что каждый конец — это новый шанс, а каждая ошибка — это возможность учиться и расти.
                """,
                
                positiveEnergyText: """
                Когда ваша энергия на пике, вы ощущаете лёгкость и свободу, готовы к любым переменам и смотрите на мир с интересом и радостью.
                """,
                
                negativeEnergyText: """
                При недостатке энергии вы можете чувствовать себя потерянным или нестабильным, боясь совершить ошибку и теряя внутреннее равновесие.
                """,
                
                adviceText: """
                Откройтесь миру и доверьтесь своему пути. Позвольте себе быть гибким и восприимчивым к переменам — это путь к новым открытиям и возможностям.
                """
            )
        ]
    )
}
