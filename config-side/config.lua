Config = {}

Config.Blips = {
    -- {x = -1837.39, y = 789.91, z = 138.66}
    {vector3(-1837.39, 789.91, 138.66), job = "police"},
    {vector3(-225.15, -1339.07, 31.3), job = "bennys"}, 
    {vector3(974.27, 1608.44, 208.14), gang = "vermelho"},
    {vector3(3163.68, 5252.65, 30.25), gang = "azul"}
}

Config.TempoDeColeta = 5000 --  tempo para a barra de progresso concluír

Config.Dificuldades = {
    facil = {
        chancePolicia = 0,
        itens = { 'plastic', 'metalscrap' },
        itensPerigosos = {}
    },
    normal = {
        chancePolicia = 30,
        itens = { 'plastic', 'lockpick' },
        itensPerigosos = { 'lockpick' }
    },
    dificil = {
        chancePolicia = 100,
        itens = { 'c4', 'weapon_pistol' },
        itensPerigosos = { 'c4', 'weapon_pistol' }
    }
}

Config.LocaisFixos = {
    facil = {
        vector3(215.76, -810.12, 29.73),
        vector3(243.65, -810.01, 30.37),
        vector3(268.93, -823.62, 30.57)
    },
    normal = {
        vector3(-43.45, -1749.55, 29.42),
        vector3(-93.26, -1752.28, 29.43)
    },
    dificil = {
        vector3(1025.88, -2511.37, 28.45),
        vector3(895.51, -180.41, 74.7)
    }
}



Config.Rota = {

    Lista = {       
        [1] = {
            job = "police",

            itens = {       
                {item = 'plastic', count = {1, 3} },
                {item = 'metalscrap', count = {1, 3}},                         
            },

        
            locais = {
                vector3(-1788.18, 814.52, 138.5),
                vector3(-1824.31, 806.1, 138.86) 
            }

        },
        [2] = {
            job = "bennys",
            itens = {

                {item = 'plastic', count = {1, 3}},
                {item = 'metalscrap', count = {1, 3}},  
        
            },
            locais = {
                vector3(-247.64, -1332.53, 31.27),
                vector3(-247.64, -1321.64, 31.27)
            }

        },
        [3] = {
            job = "vermelho", 
            itens = {

                {item = 'plastic', count = {1, 3}},
                {item = 'metalscrap', count = {1, 3}},  
        
            },
            locais = {
                vector3(436.11, 214.64, 103.17),
                vector3(1.25, -436.87, 39.74),
                vector3(-766.38, -916.63, 21.3),
                vector3(-559.51, -1804.21, 22.61),
                vector3(-58.22, -2244.42, 8.96),
                vector3(257.5, -1723.57, 29.65),
                vector3(-64.57, -1449.29, 32.52),
                vector3(427.82, -1515.37, 29.29),
                vector3(223.29, -175.99, 57.92),
                vector3(-1350.18, -635.82, 27.8),
                vector3(-1156.57, -1370.28, 5.07),
                vector3(-3114.82, 304.16, 8.38)
            }

        },
        [4] = {
            job = "azul", 
            itens = {

                {item = 'plastic', count = {1, 3}},
                {item = 'metalscrap', count = {1, 3}},  
        
            },
            locais = {
                vector3(2570.84, 4667.93, 34.08),
                vector3(1673.15, 4958.03, 42.34),
                vector3(749.95, 4184.36, 41.09),
                vector3(-20.73, 3030.04, 41.69),
                vector3(732.47, 2523.76, 73.37),
                vector3(2200.57, 3318.05, 47.05),
                vector3(1668.04, 3744.11, 35.0),

            }

        },
        [5] = {
            job = "azul", 
            itens = {

                {item = 'plastic', count = {1, 3}},
                {item = 'metalscrap', count = {1, 3}},  
        
            },
            locais = {
                vector3(2570.84, 4667.93, 34.08),
                vector3(1673.15, 4958.03, 42.34),
                vector3(749.95, 4184.36, 41.09),
                vector3(-20.73, 3030.04, 41.69),
                vector3(732.47, 2523.76, 73.37),
                vector3(2200.57, 3318.05, 47.05),
                vector3(1668.04, 3744.11, 35.0),

            }

        }
    }
}

Config.MensagemEntradaServico = "Você entrou em serviço"
