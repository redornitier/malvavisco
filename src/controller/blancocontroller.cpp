#include "blancocontroller.h"
#include <QSqlDatabase>
#include <QDir>
#include <QSqlQuery>
#include <QRandomGenerator>
#include <QStandardPaths>
#include <QtMath>
#include <algorithm>
#include <random>
#include "../model/blancomodel.h"

BlancoController::BlancoController(QObject *parent)
    : QObject{parent}
{

}

void BlancoController::calculateWord()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName("localhost");
    QFile file(":/db/palabras.sqlite");
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
        wordsDbPath.append("palabras.db");
        file.copy(wordsDbPath) ;
        QFile::setPermissions(wordsDbPath ,QFile::WriteOwner | QFile::ReadOwner) ;
    } else qDebug() << "the file does not exist" ;

    db.setDatabaseName(wordsDbPath);
    qDebug() << "DB OPEN:" << db.open();

    QSqlQuery query("SELECT palabra FROM palabras WHERE palabra_id = ?", db);
    query.bindValue(0, QRandomGenerator::global()->bounded(1, 55092));
    query.exec();
    query.first();
    mCurrentWord = query.value(0).toString();
}

void BlancoController::distributePlayers()
{/*
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
    qDebug()<<"blanco players " << blancoPlayers;*/
}

void BlancoController::shufflePlayers()
{/*
    shuffledPlayers = players;

    std::random_device rd;
    std::mt19937 g(rd());
    std::shuffle(shuffledPlayers.begin(), shuffledPlayers.end(), g);
    qDebug()<<"shuffled players " << shuffledPlayers;*/
}

void BlancoController::calculateCurrentPlayerAndWord()
{/*
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

    currentIndex++;*/
}

void BlancoController::setModel(BlancoModel *blancoModel)
{
    mBlancoModel = blancoModel;
}

void BlancoController::nextButtonClick()
{
    this->changeBlancoState();
    this->checkButtonAppearance();
}

void BlancoController::changePlayerNameByIndex(int index, QString value)
{
    mTemporalPlayers.replace(index, value);
}

void BlancoController::removePlayerByIndex(int index)
{
    mTemporalPlayers.removeAt(index);
}

void BlancoController::addPlayerIndex()
{
    mTemporalPlayers.append("");
}

void BlancoController::changeBlancoState()
{
    if(mBlancoModel->blancoState() == "AddPlayers"){
        mBlancoModel->setPlayers(mTemporalPlayers);
        this->calculateWord();
        this->createWordList();
        mBlancoModel->setBlancoState("Settings");
    }else if(mBlancoModel->blancoState() == "Settings")
        mBlancoModel->setBlancoState("WordAssign");
    else if(mBlancoModel->blancoState() == "WordAssign"){
        if(mBlancoModel->wordAssignState() == "player"){
            mBlancoModel->setWordAssignState("word");
        }else if(mBlancoModel->wordAssignState() == "word"){
            if(mBlancoModel->wordAndPlayerIt() == mBlancoModel->players().length()-1){
                mBlancoModel->setBlancoState("WordCalling");
            }else{
                mBlancoModel->setWordAssignState("player");
                mBlancoModel->setWordAndPlayerIt(mBlancoModel->wordAndPlayerIt()+1);
            }
        }
    }else if(mBlancoModel->blancoState() == "WordCalling"){
        if(mBlancoModel->wordCallingState() == "preparation")
            mBlancoModel->setWordCallingState("calling");
        else if(mBlancoModel->wordCallingState() == "calling")
            mBlancoModel->setBlancoState("Debate");
    }else if(mBlancoModel->blancoState() == "Debate"){
        if(mBlancoModel->wordCallingState() == "preparation")
            mBlancoModel->setWordCallingState("calling");
        else if(mBlancoModel->wordCallingState() == "calling")
            mBlancoModel->setBlancoState("End");
    }
}

void BlancoController::checkButtonAppearance()
{
    if(mBlancoModel->blancoState() == "AddPlayers"){
        mBlancoModel->setNextButtonColor(0x6E75CB);
        mBlancoModel->setNextButtonTextValue("Siguiente");
    }else if(mBlancoModel->blancoState() == "Settings"){
        mBlancoModel->setNextButtonColor(0x6E75CB);
        mBlancoModel->setNextButtonTextValue("Siguiente");
    }else if(mBlancoModel->blancoState() == "WordAssign"){
        if(mBlancoModel->wordAssignState() == "player"){
            mBlancoModel->setNextButtonColor(0xFF83A1);
            mBlancoModel->setNextButtonTextValue("I'm alone");
        }else if(mBlancoModel->wordAssignState() == "word"){
            mBlancoModel->setNextButtonColor(0x6E75CB);
            mBlancoModel->setNextButtonTextValue("Siguiente");
        }
    }
}

void BlancoController::createWordList()
{
    for (int i = 0; i < mBlancoModel->players().length()-1; ++i)
        mTemporalWordList.append(mCurrentWord);

    int randomIndex = QRandomGenerator::global()->bounded(mBlancoModel->players().length()-1);
    mTemporalWordList[randomIndex] = "Blanco";

    mBlancoModel->setWordList(mTemporalWordList);
}
