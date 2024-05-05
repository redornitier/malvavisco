#include "blancocontroller.h"
#include <QSqlDatabase>
#include <QDir>
#include <QSqlQuery>
#include <QRandomGenerator>
#include <QStandardPaths>
#include <QtMath>
#include <algorithm>
#include <random>

BlancoController::BlancoController(QObject *parent)
    : QObject{parent}
{

}

void BlancoController::calculateWord()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("localhost");
    QFile file(":/palabras.sqlite");
    QString wordsDbPath;
    if (file.exists()) {
        wordsDbPath = QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation);
        QDir auxPath(wordsDbPath);
        if(!auxPath.exists()) {
            QDir dir;
            dir.mkdir(wordsDbPath);
        }
        if (wordsDbPath.isEmpty()) {
            qDebug() << "Could not obtain writable location.";
            return;
        }
        wordsDbPath.append("/db/palabras.db");
        file.copy(wordsDbPath) ;
        QFile::setPermissions(wordsDbPath ,QFile::WriteOwner | QFile::ReadOwner) ;
    } else qDebug() << "the file does not exist" ;

    db.setDatabaseName(wordsDbPath);
    db.open();

    QSqlQuery query("SELECT palabra FROM palabras WHERE palabra_id = ?", db);
    query.bindValue(0, QRandomGenerator::global()->bounded(1, 55092));
    query.exec();
    query.first();
    currentWord = query.value(0).toString();
}

void BlancoController::distributePlayers()
{
    QList<QString> playersAux{players};
    blancoPlayers.clear();
    wordPlayers.clear();
    int numberOfPlayers = players.size();

    while (blancoPlayers.size() < numberOfBlancoPlayers){
        int blancoIndex = QRandomGenerator::global()->bounded(0, numberOfBlancoPlayers);
        blancoPlayers.append(playersAux.takeAt(blancoIndex));
    }

    wordPlayers = playersAux;

    qDebug()<<"word players " << wordPlayers;
    qDebug()<<"blanco players " << blancoPlayers;
}

void BlancoController::shufflePlayers()
{
    shuffledPlayers = players;

    std::random_device rd;
    std::mt19937 g(rd());
    std::shuffle(shuffledPlayers.begin(), shuffledPlayers.end(), g);
    qDebug()<<"shuffled players " << shuffledPlayers;
}

void BlancoController::calculateCurrentPlayerAndWord()
{
    if(currentIndex >= shuffledPlayers.size()){
//        root.ended = true
        return;
    }

    this->setCurrentPlayer(shuffledPlayers.at(currentIndex));

    // calcular palabra que aplica a current player
    this->setCurrentPlayerWord("");
    if (blancoPlayers.contains(currentPlayer) && !wordPlayers.contains(currentPlayer)) // si existe solo en blanco players
        this->setCurrentPlayerWord("blanco");
    else if(!blancoPlayers.contains(currentPlayer) && wordPlayers.contains(currentPlayer)) // si existe solo en word players
        this->setCurrentPlayerWord(currentWord);
    else
        qDebug()<<("problemas");

    qDebug()<<"Current player " << currentPlayer << " with word " << currentPlayerWord;

    currentIndex++;
}

void BlancoController::setPlayers(const QList<QString> &newPlayers)
{
    qDebug()<<"players " << newPlayers;
    if (players == newPlayers)
        return;
    players = newPlayers;
    emit playersChanged();
}

QString BlancoController::getCurrentPlayerWord() const
{
    return currentPlayerWord;
}

void BlancoController::setCurrentPlayerWord(const QString &newCurrentPlayerWord)
{
    if (currentPlayerWord == newCurrentPlayerWord)
        return;
    currentPlayerWord = newCurrentPlayerWord;
    emit currentPlayerWordChanged();
}

QString BlancoController::getCurrentPlayer() const
{
    return currentPlayer;
}

void BlancoController::setCurrentPlayer(const QString &newCurrentPlayer)
{
    if (currentPlayer == newCurrentPlayer)
        return;
    currentPlayer = newCurrentPlayer;
    emit currentPlayerChanged();
}

QString BlancoController::getGameName() const
{
    return gameName;
}

void BlancoController::setGameName(const QString &newGameName)
{
    if (gameName == newGameName)
        return;
    gameName = newGameName;
    emit gameNameChanged();
}

QString BlancoController::getGameSimpleDescription() const
{
    return gameSimpleDescription;
}

void BlancoController::setGameSimpleDescription(const QString &newGameSimpleDescription)
{
    if (gameSimpleDescription == newGameSimpleDescription)
        return;
    gameSimpleDescription = newGameSimpleDescription;
    emit gameSimpleDescriptionChanged();
}

QString BlancoController::getGameDetailedDescription() const
{
    return gameDetailedDescription;
}

void BlancoController::setGameDetailedDescription(const QString &newGameDetailedDescription)
{
    if (gameDetailedDescription == newGameDetailedDescription)
        return;
    gameDetailedDescription = newGameDetailedDescription;
    emit gameDetailedDescriptionChanged();
}

uchar BlancoController::getGameMinPlayers() const
{
    return gameMinPlayers;
}

void BlancoController::setGameMinPlayers(uchar newGameMinPlayers)
{
    if (gameMinPlayers == newGameMinPlayers)
        return;
    gameMinPlayers = newGameMinPlayers;
    emit gameMinPlayersChanged();
}

uchar BlancoController::getGameMaxPlayers() const
{
    return gameMaxPlayers;
}

void BlancoController::setGameMaxPlayers(uchar newGameMaxPlayers)
{
    if (gameMaxPlayers == newGameMaxPlayers)
        return;
    gameMaxPlayers = newGameMaxPlayers;
    emit gameMaxPlayersChanged();
}

uchar BlancoController::getGameEstimatedDuration() const
{
    return gameEstimatedDuration;
}

void BlancoController::setGameEstimatedDuration(uchar newGameEstimatedDuration)
{
    if (gameEstimatedDuration == newGameEstimatedDuration)
        return;
    gameEstimatedDuration = newGameEstimatedDuration;
    emit gameEstimatedDurationChanged();
}

void BlancoController::setModel(BlancoModel *blancoModel)
{
    mBlancoModel = blancoModel;
}
