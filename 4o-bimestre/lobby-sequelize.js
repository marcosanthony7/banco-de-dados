// npm install mysql2 sequelize

const { Sequelize, DataTypes } = require('sequelize');

// Configuração da conexão com o banco de dados
const sequelize = new Sequelize(
    'lobby',
    'root',
    '123456',
    {
        host: 'localhost',
        dialect: 'mysql',
    }
);

// Definição do modelo Usuario
const Usuario = sequelize.define('Usuario', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    nome_usuario: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING,
        unique: true,
    },
    senha: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    nome_exibido: DataTypes.STRING,
    foto: DataTypes.STRING,
    banner: DataTypes.STRING,
    descricao: DataTypes.STRING,
    titulo: DataTypes.STRING,
    avaliacao: DataTypes.INTEGER,
});

// Definição do modelo Participante
const Participante = sequelize.define('Participante', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
});

// Definição do modelo AdministradorGrupo
const AdministradorGrupo = sequelize.define('AdministradorGrupo', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
});

// Definição do modelo Comunidade
const Comunidade = sequelize.define('Comunidade', {
    codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    nome: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    foto: DataTypes.STRING,
    banner: DataTypes.STRING,
    descricao: DataTypes.STRING,
});

// Definição do modelo ParticipanteComunidade
const ParticipanteComunidade = sequelize.define('ParticipanteComunidade', {});

// Definição do modelo Grupo
const Grupo = sequelize.define('Grupo', {
    codigo: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    nome: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    foto: DataTypes.STRING,
    banner: DataTypes.STRING,
    descricao: DataTypes.STRING,
});

// Definição do modelo ParticipanteGrupo
const ParticipanteGrupo = sequelize.define('ParticipanteGrupo', {});

// Definição do modelo Amigos
const Amigos = sequelize.define('Amigos', {});

// Definição do modelo Mensagens
const Mensagens = sequelize.define('Mensagens', {
    mensagem: DataTypes.STRING,
});

// Definição do modelo Postagens
const Postagens = sequelize.define('Postagens', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    foto: DataTypes.STRING,
    link_video: DataTypes.STRING,
    descricao: DataTypes.STRING,
    likes: DataTypes.INTEGER,
});

// Definição do modelo Comentarios
const Comentarios = sequelize.define('Comentarios', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    comentario: DataTypes.STRING,
});

// Definição do modelo SalaJogo
const SalaJogo = sequelize.define('SalaJogo', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    horario: {
        type: DataTypes.DATE,
        allowNull: false,
    },
    nome_jogo: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    quant_jogadores: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    quant_disponivel: DataTypes.INTEGER,
});

// Definição do modelo CanalVoz
const CanalVoz = sequelize.define('CanalVoz', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    nome: {
        type: DataTypes.STRING,
        allowNull: false,
    },
});

// Definição do modelo Notificacao
const Notificacao = sequelize.define('Notificacao', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    tipo: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
});

// Definição dos relacionamentos
Usuario.hasOne(Participante);
Usuario.hasOne(AdministradorGrupo);

Participante.belongsTo(Usuario);
AdministradorGrupo.belongsTo(Usuario);

Comunidade.hasMany(ParticipanteComunidade);
ParticipanteComunidade.belongsTo(Comunidade);

Grupo.belongsTo(AdministradorGrupo);
Grupo.belongsTo(Comunidade);
Participante.hasMany(ParticipanteGrupo);
ParticipanteGrupo.belongsTo(Participante);
ParticipanteGrupo.belongsTo(Grupo);

Usuario.belongsToMany(Usuario, { through: Amigos, as: 'Amigo' });
Amigos.belongsTo(Usuario, { as: 'Usuario1' });
Amigos.belongsTo(Usuario, { as: 'Usuario2' });

Usuario.belongsToMany(Usuario, { through: Mensagens, as: 'Destinatario', foreignKey: 'FK_id_destino' });
Usuario.belongsToMany(Usuario, { through: Mensagens, as: 'Origem', foreignKey: 'FK_id_origem' });

Usuario.hasMany(Postagens);
Postagens.belongsTo(Usuario);

Postagens.hasMany(Comentarios);
Comentarios.belongsTo(Postagens);
Usuario.hasMany(Comentarios);
Comentarios.belongsTo(Usuario);

SalaJogo.hasMany(Participante);
Participante.belongsTo(SalaJogo);

Grupo.hasMany(CanalVoz);
CanalVoz.belongsTo(Grupo);

Usuario.hasMany(Notificacao);
Notificacao.belongsTo(Usuario);

// Sincronizando os modelos com o banco de dados
sequelize.sync({ force: true }).then(async () => {

    // Fechando a conexão com o banco de dados
    await sequelize.close();
});