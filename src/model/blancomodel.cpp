#include "blancomodel.h"
#include <QCoreApplication>
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>
#include <QVariantList>
#include <QVariantMap>

BlancoModel::BlancoModel(GameModel *parent)
    : GameModel{parent}
{}

void BlancoModel::init(QString path)
{
    QFile file(path);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qDebug() << "Failed to open the file:" << path;
        return;
    }

    QByteArray jsonData = file.readAll();
    file.close();

    QJsonDocument document = QJsonDocument::fromJson(jsonData);
    if (document.isNull()) {
        qDebug() << "Failed to create JSON doc.";
        return;
    }
    if (!document.isObject()) {
        qDebug() << "JSON is not an object.";
        return;
    }

    QJsonObject jsonObject = document.object();

    mName = jsonObject["name"].toString();
    mAnimal = jsonObject["animal"].toString();
    mType = jsonObject["type"].toString();
    mDifficulty = jsonObject["difficulty"].toInt();
    mEstimatedTime = jsonObject["estimatedTime"].toInt();
    mMinPeople = jsonObject["minPeople"].toInt();
    mMaxPeople = jsonObject["maxPeople"].toInt();
    QJsonArray description = jsonObject["description"].toArray();

    QVariantMap pair;
    for (const auto& item : description) {
        QJsonArray jsonPair = item.toArray();
        QString text = jsonPair.at(0).toString();
        QString image = jsonPair.at(1).toString();
        pair.insert("first", text);
        pair.insert("second", image);
        mDescription.append(pair);
    }
}

QStringList BlancoModel::players()
{
    return mPlayers;
}

void BlancoModel::setPlayers(const QStringList &newPlayers)
{
    if (mPlayers == newPlayers)
        return;
    mPlayers = newPlayers;
    emit playersChanged();
}

QString BlancoModel::blancoState() const
{
    return mBlancoState;
}

void BlancoModel::setBlancoState(const QString &newBlancoState)
{
    if (mBlancoState == newBlancoState)
        return;
    mBlancoState = newBlancoState;
    emit blancoStateChanged();
}

QString BlancoModel::nextButtonTextValue() const
{
    return mNextButtonTextValue;
}

void BlancoModel::setNextButtonTextValue(const QString &newNextButtonTextValue)
{
    if (mNextButtonTextValue == newNextButtonTextValue)
        return;
    mNextButtonTextValue = newNextButtonTextValue;
    emit nextButtonTextValueChanged();
}

QColor BlancoModel::nextButtonColor() const
{
    return mNextButtonColor;
}

void BlancoModel::setNextButtonColor(const QColor &newNextButtonColor)
{
    if (mNextButtonColor == newNextButtonColor)
        return;
    mNextButtonColor = newNextButtonColor;
    emit nextButtonColorChanged();
}

QString BlancoModel::wordAssignState() const
{
    return mWordAssignState;
}

void BlancoModel::setWordAssignState(const QString &newWordAssignState)
{
    if (mWordAssignState == newWordAssignState)
        return;
    mWordAssignState = newWordAssignState;
    emit wordAssignStateChanged();
}

int BlancoModel::wordAndPlayerIt() const
{
    return mWordAndPlayerIt;
}

void BlancoModel::setWordAndPlayerIt(int newWordAndPlayerIt)
{
    if (mWordAndPlayerIt == newWordAndPlayerIt)
        return;
    mWordAndPlayerIt = newWordAndPlayerIt;
    emit wordAndPlayerItChanged();
}

QStringList BlancoModel::wordList() const
{
    return mWordList;
}

void BlancoModel::setWordList(const QStringList &newWordList)
{
    if (mWordList == newWordList)
        return;
    mWordList = newWordList;
    emit wordListChanged();
}

QString BlancoModel::wordCallingState() const
{
    return mWordCallingState;
}

void BlancoModel::setWordCallingState(const QString &newWordCallingState)
{
    if (mWordCallingState == newWordCallingState)
        return;
    mWordCallingState = newWordCallingState;
    emit wordCallingStateChanged();
}

QString BlancoModel::debateState() const
{
    return mDebateState;
}

void BlancoModel::setDebateState(const QString &newDebateState)
{
    if (mDebateState == newDebateState)
        return;
    mDebateState = newDebateState;
    emit debateStateChanged();
}
